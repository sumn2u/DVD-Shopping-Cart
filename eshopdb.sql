-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2015 at 08:17 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eshopdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie` varchar(20) NOT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `remaining` int(10) NOT NULL DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  `publish` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie` (`movie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `movie`, `rating`, `year`, `price`, `quantity`, `remaining`, `category`, `publish`) VALUES
(1, 'Bride Wars', 'PG', '2009', '19.95', 3, 0, '1', 0),
(2, 'Star Wars', 'PG', '2009', '20.95', 4, 0, '5', 0),
(3, 'X Men Origins', 'PG-13', '2009', '21.95', 9, 0, '5', 0),
(4, 'The Hangover', 'R', '2009', '22.95', 0, 0, '3', 0),
(5, 'Ice Age ', 'PG', '2009', '23.95', 2, 0, '3', 0),
(6, 'District 9', 'R', '2009', '24.95', 0, 0, '3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ShoppingCarts`
--

CREATE TABLE IF NOT EXISTS `ShoppingCarts` (
  `shoppinId` int(11) NOT NULL AUTO_INCREMENT,
  `cardId` varchar(10) DEFAULT NULL,
  `movie` varchar(20) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `quantity` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`shoppinId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `ShoppingCarts`
--

INSERT INTO `ShoppingCarts` (`shoppinId`, `cardId`, `movie`, `price`, `quantity`) VALUES
(1, '1', 'Bride Wars', '19.95', '1'),
(3, '1', 'Bride Wars', '19.95', '1'),
(4, '2', 'Bride Wars', '19.95', '3'),
(5, '3', 'Bride Wars', '19.95', '2'),
(8, '5', 'Bride Wars', '19.95', '1'),
(10, '1', 'Bride Wars', '19.95', '1'),
(12, '1', 'Bride Wars', '19.95', '1'),
(13, '1', 'Bride Wars', '19.95', '1'),
(16, '1', 'Bride Wars', '19.95', '1'),
(17, '1', 'Bride Wars', '19.95', '2'),
(20, '6', 'Ice Age ', '23.95', '2'),
(21, '6', 'District 9', '24.95', '4'),
(22, '6', 'District 9', '24.95', '2'),
(23, '6', 'Ice Age ', '23.95', '3'),
(24, '6', 'The Hangover', '22.95', '3'),
(25, '6', 'District 9', '24.95', '2'),
(26, '6', 'District 9', '24.95', '2'),
(27, '6', 'The Hangover', '22.95', '2'),
(28, '6', 'The Hangover', '22.95', '3'),
(29, '6', 'Ice Age ', '23.95', '2'),
(30, '6', 'District 9', '24.95', '2'),
(31, '6', 'The Hangover', '22.95', '-1'),
(37, '6', 'District 9', '24.95', '-1'),
(38, '6', 'Ice Age ', '23.95', '-1'),
(39, '6', 'The Hangover', '22.95', '-1'),
(40, '6', 'The Hangover', '22.95', '-1'),
(41, '6', 'Ice Age ', '23.95', '-1'),
(42, '6', 'District 9', '24.95', '2'),
(43, '6', 'Ice Age ', '23.95', '2'),
(44, '6', 'The Hangover', '22.95', '3'),
(45, '6', 'District 9', '24.95', '1'),
(46, '6', 'Ice Age ', '23.95', '2'),
(47, '6', 'The Hangover', '22.95', '3'),
(48, '6', 'District 9', '24.95', '0'),
(49, '6', 'Ice Age ', '23.95', '0'),
(50, '6', 'The Hangover', '22.95', '2'),
(51, '6', 'The Hangover', '22.95', '3'),
(52, '6', 'Ice Age ', '23.95', '4'),
(53, '6', 'District 9', '24.95', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(250) NOT NULL,
  `publish` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `cat_name`, `publish`) VALUES
(1, 'National Geographic Channel DVDs', 1),
(2, 'Adventure and Exploration', 0),
(3, 'Culture, History and Relegions', 1),
(5, 'Motion Animations', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `userpass` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `userpass`, `active`) VALUES
(2, 'suman', '¼`\0íSï–Q\0š\Z”ýdI', 1),
(4, 'admin', 'ë dO(\0Œ¶®4í40-Ó ', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
