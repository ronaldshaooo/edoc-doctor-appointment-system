-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2022 at 01:39 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aemail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@test.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appoid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  PRIMARY KEY (`appoid`),
  KEY `pid` (`pid`),
  KEY `scheduleid` (`scheduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(1, 1, 1, 1, '2023-12-01'),
(2, 2, 2, 1, '2023-12-01'),
(3, 3, 3, 1, '2023-12-01'),
(4, 4, 4, 1, '2023-12-01'),
(5, 5, 5, 1, '2023-12-01'),
(6, 6, 6, 1, '2023-12-01'),
(7, 7, 7, 1, '2023-12-01'),
(8, 8, 8, 1, '2023-12-01'),
(9, 1, 1, 2, '2023-12-02'),
(10, 2, 2, 2, '2023-12-02'),
(11, 3, 3, 2, '2023-12-02'),
(12, 4, 4, 2, '2023-12-02'),
(13, 5, 5, 2, '2023-12-02'),
(14, 6, 6, 2, '2023-12-02'),
(15, 7, 7, 2, '2023-12-02'),
(16, 8, 8, 2, '2023-12-02'),
(17, 9, 9, 2, '2023-12-02'),
(18, 10, 10, 2, '2023-12-02'),
(19, 11, 11, 2, '2023-12-02'),
(20, 12, 12, 2, '2023-12-02'),
(21, 1, 1, 3, '2023-12-03'),
(22, 2, 2, 3, '2023-12-03'),
(23, 3, 3, 3, '2023-12-03'),
(24, 4, 4, 3, '2023-12-03'),
(25, 5, 5, 3, '2023-12-03'),
(26, 6, 6, 3, '2023-12-03'),
(27, 7, 7, 3, '2023-12-03'),
(28, 8, 8, 3, '2023-12-03'),
(29, 1, 1, 4, '2023-12-04'),
(30, 2, 2, 4, '2023-12-04');
-- --------------------------------------------------------

--
-- Table structure for table `appointment_review`
--

DROP TABLE IF EXISTS `appointment_review`;
CREATE TABLE IF NOT EXISTS `appointment_review` (
  `reviewid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `rank` int(2) DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `pid` (`pid`),
  KEY `scheduleid` (`scheduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docidc` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`docid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docid`, `docemail`, `docname`, `docpassword`, `docidc`, `doctel`) VALUES
(1, 'doctor1@test.com', '陳醫生', '123', 'F123456780', '0912345670'),
(2, 'doctor2@test.com', '李醫生', '123', 'F123456781', '0912345671'),
(3, 'doctor3@test.com', '王醫生', '123', 'F123456782', '0912345672'),
(4, 'doctor4@test.com', '林醫生', '123', 'F123456783', '0912345673'),
(5, 'doctor5@test.com', '張醫生', '123', 'F123456784', '0912345674'),
(6, 'doctor6@test.com', '趙醫生', '123', 'F123456785', '0912345675'),
(7, 'doctor7@test.com', '徐醫生', '123', 'F123456786', '0912345676'),
(8, 'doctor8@test.com', '朱醫生', '123', 'F123456787', '0912345677'),
(9, 'doctor9@test.com', '吳醫生', '123', 'F123456788', '0912345678'),
(10, 'doctor10@test.com', '鄭醫生', '123', 'F123456789', '0912345679');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pidc` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pidc`, `pdob`, `ptel`) VALUES
(1, 'patient1@test.com', '王一明', '123', '台北', 'F123456780', '1981-01-01', '0912345670'),
(2, 'patient2@test.com', '林二明', '123', '台北', 'F123456780', '1982-06-03', '0912345670'),
(3, 'patient3@test.com', '王三明', '123', '台北', 'F123456780', '1983-01-01', '0912345670'),
(4, 'patient4@test.com', '林四明', '123', '台北', 'F123456780', '1984-06-03', '0912345670'),
(5, 'patient5@test.com', '王五明', '123', '台北', 'F123456780', '1985-01-01', '0912345670'),
(6, 'patient6@test.com', '林六明', '123', '台北', 'F123456780', '1986-06-03', '0912345670'),
(7, 'patient7@test.com', '王七明', '123', '台北', 'F123456780', '1987-01-01', '0912345670'),
(8, 'patient8@test.com', '林八明', '123', '台北', 'F123456780', '1988-06-03', '0912345670'),
(9, 'patient9@test.com', '王九明', '123', '台北', 'F123456780', '1989-01-01', '0912345670'),
(10, 'patient10@test.com', '林零明', '123', '台北', 'F223456780', '1990-06-03', '0912345670'),
(11, 'patient11@test.com', '陳一明', '123', '台北', 'F223456780', '1991-01-01', '0912345670'),
(12, 'patient12@test.com', '吳二明', '123', '台北', 'F223456780', '1992-06-03', '0912345670'),
(13, 'patient13@test.com', '陳三明', '123', '台北', 'F223456780', '1993-01-01', '0912345670'),
(14, 'patient14@test.com', '吳四明', '123', '台北', 'F223456780', '1994-06-03', '0912345670'),
(15, 'patient15@test.com', '陳五明', '123', '台北', 'F223456780', '1995-01-01', '0912345670'),
(16, 'patient16@test.com', '吳六明', '123', '台北', 'F223456780', '1996-06-03', '0912345670'),
(17, 'patient17@test.com', '陳七明', '123', '台北', 'F223456780', '1982-01-01', '0912345670'),
(18, 'patient18@test.com', '吳八明', '123', '台北', 'F223456780', '1982-06-03', '0912345670'),
(19, 'patient19@test.com', '陳九明', '123', '台北', 'F223456780', '1972-01-01', '0912345670'),
(20, 'patient20@test.com', '吳零明', '123', '台北', 'F223456780', '1971-06-03', '0912345670'),
(21, 'patient21@test.com', '趙一明', '123', '台北', 'F133456780', '1973-01-01', '0912345670'),
(22, 'patient22@test.com', '徐二明', '123', '台北', 'F133456780', '1974-06-03', '0912345670'),
(23, 'patient23@test.com', '趙三明', '123', '台北', 'F133456780', '1975-01-01', '0912345670'),
(24, 'patient24@test.com', '徐四明', '123', '台北', 'F133456780', '1976-06-03', '0912345670'),
(25, 'patient25@test.com', '趙五明', '123', '台北', 'F133456780', '1977-01-01', '0912345670'),
(26, 'patient26@test.com', '徐六明', '123', '台北', 'F133456780', '2022-06-03', '0912345670'),
(27, 'patient27@test.com', '趙七明', '123', '台北', 'F133456780', '2000-01-01', '0912345670'),
(28, 'patient28@test.com', '徐八明', '123', '台北', 'F133456780', '2022-06-03', '0912345670'),
(29, 'patient29@test.com', '趙九明', '123', '台北', 'F133456780', '2000-01-01', '0912345670'),
(30, 'patient30@test.com', '徐零明', '123', '台北', 'F133456780', '2022-06-03', '0912345670');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  PRIMARY KEY (`scheduleid`),
  KEY `docid` (`docid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`) VALUES
