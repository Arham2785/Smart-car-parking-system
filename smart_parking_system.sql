-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2025 at 01:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart parking system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bicycle_parking`
--

CREATE TABLE `bicycle_parking` (
  `bicycle_number` varchar(255) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `parking_slot` int(13) NOT NULL,
  `package` varchar(50) NOT NULL,
  `status` enum('available','reserved','occupied','') NOT NULL DEFAULT 'available',
  `payment_method` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `entry_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bicycle_parking`
--

INSERT INTO `bicycle_parking` (`bicycle_number`, `owner_name`, `parking_slot`, `package`, `status`, `payment_method`, `phone_number`, `entry_time`) VALUES
('123qaz', 'shan', 6, '', 'available', '', '', '2025-03-25 14:41:25'),
('', 'seg', 3, '', 'available', '', '', '2025-03-27 12:04:45'),
('', 'saqi', 0, '', 'available', '', '', '2025-03-27 15:55:19'),
('12qa45ed6', 'assad', 2, '', 'available', '', '', '2025-03-28 15:41:57'),
('', 'si', 2, '', 'reserved', '', '', '2025-04-12 02:57:34'),
('abgujiko345', 'atif', 6, '', 'occupied', '', '', '2025-04-12 03:08:31'),
('AMW3456', 'e.g', 9, '', 'occupied', '', '', '2025-04-12 03:19:43'),
('last ba exam b k 34', 'lastk', 7, '', 'occupied', '', '', '2025-04-12 04:30:16'),
('exai2', 'kho', 4, '', 'occupied', '', '', '2025-04-13 02:08:22'),
('fo example with bic', 'ali for', 10, '', 'occupied', '', '', '2025-04-14 06:57:51'),
('AMW3456', 'awais', 60, '', 'occupied', '', '', '2025-04-16 23:58:01'),
('king example f bie3456', 'sahanthuji', 1, '', 'occupied', '', '', '2025-04-21 00:02:43'),
('e.gblt', 'ailmwi', 11, 'per_year', 'reserved', '', '', '2025-04-24 07:24:47'),
('millwali cycle', 'atifali', 12, 'per_year', 'occupied', '', '', '2025-04-24 07:37:31'),
('kkkddsk34567', 'score', 17, 'per_year', 'occupied', '', '', '2025-04-24 08:34:21'),
('ftghu8790ok', 'qacvb', 19, 'per_day', 'occupied', '', '', '2025-04-24 09:09:05'),
('subahtrybicycle', 'RHS', 20, 'per_week', 'occupied', '', '', '2025-04-24 20:25:07'),
('lSTIK2345', 'aliqaz', 22, 'per_week', 'occupied', '', '', '2025-04-29 02:09:16'),
('abcd1234mek4', 'kings haiderali', 23, 'per_month', 'occupied', '', '', '2025-04-30 23:57:50'),
('abchekraddkrrkcp2345abcd', 'kingo saud haider45', 5, 'per_month', 'occupied', 'nayapay', '03114586078', '2025-05-08 12:16:30'),
('Boghatti4567', 'bill gates', 8, 'per_month', 'occupied', 'nayapay', '03224567894', '2025-05-08 13:30:11'),
('RESERSLFOBILB345', 'ali gafoor and shan', 13, 'per_day', 'occupied', 'nayapay', '03114576893', '2025-05-09 20:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `car_parking`
--

CREATE TABLE `car_parking` (
  `car_number` varchar(20) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `parking_slot` int(11) NOT NULL,
  `package` varchar(50) NOT NULL,
  `status` enum('available','reserved','occupied','') DEFAULT 'available',
  `payment_method` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `entry_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_parking`
--

INSERT INTO `car_parking` (`car_number`, `owner_name`, `parking_slot`, `package`, `status`, `payment_method`, `phone_number`, `entry_time`) VALUES
('alo134', 'ali arham', 1, '', 'available', '0', '0', '2025-03-25 14:40:14'),
('1122ab', 'amm', 1, '', 'available', '0', '0', '2025-03-25 15:07:56'),
('1234236ab', 'qlod', 0, '', 'reserved', '0', '0', '2025-03-27 15:42:04'),
('fv43yh', '3ab', 3, '', 'reserved', '0', '0', '2025-03-27 14:12:09'),
('fv43yh', '3ab', 3, '', 'reserved', '0', '0', '2025-03-27 14:12:09'),
('123455', 'so', 5, '', 'reserved', '0', '0', '2025-03-27 13:24:23'),
('123455', 'so', 5, '', 'reserved', '0', '0', '2025-03-27 13:24:23'),
('', 'saqi', 0, '', 'available', '0', '0', '2025-03-27 15:56:13'),
('', 'saqi', 0, '', 'available', '0', '0', '2025-03-27 15:56:16'),
('qa3456rtb', 'saqi', 0, '', 'available', '0', '0', '2025-03-27 15:56:48'),
('yahuhr43', 'mua', 0, '', 'available', '0', '0', '2025-03-27 16:06:20'),
('che34j0olm', 'zubair', 5, '', 'occupied', '0', '0', '2025-03-28 04:11:52'),
('av56ne78mo0aq', 'atom', 7, '', 'occupied', '0', '0', '2025-03-28 04:37:02'),
('ncakcm4', 'aefnko', 2, '', 'reserved', '0', '0', '2025-03-28 12:46:54'),
('ncakcm4', 'aefnko', 2, '', 'reserved', '0', '0', '2025-03-28 12:49:39'),
('awni2ol4', '23ali', 2, '', 'available', '0', '0', '2025-03-28 15:40:58'),
('chelabar23', 'aa', 1, '', 'available', '0', '0', '2025-03-29 02:30:15'),
('4769qva4', 'aliawjko', 4, '', 'available', '0', '0', '2025-04-11 03:17:26'),
('ee.g345t', 'saaho', 10, '', 'occupied', '0', '0', '2025-04-11 03:36:53'),
('examp2345', 'khosa', 4, '', 'occupied', '0', '0', '2025-04-12 02:15:18'),
('BMWag3', 'ali arham king', 1, '', 'occupied', '0', '0', '2025-04-12 03:17:37'),
('exa12i2t', 'kingq', 11, '', 'occupied', '0', '0', '2025-04-13 02:05:28'),
('ebsiq45', 'ali seco t f c ', 6, '', 'occupied', '0', '0', '2025-04-14 06:54:25'),
('evy3456', 'aliarham', 12, '', 'occupied', '0', '0', '2025-04-15 01:01:23'),
('millwalicar', 'kingo', 13, 'per_week', 'reserved', '0', '0', '2025-04-24 07:36:00'),
('last time checkcar', 'haider', 14, 'per_month', 'occupied', '0', '0', '2025-04-24 08:02:03'),
('carnumber43215', 'sikan', 15, 'per_month', 'occupied', '0', '0', '2025-04-24 08:13:27'),
('theekkrkycarch', 'haider', 17, 'per_week', 'occupied', '0', '0', '2025-04-24 08:30:25'),
('qaedrf5432', 'atif ibrahim', 18, 'per_year', 'reserved', '0', '0', '2025-04-24 08:46:07'),
('ackmlo3245', 'aliawjkoolpwali', 19, 'per_year', 'reserved', '0', '0', '2025-04-24 09:06:59'),
('latithkrky', 'T.V', 20, 'per_week', 'occupied', '0', '0', '2025-04-24 20:47:31'),
('trylastimecarwith', 'baloch haider djf', 21, 'per_week', 'occupied', '0', '0', '2025-04-25 08:06:25'),
('lastbartrycar', 'john', 22, 'per_week', 'occupied', '0', '0', '2025-04-29 01:56:49'),
('12qaws34edfkkfv', 'atif chaudhary', 23, 'per_year', 'occupied', '0', '0', '2025-05-02 12:35:38'),
('PLCLB', 'aloiskimhds', 24, 'per_month', 'occupied', '0', '0', '2025-05-03 01:26:33'),
('PSL QUEvsISL', 'kingo saud', 25, 'per_day', 'reserved', '0', '0', '2025-05-03 22:53:20'),
('psl lktfccss', 'fakhars', 26, 'per_day', 'reserved', '0', '0', '2025-05-04 16:03:29'),
('psl lktfccsstr', 'fakhar haiders', 27, 'per_year', 'reserved', '0', '0', '2025-05-04 16:04:07'),
('psl lktfccsstrPFCRY', 'fakhars wa ertttyhbc', 28, 'per_year', 'reserved', '0', '0', '2025-05-04 16:27:53'),
('PSL QUEvsISLlose34bu', 'warner486', 29, 'per_month', 'reserved', '0', '0', '2025-05-06 21:31:25'),
('abchkrcsy3456', 'ali mumtaz, shan', 9, 'per_year', 'occupied', '0', '0', '2025-05-06 22:45:41'),
('pslchkrhacsl2addd', 'sanze school', 8, 'per_year', 'occupied', '0', '0', '2025-05-06 22:55:09'),
('abchkrcsy3456arotim3', 'shaheen mumtaz23', 30, 'per_week', 'occupied', 'jazzcash', '03116789485', '2025-05-07 18:28:34'),
('BMW123456les', 'slots', 16, 'per_year', 'occupied', 'easypaisa', '0321456894', '2025-05-08 11:51:58'),
('BMW123456lesyh678les', 'rajab', 31, 'per_day', 'occupied', 'easypaisa', '03214321903', '2025-05-08 13:34:53'),
('RESERSLFOBILB34567', 'ali gafoor and shan2', 32, 'per_day', 'occupied', 'easypaisa', '03112178934', '2025-05-09 20:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `contact_admin`
--

CREATE TABLE `contact_admin` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_admin`
--

