<p align="center">
    <img src="public/images/Salinan iconlogowarung.png" width="120" alt="Logo Toko Barakah Sentosa" style="border-radius: 50%">
</p>

<h1 align="center">TOKO BARAKAH SENTOSA</h1>

<p align="center">
    <strong>Sistem Informasi Manajemen Barang & Kasir (POS) Berbasis Web</strong>
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel">
    <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP Version">
    <img src="https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
    <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white" alt="Bootstrap">
</p>

---

## 📌 Tentang Proyek
**Toko Barakah Sentosa** adalah aplikasi berbasis web yang dirancang khusus untuk mempermudah operasional toko kelontong atau warung. Aplikasi ini mencakup manajemen inventaris produk, kategori barang, satuan kuantitas, kalkulator kasir dinamis (POS), hingga pencatatan stok gudang secara real-time.

### ✨ Fitur Utama
* **Dashboard Interaktif:** Grafik ringkasan penjualan dan statistik toko.
* **Manajemen Barang:** Kelola data Produk, Kategori, dan Satuan Konversi secara fleksibel.
* **Kasir / Transaksi Modern:** Input keranjang belanja instan menggunakan pencarian dinamis (Select2) dan validasi sisa stok otomatis menggunakan alert teks dinamis tanpa pop-up browser.
* **Sistem Gudang & Stok:** Sinkronisasi otomatis stok fisik terkecil saat transaksi kasir berhasil disimpan.

---

## 💻 Ketentuan & Spesifikasi Sistem Minimum

Sebelum menjalankan atau melakukan instalasi proyek ini, pastikan perangkat Anda telah memenuhi ketentuan spesifikasi berikut:

### 1. Versi PHP & Perangkat Lunak
* **PHP:** Minimal versi **`8.2`** atau **`8.3`** (Sangat Direkomendasikan versi `8.3` untuk performa paling stabil).
* **Database:** MySQL versi `5.7` atau `8.0+`.
* **Tools Pendukung:** Composer (Versi 2.x) dan Node.js.

### 2. Cara Cek Versi PHP di Perangkat Anda (Mac / Windows)
Buka Terminal atau Command Prompt Anda, lalu ketik perintah berikut untuk memastikan versi PHP sudah sesuai ketentuan sebelum melakukan kloning:
```bash
php -v

```
###🚀 Panduan Instalasi Langkah demi Langkah (Setelah Git Clone)
Ikuti urutan langkah di bawah ini untuk memasang proyek dari repositori GitHub ke komputer lokal Anda:

Langkah 1: Kloning Repositori
Buka Terminal Anda, arahkan ke folder web server (misal: htdocs atau folder khusus proyek Anda), lalu jalankan perintah:

Bash
```
git clone [https://github.com/MrsFaixall/toko_barakah_sentosa.git](https://github.com/MrsFaixall/toko_barakah_sentosa.git)
```
Masuk ke dalam folder proyek yang berhasil di-clone:

Bash
```
cd toko_barakah_sentosa
```
Langkah 2: Instalasi Dependencies (Composer)
Unduh seluruh library PHP pihak ketiga yang dibutuhkan oleh sistem Laravel:

Bash
```
composer install
```
Langkah 3: Konfigurasi File Environment (.env)
Duplikat file konfigurasi bawaan untuk membuat file .env baru sebagai basis pengaturan aplikasi Anda:

Bash
cp .env.example .env
Langkah 4: Generate Application Key
Buat kunci pengaman aplikasi baru yang akan otomatis tersimpan di dalam file .env:

Bash
php artisan key:generate
Langkah 5: Konfigurasi Database
Buat database baru di MySQL/phpMyAdmin Anda dengan nama toko_barakah_sentosa.

Buka file .env menggunakan teks editor (seperti VS Code), lalu cari dan sesuaikan baris kode berikut dengan detail database Anda:

Cuplikan kode
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=toko_barakah_sentosa
DB_USERNAME=root
DB_PASSWORD=ISI_PASSWORD_DATABASE_ANDA_DISINI
Langkah 6: Migrasi Database & Seeding
Jalankan perintah migrasi untuk membuat seluruh struktur tabel ke database beserta data awal bawaan sistem (jika ada):

```Bash
php artisan migrate --seed
```
Langkah 7: Jalankan Server Lokal
Nyalakan server lokal Laravel Anda dengan menjalankan perintah ini:

Bash
php artisan serve
Aplikasi sekarang sudah aktif dan dapat diakses melalui browser kesayangan Anda di alamat URL: http://127.0.0.1:8000

```
🗂 Struktur Menu Utama Aplikasi
Plaintext
├── Utama
│   └── Dashboard
├── Manajemen Barang
│   ├── Produk
│   ├── Kategori
│   └── Satuan
└── Kasir & Gudang
    ├── Transaksi (Fitur Baru: Pencarian Select2 & Alert Teks Dinamis)
    └── Stok
```
📤 Cara Push Perubahan File README ini ke GitHub
Jika Anda memperbarui dokumen ini di lokal, ketik 3 perintah ini secara berurutan di terminal Anda untuk memperbarui file di repositori GitHub:

Bash
git add README.md
git commit -m "Update file README.md gabungan terlengkap dan instruksi sistem"
git push origin main
📄 Lisensi
Proyek ini bersifat open-source di bawah lisensi MIT License.
