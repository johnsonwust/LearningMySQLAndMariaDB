-- MySQL dump 10.16  Distrib 10.1.23-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: rookery
-- ------------------------------------------------------
-- Server version	10.1.23-MariaDB

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

USE rookery;
--
-- Table structure for table `bird_families`
--

DROP TABLE IF EXISTS `bird_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bird_families` (
  `family_id` int(11) NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `brief_descrption` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`family_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird_families`
--

LOCK TABLES `bird_families` WRITE;
/*!40000 ALTER TABLE `bird_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `bird_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bird_orders`
--

DROP TABLE IF EXISTS `bird_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bird_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) DEFAULT NULL,
  `brief_descrption` text,
  `order_image` blob,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird_orders`
--

LOCK TABLES `bird_orders` WRITE;
/*!40000 ALTER TABLE `bird_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `bird_orders` ENABLE KEYS */;
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
  `common_name` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL,
  `conservation_status_id` int(11) DEFAULT '7',
  `wing_id` char(2) COLLATE latin1_bin DEFAULT NULL,
  `body_id` char(2) COLLATE latin1_bin DEFAULT NULL,
  `bill_id` char(2) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`bird_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds`
--

LOCK TABLES `birds` WRITE;
/*!40000 ALTER TABLE `birds` DISABLE KEYS */;
INSERT INTO `birds` VALUES (1,'Charadrius vociferus','Killdeer',NULL,7,NULL,NULL,NULL),(2,'Gavia immer','Great Northern Loon',NULL,7,NULL,NULL,NULL),(3,'Aix sponsa','Wood Duck',NULL,7,NULL,NULL,NULL),(4,'Chordeiles minor','Common Nighthawk',NULL,7,NULL,NULL,NULL),(5,'Sitta carolinensis','White-breasted Nuthatch',NULL,7,NULL,NULL,NULL),(6,'Apteryx mantelli','North Island Brown Kiwi',NULL,7,NULL,NULL,NULL);
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
-- Table structure for table `birds_details`
--

DROP TABLE IF EXISTS `birds_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_details` (
  `bird_id` int(11) NOT NULL DEFAULT '0',
  `bird_description` text COLLATE latin1_bin,
  `migrate` int(11) DEFAULT NULL,
  `bird_feeder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds_details`
--

LOCK TABLES `birds_details` WRITE;
/*!40000 ALTER TABLE `birds_details` DISABLE KEYS */;
INSERT INTO `birds_details` VALUES (1,NULL,NULL,NULL),(2,NULL,NULL,NULL),(3,NULL,NULL,NULL),(4,NULL,NULL,NULL),(5,NULL,NULL,NULL),(6,NULL,NULL,NULL);
/*!40000 ALTER TABLE `birds_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_habitats`
--

DROP TABLE IF EXISTS `birds_habitats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_habitats` (
  `bird_id` int(11) DEFAULT NULL,
  `habitat_id` int(11) DEFAULT NULL,
  UNIQUE KEY `bird_habitat` (`bird_id`,`habitat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds_habitats`
--

LOCK TABLES `birds_habitats` WRITE;
/*!40000 ALTER TABLE `birds_habitats` DISABLE KEYS */;
INSERT INTO `birds_habitats` VALUES (2,5),(3,5),(3,6);
/*!40000 ALTER TABLE `birds_habitats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_new`
--

DROP TABLE IF EXISTS `birds_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_new` (
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
-- Dumping data for table `birds_new`
--

LOCK TABLES `birds_new` WRITE;
/*!40000 ALTER TABLE `birds_new` DISABLE KEYS */;
INSERT INTO `birds_new` VALUES (1,'Charadrius vociferus','Killdeer',NULL,NULL),(2,'Gavia immer','Great Northern Loon',NULL,NULL),(3,'Aix sponsa','Wood Duck',NULL,NULL),(4,'Chordeiles minor','Common Nighthawk',NULL,NULL),(5,'Sitta carolinensis','White-breasted Nuthatch',NULL,NULL),(6,'Apteryx mantelli','North Island Brown Kiwi',NULL,NULL);
/*!40000 ALTER TABLE `birds_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_old`
--

DROP TABLE IF EXISTS `birds_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_old` (
  `bird_id` int(11) NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `common_name` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bird_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds_old`
--

LOCK TABLES `birds_old` WRITE;
/*!40000 ALTER TABLE `birds_old` DISABLE KEYS */;
INSERT INTO `birds_old` VALUES (1,'Charadrius vociferus','Killdeer',NULL),(2,'Gavia immer','Great Northern Loon',NULL),(3,'Aix sponsa','Wood Duck',NULL),(4,'Chordeiles minor','Common Nighthawk',NULL),(5,'Sitta carolinensis','White-breasted Nuthatch',NULL),(6,'Apteryx mantelli','North Island Brown Kiwi',NULL);
/*!40000 ALTER TABLE `birds_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_wing_shapes`
--

DROP TABLE IF EXISTS `birds_wing_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_wing_shapes` (
  `wing_id` char(2) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `wing_shape` char(25) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
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
-- Table structure for table `conservation_status`
--

DROP TABLE IF EXISTS `conservation_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conservation_status` (
  `conservation_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `conservation_category` char(10) COLLATE latin1_bin DEFAULT NULL,
  `conservation_state` char(25) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`conservation_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conservation_status`
--

LOCK TABLES `conservation_status` WRITE;
/*!40000 ALTER TABLE `conservation_status` DISABLE KEYS */;
INSERT INTO `conservation_status` VALUES (1,'Extinct','Extinct'),(2,'Extinct','Extinct in wild'),(3,'Threatened','Critically Endangered'),(4,'Threatened','Endangered'),(5,'Threatened','Vulnerable'),(6,'Lower Risk','Conservation Dependent'),(7,'Lower Risk','Near Threatened'),(8,'Lower Risk','Least Concern');
/*!40000 ALTER TABLE `conservation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_codes`
--

DROP TABLE IF EXISTS `country_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_codes` (
  `code1` char(2) DEFAULT NULL,
  `code2` char(2) DEFAULT NULL,
  `code3` char(3) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_name_italian` varchar(255) DEFAULT NULL,
  KEY `code1` (`code1`),
  KEY `code2` (`code2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_codes`
--

LOCK TABLES `country_codes` WRITE;
/*!40000 ALTER TABLE `country_codes` DISABLE KEYS */;
INSERT INTO `country_codes` VALUES ('ac',NULL,NULL,'Ascension Island',NULL),('ad','AD','AND','Andorra','Andorra'),('ae','AE','ARE','United Arab Emirates','Emirati Arabi Uniti'),('af','AF','AFG','Afghanistan','Afghanistan'),('ag','AG','ATG','Antigua and Barbuda','Antigua e Barbuda'),('ai','AI','AIA','Anguilla','Anguilla'),('al','AL','ALB','Albania','Albania'),('am','AM','ARM','Armenia','Armenia'),('an','AN','ANT','Netherlands Antilles','Antille Olandesi'),('ao','AO','AGO','Angola','Angola'),('aq',NULL,NULL,'Antarctica',NULL),('ar','AR','ARG','Argentina','Argentina'),('as','AS','ASM','American Samoa','Samoa Americane'),('at','AT','AUT','Austria','Austria'),('au','AU','AUS','Australia','Australia'),('aw','AW','ABW','Aruba','Aruba'),('ax','AX','ALA','?…land',NULL),('az','AZ','AZE','Azerbaijan','Azerbaijan'),('ba','BA','BIH','Bosnia and Herzegovina','Bosnia-Erzegovina'),('bb','BB','BRB','Barbados','Barbados'),('bd','BD','BGD','Bangladesh','Bangladesh'),('be','BE','BEL','Belgium','Belgio'),('bf','BF','BFA','Burkina Faso','Burkina Faso'),('bg','BG','BGR','Bulgaria','Bulgaria'),('bh','BH','BHR','Bahrain','Bahrain'),('bi','BI','BDI','Burundi','Burundi'),('bj','BJ','BEN','Benin','Benin'),('bm','BM','BMU','Bermuda','Bermuda'),('bn','BN','BRN','Brunei Darussalam','Brunei Darussalam'),('bo','BO','BOL','Bolivia','Bolivia'),('br','BR','BRA','Brazil','Brasile'),('bs','BS','BHS','Bahamas','Bahamas'),('bt','BT','BTN','Bhutan','Bhutan'),('bv',NULL,NULL,'Bouvet Island',NULL),('bw','BW','BWA','Botswana','Botswana'),('by','BY','BLR','Belarus','Bielorussia'),('bz','BZ','BLZ','Belize','Belize'),('ca','CA','CAN','Canada','Canada'),('cc',NULL,NULL,'Cocos (Keeling) Island',NULL),('cd','CD','COD','Democratic Republic of Congo','Repubblica Democratica del Congo'),('cf','CF','CAF','Central African Republic','Repubblica Centroafricana'),('cg','CG','COG','Republic of Congo','Repubblica del Congo'),('ch','CH','CHE','Switzerland','Svizzera'),('ci','CI','CIV','Cote d\'Ivoire','Costa d\'Avorio'),('ck','CK','COK','Cook Islands','Isole Cook'),('cl','CL','CHL','Chile','Cile'),('cm','CM','CMR','Cameroon','Camerun'),('cn','CN','CHN','China','Cina'),('co','CO','COL','Colombia','Colombia'),('cr','CR','CRI','Costa Rica','Costa Rica'),('cs','CS','SCG','Serbia',NULL),('cu','CU','CUB','Cuba','Cuba'),('cv','CV','CPV','Cape Verde','Capo Verde'),('cx',NULL,NULL,'Christmas Island',NULL),('cy','CY','CYP','Cyprus','Cipro'),('cz','CZ','CZE','Czech Republic','Repubblica Ceca'),('de','DE','DEU','Germany','Germania'),('dj','DJ','DJI','Djibouti','Gibuti'),('dk','DK','DNK','Denmark','Danimarca'),('dm','DM','DMA','Dominica','Dominica'),('do','DO','DOM','Dominican Republic','Repubblica Dominicana'),('dz','DZ','DZA','Algeria','Algeria'),('ec','EC','ECU','Ecuador','Ecuador'),('ee','EE','EST','Estonia','Estonia'),('eg','EG','EGY','Egypt','Egitto'),('eh','EH','ESH','Western Sahara','Sahara Occidentale'),('er','ER','ERI','Eritrea','Eritrea'),('es','ES','ESP','Spain','Spagna'),('et','ET','ETH','Ethiopia','Etiopia'),('fi','FI','FIN','Finland','Finlandia'),('fj','FJ','FJI','Fiji','Fiji'),('fk','FK','FLK','Falkland Islands (Malvinas)','Isole Falkland'),('fm','FM','FSM','Micronesia','Stati Federati della Micronesia'),('fo','FO','FRO','Faroe Islands','Isole Faroe'),('fr','FR','FRA','France','Francia'),('ga','GA','GAB','Gabon','Gabon'),('gd','GD','GRD','Grenada','Grenada'),('ge','GE','GEO','Georgia','Georgia'),('gf','GF','GUF','French Guiana','Guyana Francese'),('gg','GG','GGY','Guernsey',NULL),('gh','GH','GHA','Ghana','Ghana'),('gi','GI','GIB','Gibraltar','Gibilterra'),('gl','GL','GRL','Greenland','Groenlandia'),('gm','GM','GMB','Gambia','Gambia'),('gn','GN','GIN','Guinea','Guinea'),('gp','GP','GLP','Guadeloupe','Guadalupa'),('gq','GQ','GNQ','Equatorial Guinea','Guinea Equatoriale'),('gr','GR','GRC','Greece','Grecia'),('gs',NULL,NULL,'South Georgia and the South Sandwich Islands',NULL),('gt','GT','GTM','Guatemala','Guatemala'),('gu','GU','GUM','Guam','Guam'),('gw','GW','GNB','Guinea-Bissau','Guinea-Bissau'),('gy','GY','GUY','Guyana','Guyana'),('hk','HK','HKG','Hong Kong','Hong Kong'),('hm',NULL,NULL,'Heard and McDonald Islands',NULL),('hn','HN','HND','Honduras','Honduras'),('hr','HR','HRV','Croatia','Croazia'),('ht','HT','HTI','Haiti','Haiti'),('hu','HU','HUN','Hungary','Ungheria'),('id','ID','IDN','Indonesia','Indonesia'),('ie','IE','IRL','Ireland','Eire'),('il','IL','ISR','Israel','Israele'),('im','IM','IMN','Isle of Man','Isola di Man'),('in','IN','IND','India','India'),('io',NULL,NULL,'British Indian Ocean Territory',NULL),('iq','IQ','IRQ','Iraq','Iraq'),('ir','IR','IRN','Iran','Iran'),('is','IS','ISL','Iceland','Islanda'),('it','IT','ITA','Italy','Italia'),('je','JE','JEY','Jersey',NULL),('jm','JM','JAM','Jamaica','Giamaica'),('jo','JO','JOR','Jordan','Giordania'),('jp','JP','JPN','Japan','Giappone'),('ke','KE','KEN','Kenya','Kenya'),('kg','KG','KGZ','Kyrgyzstan','Kirghizistan'),('kh','KH','KHM','Cambodia','Cambogia'),('ki','KI','KIR','Kiribati','Kiribati'),('km','KM','COM','Comoros','Comore'),('kn','KN','KNA','Saint Kitts and Nevis','Saint Kitts e Nevis'),('kp','KP','PRK','North Korea','Corea del Nord'),('kr','KR','KOR','South Korea','Corea del Sud'),('kw','KW','KWT','Kuwait','Kuwait'),('ky','KY','CYM','Cayman Islands','Isole Cayman'),('kz','KZ','KAZ','Kazakhstan','Kazakistan'),('la','LA','LAO','Laos','Laos'),('lb','LB','LBN','Lebanon','Libano'),('lc','LC','LCA','Saint Lucia','Santa Lucia'),('li','LI','LIE','Liechtenstein','Liechtenstein'),('lk','LK','LKA','Sri Lanka','Sri Lanka'),('lr','LR','LBR','Liberia','Liberia'),('ls','LS','LSO','Lesotho','Lesotho'),('lt','LT','LTU','Lithuania','Lituania'),('lu','LU','LUX','Luxembourg','Lussemburgo'),('lv','LV','LVA','Latvia','Lettonia'),('ly','LY','LBY','Libya','Libia'),('ma','MA','MAR','Morocco','Marocco'),('mc','MC','MCO','Monaco','Monaco'),('md','MD','MDA','Moldova','Moldavia'),('mg','MG','MDG','Madagascar','Madagascar'),('mh','MH','MHL','Marshall Islands','Isole Marshall'),('mk','MK','MKD','Macedonia','Macedonia'),('ml','ML','MLI','Mali','Mali'),('mm','MM','MMR','Myanmar','Myanmar'),('mn','MN','MNG','Mongolia','Mongolia'),('mo','MO','MAC','Macau','Macao'),('mp','MP','MNP','Northern Mariana Islands','Isole Marianne Settentrionali'),('mq','MQ','MTQ','Martinique','Martinica'),('mr','MR','MRT','Mauritania','Mauritania'),('ms','MS','MSR','Montserrat','Montserrat'),('mt','MT','MLT','Malta','Malta'),('mu','MU','MUS','Mauritius','Mauritius'),('mv','MV','MDV','Maldives','Maldive'),('mw','MW','MWI','Malawi','Malawi'),('mx','MX','MEX','Mexico','Messico'),('my','MY','MYS','Malaysia','Malesia'),('mz','MZ','MOZ','Mozambique','Mozambico'),('na','NA','NAM','Namibia','Namibia'),('nc','NC','NCL','New Caledonia','Nuova Caledonia'),('ne','NE','NER','Niger','Niger'),('nf','NF','NFK','Norfolk Island','Isola Norfolk'),('ng','NG','NGA','Nigeria','Nigeria'),('ni','NI','NIC','Nicaragua','Nicaragua'),('nl','NL','NLD','Netherlands','Paesi Bassi'),('no','NO','NOR','Norway','Norvegia'),('np','NP','NPL','Nepal','Nepal'),('nr','NR','NRU','Nauru','Nauru'),('nu','NU','NIU','Niue','Niue'),('nz','NZ','NZL','New Zealand','Nuova Zelanda'),('om','OM','OMN','Oman','Oman'),('pa','PA','PAN','Panama','Panam??'),('pe','PE','PER','Peru','Per?1'),('pf','PF','PYF','French Polynesia','Polinesia Francese'),('pg','PG','PNG','Papua New Guinea','Papua Nuova Guinea'),('ph','PH','PHL','Philippines','Filippine'),('pk','PK','PAK','Pakistan','Pakistan'),('pl','PL','POL','Poland','Polonia'),('pm','PM','SPM','Saint Pierre and Miquelon','Saint Pierre e Miquelon'),('pn','PN','PCN','Pitcairn Island','Pitcairn'),('pr','PR','PRI','Puerto Rico','Porto Rico'),('ps','PS','PSE','Occupied Palestinian Territory','Territori Palestinesi Occupati'),('pt','PT','PRT','Portugal','Portogallo'),('pw','PW','PLW','Palau','Palau'),('py','PY','PRY','Paraguay','Paraguay'),('qa','QA','QAT','Qatar','Qatar'),('re','RE','REU','Reunion','Reunion'),('ro','RO','ROU','Romania','Romania'),('ru','RU','RUS','Russia','Federazione Russa'),('rw','RW','RWA','Rwanda','Ruanda'),('sa','SA','SAU','Saudia Arabia','Arabia Saudita'),('sb','SB','SLB','Solomon Islands','Isole Solomon'),('sc','SC','SYC','Seychelles','Seychelles'),('sd','SD','SDN','Sudan','Sudan'),('se','SE','SWE','Sweden','Svezia'),('sg','SG','SGP','Singapore','Singapore'),('sh','SH','SHN','Saint Helena','Sant\'Elena'),('si','SI','SVN','Slovenia','Slovenia'),('sj','SJ','SJM','Svalbard and Jan Mayen Islands','Svalbard e Jan Mayen'),('sk','SK','SVK','Slovakia','Slovacchia'),('sl','SL','SLE','Sierra Leone','Sierra Leone'),('sm','SM','SMR','San Marino','San Marino'),('sn','SN','SEN','Senegal','Senegal'),('so','SO','SOM','Somalia','Somalia'),('sr','SR','SUR','Suriname','Suriname'),('st','ST','STP','Sao Tome and Principe','Sao Tome e Principe'),('su','SU','SUN','USSR',NULL),('sv','SV','SLV','El Salvador','El Salvador'),('sy','SY','SYR','Syria','Siria'),('sz','SZ','SWZ','Swaziland','Swaziland'),('tc','TC','TCA','Turks and Caicos Islands','Isole Turks e Caicos'),('td','TD','TCD','Chad','Ciad'),('tf',NULL,NULL,'French Southern Territories',NULL),('tg','TG','TGO','Togo','Togo'),('th','TH','THA','Thailand','Thailandia'),('tj','TJ','TJK','Tajikistan','Tagikistan'),('tk',NULL,NULL,'Tokelau',NULL),('tm','TM','TKM','Turkmenistan','Turkmenistan'),('tn','TN','TUN','Tunisia','Tunisia'),('to','TO','TON','Tonga','Tonga'),('tp','TL','TLS','Timor-Leste','Timor Est'),('tr','TR','TUR','Turkey','Turchia'),('tt','TT','TTO','Trinidad and Tobago','Trinidad e Tobago'),('tv','TV','TUV','Tuvalu','Tuvalu'),('tw','TW','TWN','Taiwan','Taiwan'),('tz','TZ','TZA','Tanzania','Tanzania'),('ua','UA','UKR','Ukraine','Ucraina'),('ug','UG','UGA','Uganda','Uganda'),('uk','GB','GBR','United Kingdom','Regno Unito'),('um',NULL,NULL,'US Minor Outlying Islands',NULL),('us','US','USA','United States of America','Stati Uniti d\'America'),('uy','UY','URY','Uruguay','Uruguay'),('uz','UZ','UZB','Uzbekistan','Uzbekistan'),('va','VA','VAT','Vatican City State (Holy See)','Citt?? del Vaticano'),('vc','VC','VCT','Saint Vincent and the Grenadines','Saint Vincent e Grenadine'),('ve','VE','VEN','Venezuela','Venezuela'),('vg','IO','VGB','British Virgin Islands','Isole Vergini Britanniche'),('vi','VI','VIR','United States Virgin Islands','Isole Vergini Americane'),('vn','VN','VNM','Vietnam','Vietnam'),('vu','VU','VUT','Vanuatu','Vanuatu'),('wf','WF','WLF','Wallis and Futuna Islands','Wallis e Futuna'),('ws','WS','WSM','Samoa','Samoa'),('ye','YE','YEM','Yemen','Yemen'),('yt','YT','MYT','Mayotte','Mayotte'),('yu','YU','YUG','Yugoslavia',NULL),('za','ZA','ZAF','South Africa','Sudafrica'),('zm','ZM','ZMB','Zambia','Zambia'),('zw','ZW','ZWE','Zimbabwe','Zimbabwe');
/*!40000 ALTER TABLE `country_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat_codes`
--

DROP TABLE IF EXISTS `habitat_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat_codes` (
  `habit_id` int(11) NOT NULL AUTO_INCREMENT,
  `habitat` varchar(25) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`habit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat_codes`
--

LOCK TABLES `habitat_codes` WRITE;
/*!40000 ALTER TABLE `habitat_codes` DISABLE KEYS */;
INSERT INTO `habitat_codes` VALUES (1,'Coasts'),(2,'Deserts'),(3,'Forests'),(4,'Grasslands'),(5,'Lakes, Rivers, Ponds'),(6,'Marshes, Swamps'),(7,'Mountains'),(8,'Oceans'),(9,'Urban');
/*!40000 ALTER TABLE `habitat_codes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-18 23:00:57
