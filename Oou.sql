-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 12, 2017 at 09:36 AM
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
  `group_frbs_notif_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_member`
--

CREATE TABLE `chat_room_member` (
  `id` int(11) NOT NULL,
  `chat_room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `readed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 3, 4);

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
  `bio` varchar(200) NOT NULL DEFAULT '',
  `frbs_notif_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `image_url`, `bio`, `frbs_notif_id`) VALUES
(2, 'tarjo', 'pass', 'Tarjo', 'ghaniya', 'yoi broh', 'deJQ3BWvbbQ:APA91bHXqqc6HbGRTegdQpk2aDgKq0TDe6LKjxq1HH--Z5otEiRqXzWhA4WbtfqZSVkwq-He1gFD1SX19KyswwtPeftfq4BYjPIVslR4TIxNtSvhS4ZERdF9LyppTxmrmIEFuy6ptTnG'),
(3, 'abdrr', 'sipjos', 'Abdurrahman', 'smile', 'yahfadzka', 'ePQ9NUPtRi4:APA91bHRtYl7rrlw5F-uaA1rLdzEj3psLE5-444yLU7xRKqP2iPTYzanUF_O8U5IWAORpmPUOxcyAMwoNckHkK9wgT2XLl3REbYshvKIMGKV8GwbP96IoALGo5eT-NqpB80t_SUDrnt1'),
(4, 'zihadrizkyef', 'hobitidur', 'Zihad Rizky Edwin Fikri', 'avatarsmall', 'jos gandos mas broooo', 'cw4UtSVvHkc:APA91bHQeU_JIaJzmI3yMfgZkKYA5e3xzpss1tG5zVBdAJQymLIug6SD3vqYqfdklx_OaP7Wa6VkfakvBvruQI4J2Wo-giq-6eprtxkHnweQGdKM8inCAfjKPk7tRa137A50v6iHpztc');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_room_member`
--
ALTER TABLE `chat_room_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat_row`
--
ALTER TABLE `chat_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `friend`
--
ALTER TABLE `friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
