-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: MAINOFFICEDB
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `customers`
--
CREATE SCHEMA ONLINEDB;
USE ONLINEDB;

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerNumber` int(3) NOT NULL,
  `custName` varchar(100) DEFAULT NULL,
  `custProvince` int(3) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Karlo Pineda',76),(2,'Rosario Tan',51),(3,'Rachel Garcia',82),(4,'Fernan Hola',71),(5,'Sigundina Reyes',36),(6,'Julian Olivares',58),(7,'Philip Mariano',21),(8,'Wally Macasaet',27),(9,'Lolita Bueno',31),(10,'Mandy Culion',63),(11,'Laarni Gayatgay',35),(12,'Luz Nino',82),(13,'Ernesto Sanchez',5),(14,'Katherine Vivo',46),(15,'Ysabelle Yulo',30),(16,'Roel Cruz',83),(17,'Xerxes Julino',88),(18,'Juan Paolo Lee',19),(19,'Teresa Estanislao',7),(20,'Benedict Pena',5);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refprovince`
--

DROP TABLE IF EXISTS `refprovince`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refprovince` (
  `provDesc` text,
  `regCode` int(3) DEFAULT NULL,
  `provCode` int(4) NOT NULL,
  PRIMARY KEY (`provCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refprovince`
--

LOCK TABLES `refprovince` WRITE;
/*!40000 ALTER TABLE `refprovince` DISABLE KEYS */;
INSERT INTO `refprovince` VALUES ('LA UNION',1,3),('ILOCOS SUR',1,2),('ILOCOS NORTE',1,1),('ISABELA',2,7),('CAGAYAN',2,6),('BATANES',2,5),('PANGASINAN',1,4),('PAMPANGA',3,13),('NUEVA ECIJA',3,12),('BULACAN',3,11),('BATAAN',3,10),('QUIRINO',2,9),('NUEVA VIZCAYA',2,8),('BATANGAS',4,17),('AURORA',3,16),('ZAMBALES',3,15),('TARLAC',3,14),('COTABATO (NORTH COTABATO)',12,63),('DAVAO OCCIDENTAL',11,62),('OCCIDENTAL MINDORO',17,23),('MARINDUQUE',17,22),('RIZAL',4,21),('QUEZON',4,20),('LAGUNA',4,19),('CAVITE',4,18),('ROMBLON',17,26),('PALAWAN',17,25),('ORIENTAL MINDORO',17,24),('CAMARINES SUR',5,29),('CAMARINES NORTE',5,28),('ALBAY',5,27),('AKLAN',6,33),('SORSOGON',5,32),('MASBATE',5,31),('CATANDUANES',5,30),('ILOILO',6,36),('CAPIZ',6,35),('ANTIQUE',6,34),('CEBU',7,40),('BOHOL',7,39),('GUIMARAS',6,38),('NEGROS OCCIDENTAL',6,37),('LEYTE',8,44),('EASTERN SAMAR',8,43),('SIQUIJOR',7,42),('NEGROS ORIENTAL',7,41),('BILIRAN',8,48),('SOUTHERN LEYTE',8,47),('NORTHERN SAMAR',8,45),('SAMAR (WESTERN SAMAR)',8,46),('ZAMBOANGA SIBUGAY',9,51),('ZAMBOANGA DEL SUR',9,50),('ZAMBOANGA DEL NORTE',9,49),('LANAO DEL NORTE',10,55),('CAMIGUIN',10,54),('BUKIDNON',10,53),('CITY OF ISABELA',9,52),('DAVAO DEL NORTE',11,58),('MISAMIS ORIENTAL',10,57),('MISAMIS OCCIDENTAL',10,56),('COMPOSTELA VALLEY',11,61),('DAVAO ORIENTAL',11,60),('DAVAO DEL SUR',11,59),('SOUTH COTABATO',12,64),('SULTAN KUDARAT',12,65),('SARANGANI',12,66),('COTABATO CITY',12,67),('NCR, CITY OF MANILA, FIRST DISTRICT',13,68),('CITY OF MANILA',13,69),('NCR, SECOND DISTRICT',13,70),('NCR, THIRD DISTRICT',13,71),('NCR, FOURTH DISTRICT',13,72),('ABRA',14,73),('BENGUET',14,74),('IFUGAO',14,75),('KALINGA',14,76),('MOUNTAIN PROVINCE',14,77),('APAYAO',14,78),('BASILAN',15,79),('LANAO DEL SUR',15,80),('MAGUINDANAO',15,81),('SULU',15,82),('TAWI-TAWI',15,83),('AGUSAN DEL NORTE',16,84),('AGUSAN DEL SUR',16,85),('SURIGAO DEL NORTE',16,86),('SURIGAO DEL SUR',16,87),('DINAGAT ISLANDS',16,88);
/*!40000 ALTER TABLE `refprovince` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refregion`
--

