-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Nov 2024 pada 18.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pandai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` varchar(20) NOT NULL,
  `NamaLengkap` varchar(100) DEFAULT NULL,
  `AsalInstansi` varchar(100) DEFAULT NULL,
  `Jurusan` varchar(100) DEFAULT NULL,
  `NoRegistrasiAkun` varchar(50) DEFAULT NULL,
  `Tahun` int(11) DEFAULT NULL,
  `Peran` varchar(50) DEFAULT NULL,
  `ProgramStudi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mengajukan`
--

CREATE TABLE `mengajukan` (
  `Id` int(11) NOT NULL,
  `NIM` varchar(20) DEFAULT NULL,
  `ProposalId` int(11) DEFAULT NULL,
  `TanggalPengajuan` date DEFAULT NULL,
  `WaktuPengajuan` time DEFAULT NULL,
  `Tahun` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `proposal`
--

CREATE TABLE `proposal` (
  `Id` int(11) NOT NULL,
  `Skema` varchar(100) DEFAULT NULL,
  `Judul` varchar(255) DEFAULT NULL,
  `JumlahHalaman` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indeks untuk tabel `mengajukan`
--
ALTER TABLE `mengajukan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `NIM` (`NIM`),
  ADD KEY `ProposalId` (`ProposalId`);

--
-- Indeks untuk tabel `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mengajukan`
--
ALTER TABLE `mengajukan`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `proposal`
--
ALTER TABLE `proposal`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mengajukan`
--
ALTER TABLE `mengajukan`
  ADD CONSTRAINT `mengajukan_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `mengajukan_ibfk_2` FOREIGN KEY (`ProposalId`) REFERENCES `proposal` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