(1, '1', '耳鼻喉科', '2023-12-21', '18:00:00'),
(2, '1', '耳鼻喉科', '2023-12-22', '18:00:00'),
(3, '1', '耳鼻喉科', '2023-12-23', '18:00:00'),
(4, '1', '耳鼻喉科', '2023-12-24', '18:00:00'),
(5, '1', '耳鼻喉科', '2023-12-25', '18:00:00'),
(6, '1', '耳鼻喉科', '2023-12-26', '18:00:00'),
(7, '1', '耳鼻喉科', '2023-12-27', '18:00:00'),
(8, '1', '耳鼻喉科', '2023-12-28', '18:00:00'),
(9, '1', '耳鼻喉科', '2023-12-29', '18:00:00'),
(10, '1', '耳鼻喉科', '2023-12-30', '18:00:00'),
(11, '1', '耳鼻喉科', '2023-12-31', '18:00:00'),
(12, '1', '耳鼻喉科', '2023-01-01', '18:00:00'),
(13, '1', '耳鼻喉科', '2023-01-02', '18:00:00'),
(14, '1', '耳鼻喉科', '2023-01-03', '18:00:00'),
(15, '1', '耳鼻喉科', '2023-01-04', '18:00:00'),
(16, '1', '耳鼻喉科', '2023-01-05', '18:00:00'),
(17, '1', '耳鼻喉科', '2023-01-06', '18:00:00'),
(18, '1', '耳鼻喉科', '2023-01-07', '18:00:00'),
(19, '1', '耳鼻喉科', '2023-01-08', '18:00:00'),
(20, '2', '耳鼻喉科', '2023-01-09', '18:00:00'),
(21, '1', '耳鼻喉科', '2023-01-10', '18:00:00'),
(22, '1', '耳鼻喉科', '2023-01-11', '18:00:00'),
(23, '1', '耳鼻喉科', '2023-01-12', '18:00:00'),
(24, '1', '耳鼻喉科', '2023-01-13', '18:00:00'),
(25, '1', '耳鼻喉科', '2023-01-14', '18:00:00'),
(26, '1', '耳鼻喉科', '2023-01-15', '18:00:00'),
(27, '1', '耳鼻喉科', '2023-01-16', '18:00:00'),
(28, '1', '耳鼻喉科', '2023-01-17', '18:00:00'),
(29, '1', '耳鼻喉科', '2023-01-18', '18:00:00'),
(30, '1', '耳鼻喉科', '2023-01-19', '18:00:00'),
(31, '1', '耳鼻喉科', '2023-01-20', '18:00:00');
--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE IF NOT EXISTS `blacklist` (
  `blackid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  PRIMARY KEY (`blackid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `blacklist` (`blackid`, `pid`, `appodate`) VALUES
(1, 2, '2023-12-10'),
(2, 2, '2023-12-11'),
(3, 2, '2023-12-13');

-- --------------------------------------------------------

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
