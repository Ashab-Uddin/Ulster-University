-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: libraryms
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `nationality` varchar(80) DEFAULT NULL,
  `biography` text,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Toby Carpenter','Mayotte','Eum exercitationem dicta ad saepe facilis. Facilis tempore omnis soluta a natus hic. Necessitatibus architecto a soluta tenetur aut repellat.'),(2,'Ms Kayleigh Davies','Martinique','Quod velit doloremque ab aliquid. Odio atque est impedit ab.\nPorro vel impedit. Repellat unde excepturi officia. Illum nesciunt amet assumenda quam.'),(3,'Mr Shane Hart','Namibia','Nisi modi nisi non architecto unde. Aperiam libero placeat. Consectetur labore quo vitae neque dicta explicabo.'),(4,'Dr Liam Ali','Malaysia','Quis vel quae. Fuga unde reiciendis nam consequuntur.'),(5,'Christopher King','Dominican Republic','Repellat dolorem porro. Velit iure nobis esse assumenda nam aliquam doloribus. Velit nobis eum odit minima qui itaque nostrum.'),(6,'Jeffrey Mason-Fraser','Thailand','Facere alias odit nihil.\nVeritatis illo recusandae amet repudiandae. Repudiandae quae pariatur maxime non modi. Omnis aperiam ducimus.'),(7,'Dr Tracy Stevenson','Svalbard & Jan Mayen Islands','Consequatur aperiam praesentium debitis ducimus.'),(8,'Dylan Robinson','French Southern Territories','Iusto nam adipisci placeat itaque inventore dolorum.'),(9,'Deborah Adams','Senegal','Error reiciendis aspernatur.'),(10,'Cameron Johnson','Saint Helena','Vitae deserunt magni nesciunt temporibus. Dolore quis repellat.');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookauthors`
--

