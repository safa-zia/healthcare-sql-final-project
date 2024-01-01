-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: HEALTHCARE
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Doctors`
--

DROP TABLE IF EXISTS `Doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctors` (
  `doctor_id` int NOT NULL,
  `doctor_first_name` varchar(20) NOT NULL,
  `doctor_last_name` varchar(20) NOT NULL,
  `assigned_patient_id` int NOT NULL,
  KEY `assigned_patient_id` (`assigned_patient_id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`assigned_patient_id`) REFERENCES `Patient_records` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctors`
--

LOCK TABLES `Doctors` WRITE;
/*!40000 ALTER TABLE `Doctors` DISABLE KEYS */;
INSERT INTO `Doctors` VALUES (1,'John','Noble',3),(1,'John','Noble',5),(2,'William','Sparks',2),(2,'William','Sparks',4),(3,'Serena','Nichols',1);
/*!40000 ALTER TABLE `Doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_contact_details`
--

DROP TABLE IF EXISTS `Patient_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient_contact_details` (
  `patient_id` int NOT NULL,
  `building_number` varchar(30) NOT NULL,
  `street_name` varchar(55) DEFAULT NULL,
  `post_code` varchar(55) DEFAULT NULL,
  `phone_number` varchar(55) NOT NULL,
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_contact_details_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `Patient_records` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_contact_details`
--

LOCK TABLES `Patient_contact_details` WRITE;
/*!40000 ALTER TABLE `Patient_contact_details` DISABLE KEYS */;
INSERT INTO `Patient_contact_details` VALUES (1,'4','Windsor Road','BC35 8PX','0117 853202'),(2,'72','Green Lane','BC21 6VC','0117 960170'),(3,'83','Albert Street','BC32 0FD','0117 960390'),(4,'36','Queensway','BC21 6VC','0117 346587'),(5,'54','Church Close','BC21 5SE','0117 865938');
/*!40000 ALTER TABLE `Patient_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_info`
--

DROP TABLE IF EXISTS `Patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient_info` (
  `patient_id` int NOT NULL,
  `patient_age` int NOT NULL,
  `patient_gender` varchar(20) DEFAULT NULL,
  `patient_blood_type` varchar(20) NOT NULL,
  `patient_concern` varchar(55) NOT NULL,
  PRIMARY KEY (`patient_concern`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `patient_info_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `Patient_records` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_info`
--

LOCK TABLES `Patient_info` WRITE;
/*!40000 ALTER TABLE `Patient_info` DISABLE KEYS */;
INSERT INTO `Patient_info` VALUES (1,14,'Male','O-','Asthma'),(3,37,'Female','AB+','Diabetes'),(2,82,'Male','B-','Hypertension'),(5,63,'Female','O-','Sinus Infection'),(4,22,'Female','A+','Stomach Virus');
/*!40000 ALTER TABLE `Patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_records`
--

DROP TABLE IF EXISTS `Patient_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient_records` (
  `patient_id` int NOT NULL,
  `patient_first_name` varchar(55) NOT NULL,
  `patient_last_name` varchar(55) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_records`
--

LOCK TABLES `Patient_records` WRITE;
/*!40000 ALTER TABLE `Patient_records` DISABLE KEYS */;
INSERT INTO `Patient_records` VALUES (1,'Alex','Johnson'),(2,'James','Wheeler'),(3,'Sarah','Andrews'),(4,'Sophia','Lane'),(5,'Amelia','Davies');
/*!40000 ALTER TABLE `Patient_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_treatment`
--

DROP TABLE IF EXISTS `Patient_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient_treatment` (
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `inital_admission` date DEFAULT NULL,
  `patient_concern` varchar(55) NOT NULL,
  `medication_prescribed` varchar(55) NOT NULL,
  KEY `patient_concern` (`patient_concern`),
  CONSTRAINT `patient_treatment_ibfk_1` FOREIGN KEY (`patient_concern`) REFERENCES `Patient_info` (`patient_concern`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_treatment`
--

LOCK TABLES `Patient_treatment` WRITE;
/*!40000 ALTER TABLE `Patient_treatment` DISABLE KEYS */;
INSERT INTO `Patient_treatment` VALUES (1,3,'2023-03-11','Asthma','Corticosteroids'),(2,2,'2022-01-06','Hypertension','Lifestyle changes'),(3,1,'2023-08-12','Diabetes','Insulin'),(4,2,'2021-05-03','Stomach Virus','Loperamide'),(5,1,'2022-07-22','Sinus Infection','Paracetamol');
/*!40000 ALTER TABLE `Patient_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_vw_all`
--

DROP TABLE IF EXISTS `patient_vw_all`;
/*!50001 DROP VIEW IF EXISTS `patient_vw_all`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_vw_all` AS SELECT 
 1 AS `patient_first_name`,
 1 AS `patient_last_name`,
 1 AS `patient_age`,
 1 AS `patient_blood_type`,
 1 AS `patient_concern`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `patient_vw_all`
--

/*!50001 DROP VIEW IF EXISTS `patient_vw_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_vw_all` AS select `patient_records`.`patient_first_name` AS `patient_first_name`,`patient_records`.`patient_last_name` AS `patient_last_name`,`patient_info`.`patient_age` AS `patient_age`,`patient_info`.`patient_blood_type` AS `patient_blood_type`,`patient_info`.`patient_concern` AS `patient_concern` from (`patient_records` join `patient_info` on((`patient_records`.`patient_id` = `patient_info`.`patient_id`))) */;
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

-- Dump completed on 2023-12-11 18:10:34
