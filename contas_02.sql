-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2022 at 10:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `critical_point`
--

-- --------------------------------------------------------

--
-- Table structure for table `contas_02`
--

CREATE TABLE `contas_02` (
  `ID` int(11) NOT NULL,
  `C_USERNAME` varchar(255) NOT NULL,
  `C_EMAIL` varchar(255) NOT NULL,
  `C_SENHA` varchar(255) NOT NULL,
  `C_FOTO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contas_02`
--

INSERT INTO `contas_02` (`ID`, `C_USERNAME`, `C_EMAIL`, `C_SENHA`, `C_FOTO`) VALUES
(4, 'cat', 'cat@cat.cat', 'CAT', '33fc2d768c7ad806a7a0.jpg'),
(5, 'ya', 'ya@ya.ya', 'YA', 'dfea7ec8838fcd2114a1.gif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contas_02`
--
ALTER TABLE `contas_02`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contas_02`
--
ALTER TABLE `contas_02`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
