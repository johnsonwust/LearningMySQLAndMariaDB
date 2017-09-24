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
-- Table structure for table `bird_orders`
--

DROP TABLE IF EXISTS `bird_orders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bird_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) DEFAULT NULL,
  `brief_description` varchar(255) DEFAULT NULL,
  `order_image` blob,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bird_orders`
--

LOCK TABLES `bird_orders` WRITE;
/*!40000 ALTER TABLE `bird_orders` DISABLE KEYS */;
INSERT INTO `bird_orders` VALUES (100,'Anseriformes','Waterfowl',NULL),(101,'Galliformes','Fowl',NULL),(102,'Charadriiformes','Gulls, Button Quails, Plovers',NULL),(103,'Gaviiformes','Loons',NULL),(104,'Podicipediformes','Grebes',NULL),(105,'Procellariiformes','Albatrosses, Petrels',NULL),(106,'Sphenisciformes','Penguins',NULL),(107,'Pelecaniformes','Pelicans',NULL),(108,'Phaethontiformes','Tropicbirds',NULL),(109,'Ciconiiformes','Storks',NULL),(110,'Cathartiformes','New-World Vultures',NULL),(111,'Phoenicopteriformes','Flamingos',NULL),(112,'Falconiformes','Falcons, Eagles, Hawks',NULL),(113,'Gruiformes','Cranes',NULL),(114,'Pteroclidiformes','Sandgrouse',NULL),(115,'Columbiformes','Doves and Pigeons',NULL),(116,'Psittaciformes','Parrots',NULL),(117,'Cuculiformes','Cuckoos and Turacos',NULL),(118,'Opisthocomiformes','Hoatzin',NULL),(119,'Strigiformes','Owls',NULL),(120,'Struthioniformes','Ostriches, Emus, Kiwis',NULL),(121,'Tinamiformes','Tinamous',NULL),(122,'Caprimulgiformes','Nightjars',NULL),(123,'Apodiformes','Swifts and Hummingbirds',NULL),(124,'Coraciiformes','Kingfishers',NULL),(125,'Piciformes','Woodpeckers',NULL),(126,'Trogoniformes','Trogons',NULL),(127,'Coliiformes','Mousebirds',NULL),(128,'Passeriformes','Passerines',NULL);
/*!40000 ALTER TABLE `bird_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-07 15:54:28
