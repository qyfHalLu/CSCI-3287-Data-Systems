-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: data_design2
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_no` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `employee_no` int NOT NULL,
  PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_no` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `skill_code` int NOT NULL,
  `department_dept_no` int NOT NULL,
  PRIMARY KEY (`employee_no`,`department_dept_no`),
  KEY `fk_employee_department_idx` (`department_dept_no`),
  CONSTRAINT `fk_employee_department` FOREIGN KEY (`department_dept_no`) REFERENCES `department` (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_code` int NOT NULL AUTO_INCREMENT,
  `project_title` varchar(100) NOT NULL,
  `project_manager` varchar(100) NOT NULL,
  `project_budget` decimal(10,0) NOT NULL,
  `hourly_rate` decimal(10,0) NOT NULL,
  `employee_no` int NOT NULL,
  PRIMARY KEY (`project_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_has_employee`
--

DROP TABLE IF EXISTS `project_has_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_has_employee` (
  `project_project_code` int NOT NULL,
  `employee_employee_no` int NOT NULL,
  `employee_department_dept_no` int NOT NULL,
  PRIMARY KEY (`project_project_code`,`employee_employee_no`,`employee_department_dept_no`),
  KEY `fk_project_has_employee_employee1_idx` (`employee_employee_no`,`employee_department_dept_no`),
  KEY `fk_project_has_employee_project1_idx` (`project_project_code`),
  CONSTRAINT `fk_project_has_employee_employee1` FOREIGN KEY (`employee_employee_no`, `employee_department_dept_no`) REFERENCES `employee` (`employee_no`, `department_dept_no`),
  CONSTRAINT `fk_project_has_employee_project1` FOREIGN KEY (`project_project_code`) REFERENCES `project` (`project_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_has_employee`
--

LOCK TABLES `project_has_employee` WRITE;
/*!40000 ALTER TABLE `project_has_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_has_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_code` int NOT NULL AUTO_INCREMENT,
  `skill_type` int NOT NULL,
  PRIMARY KEY (`skill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_has_employee`
--

DROP TABLE IF EXISTS `skill_has_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_has_employee` (
  `skill_skill_code` int NOT NULL,
  `employee_employee_no` int NOT NULL,
  `employee_department_dept_no` int NOT NULL,
  PRIMARY KEY (`skill_skill_code`,`employee_employee_no`,`employee_department_dept_no`),
  KEY `fk_skill_has_employee_employee1_idx` (`employee_employee_no`,`employee_department_dept_no`),
  KEY `fk_skill_has_employee_skill1_idx` (`skill_skill_code`),
  CONSTRAINT `fk_skill_has_employee_employee1` FOREIGN KEY (`employee_employee_no`, `employee_department_dept_no`) REFERENCES `employee` (`employee_no`, `department_dept_no`),
  CONSTRAINT `fk_skill_has_employee_skill1` FOREIGN KEY (`skill_skill_code`) REFERENCES `skill` (`skill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_has_employee`
--

LOCK TABLES `skill_has_employee` WRITE;
/*!40000 ALTER TABLE `skill_has_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_has_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-20  1:18:19
