-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 02, 2017 at 09:43 PM
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_room`
--

INSERT INTO `chat_room` (`id`, `name`, `image_url`, `is_group`, `group_frbs_notif_id`, `created_at`, `last_activity`) VALUES
(1, NULL, NULL, 0, NULL, '2017-09-26 02:17:28', '2017-09-30 05:27:19'),
(2, NULL, NULL, 0, NULL, '2017-09-26 02:17:34', '2017-09-30 05:27:38'),
(3, NULL, NULL, 0, NULL, '2017-09-26 02:17:39', '2017-09-26 14:16:02'),
(4, NULL, NULL, 0, NULL, '2017-09-26 02:17:44', '2017-09-30 05:29:10'),
(5, NULL, NULL, 0, NULL, '2017-09-26 02:17:49', '2017-09-28 01:15:20'),
(6, NULL, NULL, 0, NULL, '2017-09-26 02:17:53', '2017-09-26 02:27:54'),
(7, NULL, NULL, 0, NULL, '2017-09-26 02:17:58', '2017-10-02 02:06:15'),
(8, NULL, NULL, 0, NULL, '2017-09-28 01:45:53', '2017-10-02 03:22:27');

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
(6, 3, 1),
(7, 4, 11),
(8, 4, 13),
(9, 5, 11),
(10, 5, 3),
(11, 6, 11),
(12, 6, 12),
(13, 7, 11),
(14, 7, 10),
(15, 8, 14),
(16, 8, 11);

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
(1, 1, 11, 'A', '2017-09-26 02:17:32', 1),
(2, 2, 11, 'A', '2017-09-26 02:17:37', 1),
(3, 3, 11, 'A', '2017-09-26 02:17:41', 1),
(4, 4, 11, 'A', '2017-09-26 02:17:46', 1),
(5, 5, 11, 'A', '2017-09-26 02:17:51', 1),
(6, 6, 11, 'A', '2017-09-26 02:17:55', 1),
(7, 7, 11, 'A', '2017-09-26 02:17:59', 1),
(8, 1, 5, 'jos gandos', '2017-09-26 02:18:48', 1),
(9, 1, 5, 'jos gandos', '2017-09-26 02:19:14', 1),
(10, 1, 5, 'jos gandos', '2017-09-26 02:21:13', 1),
(11, 4, 13, 'jos gandos', '2017-09-26 02:25:35', 1),
(12, 4, 13, 'jos gandos', '2017-09-26 02:26:00', 1),
(13, 4, 13, 'jos gandos', '2017-09-26 02:26:10', 1),
(14, 4, 13, 'jos gandos', '2017-09-26 02:26:12', 1),
(15, 7, 10, 'jos gandos', '2017-09-26 02:26:28', 1),
(18, 1, 5, 'hihihi', '2017-09-26 02:31:11', 1),
(19, 2, 8, 'hihihi', '2017-09-26 02:31:35', 1),
(20, 1, 5, 'hihihi', '2017-09-26 03:02:18', 1),
(21, 2, 8, 'hihihi', '2017-09-26 03:02:54', 1),
(22, 5, 3, 'hihihi', '2017-09-26 03:04:13', 1),
(23, 5, 3, 'hihihi', '2017-09-26 03:09:35', 1),
(24, 3, 1, 'hihihi', '2017-09-26 03:09:54', 1),
(25, 7, 10, 'hihihi', '2017-09-26 03:10:08', 1),
(26, 3, 1, 'hihihi', '2017-09-26 03:11:06', 1),
(27, 3, 11, 'Eh off oeoeke off off off c yg EC', '2017-09-26 13:38:06', 1),
(28, 3, 11, 'Test', '2017-09-26 14:02:33', 1),
(29, 3, 11, 'Jos coy', '2017-09-26 14:02:37', 1),
(30, 3, 11, 'Fff', '2017-09-26 14:02:47', 1),
(31, 3, 11, 'Di pa dkk hmm', '2017-09-26 14:16:02', 1),
(32, 1, 11, 'mantap jiwa', '2017-09-26 14:52:46', 1),
(33, 1, 11, 'dzikir yang banyak ya sayang', '2017-09-26 14:59:22', 1),
(34, 1, 11, 'jos gandos', '2017-09-26 14:59:29', 1),
(35, 7, 10, 'hai sayang', '2017-09-27 02:20:59', 1),
(36, 5, 3, 'Hai', '2017-09-27 02:35:53', 1),
(37, 5, 3, 'Test', '2017-09-27 02:36:19', 1),
(38, 5, 3, 'Hhh', '2017-09-27 02:36:58', 1),
(39, 5, 3, 'Fjdjj', '2017-09-27 02:37:21', 1),
(40, 5, 3, 'Fjdjfk', '2017-09-27 02:37:35', 1),
(41, 5, 11, 'Dd\'idhhh', '2017-09-27 02:40:12', 1),
(42, 5, 3, 'Gjo', '2017-09-27 02:40:39', 1),
(43, 5, 11, 'Ihh', '2017-09-27 02:40:46', 1),
(44, 5, 11, 'Hbdh', '2017-09-27 02:41:05', 1),
(45, 5, 11, 'Dhhh', '2017-09-27 02:41:18', 1),
(46, 5, 11, 'Fhhg', '2017-09-27 02:41:23', 1),
(47, 5, 11, 'Dbd', '2017-09-27 02:41:29', 1),
(48, 5, 3, 'Hfdy', '2017-09-27 02:41:34', 1),
(49, 5, 3, 'Hryohf', '2017-09-27 02:41:57', 1),
(50, 5, 3, 'Fjydg', '2017-09-27 02:42:08', 1),
(51, 5, 3, 'Jcjjh', '2017-09-27 02:42:13', 1),
(52, 5, 11, 'Ttstdusreleu', '2017-09-27 03:16:40', 1),
(53, 5, 11, 'Tdu', '2017-09-27 03:16:41', 1),
(54, 5, 11, 'Gcdc', '2017-09-27 03:16:42', 1),
(55, 5, 11, 'Tiger', '2017-09-27 03:16:44', 1),
(56, 5, 11, 'Teh', '2017-09-27 03:16:45', 1),
(57, 5, 11, 'Terkecuali', '2017-09-27 03:16:47', 1),
(58, 5, 11, 'Studio', '2017-09-27 03:16:49', 1),
(59, 5, 11, 'Tapi', '2017-09-27 03:16:51', 1),
(60, 5, 11, 'Aku', '2017-09-27 03:16:52', 1),
(61, 5, 11, 'Aku', '2017-09-27 03:16:53', 1),
(62, 5, 11, 'Tapi', '2017-09-27 03:16:54', 1),
(63, 5, 11, 'Dxd', '2017-09-27 04:05:03', 1),
(64, 5, 3, 'X', '2017-09-27 04:05:16', 1),
(65, 5, 11, 'Ii', '2017-09-27 04:05:27', 1),
(66, 5, 3, 'H', '2017-09-27 04:05:27', 1),
(67, 5, 11, 'Xwiwi', '2017-09-27 04:06:32', 1),
(68, 5, 11, 'Ximh', '2017-09-27 04:06:38', 1),
(69, 5, 11, 'Eh eh', '2017-09-27 04:06:49', 1),
(70, 5, 3, 'Edjdi', '2017-09-27 04:10:29', 1),
(71, 5, 3, 'Bhhy', '2017-09-27 04:11:18', 1),
(72, 5, 3, 'Dkki', '2017-09-27 04:12:44', 1),
(73, 5, 3, 'Ujfjff', '2017-09-27 04:14:43', 1),
(74, 5, 11, 'Iumx', '2017-09-27 04:15:10', 1),
(75, 5, 3, 'Fgjh', '2017-09-27 04:15:22', 1),
(76, 5, 11, 'Huhutu', '2017-09-27 04:15:25', 1),
(77, 5, 3, 'Fddjj', '2017-09-27 04:15:32', 1),
(78, 5, 3, 'Gfhysyt', '2017-09-27 04:18:55', 1),
(79, 5, 11, 'Uhhu', '2017-09-27 04:19:04', 1),
(80, 5, 11, 'Iiriif', '2017-09-27 04:21:07', 1),
(81, 5, 11, 'Uddh', '2017-09-27 04:22:06', 1),
(82, 5, 11, 'Mdu', '2017-09-27 04:22:16', 1),
(83, 5, 11, 'Ddh', '2017-09-27 04:22:21', 1),
(84, 5, 11, 'Ir the eh di', '2017-09-27 04:24:17', 1),
(85, 5, 11, 'Wjddehi', '2017-09-27 14:19:09', 1),
(86, 5, 11, 'Umehkg', '2017-09-27 14:19:11', 1),
(87, 5, 11, 'Uhhuhwwxw', '2017-09-27 14:38:36', 1),
(88, 5, 11, 'Wxwx', '2017-09-27 14:38:38', 1),
(89, 5, 11, 'Didedikasikan Hui XD hihihi Uhud', '2017-09-27 14:38:45', 1),
(90, 5, 11, 'Duxhw', '2017-09-27 14:49:48', 1),
(91, 5, 11, 'Mmkeid', '2017-09-27 14:49:50', 1),
(92, 5, 11, 'Ihmbd', '2017-09-27 14:49:50', 1),
(93, 5, 11, 'Gue di w tkk', '2017-09-27 14:49:51', 1),
(94, 7, 11, 'Kg Eddie km mm b Budi', '2017-09-27 14:50:21', 0),
(95, 7, 11, 'BBM km Din d', '2017-09-27 14:50:28', 0),
(96, 7, 11, 'Thx di dkk mm', '2017-09-27 14:50:28', 1),
(97, 7, 11, 'Didid k bagian bin', '2017-09-27 14:50:30', 0),
(98, 7, 11, 'Itu di di di di', '2017-09-27 14:54:27', 0),
(99, 7, 11, 'Eh iya di hihihi id hihi', '2017-09-27 14:54:29', 1),
(100, 7, 11, 'D demikian', '2017-09-27 14:54:30', 0),
(101, 7, 11, 'Gee Dwight', '2017-09-27 14:55:50', 0),
(102, 7, 11, 'Wiwid', '2017-09-27 14:55:51', 0),
(103, 7, 11, 'Wife diem', '2017-09-27 14:56:04', 1),
(104, 5, 3, 'Ifbj', '2017-09-28 01:13:13', 1),
(105, 5, 3, 'Tuhffghjb', '2017-09-28 01:13:20', 1),
(106, 5, 11, 'Edisi hihihi Dutch', '2017-09-28 01:13:55', 1),
(107, 5, 11, 'Dididihkan', '2017-09-28 01:13:58', 1),
(108, 5, 3, 'Zgghivhhjjh', '2017-09-28 01:14:20', 1),
(109, 5, 3, 'Hdgki', '2017-09-28 01:14:21', 1),
(110, 5, 3, 'Jhfgi', '2017-09-28 01:14:22', 1),
(111, 5, 3, 'Gfh', '2017-09-28 01:14:28', 1),
(112, 5, 3, 'Gdhj', '2017-09-28 01:14:31', 1),
(113, 5, 11, 'Xbhdd', '2017-09-28 01:14:34', 1),
(114, 5, 3, 'Uet', '2017-09-28 01:15:05', 1),
(115, 5, 11, 'Dkk dkk di', '2017-09-28 01:15:06', 1),
(116, 5, 11, 'Dd', '2017-09-28 01:15:11', 1),
(117, 5, 3, 'Ohs', '2017-09-28 01:15:13', 1),
(118, 5, 3, 'Hdjej', '2017-09-28 01:15:20', 1),
(119, 8, 14, 'Hai zihad', '2017-09-28 01:45:58', 1),
(120, 8, 14, 'Hi', '2017-09-28 01:46:22', 1),
(121, 8, 14, 'Ho', '2017-09-28 01:46:38', 1),
(122, 8, 14, 'Woy', '2017-09-28 01:47:30', 1),
(123, 8, 14, 'Ggh', '2017-09-28 01:50:59', 1),
(124, 8, 11, 'I$', '2017-09-28 01:51:01', 1),
(125, 8, 14, 'Gggv', '2017-09-28 01:51:02', 1),
(126, 8, 11, 'Didt', '2017-09-28 01:51:02', 1),
(127, 8, 11, 'Idd', '2017-09-28 01:51:03', 1),
(128, 8, 11, 'Ddh', '2017-09-28 01:51:05', 1),
(129, 8, 11, 'Dd', '2017-09-28 01:51:05', 1),
(130, 8, 14, 'Vgbhbhjjghh', '2017-09-28 01:51:06', 1),
(131, 8, 11, 'Asem', '2017-09-28 01:51:13', 1),
(132, 8, 11, 'D', '2017-09-28 01:51:16', 1),
(133, 8, 11, 'H', '2017-09-28 01:51:19', 1),
(134, 8, 11, 'N', '2017-09-28 01:51:21', 1),
(135, 8, 14, 'F', '2017-09-28 01:51:24', 1),
(136, 8, 14, 'B', '2017-09-28 01:51:27', 1),
(137, 8, 14, 'N', '2017-09-28 01:51:29', 1),
(138, 8, 14, 'F', '2017-09-28 01:51:37', 1),
(139, 8, 14, 'Dd', '2017-09-28 01:51:40', 1),
(140, 8, 14, 'Khh', '2017-09-28 01:51:41', 1),
(141, 8, 14, 'H', '2017-09-28 01:52:13', 1),
(142, 8, 14, 'Gffg', '2017-09-28 01:53:41', 1),
(143, 8, 14, 'Fhj', '2017-09-28 01:57:43', 1),
(144, 8, 14, 'Ghh', '2017-09-28 02:00:39', 1),
(145, 8, 14, 'hai sayang', '2017-09-28 02:04:14', 1),
(146, 8, 14, 'hai sayang', '2017-09-28 02:10:41', 1),
(147, 8, 14, 'asem kou', '2017-09-28 02:10:59', 1),
(148, 8, 14, 'Vghhj', '2017-09-28 03:01:44', 1),
(149, 8, 11, 'Xdmd', '2017-09-28 03:06:50', 1),
(150, 8, 14, 'Gffhh', '2017-09-28 03:07:14', 1),
(151, 8, 11, '+hutuu', '2017-09-28 03:07:33', 1),
(152, 8, 11, 'Mewutu', '2017-09-28 03:07:33', 1),
(153, 8, 11, 'Mumihhxi', '2017-09-28 03:07:34', 1),
(154, 8, 11, 'Muwuhi', '2017-09-28 03:07:35', 1),
(155, 8, 14, 'Oou', '2017-09-28 03:45:34', 1),
(156, 8, 14, 'Oi', '2017-09-28 03:45:44', 1),
(157, 8, 14, 'Gan', '2017-09-28 03:46:00', 1),
(158, 8, 11, 'Yo', '2017-09-28 04:05:11', 1),
(159, 8, 14, 'Auwoo', '2017-09-28 04:07:41', 1),
(160, 8, 11, 'Dhhhh', '2017-09-28 04:10:14', 1),
(161, 8, 11, 'Tarzan', '2017-09-28 04:10:19', 1),
(162, 8, 11, 'U', '2017-09-28 04:10:44', 1),
(163, 8, 14, 'Oou', '2017-09-28 04:10:45', 1),
(164, 8, 11, 'Ihh', '2017-09-28 04:10:55', 1),
(165, 8, 11, 'Kidh', '2017-09-28 04:10:56', 1),
(166, 8, 11, 'Ihhh', '2017-09-28 04:10:58', 1),
(167, 8, 14, ' Nani nani', '2017-09-29 01:16:02', 1),
(168, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:12:37', 1),
(169, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:13:23', 1),
(170, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:14:10', 1),
(171, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:14:41', 1),
(172, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:15:07', 1),
(173, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:15:41', 1),
(174, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:18:15', 1),
(175, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:19:29', 1),
(176, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:20:02', 1),
(177, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:21:03', 1),
(178, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:29:20', 1),
(179, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:29:38', 1),
(180, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:31:46', 1),
(181, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:31:58', 1),
(182, 8, 14, 'sanoteuhsnatoheu', '2017-09-29 14:40:52', 1),
(183, 8, 11, 'sanoteuhsnatoheu', '2017-09-29 14:42:57', 1),
(184, 8, 11, 'sanoteuhsnatoheu', '2017-09-29 14:43:24', 1),
(185, 8, 11, 'sanoteuhsnatoheu', '2017-09-29 14:45:11', 1),
(186, 8, 11, 'sanoteuhsnatoheu', '2017-09-30 03:51:10', 1),
(187, 8, 11, 'sanoteuhsnatoheu', '2017-09-30 03:54:31', 1),
(188, 8, 11, 'sanoteuhsnatoheu', '2017-09-30 03:54:56', 1),
(189, 8, 11, 'test', '2017-09-30 03:55:18', 1),
(190, 8, 14, 'test', '2017-09-30 03:56:27', 1),
(191, 8, 14, 'test', '2017-09-30 03:56:33', 1),
(192, 8, 14, 'test', '2017-09-30 03:56:34', 1),
(193, 8, 14, 'test', '2017-09-30 03:56:35', 1),
(194, 8, 14, 'test', '2017-09-30 03:56:36', 1),
(195, 8, 14, 'test', '2017-09-30 03:56:51', 1),
(196, 8, 14, 'test', '2017-09-30 03:56:54', 1),
(197, 8, 14, 'test', '2017-09-30 03:56:56', 1),
(198, 8, 14, 'test', '2017-09-30 03:57:16', 1),
(199, 8, 14, 'http://bit.ly/surahNoah', '2017-09-30 04:16:12', 1),
(200, 1, 5, 'test', '2017-09-30 05:27:02', 1),
(201, 1, 5, 'jos gandos', '2017-09-30 05:27:19', 1),
(202, 2, 8, 'jos gandos', '2017-09-30 05:27:37', 1),
(203, 4, 13, 'jos gandos', '2017-09-30 05:28:12', 1),
(204, 4, 13, 'mantap coy', '2017-09-30 05:28:40', 1),
(205, 4, 13, 'mantap coy', '2017-09-30 05:29:02', 1),
(206, 4, 13, 'mantap coy', '2017-09-30 05:29:02', 1),
(207, 4, 13, 'mantap coy', '2017-09-30 05:29:05', 1),
(208, 4, 13, 'mantap coy', '2017-09-30 05:29:10', 1),
(209, 7, 10, 'mantap coy', '2017-09-30 05:29:29', 1),
(210, 7, 11, 'Ddd', '2017-10-02 02:06:15', 0),
(211, 8, 14, 'Hgddvh', '2017-10-02 02:11:46', 1),
(212, 8, 14, 'Vcbmm', '2017-10-02 02:11:49', 1),
(213, 8, 14, 'Vvv', '2017-10-02 02:11:50', 1),
(214, 8, 11, 'Iidhhhdid', '2017-10-02 02:23:26', 1),
(215, 8, 11, 'Dhhbbdd', '2017-10-02 02:23:29', 1),
(216, 8, 11, 'I', '2017-10-02 02:24:39', 1),
(217, 8, 14, 'H', '2017-10-02 02:24:41', 1),
(218, 8, 11, 'I', '2017-10-02 02:24:45', 1),
(219, 8, 14, 'Jjjj', '2017-10-02 02:24:52', 1),
(220, 8, 14, 'J', '2017-10-02 02:24:54', 1),
(221, 8, 14, 'V', '2017-10-02 02:25:55', 1),
(222, 8, 11, 'B', '2017-10-02 02:25:58', 1),
(223, 8, 11, 'X', '2017-10-02 02:26:01', 1),
(224, 8, 14, 'H', '2017-10-02 02:26:03', 1),
(225, 8, 14, 'Gyibghu', '2017-10-02 02:26:23', 1),
(226, 8, 14, 'Bvcj', '2017-10-02 02:26:24', 1),
(227, 8, 14, 'Jvgi', '2017-10-02 02:26:26', 1),
(228, 8, 14, 'Hvjk', '2017-10-02 02:26:27', 1),
(229, 8, 11, 'Xbddhg', '2017-10-02 02:42:01', 1),
(230, 8, 11, 'D', '2017-10-02 02:43:02', 1),
(231, 8, 11, 'X', '2017-10-02 02:48:09', 1),
(232, 8, 11, 'H', '2017-10-02 02:48:22', 1),
(233, 8, 11, 'I', '2017-10-02 02:48:26', 1),
(234, 8, 11, 'X', '2017-10-02 02:48:32', 1),
(235, 8, 11, 'X', '2017-10-02 02:48:35', 1),
(236, 8, 14, 'Ggjjgsf', '2017-10-02 03:00:36', 0),
(237, 8, 14, 'Vvbjj', '2017-10-02 03:00:39', 0),
(238, 8, 14, 'Ghjj', '2017-10-02 03:01:42', 0),
(239, 8, 14, 'Gfgjjj', '2017-10-02 03:11:16', 0),
(240, 8, 14, 'V', '2017-10-02 03:11:49', 0),
(241, 8, 14, 'Dhjj', '2017-10-02 03:12:01', 0),
(242, 8, 14, ' Gjkk', '2017-10-02 03:15:48', 0),
(243, 8, 14, 'J', '2017-10-02 03:16:07', 0),
(244, 8, 14, 'Cfv', '2017-10-02 03:17:54', 0),
(245, 8, 14, 'Hhh', '2017-10-02 03:19:15', 0),
(246, 8, 14, 'G', '2017-10-02 03:22:27', 0);

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
(5, 5, 11),
(6, 11, 12),
(7, 11, 13),
(8, 11, 14);

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
(3, 'furwadee', 'jakenkaya', 'Furwadi Ghiyono', 'pp_59bcaa6128830', 'Telor berjaya', 'ezM5htkYvs8:APA91bGBNlsxPcY5oHRh8brWHVbzpUTpVroMnX1JS_Lpup6kvMGUDyM59K5Lq-gr6IuSgf4TAIE708cASOKpA4Yho6YxvZNfiK5KEhqj5FljBFeFglRAarOu-1uslQuQhmSaRDwZDY14'),
(5, 'abdrr', 'devdroid', 'Abdurrahman', 'pp_59bcb6510d055', 'Bismillah', 'fOzuvjMmTz8:APA91bFcdZW9EZuyxJmQPcWy2hgiF8lMPwG2LJZkLuEpo9C1U2YLncBM5LzR9seNbzJ-Uc7PPaROZGLVviXMLV_J0a08lSRcekbw62kzebcNk0Ej1gNGgQzX5wZZetMaprx_M8VVqqcH'),
(6, 'aminqdr', 'aminqdr', 'Amin Qodir', 'pp_59bcbb2fe422c', 'Allah', 'dulYGNUWhr0:APA91bEha2VtWy_yjd_0c3xjNY9JKJ2G6L9ibajfEyvuIRToxJKw5rBQeZZKfWpetI231hJ2i1EfDtuFHcnMVSZo3It78wnVZ77_Mx_pnhrUTddgai26-SWhCO95sacLvVHt9Xkiu9YL'),
(8, 'agresss', 'allah', 'Agress', 'pp_59bcd112623a8', 'Hi there!', 'd5iG2MiOCMs:APA91bE42K0lpWxpHl58--3FGua8MYUk2lPB-aDqVEDAMRGWAc4hyRtzQ_rKFg_wb49lbJkyMoAynWfaHeuOOJlPQJIQPWqmWZvXUavbjlkGmUJ3_rEwaqXDZjepJ0dy9o6YGk6Cqxhk'),
(9, 'fulan', 'allah', 'Udin', 'pp_59bccfaedb1de', 'Allah', 'fDriiWYNUMo:APA91bEweToKHHaC-Ty0PE3bRVSXpcMQuPpJGN6ziIMf7fD0mcGpNkdPoSAbJ-weHPe3ydnngaOM0zgsG8s-wUHX98gxT-8Zznaz3kX9HcHPlmGt5WVJDuPehOLERqkhc943x6Nk8R7q'),
(10, 'alay', 'hehehe', 'Yg CluE MnCnta! MOe', 'pp_59bcd0121d768', 'Hi there!', 'doWvMDrBMa0:APA91bGZHLhOzec2KlQX26iV7ZcWz89fMi0JoIsF7hAxlJ_1SuNx21aBiFt5bvBjTHeqwlydaqh0oUzDU0d_CIOqRHsULQufA6ZCNsbdDSJ201nP4KP6GPMeI2107Enfpj5FFE1qBa8J'),
(11, 'zihad', 'allah', 'Zihad Rizky Edwin Fikri', 'pp_59bcd0c6cc63a', '"Khoirunnas, anfauhum linnas"', 'dHZhc_KPtqQ:APA91bEJvuKHRHbESiU9vTshoweLYVT_5n7p9m_NQ6eKqKJp_-35ajQpRCg0nYu6Iqr78hV2Re-LzqAr-RJnjFTBzdKcaBjmdMUC87k_7clD20okdx1cGqXGWcmGwL7erF77eE-M-PNF'),
(12, 'udin', 'allah', 'Udin', 'pp_59c1e4b0bbc82', 'Hi there!', 'cvXttX8hx6U:APA91bGOSK-6YE2r0JePxVv-bxLaBbsgg5EM-8s_K8ATFX_hWr9G3k__bABqTfjGw_8_aXN7MsnHapqqAEn1vcfU6ycIZVtjJVjNh1BsIBlXghq9w_MThj58hsl5SPAh9AEzwKMzOWdD'),
(13, 'budi', 'allah', 'Budi', 'pp_59c1e50830186', 'Hi there!', 'eLwD2TKZ5t0:APA91bGMk6xjdYDwGZwTYs3v5oD41snv_qtHneWOZ9ssWhaQvKKLdgvSNHs0ZoGprsB1l15YGPvb9SJ1FZr1UGxiSxJxd3mLP2RtdWT-jjOWa3a_fehgPZJa_Rmuk8C598_8vrdQABF6'),
(14, 'fachmee', 'allah', 'Fahmi Azain', 'pp_59cc70a7e0cd3', 'Hi there!', 'dBIa1xh0gwQ:APA91bEKMdmv4IP8ZSQyq6uNIq1oREqRfOPRrYea1HcGNKvzy41v-8TKDk3OYnqX4iCnjLNqKOgV6VNG4cRmCii-wvsl4mMRhA4QbmZJHX4SxGMnxSvroC1srpWZk5bZTKCjVKCyowku');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `chat_room_member`
--
ALTER TABLE `chat_room_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `chat_row`
--
ALTER TABLE `chat_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `friend`
--
ALTER TABLE `friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
