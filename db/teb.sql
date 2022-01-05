-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2021 at 04:22 PM
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
  `user_email` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `link` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `activation_link`
--

INSERT INTO `activation_link` (`id_activation_link`, `user_email`, `created_at`, `updated_at`, `link`) VALUES
(12, 'hermanwebmasterpl@gmail.com', '2021-12-05 14:57:50', '2021-12-05 14:59:23', '8f8b8b12c7b2dbc0b48437ad8bb823');

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
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` tinyint(3) UNSIGNED NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`, `description`) VALUES
(1, 'user', 'user'),
(2, 'admin', 'Administrator'),
(3, 'moderator', 'Moderator');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `activity_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `role_id` tinyint(3) NOT NULL DEFAULT 1,
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

INSERT INTO `users` (`user_id`, `email`, `city_id`, `activity_id`, `role_id`, `name`, `surname`, `birthday`, `gender`, `create_user`, `password`) VALUES
(27, 'hermanwebmasterpl@gmail.com', 1, 2, 1, 'Herman', 'Kudria', '2021-12-15', 1, '2021-12-05 14:57:48', '$2y$10$J87jqCRf2bY5wfSecgwg0.KzHJXh1061kBKSYfDHBws5YPWSyW4PO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activation_link`
--
ALTER TABLE `activation_link`
  ADD PRIMARY KEY (`id_activation_link`);

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
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

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
-- AUTO_INCREMENT for table `activation_link`
--
ALTER TABLE `activation_link`
  MODIFY `id_activation_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
