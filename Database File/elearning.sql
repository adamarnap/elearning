-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 03:34 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `balas_komentar`
--

CREATE TABLE `balas_komentar` (
  `idBalasKomentar` int(11) NOT NULL,
  `isi_komentar` text NOT NULL,
  `NIP` int(11) NOT NULL,
  `NIS` int(11) NOT NULL,
  `idKomentar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `NIP` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `foto` text NOT NULL,
  `level` enum('Guru') NOT NULL,
  `idMapel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`NIP`, `email`, `password`, `nama_lengkap`, `foto`, `level`, `idMapel`) VALUES
(6666, 'kanaya@gmail.com', 'kanaya123', 'Kanaya Ayu', 'guru3.jpg', 'Guru', 3),
(12345, 'sri@gmail.com', 'sri123', 'Sri Hartini', 'guru21.jpg', 'Guru', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_guru`
--

CREATE TABLE `jadwal_guru` (
  `idJadwal` int(11) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `NIP` int(11) NOT NULL,
  `idKelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_guru`
--

INSERT INTO `jadwal_guru` (`idJadwal`, `hari`, `jam_mulai`, `jam_selesai`, `NIP`, `idKelas`) VALUES
(2, 'Senin', '10:30:00', '12:00:00', 12345, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `idJawab` int(11) NOT NULL,
  `Jawaban` text NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `idSoal` int(11) NOT NULL,
  `idKelas` int(11) NOT NULL,
  `idMapel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jawaban`
--

INSERT INTO `jawaban` (`idJawab`, `Jawaban`, `nama_lengkap`, `idSoal`, `idKelas`, `idMapel`) VALUES
(16, 'IMG_20190702_191457_8447.jpg', 'Elda Qotul Maulya', 10, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `idKelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`idKelas`, `nama_kelas`) VALUES
(1, '7A'),
(2, '7B'),
(11, '7C'),
(12, '7D'),
(13, '8A'),
(14, '8B'),
(15, '8C'),
(16, '8D');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `idKomentar` int(11) NOT NULL,
  `isi_komentar` text NOT NULL,
  `NIP` int(11) NOT NULL,
  `NIS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `idMapel` int(11) NOT NULL,
  `nama_pelajaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`idMapel`, `nama_pelajaran`) VALUES
(2, 'IPA'),
(3, 'IPS'),
(5, 'Matematika'),
(6, 'Bahasa Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `idMateri` int(11) NOT NULL,
  `judul_materi` varchar(50) NOT NULL,
  `nama_materi` varchar(50) NOT NULL,
  `isi_materi` text NOT NULL,
  `idMapel` int(11) NOT NULL,
  `idKelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`idMateri`, `judul_materi`, `nama_materi`, `isi_materi`, `idMapel`, `idKelas`) VALUES
(1, 'Bab 1', 'Percepatan', 'IPA_BAB_26.pdf', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `idNilai` int(11) NOT NULL,
  `nilai` decimal(10,0) NOT NULL,
  `idMapel` int(11) NOT NULL,
  `idSoal` int(11) NOT NULL,
  `NIS` int(11) NOT NULL,
  `idKelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`idNilai`, `nilai`, `idMapel`, `idSoal`, `NIS`, `idKelas`) VALUES
(1, '90', 2, 10, 1234, 1);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `NIS` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `no_hp` char(12) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `nama_ortu` varchar(50) NOT NULL,
  `level` enum('Siswa') NOT NULL,
  `idKelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`NIS`, `email`, `password`, `nama_lengkap`, `no_hp`, `foto`, `nama_ortu`, `level`, `idKelas`) VALUES
(1234, 'elda@gmail.com', 'elda123', 'Elda Qotul Maulya', '082133782747', 'IMG_20190618_012532_0551.jpg', 'Amad Toha', 'Siswa', 12),
(66791, 'hana@gmail.com', 'qwerty', 'Hana Hanifa', '08222', 'IMG_20190618_012532_055.jpg', 'Hanan', 'Siswa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `idSoal` int(11) NOT NULL,
  `soal` text NOT NULL,
  `NIP` int(11) NOT NULL,
  `idMapel` int(11) NOT NULL,
  `idKelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`idSoal`, `soal`, `NIP`, `idMapel`, `idKelas`) VALUES
