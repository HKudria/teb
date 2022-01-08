-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 08 2022 г., 13:43
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `teb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `activation_link`
--

CREATE TABLE `activation_link` (
  `id_activation_link` int(11) NOT NULL,
  `user_email` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `link` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `activation_link`
--

INSERT INTO `activation_link` (`id_activation_link`, `user_email`, `created_at`, `updated_at`, `link`) VALUES
(2, 'hermanwebmasterpl@gmail.com', '2022-01-05 15:08:29', '2022-01-08 10:05:32', '248f14afc1ebcf550dfbdcc4f485c5'),
(3, 'hermanwebmasterpl@gmail.com', '2022-01-08 10:05:03', '2022-01-08 10:05:32', '04057ec6685ab2bfd97d5e4046bb3b'),
(4, 'hermanwebmasterpl1@gmail.com', '2022-01-08 12:37:45', NULL, '74d3e3a73fad43b6493a466c7c8b5e'),
(5, 'hermanwebmasterpl1@gmail.com', '2022-01-08 12:57:14', NULL, '97a2d886a21d6ee24528663949c35f'),
(6, 'hermanwebmasterpl2@gmail.com', '2022-01-08 12:57:25', NULL, '18c9f68f2d20b1387aa9cafaadf6ee'),
(7, 'hermanwebmasterpl4@gmail.com', '2022-01-08 13:07:50', NULL, '4a16d848c78bb9153b89563680eca2'),
(8, 'hermanwebmasterpl1@gmail.com', '2022-01-08 13:10:12', NULL, '00d77f95330effabb3fc4880847475'),
(9, 'hermanwebmasterpl2@gmail.com', '2022-01-08 13:11:18', NULL, '370afda16ade35c32ddf9a53608548'),
(10, 'hermanwebmasterpl4@gmail.com', '2022-01-08 13:12:55', NULL, '00c08eff3444c341f288e82149722b');

-- --------------------------------------------------------

--
-- Структура таблицы `activity`
--

CREATE TABLE `activity` (
  `activity_id` tinyint(3) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Дамп данных таблицы `activity`
--

INSERT INTO `activity` (`activity_id`, `description`) VALUES
(1, 'konto nieaktywne, użytkownik musi dokonać aktwywacji przez poczte elektronicną'),
(2, 'konto aktywne, użytkownik dokonał aktwywacji przez poczte elektronicną'),
(3, 'konto zablokowane, użytkownik ma zablokowane koto przez administratora systemu'),
(4, 'konto usunięto, nie ma możliwości renowacji konta ');

-- --------------------------------------------------------

--
-- Структура таблицы `activitytype`
--

CREATE TABLE `activitytype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `availabilitytype`
--

CREATE TABLE `availabilitytype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `cdvactivity`
--

CREATE TABLE `cdvactivity` (
  `activity_type_id` int(11) NOT NULL,
  `practitioner_id` int(11) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `cdvsubject`
--

CREATE TABLE `cdvsubject` (
  `id` int(11) NOT NULL,
  `field_of_study_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `study_mode_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `contactsource`
--

CREATE TABLE `contactsource` (
  `contact_source_type_id` int(11) NOT NULL,
  `practitioner_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `reference_practitioner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `contactsourcetype`
--

CREATE TABLE `contactsourcetype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `require_practitioner` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `cooperation`
--

CREATE TABLE `cooperation` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `practitioner_id` int(11) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `educationhistory`
--