INSERT INTO `contact_admin` (`name`, `email`, `message`, `submitted_at`) VALUES
('ali', 'aliarhamtt5@gnmai.com', 'i want you to ask question', '2025-04-11 11:18:09'),
('Score', 'sctyuio1122@gmail.com', 'This is safe parking or not?\r\n', '2025-04-12 09:16:57'),
('ali for bicycle parking system', 'c13ustom56graphics@gmail.com', 'is it safe', '2025-04-12 10:13:37'),
('for example atif e.g', 'sikandh23@gmail.com', 'it ubnd futi sem', '2025-04-12 10:18:44'),
('wsd', 'c13ustom56graphics@gmail.com', 'wwswsfdrgyhjuill;p0', '2025-04-12 10:26:01'),
('ali khan for motorcycle e.g', 'sikandh23@gmail.com', 'rytrikmz sajud dye b xhssh safe', '2025-04-12 10:58:23'),
('ali khan 2 form truck example', 'aliarhamtt5@gnmai.com', 'wsnhjlo ffu sjha sa fttmmvkosxskw skjxkkxd safe', '2025-04-12 11:23:14'),
('for motorcycle', 'secondday34@gmail.com', 'Send Message', '2025-04-14 13:52:38'),
('Third time fo t', 'sadjhkshakjhkhsjk@gmail.com', 'fvb nmkooedxxaqw fmfkfk emekdk', '2025-04-14 13:55:47'),
('ali arham', 'c13ustom56graphics@gmail.com', 'i want to say something', '2025-04-15 08:06:49'),
('ali shan', 'sikandh23@gmail.com', 'i want to sa y s a u n i mijhghgfd es wqqadftyhjikkloop;pjhhfv', '2025-04-17 13:46:25'),
('alie.g fo motor', 'sctyuio1122@gmail.com', 'i weany tin  daAE HYTB NJHFD DSSA DSSSD VFFgvgbhji bggg', '2025-04-21 06:59:33'),
('ali shan example for bicycle seco t', 'sikandh23@gmail.com', 'I want to use something dtbhyyk,l nhuytfxz bdqqx ', '2025-04-21 07:04:06'),
('trywithmotorlastime', 'mumtazahmed@gmail.com', 'i nwamt to sa fjri,w socnmwe dfjfjf ', '2025-04-25 15:05:37'),
('mypersobbw2u', 'aehanmady34@gmail.com', 'eeodnc chhsus w2774902b dhdhuxu83  dhuxuzs shsuxux bsh\r\n', '2025-05-02 20:25:15'),
('ali last bar check', 'hanmady345678@gmail.com', 'I want to write something please and measure', '2025-05-08 06:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `motorcycle_parking`
--

CREATE TABLE `motorcycle_parking` (
  `motorcycle_number` varchar(40) NOT NULL,
  `owner_name` varchar(40) NOT NULL,
  `parking_slot` int(11) NOT NULL,
  `package` varchar(50) NOT NULL,
  `status` enum('available','reserved','occupied','') NOT NULL DEFAULT 'available',
  `payment_method` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `entry_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motorcycle_parking`
--

INSERT INTO `motorcycle_parking` (`motorcycle_number`, `owner_name`, `parking_slot`, `package`, `status`, `payment_method`, `phone_number`, `entry_time`) VALUES
('evy123', 'at', 5, '', 'available', '', '', '2025-03-25 14:39:37'),
('1345aqs', 'ali khan', 4, '', 'occupied', '', '', '2025-04-12 03:56:27'),
('example23i2t', 'm,al', 5, '', 'occupied', '', '', '2025-04-13 02:03:09'),
('hayryr4', 'aloiir', 8, '', 'occupied', '', '', '2025-04-14 02:12:09'),
('yester', 'school', 6, '', 'occupied', '', '', '2025-04-14 06:51:13'),
('for ex d g h 324', 'ali king for drama', 18, '', 'occupied', '', '', '2025-04-20 23:57:51'),
('aqwsed', 'ali gujar4', 9, 'per_day', 'occupied', '', '', '2025-04-24 06:43:31'),
('E.gcar1lt', 'aloyt', 10, 'per_month', 'reserved', '', '', '2025-04-24 07:21:58'),
('1345aqsui', 'ismail', 11, 'per_year', 'reserved', '', '', '2025-04-24 07:28:48'),
('Millwalamotor', 'rana', 12, 'per_day', 'occupied', '', '', '2025-04-24 07:34:22'),
('wsacvbn45678', 'ali T.D', 14, 'per_day', 'occupied', '', '', '2025-04-24 08:09:41'),
('theekkrrkymock', 'josp', 17, 'per_day', 'occupied', '', '', '2025-04-24 08:28:25'),
('subahtrymotor', 'ISMAILHAIDER', 20, 'per_year', 'occupied', '', '', '2025-04-24 20:26:54'),
('TRYmotorLATI', 'atif hussain', 21, 'per_day', 'occupied', '', '', '2025-04-25 08:03:21'),
('lastbartry', 'jones', 22, 'per_month', 'occupied', '', '', '2025-04-29 01:55:34'),
('P L T M', 'aliperson', 24, 'per_month', 'occupied', '', '', '2025-05-03 01:23:44'),
('psl kvslwithmch', 'shaheen', 1, 'per_year', 'reserved', '', '', '2025-05-03 23:05:02'),
('psllktfmotor', 'fakhar', 25, 'per_month', 'occupied', '', '', '2025-05-04 11:54:41'),
('aneeshaider45906lestes', 'slotnew withaligujjar', 0, 'per_year', 'occupied', 'easypaisa', '0314586790', '2025-05-08 13:53:35'),
('RESERSLFMLT121234567', 'ali gafoor and shan456721', 2, 'per_year', 'occupied', 'jazzcash', '0345678932', '2025-05-09 20:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `truck_parking`
--

CREATE TABLE `truck_parking` (
  `truck_number` varchar(30) NOT NULL,
  `owner_name` varchar(30) NOT NULL,
  `parking_slot` int(11) NOT NULL,
  `package` varchar(50) NOT NULL,
  `status` enum('available','reserved','occupied','') NOT NULL DEFAULT 'available',
  `payment_method` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `entry_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `truck_parking`
--

INSERT INTO `truck_parking` (`truck_number`, `owner_name`, `parking_slot`, `package`, `status`, `payment_method`, `phone_number`, `entry_time`) VALUES
('134rfikbn', 'abdul', 10, '', 'available', '', '', '2025-03-25 14:40:44'),
('4567ynim', 'shan 3', 1, '', 'occupied', '', '', '2025-04-12 04:21:23'),
('exai2t', 'practise', 2, '', 'occupied', '', '', '2025-04-13 02:07:02'),
('jaunw213', 'ali shan', 4, '', 'reserved', '', '', '2025-04-16 23:33:44'),
('e.g 2 l t tru', 'alo', 11, 'per_month', 'reserved', '', '', '2025-04-24 07:27:48'),
('millwalitruck', 'isma', 12, 'per_month', 'reserved', '', '', '2025-04-24 07:36:50'),
('wneytuo3456', 'alokin', 14, 'per_year', 'reserved', '', '', '2025-04-24 08:16:29'),
('trudmillwalloijcd43', 'kingoqw', 17, 'per_year', 'occupied', '', '', '2025-04-24 08:32:50'),
('subahtrytruck', 'atif chaudhary', 20, 'per_month', 'occupied', '', '', '2025-04-24 20:28:37'),
('lastbartrytruck', 'jonwichk', 22, 'per_day', 'occupied', '', '', '2025-04-29 02:07:33'),
('rajabcarjahaz3456tb6uscore', 'laptopalihp', 0, 'per_day', 'occupied', 'jazzcash', '03040493847', '2025-05-08 13:46:44'),
('RESERSLFtlt3456MLT', 'ali gafoor and shan2345', 3, 'per_day', 'occupied', 'jazzcash', '0345678942', '2025-05-09 20:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `user data`
--

CREATE TABLE `user data` (
  `username` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  `confirm_password` varchar(30) NOT NULL,
  `profile_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user data`
--

INSERT INTO `user data` (`username`, `email`, `phone_number`, `password`, `confirm_password`, `profile_image`) VALUES
('arham', 'arham38eb@gmail.com', 2147483647, '1234567890', '1234567890', ''),
('alopkm', 'sctyuio1122@gmail.com', 2147483647, '123456789', '123456789', ''),
('exampl.e 1', 'exampkle34wt@gmail.com', 2147483647, '123456789AVi', '123456789AVi', ''),
('univer', 'univers45@gmail.com', 2147483647, '123456789uni', '123456789uni', ''),
('Secoda', 'secondday34@gmail.com', 2147483647, '1234567890abpmw', '1234567890abpmw', ''),
('ali ', 'ali12@gmail.com', 2147483647, '1234567890', '1234567890', ''),
('exfcsigpho', 'exfcsigpho@gmail.com', 2147483647, 'avbnhu1234', 'avbnhu1234', ''),
('egyhujikolp', 'egyhujikolp@gmail.com', 2147483647, '12345678909876', '12345678909876', ''),
('e.g gbka', 'e.gert@gmail.com', 2147483647, '1234567890abhnkiol', '1234567890abhnkiol', ''),
('PackageKCKKC', 'pakeguhjnnd@gmail.com', 2147483647, '1234567890olpmybe', '1234567890olpmybe', ''),
('mumtaz ahmad', 'mumtazahmed@gmail.com', 2147483647, '1234567890987', '1234567890987', ''),
('Mypersonallaptoptrying', 'aehanmady34@gmail.com', 2147483647, '123456789', '123456789', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