(10, 'IPA_BAB_21.pdf', 6666, 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `balas_komentar`
--
ALTER TABLE `balas_komentar`
  ADD PRIMARY KEY (`idBalasKomentar`),
  ADD UNIQUE KEY `idKomentar` (`idKomentar`),
  ADD UNIQUE KEY `NIP` (`NIP`),
  ADD UNIQUE KEY `NIS` (`NIS`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `idMapel_2` (`idMapel`);

--
-- Indexes for table `jadwal_guru`
--
ALTER TABLE `jadwal_guru`
  ADD PRIMARY KEY (`idJadwal`),
  ADD UNIQUE KEY `idKelas` (`idKelas`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`idJawab`),
  ADD KEY `idSoal` (`idSoal`),
  ADD KEY `idKelas` (`idKelas`),
  ADD KEY `idMapel` (`idMapel`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`idKelas`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`idKomentar`),
  ADD UNIQUE KEY `NIP` (`NIP`),
  ADD UNIQUE KEY `NIS` (`NIS`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`idMapel`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`idMateri`),
  ADD KEY `idMapel` (`idMapel`) USING BTREE,
  ADD KEY `idKelas` (`idKelas`) USING BTREE;

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`idNilai`),
  ADD KEY `idSoal` (`idSoal`),
  ADD KEY `NIS_2` (`NIS`),
  ADD KEY `idMapel_2` (`idMapel`),
  ADD KEY `idKelas` (`idKelas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`),
  ADD UNIQUE KEY `idKelas` (`idKelas`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`idSoal`),
  ADD KEY `idMapel_2` (`idMapel`),
  ADD KEY `idKelas_2` (`idKelas`),
  ADD KEY `NIP_2` (`NIP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `balas_komentar`
--
ALTER TABLE `balas_komentar`
  MODIFY `idBalasKomentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `NIP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67895;

--
-- AUTO_INCREMENT for table `jadwal_guru`
--
ALTER TABLE `jadwal_guru`
  MODIFY `idJadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `idJawab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `idKelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `idKomentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `idMapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `idMateri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `idNilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `NIS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66792;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `idSoal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balas_komentar`
--
ALTER TABLE `balas_komentar`
  ADD CONSTRAINT `balas_komentar_ibfk_1` FOREIGN KEY (`idKomentar`) REFERENCES `komentar` (`idKomentar`);

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`idMapel`) REFERENCES `mata_pelajaran` (`idMapel`);

--
-- Constraints for table `jadwal_guru`
--
ALTER TABLE `jadwal_guru`
  ADD CONSTRAINT `jadwal_guru_ibfk_1` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_guru_ibfk_2` FOREIGN KEY (`NIP`) REFERENCES `guru` (`NIP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD CONSTRAINT `jawaban_ibfk_3` FOREIGN KEY (`idSoal`) REFERENCES `soal` (`idSoal`),
  ADD CONSTRAINT `jawaban_ibfk_4` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`),
  ADD CONSTRAINT `jawaban_ibfk_5` FOREIGN KEY (`idMapel`) REFERENCES `mata_pelajaran` (`idMapel`);

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materi_ibfk_2` FOREIGN KEY (`idMapel`) REFERENCES `mata_pelajaran` (`idMapel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`idSoal`) REFERENCES `soal` (`idSoal`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_4` FOREIGN KEY (`idMapel`) REFERENCES `mata_pelajaran` (`idMapel`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_6` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_7` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `soal_ibfk_5` FOREIGN KEY (`idKelas`) REFERENCES `kelas` (`idKelas`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `soal_ibfk_6` FOREIGN KEY (`idMapel`) REFERENCES `mata_pelajaran` (`idMapel`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `soal_ibfk_7` FOREIGN KEY (`NIP`) REFERENCES `guru` (`NIP`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
