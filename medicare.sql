-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2020 at 09:12 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicare`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `address` char(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `channelledDocName` varchar(50) NOT NULL,
  `phoneNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `patientName`, `address`, `email`, `age`, `channelledDocName`, `phoneNo`) VALUES
(23, 'ranga', 'kandy', 'ranga@gmail.com', 35, 'pawan', '0715264850'),
(26, 'sahan', 'galle', 'sahan@gmail.com', 25, 'perera', '0758695478'),
(28, 'abc', 'gampaha', 'abc@gmail.com', 65, 'dinesh', '0758456985'),
(29, 'amila', 'galle', 'amila@gmail.com', 26, 'pawan', '0775678421'),
(30, 'amila', 'galle', 'amila@gmail.com', 26, 'pawan', '0775678421'),
(31, 'amila', 'galle', 'amila@gmail.com', 26, 'pawan', '0775678421'),
(32, 'asd', 'kandy', 'sampath@gmail.com', 25, 'dave', '0775678421'),
(33, 'dasun', 'kandy', 'dasungmail.com', 35, 'senawirathna', '0715264858'),
(34, 'dasun', 'kandy', 'dasungmail.com', 35, 'senawirathna', '0715264858');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
