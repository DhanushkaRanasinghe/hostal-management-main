-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 05, 2022 at 03:48 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `Application_id` int(100) NOT NULL AUTO_INCREMENT,
  `Student_id` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Application_status` tinyint(1) DEFAULT NULL,
  `Room_No` int(10) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Application_id`),
  KEY `Student_id` (`Student_id`),
  KEY `Hostel_id` (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`Application_id`, `Student_id`, `Hostel_id`, `Application_status`, `Room_No`, `Message`) VALUES
(1, 'B160497CS', 1, 0, 1, 'I am a handicapped, so I would like to have a room at ground floor '),
(2, 'IIT001', 1, 0, 2, 'i want b c\r\nhostel'),
(3, 'IIT002', 1, 0, 4, 'yeeees'),
(4, 'a101', 1, 0, 5, NULL),
(5, 'b102', 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

DROP TABLE IF EXISTS `hostel`;
CREATE TABLE IF NOT EXISTS `hostel` (
  `Hostel_id` int(10) NOT NULL AUTO_INCREMENT,
  `Hostel_name` varchar(255) NOT NULL,
  `current_no_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_students` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`Hostel_id`, `Hostel_name`, `current_no_of_rooms`, `No_of_rooms`, `No_of_students`) VALUES
(1, 'A', NULL, '400', NULL),
(2, 'B', NULL, '400', NULL),
(3, 'C', NULL, '400', NULL),
(4, 'D', NULL, '400', NULL),
(5, 'E', NULL, '400', NULL),
(6, 'F', NULL, '400', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hostel_manager`
--

DROP TABLE IF EXISTS `hostel_manager`;
CREATE TABLE IF NOT EXISTS `hostel_manager` (
  `Hostel_man_id` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Isadmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Hostel_man_id`),
  UNIQUE KEY `Username` (`Username`),
  KEY `Hostel_id` (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hostel_manager`
--

INSERT INTO `hostel_manager` (`Hostel_man_id`, `Username`, `Fname`, `Lname`, `Mob_no`, `Hostel_id`, `Pwd`, `Isadmin`) VALUES
(1, 'admin', 'admin', 'admin', '', 1, '$2a$10$i.6ZY3FT7EQUcPsW7lsNa.ezwsQ9sgGB9Ya/Hhrl9DKG83SOOco8i', 0),
(2, 'subwarden', 'ko', 'p', '0771234567', 1, '$2a$12$NvUECwSfXCyfQVcM8Q6XMOc948CNn7swgKkPgxCTsQdeglJ91/5Ly', 0);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `hostel_id` int(10) DEFAULT NULL,
  `subject_h` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `msg_date` varchar(255) DEFAULT NULL,
  `msg_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `hostel_id` (`hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`msg_id`, `sender_id`, `receiver_id`, `hostel_id`, `subject_h`, `message`, `msg_date`, `msg_time`) VALUES
(1, 'B160497CS', '3', 1, 'Ground Floor Request', 'sfdbfbdf', '2018-10-27', '09:14 PM'),
(2, '3', 'B160497CS', 1, 'DVDSG', 'DDSCSDV', '2018-10-27', '09:15PM'),
(3, '3', 'B160497CS', 1, 'wddwd', 'xssss', '2018-10-28', '09-16 PM'),
(4, 'B160498EE', '1', 3, 'ROOM NEAR TOILET', 'I would like to change my room as it is near toilet', '2018-10-27', '10:06 PM'),
(5, '1', 'B160498EE', 3, 'Room Near Toilet', 'cdsdgdfhdfh', '2018-10-27', '10:48 PM'),
(6, '1', 'IIT001', 1, 'Allocated', 'you can stay hostel from next week.', '2022-08-31', '03:36 PM');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `Room_id` int(10) NOT NULL AUTO_INCREMENT,
  `Hostel_id` int(10) NOT NULL,
  `Room_No` int(10) NOT NULL,
  `Allocated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Room_id`),
  KEY `Hostel_id` (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_id`, `Hostel_id`, `Room_No`, `Allocated`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 4, 1),
(4, 1, 5, 1),
(5, 2, 1, 0),
(6, 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Student_id` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Dept` varchar(255) NOT NULL,
  `Year_of_study` varchar(255) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Hostel_id` int(10) DEFAULT NULL,
  `Room_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Student_id`),
  KEY `Hostel_id` (`Hostel_id`),
  KEY `Room_id` (`Room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_id`, `Fname`, `Lname`, `Mob_no`, `Dept`, `Year_of_study`, `Pwd`, `Hostel_id`, `Room_id`) VALUES
('100', 'Hope', 'Kress', '189', '', '', '', NULL, NULL),
('101', 'Millie', 'Lasley', '866', '', '', '', NULL, NULL),
('102', 'Sarette', 'Sundin', '711', '', '', '', NULL, NULL),
('103', 'Jean', 'Whiffen', '791', '', '', '', NULL, NULL),
('104', 'Lulita', 'Zaslow', '212', '', '', '', NULL, NULL),
('a100', 'Hope', 'Kress', '189', '', '2014', '', NULL, NULL),
('a101', 'Millie', 'Lasley', '866', '', '2013', '', 1, 4),
('a102', 'Sarette', 'Sundin', '711', '', '2012', '', NULL, NULL),
('a103', 'Jean', 'Whiffen', '791', '', '2018', '', NULL, NULL),
('a104', 'Lulita', 'Zaslow', '212', '', '2025', '', NULL, NULL),
('b100', 'Hope', 'Kress', '189', '', '2014', '', NULL, NULL),
('b101', 'Millie', 'Lasley', '866', '', '2013', '', NULL, NULL),
('b102', 'Sarette', 'Sundin', '711', '', '2012', '', NULL, NULL),
('b103', 'Jean', 'Whiffen', '791', '', '2018', '', NULL, NULL),
('b104', 'Lulita', 'Zaslow', '212', '', '2025', '', NULL, NULL),
('B160497CS', 'Prajwal', 'Ghoradkar', '09757318791', 'CSE', '3', '$2y$10$hGFfPexHXi.Ec.WVp3qK4.RG8yajZeO31LQ/aOeF6iRU9fk3IFrkq', 1, 1),
('c', 'A', 'l', '09', 'dpt', '2016', '', NULL, NULL),
('c100', 'Hope', 'Kress', '189', '', '2014', '', NULL, NULL),
('c101', 'Millie', 'Lasley', '866', '', '2013', '', NULL, NULL),
('c102', 'Sarette', 'Sundin', '711', '', '2012', '', NULL, NULL),
('c103', 'Jean', 'Whiffen', '791', '', '2018', '', NULL, NULL),
('c104', 'Lulita', 'Zaslow', '212', '', '2025', '', NULL, NULL),
('cs100', 'Hope', 'Kress', '189', '', '2014', '', NULL, NULL),
('d100', 'Hope', 'Kress', '189', '', '2014', '', NULL, NULL),
('d101', 'Millie', 'Lasley', '866', '', '2013', '', NULL, NULL),
('d102', 'Sarette', 'Sundin', '711', '', '2012', '', NULL, NULL),
('d103', 'Jean', 'Whiffen', '791', '', '2018', '', NULL, NULL),
('d104', 'Lulita', 'Zaslow', '212', '', '2025', '', NULL, NULL),
('IIT001', 'K', 'VP', '1234567899', 'IT', '2', '$2y$10$Z9K.trrOqAXbbONZ5kdNHuHBbcQoTGzlMb0r363NUnvjVpk533TN2', 1, 2),
('IIT002', 'A', 'BC', '1234567899', 'IT', '3', '$2y$10$qH6V9Z34ehiGkjRGXeXjcuCmvS7aZisSV3C.PB522cG/.aPPhPs.y', 1, 3),
('IIT004', 'kowree', 'vp', '1234567890', 'it', '3', '$2y$10$dy2JkaegIfV6bb8ROULB9utsrFDths6MRFOvvcpn5myP2PucBiHMy', 1, NULL),
('ss101', 'Millie', 'Lasley', '866', '', '2013', '', 1, NULL),
('ss102', 'Sarette', 'Sundin', '711', '', '2012', '', 1, NULL),
('ss103', 'Jean', 'Whiffen', '791', '', '2018', '', 1, NULL),
('ss104', 'Lulita', 'Zaslow', '212', '', '2025', '', 1, NULL),
('w100', 'Hope', 'Kress', '189', '', '2014', '', NULL, NULL),
('w101', 'Millie', 'Lasley', '866', '', '2013', '', NULL, NULL),
('w102', 'Sarette', 'Sundin', '711', '', '2012', '', NULL, NULL),
('w103', 'Jean', 'Whiffen', '791', '', '2018', '', NULL, NULL),
('w104', 'Lulita', 'Zaslow', '212', '', '2025', '', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `Application_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `student` (`Student_id`),
  ADD CONSTRAINT `Application_ibfk_2` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`);

--
-- Constraints for table `hostel_manager`
--
ALTER TABLE `hostel_manager`
  ADD CONSTRAINT `Hostel_Manager_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`Hostel_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `hostel` (`Hostel_id`),
  ADD CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`Room_id`) REFERENCES `room` (`Room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
