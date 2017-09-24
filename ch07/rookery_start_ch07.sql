
--
-- Current Database: `rookery`
--

--CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rookery` /*!40100 DEFAULT CHARACTER SET utf8 */;

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
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`family_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=MyISAM AUTO_INCREMENT=352 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird_families`
--

LOCK TABLES `bird_families` WRITE;
/*!40000 ALTER TABLE `bird_families` DISABLE KEYS */;
INSERT INTO `bird_families` VALUES (100,'Gaviidae','Loons or divers are aquatic birds found mainly in the Northern Hemisphere.',103),(102,'Anatidae','This family includes ducks, geese and swans.',103),(103,'Charadriidae',NULL,109),(104,'Laridae',NULL,102),(105,'Sternidae',NULL,102),(106,'Caprimulgidae',NULL,122),(107,'Sittidae',NULL,128),(108,'Picidae',NULL,125),(109,'Accipitridae',NULL,112),(110,'Tyrannidae',NULL,128),(111,'Formicariidae',NULL,128),(112,'Laniidae',NULL,128),(113,'Rallidae',NULL,113),(114,'Struthionidae (Ostrich)','Ostrich',120),(115,'Rheidae (Rheas)','Greater Rhea',NULL),(116,'Tinamidae (Tinamous)','Tawny-breasted Tinamou',121),(117,'Casuariidae (Cassowaries)','Southern Cassowary',NULL),(118,'Dromaiidae (Emu)','Emu',NULL),(119,'Apterygidae (Kiwis)','Southern Brown Kiwi',NULL),(120,'Anhimidae (Screamers)','Horned Screamer',100),(121,'Anseranatidae (Magpie Goose)','Magpie Goose',100),(122,'Anatidae (Ducks, Geese, and Waterfowl)','Spotted Whistling-Duck',100),(123,'Megapodiidae (Megapodes)','Australian Brush-Turkey',101),(124,'Cracidae (Guans, Chachalacas, and Curassows)','Plain Chachalaca',101),(125,'Numididae (Guineafowl)','White-breasted Guineafowl',101),(126,'Odontophoridae (New World Quail)','Stone Partridge',101),(127,'Phasianidae (Pheasants, Grouse, and Allies)','Rock Partridge',101),(128,'Gaviidae (Loons)','Red-throated Loon',103),(129,'Podicipedidae (Grebes)','White-tufted Grebe',104),(130,'Phoenicopteridae (Flamingos)','American Flamingo',111),(131,'Spheniscidae (Penguins)','King Penguin',106),(132,'Diomedeidae (Albatrosses)','Yellow-nosed Albatross',105),(133,'Procellariidae (Shearwaters and Petrels)','Southern Giant-Petrel',105),(134,'Pelecanoididae (Diving-Petrels)','Peruvian Diving-Petrel',105),(135,'Hydrobatidae (Storm-Petrels)','Wilson''s Storm-Petrel',105),(136,'Phaethontidae (Tropicbirds)','White-tailed Tropicbird',108),(137,'Ciconiidae (Storks)','Asian Openbill',109),(138,'Fregatidae (Frigatebirds)','Ascension Island Frigatebird',NULL),(139,'Sulidae (Boobies and Gannets)','Masked Booby',NULL),(140,'Phalacrocoracidae (Cormorants and Shags)','Little Black Cormorant',NULL),(141,'Anhingidae (Anhingas)','Anhinga',NULL),(142,'Pelecanidae (Pelicans)','Great White Pelican',107),(143,'Balaenicipitidae (Shoebill)','Shoebill',107),(144,'Scopidae (Hamerkop)','Hamerkop',107),(145,'Ardeidae (Herons, Egrets, and Bitterns)','Pinnated Bittern',107),(146,'Threskiornithidae (Ibises and Spoonbills)','White Ibis',107),(147,'Cathartidae (New World Vultures)','Black Vulture',112),(148,'Sagittariidae (Secretary-bird)','Secretary-bird',112),(149,'Pandionidae (Osprey)','Osprey',112),(150,'Accipitridae (Hawks, Eagles, and Kites)','Pearl Kite',112),(151,'Otididae (Bustards)','Great Bustard',NULL),(152,'Mesitornithidae (Mesites)','White-breasted Mesite',NULL),(153,'Rhynochetidae (Kagu)','Kagu',NULL),(154,'Eurypygidae (Sunbittern)','Sunbittern',NULL),(155,'Rallidae (Rails, Gallinules, and Coots)','Nkulengu Rail',113),(156,'Sarothruridae (Flufftails)','White-spotted Flufftail',113),(157,'Heliornithidae (Finfoots)','African Finfoot',113),(158,'Aramidae (Limpkin)','Limpkin',113),(159,'Psophiidae (Trumpeters)','Gray-winged Trumpeter',113),(160,'Gruidae (Cranes)','Gray Crowned-Crane',113),(161,'Chionidae (Sheathbills)','Snowy Sheathbill',102),(162,'Pluvianellidae (Magellanic Plover)','Magellanic Plover',102),(163,'Burhinidae (Thick-knees)','Water Thick-knee',102),(164,'Pluvianidae (Egyptian Plover)','Egyptian Plover',102),(165,'Recurvirostridae (Stilts and Avocets)','Black-winged Stilt',102),(166,'Ibidorhynchidae (Ibisbill)','Ibisbill',102),(167,'Haematopodidae (Oystercatchers)','Eurasian Oystercatcher',102),(168,'Charadriidae (Plovers and Lapwings)','Black-bellied Plover',102),(169,'Pedionomidae (Plains-wanderer)','Plains-wanderer',102),(170,'Thinocoridae (Seedsnipes)','Rufous-bellied Seedsnipe',102),(171,'Rostratulidae (Painted-Snipes)','Greater Painted-Snipe',102),(172,'Jacanidae (Jacanas)','Lesser Jacana',102),(173,'Scolopacidae (Sandpipers and Allies)','Terek Sandpiper',102),(174,'Turnicidae (Buttonquail)','Small Buttonquail',102),(175,'Dromadidae (Crab Plover)','Crab Plover',102),(176,'Glareolidae (Pratincoles and Coursers)','Cream-colored Courser',102),(177,'Stercorariidae (Skuas and Jaegers)','Great Skua',102),(178,'Alcidae (Auks, Murres, and Puffins)','Dovekie',102),(179,'Laridae (Gulls, Terns, and Skimmers)','Swallow-tailed Gull',102),(180,'Pteroclidae (Sandgrouse)','Tibetan Sandgrouse',NULL),(181,'Columbidae (Pigeons and Doves)','Rock Pigeon',115),(182,'Musophagidae (Turacos)','Great Blue Turaco',117),(183,'Opisthocomidae (Hoatzin)','Hoatzin',117),(184,'Cuculidae (Cuckoos)','Pied Cuckoo',117),(185,'Tytonidae (Barn-Owls)','Sooty Owl',119)
,(186,'Strigidae (Owls)','White-fronted Scops-Owl',119),(187,'Aegothelidae (Owlet-Nightjars)','New Caledonian Owlet-Nightjar',122),(188,'Podargidae (Frogmouths)','Tawny Frogmouth',122),(189,'Caprimulgidae (Nightjars and Allies)','Spotted Nightjar',122),(190,'Nyctibiidae (Potoos)','Great Potoo',122),(191,'Steatornithidae (Oilbird)','Oilbird',122),(192,'Apodidae (Swifts)','Black Swift',123),(193,'Hemiprocnidae (Treeswifts)','Crested Treeswift',123)
,(194,'Trochilidae (Hummingbirds)','Crimson Topaz',123),(195,'Coliidae (Mousebirds)','Speckled Mousebird',127),(196,'Trogonidae (Trogons)','Eared Quetzal',126),(197,'Todidae (Todies)','Cuban Tody',124),(198,'Momotidae (Motmots)','Tody Motmot',124),(199,'Alcedinidae (Kingfishers)','Blyth''s Kingfisher',124),(200,'Meropidae (Bee-eaters)','Red-bearded Bee-eater',124),(201,'Coraciidae (Rollers)','European Roller',124),(202,'Brachypteraciidae (Ground-Rollers)','Short-legged Ground-Roller',124),(203,'Leptosomidae (Cuckoo-Roller)','Cuckoo-Roller',124),(204,'Upupidae (Hoopoes)','Eurasian Hoopoe',124),(205,'Phoeniculidae (Woodhoopoes and Scimitar-bills)','Green Woodhoopoe',124),(206,'Bucorvidae (Ground-Hornbills)','Abyssinian Ground-Hornbill',124),(207,'Bucerotidae (Hornbills)','White-crested Hornbill',124),(208,'Bucconidae (Puffbirds)','White-necked Puffbird',NULL),(209,'Galbulidae (Jacamars)','White-eared Jacamar',NULL),(210,'Lybiidae (African Barbets)','Yellow-billed Barbet',125),(211,'Megalaimidae (Asian Barbets)','Sooty Barbet',125),(212,'Capitonidae (New World Barbets)','Scarlet-crowned Barbet',125),(213,'Semnornithidae (Toucan-Barbets)','Prong-billed Barbet',125),(214,'Ramphastidae (Toucans)','Emerald Toucanet',125),(215,'Indicatoridae (Honeyguides)','Cassin''s Honeyguide',125),(216,'Picidae (Woodpeckers)','Eurasian Wryneck',125),(217,'Cariamidae (Seriemas)','Red-legged Seriema',NULL),(218,'Falconidae (Falcons and Caracaras)','Barred Forest-Falcon',112),(219,'Strigopidae (New Zealand Parrots)','Kea',116),(220,'Cacatuidae (Cockatoos)','Palm Cockatoo',116),(221,'Psittaculidae (Old World Parrots)','Pesquet''s Parrot',116),(222,'Psittacidae (New World and African Parrots)','Gray Parrot',116),(223,'Acanthisittidae (New Zealand Wrens)','Rifleman',128),(224,'Calyptomenidae (African and Green Broadbills)','African Broadbill',128),(225,'Eurylaimidae (Asian and Grauer''s Broadbills)','Black-and-red Broadbill',128),(226,'Sapayoidae (Sapayoa)','Sapayoa',128),(227,'Philepittidae (Asities)','Velvet Asity',128),(228,'Pittidae (Pittas)','Whiskered Pitta',128),(229,'Thamnophilidae (Typical Antbirds)','Rufous-rumped Antwren',128),(230,'Melanopareiidae (Crescentchests)','Collared Crescentchest',128),(231,'Conopophagidae (Gnateaters)','Rufous Gnateater',128),(232,'Grallariidae (Antpittas)','Undulated Antpitta',128),(233,'Rhinocryptidae (Tapaculos)','Chestnut-throated Huet-huet',128),(234,'Formicariidae (Antthrushes)','Rufous-capped Antthrush',128),(235,'Furnariidae (Ovenbirds and Woodcreepers)','Tawny-throated Leaftosser',128),(236,'Tyrannidae (Tyrant Flycatchers)','Yellow-bellied Tyrannulet',128),(237,'Oxyruncidae (Sharpbill)','Sharpbill',128),(238,'Cotingidae (Cotingas)','Hooded Berryeater',128),(239,'Pipridae (Manakins)','Dwarf Tyrant-Manakin',128),(240,'Tityridae (Tityras and Allies)','Black-tailed Tityra',128),(241,'Menuridae (Lyrebirds)','Albert''s Lyrebird',128),(242,'Atrichornithidae (Scrub-birds)','Rufous Scrub-bird',128),(243,'Ptilonorhynchidae (Bowerbirds)','White-eared Catbird',128),(244,'Climacteridae (Australasian Treecreepers)','Papuan Treecreeper',128),(245,'Maluridae (Fairywrens)','Gray Grasswren',128),(246,'Meliphagidae (Honeyeaters)','Eastern Spinebill',128),(247,'Dasyornithidae (Bristlebirds)','Western Bristlebird',128),(248,'Pardalotidae (Pardalotes)','Spotted Pardalote',128),(249,'Acanthizidae (Thornbills and Allies)','Goldenface',128),(250,'Pomatostomidae (Pseudo-Babblers)','New Guinea Babbler',128),(251,'Orthonychidae (Logrunners)','Northern Logrunner',128),(252,'Cnemophilidae (Satinbirds)','Loria''s Satinbird',128),(253,'Melanocharitidae (Berrypeckers and Longbills)','Obscure Berrypecker',128),(254,'Mohouidae (Whiteheads)','Whitehead',128),(255,'Paramythiidae (Tit Berrypecker and Crested Berrypecker)','Tit Berrypecker',128),(256,'Callaeidae (Wattlebirds)','Kokako',128),(257,'Notiomystidae (Stitchbird)','Stitchbird',128),(258,'Psophodidae (Whipbirds and Wedgebills)','Papuan Whipbird',128),(259,'Cinclosomatidae (Quail-thrushes and Jewel-babblers)','Spotted Quail-thrush',128),(260,'Platysteiridae (Wattle-eyes and Batises)','White-tailed Shrike',128),(261,'Vangidae (Vangas, Helmetshrikes, and Allies)','White Helmetshrike',128),(262,'Malaconotidae (Bushshrikes and Allies)','Brubru',128),(263,'Machaerirhynchidae (Boatbills)','Black-breasted Boatbill',128),(264,'Artamidae (Woodswallows)','Ashy Woodswallow',128),(265,'Cracticidae (Bellmagpies and Allies)','Mountain Peltops',128),(266,'Pityriaseidae (Bristlehead)','Bornean Bristlehead',128),(267,'Aegithinidae (Ioras)','Common Iora',128),(268,'Campephagidae (Cuckooshrikes)','White-bellied Minivet',128),(269,'Neosittidae (Sittellas)','Black Sittella',128),(270,'Pachycephalidae (Whistlers and Allies)','Wattled Ploughbill',128)
,(271,'Oreoicidae (Australo-Papuan Bellbirds)','Crested Bellbird',128),(272,'Laniidae (Shrikes)','Tiger Shrike',128),(273,'Vireonidae (Vireos, Shrike-Babblers, and Erpornis)','Black-headed Shrike-Babbler',128),(274,'Oriolidae (Old World Orioles)','Hooded Pitohui',128),(275,'Dicruridae (Drongos)','Square-tailed Drongo',128),(276,'Rhipiduridae (Fantails)','Pygmy Drongo-Fantail',128),(277,'Monarchidae (Monarch Flycatchers)','Blue-capped Ifrita',128),(278,'Corvidae (Crows, Jays, and Magpies)','Crested Jay',128),(279,'Corcoracidae (White-winged Chough and Apostlebird)','White-winged Chough',128),(280,'Paradisaeidae (Birds-of-Paradise)','Paradise-crow',128),(281,'Petroicidae (Australasian Robins)','Greater Ground-Robin',128),(282,'Picathartidae (Rockfowl)','White-necked Rockfowl',128),(283,'Chaetopidae (Rockjumpers)','Cape Rockjumper',128),(284,'Eupetidae (Rail-babbler)','Malaysian Rail-babbler',128),(285,'Panuridae (Bearded Reedling)','Bearded Reedling',128),(286,'Nicatoridae (Nicators)','Western Nicator',128),(287,'Alaudidae (Larks)','Australasian Bushlark',128),(288,'Hirundinidae (Swallows)','African River Martin',128),(289,'Stenostiridae (Fairy Flycatchers)','Fairy Flycatcher',128),(290,'Paridae (Tits, Chickadees, and Titmice)','Sombre Tit',128),(291,'Remizidae (Penduline-Tits)','Verdin',128),(292,'Aegithalidae (Long-tailed Tits)','White-browed Tit-Warbler',128),(293,'Sittidae (Nuthatches)','Indian Nuthatch',128),(294,'Tichodromidae (Wallcreeper)','Wallcreeper',128),(295,'Certhiidae (Treecreepers)','Eurasian Treecreeper',128),(296,'Troglodytidae (Wrens)','Rock Wren',128),(297,'Polioptilidae (Gnatcatchers)','Collared Gnatwren',128),(298,'Cinclidae (Dippers)','White-throated Dipper',128),(299,'Pycnonotidae (Bulbuls)','Sombre Greenbul',128),(300,'Regulidae (Kinglets)','Golden-crowned Kinglet',128),(301,'Pnoepygidae (Cupwings)','Scaly-breasted Cupwing',128),(302,'Macrosphenidae (African Warblers)','Green Crombec',128),(303,'Cettiidae (Bush-Warblers and Allies)','Chestnut-capped Flycatcher',128),(304,'Phylloscopidae (Leaf-Warblers)','Red-faced Woodland-Warbler',128),(305,'Acrocephalidae (Reed-Warblers and Allies)','Aldabra Brush-Warbler',128),(306,'Locustellidae (Grassbirds and Allies)','Cordillera Ground-Warbler',128),(307,'Donacobiidae (Donacobius)','Black-capped Donacobius',128),(308,'Bernieridae (Malagasy Warblers)','White-throated Oxylabes',128),(309,'Cisticolidae (Cisticolas and Allies)','Common Jery',128),(310,'Sylviidae (Sylviid Warblers)','Abyssinian Catbird',128),(311,'Paradoxornithidae (Parrotbills, Wrentit, and Allies)','Fire-tailed Myzornis',128),(312,'Zosteropidae (White-eyes, Yuhinas, and Allies)','Striated Yuhina',128),(313,'Timaliidae (Tree-Babblers, Scimitar-Babblers, and Allies)','Chestnut-capped Babbler',128),(314,'Pellorneidae (Ground Babblers and Allies)','Palawan Babbler',128),(315,'Leiothrichidae (Laughingthrushes and Allies)','Gold-fronted Fulvetta',128),(316,'Promeropidae (Sugarbirds)','Gurney''s Sugarbird',128),(317,'Irenidae (Fairy-bluebirds)','Asian Fairy-bluebird',128),(318,'Hyliotidae (Hyliotas)','Yellow-bellied Hyliota',128),(319,'Muscicapidae (Old World Flycatchers)','Silverbird',128),(320,'Turdidae (Thrushes and Allies)','Rufous Flycatcher-Thrush',128),(321,'Mimidae (Mockingbirds and Thrashers)','Blue Mockingbird',128),(322,'Sturnidae (Starlings)','Metallic Starling',128),(323,'Buphagidae (Oxpeckers)','Red-billed Oxpecker',128),(324,'Chloropseidae (Leafbirds)','Philippine Leafbird',128),(325,'Dicaeidae (Flowerpeckers)','Olive-backed Flowerpecker',128),(326,'Nectariniidae (Sunbirds and Spiderhunters)','Ruby-cheeked Sunbird',128),(327,'Prunellidae (Accentors)','Alpine Accentor',128),(328,'Motacillidae (Wagtails and Pipits)','Western Yellow Wagtail',128),(329,'Urocynchramidae (Przevalski''s Rosefinch)','Przevalski''s Rosefinch',128),(330,'Elachuridae (Spotted Elachura)','Spotted Elachura',128),(331,'Bombycillidae (Waxwings)','Bohemian Waxwing',128),(332,'Mohoidae (Hawaiian Honeyeaters)','Kauai Oo',128),(333,'Ptiliogonatidae (Silky-flycatchers)','Black-and-yellow Silky-flycatcher',128),(334,'Dulidae (Palmchat)','Palmchat',128),(335,'Hylocitreidae (Hylocitrea)','Hylocitrea',128),(336,'Hypocoliidae (Hypocolius)','Hypocolius',128),(337,'Peucedramidae (Olive Warbler)','Olive Warbler',128),(338,'Calcariidae (Longspurs and Snow Buntings)','Lapland Longspur',128),(339,'Parulidae (New World Warblers)','Ovenbird',128),(340,'Thraupidae (Tanagers and Allies)','Brown Tanager',128),(341,'Emberizidae (Buntings and New World Sparrows)','Tanager Finch',128),(342,'Cardinalidae (Cardinals and Allies)','Rose-throated Tanager',128),(343,'Icteridae (Troupials and Allies)','Bobolink',128),(344,'Fringillidae (Finches, Euphonias, and Allies)','Common Chaffinch',128)
,(345,'Passeridae (Old World Sparrows)','Cinnamon Ibon',128),(346,'Ploceidae (Weavers and Allies)','White-billed Buffalo-Weaver',128),(347,'Estrildidae (Waxbills and Allies)','Pale-fronted Nigrita',128),(348,'Viduidae (Indigobirds)','Pin-tailed Whydah',128),(349,'Viduidae','Indigobirds & Whydahs',128),(350,'Estrildidae','Waxbills, Weaver Finches, & Allies',128)
,(351,'Ploceidae','Weavers, Malimbe, & Bishops',128);
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
  `brief_description` varchar(255) DEFAULT NULL,
  `order_image` blob,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird_orders`
