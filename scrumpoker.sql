-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2019 at 12:44 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scrumpoker`
--

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

CREATE TABLE `point` (
  `id` int(3) NOT NULL,
  `sid` varchar(3) NOT NULL,
  `title` varchar(50) NOT NULL,
  `discription` varchar(100) NOT NULL,
  `point` varchar(4) NOT NULL,
  `did` varchar(3) NOT NULL,
  `comments` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `point`
--

INSERT INTO `point` (`id`, `sid`, `title`, `discription`, `point`, `did`, `comments`) VALUES
(2, '3', 'gh t h b', 'hbg h b bvtgf', '40', '2', ''),
(3, '4', 'trsydfhgj', 'estrydh tdjyg', '3', '3', ''),
(4, '1', 'dgf', 'fdhgn g ', '5', '2', ''),
(5, '1', 'dgf', 'fdhgn g ', '1', '4', ''),
(6, '3', 'gh t h b', 'hbg h b bvtgf', '1', '4', ''),
(7, '4', 'trsydfhgj', 'estrydh tdjyg', '3', '4', ''),
(8, '1', 'dgf', 'fdhgn g ', '8', '3', ''),
(9, '3', 'gh t h b', 'hbg h b bvtgf', '13', '3', ''),
(10, '5', 'aaaa', 'dddd', '5', '3', 'dfg fcgv'),
(11, '6', 'sss', 'bbbb', '8', '3', 'sssss'),
(12, '7', 'tttt', 'mmm', '20', '3', 'mmm'),
(13, '4', 'trsydfhgj', 'estrydh tdjyg', '2', '2', ''),
(14, '4', 'trsydfhgj', 'estrydh tdjyg', '3', '5', ''),
(15, '1', 'dgf', 'fdhgn g ', '1', '5', ''),
(16, '5', 'aaaa', 'dddd', '5', '2', 'df er df'),
(17, '5', 'aaaa', 'dddd', '1', '4', 're erwrsdgf'),
(18, '5', 'aaaa', 'dddd', '3', '5', 'asf dsv'),
(19, '6', 'sss', 'bbbb', '13', '2', 'ppp'),
(20, '6', 'sss', 'bbbb', '3', '4', 'kk'),
(21, '6', 'sss', 'bbbb', '3', '5', 'ggg'),
(22, '7', 'tttt', 'mmm', '2', '2', 'pppp'),
(23, '7', 'tttt', 'mmm', '3', '4', 'kkkkfg'),
(24, '7', 'tttt', 'mmm', '3', '5', 'tttttt'),
(25, '3', 'gh t h b', 'hbg h b bvtgf', '2', '5', 'dfg'),
(26, '8', 'hii', 'hlooo', '3', '2', 'ppppp'),
(27, '8', 'hii', 'hlooo', '5', '3', 'mjmjm'),
(28, '8', 'hii', 'hlooo', '3', '4', 'kkkkgf'),
(29, '8', 'hii', 'hlooo', '3', '5', 'sesese'),
(30, '9', 'welcome', 'to ooty', '2', '2', 'fdhvcnfd'),
(31, '9', 'welcome', 'to ooty', '2', '3', 'dfbvb'),
(32, '9', 'welcome', 'to ooty', '3', '4', 'zcbxv '),
(33, '9', 'welcome', 'to ooty', '3', '5', 'DSF'),
(34, '10', 'fd', 'wgrf', '20', '2', 'e5rtfg'),
(35, '10', 'fd', 'wgrf', '13', '3', 'dxc'),
(36, '10', 'fd', 'wgrf', '13', '4', 'rty'),
(37, '10', 'fd', 'wgrf', '13', '5', 'n'),
(38, '11', 'story', 'story', '5', '2', 'drtfg'),
(39, '11', 'story', 'story', '5', '3', 'esrdtfgyh'),
(40, '11', 'story', 'story', '5', '4', 'tryg'),
(41, '11', 'story', 'story', '5', '5', 'ftg'),
(42, '12', 'rg', 'r', '8', '2', 'ft');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `role`, `username`, `password`) VALUES
(1, 'John', 'owner', 'jj', 'jj'),
(2, 'Peter', 'developer', 'pp', 'pp'),
(3, 'Mery', 'developer', 'mm', 'mm'),
(4, 'Krish', 'developer', 'kk', 'kk'),
(5, 'Sony', 'developer', 'ss', 'ss');

-- --------------------------------------------------------

--
-- Table structure for table `story`
--

CREATE TABLE `story` (
  `id` int(2) NOT NULL,
  `title` varchar(50) NOT NULL,
  `discription` varchar(500) NOT NULL,
  `uid` int(3) NOT NULL,
  `value` varchar(10) NOT NULL,
  `did` varchar(4) NOT NULL,
  `point` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `story`
--

INSERT INTO `story` (`id`, `title`, `discription`, `uid`, `value`, `did`, `point`) VALUES
(1, 'dgf', 'fdhgn g ', 1, '5', '-', '-'),
(3, 'gh t h b', 'hbg h b bvtgf', 1, '3', '-', '-'),
(4, 'trsydfhgj', 'estrydh tdjyg', 1, '3', '-', '-'),
(5, 'aaaa', 'dddd', 1, '5', '-', '-'),
(6, 'sss', 'bbbb', 1, '6', '-', '-'),
(7, 'tttt', 'mmm', 1, '3', '-', '-'),
(8, 'hii', 'hlooo', 1, '3', '-', '-'),
(9, 'welcome', 'to ooty', 1, '3', '-', '-'),
(10, 'fd', 'wgrf', 1, '13', '-', '-'),
(11, 'story', 'story', 1, '5', '-', '-'),
(12, 'rg', 'r', 1, '-', '-', '-'),
(13, 'rsdtfyugi', 'drty', 1, '-', '-', '-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `point`
--
ALTER TABLE `point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `story`
--
ALTER TABLE `story`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `point`
--
ALTER TABLE `point`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `story`
--
ALTER TABLE `story`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
