-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 11 Jun 2026 pada 12.09
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_barakah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pergerakan_stok`
--

CREATE TABLE `detail_pergerakan_stok` (
  `id_detail` bigint(20) UNSIGNED NOT NULL,
  `id_pergerakan` bigint(20) UNSIGNED NOT NULL,
  `id_satuan` bigint(20) UNSIGNED DEFAULT NULL,
  `kuantiti` int(11) NOT NULL,
  `snapshot_nama_produk` varchar(255) NOT NULL,
  `snapshot_kode_produk` varchar(255) NOT NULL,
  `snapshot_nama_satuan` varchar(255) NOT NULL,
  `snapshot_harga_beli` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_pergerakan_stok`
--

INSERT INTO `detail_pergerakan_stok` (`id_detail`, `id_pergerakan`, `id_satuan`, `kuantiti`, `snapshot_nama_produk`, `snapshot_kode_produk`, `snapshot_nama_satuan`, `snapshot_harga_beli`, `created_at`, `updated_at`) VALUES
(1, 1, 31, 20, '123', '03-XXX-001', '1 Renceng : 10 Sashet', 2000.00, '2026-06-11 01:56:15', '2026-06-11 01:56:15'),
(2, 2, 31, 20, '123', '03-XXX-001', '1 Renceng : 10 Sashet', 2000.00, '2026-06-11 01:57:30', '2026-06-11 01:57:30'),
(3, 3, 31, 10, '123', '03-XXX-001', '1 Renceng : 10 Sashet', 2000.00, '2026-06-11 02:00:32', '2026-06-11 02:00:32'),
(4, 4, 31, 10, '123', '03-XXX-001', '1 Renceng : 10 Sashet', 2000.00, '2026-06-11 08:47:50', '2026-06-11 08:47:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` bigint(20) UNSIGNED NOT NULL,
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `id_satuan` bigint(20) UNSIGNED NOT NULL,
  `kuantiti` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `keuntungan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_satuan`, `kuantiti`, `harga_beli`, `harga_jual`, `subtotal`, `keuntungan`, `created_at`, `updated_at`) VALUES
