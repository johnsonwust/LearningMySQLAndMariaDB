--
-- Current Database: `birdwatchers`
--

--CREATE DATABASE /*!32312 IF NOT EXISTS*/ `birdwatchers` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `birdwatchers`;

--
-- Table structure for table `bird_sightings`
--

DROP TABLE IF EXISTS `bird_sightings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bird_sightings` (
  `sighting_id` int(11) NOT NULL AUTO_INCREMENT,
  `bird_id` int(11) DEFAULT NULL,
  `human_id` int(11) DEFAULT NULL,
  `time_seen` datetime DEFAULT NULL,
  `location_gps` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `comments` text CHARACTER SET utf8,
  PRIMARY KEY (`sighting_id`),
  FULLTEXT KEY `comment_index` (`comments`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird_sightings`
--

LOCK TABLES `bird_sightings` WRITE;
/*!40000 ALTER TABLE `bird_sightings` DISABLE KEYS */;
INSERT INTO `bird_sightings` VALUES (1,1360,2,'2013-10-01 04:57:12','30.29138551; -90.3093338','This is in the Manchac Wildlife Management Area at the end of Pass Manchac at Lake Pontchartrain.'),(2,1359,19,'2013-10-01 05:09:27','66.16051056; -162.7734375','It was a major effort getting here, but what a beautiful bird that so few people have seen in their life.'),(3,1369,3,'2013-10-01 05:13:25','29.68417534; -85.13957977',''),(4,1368,27,'2013-10-01 05:40:00','42.81958072; 133.02246094','I saw a female near Zaliv Nakhodka.'),(5,1364,26,'2013-10-01 07:06:46','42.69096856; 130.78185081','Such a beautiful bird. I saw it on the northern shore of Ekspeditsii bay, near Krasino, Russia.'),(6,1364,19,'2013-10-01 07:45:45','51.70469364; 58.63746643','Spotted in a mountain lake northwest of Kuvandyk, Russia.'),(7,1364,26,'2013-10-01 07:45:45','42.69096856; 130.78185081','Это такая довольно птицы.'),(8,1364,26,'2013-10-01 07:45:45','42.69096856; 130.78185081',NULL),(9,307,28,'2013-10-02 07:39:44',NULL,NULL),(10,251,28,'2013-10-02 07:39:44',NULL,NULL),(11,309,28,'2013-10-02 07:39:44',NULL,NULL),(12,337,28,'2013-10-02 07:39:44',NULL,NULL),(13,345,28,'2013-10-02 07:39:44',NULL,NULL),(14,307,19,'2013-10-02 08:41:26',NULL,NULL),(15,2298,44,'2013-10-15 07:07:55','31.17128442; -90.2982112',NULL),(16,2298,44,'2013-10-15 07:12:01','31.17128442; -90.2982112','\0\0\0x');
/*!40000 ALTER TABLE `bird_sightings` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humans`
--

LOCK TABLES `humans` WRITE;
/*!40000 ALTER TABLE `humans` DISABLE KEYS */;
INSERT INTO `humans` VALUES (1,'Mr','Russell','Dyer','russell@mysqlresources.com','us',NULL,NULL,0,0),(2,'Mr','Richard','Stringer','richard@mysqlresources.com','us',NULL,NULL,0,0),(3,'Ms','Rusty','Johnson','rusty@mysqlresources.com','us',NULL,NULL,0,0),(4,'Ms','Lexi','Hollar','alexandra@mysqlresources.com','us',NULL,NULL,0,1),(17,'Mr','Rusell','Dyer','russell@dyerhouse.com','us',NULL,NULL,0,0),(26,'Ms','Katerina','Smirnova','katya@mail.ru','ru',NULL,NULL,0,0),(27,'Ms','Anahit','Vanetsyan','anahit@gmail.com','ru',NULL,NULL,0,0),(28,'Ms','Marie','Dyer','marie@gmail.com','uk',NULL,NULL,0,0),(29,'Mr','Geoffrey','Dyer',NULL,'us',NULL,NULL,0,0),(30,'Ms','MICHAEL','STONE',NULL,NULL,NULL,NULL,0,0),(34,'Ms','Melissa','Lee',NULL,'us',NULL,NULL,0,0),(35,'Mr','andy','oram',NULL,NULL,NULL,NULL,0,0),(36,'Mr','Michael','Zabalaoui',NULL,'us',NULL,NULL,0,0),(40,'Mr','Jack','Bard','jack.bard@mysqlresources.com','uk',NULL,NULL,0,0),(41,'Mr','Oliver','Cromwell','ocrom@mysqlresources.com','uk',NULL,NULL,0,0),(42,'Mr','Sun','Tzu','mastersun@yahoo.com','ch',NULL,NULL,0,0),(43,'Mr','Joe','Samson','sam@mysqlresources.com','au',NULL,NULL,0,0),(44,'Ms','Elizabeth','Stewart','lizstew@yahoo.com','au',NULL,NULL,0,0),(45,'Mr','Barry','Pilson','barry@gomail.com',NULL,NULL,NULL,1,1),(46,'Ms','Lexi','Hollar','alexandra@mysqlresources.com',NULL,NULL,NULL,1,1),(47,'Mr','Ricky','Adams','ricky@gomail.com',NULL,NULL,NULL,1,1),(48,'Mr','Barry','Pilson','barry@gomail.com',NULL,NULL,NULL,1,1),(49,'Ms','Lexi','Hollar','alexandra@mysqlresources.com',NULL,NULL,NULL,1,1),(50,'Mr','Ricky','Adams','ricky@gomail.com',NULL,NULL,NULL,1,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prize_winners`
--

LOCK TABLES `prize_winners` WRITE;
/*!40000 ALTER TABLE `prize_winners` DISABLE KEYS */;
INSERT INTO `prize_winners` VALUES (24,1,NULL,NULL,NULL),(25,2,NULL,NULL,NULL),(26,3,NULL,NULL,NULL),(27,4,NULL,NULL,NULL),(28,17,NULL,NULL,NULL),(29,26,NULL,NULL,NULL),(30,27,NULL,NULL,NULL),(31,28,'2015-10-29',NULL,NULL),(32,29,NULL,NULL,NULL),(33,30,NULL,NULL,NULL),(34,34,NULL,NULL,NULL),(35,35,NULL,NULL,NULL),(36,36,'2015-10-29',NULL,NULL),(37,40,'2015-10-29',NULL,NULL),(38,41,NULL,NULL,NULL),(39,42,NULL,NULL,NULL),(40,43,NULL,NULL,NULL),(41,44,NULL,NULL,NULL),(42,45,NULL,NULL,NULL),(43,46,'2015-10-29',NULL,NULL),(44,47,NULL,NULL,NULL),(45,45,NULL,NULL,NULL),(46,46,NULL,NULL,NULL),(47,47,NULL,NULL,NULL),(48,48,NULL,NULL,NULL),(49,49,NULL,NULL,NULL),(50,50,NULL,NULL,NULL);
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
