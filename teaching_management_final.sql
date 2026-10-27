-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: teaching_management
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','STAFF','LECTURER','STUDENT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_accounts_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'admin','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','ADMIN',1),(2,'staff','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STAFF',1),(3,'sv001','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(4,'sv002','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(5,'sv003','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(6,'sv004','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(7,'sv005','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(8,'sv006','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(9,'sv007','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(10,'sv008','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(11,'sv009','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(12,'sv010','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(13,'sv011','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(14,'sv012','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(15,'sv013','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(16,'sv014','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(17,'sv015','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(18,'sv016','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(19,'sv017','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(20,'sv018','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(21,'sv019','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(22,'sv020','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','STUDENT',1),(23,'gv001','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','LECTURER',1),(24,'gv002','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','LECTURER',1),(25,'gv003','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','LECTURER',1),(26,'gv004','$2a$10$MQWwkYGFjdszwjdeTEnKA.NTRmE1O9/izyEJc2Zz/BSA1IfQb3Num','LECTURER',1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_classes`
--

DROP TABLE IF EXISTS `admin_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_classes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cohort` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_admin_classes_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_classes`
--

LOCK TABLES `admin_classes` WRITE;
/*!40000 ALTER TABLE `admin_classes` DISABLE KEYS */;
INSERT INTO `admin_classes` VALUES (1,'D26CN01','Công nghệ thông tin 01','2026'),(2,'D26CN02','Công nghệ thông tin 02','2026');
/*!40000 ALTER TABLE `admin_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_courses_code` (`code`),
  CONSTRAINT `chk_courses_credits` CHECK ((`credits` between 1 and 6))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CSDL','Cơ sở dữ liệu',3),(2,'JAVA','Lập trình Java',3),(3,'CTDL','Cấu trúc dữ liệu và giải thuật',3),(4,'MMT','Mạng máy tính',3),(5,'CNPM','Công nghệ phần mềm',3),(6,'HDH','Hệ điều hành',3);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `status` enum('ACTIVE','CANCELLED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `registered_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cancelled_at` datetime DEFAULT NULL,
  `attendance_score` decimal(4,2) DEFAULT NULL,
  `midterm_score` decimal(4,2) DEFAULT NULL,
  `final_score` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_enrollments_student_section` (`student_id`,`section_id`),
  KEY `idx_enrollments_student_status` (`student_id`,`status`),
  KEY `idx_enrollments_section_status` (`section_id`,`status`),
  CONSTRAINT `fk_enrollments_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_enrollments_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_enrollments_attendance_score` CHECK (((`attendance_score` is null) or (`attendance_score` between 0 and 10))),
  CONSTRAINT `chk_enrollments_final_score` CHECK (((`final_score` is null) or (`final_score` between 0 and 10))),
  CONSTRAINT `chk_enrollments_midterm_score` CHECK (((`midterm_score` is null) or (`midterm_score` between 0 and 10)))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (6,4,13,'ACTIVE','2026-10-22 07:26:15',NULL,NULL,NULL,NULL),(7,1,9,'ACTIVE','2026-10-23 07:29:21',NULL,NULL,NULL,NULL),(8,1,11,'ACTIVE','2026-10-23 07:30:38',NULL,NULL,NULL,NULL),(9,2,14,'ACTIVE','2026-10-23 07:59:17',NULL,NULL,NULL,NULL),(10,5,16,'ACTIVE','2026-10-23 14:47:59',NULL,NULL,NULL,NULL),(11,5,15,'ACTIVE','2026-10-23 14:47:59',NULL,8.00,6.00,5.00),(12,6,15,'CANCELLED','2026-10-23 14:47:59','2026-10-23 14:48:47',NULL,NULL,NULL),(13,7,17,'ACTIVE','2026-10-23 14:47:59',NULL,NULL,NULL,NULL),(14,8,18,'CANCELLED','2026-10-23 14:47:59','2026-10-23 14:50:08',NULL,NULL,NULL),(15,9,19,'ACTIVE','2026-10-25 08:17:31',NULL,2.00,3.00,3.00),(16,1,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(17,1,20,'ACTIVE','2026-10-26 01:11:33',NULL,8.00,6.00,5.00),(18,2,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(19,2,20,'ACTIVE','2026-10-26 01:11:33',NULL,0.00,0.00,0.00),(20,3,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(21,3,20,'ACTIVE','2026-10-26 01:11:33',NULL,10.00,10.00,10.00),(22,4,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(23,4,20,'ACTIVE','2026-10-26 01:11:33',NULL,3.00,3.00,3.00),(24,5,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(25,5,20,'ACTIVE','2026-10-26 01:11:33',NULL,7.00,7.00,7.00),(26,6,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(27,6,20,'ACTIVE','2026-10-26 01:11:33',NULL,7.00,7.00,7.00),(28,7,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(29,7,20,'ACTIVE','2026-10-26 01:11:33',NULL,7.00,7.00,7.00),(30,8,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(31,8,20,'ACTIVE','2026-10-26 01:11:33',NULL,7.00,7.00,7.00),(32,9,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(33,9,20,'ACTIVE','2026-10-26 01:11:33',NULL,7.00,7.00,7.00),(34,10,22,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(35,10,20,'ACTIVE','2026-10-26 01:11:33',NULL,7.00,7.00,7.00),(36,11,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(37,12,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(38,13,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(39,14,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(40,15,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(41,16,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(42,17,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(43,18,24,'ACTIVE','2026-10-26 01:11:33',NULL,NULL,NULL,NULL),(44,19,24,'CANCELLED','2026-10-26 01:11:33','2026-10-26 01:12:33',NULL,NULL,NULL),(45,20,24,'CANCELLED','2026-10-26 01:11:33','2026-10-26 01:12:33',NULL,NULL,NULL),(47,18,25,'ACTIVE','2026-10-26 01:12:33',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_enrollment_score_insert` BEFORE INSERT ON `enrollments` FOR EACH ROW BEGIN
    IF (NEW.attendance_score IS NOT NULL AND (NEW.attendance_score < 0 OR NEW.attendance_score > 10))
       OR (NEW.midterm_score IS NOT NULL AND (NEW.midterm_score < 0 OR NEW.midterm_score > 10))
       OR (NEW.final_score IS NOT NULL AND (NEW.final_score < 0 OR NEW.final_score > 10)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID_SCORE';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_enrollment_score_update` BEFORE UPDATE ON `enrollments` FOR EACH ROW BEGIN
    IF (NEW.attendance_score IS NOT NULL AND (NEW.attendance_score < 0 OR NEW.attendance_score > 10))
       OR (NEW.midterm_score IS NOT NULL AND (NEW.midterm_score < 0 OR NEW.midterm_score > 10))
       OR (NEW.final_score IS NOT NULL AND (NEW.final_score < 0 OR NEW.final_score > 10)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID_SCORE';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_lecturers_code` (`code`),
  UNIQUE KEY `uq_lecturers_account` (`account_id`),
  CONSTRAINT `fk_lecturers_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (1,'GV001','Giảng viên Demo 01','gv001@example.com',23),(2,'GV002','Giảng viên Demo 02','gv002@example.com',24),(3,'GV003','Giảng viên Demo 03','gv003@example.com',25),(4,'GV004','Giảng viên Demo 04','gv004@example.com',26);
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receipt_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint NOT NULL,
  `semester_id` bigint NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `paid_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `collector_account_id` bigint NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_payments_receipt` (`receipt_code`),
  KEY `fk_payments_semester_id` (`semester_id`),
  KEY `fk_payments_collector_account_id` (`collector_account_id`),
  KEY `idx_payments_student_semester` (`student_id`,`semester_id`),
  CONSTRAINT `fk_payments_collector_account_id` FOREIGN KEY (`collector_account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_payments_semester_id` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_payments_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_payments_amount` CHECK ((`amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'D4-P001',5,4,1000000.00,'2026-10-23 14:49:34',2,'Thu lan 1 ngay 4'),(2,'D4-P002',5,4,500000.00,'2026-10-23 14:49:55',2,'Thu lan 2 ngay 4'),(3,'D4-P003',5,4,1500000.00,'2026-10-23 14:50:00',2,'Tat toan'),(4,'D4-CREDIT-001',8,4,1000000.00,'2026-10-23 14:50:08',2,'Minh hoa du co sau huy'),(5,'D4-RACE-A',7,4,1000000.00,'2026-10-23 14:56:16',2,'Concurrent A'),(6,'D5-DEMO-001',9,5,100000.00,'2026-10-25 08:17:45',2,'Kiem thu quyen app'),(7,'D6-R001',1,6,1000000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(8,'D6-R002',2,6,3000000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(9,'D6-R003',3,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(10,'D6-R004',4,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(11,'D6-R005',5,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(12,'D6-R006',6,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(13,'D6-R007',7,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(14,'D6-R008',8,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(15,'D6-R009',9,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(16,'D6-R010',10,6,100000.00,'2026-10-26 01:12:33',2,'Du lieu gia lap tong hop ngay 6'),(17,'D6-R020',20,6,500000.00,'2026-10-26 01:12:03',2,'Du lieu gia lap tong hop ngay 6');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `section_id` bigint NOT NULL,
  `weekday` int NOT NULL,
  `start_period` int NOT NULL,
  `period_count` int NOT NULL,
  `room` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_schedules_section_id` (`section_id`),
  CONSTRAINT `fk_schedules_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_schedules_count` CHECK ((`period_count` >= 1)),
  CONSTRAINT `chk_schedules_end` CHECK ((((`start_period` + `period_count`) - 1) <= 15)),
  CONSTRAINT `chk_schedules_start` CHECK ((`start_period` >= 1)),
  CONSTRAINT `chk_schedules_weekday` CHECK ((`weekday` between 2 and 8))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,1,2,1,3,'A101'),(2,2,3,1,3,'A102'),(3,3,4,1,3,'A103'),(4,4,5,1,3,'A104'),(5,5,6,1,3,'A101'),(6,6,7,1,3,'A102'),(7,7,2,4,3,'A103'),(8,8,3,4,3,'A104'),(9,12,2,1,3,'D3-TEST'),(10,9,2,1,3,'D3-TEST'),(11,10,2,1,3,'D3-TEST'),(12,11,2,1,3,'D3-TEST'),(13,13,2,1,3,'D3-TEST'),(14,14,2,1,3,'D3-TEST'),(16,15,2,1,3,'D4_TEST'),(17,16,2,1,3,'D4_TEST'),(18,17,2,1,3,'D4_TEST'),(19,18,2,1,3,'D4_TEST'),(20,19,3,4,3,'D5_TEST'),(21,21,2,1,3,'D6-A101'),(22,20,2,1,3,'D6-A101'),(23,22,3,1,3,'D6-A101'),(24,23,2,1,3,'D6-A101'),(25,24,2,1,3,'D6-A101'),(26,25,2,1,3,'D6-A101'),(28,20,5,4,3,'D6-A102');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint NOT NULL,
  `semester_id` bigint NOT NULL,
  `lecturer_id` bigint NOT NULL,
  `max_students` int NOT NULL,
  `start_date` date NOT NULL,
  `status` enum('DRAFT','OPEN','CLOSED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `credits_snapshot` int NOT NULL,
  `unit_price_snapshot` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sections_code` (`code`),
  KEY `fk_sections_course_id` (`course_id`),
  KEY `fk_sections_lecturer_id` (`lecturer_id`),
  KEY `idx_sections_semester_status` (`semester_id`,`status`),
  CONSTRAINT `fk_sections_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sections_lecturer_id` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sections_semester_id` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_sections_capacity` CHECK ((`max_students` > 0)),
  CONSTRAINT `chk_sections_credits` CHECK ((`credits_snapshot` between 1 and 6)),
  CONSTRAINT `chk_sections_price` CHECK ((`unit_price_snapshot` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'LP01',1,2,1,30,'2026-11-04','OPEN',3,500000.00),(2,'LP02',2,2,2,30,'2026-11-04','OPEN',3,500000.00),(3,'LP03',3,2,3,1,'2026-11-11','OPEN',3,500000.00),(4,'LP04',1,2,4,30,'2026-11-04','OPEN',3,500000.00),(5,'LP05',4,2,1,30,'2026-11-18','DRAFT',3,500000.00),(6,'LP06',5,2,2,30,'2026-10-20','OPEN',3,500000.00),(7,'LP07',2,1,3,30,'2026-06-23','CLOSED',3,450000.00),(8,'LP08',6,1,4,30,'2026-06-23','CLOSED',3,450000.00),(9,'D3_A',1,3,1,30,'2026-11-06','OPEN',3,500000.00),(10,'D3_B',1,3,1,30,'2026-11-06','OPEN',3,500000.00),(11,'D3_ONE',2,3,1,1,'2026-11-06','OPEN',3,500000.00),(12,'D3_DRAFT',3,3,1,30,'2026-11-06','DRAFT',3,500000.00),(13,'D3_TODAY',3,3,1,30,'2026-10-23','OPEN',3,500000.00),(14,'D3_RACE',2,3,1,1,'2026-11-06','OPEN',3,500000.00),(15,'D4_A',1,4,1,30,'2026-11-06','OPEN',3,500000.00),(16,'D4_B',2,4,1,30,'2026-11-06','OPEN',3,500000.00),(17,'D4_RACE',3,4,1,30,'2026-11-06','OPEN',3,500000.00),(18,'D4_CREDIT',1,4,1,30,'2026-11-06','OPEN',3,500000.00),(19,'D5_A',1,5,1,30,'2026-11-08','OPEN',3,500000.00),(20,'D6_CSDL',1,6,1,30,'2026-11-09','OPEN',3,500000.00),(21,'D6_DRAFT',5,6,1,30,'2026-11-09','DRAFT',3,500000.00),(22,'D6_JAVA',2,6,2,30,'2026-11-09','OPEN',3,500000.00),(23,'D6_TODAY',6,6,2,30,'2026-10-26','OPEN',3,500000.00),(24,'D6_CT',3,6,3,10,'2026-11-09','OPEN',3,500000.00),(25,'D6_FULL',4,6,4,1,'2026-11-09','OPEN',3,500000.00);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semesters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `default_unit_price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_semesters_code` (`code`),
  CONSTRAINT `chk_semesters_dates` CHECK ((`end_date` >= `start_date`)),
  CONSTRAINT `chk_semesters_price` CHECK ((`default_unit_price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,'HK01','Học kỳ demo đã kết thúc','2026-05-24','2026-09-21',450000.00),(2,'HK02','Học kỳ demo hiện tại','2026-10-14','2027-02-18',500000.00),(3,'D3_TEST','Hoc ky kiem thu ngay 3','2026-10-22','2027-02-20',500000.00),(4,'D4_TEST','Hoc ky thu nghiem ngay 4','2026-10-22','2027-02-20',500000.00),(5,'D5_TEST','Hoc ky thu quyen ngay 5','2026-10-24','2027-02-22',500000.00),(6,'D6_DEMO','Hoc ky demo tong hop ngay 6','2026-10-25','2027-02-23',500000.00);
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_class_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_students_code` (`code`),
  UNIQUE KEY `uq_students_account` (`account_id`),
  KEY `fk_students_admin_class_id` (`admin_class_id`),
  KEY `idx_students_full_name` (`full_name`),
  CONSTRAINT `fk_students_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_students_admin_class_id` FOREIGN KEY (`admin_class_id`) REFERENCES `admin_classes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'SV001','Sinh viên Demo 01','sv001@example.com',1,3),(2,'SV002','Sinh viên Demo 02','sv002@example.com',1,4),(3,'SV003','Sinh viên Demo 03','sv003@example.com',1,5),(4,'SV004','Sinh viên Demo 04','sv004@example.com',1,6),(5,'SV005','Sinh viên Demo 05','sv005@example.com',1,7),(6,'SV006','Sinh viên Demo 06','sv006@example.com',1,8),(7,'SV007','Sinh viên Demo 07','sv007@example.com',1,9),(8,'SV008','Sinh viên Demo 08','sv008@example.com',1,10),(9,'SV009','Sinh viên Demo 09','sv009@example.com',1,11),(10,'SV010','Sinh viên Demo 10','sv010@example.com',1,12),(11,'SV011','Sinh viên Demo 11','sv011@example.com',2,13),(12,'SV012','Sinh viên Demo 12','sv012@example.com',2,14),(13,'SV013','Sinh viên Demo 13','sv013@example.com',2,15),(14,'SV014','Sinh viên Demo 14','sv014@example.com',2,16),(15,'SV015','Sinh viên Demo 15','sv015@example.com',2,17),(16,'SV016','Sinh viên Demo 16','sv016@example.com',2,18),(17,'SV017','Sinh viên Demo 17','sv017@example.com',2,19),(18,'SV018','Sinh viên Demo 18','sv018@example.com',2,20),(19,'SV019','Sinh viên Demo 19','sv019@example.com',2,21),(20,'SV020','Sinh viên Demo 20','sv020@example.com',2,22);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_class_roster`
--

DROP TABLE IF EXISTS `v_class_roster`;
/*!50001 DROP VIEW IF EXISTS `v_class_roster`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_class_roster` AS SELECT 
 1 AS `enrollment_id`,
 1 AS `student_id`,
 1 AS `student_code`,
 1 AS `student_name`,
 1 AS `admin_class_id`,
 1 AS `admin_class_code`,
 1 AS `admin_class_name`,
 1 AS `section_id`,
 1 AS `section_code`,
 1 AS `course_id`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `semester_id`,
 1 AS `semester_code`,
 1 AS `semester_name`,
 1 AS `lecturer_id`,
 1 AS `lecturer_code`,
 1 AS `lecturer_name`,
 1 AS `enrollment_status`,
 1 AS `registered_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_student_grades`
--

DROP TABLE IF EXISTS `v_student_grades`;
/*!50001 DROP VIEW IF EXISTS `v_student_grades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_student_grades` AS SELECT 
 1 AS `enrollment_id`,
 1 AS `student_id`,
 1 AS `student_code`,
 1 AS `student_name`,
 1 AS `section_id`,
 1 AS `section_code`,
 1 AS `course_id`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `semester_id`,
 1 AS `semester_code`,
 1 AS `semester_name`,
 1 AS `lecturer_id`,
 1 AS `credits`,
 1 AS `attendance_score`,
 1 AS `midterm_score`,
 1 AS `final_score`,
 1 AS `total_score`,
 1 AS `grade_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tuition_summary`
--

DROP TABLE IF EXISTS `v_tuition_summary`;
/*!50001 DROP VIEW IF EXISTS `v_tuition_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_tuition_summary` AS SELECT 
 1 AS `student_id`,
 1 AS `student_code`,
 1 AS `student_name`,
 1 AS `semester_id`,
 1 AS `semester_code`,
 1 AS `semester_name`,
 1 AS `total_tuition`,
 1 AS `total_paid`,
 1 AS `balance`,
 1 AS `outstanding`,
 1 AS `credit`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'teaching_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_cancel_enrollment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cancel_enrollment`(IN p_student_id BIGINT, IN p_enrollment_id BIGINT)
    MODIFIES SQL DATA
BEGIN
  DECLARE v_student BIGINT;
  DECLARE v_owner BIGINT;
  DECLARE v_section BIGINT;
  DECLARE v_start DATE;
  DECLARE v_status VARCHAR(10);
  DECLARE v_count BIGINT DEFAULT 0;
  DECLARE v_missing BOOLEAN DEFAULT FALSE;
  SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
  BEGIN
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_missing = TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
      ROLLBACK;
      RESIGNAL;
    END;
    START TRANSACTION;
    IF p_student_id IS NULL OR p_student_id <= 0
       OR p_enrollment_id IS NULL OR p_enrollment_id <= 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID_ARGUMENT';
    END IF;
    SELECT id INTO v_student FROM students WHERE id=p_student_id FOR UPDATE;
    IF v_missing THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'STUDENT_NOT_FOUND';
    END IF;
    SELECT COUNT(*) INTO v_count FROM students st JOIN accounts a ON a.id=st.account_id
      WHERE st.id=p_student_id AND a.role='STUDENT' AND a.active=1;
    IF v_count <> 1 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'STUDENT_ACCOUNT_INVALID';
    END IF;
    SET v_missing=FALSE;
    -- Read metadata without locking the enrollment before the section.
    SELECT student_id, section_id INTO v_owner, v_section
      FROM enrollments WHERE id=p_enrollment_id;
    IF v_missing THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ENROLLMENT_NOT_FOUND';
    END IF;
    IF v_owner <> p_student_id THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT_OWNER';
    END IF;
    SET v_missing=FALSE;
    SELECT start_date INTO v_start FROM sections WHERE id=v_section FOR UPDATE;
    IF v_missing THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SECTION_NOT_FOUND';
    END IF;
    SET v_missing=FALSE;
    SELECT status INTO v_status FROM enrollments
      WHERE id=p_enrollment_id AND student_id=p_student_id AND section_id=v_section FOR UPDATE;
    IF v_missing THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ENROLLMENT_NOT_FOUND';
    END IF;
    IF v_status <> 'ACTIVE' THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ENROLLMENT_NOT_ACTIVE';
    END IF;
    IF CURRENT_DATE() >= v_start THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CANCELLATION_CLOSED';
    END IF;
    UPDATE enrollments SET status='CANCELLED', cancelled_at=CURRENT_TIMESTAMP
      WHERE id=p_enrollment_id;
    COMMIT;
    SELECT p_enrollment_id AS id, 'CANCELLED' AS status;
  END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_record_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_record_payment`(
    IN p_student_id BIGINT, IN p_semester_id BIGINT, IN p_collector_account_id BIGINT,
    IN p_receipt_code VARCHAR(30), IN p_amount DECIMAL(12,2), IN p_note VARCHAR(255)
)
    MODIFIES SQL DATA
BEGIN
    DECLARE v_locked BIGINT;
    DECLARE v_ok INT DEFAULT 0;
    DECLARE v_due DECIMAL(24,2) DEFAULT 0;
    DECLARE v_paid DECIMAL(24,2) DEFAULT 0;
    DECLARE v_id BIGINT;
    DECLARE v_receipt VARCHAR(30);
    DECLARE v_missing BOOLEAN DEFAULT FALSE;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    BEGIN
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_missing=TRUE;
        -- Unique receipt protects concurrent requests for different students too.
        DECLARE EXIT HANDLER FOR 1062
        BEGIN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='DUPLICATE_RECEIPT'; END;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; RESIGNAL; END;
        START TRANSACTION;
        IF p_student_id IS NULL OR p_student_id<=0 OR p_semester_id IS NULL OR p_semester_id<=0
           OR p_collector_account_id IS NULL OR p_collector_account_id<=0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='INVALID_ARGUMENT';
        END IF;
        IF p_amount IS NULL OR p_amount<=0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='INVALID_AMOUNT'; END IF;
        SET v_receipt=TRIM(p_receipt_code);
        IF v_receipt IS NULL OR CHAR_LENGTH(v_receipt)=0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='INVALID_RECEIPT';
        END IF;
        SET v_missing=FALSE;
        -- Shared mutex with registration, cancellation and scores.
        SELECT id INTO v_locked FROM students WHERE id=p_student_id FOR UPDATE;
        IF v_missing THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='STUDENT_NOT_FOUND'; END IF;
        SELECT COUNT(*) INTO v_ok FROM students s JOIN accounts a ON a.id=s.account_id
        WHERE s.id=p_student_id AND a.role='STUDENT' AND a.active=1;
        IF v_ok<>1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='STUDENT_ACCOUNT_INVALID'; END IF;
        SELECT COUNT(*) INTO v_ok FROM semesters WHERE id=p_semester_id;
        IF v_ok<>1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='SEMESTER_NOT_FOUND'; END IF;
        SELECT COUNT(*) INTO v_ok FROM accounts WHERE id=p_collector_account_id AND active=1 AND role IN ('ADMIN','STAFF');
        IF v_ok<>1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='COLLECTOR_ACCOUNT_INVALID'; END IF;
        IF EXISTS (SELECT 1 FROM payments WHERE receipt_code=v_receipt) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='DUPLICATE_RECEIPT';
        END IF;
        -- Separate aggregates prevent enrollment x payment row multiplication.
        SELECT COALESCE(SUM(s.credits_snapshot*s.unit_price_snapshot),0) INTO v_due
        FROM enrollments e JOIN sections s ON s.id=e.section_id
        WHERE e.student_id=p_student_id AND s.semester_id=p_semester_id AND e.status='ACTIVE';
        SELECT COALESCE(SUM(amount),0) INTO v_paid FROM payments
        WHERE student_id=p_student_id AND semester_id=p_semester_id;
        IF v_due-v_paid<=0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='NO_OUTSTANDING_BALANCE'; END IF;
        IF p_amount>v_due-v_paid THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='PAYMENT_EXCEEDS_BALANCE'; END IF;
        INSERT INTO payments(receipt_code,student_id,semester_id,amount,collector_account_id,note)
        VALUES(v_receipt,p_student_id,p_semester_id,p_amount,p_collector_account_id,p_note);
        SET v_id=LAST_INSERT_ID();
        COMMIT;
        SELECT v_id AS id,'RECORDED' AS status;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_register_section` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_register_section`(IN p_student_id BIGINT, IN p_section_id BIGINT)
    MODIFIES SQL DATA
BEGIN
  DECLARE v_student BIGINT;
  DECLARE v_course BIGINT;
  DECLARE v_semester BIGINT;
  DECLARE v_capacity INT;
  DECLARE v_start DATE;
  DECLARE v_class_status VARCHAR(10);
  DECLARE v_enrollment BIGINT DEFAULT NULL;
  DECLARE v_enrollment_status VARCHAR(10);
  DECLARE v_count BIGINT DEFAULT 0;
  DECLARE v_missing BOOLEAN DEFAULT FALSE;
  -- Do not use SET SESSION here: apply isolation to this transaction only.
  SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
  BEGIN
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_missing = TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
      ROLLBACK;
      RESIGNAL;
    END;
    START TRANSACTION;
    IF p_student_id IS NULL OR p_student_id <= 0
       OR p_section_id IS NULL OR p_section_id <= 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID_ARGUMENT';
    END IF;
    -- Global lock order for all enrollment writers: student, section, enrollment.
    SELECT id INTO v_student FROM students WHERE id = p_student_id FOR UPDATE;
    IF v_missing THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'STUDENT_NOT_FOUND';
    END IF;
    SELECT COUNT(*) INTO v_count FROM students st JOIN accounts a ON a.id=st.account_id
      WHERE st.id=p_student_id AND a.role='STUDENT' AND a.active=1;
    IF v_count <> 1 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'STUDENT_ACCOUNT_INVALID';
    END IF;
    SET v_missing=FALSE;
    SELECT course_id, semester_id, max_students, start_date, status
      INTO v_course, v_semester, v_capacity, v_start, v_class_status
      FROM sections WHERE id=p_section_id FOR UPDATE;
    IF v_missing THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SECTION_NOT_FOUND';
    END IF;
    IF v_class_status <> 'OPEN' THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CLASS_NOT_OPEN';
    END IF;
    IF CURRENT_DATE() >= v_start THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'REGISTRATION_CLOSED';
    END IF;
    SET v_missing=FALSE;
    SELECT id, status INTO v_enrollment, v_enrollment_status
      FROM enrollments WHERE student_id=p_student_id AND section_id=p_section_id FOR UPDATE;
    -- A missing enrollment is the normal first-registration case.
    IF NOT v_missing AND v_enrollment_status='ACTIVE' THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DUPLICATE_ENROLLMENT';
    END IF;
    -- READ COMMITTED gives a fresh view after the student and section locks.
    SELECT COUNT(*) INTO v_count FROM enrollments e
      JOIN sections sec ON sec.id=e.section_id
      WHERE e.student_id=p_student_id AND e.status='ACTIVE'
        AND sec.course_id=v_course AND sec.semester_id=v_semester;
    IF v_count > 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DUPLICATE_COURSE';
    END IF;
    SELECT COUNT(*) INTO v_count FROM enrollments
      WHERE section_id=p_section_id AND status='ACTIVE';
    IF v_count >= v_capacity THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CLASS_FULL';
    END IF;
    IF v_enrollment IS NULL THEN
      INSERT INTO enrollments(student_id, section_id, status)
        VALUES(p_student_id, p_section_id, 'ACTIVE');
      SET v_enrollment=LAST_INSERT_ID();
    ELSE
      UPDATE enrollments SET status='ACTIVE', registered_at=CURRENT_TIMESTAMP,
        cancelled_at=NULL, attendance_score=NULL, midterm_score=NULL, final_score=NULL
        WHERE id=v_enrollment;
    END IF;
    COMMIT;
    SELECT v_enrollment AS id, 'ACTIVE' AS status;
  END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_scores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_scores`(
    IN p_lecturer_id BIGINT, IN p_enrollment_id BIGINT,
    IN p_attendance DECIMAL(4,2), IN p_midterm DECIMAL(4,2), IN p_final DECIMAL(4,2)
)
    MODIFIES SQL DATA
BEGIN
    DECLARE v_student BIGINT;
    DECLARE v_section BIGINT;
    DECLARE v_locked BIGINT;
    DECLARE v_student_check BIGINT;
    DECLARE v_section_check BIGINT;
    DECLARE v_lecturer BIGINT;
    DECLARE v_status VARCHAR(12);
    DECLARE v_ok INT DEFAULT 0;
    DECLARE v_missing BOOLEAN DEFAULT FALSE;
    -- Outside the rollback handler: reject an existing caller transaction.
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    BEGIN
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_missing=TRUE;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; RESIGNAL; END;
        START TRANSACTION;
        IF p_lecturer_id IS NULL OR p_lecturer_id<=0 OR p_enrollment_id IS NULL OR p_enrollment_id<=0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='INVALID_ARGUMENT';
        END IF;
        IF (p_attendance IS NOT NULL AND (p_attendance<0 OR p_attendance>10))
           OR (p_midterm IS NOT NULL AND (p_midterm<0 OR p_midterm>10))
           OR (p_final IS NOT NULL AND (p_final<0 OR p_final>10)) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='INVALID_SCORE';
        END IF;
        SELECT COUNT(*) INTO v_ok FROM lecturers l JOIN accounts a ON a.id=l.account_id
        WHERE l.id=p_lecturer_id AND a.role='LECTURER' AND a.active=1;
        IF v_ok<>1 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='LECTURER_ACCOUNT_INVALID';
        END IF;
        -- Metadata only. All mutable values are checked again under row locks.
        SET v_missing=FALSE;
        SELECT student_id,section_id INTO v_student,v_section FROM enrollments WHERE id=p_enrollment_id;
        IF v_missing THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='ENROLLMENT_NOT_FOUND'; END IF;
        SET v_missing=FALSE;
        SELECT id INTO v_locked FROM students WHERE id=v_student FOR UPDATE;
        IF v_missing THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='STUDENT_NOT_FOUND'; END IF;
        SET v_missing=FALSE;
        SELECT lecturer_id INTO v_lecturer FROM sections WHERE id=v_section FOR UPDATE;
        IF v_missing THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='SECTION_NOT_FOUND'; END IF;
        SET v_missing=FALSE;
        SELECT student_id,section_id,status INTO v_student_check,v_section_check,v_status
        FROM enrollments WHERE id=p_enrollment_id FOR UPDATE;
        IF v_missing THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='ENROLLMENT_NOT_FOUND'; END IF;
        IF v_student_check<>v_student OR v_section_check<>v_section THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='ENROLLMENT_CHANGED';
        END IF;
        IF v_lecturer<>p_lecturer_id THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='NOT_SECTION_LECTURER'; END IF;
        IF v_status<>'ACTIVE' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='ENROLLMENT_NOT_ACTIVE'; END IF;
        UPDATE enrollments SET attendance_score=p_attendance,midterm_score=p_midterm,final_score=p_final
        WHERE id=p_enrollment_id;
        COMMIT;
        SELECT p_enrollment_id AS id,'UPDATED' AS status;
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_class_roster`
--

/*!50001 DROP VIEW IF EXISTS `v_class_roster`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_class_roster` AS select `e`.`id` AS `enrollment_id`,`e`.`student_id` AS `student_id`,`st`.`code` AS `student_code`,`st`.`full_name` AS `student_name`,`st`.`admin_class_id` AS `admin_class_id`,`ac`.`code` AS `admin_class_code`,`ac`.`name` AS `admin_class_name`,`e`.`section_id` AS `section_id`,`sec`.`code` AS `section_code`,`sec`.`course_id` AS `course_id`,`c`.`code` AS `course_code`,`c`.`name` AS `course_name`,`sec`.`semester_id` AS `semester_id`,`sem`.`code` AS `semester_code`,`sem`.`name` AS `semester_name`,`sec`.`lecturer_id` AS `lecturer_id`,`l`.`code` AS `lecturer_code`,`l`.`full_name` AS `lecturer_name`,`e`.`status` AS `enrollment_status`,`e`.`registered_at` AS `registered_at` from ((((((`enrollments` `e` join `students` `st` on((`st`.`id` = `e`.`student_id`))) join `admin_classes` `ac` on((`ac`.`id` = `st`.`admin_class_id`))) join `sections` `sec` on((`sec`.`id` = `e`.`section_id`))) join `courses` `c` on((`c`.`id` = `sec`.`course_id`))) join `semesters` `sem` on((`sem`.`id` = `sec`.`semester_id`))) join `lecturers` `l` on((`l`.`id` = `sec`.`lecturer_id`))) where (`e`.`status` = 'ACTIVE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_student_grades`
--

/*!50001 DROP VIEW IF EXISTS `v_student_grades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_student_grades` AS select `e`.`id` AS `enrollment_id`,`e`.`student_id` AS `student_id`,`st`.`code` AS `student_code`,`st`.`full_name` AS `student_name`,`e`.`section_id` AS `section_id`,`sec`.`code` AS `section_code`,`sec`.`course_id` AS `course_id`,`c`.`code` AS `course_code`,`c`.`name` AS `course_name`,`sec`.`semester_id` AS `semester_id`,`sem`.`code` AS `semester_code`,`sem`.`name` AS `semester_name`,`sec`.`lecturer_id` AS `lecturer_id`,`sec`.`credits_snapshot` AS `credits`,`e`.`attendance_score` AS `attendance_score`,`e`.`midterm_score` AS `midterm_score`,`e`.`final_score` AS `final_score`,(case when ((`e`.`attendance_score` is null) or (`e`.`midterm_score` is null) or (`e`.`final_score` is null)) then NULL else cast(round((((`e`.`attendance_score` * 0.10) + (`e`.`midterm_score` * 0.30)) + (`e`.`final_score` * 0.60)),2) as decimal(4,2)) end) AS `total_score`,(case when ((`e`.`attendance_score` is null) or (`e`.`midterm_score` is null) or (`e`.`final_score` is null)) then 'Chưa đủ điểm' when (round((((`e`.`attendance_score` * 0.10) + (`e`.`midterm_score` * 0.30)) + (`e`.`final_score` * 0.60)),2) >= 4.00) then 'Đạt' else 'Chưa đạt' end) AS `grade_status` from ((((`enrollments` `e` join `students` `st` on((`st`.`id` = `e`.`student_id`))) join `sections` `sec` on((`sec`.`id` = `e`.`section_id`))) join `courses` `c` on((`c`.`id` = `sec`.`course_id`))) join `semesters` `sem` on((`sem`.`id` = `sec`.`semester_id`))) where (`e`.`status` = 'ACTIVE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tuition_summary`
--

/*!50001 DROP VIEW IF EXISTS `v_tuition_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tuition_summary` AS select `k`.`student_id` AS `student_id`,`st`.`code` AS `student_code`,`st`.`full_name` AS `student_name`,`k`.`semester_id` AS `semester_id`,`sem`.`code` AS `semester_code`,`sem`.`name` AS `semester_name`,coalesce(`d`.`total_tuition`,0.00) AS `total_tuition`,coalesce(`p`.`total_paid`,0.00) AS `total_paid`,(coalesce(`d`.`total_tuition`,0.00) - coalesce(`p`.`total_paid`,0.00)) AS `balance`,greatest((coalesce(`d`.`total_tuition`,0.00) - coalesce(`p`.`total_paid`,0.00)),0.00) AS `outstanding`,greatest((coalesce(`p`.`total_paid`,0.00) - coalesce(`d`.`total_tuition`,0.00)),0.00) AS `credit` from (((((select `e`.`student_id` AS `student_id`,`s`.`semester_id` AS `semester_id` from (`enrollments` `e` join `sections` `s` on((`s`.`id` = `e`.`section_id`))) union select `payments`.`student_id` AS `student_id`,`payments`.`semester_id` AS `semester_id` from `payments`) `k` join `students` `st` on((`st`.`id` = `k`.`student_id`))) join `semesters` `sem` on((`sem`.`id` = `k`.`semester_id`))) left join (select `e`.`student_id` AS `student_id`,`s`.`semester_id` AS `semester_id`,sum((`s`.`credits_snapshot` * `s`.`unit_price_snapshot`)) AS `total_tuition` from (`enrollments` `e` join `sections` `s` on((`s`.`id` = `e`.`section_id`))) where (`e`.`status` = 'ACTIVE') group by `e`.`student_id`,`s`.`semester_id`) `d` on(((`d`.`student_id` = `k`.`student_id`) and (`d`.`semester_id` = `k`.`semester_id`)))) left join (select `payments`.`student_id` AS `student_id`,`payments`.`semester_id` AS `semester_id`,sum(`payments`.`amount`) AS `total_paid` from `payments` group by `payments`.`student_id`,`payments`.`semester_id`) `p` on(((`p`.`student_id` = `k`.`student_id`) and (`p`.`semester_id` = `k`.`semester_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-26  9:39:01
