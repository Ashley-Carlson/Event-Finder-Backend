CREATE TABLE `users` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `acct_type` int(1) NOT NULL,
  `crt_timestmp` datetime NOT NULL,
  `updt_timestmp` datetime NOT NULL
);

CREATE TABLE `event` (
  `event_id` int PRIMARY KEY AUTO_INCREMENT,
  `validated` tinyint(1) NOT NULL,
  `event_name` varchar(32) NOT NULL,
  `event_desc` varchar(1024),
  `contacts` int NOT NULL,
  `has_food` tinyint(1) NOT NULL,
  `event_time` datetime NOT NULL,
  `location` varchar(128),
  `club` int,
  `url_social` char(128),
  `crt_timestmp` datetime NOT NULL,
  `updt_timestmp` datetime NOT NULL
);

CREATE TABLE `club` (
  `club_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(32),
  `contacts` int,
  `fac_sponsor` int,
  `crt_timestmp` datetime NOT NULL,
  `updt_timestmp` datetime NOT NULL
);

CREATE TABLE `userclub` (
  `user` int,
  `club` int
);

CREATE TABLE `eventFollowers` (
  `event` int,
  `follower` int
);

ALTER TABLE `users` ADD FOREIGN KEY (`user_id`) REFERENCES `event` (`contacts`);

ALTER TABLE `event` ADD FOREIGN KEY (`club`) REFERENCES `club` (`club_id`);

ALTER TABLE `userclub` ADD FOREIGN KEY (`user`) REFERENCES `users` (`user_id`);

ALTER TABLE `club` ADD FOREIGN KEY (`club_id`) REFERENCES `userclub` (`club`);

ALTER TABLE `eventFollowers` ADD FOREIGN KEY (`follower`) REFERENCES `users` (`user_id`);

ALTER TABLE `event` ADD FOREIGN KEY (`event_id`) REFERENCES `eventFollowers` (`event`);
