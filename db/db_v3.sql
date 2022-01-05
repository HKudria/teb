CREATE TABLE `Practitioner` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `surname` varchar(255),
  `email` varchar(255) UNIQUE,
  `cdv_email` varchar(255) UNIQUE,
  `phoneNo` varchar(11),
  `cv` varchar(255),
  `practitioner_card` varchar(255),
  `created_at` timestamp,
  `thesis` int,
  `commercial_projects_hours` int,
  `linkedin` varchar(255),
  `commercial_experience_years` int,
  `participation_in_finished_project` bool,
  `team_management` bool,
  `publications` int
);

CREATE TABLE `References` (
  `id` int PRIMARY KEY,
  `practitioner_id` int,
  `path` varchar(255)
);

CREATE TABLE `Language` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `PractitionerLanguage` (
  `practitioner_id` int,
  `language_id` int,
  PRIMARY KEY (`practitioner_id`, `language_id`)
);

CREATE TABLE `Company` (
  `id` int PRIMARY KEY,
  `name` varchar(500)
);

CREATE TABLE `PractitionerCompany` (
  `practitioner_id` int,
  `comany_id` int,
  `position` varchar(255),
  `is_owner` bool,
  PRIMARY KEY (`practitioner_id`, `comany_id`)
);

CREATE TABLE `EducationHistory` (
  `id` int PRIMARY KEY,
  `practitioner_id` int,
  `degree` varchar(100),
  `specialisation` varchar(255),
  `certificate` bool
);

CREATE TABLE `LearningHistory` (
  `id` int PRIMARY KEY,
  `practitioner_id` int,
  `date_from` date,
  `date_to` date,
  `subject` varchar(255),
  `place` text,
  `place_type_id` int,
  `hours` int
);

CREATE TABLE `CDVSubject` (
  `id` int,
  `field_of_study_id` int,
  `name` varchar(255),
  `description` text,
  `study_mode_id` int,
  PRIMARY KEY (`id`, `field_of_study_id`)
);

CREATE TABLE `Cooperation` (
  `id` int PRIMARY KEY,
  `subject_id` int,
  `practitioner_id` int,
  `term_id` int,
  `hours` int,
  constraint unique(subject_id, practitioner_id, term_id)
);

CREATE TABLE `FieldOfStudy` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `ActivityType` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `CDVActivity` (
  `activity_type_id` int,
  `practitioner_id` int,
  `date_from` date,
  `date_to` date,
  `description` text,
  PRIMARY KEY (`activity_type_id`, `practitioner_id`)
);

CREATE TABLE `AvailabilityType` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `PractitionerAvalability` (
  `availability_type_id` int,
  `practitioner_id` int,
  `rate_per_hour` decimal(10,2),
  PRIMARY KEY (`availability_type_id`, `practitioner_id`)
);

CREATE TABLE `ContactSourceType` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `require_practitioner` bool
);

CREATE TABLE `ContactSource` (
  `contact_source_type_id` int,
  `practitioner_id` int,
  `name` varchar(255),
  `description` text,
  `reference_practitioner` int,
  PRIMARY KEY (`contact_source_type_id`, `practitioner_id`)
);

CREATE TABLE `User` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `email` varchar(255) UNIQUE,
  `password` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Term` (
  `id` int PRIMARY KEY,
  `name` varchar(5),
  `date_start` date,
  `date_end` date
);

CREATE TABLE `StudyMode` (
  `id` int PRIMARY KEY,
  `mode` varchar(255)
);

CREATE TABLE `Rating` (
  `id` int PRIMARY KEY,
  `rating` int,
  `comment` text,
  `cooperation_id` int
);

CREATE TABLE `Role` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `UserRole` (
  `user_id` int,
  `role_id` int,
  PRIMARY KEY (`user_id`, `role_id`)
);

CREATE TABLE `PlaceType` (
  `id` int PRIMARY KEY,
  `name` varchar(255)
);

ALTER TABLE `EducationHistory` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `PractitionerCompany` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `PractitionerCompany` ADD FOREIGN KEY (`comany_id`) REFERENCES `Company` (`id`);
ALTER TABLE `LearningHistory` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `CDVSubject` ADD FOREIGN KEY (`field_of_study_id`) REFERENCES `FieldOfStudy` (`id`);
ALTER TABLE `Cooperation` ADD FOREIGN KEY (`subject_id`) REFERENCES `CDVSubject` (`id`);
ALTER TABLE `Cooperation` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `CDVActivity` ADD FOREIGN KEY (`activity_type_id`) REFERENCES `ActivityType` (`id`);
ALTER TABLE `CDVActivity` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `PractitionerAvalability` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `PractitionerAvalability` ADD FOREIGN KEY (`availability_type_id`) REFERENCES `AvailabilityType` (`id`);
ALTER TABLE `ContactSource` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `ContactSource` ADD FOREIGN KEY (`contact_source_type_id`) REFERENCES `ContactSourceType` (`id`);
ALTER TABLE `Cooperation` ADD FOREIGN KEY (`term_id`) REFERENCES `Term` (`id`);
ALTER TABLE `CDVSubject` ADD FOREIGN KEY (`study_mode_id`) REFERENCES `StudyMode` (`id`);
ALTER TABLE `ContactSource` ADD FOREIGN KEY (`reference_practitioner`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `Rating` ADD FOREIGN KEY (`cooperation_id`) REFERENCES `Cooperation` (`id`);
ALTER TABLE `UserRole` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);
ALTER TABLE `UserRole` ADD FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);
ALTER TABLE `PractitionerLanguage` ADD FOREIGN KEY (`language_id`) REFERENCES `Language` (`id`);
ALTER TABLE `PractitionerLanguage` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `LearningHistory` ADD FOREIGN KEY (`place_type_id`) REFERENCES `PlaceType` (`id`);
ALTER TABLE `References` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Practitioner` (`id`);
ALTER TABLE `Cooperation` ADD FOREIGN KEY (`practitioner_id`) REFERENCES `Cooperation` (`term_id`);

