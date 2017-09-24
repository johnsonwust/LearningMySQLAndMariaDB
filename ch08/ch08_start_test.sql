--
-- Current Database: `test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET latin1 */;

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
