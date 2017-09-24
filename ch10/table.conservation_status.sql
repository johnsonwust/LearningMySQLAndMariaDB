-- MySQL dump 10.13  Distrib 5.1.32, for pc-linux-gnu (i686)
--
-- Host: localhost    Database: birdwatchers
-- ------------------------------------------------------
-- Server version	5.1.32-community-log

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
-- Table structure for table `conservation_status`
--

DROP TABLE IF EXISTS `conservation_status`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `conservation_status` (
  `conservation_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `conservation_category` char(10) COLLATE latin1_bin DEFAULT NULL,
  `conservation_state` char(25) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`conservation_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `conservation_status`
--

LOCK TABLES `conservation_status` WRITE;
/*!40000 ALTER TABLE `conservation_status` DISABLE KEYS */;
INSERT INTO `conservation_status` VALUES (1,'Extinct','Extinct'),(2,'Extinct','Extinct in Wild'),(3,'Threatened','Critically Endangered'),(4,'Threatened','Endangered'),(5,'Threatened','Vulnerable'),(6,'Lower Risk','Conservation Dependent'),(7,'Lower Risk','Near Threatened'),(8,'Lower Risk','Least Concern');
/*!40000 ALTER TABLE `conservation_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-08 11:13:41
