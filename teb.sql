-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2021 at 10:04 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activation_link`
--

CREATE TABLE `activation_link` (
  `id_activation_link` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `link` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` tinyint(3) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `description`) VALUES
(1, 'konto nieaktywne, użytkownik musi dokonać aktwywacji przez poczte elektronicną'),
(2, 'konto aktywne, użytkownik dokonał aktwywacji przez poczte elektronicną'),
(3, 'konto zablokowane, użytkownik ma zablokowane koto przez administratora systemu'),
(4, 'konto usunięto, nie ma możliwości renowacji konta ');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(10) UNSIGNED NOT NULL,
  `city` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city`) VALUES
(1, 'Poznań'),
(2, 'Gniezno'),
(3, 'Jarocin'),
(4, 'Wroclaw');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `activity_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(20) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `birthday` date NOT NULL,
  `gender` tinyint(1) NOT NULL COMMENT 'men 1 - women 0',
  `create_user` datetime NOT NULL DEFAULT current_timestamp(),
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `city_id`, `activity_id`, `name`, `surname`, `birthday`, `gender`, `create_user`, `password`) VALUES
(1, 'Dasdf@ffdel.re', 1, 1, 'Hher', 'Dffw', '2021-12-21', 1, '2021-12-04 14:26:44', '$2y$10$bkAkMeyKr1nFUMq2nUG.9efEGDeTL8z2X/swgMdRCRR41dCvM6k/u'),
(2, '123@dss.ru', 1, 1, 'Xasca', 'Asda', '2021-12-08', 1, '2021-12-04 15:03:30', '$2y$10$eeMnQXLjYfqsQPx7aprIROUzNRNnKcGmeMWBZtCLM5fC8rIP5rDvC'),
(3, 'He@ge.ge', 1, 1, 'Heee', 'Reeee', '2021-12-28', 0, '2021-12-04 15:14:34', '$2y$10$yJVWb8VntNJEGBM7oN/woexOKWx9OhRNk8gonM995PRCPML3vfBr.'),
(4, 'Hermanwebmasterpl@gmail.com', 1, 1, 'Herman', 'Kudria', '2021-12-28', 0, '2021-12-05 10:02:56', '$2y$10$PC9ysbXywXUkb0TWHcRTTu4C4nVz7EzUJndlTpC388FoC62KEaeOS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
