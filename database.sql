-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `landmark` varchar(50) NOT NULL,
  `Pincode` int(7) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (2,'123 Main Street','Bangalore','Karnataka','Near City Mall',560001),(3,'45 Park Avenue','Mumbai','Maharashtra','Opp. Metro Station',400001),(4,'7th Cross Road','Chennai','Tamil Nadu','Near Tech Park',600001);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `contact` int(14) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `admin_id` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `chk_password_length` CHECK (char_length(`password`) >= 6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `Name` varchar(50) NOT NULL,
  `doctor_id` varchar(8) NOT NULL,
  `Experience` varchar(50) DEFAULT NULL,
  `Specialisation` varchar(50) DEFAULT NULL,
  `Email` varchar(20) NOT NULL,
  `Contact` varchar(8) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `chk_password_length` CHECK (char_length(`password`) >= 6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_staff`
--

DROP TABLE IF EXISTS `hospital_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital_staff` (
  `name` varchar(50) NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `staff_id` varchar(8) NOT NULL,
  `Hospital_Name` varchar(50) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `Contact` varchar(14) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `fk_address` (`address_id`),
  CONSTRAINT `fk_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_password_length` CHECK (char_length(`password`) >= 6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_staff`
--

LOCK TABLES `hospital_staff` WRITE;
/*!40000 ALTER TABLE `hospital_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_address`
--

DROP TABLE IF EXISTS `lab_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `landmark` varchar(50) NOT NULL,
  `Pincode` int(11) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_address`
--

LOCK TABLES `lab_address` WRITE;
/*!40000 ALTER TABLE `lab_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory` (
  `Name` varchar(50) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Contact` varchar(14) NOT NULL,
  `Registration_Id` varchar(8) NOT NULL,
  `password` varchar(20) NOT NULL,
  `lab_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`Registration_Id`),
  KEY `fk_lab_address` (`lab_address`),
  CONSTRAINT `fk_lab_address` FOREIGN KEY (`lab_address`) REFERENCES `address` (`address_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_password_length` CHECK (char_length(`password`) >= 6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `Name` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Patient_Id` varchar(8) NOT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Contact_No` varchar(14) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`Patient_Id`),
  CONSTRAINT `chk_password_length` CHECK (char_length(`password`) >= 6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('Alice',15,'Female','P001','alice@example.com','+919876543210','passAlice'),('Bob',22,'Male','P002','bob@example.com','+919876543211','passBob'),('Charlie',17,'Male','P003','charlie@example.com','+919876543212','passCharlie'),('David',30,'Male','P004','david@example.com','+919876543213','passDavid'),('Eva',10,'Female','P005','eva@example.com','+919876543214','passEva');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-19 10:28:16
