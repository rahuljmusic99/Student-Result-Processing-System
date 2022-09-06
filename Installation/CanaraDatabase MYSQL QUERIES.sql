CREATE DATABASE  IF NOT EXISTS `canaradatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `canaradatabase`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: canaradatabase
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `profile_image` mediumblob,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (200,'Canara','College 2',7760207762,'canaracollege@gmail.com','Canara@321',NULL),(201,'Canara','College',7760207762,'rahuljmusic99@gmail.com','Canara@123',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL,
  `class_name` varchar(10) NOT NULL,
  `programme_id` int NOT NULL,
  `class_year` int NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `programme_id` (`programme_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programme` (`programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (221,'BCA',231,2),(222,'BCA',231,3),(233,'BCOM',222,3),(444,'BBA',999,3);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_code` varchar(9) NOT NULL,
  `course_name` varchar(64) NOT NULL,
  `course_type` varchar(9) NOT NULL,
  `course_group` varchar(32) NOT NULL,
  `course_group_number` float NOT NULL,
  `course_sem` int NOT NULL,
  `max_marks` int NOT NULL,
  `min_marks` int NOT NULL,
  `max_IA` int NOT NULL,
  `programme_id` int NOT NULL,
  PRIMARY KEY (`course_code`),
  KEY `programme_id` (`programme_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programme` (`programme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BCACAC181','BASIC MATHEMATICS','Theory','Group 1 Core Course',1,2,80,28,20,231),('BCACAC182','OBJECT ORIENTED PROGRAMMING USING C++','Theory','Group 1 Core Course',1,2,80,28,20,231),('BCACAC231','OPERATING SYSTEMS AND LINUX','Theory','Group 1 Core Course',1,3,80,28,20,231),('BCACAC232','DATA STRUCTURES','Theory','Group 1 Core Course',1,3,80,28,20,231),('BCACAC233','VISUAL BASIC.NET PROGRAMMING','Theory','Group 1 Core Course',1,3,80,28,20,231),('BCACAC237','DESKTOP PUBLISHING','Theory','Group 2 Elective Course',2,3,80,28,20,231),('BCACAP234','OPERATING SYSTEMS AND DATA STRUCTURES LAB','Practical','Group 1 Core Course',1,3,80,28,20,231),('BCACAP235','VB.NET LAB','Practical','Group 1 Core Course',1,3,80,28,20,231),('BCAENL231','ENGLISH LANGUAGE','Theory','Group 3 a)Compulsary Foundation',3.1,3,80,28,20,231),('BCOMM123','CVCVC','Practical','Group 2 Elective Course',2,3,80,28,20,222);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_details`
--

