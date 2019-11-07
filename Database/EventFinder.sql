CREATE TABLE `user` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `acct_type` int(1) NOT NULL,
  `create_timestmp` datetime NOT NULL,
  `updt_timestmp` datetime 
);

CREATE TABLE `event` (
  `event_id` int PRIMARY KEY AUTO_INCREMENT,
  `event_name` varchar(32) NOT NULL,
  `event_desc` varchar(1024),
  `has_food` bit(1) DEFAULT 0,
  `event_time` datetime NOT NULL,
  `latitude` float,
  `longitude` float,
  `location` varchar(512),
  `external_url` varchar(512),
  `create_timestmp` datetime NOT NULL,
  `updt_timestmp` datetime 
);

CREATE TABLE `club` (
  `club_id` int PRIMARY KEY AUTO_INCREMENT,
  `club_name` varchar(32),
  `fac_sponsor_id` int,
  `create_timestmp` datetime NOT NULL,
  `updt_timestmp` datetime 
);

CREATE TABLE `userclub` (
  `user_id` int,
  `club_id` int,
  `is_contact` bit(1) DEFAULT 0
);

CREATE TABLE `eventUser` (
  `event_id` int,
  `user_id` int,
  `is_following` bit(1) DEFAULT 0
);

CREATE TABLE `clubEvent` (
  `event_id` int,
  `club_id` int
);

ALTER TABLE `userclub` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `userclub` ADD FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

ALTER TABLE `clubEvent` ADD FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

ALTER TABLE `event` ADD FOREIGN KEY (`event_id`) REFERENCES `clubEvent` (`event_id`);

ALTER TABLE `eventUser` ADD FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`user_id`) REFERENCES `eventUser` (`user_id`);
