-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 03, 2024 at 06:53 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
CREATE TABLE IF NOT EXISTS `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `classtime` varchar(32) DEFAULT NULL,
  `isdeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `courseid`, `startdate`, `enddate`, `classtime`, `isdeleted`) VALUES
(1, 1, '2024-06-29', '2024-11-29', '1:00 AM to 3:00 AM', 0),
(6, 6, '2024-07-27', '2024-07-19', '1:00 AM to 3:00 AM', 0),
(3, 3, '2024-07-04', '2024-12-04', '1:00 AM to 3:00 AM', 1),
(5, 4, '2024-07-10', '2024-12-28', '1:00 AM to 3:00 AM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `description` text,
  `isdeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `fees`, `duration`, `description`, `isdeleted`) VALUES
(1, 'PSI', '5000000.00', '21', 'Police sub inspector\r\n                        ', 0),
(3, 'ASI', '400000.00', '320', 'Assistance Sub-inspector\r\n                        ', 0),
(4, 'SI', '50000.00', '120', 'Sub-inspector\r\n                        ', 0),
(5, 'DFS', '150000.00', '180', 'Data and File Structure\r\n                        ', 0),
(6, 'c++', '1.00', '130', ' oop\r\n                                                ', 0),
(7, 'iks', '8000.00', '90', '\r\n                   serdxsrt4fed4s     ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
CREATE TABLE IF NOT EXISTS `lecture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `batchid` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `lecturedate` date NOT NULL,
  `payoutid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`id`, `teacherid`, `subjectid`, `batchid`, `duration`, `amount`, `lecturedate`, `payoutid`) VALUES
(3, 1, 2, 5, 150, '42.75', '2024-03-20', NULL),
(2, 2, 3, 3, 120, '35.50', '2024-02-15', NULL),
(1, 1, 1, 1, 90, '25.00', '2024-01-05', NULL),
(4, 2, 1, 6, 180, '50.00', '2024-04-10', NULL),
(5, 1, 3, 1, 100, '28.50', '2024-05-12', NULL),
(6, 2, 2, 3, 130, '36.75', '2024-06-18', NULL),
(7, 1, 1, 5, 170, '47.00', '2024-07-22', NULL),
(8, 2, 3, 6, 200, '55.25', '2024-08-08', NULL),
(9, 1, 2, 1, 110, '30.75', '2024-09-14', NULL),
(10, 2, 1, 3, 140, '38.25', '2024-10-25', NULL),
(11, 1, 3, 5, 160, '45.50', '2024-11-05', NULL),
(12, 2, 2, 6, 190, '52.75', '2024-12-19', NULL),
(13, 1, 1, 1, 95, '27.50', '2024-01-10', NULL),
(14, 2, 3, 3, 125, '34.00', '2024-02-20', NULL),
(15, 1, 2, 5, 155, '43.25', '2024-03-25', NULL),
(16, 2, 1, 6, 185, '51.50', '2024-04-15', NULL),
(17, 1, 3, 1, 105, '29.75', '2024-05-18', NULL),
(18, 2, 2, 3, 135, '37.50', '2024-06-22', NULL),
(19, 1, 1, 5, 175, '48.25', '2024-07-28', NULL),
(20, 2, 3, 6, 205, '56.50', '2024-08-12', NULL),
(21, 1, 2, 1, 115, '32.00', '2024-09-19', NULL),
(22, 2, 1, 3, 145, '39.75', '2024-10-30', NULL),
(23, 1, 3, 5, 165, '46.00', '2024-11-10', NULL),
(24, 2, 2, 6, 195, '54.25', '2024-12-23', NULL),
(25, 1, 1, 1, 85, '24.50', '2024-01-02', NULL),
(26, 2, 3, 3, 115, '32.50', '2024-02-10', NULL),
(27, 1, 2, 5, 145, '40.75', '2024-03-15', NULL),
(28, 2, 1, 6, 175, '48.00', '2024-04-05', NULL),
(29, 1, 3, 1, 95, '27.25', '2024-05-08', NULL),
(30, 2, 2, 3, 125, '34.50', '2024-06-12', NULL),
(31, 1, 1, 5, 165, '46.25', '2024-07-16', NULL),
(32, 2, 3, 6, 195, '54.50', '2024-08-20', NULL),
(33, 1, 2, 1, 105, '29.50', '2024-09-25', NULL),
(34, 2, 1, 3, 135, '37.25', '2024-10-05', NULL),
(35, 1, 3, 5, 155, '43.50', '2024-11-08', NULL),
(36, 2, 2, 6, 185, '51.75', '2024-12-18', NULL),
(37, 1, 1, 1, 100, '28.75', '2024-01-20', NULL),
(38, 2, 3, 3, 130, '36.00', '2024-02-25', NULL),
(39, 1, 2, 5, 160, '45.25', '2024-03-10', NULL),
(40, 2, 1, 6, 190, '52.50', '2024-04-20', NULL),
(41, 1, 3, 1, 110, '31.25', '2024-05-02', NULL),
(42, 2, 2, 3, 140, '38.50', '2024-06-06', NULL),
(43, 1, 1, 5, 170, '47.25', '2024-07-10', NULL),
(44, 2, 3, 6, 200, '55.50', '2024-08-22', NULL),
(45, 1, 2, 1, 115, '32.50', '2024-09-30', NULL),
(46, 2, 1, 3, 145, '40.25', '2024-10-10', NULL),
(47, 1, 3, 5, 175, '48.50', '2024-11-15', NULL),
(48, 2, 2, 6, 205, '56.75', '2024-12-25', NULL),
(49, 1, 1, 1, 95, '27.00', '2024-01-08', NULL),
(50, 2, 3, 3, 125, '34.25', '2024-02-18', NULL),
(51, 1, 2, 5, 155, '43.75', '2024-03-22', NULL),
(52, 2, 1, 6, 185, '51.00', '2024-04-12', NULL),
(53, 1, 3, 1, 105, '29.50', '2024-05-16', NULL),
(54, 2, 2, 3, 135, '37.75', '2024-06-26', NULL),
(55, 1, 1, 5, 165, '46.50', '2024-07-30', NULL),
(56, 2, 3, 6, 195, '54.75', '2024-08-14', NULL),
(57, 1, 2, 1, 115, '32.50', '2024-09-18', NULL),
(58, 2, 1, 3, 145, '40.75', '2024-10-28', NULL),
(59, 1, 3, 5, 175, '48.75', '2024-11-01', NULL),
(60, 2, 2, 6, 205, '57.00', '2024-12-13', NULL),
(61, 1, 1, 1, 90, '25.25', '2024-01-15', NULL),
(62, 2, 3, 3, 120, '35.75', '2024-02-25', NULL),
(63, 1, 2, 5, 150, '42.00', '2024-03-30', NULL),
(64, 2, 1, 6, 180, '49.50', '2024-04-20', NULL),
(65, 1, 3, 1, 100, '28.25', '2024-05-22', NULL),
(66, 2, 2, 3, 130, '36.50', '2024-06-25', NULL),
(67, 1, 1, 5, 170, '46.25', '2024-07-29', NULL),
(68, 2, 3, 6, 200, '55.75', '2024-08-15', NULL),
(69, 1, 2, 1, 110, '31.00', '2024-09-20', NULL),
(70, 2, 1, 3, 140, '38.50', '2024-10-30', NULL),
(71, 1, 3, 5, 160, '44.75', '2024-11-10', NULL),
(72, 2, 2, 6, 190, '52.00', '2024-12-22', NULL),
(73, 1, 1, 1, 95, '27.00', '2024-01-05', NULL),
(74, 2, 3, 3, 125, '34.50', '2024-02-15', NULL),
(75, 1, 2, 5, 155, '43.00', '2024-03-20', NULL),
(76, 2, 1, 6, 185, '50.25', '2024-04-10', NULL),
(77, 1, 3, 1, 105, '29.50', '2024-05-12', NULL),
(78, 2, 2, 3, 135, '37.75', '2024-06-18', NULL),
(79, 1, 1, 5, 175, '48.50', '2024-07-22', NULL),
(80, 2, 3, 6, 205, '56.75', '2024-08-08', NULL),
(81, 1, 2, 1, 115, '32.25', '2024-09-14', NULL),
(82, 2, 1, 3, 145, '40.75', '2024-10-25', NULL),
(83, 1, 3, 5, 165, '46.50', '2024-11-05', NULL),
(84, 2, 2, 6, 195, '54.75', '2024-12-19', NULL),
(85, 1, 1, 1, 100, '28.25', '2024-01-10', NULL),
(86, 2, 3, 3, 130, '36.50', '2024-02-20', NULL),
(87, 1, 2, 5, 160, '44.75', '2024-03-25', NULL),
(88, 2, 1, 6, 190, '52.00', '2024-04-15', NULL),
(89, 1, 3, 1, 110, '31.25', '2024-05-18', NULL),
(90, 2, 2, 3, 140, '38.50', '2024-06-22', NULL),
(91, 1, 1, 5, 170, '47.25', '2024-07-28', NULL),
(92, 2, 3, 6, 200, '55.50', '2024-08-12', NULL),
(93, 1, 2, 1, 110, '31.50', '2024-09-19', NULL),
(94, 2, 1, 3, 140, '38.75', '2024-10-30', NULL),
(95, 1, 3, 5, 160, '44.50', '2024-11-10', NULL),
(96, 2, 2, 6, 190, '52.75', '2024-12-23', NULL),
(97, 1, 1, 1, 95, '27.25', '2024-01-20', NULL),
(98, 2, 3, 3, 125, '34.75', '2024-02-25', NULL),
(99, 1, 2, 5, 155, '43.00', '2024-03-10', NULL),
(100, 2, 1, 6, 185, '51.25', '2024-04-05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payout`
--

DROP TABLE IF EXISTS `payout`;
CREATE TABLE IF NOT EXISTS `payout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) NOT NULL,
  `orderdate` date NOT NULL,
  `remarks` text,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `isdeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `courseid`, `title`, `rate`, `isdeleted`) VALUES