DROP TABLE IF EXISTS `refregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refregion` (
  `regDesc` text,
  `regCode` int(3) NOT NULL,
  PRIMARY KEY (`regCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refregion`
--

LOCK TABLES `refregion` WRITE;
/*!40000 ALTER TABLE `refregion` DISABLE KEYS */;
INSERT INTO `refregion` VALUES ('REGION I (ILOCOS REGION)',1),('REGION II (CAGAYAN VALLEY)',2),('REGION III (CENTRAL LUZON)',3),('REGION IV-A (CALABARZON)',4),('REGION IV-B (MIMAROPA)',17),('REGION V (BICOL REGION)',5),('REGION VI (WESTERN VISAYAS)',6),('REGION VII (CENTRAL VISAYAS)',7),('REGION VIII (EASTERN VISAYAS)',8),('REGION IX (ZAMBOANGA PENINSULA)',9),('REGION X (NORTHERN MINDANAO)',10),('REGION XI (DAVAO REGION)',11),('REGION XII (SOCCSKSARGEN)',12),('NATIONAL CAPITAL REGION (NCR)',13),('CORDILLERA ADMINISTRATIVE REGION (CAR)',14),('AUTONOMOUS REGION IN MUSLIM MINDANAO (ARMM)',15),('REGION XIII (Caraga)',16);
/*!40000 ALTER TABLE `refregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refstatus`
--

DROP TABLE IF EXISTS `refstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refstatus` (
  `statuscode` int(2) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`statuscode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refstatus`
--

LOCK TABLES `refstatus` WRITE;
/*!40000 ALTER TABLE `refstatus` DISABLE KEYS */;
INSERT INTO `refstatus` VALUES (1,'fulfilled'),(2,'completed'),(3,'pending');
/*!40000 ALTER TABLE `refstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `orderNum` int(8) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `fulfillDate` date DEFAULT NULL,
  `customerNumber` int(3) DEFAULT NULL,
  `salesRepresentative` int(3) DEFAULT NULL,
  `satisactoryRating` int(2) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `service` int(1) DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  `sales` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`orderNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2017-01-01','2017-01-13',9,7,3,1,0,70071.00,7707.81,62363.19),(2,'2017-01-01','2017-01-06',3,5,3,2,0,17756.00,1775.60,15980.40),(3,'2017-01-01','2017-01-26',2,14,4,3,1,14111.00,2116.65,11994.35),(4,'2017-02-05','2017-02-20',16,11,5,1,1,37097.00,4451.64,32645.36),(5,'2017-01-07','2017-01-17',15,6,2,3,0,40649.00,3251.92,37397.08),(6,'2017-02-07','2017-02-22',15,5,5,2,1,37233.00,5212.62,32020.38),(7,'2017-03-10','2017-03-17',2,13,2,1,1,60520.00,9078.00,51442.00),(8,'2017-03-11','2017-03-25',20,9,3,1,1,45952.00,6433.28,39518.72),(9,'2017-03-12','2017-03-20',7,7,3,2,1,49210.00,2460.50,46749.50),(10,'2017-04-15','2017-04-22',8,9,3,2,1,35034.00,4554.42,30479.58),(11,'2017-04-16','2017-05-08',5,1,2,1,0,43952.00,2197.60,41754.40),(12,'2017-04-17','2017-04-25',20,11,1,3,1,46761.00,5611.32,41149.68),(13,'2017-05-20','2017-06-14',17,3,1,3,0,13030.00,651.50,12378.50),(14,'2017-05-21','2017-05-26',2,1,3,2,1,13974.00,1117.92,12856.08),(15,'2017-05-22','2017-06-06',5,9,4,2,1,56455.00,6774.60,49680.40),(16,'2017-06-06','2017-06-18',6,5,4,2,0,75216.00,7521.60,67694.40),(17,'2017-06-07','2017-07-01',9,11,2,1,0,66099.00,9253.86,56845.14),(18,'2017-06-08','2017-06-28',13,13,4,3,1,37927.00,5689.05,32237.95),(19,'2017-07-01','2017-07-15',5,14,2,1,0,22988.00,2298.80,20689.20),(20,'2017-07-02','2017-07-11',6,1,4,1,0,21721.00,1954.89,19766.11),(21,'2017-07-03','2017-07-23',6,15,4,1,1,55276.00,3316.56,51959.44),(22,'2017-08-08','2017-08-16',18,8,4,2,1,34754.00,2432.78,32321.22),(23,'2017-08-09','2017-08-26',4,14,5,2,1,40585.00,4058.50,36526.50),(24,'2017-08-10','2017-08-23',9,8,4,1,1,44181.00,2209.05,41971.95),(25,'2017-10-27','2017-11-17',18,12,5,2,0,38839.00,2718.73,36120.27),(26,'2017-10-28','2017-11-21',16,8,2,1,1,75847.00,8343.17,67503.83),(27,'2017-10-29','2017-11-21',11,10,4,1,1,88767.00,10652.04,78114.96),(28,'2017-11-05','2017-11-25',9,15,4,3,1,47708.00,4293.72,43414.28),(29,'2017-11-15','2017-11-21',13,14,5,3,0,22099.00,2209.90,19889.10),(30,'2017-11-25','2017-12-10',12,11,1,2,0,82643.00,8264.30,74378.70),(31,'2017-12-18','2017-12-23',12,11,3,3,0,99895.00,9989.50,89905.50),(32,'2017-12-19','2018-01-13',15,9,5,3,1,90909.00,9090.90,81818.10),(33,'2017-12-20','2018-01-11',20,11,4,2,0,57085.00,8562.75,48522.25),(34,'2018-01-01','2018-01-08',2,10,3,1,1,41581.00,2079.05,39501.95),(35,'2018-01-01','2018-01-18',2,3,2,1,1,43541.00,4789.51,38751.49),(36,'2018-01-01','2018-01-14',6,7,2,1,1,55783.00,2789.15,52993.85),(37,'2018-02-05','2018-02-21',3,9,5,1,1,13556.00,948.92,12607.08),(38,'2018-02-06','2018-03-02',17,13,5,1,0,32136.00,2892.24,29243.76),(39,'2018-02-07','2018-02-12',5,5,5,1,1,95091.00,10460.01,84630.99),(40,'2018-03-10','2018-03-31',14,6,3,2,1,93939.00,13151.46,80787.54),(41,'2018-03-11','2018-04-01',17,14,3,2,1,76685.00,9969.05,66715.95),(42,'2018-03-12','2018-03-23',6,15,5,3,1,16041.00,1122.87,14918.13),(43,'2018-04-15','2018-04-23',18,5,2,1,1,13988.00,1678.56,12309.44),(44,'2018-04-16','2018-04-25',4,3,4,1,0,8888.00,1155.44,7732.56),(45,'2018-04-17','2018-04-25',16,4,3,3,1,64521.00,9032.94,55488.06),(46,'2018-05-20','2018-05-29',1,9,1,1,1,98413.00,10825.43,87587.57),(47,'2018-05-21','2018-05-28',7,7,5,2,0,97664.00,9766.40,87897.60),(48,'2018-05-22','2018-06-13',16,12,1,3,0,62272.00,6227.20,56044.80),(49,'2018-06-06','2018-06-14',20,5,2,1,0,72859.00,8743.08,64115.92),(50,'2018-06-07','2018-06-21',17,6,1,3,1,76670.00,9967.10,66702.90),(51,'2018-06-08','2018-06-16',1,7,1,2,0,33482.00,2343.74,31138.26),(52,'2018-07-01','2018-07-08',20,7,5,2,1,77445.00,4646.70,72798.30),(53,'2018-07-02','2018-07-17',9,9,2,2,0,61611.00,8625.54,52985.46),(54,'2018-07-03','2018-07-13',9,11,4,1,0,49072.00,3435.04,45636.96),(55,'2018-08-08','2018-08-29',2,14,5,3,0,87866.00,12301.24,75564.76),(56,'2018-08-09','2018-08-24',5,3,4,2,0,53685.00,3757.95,49927.05),(57,'2018-08-10','2018-08-28',4,5,1,1,1,25568.00,3068.16,22499.84),(58,'2018-10-27','2018-11-08',13,11,2,1,0,91854.00,9185.40,82668.60),(59,'2018-10-28','2018-11-02',20,1,1,1,1,50078.00,4006.24,46071.76),(60,'2018-10-29','2018-11-13',5,5,4,2,0,60465.00,4232.55,56232.45),(61,'2018-11-05','2018-11-20',4,12,3,3,0,8654.00,865.40,7788.60),(62,'2018-11-15','2018-11-30',3,14,4,2,0,62905.00,5032.40,57872.60),(63,'2018-11-25','2018-12-14',3,3,5,3,1,60793.00,6687.23,54105.77),(64,'2018-12-18','2018-12-27',17,12,3,1,0,87778.00,13166.70,74611.30),(65,'2018-12-19','2019-01-08',10,7,2,2,0,38505.00,4235.55,34269.45),(66,'2018-12-20','2018-12-25',4,6,2,3,0,29867.00,3584.04,26282.96),(67,'2019-01-01','2019-01-13',17,12,5,1,0,90471.00,4523.55,85947.45),(68,'2019-01-01','2019-01-12',13,2,3,1,1,36836.00,3315.24,33520.76),(69,'2019-01-01','2019-01-13',9,10,2,2,0,10340.00,1447.60,8892.40),(70,'2019-02-05','2019-03-02',9,5,4,1,0,71786.00,8614.32,63171.68),(71,'2019-02-06','2019-02-15',3,3,3,3,1,24315.00,2431.50,21883.50),(72,'2019-02-07','2019-03-01',18,11,1,2,1,24013.00,2641.43,21371.57),(73,'2019-03-10','2019-03-27',16,2,4,2,1,32168.00,1608.40,30559.60),(74,'2019-03-11','2019-03-27',15,15,2,3,0,34980.00,3847.80,31132.20),(75,'2019-03-12','2019-03-19',3,4,3,3,0,22826.00,2967.38,19858.62),(76,'2019-04-15','2019-04-25',5,2,4,3,0,7264.00,653.76,6610.24),(77,'2019-04-16','2019-04-29',2,15,4,1,1,82189.00,6575.12,75613.88),(78,'2019-04-17','2019-04-24',14,13,1,2,1,94668.00,12306.84,82361.16),(79,'2019-05-20','2019-06-09',5,14,4,3,0,32063.00,3847.56,28215.44),(80,'2019-05-21','2019-06-12',18,12,4,1,0,77312.00,6184.96,71127.04),(81,'2019-05-22','2019-06-15',10,7,3,2,1,23824.00,2858.88,20965.12),(82,'2019-06-06','2019-06-11',5,4,4,2,1,52117.00,5211.70,46905.30),(83,'2019-06-07','2019-06-20',10,7,1,2,0,76415.00,6113.20,70301.80),(84,'2019-06-08','2019-06-19',1,4,4,3,1,68514.00,5481.12,63032.88),(85,'2019-07-01','2019-07-24',8,3,5,1,1,87137.00,11327.81,75809.19),(86,'2019-07-02','2019-07-10',4,7,2,1,0,33349.00,1667.45,31681.55),(87,'2019-07-03','2019-07-20',3,9,1,3,1,71459.00,8575.08,62883.92),(88,'2018-08-08','2018-08-14',19,1,3,1,1,87944.00,11432.72,76511.28),(89,'2018-08-09','2018-09-02',19,9,4,2,0,36260.00,2900.80,33359.20),(90,'2018-08-10','2018-09-01',20,12,5,3,1,40727.00,4072.70,36654.30),(91,'2018-10-27','2018-11-06',11,4,1,2,1,75831.00,6066.48,69764.52),(92,'2018-10-28','2018-11-21',13,15,5,1,0,88171.00,7935.39,80235.61),(93,'2018-10-29','2018-11-22',16,6,4,1,1,45699.00,2741.94,42957.06),(94,'2018-11-05','2018-11-11',16,5,4,3,1,94035.00,10343.85,83691.15),(95,'2018-11-15','2018-11-28',20,1,2,3,0,31708.00,2853.72,28854.28),(96,'2018-11-25','2018-12-12',20,1,4,1,0,25054.00,2254.86,22799.14),(97,'2018-12-18','2018-12-30',12,7,1,1,0,54175.00,6501.00,47674.00),(98,'2018-12-19','2019-01-08',3,15,2,3,0,14353.00,1435.30,12917.70),(99,'2018-12-20','2019-01-09',4,4,3,2,1,78215.00,6257.20,71957.80);
UPDATE sales SET fulfillDate = NULL WHERE status = 3;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrepresentative`
--

DROP TABLE IF EXISTS `salesrepresentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrepresentative` (
  `salesRepresentative` char(3) NOT NULL,
  `completeName` varchar(100) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  `region` int(3) DEFAULT NULL,
  PRIMARY KEY (`salesRepresentative`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrepresentative`
--

LOCK TABLES `salesrepresentative` WRITE;
/*!40000 ALTER TABLE `salesrepresentative` DISABLE KEYS */;
INSERT INTO `salesrepresentative` VALUES ('1','Ryan Morales','2001-06-07',11),('10','Alicia Tiburcio','2014-07-22',1),('11','Kenneth Olivado','2014-11-05',13),('12','Ysabella Bolinao','2013-12-13',7),('13','Sammy Jutba','2013-11-06',14),('14','Mark Toribio','2008-10-12',2),('15','Carlos Ignacio','2008-04-01',16),('2','Raisa Ulson','2002-03-04',14),('3','Zenaida Katigbak','2010-05-06',5),('4','Lydia Feriols','2016-09-23',13),('5','Gian Yulo','2016-05-14',13),('6','Sandy Reyes','2004-08-08',3),('7','Ignacio Santos','2004-10-13',9),('8','Pauline Encarnacion','2006-12-14',16),('9','Haidee Valenzuela','2010-03-01',6);
/*!40000 ALTER TABLE `salesrepresentative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrepresentativetraining`
--

DROP TABLE IF EXISTS `salesrepresentativetraining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrepresentativetraining` (
  `salesRepresentative` char(3) NOT NULL,
  `trainingDate` date NOT NULL,
  PRIMARY KEY (`salesRepresentative`,`trainingDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrepresentativetraining`
--

LOCK TABLES `salesrepresentativetraining` WRITE;
/*!40000 ALTER TABLE `salesrepresentativetraining` DISABLE KEYS */;
INSERT INTO `salesrepresentativetraining` VALUES ('1','2010-01-10'),('1','2017-01-10'),('1','2018-05-07'),('10','2016-10-12'),('10','2018-10-12'),('11','2016-10-12'),('11','2018-10-12'),('12','2016-10-12'),('12','2018-05-07'),('12','2018-10-12'),('13','2015-10-12'),('13','2016-10-12'),('13','2018-05-07'),('14','2012-05-12'),('14','2013-05-12'),('15','2012-05-12'),('15','2013-05-12'),('2','2010-01-10'),('2','2017-01-10'),('3','2010-06-10'),('3','2017-06-10'),('4','2017-05-07'),('5','2017-05-07'),('6','2011-05-07'),('7','2011-05-07'),('8','2011-10-12'),('8','2018-10-12'),('9','2011-10-12'),('9','2018-05-07'),('9','2018-10-12');
/*!40000 ALTER TABLE `salesrepresentativetraining` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-19 20:12:03
