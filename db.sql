CREATE DATABASE db_bwastartup;
CREATE USER `falcon`@`localhost` IDENTIFIED BY '1234567890';
USE db_bwastartup;
GRANT ALL PRIVILEGES ON db_bwastartup.* TO `falcon`@`localhost`;
FLUSH PRIVILEGES;

CREATE TABLE `users` (
	`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL,
	`occupation` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `avatar_file_name` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`updated_at` DATETIME NOT NULL
);

CREATE TABLE `campaigns` (
	`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `user_id` INT NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`short_description` VARCHAR(255) NOT NULL,
    `description` TEXT(255) NOT NULL,
    `goal_ammount` INT(50) NOT NULL,
    `current_ammount` INT(50) NOT NULL,
    `perks` TEXT(255) NOT NULL,
    `backer_count` INT(50) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`updated_at` DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE `campaigns_images` (
	`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `campaign_id` INT NOT NULL,
	`file_name` VARCHAR(255) NOT NULL,
	`is_Primary` TINYINT(255) NOT NULL,     
	`created_at` DATETIME NOT NULL,
	`updated_at` DATETIME NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES campaigns (id)
);

CREATE TABLE `transactions` (
	`id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `campaign_id` INT NOT NULL,
    `user_id` INT NOT NULL,
	`amount` INT(50) NOT NULL,
	`status` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) NOT NULL,      
	`created_at` DATETIME NOT NULL,
	`updated_at` DATETIME NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES campaigns (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

Dummy Data Users : 
INSERT INTO users VALUES("","Rian Muhammad","Programmer","rianmfirdaus@gmail.com","contohpasswordhash","image.jpeg","user funding","qwe123erty456","now","now");

INSERT INTO users VALUES("","Angela","Arsitek","angela@gmail.com","contohpasswordhashAngela","image.jpeg","user","qwe123erty456aaa","now","now");