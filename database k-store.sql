-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2023 at 09:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k-store`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel transaksi`
--

CREATE TABLE `tabel transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` int(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `created` date NOT NULL,
  `nama_image` varchar(50) NOT NULL,
  `type_image` varchar(50) NOT NULL,
  `size_image` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `deskripsi`, `harga`, `stok`, `created`, `nama_image`, `type_image`, `size_image`) VALUES
(1, 'Gamis Rempel Susun', 72, 100, '2023-01-10', '698e4e0d-d0bd-4bd0-8b33-2699e60db1e5 (2).png', 'image/png', 72633),
(2, 'Buket snack silverqueen', 65, 50, '2023-01-10', 'bb92db02-3eaf-4915-b8bf-a8d1f0da12ad.png', 'image/png', 68668),
(3, 'Gamis lordess', 84, 50, '2023-01-10', '45c810f3-30a0-40c0-9706-69cd7361d317.png', 'image/png', 159349),
(4, 'Gamis Abaya', 78, 100, '2023-01-10', 'e1c9c00a-fda6-4eca-98d7-2e5e411c9d2e.png', 'image/png', 202468),
(5, 'Buket snack beng-beng', 35, 50, '2023-01-10', 'bb92db02-3eaf-4915-b8bf-a8d1f0da12ad.png', 'image/png', 68668),
(6, 'Dress cantik Aluna big size', 90, 100, '2023-01-10', '3a25dcfd-2f33-4a93-870c-fa927653b19b.png', 'image/png', 92794),
(7, 'Buket snack Choocolatos kecil', 25, 50, '2023-01-10', 'dfa250f4-f188-4713-8b4f-93c7926ba0ff.png', 'image/png', 216119),
(9, 'buket snack Boneka', 50, 50, '2023-01-10', '18342253-1b89-4884-8222-47ff9bbe4beb.png', 'image/png', 233652);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keranjang`
--

CREATE TABLE `tbl_keranjang` (
  `id` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `id_barang` int(100) NOT NULL,
  `ukuran` varchar(5) NOT NULL,
  `qty` int(50) NOT NULL,
  `date_in` date NOT NULL,
  `total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesanan`
--

CREATE TABLE `tbl_pesanan` (
  `id_pesanan` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `id_barang` int(100) NOT NULL,
  `ukuran` varchar(5) NOT NULL,
  `qty` int(50) NOT NULL,
  `total` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_pesanan`
--

INSERT INTO `tbl_pesanan` (`id_pesanan`, `id_user`, `id_barang`, `ukuran`, `qty`, `total`) VALUES
(16, 4, 5, 'L', 1, 130000),
(17, 4, 6, 'M', 1, 145000),
(19, 2, 9, 'M', 2, 270000),
(20, 3, 7, 'M', 2, 260000),
(21, 5, 7, 'XL', 3, 390000),
(22, 5, 2, 'L', 2, 270000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id_user` int(100) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(6) NOT NULL,
  `password` varchar(6) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id_user`, `nama_lengkap`, `email`, `username`, `password`, `alamat`, `no_hp`) VALUES
(1, 'Nurrati', 'nurrathy6@gmail.com', 'Nurrat', 'Nurrat', 'Jl. olat maras batu alang, pernek, kec. moyo hulu,', '081353848314'),
(2, 'marifa ', 'ngganggemarifa@gmail.com', 'marifa', 'marifa', 'Jl.olat maras,batu alang,pernek,kec.moyo hulu,kabu', '081236153762');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel transaksi`
--
ALTER TABLE `tabel transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_barang` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pesanan`
--
ALTER TABLE `tbl_pesanan`
  MODIFY `id_pesanan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_user` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