DROP TABLE IF EXISTS `exam_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_details` (
  `reg_no` int NOT NULL,
  `semester` int NOT NULL,
  `exam_type` varchar(14) NOT NULL,
  `exam_month` int NOT NULL,
  `exam_year` varchar(9) NOT NULL,
  `result_date` date NOT NULL,
  KEY `reg_no` (`reg_no`),
  CONSTRAINT `exam_details_ibfk_2` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_details`
--

LOCK TABLES `exam_details` WRITE;
/*!40000 ALTER TABLE `exam_details` DISABLE KEYS */;
INSERT INTO `exam_details` VALUES (191132713,2,'FirstInternal',9,'2022','2022-09-06');
/*!40000 ALTER TABLE `exam_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_marks`
--

DROP TABLE IF EXISTS `final_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_marks` (
  `reg_no` int NOT NULL,
  `course_code` varchar(9) NOT NULL,
  `programme_id` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `IA_marks` int NOT NULL,
  `total_marks` int NOT NULL,
  `grade` varchar(4) NOT NULL,
  `credit` int NOT NULL,
  `grade_point` float NOT NULL,
  `grade_point_weightage` float NOT NULL,
  `result` varchar(10) NOT NULL,
  KEY `programme_id` (`programme_id`),
  KEY `reg_no` (`reg_no`),
  KEY `course_code` (`course_code`),
  CONSTRAINT `final_marks_ibfk_3` FOREIGN KEY (`programme_id`) REFERENCES `programme` (`programme_id`),
  CONSTRAINT `final_marks_ibfk_4` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`) ON DELETE CASCADE,
  CONSTRAINT `final_marks_ibfk_5` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_marks`
--

LOCK TABLES `final_marks` WRITE;
/*!40000 ALTER TABLE `final_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_internal_marks`
--

DROP TABLE IF EXISTS `first_internal_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `first_internal_marks` (
  `reg_no` int NOT NULL,
  `course_code` varchar(9) NOT NULL,
  `programme_id` int NOT NULL,
  `max_marks` int NOT NULL,
  `min_marks` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `grade` varchar(4) NOT NULL,
  `result` varchar(10) NOT NULL,
  KEY `programme_id` (`programme_id`),
  KEY `reg_no` (`reg_no`),
  KEY `course_code` (`course_code`),
  CONSTRAINT `first_internal_marks_ibfk_3` FOREIGN KEY (`programme_id`) REFERENCES `programme` (`programme_id`),
  CONSTRAINT `first_internal_marks_ibfk_4` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`) ON DELETE CASCADE,
  CONSTRAINT `first_internal_marks_ibfk_5` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_internal_marks`
--

LOCK TABLES `first_internal_marks` WRITE;
/*!40000 ALTER TABLE `first_internal_marks` DISABLE KEYS */;
INSERT INTO `first_internal_marks` VALUES (191132713,'BCACAC181',231,25,8,15,'AB','PASS');
/*!40000 ALTER TABLE `first_internal_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programme`
--

DROP TABLE IF EXISTS `programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programme` (
  `programme_id` int NOT NULL,
  `programme_name` varchar(35) NOT NULL,
  `programme_duration` int NOT NULL,
  `programme_sem` int NOT NULL,
  PRIMARY KEY (`programme_id`),
  UNIQUE KEY `programme_name` (`programme_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programme`
--

LOCK TABLES `programme` WRITE;
/*!40000 ALTER TABLE `programme` DISABLE KEYS */;
INSERT INTO `programme` VALUES (222,'BACHELOR OF COMMERCE',3,6),(231,'BACHELOR OF COMPUTER APPLICATION',3,6),(999,'BBA',3,6);
/*!40000 ALTER TABLE `programme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second_internal_marks`
--

DROP TABLE IF EXISTS `second_internal_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `second_internal_marks` (
  `reg_no` int NOT NULL,
  `course_code` varchar(9) NOT NULL,
  `programme_id` int NOT NULL,
  `max_marks` int NOT NULL,
  `min_marks` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `grade` varchar(4) NOT NULL,
  `result` varchar(10) NOT NULL,
  KEY `programme_id` (`programme_id`),
  KEY `reg_no` (`reg_no`),
  KEY `course_code` (`course_code`),
  CONSTRAINT `second_internal_marks_ibfk_3` FOREIGN KEY (`programme_id`) REFERENCES `programme` (`programme_id`),
  CONSTRAINT `second_internal_marks_ibfk_4` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`) ON DELETE CASCADE,
  CONSTRAINT `second_internal_marks_ibfk_5` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second_internal_marks`
--

LOCK TABLES `second_internal_marks` WRITE;
/*!40000 ALTER TABLE `second_internal_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `second_internal_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone` bigint NOT NULL,
  `address` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `programme_id` int NOT NULL,
  `staff_status` varchar(5) NOT NULL,
  `role` varchar(16) NOT NULL,
  `profile_image` mediumblob,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `email` (`email`),
  KEY `programme_id` (`programme_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programme` (`programme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (111,'Amita','Amita','Female','amita@gmail.com',6363772014,'Chillimbi','Amita@123',231,'true','Internal Auditor',NULL),(112,'Rakshitha','R','Female','rakshitha@gmail.com',7760207762,'Chillimbi','Rakshitha@123',231,'true','Faculty',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `reg_no` int NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone` bigint NOT NULL,
  `address` varchar(25) NOT NULL,
  `birth_place` varchar(20) NOT NULL,
  `birth_district` varchar(20) NOT NULL,
  `birth_state` varchar(20) NOT NULL,
  `pincode` int NOT NULL,
  `password` varchar(25) NOT NULL,
  `programme_id` int NOT NULL,
  `class_id` int NOT NULL,
  `joining_year` int NOT NULL,
  `semester` int NOT NULL,
  `status` varchar(5) NOT NULL,
  `profile_image` mediumblob,
  PRIMARY KEY (`reg_no`),
  UNIQUE KEY `email` (`email`),
  KEY `programme_id` (`programme_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `programme` (`programme_id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (191132711,'Pavitra','Pavitra','Female','2001-09-12','pavitra@gmail.com',6767676767,'Chilimbi','Mangalore','Dakshina Kannada','Karnataka',575006,'Pavitra@123',231,222,2019,6,'true',NULL),(191132713,'Manish','Shetty','Male','2003-09-10','manish@gmail.com',9148852476,'Chilimbi','Mangalore','Dakshina Kannada','Karnataka',575006,'Manish@123',231,221,2020,4,'true',NULL),(191132730,'Priyesh','Kamath','Male','2001-10-08','priyesh@gmail.com',7760207762,'Chilimbi','Mangalore','Dakshina Kannada','Karnataka',575006,'Priyesh@123',222,233,2019,6,'true',NULL),(191132887,'Rahul','J','Male','1990-10-08','rahuljmusic99@gmail.com',7760207762,'Morgansgate','Mangalore','Dakshina Kannada','Karnataka',575001,'Rahul@123',231,221,2019,4,'true',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-06 11:54:28