(1, 1, 31, 20, 2000, 2500, 50000, 10000, '2026-06-11 01:57:30', '2026-06-11 01:57:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Kebutuhan Rumah Tangga', 'Kategori untuk produk sembako sehari-hari.', '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(2, 'Sabun & Perlengkapan Mandi', 'Kategori untuk produk sembako sehari-hari.', '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(3, 'Bahan Pokok', 'Kategori untuk produk sembako sehari-hari.', '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(4, 'Mie & Makanan Instan', 'Kategori untuk produk sembako sehari-hari.', '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(5, 'Bumbu Dapur', 'Kategori untuk produk sembako sehari-hari.', '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(6, 'Minuman & Susu', 'Kategori untuk produk sembako sehari-hari.', '2026-06-10 07:31:08', '2026-06-10 07:31:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_05_04_035026_create_kategori_table', 1),
(6, '2026_05_04_035100_create_produk_table', 1),
(7, '2026_05_04_035132_create_satuan_produk_table', 1),
(8, '2026_05_04_035140_create_pergerakan_stok_table', 1),
(9, '2026_05_04_035154_create_transaksi_table', 1),
(10, '2026_05_04_035158_create_detail_transaksi_table', 1),
(11, '2026_05_24_060443_create_detail_pergerakan_stok_table', 1),
(12, '2026_06_05_000000_add_role_to_users', 1),
(13, '2026_06_06_000000_update_detail_transaksi_satuan_fk', 1),
(14, '2026_06_06_000001_update_produk_kategori_fk', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pergerakan_stok`
--

CREATE TABLE `pergerakan_stok` (
  `id_pergerakan` bigint(20) UNSIGNED NOT NULL,
  `kode_pergerakan` varchar(20) NOT NULL,
  `tipe_pergerakan` enum('masuk','keluar') NOT NULL,
  `tanggal_pergerakan` datetime NOT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pergerakan_stok`
--

INSERT INTO `pergerakan_stok` (`id_pergerakan`, `kode_pergerakan`, `tipe_pergerakan`, `tanggal_pergerakan`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 'IN-202606-0001', 'masuk', '2026-06-11 00:00:00', NULL, '2026-06-11 01:56:15', '2026-06-11 01:56:15'),
(2, 'OUT-202606-0001', 'keluar', '2026-06-11 08:57:30', 'Penjualan Nota: TRX-1162026-001', '2026-06-11 01:57:30', '2026-06-11 01:57:30'),
(3, 'IN-202606-0002', 'masuk', '2026-06-11 00:00:00', NULL, '2026-06-11 02:00:32', '2026-06-11 02:00:32'),
(4, 'IN-202606-0003', 'masuk', '2026-06-11 00:00:00', NULL, '2026-06-11 08:47:50', '2026-06-11 08:47:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `kode_produk` char(10) NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `direktori_gambar` varchar(255) DEFAULT NULL,
  `total_stok_terkecil` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `kode_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `direktori_gambar`, `total_stok_terkecil`, `created_at`, `updated_at`) VALUES
(1, 'SBK7588382', 5, 'Pepsodent White 120g', 'Stok produk Pepsodent White 120g untuk warung sembako.', 'images/produk/sembako-default.jpg', 10, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(2, 'SBK6795797', 2, 'Indomie Goreng Spesiial', 'Stok produk Indomie Goreng Spesiial untuk warung sembako.', 'images/produk/sembako-default.jpg', 21, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(3, 'SBK0199004', 6, 'Kopi Kapal Api Mix', 'Stok produk Kopi Kapal Api Mix untuk warung sembako.', 'images/produk/sembako-default.jpg', 9, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(4, 'SBK5317046', 4, 'Shampoo Sunsilk Sachet', 'Stok produk Shampoo Sunsilk Sachet untuk warung sembako.', 'images/produk/sembako-default.jpg', 50, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(5, 'SBK9655496', 4, 'Telur Ayam Ras 1kg', 'Stok produk Telur Ayam Ras 1kg untuk warung sembako.', 'images/produk/sembako-default.jpg', 6, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(6, 'SBK5878888', 2, 'Kopi Kapal Api Mix', 'Stok produk Kopi Kapal Api Mix untuk warung sembako.', 'images/produk/sembako-default.jpg', 31, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(7, 'SBK8971217', 5, 'Minyak Goreng Bimoli 1L', 'Stok produk Minyak Goreng Bimoli 1L untuk warung sembako.', 'images/produk/sembako-default.jpg', 10, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(8, 'SBK2718775', 5, 'Teh Celup Sosro', 'Stok produk Teh Celup Sosro untuk warung sembako.', 'images/produk/sembako-default.jpg', 37, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(9, 'SBK0015629', 4, 'Garam Dapur Cap Kapal', 'Stok produk Garam Dapur Cap Kapal untuk warung sembako.', 'images/produk/sembako-default.jpg', 16, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(10, 'SBK1971769', 2, 'Kopi Kapal Api Mix', 'Stok produk Kopi Kapal Api Mix untuk warung sembako.', 'images/produk/sembako-default.jpg', 32, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(11, 'SBK2422413', 4, 'Gula Pasir Gulaku 1kg', 'Stok produk Gula Pasir Gulaku 1kg untuk warung sembako.', 'images/produk/sembako-default.jpg', 13, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(12, 'SBK2681005', 3, 'Shampoo Sunsilk Sachet', 'Stok produk Shampoo Sunsilk Sachet untuk warung sembako.', 'images/produk/sembako-default.jpg', 19, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(13, 'SBK7289568', 5, 'Sabun Lifebuoy Merah', 'Stok produk Sabun Lifebuoy Merah untuk warung sembako.', 'images/produk/sembako-default.jpg', 38, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(14, 'SBK1018411', 2, 'Kecap Manis Bango 135ml', 'Stok produk Kecap Manis Bango 135ml untuk warung sembako.', 'images/produk/sembako-default.jpg', 46, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(15, 'SBK5048827', 6, 'Sedaap Soto Kuah', 'Stok produk Sedaap Soto Kuah untuk warung sembako.', 'images/produk/sembako-default.jpg', 30, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(16, 'SBK4591131', 3, 'Sabun Cuci Piring Mama Lemon', 'Stok produk Sabun Cuci Piring Mama Lemon untuk warung sembako.', 'images/produk/sembako-default.jpg', 16, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(17, 'SBK4967351', 1, 'Beras Sentra Ramos 5kg', 'Stok produk Beras Sentra Ramos 5kg untuk warung sembako.', 'images/produk/sembako-default.jpg', 28, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(18, 'SBK7012864', 2, 'Susu Kental Manis Frisian Flag', 'Stok produk Susu Kental Manis Frisian Flag untuk warung sembako.', 'images/produk/sembako-default.jpg', 10, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(19, 'SBK8239025', 6, 'Beras Sentra Ramos 5kg', 'Stok produk Beras Sentra Ramos 5kg untuk warung sembako.', 'images/produk/sembako-default.jpg', 14, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(20, 'SBK6153412', 6, 'Teh Celup Sosro', 'Stok produk Teh Celup Sosro untuk warung sembako.', 'images/produk/sembako-default.jpg', 44, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(21, 'SBK7051604', 2, 'Obat Nyamuk Hit Semprot', 'Stok produk Obat Nyamuk Hit Semprot untuk warung sembako.', 'images/produk/sembako-default.jpg', 43, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(22, 'SBK9742506', 1, 'Kopi Kapal Api Mix', 'Stok produk Kopi Kapal Api Mix untuk warung sembako.', 'images/produk/sembako-default.jpg', 11, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(23, 'SBK4608917', 2, 'Susu Kental Manis Frisian Flag', 'Stok produk Susu Kental Manis Frisian Flag untuk warung sembako.', 'images/produk/sembako-default.jpg', 5, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(24, 'SBK9324510', 1, 'Kecap Manis Bango 135ml', 'Stok produk Kecap Manis Bango 135ml untuk warung sembako.', 'images/produk/sembako-default.jpg', 16, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(25, 'SBK0141642', 3, 'Shampoo Sunsilk Sachet', 'Stok produk Shampoo Sunsilk Sachet untuk warung sembako.', 'images/produk/sembako-default.jpg', 33, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(26, 'SBK4827336', 6, 'Minyak Goreng Bimoli 1L', 'Stok produk Minyak Goreng Bimoli 1L untuk warung sembako.', 'images/produk/sembako-default.jpg', 20, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(27, 'SBK5342809', 2, 'Shampoo Sunsilk Sachet', 'Stok produk Shampoo Sunsilk Sachet untuk warung sembako.', 'images/produk/sembako-default.jpg', 30, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(28, 'SBK2614224', 2, 'Indomie Goreng Spesiial', 'Stok produk Indomie Goreng Spesiial untuk warung sembako.', 'images/produk/sembako-default.jpg', 42, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(29, 'SBK8253480', 1, 'Deterjen Rinso Anti Noda 1kg', 'Stok produk Deterjen Rinso Anti Noda 1kg untuk warung sembako.', 'images/produk/sembako-default.jpg', 12, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(30, 'SBK2429534', 4, 'Minyak Goreng Sania 2L', 'Stok produk Minyak Goreng Sania 2L untuk warung sembako.', 'images/produk/sembako-default.jpg', 12, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(31, '03-XXX-001', 3, '123', '1 renceng : 10 saset', 'produk/2egJRgbaCY1RmeplwYKd.png', 40000, '2026-06-11 01:52:53', '2026-06-11 08:47:50'),
(32, '03-ADU-001', 3, 'adubedube', '1 renceng 12 saset', 'produk/6lO2OpKrfQ0Rp5SWSY6M.png', 0, '2026-06-11 09:18:41', '2026-06-11 09:18:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan_produk`
--

CREATE TABLE `satuan_produk` (
  `id_satuan` bigint(20) UNSIGNED NOT NULL,
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `nama_satuan` varchar(50) NOT NULL,
  `kuantiti_per_satuan` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `satuan_produk`
--

INSERT INTO `satuan_produk` (`id_satuan`, `id_produk`, `nama_satuan`, `kuantiti_per_satuan`, `harga_beli`, `harga_jual`, `created_at`, `updated_at`) VALUES
(1, 1, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(2, 2, 'bks', 1, 2800, 3500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(3, 3, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(4, 4, 'sachet', 1, 1000, 1500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(5, 5, 'kg', 1, 12000, 14000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(6, 6, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(7, 7, 'kg', 1, 15000, 17500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(8, 8, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(9, 9, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(10, 10, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(11, 11, 'kg', 1, 12000, 14000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(12, 12, 'sachet', 1, 1000, 1500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(13, 13, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(14, 14, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(15, 15, 'bks', 1, 2800, 3500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(16, 16, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(17, 17, 'kg', 1, 65000, 72000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(18, 18, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(19, 19, 'kg', 1, 65000, 72000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(20, 20, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(21, 21, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(22, 22, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(23, 23, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(24, 24, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(25, 25, 'sachet', 1, 1000, 1500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(26, 26, 'kg', 1, 15000, 17500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(27, 27, 'sachet', 1, 1000, 1500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(28, 28, 'bks', 1, 2800, 3500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(29, 29, 'pcs', 1, 4000, 5000, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(30, 30, 'kg', 1, 15000, 17500, '2026-06-10 07:31:08', '2026-06-10 07:31:08'),
(31, 31, '1 Renceng : 10 Sashet', 2000, 2000, 2500, '2026-06-11 01:54:52', '2026-06-11 01:54:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `kode_transaksi` varchar(50) NOT NULL,
  `total_tagihan` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `total_keuntungan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_transaksi`, `total_tagihan`, `jumlah_bayar`, `kembalian`, `total_keuntungan`, `created_at`, `updated_at`) VALUES
(1, 'TRX-1162026-001', 50000, 60000, 10000, 10000, '2026-06-11 01:57:30', '2026-06-11 01:57:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'kasir',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$pOFfsaYDfjuHHqucQw.UF.p6tAY8mACR0xAd3e/KG/xePXMaOqvMa', 'admin', NULL, '2026-06-10 07:31:07', '2026-06-10 07:31:07'),
(2, 'Kasir', 'kasir@example.com', NULL, '$2y$12$Skes9peCckF0RXM81XjVKOhxjC288Cz59BYBSWXhf2wgB52RcBiWK', 'kasir', NULL, '2026-06-10 07:31:08', '2026-06-10 07:31:08');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pergerakan_stok`
--
ALTER TABLE `detail_pergerakan_stok`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `detail_pergerakan_stok_id_pergerakan_foreign` (`id_pergerakan`),
  ADD KEY `detail_pergerakan_stok_id_satuan_foreign` (`id_satuan`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `detail_transaksi_id_transaksi_foreign` (`id_transaksi`),
  ADD KEY `detail_transaksi_id_satuan_foreign` (`id_satuan`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pergerakan_stok`
--
ALTER TABLE `pergerakan_stok`
  ADD PRIMARY KEY (`id_pergerakan`),
  ADD UNIQUE KEY `pergerakan_stok_kode_pergerakan_unique` (`kode_pergerakan`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `produk_kode_produk_unique` (`kode_produk`),
  ADD KEY `produk_id_kategori_foreign` (`id_kategori`);

--
-- Indeks untuk tabel `satuan_produk`
--
ALTER TABLE `satuan_produk`
  ADD PRIMARY KEY (`id_satuan`),
  ADD KEY `satuan_produk_id_produk_foreign` (`id_produk`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `transaksi_kode_transaksi_unique` (`kode_transaksi`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pergerakan_stok`
--
ALTER TABLE `detail_pergerakan_stok`
  MODIFY `id_detail` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pergerakan_stok`
--
ALTER TABLE `pergerakan_stok`
  MODIFY `id_pergerakan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `satuan_produk`
--
ALTER TABLE `satuan_produk`
  MODIFY `id_satuan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pergerakan_stok`
--
ALTER TABLE `detail_pergerakan_stok`
  ADD CONSTRAINT `detail_pergerakan_stok_id_pergerakan_foreign` FOREIGN KEY (`id_pergerakan`) REFERENCES `pergerakan_stok` (`id_pergerakan`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_pergerakan_stok_id_satuan_foreign` FOREIGN KEY (`id_satuan`) REFERENCES `satuan_produk` (`id_satuan`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_id_satuan_foreign` FOREIGN KEY (`id_satuan`) REFERENCES `satuan_produk` (`id_satuan`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_transaksi_id_transaksi_foreign` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `satuan_produk`
--
ALTER TABLE `satuan_produk`
  ADD CONSTRAINT `satuan_produk_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
