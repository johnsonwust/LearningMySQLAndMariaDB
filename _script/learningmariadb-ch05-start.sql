-- MySQL dump 10.15  Distrib 10.0.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.0.18-MariaDB-log

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
-- Current Database: `test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` int(11) DEFAULT NULL,
  `title` text,
  `status` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (100,'The Heart of Darkness','0'),(101,'The Catcher in the Rye','1'),(102,'My Antonia','1');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `name` char(50) DEFAULT NULL,
  `phone_work` char(20) DEFAULT NULL,
  `phone_mobile` char(20) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES ('Quinten Compson','+1-000-000-0000','+1-000-000-0000','qcompson@email.com',0),('Dr. Tom More, M.D.','+1-000-000-0000','+1-000-000-0000','sainttom@email.com',2),('Ignatius Reilly','+1-000-000-0000','+1-000-000-0000','boethius@email.com',0),('Huckleberry Finn','+1-000-000-0000','+1-000-000-0000','huckfinn@email.com',1),('Philip Marlowe','+1-000-000-0000','+1-000-000-0000','pmarlowe@email.com',2);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_types`
--

DROP TABLE IF EXISTS `relation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_types` (
  `relation_id` int(11) DEFAULT NULL,
  `relationship` char(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_types`
--

LOCK TABLES `relation_types` WRITE;
/*!40000 ALTER TABLE `relation_types` DISABLE KEYS */;
INSERT INTO `relation_types` VALUES (0,'Family'),(1,'Friend'),(2,'Colleague');
/*!40000 ALTER TABLE `relation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_names`
--

DROP TABLE IF EXISTS `status_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_names` (
  `status_id` int(11) DEFAULT NULL,
  `status_name` char(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_names`
--

LOCK TABLES `status_names` WRITE;
/*!40000 ALTER TABLE `status_names` DISABLE KEYS */;
INSERT INTO `status_names` VALUES (0,'Inactive'),(1,'Active');
/*!40000 ALTER TABLE `status_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `rookery`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rookery` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_bin */;

USE `rookery`;

--
-- Table structure for table `bird_families`
--

DROP TABLE IF EXISTS `bird_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bird_families` (
  `family_id` int(11) NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `brief_description` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`family_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird_families`
--

LOCK TABLES `bird_families` WRITE;
/*!40000 ALTER TABLE `bird_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `bird_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds`
--

DROP TABLE IF EXISTS `birds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds` (
  `bird_id` int(11) NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `common_name` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL,
  `description` text COLLATE latin1_bin,
  PRIMARY KEY (`bird_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds`
--

LOCK TABLES `birds` WRITE;
/*!40000 ALTER TABLE `birds` DISABLE KEYS */;
INSERT INTO `birds` VALUES (1,'Charadrius vociferus','Killdeer',NULL,NULL),(2,'Gavia immer','Great Northern Loon',NULL,NULL),(3,'Aix sponsa','Wood Duck',NULL,NULL),(4,'Chordeiles minor','Common Nighthawk',NULL,NULL),(5,'Sitta carolinensis',' White-breasted Nuthatch',NULL,NULL),(6,'Apteryx mantelli','North Island Brown Kiwi',NULL,NULL);
/*!40000 ALTER TABLE `birds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_bill_shapes`
--

DROP TABLE IF EXISTS `birds_bill_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_bill_shapes` (
  `bill_id` char(2) DEFAULT NULL,
  `bill_shape` char(25) DEFAULT NULL,
  `bill_example` blob,
  UNIQUE KEY `bill_id` (`bill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds_bill_shapes`
--

LOCK TABLES `birds_bill_shapes` WRITE;
/*!40000 ALTER TABLE `birds_bill_shapes` DISABLE KEYS */;
/*!40000 ALTER TABLE `birds_bill_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_body_shapes`
--

DROP TABLE IF EXISTS `birds_body_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_body_shapes` (
  `body_id` char(3) DEFAULT NULL,
  `body_shape` char(25) DEFAULT NULL,
  `body_example` blob,
  UNIQUE KEY `body_id` (`body_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds_body_shapes`
--

LOCK TABLES `birds_body_shapes` WRITE;
/*!40000 ALTER TABLE `birds_body_shapes` DISABLE KEYS */;
/*!40000 ALTER TABLE `birds_body_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_wing_shapes`
--

DROP TABLE IF EXISTS `birds_wing_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_wing_shapes` (
  `wing_id` char(2) DEFAULT NULL,
  `wing_shape` char(25) DEFAULT NULL,
  `wing_example` blob,
  UNIQUE KEY `wing_id` (`wing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds_wing_shapes`
--

LOCK TABLES `birds_wing_shapes` WRITE;
/*!40000 ALTER TABLE `birds_wing_shapes` DISABLE KEYS */;
/*!40000 ALTER TABLE `birds_wing_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `birdwatchers`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `birdwatchers` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `birdwatchers`;

--
-- Table structure for table `humans`
--

DROP TABLE IF EXISTS `humans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `humans` (
  `human_id` int(11) NOT NULL AUTO_INCREMENT,
  `formal_title` varchar(25) DEFAULT NULL,
  `name_first` varchar(25) DEFAULT NULL,
  `name_last` varchar(25) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`human_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humans`
--

LOCK TABLES `humans` WRITE;
/*!40000 ALTER TABLE `humans` DISABLE KEYS */;
INSERT INTO `humans` VALUES (1,'Mr.','Russell','Dyer','russell@mysqlresources.com'),(2,'Mr.','Richard','Stringer','richard@mysqlresources.com'),(3,'Ms.','Rusty','Osborne','rusty@mysqlresources.com'),(4,'Ms.','Lexi','Hollar','alexandra@mysqlresources.com');
/*!40000 ALTER TABLE `humans` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-11  1:59:12
