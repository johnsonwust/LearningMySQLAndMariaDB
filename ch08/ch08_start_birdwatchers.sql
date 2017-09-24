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
  `formal_title` enum('Mr','Ms') DEFAULT NULL,
  `name_first` varchar(25) DEFAULT NULL,
  `name_last` varchar(25) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `country_id` char(2) DEFAULT NULL,
  `membership_type` enum('basic','premium') DEFAULT NULL,
  `membership_expiration` date DEFAULT NULL,
  `better_birders_site` tinyint(4) DEFAULT '0',
  `possible_duplicate` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`human_id`),
  KEY `human_names` (`name_last`,`name_first`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humans`
--

LOCK TABLES `humans` WRITE;
/*!40000 ALTER TABLE `humans` DISABLE KEYS */;
INSERT INTO `humans` VALUES (1,'Mr','Russell','Dyer','russell@mysqlresources.com','us',NULL,NULL,0,0),(2,'Mr','Richard','Stringer','richard@mysqlresources.com','us',NULL,NULL,0,0),(3,'Ms','Rusty','Johnson','rusty@mysqlresources.com','us',NULL,NULL,0,0),(4,'Ms','Lexi','Hollar','alexandra@mysqlresources.com','us',NULL,NULL,0,1),(17,'Mr','Rusell','Dyer','russell@dyerhouse.com','us',NULL,NULL,0,0),(26,'Ms','Katerina','Smirnova','katya@mail.ru','ru',NULL,NULL,0,0),(27,'Ms','Anahit','Vanetsyan','anahit@gmail.com','ru',NULL,NULL,0,0),(28,'Ms','Marie','Dyer','marie@gmail.com','uk',NULL,NULL,0,0),(29,'Mr','Geoffrey','Dyer',NULL,'us',NULL,NULL,0,0),(30,'Ms','MICHAEL','STONE',NULL,NULL,NULL,NULL,0,0),(34,'Ms','Melissa','Lee',NULL,'us',NULL,NULL,0,0),(35,'Mr','andy','oram',NULL,NULL,NULL,NULL,0,0),(36,'Mr','Michael','Zabalaoui',NULL,'us',NULL,NULL,0,0),(40,'Mr','Jack','Bard','jack.bard@mysqlresources.com','uk',NULL,NULL,0,0),(41,'Mr','Oliver','Cromwell','ocrom@mysqlresources.com','uk',NULL,NULL,0,0),(42,'Mr','Sun','Tzu','mastersun@yahoo.com','ch',NULL,NULL,0,0),(43,'Mr','Joe','Samson','sam@mysqlresources.com','au',NULL,NULL,0,0),(44,'Ms','Elizabeth','Stewart','lizstew@yahoo.com','au',NULL,NULL,0,0),(45,'Mr','Barry','Pilson','barry@gomail.com',NULL,NULL,NULL,1,0),(46,'Ms','Lexi','Hollar','alexandra@mysqlresources.com',NULL,NULL,NULL,1,1),(47,'Mr','Ricky','Adams','ricky@gomail.com',NULL,NULL,NULL,1,0);
/*!40000 ALTER TABLE `humans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prize_winners`
--

DROP TABLE IF EXISTS `prize_winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prize_winners` (
  `winner_id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) DEFAULT NULL,
  `winner_date` date DEFAULT NULL,
  `prize_chosen` varchar(255) DEFAULT NULL,
  `prize_sent` date DEFAULT NULL,
  PRIMARY KEY (`winner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prize_winners`
--

LOCK TABLES `prize_winners` WRITE;
/*!40000 ALTER TABLE `prize_winners` DISABLE KEYS */;
/*!40000 ALTER TABLE `prize_winners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answers`
--

DROP TABLE IF EXISTS `survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `date_answered` datetime DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answers`
--

LOCK TABLES `survey_answers` WRITE;
/*!40000 ALTER TABLE `survey_answers` DISABLE KEYS */;
INSERT INTO `survey_answers` VALUES (1,29,1,'2015-05-17 20:47:35','2'),(2,29,2,'2015-05-17 20:47:35','2'),(3,35,1,'2015-05-17 20:47:35','1'),(4,35,2,'2015-05-17 20:47:35','1'),(5,26,1,'2015-05-17 20:47:35','2'),(6,26,2,'2015-05-17 20:47:35','1'),(7,27,1,'2015-05-17 20:47:35','2'),(8,27,2,'2015-05-17 20:47:35','4'),(9,16,1,'2015-05-17 20:47:35','3'),(10,3,1,'2015-05-17 20:47:35','1'),(11,3,2,'2015-05-17 20:47:35','1');
/*!40000 ALTER TABLE `survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (1,'Favorite Birding Location'),(2,'Preferred Birds');
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;