-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: moviedb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `Id` int(11) NOT NULL,
  `DateOpened` date DEFAULT NULL,
  `Type` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Customer_idx` (`Id`),
  KEY `Customer_idx1` (`Customer`),
  CONSTRAINT `Customer` FOREIGN KEY (`Customer`) REFERENCES `customer` (`CustId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'2017-12-06','Unlimited-2',444444444),(2,'2018-11-06','Limited',555555555),(3,'2016-05-06','Limited',666666666),(4,'2019-12-06','Limited',777777777);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `Id` int(11) NOT NULL,
  `Name` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Age` int(11) NOT NULL,
  `M/F` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Al Pacino',63,'M',5),(2,'Tim Robbins',53,'M',2),(3,'Kim',33,'M',4);
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appearedin`
--

DROP TABLE IF EXISTS `appearedin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appearedin` (
  `ActorId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  PRIMARY KEY (`ActorId`,`MovieId`),
  KEY `MovieId_idx` (`MovieId`),
  KEY `MovieId_idx2` (`MovieId`),
  CONSTRAINT `ActorId` FOREIGN KEY (`ActorId`) REFERENCES `actor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearedin`
--

LOCK TABLES `appearedin` WRITE;
/*!40000 ALTER TABLE `appearedin` DISABLE KEYS */;
INSERT INTO `appearedin` VALUES (1,1),(2,1),(3,1),(1,3),(3,4),(3,5);
/*!40000 ALTER TABLE `appearedin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustId` int(11) NOT NULL,
  `Email` char(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `CreditCardNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustId`),
  CONSTRAINT `CustId` FOREIGN KEY (`CustId`) REFERENCES `person` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (444444444,'cust@gmail.com',5,'5555555555555555'),(555555555,'cust2@gmail.com',5,'5555555555555555'),(666666666,'cust3@gmail.com',5,'5555555555555555'),(777777777,'cust2@gmail.com',5,'5555555555555555');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmpId` int(11) NOT NULL,
  `SSN` int(11) DEFAULT NULL,
  `StartDate` varchar(25) DEFAULT NULL,
  `HourlyRate` float DEFAULT NULL,
  `revenue` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EmpId`),
  KEY `SSN_idx` (`SSN`),
  CONSTRAINT `SSN` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (111111111,111111111,'2018-12-05',30.7,NULL),(222222222,222222222,'2019-11-05',12,NULL),(333333333,333333333,'3333-33-33',33,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `ZipCode` int(11) NOT NULL,
  `City` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `State` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`ZipCode`,`Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (11890,'Hicksville','NY','952 Skyline Dr'),(33333,'Fount','MA','33 Rivendell St'),(44444,'Paradise','CA','83 Live'),(45212,'Stony Brook','NJ','52 Midwood St'),(55555,'Sky','NY','982 heaven'),(66666,'Long Island','NY','2362 Highway'),(77777,'Tree','MA','293 Paper');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`username`,`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('333@33.com','33','customerRepresentative'),('cust2@gmail.com','asdf','customer'),('cust3@gmail.com','asdf','customer'),('cust4@gmail.com','asdf','customer'),('cust@gmail.com','asdf','customer'),('dg@gmail.com','asdf','customerRepresentative'),('representative1@gmail.com','asdf','customerRepresentative'),('richie@gmail.com','asdf','manager');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `Id` int(11) NOT NULL,
  `Name` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Type` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `DistrFee` int(11) DEFAULT NULL,
  `NumCopies` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'The Godfather','Drama',5,10000,3),(2,'Shawshank Redemption','Drama',4,1000,2),(3,'Borat','Comedy',3,500,1),(4,'Korean War','War',4,500,1),(5,'The Godmother','Comedy',4,500,3),(6,'Aladin','Drama',4,500,3),(7,'Frozen','Drama',4,500,3),(8,'Harry potter','Fantasy',5,555,5);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieorder`
--

DROP TABLE IF EXISTS `movieorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieorder` (
  `MovieId` int(11) NOT NULL,
  `NumOrders` int(11) NOT NULL,
  PRIMARY KEY (`MovieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieorder`
--

LOCK TABLES `movieorder` WRITE;
/*!40000 ALTER TABLE `movieorder` DISABLE KEYS */;
INSERT INTO `movieorder` VALUES (1,500),(2,3400),(3,4000),(4,5000),(5,222),(6,111),(7,11),(8,1);
/*!40000 ALTER TABLE `movieorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieq`
--

DROP TABLE IF EXISTS `movieq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieq` (
  `AccountId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`,`MovieId`),
  KEY `MovieId_idx` (`MovieId`),
  CONSTRAINT `AccountId2` FOREIGN KEY (`AccountId`) REFERENCES `account` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MovieId2` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieq`
--

LOCK TABLES `movieq` WRITE;
/*!40000 ALTER TABLE `movieq` DISABLE KEYS */;
/*!40000 ALTER TABLE `movieq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Id` int(11) NOT NULL,
  `DateTime` datetime DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2009-11-11 10:00:00','2009-11-14'),(2,'2009-11-11 18:15:00',NULL),(3,'2009-11-12 09:30:00',NULL),(4,'2009-11-21 22:22:00',NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `SSN` int(11) NOT NULL,
  `LastName` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FirstName` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Address` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `ZipCode_idx` (`ZipCode`),
  CONSTRAINT `ZipCode` FOREIGN KEY (`ZipCode`) REFERENCES `location` (`ZipCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (111111111,'Mcgriger','DG','952 Skyline Dr',11890,'3527639084','dg@gmail.com'),(222222222,'Sentative','Repre','52 Midwood St',45212,'2129890374','representative1@gmail.com'),(333333333,'Smith','Michael','33 Rivendell St',33333,'3333333333','333@33.com'),(444444444,'Customer','First','83 Live',44444,'4444444444','cust@gmail.com'),(555555555,'Customer','Second','982 heaven',55555,'5555555555','cust2@gmail.com'),(666666666,'Customer','Third','2362 Highway',66666,'6666666666','cust3@gmail.com'),(777777777,'Customer','Fifth','293 Paper',77777,'7777777777','cust4@gmail.com');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `AccountId` int(11) NOT NULL,
  `CustRepId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `MovieId` int(11) NOT NULL,
  PRIMARY KEY (`AccountId`,`CustRepId`,`OrderId`,`MovieId`),
  KEY `MovieId_idx` (`MovieId`),
  KEY `OrderId2_idx` (`OrderId`),
  CONSTRAINT `AccountId` FOREIGN KEY (`AccountId`) REFERENCES `account` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MovieId` FOREIGN KEY (`MovieId`) REFERENCES `movie` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderId2` FOREIGN KEY (`OrderId`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,1111111111,1,1),(1,1111111111,2,2),(3,222222222,4,2),(1,333333333,3,3),(3,1111111111,1,3),(2,1111111111,1,4),(2,333333333,2,5),(1,222222222,4,8),(2,333333333,3,8);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-06  1:57:16
