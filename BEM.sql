-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `booking_info_table`
--

DROP TABLE IF EXISTS `booking_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_info_table` (
  `booking_number` int NOT NULL AUTO_INCREMENT,
  `booking_amount` double DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_package_id` int DEFAULT NULL,
  `booking_status` bit(1) DEFAULT NULL,
  `booking_venue_id` int DEFAULT NULL,
  `booking_user_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_number`),
  KEY `FK7ui2de7tcs0vr4dptrsfbnbr0` (`booking_user_id`),
  CONSTRAINT `FK7ui2de7tcs0vr4dptrsfbnbr0` FOREIGN KEY (`booking_user_id`) REFERENCES `user_info_table` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_info_table`
--

LOCK TABLES `booking_info_table` WRITE;
/*!40000 ALTER TABLE `booking_info_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_info_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_info_table`
--

DROP TABLE IF EXISTS `package_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_info_table` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `package_cost` int NOT NULL,
  `package_name` varchar(255) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_info_table`
--

LOCK TABLES `package_info_table` WRITE;
/*!40000 ALTER TABLE `package_info_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_info_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_info_table`
--

DROP TABLE IF EXISTS `service_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_info_table` (
  `service_id` int NOT NULL,
  `service_cost` int DEFAULT NULL,
  `service_details` varchar(255) DEFAULT NULL,
  `service_images` longblob,
  `service_type` varchar(255) DEFAULT NULL,
  `service_package_id` int DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `FKlt68eu6cpspn7yljx6p00exh6` (`service_package_id`),
  CONSTRAINT `FKlt68eu6cpspn7yljx6p00exh6` FOREIGN KEY (`service_package_id`) REFERENCES `package_info_table` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_info_table`
--

LOCK TABLES `service_info_table` WRITE;
/*!40000 ALTER TABLE `service_info_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_info_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_table`
--

DROP TABLE IF EXISTS `user_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info_table` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_contact_no` bigint NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_first_name` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL,
  `user_login_id` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKbynh2y2e97qoyn1ue9gxsc1uy` (`booking_id`),
  CONSTRAINT `FKbynh2y2e97qoyn1ue9gxsc1uy` FOREIGN KEY (`booking_id`) REFERENCES `booking_info_table` (`booking_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_table`
--

LOCK TABLES `user_info_table` WRITE;
/*!40000 ALTER TABLE `user_info_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_info_table`
--

DROP TABLE IF EXISTS `vendor_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_info_table` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_contact_no` bigint NOT NULL,
  `vendor_email` varchar(255) NOT NULL,
  `vendor_login_id` varchar(255) NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `vendor_password` varchar(255) DEFAULT NULL,
  `vendor_rating` int DEFAULT NULL,
  `vendor_approved` bit(1) DEFAULT NULL,
  `vendor_package_id` int DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `FKht5crruo22ifgxyv9w8fw74oi` (`vendor_package_id`),
  CONSTRAINT `FKht5crruo22ifgxyv9w8fw74oi` FOREIGN KEY (`vendor_package_id`) REFERENCES `package_info_table` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_info_table`
--

LOCK TABLES `vendor_info_table` WRITE;
/*!40000 ALTER TABLE `vendor_info_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_info_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_info_table_booking_id`
--

DROP TABLE IF EXISTS `vendor_info_table_booking_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_info_table_booking_id` (
  `vendor_entity_vendor_id` int NOT NULL,
  `booking_id_booking_number` int NOT NULL,
  KEY `FKmusm6y4a9gs3ho50vm9qvhyrs` (`booking_id_booking_number`),
  KEY `FKgyy94wria3xrka1fpr88g3bku` (`vendor_entity_vendor_id`),
  CONSTRAINT `FKgyy94wria3xrka1fpr88g3bku` FOREIGN KEY (`vendor_entity_vendor_id`) REFERENCES `vendor_info_table` (`vendor_id`),
  CONSTRAINT `FKmusm6y4a9gs3ho50vm9qvhyrs` FOREIGN KEY (`booking_id_booking_number`) REFERENCES `booking_info_table` (`booking_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_info_table_booking_id`
--

LOCK TABLES `vendor_info_table_booking_id` WRITE;
/*!40000 ALTER TABLE `vendor_info_table_booking_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_info_table_booking_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_info_table_services`
--

DROP TABLE IF EXISTS `vendor_info_table_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_info_table_services` (
  `vendor_entity_vendor_id` int NOT NULL,
  `services_service_id` int NOT NULL,
  KEY `FKmqnd5umq0lo18ft7gg8fvclxk` (`services_service_id`),
  KEY `FKj4g41flp4enerjoxovbjbggxv` (`vendor_entity_vendor_id`),
  CONSTRAINT `FKj4g41flp4enerjoxovbjbggxv` FOREIGN KEY (`vendor_entity_vendor_id`) REFERENCES `vendor_info_table` (`vendor_id`),
  CONSTRAINT `FKmqnd5umq0lo18ft7gg8fvclxk` FOREIGN KEY (`services_service_id`) REFERENCES `service_info_table` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_info_table_services`
--

LOCK TABLES `vendor_info_table_services` WRITE;
/*!40000 ALTER TABLE `vendor_info_table_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_info_table_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_info_table_venues`
--

DROP TABLE IF EXISTS `vendor_info_table_venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_info_table_venues` (
  `vendor_entity_vendor_id` int NOT NULL,
  `venues_venue_id` int NOT NULL,
  KEY `FKs58xrvx25v4du32x666e4kb7r` (`venues_venue_id`),
  KEY `FKowd4iv8oyh8nldol5hxt1iror` (`vendor_entity_vendor_id`),
  CONSTRAINT `FKowd4iv8oyh8nldol5hxt1iror` FOREIGN KEY (`vendor_entity_vendor_id`) REFERENCES `vendor_info_table` (`vendor_id`),
  CONSTRAINT `FKs58xrvx25v4du32x666e4kb7r` FOREIGN KEY (`venues_venue_id`) REFERENCES `venue_info_table` (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_info_table_venues`
--

LOCK TABLES `vendor_info_table_venues` WRITE;
/*!40000 ALTER TABLE `vendor_info_table_venues` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_info_table_venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_info_table`
--

DROP TABLE IF EXISTS `venue_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue_info_table` (
  `venue_id` int NOT NULL AUTO_INCREMENT,
  `venue_contact` bigint DEFAULT NULL,
  `venue_cost` int DEFAULT NULL,
  `venue_location` varchar(255) DEFAULT NULL,
  `venue_name` varchar(255) NOT NULL,
  `venue_rating` int DEFAULT NULL,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_info_table`
--

LOCK TABLES `venue_info_table` WRITE;
/*!40000 ALTER TABLE `venue_info_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue_info_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue_info_table_vendors`
--

DROP TABLE IF EXISTS `venue_info_table_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue_info_table_vendors` (
  `venue_entity_venue_id` int NOT NULL,
  `vendors_vendor_id` int NOT NULL,
  KEY `FKcebkc601yha31o3h7uw71f422` (`vendors_vendor_id`),
  KEY `FKncohv835jxcf9dyxstqgcamfm` (`venue_entity_venue_id`),
  CONSTRAINT `FKcebkc601yha31o3h7uw71f422` FOREIGN KEY (`vendors_vendor_id`) REFERENCES `vendor_info_table` (`vendor_id`),
  CONSTRAINT `FKncohv835jxcf9dyxstqgcamfm` FOREIGN KEY (`venue_entity_venue_id`) REFERENCES `venue_info_table` (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue_info_table_vendors`
--

LOCK TABLES `venue_info_table_vendors` WRITE;
/*!40000 ALTER TABLE `venue_info_table_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue_info_table_vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-21 11:23:50
