-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 20, 2017 at 07:19 AM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Oou`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_room`
--

CREATE TABLE `chat_room` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `image_url` varchar(30) DEFAULT NULL,
  `is_group` tinyint(1) NOT NULL,
  `group_frbs_notif_id` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_room`
--

INSERT INTO `chat_room` (`id`, `name`, `image_url`, `is_group`, `group_frbs_notif_id`, `created_at`) VALUES
(1, NULL, NULL, 0, NULL, '2017-09-16 07:23:41'),
(2, NULL, NULL, 0, NULL, '2017-09-16 07:24:03'),
(3, NULL, NULL, 0, NULL, '2017-09-16 07:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_member`
--

CREATE TABLE `chat_room_member` (
  `id` int(11) NOT NULL,
  `chat_room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_room_member`
--

INSERT INTO `chat_room_member` (`id`, `chat_room_id`, `user_id`) VALUES
(1, 1, 11),
(2, 1, 5),
(3, 2, 11),
(4, 2, 8),
(5, 3, 11),
(6, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `chat_row`
--

CREATE TABLE `chat_row` (
  `id` int(11) NOT NULL,
  `chat_room_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `readed` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_row`
--

INSERT INTO `chat_row` (`id`, `chat_room_id`, `sender_id`, `message`, `created_at`, `readed`) VALUES
(1, 1, 11, 'Yongkrep broh .', '2017-09-16 07:23:54', 1),
(2, 2, 11, 'Hahaha ngakak ðŸ˜‚', '2017-09-16 07:24:40', 0),
(3, 3, 11, 'QMu jGn tngGln aQ ya Cyank ðŸ˜˜', '2017-09-16 07:25:17', 0),
(4, 1, 5, 'gimana kabar lu?', '2017-09-18 03:21:20', 0),
(5, 1, 5, 'gimana kabar lu?', '2017-09-18 03:24:29', 0),
(6, 1, 5, 'gimana kabar lu?', '2017-09-18 03:24:57', 0),
(7, 1, 5, 'gimana kabar lu?', '2017-09-18 03:25:21', 0),
(8, 1, 5, 'gimana kabar lu?', '2017-09-18 03:26:54', 0),
(9, 1, 5, 'gimana kabar lu?', '2017-09-18 03:28:00', 0),
(10, 1, 5, 'gimana kabar lu?', '2017-09-18 03:31:04', 0),
(11, 3, 10, 'Dasar generasi apeng', '2017-09-19 00:54:48', 0),
(12, 3, 10, 'Dasar generasi apeng', '2017-09-19 00:58:20', 0),
(13, 3, 10, 'Dasar generasi apeng', '2017-09-19 00:59:42', 0),
(14, 3, 10, 'Dasar generasi apeng', '2017-09-19 01:07:36', 0),
(15, 3, 10, 'Dasar generasi apeng', '2017-09-19 01:13:57', 0),
(16, 3, 10, 'Dasar generasi apeng', '2017-09-19 01:14:23', 0),
(17, 3, 10, 'Dasar generasi apeng', '2017-09-19 01:15:23', 0),
(18, 3, 10, 'Dasar generasi apeng', '2017-09-19 01:16:35', 0),
(19, 3, 10, 'Dasar generasi apeng', '2017-09-19 01:16:55', 0),
(20, 3, 10, 'Dasar generasi apeng', '2017-09-19 01:27:24', 0),
(21, 3, 10, 'ittaqullah', '2017-09-19 01:39:12', 0),
(22, 3, 10, 'ittaqullah', '2017-09-19 01:42:56', 0),
(23, 3, 10, 'ittaqullah', '2017-09-19 01:49:11', 0),
(24, 3, 10, 'ittaqullah', '2017-09-19 01:50:14', 0),
(25, 3, 10, 'ittaqullah', '2017-09-19 01:50:54', 0),
(26, 3, 10, 'ittaqullah', '2017-09-19 02:04:29', 0),
(27, 3, 10, 'ittaqullah', '2017-09-19 02:05:47', 0),
(28, 3, 10, 'ittaqullah', '2017-09-19 02:09:09', 0),
(29, 3, 10, 'ittaqullah', '2017-09-19 02:09:32', 0),
(30, 3, 10, 'ittaqullah', '2017-09-19 02:11:21', 0),
(31, 3, 10, 'ittaqullah', '2017-09-19 02:11:29', 0),
(32, 3, 10, 'ittaqullah', '2017-09-19 02:11:36', 0),
(33, 3, 10, 'ittaqullah', '2017-09-19 02:11:46', 0),
(34, 3, 10, 'ittaqullah', '2017-09-19 02:15:02', 0),
(35, 3, 10, 'hdnth', '2017-09-19 02:15:20', 0),
(36, 3, 10, 'hdhhhh', '2017-09-19 02:15:33', 0),
(37, 1, 11, 'Hep', '2017-09-19 03:46:56', 0),
(38, 1, 11, 'Udhh', '2017-09-19 03:47:29', 0),
(39, 1, 11, 'Uid', '2017-09-19 03:47:37', 0),
(40, 1, 11, 'Kud', '2017-09-19 03:47:42', 0),
(41, 1, 11, 'Mwwt', '2017-09-19 03:47:44', 0),
(42, 1, 11, 'Uoa.', '2017-09-19 03:47:47', 0),
(43, 1, 5, 'Fhjk', '2017-09-19 03:48:01', 0),
(44, 1, 5, 'Fdy', '2017-09-19 03:48:06', 0),
(45, 1, 11, 'Dd', '2017-09-19 03:49:28', 0),
(46, 1, 11, 'Ukey', '2017-09-19 03:49:33', 0),
(47, 1, 11, 'Uid', '2017-09-19 03:52:25', 0),
(48, 1, 11, 'Diu', '2017-09-19 03:52:58', 0),
(49, 1, 11, 'Bmt', '2017-09-19 03:54:34', 0),
(50, 1, 11, 'Yih', '2017-09-19 03:54:44', 0),
(51, 1, 11, 'I', '2017-09-19 03:56:07', 0),
(52, 1, 11, 'D', '2017-09-19 03:56:12', 0),
(53, 3, 10, 'hdhhhh', '2017-09-19 15:07:20', 0),
(54, 3, 10, 'hdhhhh', '2017-09-19 15:08:01', 0),
(55, 3, 10, 'arep nopo tong', '2017-09-19 15:08:18', 0),
(56, 3, 10, 'sakarepmu wae wis\r\n', '2017-09-19 15:08:35', 0),
(57, 1, 5, 'Fty', '2017-09-19 23:45:56', 0),
(58, 1, 5, 'Huu', '2017-09-19 23:46:03', 0),
(59, 1, 5, 'Hbj', '2017-09-19 23:47:13', 0),
(60, 1, 5, 'Dyu', '2017-09-19 23:47:19', 0),
(61, 1, 11, 'Fixh', '2017-09-19 23:47:21', 0),
(62, 1, 5, 'Hhi', '2017-09-19 23:47:26', 0),
(63, 1, 11, 'Xdht', '2017-09-19 23:47:33', 0),
(64, 1, 11, 'Xmhh', '2017-09-19 23:47:46', 0),
(65, 1, 11, 'Mdui', '2017-09-19 23:47:48', 0),
(66, 1, 11, 'Bhwt', '2017-09-19 23:47:51', 0),
(67, 1, 11, 'Xxmh', '2017-09-19 23:47:54', 0),
(68, 1, 5, 'Fhfhfu', '2017-09-19 23:48:05', 0),
(69, 1, 11, 'Dik', '2017-09-19 23:48:09', 0),
(70, 1, 5, 'Gfddg', '2017-09-19 23:48:17', 0),
(71, 1, 5, 'Fehh', '2017-09-19 23:48:18', 0),
(72, 1, 5, 'Fefg', '2017-09-19 23:48:20', 0),
(73, 1, 11, 'Iuih', '2017-09-19 23:48:22', 0),
(74, 1, 11, 'Xxm', '2017-09-19 23:48:23', 0),
(75, 1, 11, 'Ddbd', '2017-09-19 23:48:26', 0),
(76, 1, 5, 'Hhh', '2017-09-19 23:48:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `id` int(11) NOT NULL,
  `userid_1` int(11) NOT NULL,
  `userid_2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`id`, `userid_1`, `userid_2`) VALUES
(1, 1, 11),
(2, 3, 11),
(3, 10, 11),
(4, 8, 11),
(5, 5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image_url` varchar(30) NOT NULL DEFAULT '',
  `bio` varchar(200) NOT NULL DEFAULT 'Hi there!',
  `frbs_notif_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `image_url`, `bio`, `frbs_notif_id`) VALUES
(1, 'azzamaq', 'hondamotor', 'Azzam Al Qorni', 'pp_59bca932afc29', 'Kecepatan adalah seni', 'e46lpo94vvI:APA91bHPDrD9BSlu3Vg_bjMPmf6I-inkwezswyox_SC3yYb-pA2FrI_8sfujfmk0XxXTOqfSkib6X7PRDZOPpFDdajfWaro_wYZ1A7F1Y8aQv5eXi5wacbvUL_A7XYK2RF5ob--k0KK5'),
(3, 'furwadee', 'jakenkaya', 'Furwadi Ghiyono', 'pp_59bcaa6128830', 'Telor berjaya', 'c5GoNmhZbdk:APA91bGj7o7zYwa3GM8VM4WiMFBMno6qYGn25N39sdxeoMb8iPeIsAKjORWh2gJ-imB1hbf-WJaplEwllJSgKJABl7ULz6AWqWuVO7yHdqtjO5zJNH1FEIYrn8IWzpdHtomMDylzNoUY'),
(5, 'abdrr', 'devdroid', 'Abdurrahman', 'pp_59bcb6510d055', 'Bismillah', 'fOzuvjMmTz8:APA91bFcdZW9EZuyxJmQPcWy2hgiF8lMPwG2LJZkLuEpo9C1U2YLncBM5LzR9seNbzJ-Uc7PPaROZGLVviXMLV_J0a08lSRcekbw62kzebcNk0Ej1gNGgQzX5wZZetMaprx_M8VVqqcH'),
(6, 'aminqdr', 'aminqdr', 'Amin Qodir', 'pp_59bcbb2fe422c', 'Allah', 'dulYGNUWhr0:APA91bEha2VtWy_yjd_0c3xjNY9JKJ2G6L9ibajfEyvuIRToxJKw5rBQeZZKfWpetI231hJ2i1EfDtuFHcnMVSZo3It78wnVZ77_Mx_pnhrUTddgai26-SWhCO95sacLvVHt9Xkiu9YL'),
(8, 'agresss', 'allah', 'Agress', 'pp_59bcd112623a8', 'Hi there!', 'd5iG2MiOCMs:APA91bE42K0lpWxpHl58--3FGua8MYUk2lPB-aDqVEDAMRGWAc4hyRtzQ_rKFg_wb49lbJkyMoAynWfaHeuOOJlPQJIQPWqmWZvXUavbjlkGmUJ3_rEwaqXDZjepJ0dy9o6YGk6Cqxhk'),
(9, 'fulan', 'allah', 'Udin', 'pp_59bccfaedb1de', 'Allah', 'fDriiWYNUMo:APA91bEweToKHHaC-Ty0PE3bRVSXpcMQuPpJGN6ziIMf7fD0mcGpNkdPoSAbJ-weHPe3ydnngaOM0zgsG8s-wUHX98gxT-8Zznaz3kX9HcHPlmGt5WVJDuPehOLERqkhc943x6Nk8R7q'),
(10, 'alay', 'hehehe', 'Yg CluE MnCnta! MOe', 'pp_59bcd0121d768', 'Hi there!', 'doWvMDrBMa0:APA91bGZHLhOzec2KlQX26iV7ZcWz89fMi0JoIsF7hAxlJ_1SuNx21aBiFt5bvBjTHeqwlydaqh0oUzDU0d_CIOqRHsULQufA6ZCNsbdDSJ201nP4KP6GPMeI2107Enfpj5FFE1qBa8J'),
(11, 'zihad', 'allah', 'Zihad Rizky Edwin Fikri', 'pp_59bcd0c6cc63a', '"Khoirunnas, anfauhum linnas"', 'dRcClKxcxq4:APA91bFl0b-r61GpbOOcJQ1gswGB66V2-KpSh73ubSnF7qPnTcdwUFNaoqfwCW1cfK6Pr-5vtjueVZ-rQjBTV3HUlCjHVrXL5siuVggxqqa2cVQWl0pNFHPcs8N47nkMdVoYDVkE_WHj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_room_member`
--
ALTER TABLE `chat_room_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_row`
--
ALTER TABLE `chat_row`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `chat_room_member`
--
ALTER TABLE `chat_room_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `chat_row`
--
ALTER TABLE `chat_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `friend`
--
ALTER TABLE `friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
