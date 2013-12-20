-- MySQL dump 10.13  Distrib 5.5.25, for osx10.6 (i386)
--
-- Host: localhost    Database: punch_dev
-- ------------------------------------------------------
-- Server version	5.5.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clock_records`
--

DROP TABLE IF EXISTS `clock_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clock_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `clocked_in` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clock_records`
--

LOCK TABLES `clock_records` WRITE;
/*!40000 ALTER TABLE `clock_records` DISABLE KEYS */;
INSERT INTO `clock_records` VALUES (1,1,1,'2013-12-19 04:29:04','2013-12-19 04:29:04'),(2,1,0,'2013-12-19 04:29:38','2013-12-19 04:29:38'),(3,2,1,'2013-12-19 04:29:44','2013-12-19 04:29:44'),(4,1,1,'2013-12-19 04:51:15','2013-12-19 04:51:15'),(5,1,0,'2013-12-19 04:51:27','2013-12-19 04:51:27'),(6,2,0,'2013-12-19 04:53:36','2013-12-19 04:53:36'),(7,1,1,'2013-12-19 04:53:42','2013-12-19 04:53:42'),(8,1,0,'2013-12-19 04:54:22','2013-12-19 04:54:22'),(9,1,1,'2013-12-19 04:54:57','2013-12-19 04:54:57'),(10,1,0,'2013-12-19 04:55:32','2013-12-19 04:55:32'),(11,1,1,'2013-12-19 04:58:20','2013-12-19 04:58:20'),(12,1,0,'2013-12-19 04:59:09','2013-12-19 04:59:09'),(13,1,1,'2013-12-19 04:59:53','2013-12-19 04:59:53'),(14,1,0,'2013-12-19 15:43:57','2013-12-19 15:43:57'),(15,1,1,'2013-12-19 15:44:26','2013-12-19 15:44:26'),(16,4,1,'2013-12-19 19:33:25','2013-12-19 19:33:25'),(17,4,0,'2013-12-19 19:33:39','2013-12-19 19:33:39'),(18,5,1,'2013-12-19 19:42:44','2013-12-19 19:42:44'),(19,5,0,'2013-12-19 19:47:06','2013-12-19 19:47:06'),(20,5,1,'2013-12-19 19:54:15','2013-12-19 19:54:15'),(21,1,0,'2013-12-19 20:14:24','2013-12-19 20:14:24'),(22,1,1,'2013-12-19 20:16:14','2013-12-19 20:16:14'),(23,5,0,'2013-12-19 20:23:55','2013-12-19 20:23:55'),(24,5,1,'2013-12-19 20:32:02','2013-12-19 20:32:02'),(25,1,0,'2013-12-19 20:32:08','2013-12-19 20:32:08'),(26,1,1,'2013-12-19 20:33:28','2013-12-19 20:33:28'),(27,1,0,'2013-12-19 20:35:28','2013-12-19 20:35:28'),(28,1,1,'2013-12-19 20:35:32','2013-12-19 20:35:32'),(29,1,0,'2013-12-19 20:36:30','2013-12-19 20:36:30'),(30,1,1,'2013-12-19 20:41:00','2013-12-19 20:41:00'),(31,1,0,'2013-12-19 20:41:51','2013-12-19 20:41:51'),(32,1,1,'2013-12-19 20:42:47','2013-12-19 20:42:47'),(33,1,0,'2013-12-19 20:54:06','2013-12-19 20:54:06'),(34,1,1,'2013-12-19 20:54:37','2013-12-19 20:54:37'),(35,1,0,'2013-12-19 20:55:54','2013-12-19 20:55:54'),(36,1,1,'2013-12-19 20:56:04','2013-12-19 20:56:04'),(37,1,0,'2013-12-19 20:56:48','2013-12-19 20:56:48'),(38,1,1,'2013-12-19 20:56:57','2013-12-19 20:56:57'),(39,1,0,'2013-12-19 20:57:07','2013-12-19 20:57:07'),(40,1,1,'2013-12-20 02:11:56','2013-12-20 02:11:56'),(41,1,0,'2013-12-20 05:18:40','2013-12-20 05:18:40'),(42,1,1,'2013-12-20 05:20:19','2013-12-20 05:20:19'),(43,5,0,'2013-12-20 05:39:17','2013-12-20 05:39:17');
/*!40000 ALTER TABLE `clock_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_card_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_employees_on_employee_card_id` (`employee_card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'123a456b','Default','Admin',1,'2013-12-19 04:28:43','2013-12-19 04:28:43'),(2,'128a456b','Default','User',0,'2013-12-19 04:28:43','2013-12-19 04:28:43'),(4,'123b456c','Melissa','Russel',NULL,'2013-12-19 19:33:09','2013-12-19 19:33:09'),(5,'789d012c','Walter','Lee',1,'2013-12-19 19:34:17','2013-12-19 19:34:17'),(6,'567a890n','Laura','Willson',NULL,'2013-12-20 05:18:30','2013-12-20 05:18:30'),(8,'138g455b','Dennis','Murphy',NULL,'2013-12-20 06:00:05','2013-12-20 06:00:05');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20131219014005'),('20131219014031');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-20  1:00:37
