<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaksi;
use App\Models\DetailTransaksi;
use App\Models\SatuanProduk;
use App\Models\PergerakanStok;
use App\Exports\TransaksiExport;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class TransaksiController extends Controller
{
    public function index()
    {
        $transaksi = Transaksi::latest()->get();

        $livePenjualan = DB::table('detail_transaksi')
            ->join('satuan_produk', 'detail_transaksi.id_satuan', '=', 'satuan_produk.id_satuan')
            ->join('produk', 'satuan_produk.id_produk', '=', 'produk.id_produk')
            ->select(
                'produk.kode_produk',
                'produk.nama_produk',
                'satuan_produk.nama_satuan as satuan_jual',
                DB::raw('SUM(detail_transaksi.kuantiti) as total_qty_terjual'),
                DB::raw('SUM(detail_transaksi.subtotal) as total_omset'),
                DB::raw('SUM(detail_transaksi.keuntungan) as total_keuntungan')
            )
            ->groupBy('produk.id_produk', 'produk.kode_produk', 'produk.nama_produk', 'satuan_produk.nama_satuan')
            ->get()
            ->map(function ($item) {
                return [
                    'kode_produk'     => $item->kode_produk,
                    'nama_produk'     => $item->nama_produk,
                    'satuan_jual'     => $item->satuan_jual ?? 'Pcs',
                    'total_terjual'   => (int) $item->total_qty_terjual,
                    'total_omset'     => (float) $item->total_omset,
                    'total_keuntungan'=> (float) $item->total_keuntungan,
                ];
            });

        return view('backend.transaksi.index', compact('transaksi', 'livePenjualan'));
    }

    public function create()
    {
        $produk = SatuanProduk::with('produk')->get();
        return view('backend.transaksi.create', compact('produk'));
    }

    public function store(Request $request)
    {
        if (!$request->has('produk') || empty($request->produk)) {
            return back()->with('error', 'Silahkan pilih produk dan tambahkan ke keranjang terlebih dahulu.');
        }

        if (!$request->has('jumlah_bayar') || $request->jumlah_bayar === null || $request->jumlah_bayar === '') {
            return back()->with('error', 'Kolom nominal Bayar wajib diisi angka.');
        }

        DB::beginTransaction();
        try {
            $total_tagihan = 0;
            $total_keuntungan = 0;

            // Loop pertama: Validasi stok riil & Hitung total tagihan/keuntungan
            foreach ($request->produk as $item) {
                $satuan = SatuanProduk::with('produk')->find($item['id_satuan']);

                if (!$satuan || !$satuan->produk) {
                    return back()->with('error', 'Salah satu data produk tidak ditemukan di sistem.');
                }

                $pengali = $satuan->kuantiti_per_satuan ?? 1;
                $kuantitiTerkecil = $item['qty'] * $pengali;

                // Validasi sisi Server: Cek ketersediaan stok fisik di database
                if ($satuan->produk->total_stok_terkecil < $kuantitiTerkecil) {
                    return back()->with('error', 'Gagal Simpan! Stok untuk produk "' . $satuan->produk->nama_produk . '" tidak mencukupi di database.');
                }

                $harga_beli = $satuan->harga_beli ?? 0;
                $subtotal = $item['qty'] * $item['harga_jual'];
                $keuntungan = ($item['harga_jual'] - $harga_beli) * $item['qty'];

                $total_tagihan += $subtotal;
                $total_keuntungan += $keuntungan;
            }

            if ($request->jumlah_bayar < $total_tagihan) {
                return back()->with('error', 'Uang pembayaran kurang dari total tagihan.');
            }

            // Generate Kode Invoice TRX
            $hari  = date('j'); 
            $bulan = date('n'); 
            $tahun = date('Y'); 
            $formatWaktu = $hari . $bulan . $tahun; 

            $prefixInvoice = 'TRX-' . $formatWaktu . '-';
            $jumlahTransaksiHariIni = Transaksi::where('kode_transaksi', 'like', $prefixInvoice . '%')->count();
            
            $nomorUrut = sprintf('%03d', $jumlahTransaksiHariIni + 1);
            $invoiceFinal = $prefixInvoice . $nomorUrut;

            // Simpan Transaksi Utama
            $trx = Transaksi::create([
                'kode_transaksi' => $invoiceFinal, 
                'total_tagihan' => $total_tagihan,
                'jumlah_bayar' => $request->jumlah_bayar,
                'kembalian' => $request->jumlah_bayar - $total_tagihan,
                'total_keuntungan' => $total_keuntungan,
            ]);

            // Dokumen Pergerakan Stok Keluar
            $tahunBulan = date('Ym');
            $prefix = "OUT-{$tahunBulan}-";

            $lastPergerakan = DB::table('pergerakan_stok')
                ->where('kode_pergerakan', 'like', $prefix . '%')
                ->orderBy('kode_pergerakan', 'desc')
                ->first();

            $sequence = 1;
            if ($lastPergerakan) {
                $lastSequence = (int) substr($lastPergerakan->kode_pergerakan, -4);
                $sequence = $lastSequence + 1;
            }

            $kodeDokumenStok = $prefix . str_pad($sequence, 4, '0', STR_PAD_LEFT);

            $pergerakanInduk = PergerakanStok::create([
                'kode_pergerakan' => $kodeDokumenStok,
                'tipe_pergerakan' => 'keluar', 
                'tanggal_pergerakan' => now(),
                'catatan' => 'Penjualan Nota: ' . $invoiceFinal,
            ]);

            // Loop kedua: Eksekusi simpan detail & potong stok
            foreach ($request->produk as $item) {
                $satuan = SatuanProduk::with('produk')->find($item['id_satuan']);
                if (!$satuan) continue;

                $harga_beli = $satuan->harga_beli ?? 0;
                $pengali = $satuan->kuantiti_per_satuan ?? 1;
                $kuantitiTerkecil = $item['qty'] * $pengali;

                // Simpan detail transaksi
                DetailTransaksi::create([
                    'id_transaksi' => $trx->id_transaksi, 
                    'id_satuan' => $item['id_satuan'],
                    'kuantiti' => $item['qty'],
                    'harga_beli' => $harga_beli,
                    'harga_jual' => $item['harga_jual'],
                    'subtotal' => $item['qty'] * $item['harga_jual'],
                    'keuntungan' => ($item['harga_jual'] - $harga_beli) * $item['qty'],
                ]);

                // Simpan detail pergerakan stok
                DB::table('detail_pergerakan_stok')->insert([
                    'id_pergerakan' => $pergerakanInduk->id_pergerakan, 
                    'id_satuan' => $item['id_satuan'],
                    'kuantiti' => $item['qty'], 
                    'snapshot_nama_produk' => $satuan->produk->nama_produk ?? '-',
                    'snapshot_kode_produk' => $satuan->produk->kode_produk ?? '-',
                    'snapshot_nama_satuan' => $satuan->nama_satuan ?? '-',
                    'snapshot_harga_beli' => $harga_beli,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);

                // Potong Stok
                $satuan->produk->decrement('total_stok_terkecil', $kuantitiTerkecil);
            }

            DB::commit();
            return redirect()->route('transaksi.index')->with('success', 'Transaksi berhasil disimpan dengan invoice: ' . $invoiceFinal);

        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Terjadi kesalahan sistem: ' . $e->getMessage());
        }
    }

    public function show($id)
    {
        $transaksi = Transaksi::with(['detailTransaksi.satuanProduk.produk'])->findOrFail($id);
        return view('backend.transaksi.show', compact('transaksi'));
    }

    public function destroy($id)
    {
        try {
            $transaksi = Transaksi::findOrFail($id);
            $transaksi->delete();
            return redirect()->route('transaksi.index')->with('success', 'Transaksi berhasil dihapus.');
        } catch (\Exception $e) {
            return back()->with('error', 'Gagal menghapus transaksi: ' . $e->getMessage());
        }
    }

    public function exportExcel(Request $request)
    {
        $request->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $start = $request->start_date;
        $end = $request->end_date;
        
        $namaFile = 'Laporan_Transaksi_' . $start . '_sd_' . $end . '.xlsx';

        return Excel::download(new TransaksiExport($start, $end), $namaFile);
    }
}