(1, 1, 'Account', '10000.00', 0),
(2, 6, 'OOP', '50000.00', 0),
(3, 5, 'Algorithm', '500000.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `isdeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `mobile`, `email`, `gender`, `qualification`, `experience`, `photo`, `isdeleted`) VALUES
(1, 'Azim Ajmeri', '1234567890', 'zbc@yahoo.com', 1, 'ITUS', 19, '3831_hacker.png', 1),
(2, 'Award Anshuman', '0000000001', 'girgardan@ghat.com', 1, 'Road Roller', 30, '7639_award-anshuman.png', 0),
(3, 'Baburao', '0000000010', 'baburao@aapte.com', 1, 'Dopaher_tak', 30, '9702_baburao.jpeg', 0),
(4, 'Bandya', '0000000100', 'bandy@chips.com', 1, 'chips_mang_raha_he', 23, '8424_bandya.webp', 0),
(5, 'Kachra Seth', '0000001000', 'kachra@kadak.he.com', 1, '150_rupeeya_dega', 30, '6531_kachra seth.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`) VALUES
(2, 'admin@gmail.com', '$2y$10$IOzBx2xJIHv8PEQOCbCzjebCLQNPdARcgSuh76qEIJUl7Vb8yf0am', '2024-07-13 07:05:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