--

LOCK TABLES `bird_orders` WRITE;
/*!40000 ALTER TABLE `bird_orders` DISABLE KEYS */;
INSERT INTO `bird_orders` VALUES (100,'Anseriformes','Waterfowl',NULL),(101,'Galliformes','Fowl',NULL),(102,'Charadriiformes','Gulls, Button Quails, Plovers',NULL),(103,'Gaviiformes','Loons',NULL),(104,'Podicipediformes','Grebes',NULL),(105,'Procellariiformes','Albatrosses, Petrels',NULL),(106,'Sphenisciformes','Penguins',NULL),(107,'Pelecaniformes','Pelicans',NULL),(108,'Phaethontiformes','Tropicbirds',NULL),(109,'Ciconiiformes','Storks',NULL),(110,'Cathartiformes','New-World Vultures',NULL),(111,'Phoenicopteriformes','Flamingos',NULL),(112,'Falconiformes','Falcons, Eagles, Hawks',NULL),(113,'Gruiformes','Cranes',NULL),(114,'Pteroclidiformes','Sandgrouse',NULL),(115,'Columbiformes','Doves and Pigeons',NULL),(116,'Psittaciformes','Parrots',NULL),(117,'Cuculiformes','Cuckoos and Turacos',NULL),(118,'Opisthocomiformes','Hoatzin',NULL),(119,'Strigiformes','Owls',NULL),(120,'Struthioniformes','Ostriches, Emus, Kiwis',NULL),(121,'Tinamiformes','Tinamous',NULL),(122,'Caprimulgiformes','Nightjars',NULL),(123,'Apodiformes','Swifts and Hummingbirds',NULL),(124,'Coraciiformes','Kingfishers',NULL),(125,'Piciformes','Woodpeckers',NULL),(126,'Trogoniformes','Trogons',NULL),(127,'Coliiformes','Mousebirds',NULL),(128,'Passeriformes','Passerines',NULL);
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
  `conservation_status_id` int(11) DEFAULT NULL,
  `wing_id` char(2) COLLATE latin1_bin DEFAULT NULL,
  `body_id` char(2) COLLATE latin1_bin DEFAULT NULL,
  `bill_id` char(2) COLLATE latin1_bin DEFAULT NULL,
  `description` text COLLATE latin1_bin,
  PRIMARY KEY (`bird_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds`
--

LOCK TABLES `birds` WRITE;
/*!40000 ALTER TABLE `birds` DISABLE KEYS */;
INSERT INTO `birds` VALUES (1,'Charadrius vociferus','Killdeer',NULL,7,NULL,NULL,NULL,NULL),(2,'Gavia immer','Great Northern Loon',NULL,7,NULL,NULL,NULL,NULL),(3,'Aix sponsa','Wood Duck',NULL,7,NULL,NULL,NULL,NULL),(4,'Chordeiles minor','Common Nighthawk',NULL,7,NULL,NULL,NULL,NULL),(5,'Sitta carolinensis',' White-breasted Nuthatch',NULL,7,NULL,NULL,NULL,NULL),(6,'Apteryx mantelli','North Island Brown Kiwi',NULL,7,NULL,NULL,NULL,NULL),(7,'Charadrius montanus','Mountain Plover',103,NULL,NULL,NULL,NULL,NULL),(8,'Charadrius alexandrinus','Snowy Plover',103,NULL,NULL,NULL,NULL,NULL),(9,'Pluvialis squatarola','Black-bellied Plover',103,NULL,NULL,NULL,NULL,NULL),(10,'Pluvialis fulva','Pacific Golden Plover',103,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `birds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birds_bill_shapes`
--

DROP TABLE IF EXISTS `birds_bill_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birds_bill_shapes` (
  `bill_id` char(3) DEFAULT NULL,
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
INSERT INTO `birds_bill_shapes` VALUES ('AP','All Purpose',NULL),('CN','Cone',NULL),('CT','Curved',NULL),('DG','Dagger',NULL),('HK','Hooked',NULL),('HS','Hooked Seabird',NULL),('ND','Needle',NULL),('ST','Spatulate',NULL),('SP','Specialized',NULL);
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
INSERT INTO `birds_body_shapes` VALUES ('HBD','Hummingbird',NULL),('LLW','Long-Legged Wader',NULL),('MRH','Marsh Hen',NULL),('OWL','Owl',NULL),('PRB','Perching Bird',NULL),('PWB','Perching Water Bird',NULL),('PGN','Pigeon',NULL),('RPT','Raptor',NULL),('SBD','Seabird',NULL),('SRB','Shore Bird',NULL),('SWL','Swallow',NULL),('TCL','Tree Clinging',NULL),('WRF','Waterfowl',NULL),('WDF','Upland Ground Birds',NULL);
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
  `bird_description` text,
  `migrate` int(11) DEFAULT NULL,
  `bird_feeder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birds_new`
--

LOCK TABLES `birds_new` WRITE;
/*!40000 ALTER TABLE `birds_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `birds_new` ENABLE KEYS */;
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
INSERT INTO `birds_wing_shapes` VALUES ('BD','Broad',NULL),('RD','Rounded',NULL),('PT','Pointed',NULL),('TP','Tapered',NULL),('LN','Long',NULL),('VL','Very Long',NULL);
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
  `conservation_category` char(10) DEFAULT NULL,
  `conservation_state` char(25) DEFAULT NULL,
  PRIMARY KEY (`conservation_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conservation_status`
--

LOCK TABLES `conservation_status` WRITE;
/*!40000 ALTER TABLE `conservation_status` DISABLE KEYS */;
INSERT INTO `conservation_status` VALUES (1,'Extinct','Extinct'),(2,'Extinct','Extinct in Wild'),(3,'Threatened','Critically Endangered'),(4,'Threatened','Endangered'),(5,'Threatened','Vulnerable'),(6,'Lower Risk','Conservation Dependent'),(7,'Lower Risk','Near Threatened'),(8,'Lower Risk','Least Concern');
/*!40000 ALTER TABLE `conservation_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat_codes`
--

DROP TABLE IF EXISTS `habitat_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat_codes` (
  `habitat_id` int(11) NOT NULL AUTO_INCREMENT,
  `habitat` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`habitat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat_codes`
--

LOCK TABLES `habitat_codes` WRITE;
/*!40000 ALTER TABLE `habitat_codes` DISABLE KEYS */;
INSERT INTO `habitat_codes` VALUES (1,'Coasts'),(2,'Deserts'),(3,'Forests'),(4,'Grasslands'),(5,'Lakes, Rivers, Ponds'),(6,'Marshes, Swamps'),(7,'Mountains'),(8,'Oceans'),(9,'Urban');
/*!40000 ALTER TABLE `habitat_codes` ENABLE KEYS */;
UNLOCK TABLES;

