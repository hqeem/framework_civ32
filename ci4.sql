-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2018 at 04:54 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode`, `nama`, `created_at`, `updated_at`) VALUES
(11, 'C1234', 'sikat gigi', NULL, '2018-07-31 07:49:38'),
(15, 'A3', 'Kertas', NULL, '2018-07-31 07:49:25'),
(20, 'C2345', 'kjdjkasndaxss', NULL, '2018-07-31 07:49:25'),
(21, 'SS32', 'sdadsad', NULL, '2018-07-31 07:49:25'),
(22, 'F40', 'asdfghj', '2018-07-31 07:54:56', '2018-07-31 07:55:12'),
(23, 'D45', 'Sepatu', '2018-08-16 11:25:35', '2018-08-16 11:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fact` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `fact`, `created_at`, `updated_at`) VALUES
(1, 'John', 'john@aaabbb.com', 'Loves coding XXX', NULL, '2017-05-31 04:24:48'),
(2, 'Jim', 'jim@example.com', 'Developed on CodeIgniter', NULL, NULL),
(3, 'Jane', 'jane@example.com', 'Lives in the USA', NULL, NULL),
(4, 'John X', 'john@example.com', 'Loves coding', '2017-05-30 08:36:41', NULL),
(5, 'John X', 'john@example.com', 'Loves coding', '2017-05-30 08:40:25', NULL),
(6, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:41:35', NULL),
(7, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:42:14', NULL),
(8, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:42:29', NULL),
(9, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:42:50', NULL),
(10, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:43:03', NULL),
(11, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:44:05', NULL),
(12, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:48:02', NULL),
(13, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:48:39', NULL),
(14, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:50:06', NULL),
(15, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:50:30', NULL),
(16, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:51:18', NULL),
(17, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:51:53', NULL),
(18, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:52:16', NULL),
(20, 'John XX', 'john@example.com', 'Loves coding', '2017-05-30 08:52:51', NULL),
(21, 'Jokojoko', 'joko@gmail.com', 'hahahahahahahaha', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_order`
--

CREATE TABLE `delivery_order` (
  `id` int(11) NOT NULL,
  `nomor_do` varchar(255) DEFAULT NULL,
  `tanggal_do` date DEFAULT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `kode_relasi` varchar(255) DEFAULT NULL,
  `nama_relasi` varchar(255) DEFAULT NULL,
  `jumlah_order` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_order`
--

INSERT INTO `delivery_order` (`id`, `nomor_do`, `tanggal_do`, `tanggal_kirim`, `kode_relasi`, `nama_relasi`, `jumlah_order`, `keterangan`, `created_at`, `updated_at`) VALUES
(9, '121212', '2018-07-26', '2018-07-28', 'QW12', 'benang super', 1000, 'ajdnjksndkas', NULL, NULL),
(10, '657', '2018-07-27', '2018-07-31', 'C345', 'kainku', 600, 'jkjhkjnknknjknjnkj', NULL, NULL),
(11, '98787', '2018-10-17', '2019-01-10', 'C345', 'kainku', 950, 'bkbjbkjbjbjbnjknkj', NULL, NULL),
(12, '76787', '2018-07-27', '2018-07-31', 'QW12', 'benang super', 6000, 'akjhdkjasdkjad', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang`
--

CREATE TABLE `detail_barang` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jenis_barang` varchar(255) DEFAULT NULL,
  `barang` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_barang`
--

INSERT INTO `detail_barang` (`id`, `id_barang`, `jenis_barang`, `barang`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Abcd efgh', '2017-06-12 05:56:13', '2018-07-31 07:50:46'),
(2, 1, NULL, 'dsxfdsfdsfdsf', '2017-06-12 05:56:13', '2018-07-31 07:50:46'),
(3, 2, NULL, 'sdasdsad', '2017-06-12 06:02:19', '2018-07-31 07:50:46'),
(4, 2, NULL, 'sdsadsadsadsad', '2017-06-12 06:02:19', '2018-07-31 07:50:46'),
(5, 3, NULL, 'sdasdsad', '2017-06-12 07:49:59', '2018-07-31 07:50:46'),
(6, 3, NULL, 'sdsadsadsadsad', '2017-06-12 07:49:59', '2018-07-31 07:50:46'),
(7, 3, NULL, 'wkwkwkwkw', '2017-06-12 07:49:59', '2018-07-31 07:50:46'),
(8, 4, NULL, 'sdasdsad', '2017-06-12 07:52:13', '2018-07-31 07:50:46'),
(9, 4, NULL, 'sdsadsadsadsad', '2017-06-12 07:52:13', '2018-07-31 07:50:46'),
(10, 4, NULL, 'wkwkwkwkw', '2017-06-12 07:52:13', '2018-07-31 07:50:46'),
(11, 5, NULL, 'sdasdsad', '2017-06-12 07:54:21', '2018-07-31 07:50:46'),
(12, 5, NULL, 'sdsadsadsadsad', '2017-06-12 07:54:21', '2018-07-31 07:50:46'),
(13, 5, NULL, 'Wkwkwkw', '2017-06-12 07:54:21', '2018-07-31 07:50:46'),
(16, 7, NULL, 'Close Up', '2017-06-12 07:55:38', '2018-07-31 07:50:46'),
(17, 7, NULL, 'Pepsodent', '2017-06-12 07:55:38', '2018-07-31 07:50:46'),
(18, 7, NULL, 'Rita Dent', '2017-06-12 07:55:38', '2018-07-31 07:50:46'),
(36, 6, NULL, 'Ritadent', '2017-06-12 09:08:57', '2018-07-31 07:50:46'),
(37, 6, NULL, 'Enzim', '2017-06-12 09:08:57', '2018-07-31 07:50:46'),
(38, 6, NULL, 'Close Up', '2017-06-12 09:08:57', '2018-07-31 07:50:46'),
(39, 6, NULL, 'Pepsodent', '2017-06-12 09:08:57', '2018-07-31 07:50:46'),
(45, 8, NULL, 'Beras Merah', '2017-06-12 09:15:15', '2018-07-31 07:50:46'),
(46, 8, NULL, 'Beras Biasa', '2017-06-12 09:15:15', '2018-07-31 07:50:46'),
(47, 8, NULL, 'Beras Campur', '2017-06-12 09:15:15', '2018-07-31 07:50:46'),
(48, 8, NULL, 'Beras Ketan', '2017-06-12 09:15:15', '2018-07-31 07:50:46'),
(49, 9, 'Elektronik', 'Kulkas', '2017-06-13 09:04:18', '2018-07-31 07:50:46'),
(50, 10, 'Perabot Rumah Tangga', 'Sikat Super', '2018-07-25 14:15:21', '2018-07-31 07:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `detail_ikt`
--

CREATE TABLE `detail_ikt` (
  `id` int(11) NOT NULL,
  `id_ikt` int(11) DEFAULT NULL,
  `no_patrun` varchar(255) DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `lusi` float DEFAULT NULL,
  `pakan` float DEFAULT NULL,
  `sulur` float DEFAULT NULL,
  `tumpal` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_ikt`
--

INSERT INTO `detail_ikt` (`id`, `id_ikt`, `no_patrun`, `motif`, `lusi`, `pakan`, `sulur`, `tumpal`, `created_at`, `updated_at`) VALUES
(1605, 169, '0052', 'ITB', 188.31, 126.51, 0, 4.885, '2018-08-20 08:32:01', '2018-08-20 08:32:01'),
(1606, 169, '0052', 'ITB', 57.75, 21.74, 0, 30.895, '2018-08-20 08:32:01', '2018-08-20 08:32:01'),
(1607, 169, '0052', 'ITB', 18.56, 23.69, 0, 0, '2018-08-20 08:32:01', '2018-08-20 08:32:01'),
(1608, 169, '0052', 'ITB', 140.04, 79.62, 0, 0, '2018-08-20 08:32:02', '2018-08-20 08:32:02'),
(1609, 169, '0052', 'ITB', 14.44, 0, 0, 0, '2018-08-20 08:32:02', '2018-08-20 08:32:02'),
(1610, 170, '0053', 'ITB', 167.06, 138.23, 0, 4.885, '2018-08-20 08:32:02', '2018-08-20 08:32:02'),
(1611, 170, '0053', 'ITB', 63.11, 50.31, 0, 30.895, '2018-08-20 08:32:02', '2018-08-20 08:32:02'),
(1612, 170, '0053', 'ITB', 19.8, 21.98, 0, 0, '2018-08-20 08:32:02', '2018-08-20 08:32:02'),
(1613, 170, '0053', 'ITB', 150.56, 40.79, 0, 0, '2018-08-20 08:32:02', '2018-08-20 08:32:02'),
(1614, 170, '0053', 'ITB', 18.56, 0, 0, 0, '2018-08-20 08:32:02', '2018-08-20 08:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `detail_patrun`
--

CREATE TABLE `detail_patrun` (
  `id` int(11) NOT NULL,
  `id_patrun` int(11) DEFAULT NULL,
  `nama_benang` varchar(255) DEFAULT NULL,
  `lusi` int(11) DEFAULT NULL,
  `pakan` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_patrun`
--

INSERT INTO `detail_patrun` (`id`, `id_patrun`, `nama_benang`, `lusi`, `pakan`, `created_at`, `updated_at`) VALUES
(4, 4, 'Kertas', 100, 500, '2018-07-30 09:20:04', '2018-07-31 07:51:22'),
(13, 5, 'Kertas', 100, 50, '2018-07-30 09:37:55', '2018-07-31 07:51:22'),
(14, 5, 'sikat gigi', 800, 900, '2018-07-30 09:37:56', '2018-07-31 07:51:22'),
(16, 6, 'Kertas', 100, 90, '2018-07-30 09:41:01', '2018-07-31 07:51:22'),
(17, 7, 'Sepatu', 100, 50, '2018-08-16 11:26:47', '2018-08-16 11:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemenuhan_patrun`
--

CREATE TABLE `detail_pemenuhan_patrun` (
  `id` int(11) NOT NULL,
  `id_pemenuhan_patrun` int(11) DEFAULT NULL,
  `kode_patrun` varchar(255) DEFAULT NULL,
  `pakan` int(11) DEFAULT NULL,
  `lusi` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pemenuhan_patrun`
--

INSERT INTO `detail_pemenuhan_patrun` (`id`, `id_pemenuhan_patrun`, `kode_patrun`, `pakan`, `lusi`, `created_at`, `updated_at`) VALUES
(15, 2, 'P456', 121, 234, '2018-07-31 07:54:31', '2018-07-31 07:54:31'),
(16, 2, 'L90', 33, 55, '2018-07-31 07:54:31', '2018-07-31 07:54:31'),
(18, 3, 'P456', 10, 1000, '2018-07-31 08:30:15', '2018-07-31 08:30:15'),
(19, 4, 'P56', 10, 20, '2018-08-16 11:31:52', '2018-08-16 11:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `customer_id`, `hobbies`, `created_at`, `updated_at`) VALUES
(14, 1, 'AAAADDDDEEE', '2017-05-31 03:28:14', '2017-05-31 04:24:48'),
(15, 1, 'BBBBCCCDDD', '2017-05-31 03:54:42', '2017-05-31 04:24:48'),
(18, 1, 'EEEEECCCDDD', '2017-05-31 04:24:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ikt`
--

CREATE TABLE `ikt` (
  `id` int(11) NOT NULL,
  `no_kik` varchar(255) DEFAULT NULL,
  `tgl_kik` date DEFAULT NULL,
  `kode_prod` varchar(255) DEFAULT NULL,
  `pjg` int(11) DEFAULT NULL,
  `jml_bng` int(11) DEFAULT NULL,
  `no_patrun` varchar(255) DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ikt`
--

INSERT INTO `ikt` (`id`, `no_kik`, `tgl_kik`, `kode_prod`, `pjg`, `jml_bng`, `no_patrun`, `motif`, `created_at`, `updated_at`) VALUES
(169, 'D4K0', '2018-06-08', 'T-43F/AJP', 5000, 4064, '0052', 'ITB', '2018-08-20 08:32:01', '2018-08-20 08:32:01'),
(170, 'D4K1', '2018-06-08', 'T-43F/AJP', 5000, 4064, '0053', 'ITB', '2018-08-20 08:32:02', '2018-08-20 08:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id` int(11) NOT NULL,
  `jenis_barang` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id`, `jenis_barang`, `keterangan`) VALUES
(1, 'Elektronik', 'EK'),
(2, 'Perabot Rumah Tangga', 'PRR');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`name`) VALUES
('PoliticianX'),
('AccountantX');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 'api/example/users', 1, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
(1, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496117142, 0.074677, '1', 200),
(2, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496117805, 0.0905309, '1', 200),
(3, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496118530, 0.144681, '1', 0),
(4, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496118576, 0.117867, '1', 404),
(5, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496118702, 0.078768, '1', 200),
(6, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496119259, 0.102483, '1', 0),
(7, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496119296, 0.0738502, '1', 200),
(8, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496119338, 0.140558, '1', 200),
(9, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496122795, 0.126308, '1', 200),
(10, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123042, 0.0670409, '1', 200),
(11, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123125, 0.106953, '1', 200),
(12, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123159, 0.06971, '1', 200),
(13, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123196, 0.124738, '1', 200),
(14, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123318, 0.096081, '1', 200),
(15, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123334, 0.0718069, '1', 200),
(16, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123458, 0.0992951, '1', 200),
(17, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123497, 0.0948091, '1', 200),
(18, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123669, 0.0857852, '1', 200),
(19, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123686, 0.151381, '1', 200),
(20, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496123837, 0.0828459, '1', 200),
(21, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496123847, 0.0731189, '1', 0),
(22, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124032, 0.0799241, '1', 404),
(23, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124061, 0.0924251, '1', 404),
(24, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124082, 0.256184, '1', 404),
(25, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124167, 0.11669, '1', 404),
(26, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124205, 0.0773292, '1', 404),
(27, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124236, 0.0772748, '1', 404),
(28, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124323, 0.109822, '1', 404),
(29, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124355, 0.0932381, '1', 200),
(30, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124369, 0.0999439, '1', 200),
(31, 'api/example/users/id/2', 'get', 'a:1:{s:2:\"id\";s:1:\"2\";}', '', '127.0.0.1', 1496124425, 0.0714579, '1', 200),
(32, 'api/example/users/id/2', 'get', 'a:1:{s:2:\"id\";s:1:\"2\";}', '', '127.0.0.1', 1496124453, 0.110648, '1', 200),
(33, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124464, 0.101979, '1', 200),
(34, 'api/example/users/id/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496124473, 0.096652, '1', 200),
(35, 'api/example/users', 'post', 'a:3:{s:4:\"name\";s:6:\"John X\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";}', '', '127.0.0.1', 1496126084, 0.0972679, '1', 0),
(36, 'api/example/users', 'post', 'a:3:{s:4:\"name\";s:6:\"John X\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";}', '', '127.0.0.1', 1496126201, 0.242061, '1', 201),
(37, 'api/example/users', 'post', 'a:3:{s:4:\"name\";s:6:\"John X\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";}', '', '127.0.0.1', 1496126425, 0.172727, '1', 201),
(38, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126495, 0.127612, '1', 201),
(39, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126534, 0.209381, '1', 201),
(40, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126549, 0.143759, '1', 0),
(41, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126570, 0.137136, '1', 0),
(42, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126583, 0.198734, '1', 0),
(43, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126645, 0.119795, '1', 0),
(44, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126882, 0.137248, '1', 0),
(45, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496126919, 0.165653, '1', 0),
(46, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127006, 0.117209, '1', 0),
(47, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127030, 0.116015, '1', 0),
(48, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127078, 0.138249, '1', 201),
(49, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127113, 0.118997, '1', 0),
(50, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127136, 0.156057, '1', 0),
(51, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127154, 0.0992231, '1', 0),
(52, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127171, 0.170843, '1', 0),
(53, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127275, 0.117749, '1', 0),
(54, 'api/example/users', 'post', 'a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}', '', '127.0.0.1', 1496127299, 0.223043, '1', 201),
(55, 'api/example/users/22', 'delete', 'a:2:{s:2:\"id\";s:2:\"22\";s:97:\"{\r\n__\"name\":_\"John_XX\",\r\n__\"email\":_\"john@example_com\",\r\n__\"fact\":_\"Loves_coding\",\r\n__\"hobbies\":_\";a:1:{s:173:\"\r\n    {\r\n      \"id\": \"1\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"AAAA\"\r\n    },\r\n    {\r\n      \"id\": \"2\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"BBBB\"\r\n    }\r\n  \";s:0:\"\";}}', '', '127.0.0.1', 1496129185, 0.0489972, '1', 0),
(56, 'api/example/users/22', 'delete', 'a:2:{s:2:\"id\";s:2:\"22\";s:97:\"{\r\n__\"name\":_\"John_XX\",\r\n__\"email\":_\"john@example_com\",\r\n__\"fact\":_\"Loves_coding\",\r\n__\"hobbies\":_\";a:1:{s:173:\"\r\n    {\r\n      \"id\": \"1\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"AAAA\"\r\n    },\r\n    {\r\n      \"id\": \"2\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"BBBB\"\r\n    }\r\n  \";s:0:\"\";}}', '', '127.0.0.1', 1496129205, 0.194541, '1', 204),
(57, 'api/example/users/22', 'delete', 'a:2:{s:2:\"id\";s:2:\"22\";s:97:\"{\r\n__\"name\":_\"John_XX\",\r\n__\"email\":_\"john@example_com\",\r\n__\"fact\":_\"Loves_coding\",\r\n__\"hobbies\":_\";a:1:{s:173:\"\r\n    {\r\n      \"id\": \"1\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"AAAA\"\r\n    },\r\n    {\r\n      \"id\": \"2\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"BBBB\"\r\n    }\r\n  \";s:0:\"\";}}', '', '127.0.0.1', 1496129218, 0.073669, '1', 204),
(58, 'api/example/users/22', 'delete', 'a:1:{s:2:\"id\";s:2:\"22\";}', '', '127.0.0.1', 1496129260, 0.077739, '1', 204),
(59, 'api/example/users/22', 'delete', 'a:1:{s:2:\"id\";s:2:\"22\";}', '', '127.0.0.1', 1496129294, 0.085495, '1', 204),
(60, 'api/example/users/22', 'get', 'a:1:{s:2:\"id\";s:2:\"22\";}', '', '127.0.0.1', 1496129309, 0.141071, '1', 404),
(61, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496129315, 0.0739141, '1', 200),
(62, 'api/example/users/21', 'delete', 'a:1:{s:2:\"id\";s:2:\"21\";}', '', '127.0.0.1', 1496129340, 0.137978, '1', 204),
(63, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496129346, 0.071759, '1', 200),
(64, 'api/example/users/19', 'delete', 'a:1:{s:2:\"id\";s:2:\"19\";}', '', '127.0.0.1', 1496129396, 0.127202, '1', 200),
(65, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496191816, 0.076838, '1', 200),
(66, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496191887, 0.0885398, '1', 0),
(67, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496191955, 0.110837, '1', 0),
(68, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496191989, 0.241593, '1', 200),
(69, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496192013, 0.106055, '1', 200),
(70, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496192070, 0.186649, '1', 200),
(71, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496192137, 0.104844, '1', 0),
(72, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496192177, 0.133644, '1', 0),
(73, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496192189, 0.101151, '1', 0),
(74, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496192237, 0.240928, '1', 200),
(75, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496192249, 0.203525, '1', 200),
(76, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496192308, 0.0773909, '1', 200),
(77, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"9\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496192353, 0.203109, '1', 200),
(78, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496193339, 0.071697, '1', 200),
(79, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:3:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"9\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:2;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496193361, 0.113544, '1', 0),
(80, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496193426, 0.168796, '1', 200),
(81, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496193445, 0.105406, '1', 0),
(82, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496193806, 0.101265, '1', 0),
(83, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496193843, 0.128615, '1', 0),
(84, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496193884, 0.125421, '1', 0),
(85, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496193891, 0.234174, '1', 0),
(86, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496193922, 0.222062, '1', 0),
(87, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496194029, 0.178115, '1', 0),
(88, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496194060, 0.19086, '1', 0),
(89, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496194094, 0.170164, '1', 0),
(90, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}', '', '127.0.0.1', 1496195682, 0.272937, '1', 200),
(91, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496197092, 0.595644, '1', 200),
(92, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496197120, 0.096559, '1', 200),
(93, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}', '', '127.0.0.1', 1496197145, 0.517957, '1', 200),
(94, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}', '', '127.0.0.1', 1496197212, 0.191146, '1', 200),
(95, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}', '', '127.0.0.1', 1496197256, 0.114279, '1', 200),
(96, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}', '', '127.0.0.1', 1496197300, 0.135532, '1', 200),
(97, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}', '', '127.0.0.1', 1496197451, 0.435196, '1', 200),
(98, 'api/example/users/1', 'put', 'a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:3:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}i:2;a:2:{s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"EEEEECCCDDD\";}}}', '', '127.0.0.1', 1496197488, 0.229864, '1', 200),
(99, 'api/example/users/1', 'get', 'a:1:{s:2:\"id\";s:1:\"1\";}', '', '127.0.0.1', 1496199374, 0.068589, '1', 200),
(100, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496199395, 0.073669, '1', 200),
(101, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496199405, 0.0735459, '1', 200),
(102, 'api/example/users', 'get', NULL, '', '127.0.0.1', 1496993395, 0.209022, '1', 200);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `section` int(11) DEFAULT NULL,
  `nama_menu` varchar(255) CHARACTER SET latin1 NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `icons` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `status` enum('AKTIF','NON-AKTIF') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `group_id`, `section`, `nama_menu`, `url`, `icons`, `urutan`, `status`) VALUES
(1, 0, 1, 2, 'Barang', 'master/barang', 'glyphicon glyphicon-th', 1, 'AKTIF'),
(2, 0, 1, 2, 'Customers', 'master/customers', 'glyphicon glyphicon-th-list', 2, 'AKTIF'),
(3, 0, 1, 2, 'Relasi', 'master/relasi', 'glyphicon glyphicon-road', 3, 'AKTIF'),
(4, 0, 1, 3, 'Delivery Order', 'transaksi/delivery_order', 'glyphicon glyphicon-cloud', 4, 'AKTIF'),
(5, 7, 1, 3, 'Menu 5', '#', 'glyphicon glyphicon-list-alt', 1, 'AKTIF'),
(6, 7, 1, 3, 'Menu 6', '#', 'glyphicon glyphicon-barcode', 2, 'AKTIF'),
(8, 5, 1, 3, 'Menu 8', '#', 'glyphicon glyphicon-folder-close', 1, 'AKTIF'),
(9, 0, 1, 2, 'Patrun', 'master/patrun', 'glyphicon glyphicon-gift', 4, 'AKTIF'),
(10, 0, 1, 3, 'Pemenuhan Patrun', 'transaksi/pemenuhan_patrun', 'glyphicon glyphicon-list-alt', 5, 'AKTIF'),
(12, 0, 1, 2, 'IKT', 'master/ikt', 'glyphicon glyphicon-import', 5, 'AKTIF'),
(13, 0, 1, 3, 'Warping', 'transaksi/warping', 'glyphicon glyphicon-list-alt', 6, 'AKTIF'),
(14, 0, 1, 3, 'Sizing', 'transaksi/sizing', 'glyphicon glyphicon-list-alt', 7, 'AKTIF'),
(15, 0, 1, 3, 'Monitoring IKT', 'transaksi/monitoring_ikt', 'glyphicon glyphicon-list-alt', 8, 'AKTIF'),
(16, 0, 1, 3, 'Mutasi Beam', 'transaksi/mutasi_beam', 'glyphicon glyphicon-list-alt', 9, 'AKTIF');

-- --------------------------------------------------------

--
-- Table structure for table `menu_section`
--

CREATE TABLE `menu_section` (
  `id` int(11) NOT NULL,
  `nama_section` char(50) CHARACTER SET latin1 NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `icons` varchar(255) DEFAULT NULL,
  `status` enum('AKTIF','NON-AKTIF') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_section`
--

INSERT INTO `menu_section` (`id`, `nama_section`, `urutan`, `icons`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Laporan', 3, 'glyphicon glyphicon-file', 'AKTIF', '2017-11-17 08:58:36', NULL),
(2, 'Master', 1, 'glyphicon glyphicon-play-circle', 'AKTIF', '2017-11-17 08:58:32', NULL),
(3, 'Transaksi', 2, 'glyphicon glyphicon-tasks', 'AKTIF', '2017-11-17 08:58:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `misc`
--

CREATE TABLE `misc` (
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `misc`
--

INSERT INTO `misc` (`key`, `value`) VALUES
('password', 'y$ErQlCj/Mo10il.FthAm0WOjYdf3chZEGPFqaPzjqOX2aj2uYf5Ihq');

-- --------------------------------------------------------

--
-- Table structure for table `monitoring_ikt`
--

CREATE TABLE `monitoring_ikt` (
  `id` int(11) NOT NULL,
  `no_kik` varchar(255) DEFAULT NULL,
  `warping` date DEFAULT NULL,
  `jml_warping` int(11) DEFAULT NULL,
  `sizing` date DEFAULT NULL,
  `jml_sizing` int(11) DEFAULT NULL,
  `mutasi_beam` date DEFAULT NULL,
  `jml_mutasi_beam` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monitoring_ikt`
--

INSERT INTO `monitoring_ikt` (`id`, `no_kik`, `warping`, `jml_warping`, `sizing`, `jml_sizing`, `mutasi_beam`, `jml_mutasi_beam`, `created_at`, `updated_at`) VALUES
(287, 'D4K0', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-20 08:32:02', '2018-08-20 08:32:02'),
(288, 'D4K1', '2018-06-30', 8, '2018-07-02', 1, '2018-07-03', 1, '2018-08-20 08:32:03', '2018-08-20 08:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_beam`
--

CREATE TABLE `mutasi_beam` (
  `id` int(11) NOT NULL,
  `no_sj` varchar(255) DEFAULT NULL,
  `tgl_krm` date DEFAULT NULL,
  `transaksi` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `no_kik` varchar(255) DEFAULT NULL,
  `no_patrun` varchar(255) DEFAULT NULL,
  `no_beam` varchar(255) DEFAULT NULL,
  `pjg_bng` int(11) DEFAULT NULL,
  `pu` float DEFAULT NULL,
  `brt_bng` float DEFAULT NULL,
  `brt_net` float DEFAULT NULL,
  `kode1` varchar(255) DEFAULT NULL,
  `wrn_dsr` varchar(255) DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `kode_prod` varchar(255) DEFAULT NULL,
  `no_sisir` int(11) DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `cek` tinyint(1) DEFAULT NULL,
  `tgl_cek` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `entry` varchar(255) DEFAULT NULL,
  `cek1` tinyint(1) DEFAULT NULL,
  `tgl_cek1` date DEFAULT NULL,
  `password1` varchar(255) DEFAULT NULL,
  `tgl_trm` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mutasi_beam`
--

INSERT INTO `mutasi_beam` (`id`, `no_sj`, `tgl_krm`, `transaksi`, `lokasi`, `no_kik`, `no_patrun`, `no_beam`, `pjg_bng`, `pu`, `brt_bng`, `brt_net`, `kode1`, `wrn_dsr`, `motif`, `kode_prod`, `no_sisir`, `group`, `shift`, `grade`, `remark`, `cek`, `tgl_cek`, `password`, `entry`, `cek1`, `tgl_cek1`, `password1`, `tgl_trm`, `created_at`, `updated_at`) VALUES
(5, 'K004/BHS/VII/2018', '2018-07-03', 'PENERIMAAN', 'PDN', 'D4K1', '0053', '275/TS', 5670, 14.85, 537.5, 468, 'BTR05XXX374XX', 'A.V.18.A', 'ITB', 'T-43F/AJP', 74, 'A', 'S', 'B', 'PDN', 0, '2018-07-04', 'AUTO', NULL, 0, '2018-07-04', 'AUTO', '2018-07-03', '2018-08-20 08:48:42', '2018-08-20 08:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `patrun`
--

CREATE TABLE `patrun` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrun`
--

INSERT INTO `patrun` (`id`, `kode`, `tanggal`, `motif`, `created_at`, `updated_at`) VALUES
(4, 'P456', '2018-07-31', 'sadsajkdnasjkd', NULL, '2018-07-31 07:52:08'),
(5, 'P60', '2018-08-02', 'jbsjabsjhabasa', NULL, '2018-07-31 07:52:08'),
(6, 'L90', '2018-07-12', 'nbmblkjlkj', NULL, '2018-07-31 07:52:08'),
(7, 'P56', '2018-08-16', 'ADASDSA', '2018-08-16 11:26:47', '2018-08-16 11:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `pemenuhan_patrun`
--

CREATE TABLE `pemenuhan_patrun` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nomor_do` varchar(255) DEFAULT NULL,
  `kode_relasi` varchar(255) DEFAULT NULL,
  `nama_relasi` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemenuhan_patrun`
--

INSERT INTO `pemenuhan_patrun` (`id`, `tanggal`, `nomor_do`, `kode_relasi`, `nama_relasi`, `created_at`, `updated_at`) VALUES
(2, '2018-07-31', '657', 'C345', 'kainku', NULL, '2018-07-31 07:54:31'),
(3, '2018-07-31', '76787', 'QW12', 'benang super', '2018-07-31 08:30:01', '2018-07-31 08:30:13'),
(4, '2018-08-01', '98787', 'C345', 'kainku', '2018-08-16 11:31:52', '2018-08-16 11:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `relasi`
--

CREATE TABLE `relasi` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relasi`
--

INSERT INTO `relasi` (`id`, `kode`, `nama`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'C345', 'kainku', 'jakarta', NULL, NULL),
(2, 'QW12', 'benang super', 'Surabaya', NULL, NULL),
(3, 'C5161', 'sarung', 'Gresikk', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizing`
--

CREATE TABLE `sizing` (
  `id` int(11) NOT NULL,
  `tgl_inp` date DEFAULT NULL,
  `prs_date` date DEFAULT NULL,
  `btau` varchar(255) DEFAULT NULL,
  `tgl_btau` date DEFAULT NULL,
  `no_btau` varchar(255) DEFAULT NULL,
  `no_kik` varchar(255) DEFAULT NULL,
  `no_patrun` varchar(255) DEFAULT NULL,
  `kode_prod` varchar(255) DEFAULT NULL,
  `pjg_bng` int(11) DEFAULT NULL,
  `jml_bng` int(11) DEFAULT NULL,
  `brt_bng` float DEFAULT NULL,
  `brt_bngx` float DEFAULT NULL,
  `bef_kanji` float DEFAULT NULL,
  `aft_kanji` float DEFAULT NULL,
  `bngkr_stfn` varchar(255) DEFAULT NULL,
  `bongkar_lm` int(11) DEFAULT NULL,
  `cucuk_stfn` varchar(255) DEFAULT NULL,
  `cucuk_lm` int(11) DEFAULT NULL,
  `kode_pbl1` varchar(255) DEFAULT NULL,
  `kode_pbl2` varchar(255) DEFAULT NULL,
  `kode_pbl3` varchar(255) DEFAULT NULL,
  `pbl1_stfn` varchar(255) DEFAULT NULL,
  `pbl1_lm` int(11) DEFAULT NULL,
  `pbl2_stfn` varchar(255) DEFAULT NULL,
  `pbl2_lm` int(11) DEFAULT NULL,
  `pbl3_stfn` varchar(255) DEFAULT NULL,
  `pbl3_lm` int(11) DEFAULT NULL,
  `kode_msn` varchar(255) DEFAULT NULL,
  `op_code1` int(11) DEFAULT NULL,
  `op_sft1` varchar(255) DEFAULT NULL,
  `op_grp1` varchar(255) DEFAULT NULL,
  `op_code2` int(11) DEFAULT NULL,
  `op_sft2` varchar(255) DEFAULT NULL,
  `op_grp2` varchar(255) DEFAULT NULL,
  `op_code3` int(11) DEFAULT NULL,
  `op_sft3` varchar(255) DEFAULT NULL,
  `op_grp3` varchar(255) DEFAULT NULL,
  `op_code4` int(11) DEFAULT NULL,
  `op_sft4` varchar(255) DEFAULT NULL,
  `op_grp4` varchar(255) DEFAULT NULL,
  `no_bng` varchar(255) DEFAULT NULL,
  `no_beam` varchar(255) DEFAULT NULL,
  `produksi` int(11) DEFAULT NULL,
  `wkt_stfn` varchar(255) DEFAULT NULL,
  `wkt_lm` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `dryroom` varchar(255) DEFAULT NULL,
  `sizebox` int(11) DEFAULT NULL,
  `pressroll` float DEFAULT NULL,
  `visco_123` varchar(255) DEFAULT NULL,
  `konsen_123` varchar(255) DEFAULT NULL,
  `bruto` float DEFAULT NULL,
  `kosong` float DEFAULT NULL,
  `netto` float DEFAULT NULL,
  `pjg_100` float DEFAULT NULL,
  `pjg_scr` int(11) DEFAULT NULL,
  `brt_100` float DEFAULT NULL,
  `brt_scr` int(11) DEFAULT NULL,
  `lapping_hl` int(11) DEFAULT NULL,
  `lapping_sc` int(11) DEFAULT NULL,
  `ambrol_hl` int(11) DEFAULT NULL,
  `ambrol_sc` int(11) DEFAULT NULL,
  `corak_100` float DEFAULT NULL,
  `corak_sc` int(11) DEFAULT NULL,
  `total_sc` int(11) DEFAULT NULL,
  `total_grd` varchar(255) DEFAULT NULL,
  `netto_warp` float DEFAULT NULL,
  `no_skir` varchar(255) DEFAULT NULL,
  `sisa` float DEFAULT NULL,
  `a` int(11) DEFAULT NULL,
  `b` int(11) DEFAULT NULL,
  `c` int(11) DEFAULT NULL,
  `n` int(11) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `cek` tinyint(1) DEFAULT NULL,
  `tgl_cek` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `entry` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cek1` tinyint(1) DEFAULT NULL,
  `tgl_cek1` date DEFAULT NULL,
  `password1` varchar(255) DEFAULT NULL,
  `krm` varchar(255) DEFAULT NULL,
  `tgl_krm` date DEFAULT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `no_sj` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `no_kend` varchar(255) DEFAULT NULL,
  `kendaraan` varchar(255) DEFAULT NULL,
  `gramasi` float DEFAULT NULL,
  `spu` float DEFAULT NULL,
  `kg_teori` float DEFAULT NULL,
  `std` float DEFAULT NULL,
  `jns_beam` varchar(255) DEFAULT NULL,
  `tgl_retur` date DEFAULT NULL,
  `no_retur` varchar(255) DEFAULT NULL,
  `id_retur` varchar(255) DEFAULT NULL,
  `id_gabung` varchar(255) DEFAULT NULL,
  `tgl_trm` date DEFAULT NULL,
  `xwaste` float DEFAULT NULL,
  `xsize_mr` float DEFAULT NULL,
  `xnon_size` float DEFAULT NULL,
  `xspu` float DEFAULT NULL,
  `tmp_size` float DEFAULT NULL,
  `tmp_non` float DEFAULT NULL,
  `tmp_spu` float DEFAULT NULL,
  `cetak` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sizing`
--

INSERT INTO `sizing` (`id`, `tgl_inp`, `prs_date`, `btau`, `tgl_btau`, `no_btau`, `no_kik`, `no_patrun`, `kode_prod`, `pjg_bng`, `jml_bng`, `brt_bng`, `brt_bngx`, `bef_kanji`, `aft_kanji`, `bngkr_stfn`, `bongkar_lm`, `cucuk_stfn`, `cucuk_lm`, `kode_pbl1`, `kode_pbl2`, `kode_pbl3`, `pbl1_stfn`, `pbl1_lm`, `pbl2_stfn`, `pbl2_lm`, `pbl3_stfn`, `pbl3_lm`, `kode_msn`, `op_code1`, `op_sft1`, `op_grp1`, `op_code2`, `op_sft2`, `op_grp2`, `op_code3`, `op_sft3`, `op_grp3`, `op_code4`, `op_sft4`, `op_grp4`, `no_bng`, `no_beam`, `produksi`, `wkt_stfn`, `wkt_lm`, `speed`, `dryroom`, `sizebox`, `pressroll`, `visco_123`, `konsen_123`, `bruto`, `kosong`, `netto`, `pjg_100`, `pjg_scr`, `brt_100`, `brt_scr`, `lapping_hl`, `lapping_sc`, `ambrol_hl`, `ambrol_sc`, `corak_100`, `corak_sc`, `total_sc`, `total_grd`, `netto_warp`, `no_skir`, `sisa`, `a`, `b`, `c`, `n`, `flag`, `cek`, `tgl_cek`, `password`, `entry`, `status`, `cek1`, `tgl_cek1`, `password1`, `krm`, `tgl_krm`, `tujuan`, `no_sj`, `keterangan`, `no_kend`, `kendaraan`, `gramasi`, `spu`, `kg_teori`, `std`, `jns_beam`, `tgl_retur`, `no_retur`, `id_retur`, `id_gabung`, `tgl_trm`, `xwaste`, `xsize_mr`, `xnon_size`, `xspu`, `tmp_size`, `tmp_non`, `tmp_spu`, `cetak`, `created_at`, `updated_at`) VALUES
(15, '2018-07-03', '2018-07-02', '.', '2018-07-02', '0002/PREP/VII/2018', 'D4K1', '0053', 'T-43F/AJP', 5500, 4064, 470.4, 0, 0, 2.4, NULL, 0, NULL, 0, 'C3', NULL, NULL, '14:00|14:30', 30, NULL, 0, NULL, 0, 'SZ02', 1418, 'S', 'A', 1407, 'S', 'A', 1231, 'S', 'A', NULL, NULL, NULL, 'TR Ne 30\'S', '275/TS', 5670, '14:30|17:30', 180, 60, '110  |120  |120', 80, 2.4, '22 |22 |22', '9  |9  |9', 704.1, 182.2, 521.9, 76.99, 3, 10.38, 3, 6, 3, 0, 7, 95, 3, 13, 'B', 0, NULL, 0, 5670, 0, 0, 0, 0, 0, '2018-08-03', 'LINA', 'LINA', NULL, 0, '2018-08-03', 'LINA', '.', '2018-07-03', 'PT. BEHAESTEX-CAB', 'K004/BHS/VII/2018', NULL, 'W 8215 L', 'BOX', 0, 0, 0, 0, 'BK', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2018-08-20 08:49:08', '2018-08-20 08:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_login` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `is_login`, `last_ip`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$G0h47xFzvBDD3DjwWD13XeCfwGuZgqtSodh5ARhDJLLWPRv0jSgfG', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1535090851, 1, 'Administrator', '', 'ADMIN', '0', 1, '::1'),
(2, '172.17.0.1', 'coba@coba.com', '$2y$08$uGrWVA6PAMqe.5nbGjBpvufetRdq24dM/3rRE5XbJVxyaLYXE3LYa', NULL, 'coba@coba.com', NULL, NULL, NULL, NULL, 1503046181, 1503047865, 1, 'coba', 'coba', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `warping`
--

CREATE TABLE `warping` (
  `id` int(11) NOT NULL,
  `tgl_inp` date DEFAULT NULL,
  `prs_date` date DEFAULT NULL,
  `no_kik` varchar(255) DEFAULT NULL,
  `no_patrun` varchar(255) DEFAULT NULL,
  `jns_beam` varchar(255) DEFAULT NULL,
  `kode_msn` varchar(255) DEFAULT NULL,
  `no_beam` varchar(255) DEFAULT NULL,
  `jml_bng` int(11) DEFAULT NULL,
  `waste` float DEFAULT NULL,
  `pjg_bng` int(11) DEFAULT NULL,
  `kode_prod` varchar(255) DEFAULT NULL,
  `bngkr_stfn` varchar(255) DEFAULT NULL,
  `bongkar_lm` int(11) DEFAULT NULL,
  `corak_stfn` varchar(255) DEFAULT NULL,
  `corak_lm` int(11) DEFAULT NULL,
  `wkt_stfn` varchar(255) DEFAULT NULL,
  `wkt_lm` int(11) DEFAULT NULL,
  `lain_stfn` varchar(255) DEFAULT NULL,
  `lain_lm` int(11) DEFAULT NULL,
  `prod_stfn` varchar(255) DEFAULT NULL,
  `prod_lm` int(11) DEFAULT NULL,
  `pbl1_stfn` varchar(255) DEFAULT NULL,
  `pbl1_lm` int(11) DEFAULT NULL,
  `pbl2_stfn` varchar(255) DEFAULT NULL,
  `pbl2_lm` int(11) DEFAULT NULL,
  `pbl3_stfn` varchar(255) DEFAULT NULL,
  `pbl3_lm` int(11) DEFAULT NULL,
  `brt_kosong` float DEFAULT NULL,
  `brt_benang` float DEFAULT NULL,
  `netto` float DEFAULT NULL,
  `pts_yard` float DEFAULT NULL,
  `pts_tot` int(11) DEFAULT NULL,
  `op_grp1` varchar(255) DEFAULT NULL,
  `op_sft1` varchar(255) DEFAULT NULL,
  `op_code1` int(11) DEFAULT NULL,
  `op_code2` int(11) DEFAULT NULL,
  `op_grp2` varchar(255) DEFAULT NULL,
  `op_sft2` varchar(255) DEFAULT NULL,
  `op_code3` int(11) DEFAULT NULL,
  `op_grp3` varchar(255) DEFAULT NULL,
  `op_sft3` varchar(255) DEFAULT NULL,
  `kode_pbl1` varchar(255) DEFAULT NULL,
  `kode_pbl2` varchar(255) DEFAULT NULL,
  `kode_pbl3` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `cek` tinyint(1) DEFAULT NULL,
  `tgl_cek` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `entry` varchar(255) DEFAULT NULL,
  `cek1` tinyint(1) DEFAULT NULL,
  `tgl_cek1` date DEFAULT NULL,
  `password1` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warping`
--

INSERT INTO `warping` (`id`, `tgl_inp`, `prs_date`, `no_kik`, `no_patrun`, `jns_beam`, `kode_msn`, `no_beam`, `jml_bng`, `waste`, `pjg_bng`, `kode_prod`, `bngkr_stfn`, `bongkar_lm`, `corak_stfn`, `corak_lm`, `wkt_stfn`, `wkt_lm`, `lain_stfn`, `lain_lm`, `prod_stfn`, `prod_lm`, `pbl1_stfn`, `pbl1_lm`, `pbl2_stfn`, `pbl2_lm`, `pbl3_stfn`, `pbl3_lm`, `brt_kosong`, `brt_benang`, `netto`, `pts_yard`, `pts_tot`, `op_grp1`, `op_sft1`, `op_code1`, `op_code2`, `op_grp2`, `op_sft2`, `op_code3`, `op_grp3`, `op_sft3`, `kode_pbl1`, `kode_pbl2`, `kode_pbl3`, `flag`, `cek`, `tgl_cek`, `password`, `entry`, `cek1`, `tgl_cek1`, `password1`, `created_at`, `updated_at`) VALUES
(33, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '61', 4064, 0, 5500, 'T-43F/AJP', NULL, 0, NULL, 0, '08:50|09:30', 40, NULL, 0, '0     |5500', 5500, '02:00|04:00', 120, NULL, 0, NULL, 0, 42, 101, 59, 2.618, 8, 'B', 'P', 1806, NULL, NULL, NULL, NULL, NULL, NULL, 'C3', NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:06', '2018-08-20 08:48:06'),
(34, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '88', 4064, 0, 5500, 'T-43F/AJP', '09:30|09:45', 15, '09:45|10:00', 15, '10:00|10:30', 30, NULL, 0, '0     |5500', 5500, NULL, 0, NULL, 0, NULL, 0, 41.2, 100, 58.8, 1.636, 5, 'B', 'P', 1806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:07', '2018-08-20 08:48:07'),
(35, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '12.', 4064, 0, 5500, 'T-43F/AJP', NULL, 0, NULL, 0, '10:30|11:00', 30, NULL, 0, '0     |5500', 5500, NULL, 0, NULL, 0, NULL, 0, 41.6, 100.4, 58.8, 1.964, 6, 'B', 'P', 1806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:07', '2018-08-20 08:48:07'),
(36, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '147', 4064, 0, 5500, 'T-43F/AJP', '15:00|15:30', 30, NULL, 0, '15:30|16:00', 30, NULL, 0, '0     |5500', 5500, NULL, 0, NULL, 0, NULL, 0, 41.1, 99.8, 58.7, 2.291, 7, 'C', 'S', 1549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:07', '2018-08-20 08:48:07'),
(37, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '43', 4064, 0, 5500, 'T-43F/AJP', '14:00|14:30', 30, '13:40|14:00', 20, '14:30|15:00', 30, NULL, 0, '0     |5500', 5500, NULL, 0, NULL, 0, NULL, 0, 41.3, 100, 58.7, 3.6, 11, 'C', 'S', 1549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:07', '2018-08-20 08:48:07'),
(38, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '104', 4064, 0, 5500, 'T-43F/AJP', NULL, 0, NULL, 0, '13:10|13:40', 30, NULL, 0, '0     |5500', 5500, '02:00|04:00', 120, NULL, 0, NULL, 0, 41.8, 100.4, 58.6, 1.964, 6, 'C', 'S', 1549, NULL, NULL, NULL, NULL, NULL, NULL, 'C3', NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:07', '2018-08-20 08:48:07'),
(39, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '11.', 4064, 0, 5500, 'T-43F/AJP', NULL, 0, '11:00|11:30', 30, '12:30|13:10', 40, NULL, 0, '0     |5500', 5500, NULL, 0, NULL, 0, NULL, 0, 41.8, 100.3, 58.5, 2.945, 9, 'C', 'S', 1549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:07', '2018-08-20 08:48:07'),
(40, '2018-07-02', '2018-06-30', 'D4K1', '0053', 'BK', 'WP01', '4.', 4064, 0, 5500, 'T-43F/AJP', NULL, 0, NULL, 0, '04:00|05:00', 60, NULL, 0, '0     |5500', 5500, NULL, 0, NULL, 0, NULL, 0, 41.4, 100.7, 59.3, 6.218, 19, 'C', 'S', 1549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-07-06', 'OTO_AKT', 'LINA', 0, NULL, NULL, '2018-08-20 08:48:07', '2018-08-20 08:48:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_order`
--
ALTER TABLE `delivery_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_ikt`
--
ALTER TABLE `detail_ikt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_patrun`
--
ALTER TABLE `detail_patrun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pemenuhan_patrun`
--
ALTER TABLE `detail_pemenuhan_patrun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ikt`
--
ALTER TABLE `ikt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `menu_section`
--
ALTER TABLE `menu_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monitoring_ikt`
--
ALTER TABLE `monitoring_ikt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_beam`
--
ALTER TABLE `mutasi_beam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patrun`
--
ALTER TABLE `patrun`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pemenuhan_patrun`
--
ALTER TABLE `pemenuhan_patrun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `sizing`
--
ALTER TABLE `sizing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `warping`
--
ALTER TABLE `warping`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `delivery_order`
--
ALTER TABLE `delivery_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_barang`
--
ALTER TABLE `detail_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `detail_ikt`
--
ALTER TABLE `detail_ikt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1615;

--
-- AUTO_INCREMENT for table `detail_patrun`
--
ALTER TABLE `detail_patrun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `detail_pemenuhan_patrun`
--
ALTER TABLE `detail_pemenuhan_patrun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ikt`
--
ALTER TABLE `ikt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `menu_section`
--
ALTER TABLE `menu_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `monitoring_ikt`
--
ALTER TABLE `monitoring_ikt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `mutasi_beam`
--
ALTER TABLE `mutasi_beam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patrun`
--
ALTER TABLE `patrun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pemenuhan_patrun`
--
ALTER TABLE `pemenuhan_patrun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizing`
--
ALTER TABLE `sizing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warping`
--
ALTER TABLE `warping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`section`) REFERENCES `menu_section` (`id`);

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
