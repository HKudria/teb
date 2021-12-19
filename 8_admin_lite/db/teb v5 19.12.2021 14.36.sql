-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2021 at 02:35 PM
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
(3, 'hermanwebmasterpl@gmail.com', '2021-12-18 16:50:03', '2021-12-18 16:50:08', '3d779fa6f94a212d4a900b178555b6');

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
-- Table structure for table `ActivityType`
--

CREATE TABLE `ActivityType` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `AvailabilityType`
--

CREATE TABLE `AvailabilityType` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `CDVActivity`
--

CREATE TABLE `CDVActivity` (
  `activity_type_id` int(11) NOT NULL,
  `practitioner_id` int(11) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `CDVSubject`
--

CREATE TABLE `CDVSubject` (
  `id` int(11) NOT NULL,
  `field_of_study_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `study_mode_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE `Company` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ContactSource`
--

CREATE TABLE `ContactSource` (
  `contact_source_type_id` int(11) NOT NULL,
  `practitioner_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `reference_practitioner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ContactSourceType`
--

CREATE TABLE `ContactSourceType` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `require_practitioner` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Cooperation`
--

CREATE TABLE `Cooperation` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `practitioner_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `EducationHistory`
--

CREATE TABLE `EducationHistory` (
  `id` int(11) NOT NULL,
  `practitioner_id` int(11) DEFAULT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `specialisation` varchar(255) DEFAULT NULL,
  `certificate` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `FieldOfStudy`
--

CREATE TABLE `FieldOfStudy` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Language`
--

CREATE TABLE `Language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `LearningHistory`
--

CREATE TABLE `LearningHistory` (
  `id` int(11) NOT NULL,
  `practitioner_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `place` text DEFAULT NULL,
  `place_type_id` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PlaceType`
--

CREATE TABLE `PlaceType` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Practitioner`
--

CREATE TABLE `Practitioner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cdv_email` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(11) DEFAULT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `practitioner_card` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `thesis` int(11) DEFAULT NULL,
  `commercial_projects_hours` int(11) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `commercial_experience_years` int(11) DEFAULT NULL,
  `participation_in_finished_project` tinyint(1) DEFAULT NULL,
  `team_management` tinyint(1) DEFAULT NULL,
  `publications` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PractitionerAvalability`
--

CREATE TABLE `PractitionerAvalability` (
  `availability_type_id` int(11) NOT NULL,
  `practitioner_id` int(11) NOT NULL,
  `rate_per_hour` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PractitionerCompany`
--

CREATE TABLE `PractitionerCompany` (
  `practitioner_id` int(11) NOT NULL,
  `comany_id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `is_owner` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PractitionerLanguage`
--

CREATE TABLE `PractitionerLanguage` (
  `practitioner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Rating`
--

CREATE TABLE `Rating` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `cooperation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `References`
--

CREATE TABLE `References` (
  `id` int(11) NOT NULL,
  `practitioner_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin'),
(3, 'moderator');

-- --------------------------------------------------------

--
-- Table structure for table `StudyMode`
--

CREATE TABLE `StudyMode` (
  `id` int(11) NOT NULL,
  `mode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Term`
--

CREATE TABLE `Term` (
  `id` int(11) NOT NULL,
  `name` varchar(5) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthday` date NOT NULL,
  `avatar` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activity_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `name`, `surname`, `email`, `password`, `gender`, `birthday`, `avatar`, `created_at`, `updated_at`, `activity_id`) VALUES
(4, 'Herman', 'Kudria', 'hermanwebmasterpl@gmail.com', '$2y$10$3GiEBQpNT6gfG2lofB1hae4joEXLCHHkm2R76YEzF1vgWU9FAWSwG', 1, '2021-12-28', 'avatar5.png', '2021-12-19 09:59:50', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `UserRole`
--

CREATE TABLE `UserRole` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `UserRole`
--

INSERT INTO `UserRole` (`user_id`, `role_id`) VALUES
(4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activation_link`
--
ALTER TABLE `activation_link`
  ADD PRIMARY KEY (`id_activation_link`);

--
-- Indexes for table `ActivityType`
--
ALTER TABLE `ActivityType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `AvailabilityType`
--
ALTER TABLE `AvailabilityType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CDVActivity`
--
ALTER TABLE `CDVActivity`
  ADD PRIMARY KEY (`activity_type_id`,`practitioner_id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Indexes for table `CDVSubject`
--
ALTER TABLE `CDVSubject`
  ADD PRIMARY KEY (`id`,`field_of_study_id`),
  ADD KEY `field_of_study_id` (`field_of_study_id`),
  ADD KEY `study_mode_id` (`study_mode_id`);

--
-- Indexes for table `Company`
--
ALTER TABLE `Company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ContactSource`
--
ALTER TABLE `ContactSource`
  ADD PRIMARY KEY (`contact_source_type_id`,`practitioner_id`),
  ADD KEY `practitioner_id` (`practitioner_id`),
  ADD KEY `reference_practitioner` (`reference_practitioner`);

--
-- Indexes for table `ContactSourceType`
--
ALTER TABLE `ContactSourceType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Cooperation`
--
ALTER TABLE `Cooperation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_id` (`subject_id`,`practitioner_id`,`term_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Indexes for table `EducationHistory`
--
ALTER TABLE `EducationHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Indexes for table `FieldOfStudy`
--
ALTER TABLE `FieldOfStudy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Language`
--
ALTER TABLE `Language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `LearningHistory`
--
ALTER TABLE `LearningHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practitioner_id` (`practitioner_id`),
  ADD KEY `place_type_id` (`place_type_id`);

--
-- Indexes for table `PlaceType`
--
ALTER TABLE `PlaceType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Practitioner`
--
ALTER TABLE `Practitioner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cdv_email` (`cdv_email`);

--
-- Indexes for table `PractitionerAvalability`
--
ALTER TABLE `PractitionerAvalability`
  ADD PRIMARY KEY (`availability_type_id`,`practitioner_id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Indexes for table `PractitionerCompany`
--
ALTER TABLE `PractitionerCompany`
  ADD PRIMARY KEY (`practitioner_id`,`comany_id`),
  ADD KEY `comany_id` (`comany_id`);

--
-- Indexes for table `PractitionerLanguage`
--
ALTER TABLE `PractitionerLanguage`
  ADD PRIMARY KEY (`practitioner_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `Rating`
--
ALTER TABLE `Rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cooperation_id` (`cooperation_id`);

--
-- Indexes for table `References`
--
ALTER TABLE `References`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `StudyMode`
--
ALTER TABLE `StudyMode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Term`
--
ALTER TABLE `Term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `UserRole`
--
ALTER TABLE `UserRole`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activation_link`
--
ALTER TABLE `activation_link`
  MODIFY `id_activation_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CDVActivity`
--
ALTER TABLE `CDVActivity`
  ADD CONSTRAINT `cdvactivity_ibfk_1` FOREIGN KEY (`activity_type_id`) REFERENCES `ActivityType` (`id`),
  ADD CONSTRAINT `cdvactivity_ibfk_2` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);

--
-- Constraints for table `CDVSubject`
--
ALTER TABLE `CDVSubject`
  ADD CONSTRAINT `cdvsubject_ibfk_1` FOREIGN KEY (`field_of_study_id`) REFERENCES `FieldOfStudy` (`id`),
  ADD CONSTRAINT `cdvsubject_ibfk_2` FOREIGN KEY (`study_mode_id`) REFERENCES `StudyMode` (`id`);

--
-- Constraints for table `ContactSource`
--
ALTER TABLE `ContactSource`
  ADD CONSTRAINT `contactsource_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`),
  ADD CONSTRAINT `contactsource_ibfk_2` FOREIGN KEY (`contact_source_type_id`) REFERENCES `ContactSourceType` (`id`),
  ADD CONSTRAINT `contactsource_ibfk_3` FOREIGN KEY (`reference_practitioner`) REFERENCES `Practitioner` (`id`);

--
-- Constraints for table `Cooperation`
--
ALTER TABLE `Cooperation`
  ADD CONSTRAINT `cooperation_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `CDVSubject` (`id`),
  ADD CONSTRAINT `cooperation_ibfk_2` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`),
  ADD CONSTRAINT `cooperation_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `Term` (`id`),
  ADD CONSTRAINT `cooperation_ibfk_4` FOREIGN KEY (`practitioner_id`) REFERENCES `Cooperation` (`term_id`);

--
-- Constraints for table `EducationHistory`
--
ALTER TABLE `EducationHistory`
  ADD CONSTRAINT `educationhistory_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);

--
-- Constraints for table `LearningHistory`
--
ALTER TABLE `LearningHistory`
  ADD CONSTRAINT `learninghistory_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`),
  ADD CONSTRAINT `learninghistory_ibfk_2` FOREIGN KEY (`place_type_id`) REFERENCES `PlaceType` (`id`);

--
-- Constraints for table `PractitionerAvalability`
--
ALTER TABLE `PractitionerAvalability`
  ADD CONSTRAINT `practitioneravalability_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`),
  ADD CONSTRAINT `practitioneravalability_ibfk_2` FOREIGN KEY (`availability_type_id`) REFERENCES `AvailabilityType` (`id`);

--
-- Constraints for table `PractitionerCompany`
--
ALTER TABLE `PractitionerCompany`
  ADD CONSTRAINT `practitionercompany_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`),
  ADD CONSTRAINT `practitionercompany_ibfk_2` FOREIGN KEY (`comany_id`) REFERENCES `Company` (`id`);

--
-- Constraints for table `PractitionerLanguage`
--
ALTER TABLE `PractitionerLanguage`
  ADD CONSTRAINT `practitionerlanguage_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `Language` (`id`),
  ADD CONSTRAINT `practitionerlanguage_ibfk_2` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);

--
-- Constraints for table `Rating`
--
ALTER TABLE `Rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`cooperation_id`) REFERENCES `Cooperation` (`id`);

--
-- Constraints for table `References`
--
ALTER TABLE `References`
  ADD CONSTRAINT `references_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);

--
-- Constraints for table `UserRole`
--
ALTER TABLE `UserRole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