CREATE TABLE `educationhistory` (
  `id` int(11) NOT NULL,
  `practitioner_id` int(11) DEFAULT NULL,
  `degree` varchar(100) DEFAULT NULL,
  `specialisation` varchar(255) DEFAULT NULL,
  `certificate` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fieldofstudy`
--

CREATE TABLE `fieldofstudy` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `learninghistory`
--

CREATE TABLE `learninghistory` (
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
-- Структура таблицы `placetype`
--

CREATE TABLE `placetype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `practitioner`
--

CREATE TABLE `practitioner` (
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
-- Структура таблицы `practitioneravalability`
--

CREATE TABLE `practitioneravalability` (
  `availability_type_id` int(11) NOT NULL,
  `practitioner_id` int(11) NOT NULL,
  `rate_per_hour` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `practitionercompany`
--

CREATE TABLE `practitionercompany` (
  `practitioner_id` int(11) NOT NULL,
  `comany_id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `is_owner` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `practitionerlanguage`
--

CREATE TABLE `practitionerlanguage` (
  `practitioner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `cooperation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `references`
--

CREATE TABLE `references` (
  `id` int(11) NOT NULL,
  `practitioner_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin'),
(3, 'moderator');

-- --------------------------------------------------------

--
-- Структура таблицы `studymode`
--

CREATE TABLE `studymode` (
  `id` int(11) NOT NULL,
  `mode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `term`
--

CREATE TABLE `term` (
  `id` int(11) NOT NULL,
  `name` varchar(5) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `surname` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthday` date NOT NULL,
  `avatar` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `activity_id` tinyint(3) UNSIGNED DEFAULT 1,
  `last_login` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `password`, `gender`, `birthday`, `avatar`, `created_at`, `updated_at`, `activity_id`, `last_login`) VALUES
(4, 'Herman', 'Kudria', 'hermanwebmasterpl@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$MHozcDQ0VnJjbVQzVndpdg$IKKRO8R9Mr8DO+7xWCim/uK6HNQHmcHhzB/8rvjCKHw', 1, '2022-01-05', 'avatar5.png', '2022-01-08 09:05:32', NULL, 2, NULL),
(10, 'Herman', 'Kudria', 'hermanwebmasterpl1@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$OGhjUDNhRk0yWFhiSVBOeg$rbfpuLWjDEDe9K8aR7QCSV0yGJUscrGmChbQVndklBc', 1, '2022-01-12', 'avatar5.png', '2022-01-08 12:11:33', NULL, 2, NULL),
(11, 'Herman', 'Kudria', 'hermanwebmasterpl2@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$MzFwMFphS2dHUnhZdDhIbg$eGZJ00D2TkCSQw0IcMuM2nkHoqwyTZxr5QX8QuJ+/DE', 1, '2022-01-11', 'avatar5.png', '2022-01-08 12:11:33', NULL, 2, NULL),
(12, 'Herman', 'Kudria', 'hermanwebmasterpl4@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$bWMxYVoyRG1kcHJSRVVnaA$vCTNAPutDSHoYB1VOkpRZ03uRXI/xEKZky5Ob28btfw', 0, '2022-01-18', 'avatar2.png', '2022-01-08 12:13:04', NULL, 3, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `userrole`
--

CREATE TABLE `userrole` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `userrole`
--

INSERT INTO `userrole` (`user_id`, `role_id`) VALUES
(4, 2),
(10, 3),
(11, 1),
(12, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `activation_link`
--
ALTER TABLE `activation_link`
  ADD PRIMARY KEY (`id_activation_link`);

--
-- Индексы таблицы `activitytype`
--
ALTER TABLE `activitytype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `availabilitytype`
--
ALTER TABLE `availabilitytype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cdvactivity`
--
ALTER TABLE `cdvactivity`
  ADD PRIMARY KEY (`activity_type_id`,`practitioner_id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Индексы таблицы `cdvsubject`
--
ALTER TABLE `cdvsubject`
  ADD PRIMARY KEY (`id`,`field_of_study_id`),
  ADD KEY `field_of_study_id` (`field_of_study_id`),
  ADD KEY `study_mode_id` (`study_mode_id`);

--
-- Индексы таблицы `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contactsource`
--
ALTER TABLE `contactsource`
  ADD PRIMARY KEY (`contact_source_type_id`,`practitioner_id`),
  ADD KEY `practitioner_id` (`practitioner_id`),
  ADD KEY `reference_practitioner` (`reference_practitioner`);

--
-- Индексы таблицы `contactsourcetype`
--
ALTER TABLE `contactsourcetype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cooperation`
--
ALTER TABLE `cooperation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_id` (`subject_id`,`practitioner_id`,`term_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Индексы таблицы `educationhistory`
--
ALTER TABLE `educationhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Индексы таблицы `fieldofstudy`
--
ALTER TABLE `fieldofstudy`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `learninghistory`
--
ALTER TABLE `learninghistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practitioner_id` (`practitioner_id`),
  ADD KEY `place_type_id` (`place_type_id`);

--
-- Индексы таблицы `placetype`
--
ALTER TABLE `placetype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `practitioner`
--
ALTER TABLE `practitioner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cdv_email` (`cdv_email`);

--
-- Индексы таблицы `practitioneravalability`
--
ALTER TABLE `practitioneravalability`
  ADD PRIMARY KEY (`availability_type_id`,`practitioner_id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Индексы таблицы `practitionercompany`
--
ALTER TABLE `practitionercompany`
  ADD PRIMARY KEY (`practitioner_id`,`comany_id`),
  ADD KEY `comany_id` (`comany_id`);

--
-- Индексы таблицы `practitionerlanguage`
--
ALTER TABLE `practitionerlanguage`
  ADD PRIMARY KEY (`practitioner_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Индексы таблицы `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cooperation_id` (`cooperation_id`);

--
-- Индексы таблицы `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`),
  ADD KEY `practitioner_id` (`practitioner_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `studymode`
--
ALTER TABLE `studymode`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `activation_link`
--
ALTER TABLE `activation_link`
  MODIFY `id_activation_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cdvactivity`
--
ALTER TABLE `cdvactivity`
  ADD CONSTRAINT `cdvactivity_ibfk_1` FOREIGN KEY (`activity_type_id`) REFERENCES `activitytype` (`id`),
  ADD CONSTRAINT `cdvactivity_ibfk_2` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`);

--
-- Ограничения внешнего ключа таблицы `cdvsubject`
--
ALTER TABLE `cdvsubject`
  ADD CONSTRAINT `cdvsubject_ibfk_1` FOREIGN KEY (`field_of_study_id`) REFERENCES `fieldofstudy` (`id`),
  ADD CONSTRAINT `cdvsubject_ibfk_2` FOREIGN KEY (`study_mode_id`) REFERENCES `studymode` (`id`);

--
-- Ограничения внешнего ключа таблицы `contactsource`
--
ALTER TABLE `contactsource`
  ADD CONSTRAINT `contactsource_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`),
  ADD CONSTRAINT `contactsource_ibfk_2` FOREIGN KEY (`contact_source_type_id`) REFERENCES `contactsourcetype` (`id`),
  ADD CONSTRAINT `contactsource_ibfk_3` FOREIGN KEY (`reference_practitioner`) REFERENCES `practitioner` (`id`);

--
-- Ограничения внешнего ключа таблицы `cooperation`
--
ALTER TABLE `cooperation`
  ADD CONSTRAINT `cooperation_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `cdvsubject` (`id`),
  ADD CONSTRAINT `cooperation_ibfk_2` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`),
  ADD CONSTRAINT `cooperation_ibfk_3` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`),
  ADD CONSTRAINT `cooperation_ibfk_4` FOREIGN KEY (`practitioner_id`) REFERENCES `cooperation` (`term_id`);

--
-- Ограничения внешнего ключа таблицы `educationhistory`
--
ALTER TABLE `educationhistory`
  ADD CONSTRAINT `educationhistory_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`);

--
-- Ограничения внешнего ключа таблицы `learninghistory`
--
ALTER TABLE `learninghistory`
  ADD CONSTRAINT `learninghistory_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`),
  ADD CONSTRAINT `learninghistory_ibfk_2` FOREIGN KEY (`place_type_id`) REFERENCES `placetype` (`id`);

--
-- Ограничения внешнего ключа таблицы `practitioneravalability`
--
ALTER TABLE `practitioneravalability`
  ADD CONSTRAINT `practitioneravalability_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`),
  ADD CONSTRAINT `practitioneravalability_ibfk_2` FOREIGN KEY (`availability_type_id`) REFERENCES `availabilitytype` (`id`);

--
-- Ограничения внешнего ключа таблицы `practitionercompany`
--
ALTER TABLE `practitionercompany`
  ADD CONSTRAINT `practitionercompany_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`),
  ADD CONSTRAINT `practitionercompany_ibfk_2` FOREIGN KEY (`comany_id`) REFERENCES `company` (`id`);

--
-- Ограничения внешнего ключа таблицы `practitionerlanguage`
--
ALTER TABLE `practitionerlanguage`
  ADD CONSTRAINT `practitionerlanguage_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `practitionerlanguage_ibfk_2` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`);

--
-- Ограничения внешнего ключа таблицы `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`cooperation_id`) REFERENCES `cooperation` (`id`);

--
-- Ограничения внешнего ключа таблицы `references`
--
ALTER TABLE `references`
  ADD CONSTRAINT `references_ibfk_1` FOREIGN KEY (`practitioner_id`) REFERENCES `practitioner` (`id`);

--
-- Ограничения внешнего ключа таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
