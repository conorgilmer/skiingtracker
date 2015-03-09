-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2015 at 04:04 PM
-- Server version: 5.5.31
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `skiplan`
--
CREATE DATABASE IF NOT EXISTS `skiplan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `skiplan`;

-- --------------------------------------------------------

--
-- Table structure for table `adminusers`
--

CREATE TABLE IF NOT EXISTS `adminusers` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `adminusers`
--

INSERT INTO `adminusers` (`user_id`, `username`, `password`) VALUES
(1, 'admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `skicosts`
--

CREATE TABLE IF NOT EXISTS `skicosts` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `skihol_id` int(6) NOT NULL,
  `location` varchar(25) DEFAULT NULL,
  `flights` decimal(5,2) DEFAULT NULL,
  `transfers` decimal(5,2) DEFAULT NULL,
  `accommodation` decimal(5,2) DEFAULT NULL,
  `skipass` decimal(5,2) DEFAULT NULL,
  `skihire` decimal(5,2) DEFAULT NULL,
  `total` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skihol_id` (`skihol_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `skiday`
--

CREATE TABLE IF NOT EXISTS `skiday` (
  `skiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `skihol_id` int(11) NOT NULL,
  `ski_time` int(11) DEFAULT NULL,
  `ski_lifts` int(11) DEFAULT NULL,
  `ski_lift_km` decimal(5,2) DEFAULT NULL,
  `ski_lift_time` int(11) DEFAULT NULL,
  `ski_distance` decimal(5,2) DEFAULT NULL,
  `ski_crow` decimal(5,2) DEFAULT NULL,
  `ski_runs_green` int(11) DEFAULT NULL,
  `ski_runs_blue` int(11) DEFAULT NULL,
  `ski_runs_red` int(11) DEFAULT NULL,
  `ski_runs_black` int(11) DEFAULT NULL,
  `ski_runs_total` int(11) DEFAULT NULL,
  `ski_desc` varchar(40) DEFAULT NULL,
  `ski_breaks` int(11) DEFAULT NULL,
  `ski_breaks_time` int(11) DEFAULT NULL,
  `ski_highest` int(11) DEFAULT NULL,
  `ski_lowest` int(11) DEFAULT NULL,
  `ski_date` date DEFAULT NULL,
  PRIMARY KEY (`skiday_id`),
  KEY `skihol_id` (`skihol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skiholiday`
--

CREATE TABLE IF NOT EXISTS `skiholiday` (
  `ski_id` int(11) NOT NULL AUTO_INCREMENT,
  `ski_days` int(11) DEFAULT NULL,
  `ski_place` varchar(40) DEFAULT NULL,
  `ski_desc` varchar(50) DEFAULT NULL,
  `ski_date` date DEFAULT NULL,
  PRIMARY KEY (`ski_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Constraints for dumped tables
--

--
-- Constraints for table `skicosts`
--
ALTER TABLE `skicosts`
  ADD CONSTRAINT `skicosts_ibfk_1` FOREIGN KEY (`skihol_id`) REFERENCES `skiholiday` (`ski_id`);

--
-- Constraints for table `skiday`
--
ALTER TABLE `skiday`
  ADD CONSTRAINT `skiday_ibfk_1` FOREIGN KEY (`skihol_id`) REFERENCES `skiholiday` (`ski_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