DROP TABLE IF EXISTS `bookauthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookauthors` (
  `isbn` varchar(20) NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`isbn`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `bookauthors_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookauthors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookauthors`
--

LOCK TABLES `bookauthors` WRITE;
/*!40000 ALTER TABLE `bookauthors` DISABLE KEYS */;
INSERT INTO `bookauthors` VALUES ('978-0-8181-4306-9',1),('978-1-72950-443-7',1),('978-0-02-781214-5',2),('978-0-392-43829-2',3),('978-0-914811-43-5',3),('978-0-392-43829-2',4),('978-1-238-23771-0',4),('978-1-967139-34-7',4),('978-0-339-40244-7',5),('978-0-442-13274-3',5),('978-1-5268-5776-7',5),('978-1-66267-427-3',5),('978-1-71363-639-7',5),('978-1-66267-427-3',6),('978-0-11-601300-2',7),('978-0-15-097431-4',7),('978-1-4903-6824-5',7),('978-1-66267-427-3',7),('978-0-02-781214-5',8),('978-1-03-302658-8',8),('978-0-8181-4306-9',9),('978-0-914811-43-5',9),('978-1-5268-5776-7',10);
/*!40000 ALTER TABLE `bookauthors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookgenres`
--

DROP TABLE IF EXISTS `bookgenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookgenres` (
  `isbn` varchar(20) NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`isbn`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `bookgenres_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookgenres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookgenres`
--

LOCK TABLES `bookgenres` WRITE;
/*!40000 ALTER TABLE `bookgenres` DISABLE KEYS */;
INSERT INTO `bookgenres` VALUES ('978-1-5268-5776-7',1),('978-1-72950-443-7',1),('978-0-02-781214-5',2),('978-0-392-43829-2',2),('978-0-8181-4306-9',3),('978-1-03-302658-8',3),('978-0-339-40244-7',4),('978-0-392-43829-2',4),('978-0-442-13274-3',4),('978-0-914811-43-5',4),('978-1-66267-427-3',4),('978-1-71363-639-7',4),('978-0-11-601300-2',5),('978-0-15-097431-4',6),('978-0-914811-43-5',6),('978-1-238-23771-0',6),('978-1-4903-6824-5',6),('978-1-72950-443-7',6),('978-1-967139-34-7',6);
/*!40000 ALTER TABLE `bookgenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `isbn` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `publication_year` year NOT NULL,
  `copies_available` int NOT NULL DEFAULT '0',
  `status` enum('Available','Repair','Lost') NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`isbn`),
  CONSTRAINT `chk_copies_nonneg` CHECK ((`copies_available` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('978-0-02-781214-5','Autem illum',1939,6,'Available'),('978-0-11-601300-2','Nostrum explicabo',1921,2,'Available'),('978-0-15-097431-4','Cum sequi',1979,4,'Available'),('978-0-339-40244-7','Deleniti fugit',1959,4,'Available'),('978-0-392-43829-2','Voluptatum ipsum facere',2021,5,'Available'),('978-0-442-13274-3','Occaecati occaecati et',1901,7,'Available'),('978-0-8181-4306-9','Officia commodi nam',1919,6,'Available'),('978-0-914811-43-5','Tempora in soluta',1914,4,'Available'),('978-1-03-302658-8','Necessitatibus',1943,10,'Available'),('978-1-238-23771-0','Adipisci veniam',1928,10,'Available'),('978-1-4903-6824-5','Delectus itaque',1946,5,'Available'),('978-1-5268-5776-7','Velit nihil',1974,10,'Available'),('978-1-66267-427-3','Nostrum autem fuga',1932,1,'Available'),('978-1-71363-639-7','Similique similique quia',1999,0,'Repair'),('978-1-72950-443-7','Facere magni',2014,7,'Available'),('978-1-967139-34-7','Beatae voluptates',1996,10,'Available');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowings`
--

DROP TABLE IF EXISTS `borrowings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowings` (
  `borrow_id` int NOT NULL,
  `member_id` int NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `member_id` (`member_id`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `borrowings_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `borrowings_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_due_after_borrow` CHECK ((`due_date` >= `borrow_date`)),
  CONSTRAINT `chk_return_after_borrow` CHECK (((`return_date` is null) or (`return_date` >= `borrow_date`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowings`
--

LOCK TABLES `borrowings` WRITE;
/*!40000 ALTER TABLE `borrowings` DISABLE KEYS */;
INSERT INTO `borrowings` VALUES (1,17,'978-1-71363-639-7','2025-01-14','2025-01-28','2025-02-03'),(2,24,'978-0-02-781214-5','2025-02-21','2025-03-07',NULL),(3,6,'978-1-238-23771-0','2025-03-26','2025-04-09',NULL),(4,24,'978-1-967139-34-7','2025-03-04','2025-03-18','2025-04-01'),(5,1,'978-0-392-43829-2','2025-01-07','2025-01-21','2025-01-30'),(6,15,'978-1-03-302658-8','2025-01-03','2025-01-17',NULL),(7,25,'978-0-11-601300-2','2024-12-30','2025-01-13',NULL),(8,12,'978-1-72950-443-7','2025-02-13','2025-02-27','2025-03-03'),(9,13,'978-0-339-40244-7','2025-03-29','2025-04-12','2025-04-10'),(10,17,'978-1-238-23771-0','2025-03-22','2025-04-05','2025-04-01'),(11,14,'978-0-02-781214-5','2025-02-01','2025-02-15','2025-02-28'),(12,25,'978-0-442-13274-3','2025-02-03','2025-02-17','2025-02-28'),(13,29,'978-1-72950-443-7','2025-03-05','2025-03-19','2025-03-27'),(14,2,'978-1-72950-443-7','2025-03-21','2025-04-04','2025-04-16'),(15,20,'978-1-5268-5776-7','2025-02-02','2025-02-16',NULL),(16,27,'978-0-914811-43-5','2025-03-29','2025-04-12','2025-04-16'),(17,25,'978-0-914811-43-5','2025-01-26','2025-02-09',NULL),(18,24,'978-1-72950-443-7','2025-02-17','2025-03-03','2025-03-02'),(19,25,'978-1-72950-443-7','2025-01-07','2025-01-21','2025-01-27'),(20,17,'978-0-02-781214-5','2025-03-02','2025-03-16','2025-03-12'),(21,9,'978-0-8181-4306-9','2025-03-07','2025-03-21','2025-03-29'),(22,25,'978-0-8181-4306-9','2025-02-04','2025-02-18','2025-02-26'),(23,25,'978-0-442-13274-3','2025-03-01','2025-03-15','2025-03-19'),(24,26,'978-1-66267-427-3','2025-01-27','2025-02-10','2025-02-24'),(25,15,'978-0-02-781214-5','2025-01-14','2025-01-28','2025-01-24'),(26,29,'978-1-4903-6824-5','2025-02-24','2025-03-10','2025-03-14'),(27,25,'978-1-238-23771-0','2025-01-03','2025-01-17','2025-01-23'),(28,7,'978-0-392-43829-2','2025-03-21','2025-04-04','2025-04-07'),(29,4,'978-0-15-097431-4','2025-02-17','2025-03-03',NULL),(30,11,'978-0-11-601300-2','2025-01-29','2025-02-12','2025-02-15'),(31,22,'978-0-8181-4306-9','2025-03-23','2025-04-06',NULL),(32,20,'978-0-15-097431-4','2025-03-26','2025-04-09',NULL),(33,28,'978-0-02-781214-5','2025-03-17','2025-03-31','2025-04-14'),(34,22,'978-0-442-13274-3','2025-03-18','2025-04-01','2025-04-10'),(35,6,'978-0-339-40244-7','2025-01-07','2025-01-21',NULL),(36,11,'978-0-442-13274-3','2025-02-13','2025-02-27','2025-02-28'),(37,22,'978-0-11-601300-2','2025-01-21','2025-02-04','2025-02-13'),(38,15,'978-0-02-781214-5','2025-02-25','2025-03-11',NULL),(39,24,'978-1-5268-5776-7','2025-01-02','2025-01-16','2025-01-17'),(40,15,'978-0-11-601300-2','2025-02-11','2025-02-25',NULL),(41,6,'978-0-914811-43-5','2025-03-11','2025-03-25',NULL),(42,2,'978-0-11-601300-2','2025-03-02','2025-03-16','2025-03-29'),(43,1,'978-1-66267-427-3','2025-02-04','2025-02-18','2025-02-28'),(44,19,'978-1-4903-6824-5','2025-01-11','2025-01-25',NULL),(45,11,'978-1-238-23771-0','2025-03-22','2025-04-05','2025-04-11'),(46,1,'978-0-02-781214-5','2025-01-26','2025-02-09',NULL),(47,3,'978-0-442-13274-3','2025-01-04','2025-01-18','2025-01-26'),(48,19,'978-1-72950-443-7','2025-03-09','2025-03-23','2025-03-27'),(49,23,'978-1-66267-427-3','2025-03-24','2025-04-07',NULL),(50,24,'978-0-11-601300-2','2025-03-12','2025-03-26','2025-03-22'),(100,100,NULL,'2025-04-01','2025-04-15',NULL);
/*!40000 ALTER TABLE `borrowings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(60) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_name` (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (5,'Biography'),(1,'Fiction'),(4,'History'),(2,'Non-Fiction'),(3,'Science'),(6,'Technology');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Julian Collier','fadams@yahoo.com','+44 7979552484','52 Kyle harbor, West Eileen, IP29 7YP'),(2,'Dorothy Dixon','stewarthayes@cooke.co.uk','+44 7566058564','Flat 4\nDoyle stravenue, South Simon, S26 1TW'),(3,'Ian Thomas-Cooke','qfox@outlook.com','+44 7563220819','33 Gibson road, Port Louise, AL5R 4ZY'),(4,'Mr Bryan Brooks','lloydscott@yahoo.com','+44 7465304148','Flat 62\nDixon path, East Joelbury, SW04 0RD'),(6,'Mrs Rosie Clarke','ylee@bevan-moore.com','+44 7272123387','Studio 7\nConor estates, Barrettfort, E8 9QP'),(7,'Charles Baldwin-Poole','frankmiller@roberts.net','+44 7583918565','35 Morris ways, South Lawrenceside, E5K 8EU'),(9,'Zoe Dean','rachael88@webster.com','+44 7101766411','393 Aaron street, Lindseyhaven, UB21 9FA'),(11,'Patricia Jones','saunderskieran@outlook.com','+44 7369727476','1 Jeffrey trafficway, East Dean, WS9X 7YN'),(12,'Miss Kathleen Dickinson','kevinholmes@outlook.com','+44 7782311949','Flat 43f\nRose course, Allenfurt, DL63 5YF'),(13,'Leanne Baxter','terencewebb@outlook.com','+44 7761292560','Studio 1\nJake motorway, Leighbury, SM3 3ED'),(14,'Mr Craig Morton','lorraine70@newton.com','+44 7141563739','Flat 05\nDamien keys, Gregorytown, B6D 6BS'),(15,'Scott White','robinbaker@lewis.com','+44 7816816653','Flat 11\nJoshua divide, South Lynnstad, N32 1QW'),(17,'Miss Mary Fuller','donnellyvictor@hotmail.co.uk','+44 7837740780','8 Clark shores, East Jessica, NW53 9TY'),(19,'Fiona Wilson','pattersontoby@gmail.com','+44 7235105220','Studio 78\nWoodward mission, West Lynda, W9 8XL'),(20,'Bradley Williams','wardkirsty@hotmail.co.uk','+44 7837192644','Studio 72\nLewis fork, New Tony, M8 6UB'),(22,'Sally Noble-Dickinson','csummers@ali.com','+44 7112244741','8 Sharon land, South Ryan, E6B 4DT'),(23,'Kimberley Brown','amberbryant@jenkins.net','+44 7592971308','1 Pope summit, New Benjaminfurt, B43 1RY'),(24,'Damian Mills','jakewells@saunders.com','+44 7256813716','Studio 33\nDavis extensions, East Hollie, CM5B 4BL'),(25,'Sandra Storey','charlotteedwards@burton.info','+44 7109096529','Flat 78\nLewis tunnel, New Linda, NE68 8FH'),(26,'Tom Sykes','justin71@lowe.com','+44 7600731216','Flat 7\nJones mountains, Lynntown, NR3X 2JA'),(27,'Jonathan Barnes','cmurray@outlook.com','+44 7750142818','Studio 9\nDale hollow, Stephenmouth, G97 7RW'),(28,'Sara Thompson','saundersvalerie@singh-nash.com','+44 7826447518','656 Brown path, West Charlotte, TD47 4DT'),(29,'Dr Julie Murray','daniellebird@newman.net','+44 7263238279','3 Harris bypass, West Joanfort, W2 8AA'),(100,'Jidan','jidan100@gmail.com','+44 1234567890','123 Test Street');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-25 18:02:11
