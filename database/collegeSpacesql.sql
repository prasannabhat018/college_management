-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 28, 2020 at 10:30 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collegeSpace`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN`
--

CREATE TABLE `ADMIN` (
  `a_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ADMIN`
--

INSERT INTO `ADMIN` (`a_id`, `name`, `email`, `password`) VALUES
(1, 'admin1', 'admin1@gmail.com', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `CLASS_POST`
--

CREATE TABLE `CLASS_POST` (
  `cp_id` int(11) NOT NULL,
  `author` varchar(40) NOT NULL,
  `c_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(100) NOT NULL DEFAULT 'New Post'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CLASS_POST`
--

INSERT INTO `CLASS_POST` (`cp_id`, `author`, `c_id`, `message`, `date`, `title`) VALUES
(1, 'instructor1', 1, 'students tommorow we have a serious test please be prepared', '2020-12-06 16:31:39', 'New Post'),
(2, 'instructor2', 1, 'Hey guys this is the second post for DSA so it should come first', '2020-12-06 17:23:51', 'New Post'),
(3, 'instructor2', 1, 'So everyone use the link in the notes section to get all the notes regarding the course and we have put the pdf\'s of the related text books so use it to your advantage', '2020-12-11 23:54:56', 'Updation of Notes '),
(4, 'instructor1', 2, 'asdfasfdaskdjfksadfjasdfjldsfjasdfjk\nSADFLASDFJKASJDFKHBRASDFGSDSG', '2020-12-15 06:58:37', 'Test Upcoming'),
(5, 'instructor1', 2, 'This is just a test post', '2020-12-27 11:46:40', 'Test Post');

-- --------------------------------------------------------

--
-- Table structure for table `COURSE`
--

CREATE TABLE `COURSE` (
  `c_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `c_code` varchar(10) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `COURSE`
--

INSERT INTO `COURSE` (`c_id`, `name`, `c_code`, `d_id`) VALUES
(1, 'DATA STRUCTURES AND ALGORITHMS', 'DSA', 1),
(2, 'MICROCONTROLLER\'S', 'MCC', 2),
(3, 'Database Design', 'DBD', 1),
(5, 'OOPs with Java', 'OOP', 4);

-- --------------------------------------------------------

--
-- Table structure for table `COURSE_STUDENTS`
--

CREATE TABLE `COURSE_STUDENTS` (
  `s_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `COURSE_STUDENTS`
--

INSERT INTO `COURSE_STUDENTS` (`s_id`, `c_id`) VALUES
(1, 1),
(1, 3),
(2, 3),
(7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `DEPARTMENT`
--

CREATE TABLE `DEPARTMENT` (
  `d_id` int(11) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `d_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `DEPARTMENT`
--

INSERT INTO `DEPARTMENT` (`d_id`, `d_name`, `d_code`) VALUES
(1, 'Computer Science', 'CSE'),
(2, 'Electronics and Communication', 'ECE'),
(3, 'Electrical and Electronics', 'EEE'),
(4, 'Information Science', 'ISE');

-- --------------------------------------------------------

--
-- Table structure for table `DEPARTMENT_POST`
--

CREATE TABLE `DEPARTMENT_POST` (
  `p_id` int(11) NOT NULL COMMENT 'post id',
  `year` enum('1','2','3','4') NOT NULL COMMENT 'one of [1,2,3,4]',
  `message` text NOT NULL COMMENT 'text message',
  `d_id` int(11) NOT NULL COMMENT 'department id',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(100) NOT NULL DEFAULT 'New Post'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `DEPARTMENT_POST`
--

INSERT INTO `DEPARTMENT_POST` (`p_id`, `year`, `message`, `d_id`, `date`, `title`) VALUES
(1, '2', 'hey second year\'s of cse', 1, '2020-12-06 15:08:07', 'New Post'),
(2, '1', 'hello guys this is the first ever department post! for cse', 1, '2020-12-06 15:08:07', 'New Post'),
(3, '2', 'hello second years this is from the department', 2, '2020-12-07 04:23:56', 'New Post'),
(4, '2', 'Hey guys the recruitment for akamai is closed now and no further students will taken by the company until next visit and the cooldown period for applying is 5 months', 1, '2020-12-11 14:35:34', 'Regarding Akamai Recruitment'),
(5, '2', 'The test will be on sunday and followed by 3 rounds first round is online coding test followed by 2 interview rounds so be ready', 1, '2020-12-13 07:25:17', 'LinkedIn Internship'),
(6, '2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry', 1, '2020-12-13 07:34:31', 'Adobe Internship'),
(7, '2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using', 1, '2020-12-13 07:43:40', 'TCS Arriving '),
(8, '2', 'SADFDFS', 1, '2020-12-14 09:53:21', 'ASFSAF'),
(9, '2', 'this is dummy test', 1, '2020-12-16 10:30:53', 'dummy data'),
(10, '3', 'You have to come to college on 29th December for lab sessions', 2, '2020-12-26 04:16:48', 'Hey 3rd years'),
(11, '1', 'Hi first year\'s', 2, '2020-12-27 11:50:46', 'Welcome Post');

-- --------------------------------------------------------

--
-- Table structure for table `INSTRUCTOR`
--

CREATE TABLE `INSTRUCTOR` (
  `i_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `d_id` int(11) NOT NULL,
  `password` varchar(40) NOT NULL COMMENT 'unencrypted password',
  `is_hod` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `INSTRUCTOR`
--

INSERT INTO `INSTRUCTOR` (`i_id`, `name`, `email`, `d_id`, `password`, `is_hod`) VALUES
(1, 'instructor1', 'instructor1@gmail.com', 2, 'instructor1', 1),
(3, 'instructor2', 'instructor2@gmail.com', 3, 'instructor2', 0),
(5, 'CSinstructor1@gmail.com', 'CSinstructor1', 1, 'CSinstructor1', 0),
(7, 'instructor3', 'instructor3@gmail.com', 2, 'instructor3', 0),
(8, 'instructor4', 'instructor4@gmail.com', 1, 'instructor4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PLACEMENT`
--

CREATE TABLE `PLACEMENT` (
  `placement_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `job_profile` varchar(50) NOT NULL,
  `stipend` int(11) NOT NULL,
  `max_backlogs` int(11) NOT NULL,
  `min_cgpa` float NOT NULL,
  `role` enum('INTERN','FTE') NOT NULL,
  `year` enum('1','2','3','4') NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` varchar(40) NOT NULL DEFAULT 'Open Dream'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PLACEMENT`
--

INSERT INTO `PLACEMENT` (`placement_id`, `company`, `job_profile`, `stipend`, `max_backlogs`, `min_cgpa`, `role`, `year`, `date`, `category`) VALUES
(1, 'Morgan Stanley', 'Technology Analyst', 87000, 0, 8.5, 'INTERN', '2', '2020-12-07 06:21:58', 'Open Dream'),
(12, 'Arcesium', 'Software Developer', 100000, 0, 8, 'INTERN', '2', '2020-12-12 07:09:06', 'Open Dream'),
(13, 'Akamai', 'Software Developer', 35000, 0, 7.5, 'INTERN', '2', '2020-12-12 07:11:28', 'Open Dream'),
(15, 'SalesForce', 'Software Engineer', 80000, 0, 7.5, 'INTERN', '2', '2020-12-12 07:22:10', 'Open Dream'),
(17, 'Goldman Sachs', 'Technology Analyst', 80000, 0, 7.5, 'INTERN', '2', '2020-12-12 07:26:14', 'Open Dream'),
(18, 'Samsung', 'software developer', 50000, 0, 7, 'INTERN', '2', '2020-12-13 06:43:13', 'Open Dream'),
(19, 'JP Morgan Chase', 'Software Engineer', 60000, 0, 8, 'INTERN', '2', '2020-12-13 07:09:44', 'Open Dream'),
(20, 'Sprinkler', 'SDE', 200000, 0, 6, 'INTERN', '2', '2020-12-13 07:20:40', 'Open Dream'),
(21, 'Sprinkler', 'SDE', 200000, 0, 6, 'INTERN', '2', '2020-12-13 07:22:33', 'Open Dream'),
(22, 'Linked In', 'SRE', 59998, 0, 7, 'INTERN', '2', '2020-12-13 07:24:14', 'Open Dream'),
(23, 'Adobe ', 'Member of Technical Staff', 60000, 1, 8, 'INTERN', '2', '2020-12-13 07:30:11', 'Open Dream'),
(26, 'Abode', 'MTS2', 60000, 1, 8, 'INTERN', '2', '2020-12-13 07:34:31', 'Open Dream'),
(27, 'TCS', 'SDET', 10000, 2, 6, 'INTERN', '2', '2020-12-13 07:43:40', 'Dream'),
(28, 'AFAF', 'ASFASDF', 50000, 0, 9, 'INTERN', '2', '2020-12-14 09:53:21', 'AFSADFASDF'),
(29, 'GOOGLE', 'sde', 11111, 0, 7, 'INTERN', '2', '2020-12-16 10:30:52', 'open dream');

-- --------------------------------------------------------

--
-- Table structure for table `PLACEMENT_ELIGIBILITY`
--

CREATE TABLE `PLACEMENT_ELIGIBILITY` (
  `p_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PLACEMENT_ELIGIBILITY`
--

INSERT INTO `PLACEMENT_ELIGIBILITY` (`p_id`, `d_id`) VALUES
(1, 1),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(15, 1),
(15, 2),
(15, 3),
(17, 1),
(17, 2),
(18, 1),
(19, 1),
(20, 1),
(22, 1),
(23, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PLACEMENT_STUDENTS`
--

CREATE TABLE `PLACEMENT_STUDENTS` (
  `s_id` int(11) NOT NULL,
  `placement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PLACEMENT_STUDENTS`
--

INSERT INTO `PLACEMENT_STUDENTS` (`s_id`, `placement_id`) VALUES
(1, 1),
(1, 15),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 22),
(1, 23),
(1, 26),
(1, 28),
(1, 29);

-- --------------------------------------------------------

--
-- Table structure for table `STUDENT`
--

CREATE TABLE `STUDENT` (
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `year` enum('1','2','3','4') NOT NULL,
  `d_id` int(11) NOT NULL,
  `counsellor_id` int(11) NOT NULL,
  `cgpa` float NOT NULL,
  `usn` varchar(20) NOT NULL,
  `s_id` int(11) NOT NULL,
  `current_backlogs` int(11) NOT NULL DEFAULT 0,
  `password` varchar(40) NOT NULL COMMENT 'unencrypted password for a student set by faculty',
  `is_spc` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `STUDENT`
--

INSERT INTO `STUDENT` (`name`, `email`, `year`, `d_id`, `counsellor_id`, `cgpa`, `usn`, `s_id`, `current_backlogs`, `password`, `is_spc`) VALUES
('Prasanna Bhat', 'prasannabhat.cs18@rvce.edu.in', '2', 1, 1, 9.73, '1RV18CS116', 1, 0, '1RV18CS116', 1),
('Pavan KR', 'pavankr.cs18@rvce.edu.in', '3', 2, 1, 9.95, '1RV18CS110', 2, 0, 'Pavan', 1),
('student1', 'student1.ec19@rvce.edu.in', '2', 2, 1, 8.5, '1RV19EC005', 4, 0, '1RV19EC005', 0),
('student2', 'student2@gmail.com', '2', 2, 1, 7.7, '1RV19CS116', 5, 0, 'random', 0),
('harish', 'harish.cs20@rvce.edu.in', '1', 1, 3, 0, '1RV19CS05', 7, 0, '1RV19CS05', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMIN`
--
ALTER TABLE `ADMIN`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `CLASS_POST`
--
ALTER TABLE `CLASS_POST`
  ADD PRIMARY KEY (`cp_id`),
  ADD KEY `CLASS_POST_ibfk_1` (`c_id`);

--
-- Indexes for table `COURSE`
--
ALTER TABLE `COURSE`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `d_id` (`d_id`);

--
-- Indexes for table `COURSE_STUDENTS`
--
ALTER TABLE `COURSE_STUDENTS`
  ADD PRIMARY KEY (`s_id`,`c_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `DEPARTMENT_POST`
--
ALTER TABLE `DEPARTMENT_POST`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `d_id` (`d_id`);

--
-- Indexes for table `INSTRUCTOR`
--
ALTER TABLE `INSTRUCTOR`
  ADD PRIMARY KEY (`i_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `d_id` (`d_id`);

--
-- Indexes for table `PLACEMENT`
--
ALTER TABLE `PLACEMENT`
  ADD PRIMARY KEY (`placement_id`);

--
-- Indexes for table `PLACEMENT_ELIGIBILITY`
--
ALTER TABLE `PLACEMENT_ELIGIBILITY`
  ADD PRIMARY KEY (`p_id`,`d_id`),
  ADD KEY `d_id` (`d_id`);

--
-- Indexes for table `PLACEMENT_STUDENTS`
--
ALTER TABLE `PLACEMENT_STUDENTS`
  ADD PRIMARY KEY (`s_id`,`placement_id`),
  ADD KEY `placement_id` (`placement_id`);

--
-- Indexes for table `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `email` (`email`,`usn`),
  ADD KEY `d_id` (`d_id`),
  ADD KEY `counsellor_id` (`counsellor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ADMIN`
--
ALTER TABLE `ADMIN`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `CLASS_POST`
--
ALTER TABLE `CLASS_POST`
  MODIFY `cp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `COURSE`
--
ALTER TABLE `COURSE`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DEPARTMENT_POST`
--
ALTER TABLE `DEPARTMENT_POST`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'post id', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `INSTRUCTOR`
--
ALTER TABLE `INSTRUCTOR`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `PLACEMENT`
--
ALTER TABLE `PLACEMENT`
  MODIFY `placement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `STUDENT`
--
ALTER TABLE `STUDENT`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CLASS_POST`
--
ALTER TABLE `CLASS_POST`
  ADD CONSTRAINT `CLASS_POST_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `COURSE` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `COURSE`
--
ALTER TABLE `COURSE`
  ADD CONSTRAINT `COURSE_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `DEPARTMENT` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `COURSE_STUDENTS`
--
ALTER TABLE `COURSE_STUDENTS`
  ADD CONSTRAINT `COURSE_STUDENTS_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `COURSE` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `COURSE_STUDENTS_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `STUDENT` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `DEPARTMENT_POST`
--
ALTER TABLE `DEPARTMENT_POST`
  ADD CONSTRAINT `DEPARTMENT_POST_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `DEPARTMENT` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `INSTRUCTOR`
--
ALTER TABLE `INSTRUCTOR`
  ADD CONSTRAINT `INSTRUCTOR_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `DEPARTMENT` (`d_id`) ON DELETE CASCADE;

--
-- Constraints for table `PLACEMENT_ELIGIBILITY`
--
ALTER TABLE `PLACEMENT_ELIGIBILITY`
  ADD CONSTRAINT `PLACEMENT_ELIGIBILITY_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `PLACEMENT` (`placement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PLACEMENT_ELIGIBILITY_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `DEPARTMENT` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PLACEMENT_STUDENTS`
--
ALTER TABLE `PLACEMENT_STUDENTS`
  ADD CONSTRAINT `PLACEMENT_STUDENTS_ibfk_1` FOREIGN KEY (`placement_id`) REFERENCES `PLACEMENT` (`placement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PLACEMENT_STUDENTS_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `STUDENT` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD CONSTRAINT `STUDENT_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `DEPARTMENT` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `STUDENT_ibfk_2` FOREIGN KEY (`counsellor_id`) REFERENCES `INSTRUCTOR` (`i_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
