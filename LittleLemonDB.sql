-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `IDBooking` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Time_IN` time DEFAULT NULL,
  `Time_OUT` time DEFAULT NULL,
  `Customer_IDCustomer` int NOT NULL,
  PRIMARY KEY (`IDBooking`,`Customer_IDCustomer`),
  KEY `fk_Booking_Customer_idx` (`Customer_IDCustomer`),
  CONSTRAINT `fk_Booking_Customer` FOREIGN KEY (`Customer_IDCustomer`) REFERENCES `customer` (`IDCustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2024-05-04','04:32:00',NULL,1),(2,'2024-02-29','01:30:00','03:00:00',2),(3,'2023-11-11','04:32:00','05:57:00',3),(4,'2022-09-15','09:15:00',NULL,4),(5,'2023-12-31','12:05:00','02:00:00',5);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_has_table`
--

DROP TABLE IF EXISTS `booking_has_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_has_table` (
  `Booking_IDBooking` int NOT NULL,
  `Booking_Customer_IDCustomer` int NOT NULL,
  `Taable_IDTablee` int NOT NULL,
  PRIMARY KEY (`Booking_IDBooking`,`Booking_Customer_IDCustomer`,`Taable_IDTablee`),
  KEY `fk_Booking_has_Table_Table1_idx` (`Taable_IDTablee`),
  KEY `fk_Booking_has_Table_Booking1_idx` (`Booking_IDBooking`,`Booking_Customer_IDCustomer`),
  CONSTRAINT `fk_Booking_has_Table_Booking1` FOREIGN KEY (`Booking_IDBooking`, `Booking_Customer_IDCustomer`) REFERENCES `booking` (`IDBooking`, `Customer_IDCustomer`),
  CONSTRAINT `fk_Booking_has_Table_Table1` FOREIGN KEY (`Taable_IDTablee`) REFERENCES `taable` (`IDTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_has_table`
--

LOCK TABLES `booking_has_table` WRITE;
/*!40000 ALTER TABLE `booking_has_table` DISABLE KEYS */;
INSERT INTO `booking_has_table` VALUES (3,3,1),(5,5,2),(4,4,3),(1,1,4),(2,2,5);
/*!40000 ALTER TABLE `booking_has_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `IDCustomer` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(70) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`IDCustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Doe','mariochor@yopmail.com'),(2,'Jane','Smith','haskka@yopmail.com'),(3,'Alice','Johnson','ulmiale@yopmail.com'),(4,'Bob','Brown','bashuvar@yopmail.com'),(5,'Charlie','Baker','mar_Sarah@yopmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_status`
--

DROP TABLE IF EXISTS `delivery_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_status` (
  `Delivery_Status_ID` int NOT NULL AUTO_INCREMENT,
  `Delivery_Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Delivery_Status_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_status`
--

LOCK TABLES `delivery_status` WRITE;
/*!40000 ALTER TABLE `delivery_status` DISABLE KEYS */;
INSERT INTO `delivery_status` VALUES (1,'Pending'),(3,'Delivered'),(4,'Cancelled');
/*!40000 ALTER TABLE `delivery_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_price`
--

DROP TABLE IF EXISTS `menu_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_price` (
  `idPrice` int NOT NULL AUTO_INCREMENT,
  `Price` int DEFAULT NULL,
  `Menu_Item` varchar(45) DEFAULT NULL,
  `foreing_IDMenuName` int NOT NULL,
  PRIMARY KEY (`idPrice`,`foreing_IDMenuName`),
  KEY `foreign` (`foreing_IDMenuName`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_price`
--

LOCK TABLES `menu_price` WRITE;
/*!40000 ALTER TABLE `menu_price` DISABLE KEYS */;
INSERT INTO `menu_price` VALUES (41,8,'Bruschetta',1),(42,15,'Pasta Carbonara',1),(43,10,'Red Wine',1),(44,5,'Gelato',1),(45,7,'Nachos with Cheese',2),(46,12,'Tacos al Pastor',2),(47,9,'Margarita',2),(48,4,'Churros',2),(49,6,'Miso Soup',3),(50,14,'Sushi Nigiri',3),(51,8,'Sake',3),(52,3,'Mochi',3),(53,5,'Samosas',4),(54,13,'Butter Chicken',4),(55,4,'Lassi',4),(56,4,'Gulab Jamun',4),(57,7,'Fried Wontons',5),(58,10,'Fried Rice',5),(59,3,'Green Tea',5),(60,2,'Fortune Cookies',5),(61,7,'Tom Yum Soup',6),(62,12,'Pad Thai',6),(63,4,'Coconut Juice',6),(64,6,'Mango Sticky Rice',6),(65,12,'Escargots',7),(66,20,'Steak Frites',7),(67,12,'White Wine',7),(68,6,'Macarons',7),(69,15,'Iberian Ham',8),(70,18,'Paella',8),(71,9,'Sangria',8),(72,6,'Cheesecake',8),(73,6,'Tzatziki with Pita',9),(74,10,'Souvlaki',9),(75,7,'Ouzo',9),(76,4,'Baklava',9),(77,12,'Hamburger with Fries',10),(78,10,'Mac and Cheese',10),(79,3,'Coca-Cola',10),(80,3,'Brownie',10);
/*!40000 ALTER TABLE `menu_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuname`
--

DROP TABLE IF EXISTS `menuname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuname` (
  `idMenuName` int NOT NULL AUTO_INCREMENT,
  `Name_of_Menu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMenuName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuname`
--

LOCK TABLES `menuname` WRITE;
/*!40000 ALTER TABLE `menuname` DISABLE KEYS */;
INSERT INTO `menuname` VALUES (1,'italian'),(2,'american'),(3,'mexican'),(4,'japanese'),(5,'indian'),(6,'chinese'),(7,'thai'),(8,'french'),(9,'spanish'),(10,'greek');
/*!40000 ALTER TABLE `menuname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Quantity` int DEFAULT NULL,
  `TotalCost` int DEFAULT NULL,
  `Staff_Information_Staff_InformationID` int NOT NULL,
  `Booking_has_Table_Booking_IDBooking` int NOT NULL,
  `Booking_has_Table_Booking_Customer_IDCustomer` int NOT NULL,
  `Booking_has_Table_Taable_IDTablee` int NOT NULL,
  PRIMARY KEY (`OrderID`,`Staff_Information_Staff_InformationID`,`Booking_has_Table_Booking_IDBooking`,`Booking_has_Table_Booking_Customer_IDCustomer`,`Booking_has_Table_Taable_IDTablee`),
  KEY `fk_Orders_Staff_Information1_idx` (`Staff_Information_Staff_InformationID`),
  KEY `fk_Orders_Booking_has_Table1_idx` (`Booking_has_Table_Booking_IDBooking`,`Booking_has_Table_Booking_Customer_IDCustomer`,`Booking_has_Table_Taable_IDTablee`),
  CONSTRAINT `fk_Orders_Booking_has_Table1` FOREIGN KEY (`Booking_has_Table_Booking_IDBooking`, `Booking_has_Table_Booking_Customer_IDCustomer`, `Booking_has_Table_Taable_IDTablee`) REFERENCES `booking_has_table` (`Booking_IDBooking`, `Booking_Customer_IDCustomer`, `Taable_IDTablee`),
  CONSTRAINT `fk_Orders_Staff_Information1` FOREIGN KEY (`Staff_Information_Staff_InformationID`) REFERENCES `staff_information` (`Staff_InformationID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (28,3,45,2,1,1,4),(29,6,200,2,1,1,4),(30,2,10,2,1,1,4),(31,3,24,2,1,1,4),(32,4,24,2,1,1,4),(33,17,204,2,4,4,3),(34,2,14,2,4,4,3),(35,7,63,2,4,4,3),(36,38,152,2,4,4,3),(37,4,12,2,4,4,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_menu`
--

DROP TABLE IF EXISTS `orders_has_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_menu` (
  `Menu_Price_idPrice` int NOT NULL,
  `orders_OrderID` int NOT NULL,
  `orders_Staff_Information_Staff_InformationID` int NOT NULL,
  `orders_Booking_has_Table_Booking_IDBooking` int NOT NULL,
  `orders_Booking_has_Table_Booking_Customer_IDCustomer` int NOT NULL,
  `orders_Booking_has_Table_Taable_IDTablee` int NOT NULL,
  PRIMARY KEY (`Menu_Price_idPrice`,`orders_OrderID`,`orders_Staff_Information_Staff_InformationID`,`orders_Booking_has_Table_Booking_IDBooking`,`orders_Booking_has_Table_Booking_Customer_IDCustomer`,`orders_Booking_has_Table_Taable_IDTablee`),
  KEY `fk_orders_has_menu_Menu Price1_idx` (`Menu_Price_idPrice`),
  KEY `fk_orders_has_menu_orders1_idx` (`orders_OrderID`,`orders_Staff_Information_Staff_InformationID`,`orders_Booking_has_Table_Booking_IDBooking`,`orders_Booking_has_Table_Booking_Customer_IDCustomer`,`orders_Booking_has_Table_Taable_IDTablee`),
  CONSTRAINT `fk_orders_has_menu_Menu Price1` FOREIGN KEY (`Menu_Price_idPrice`) REFERENCES `menu_price` (`idPrice`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orders_has_menu_orders1` FOREIGN KEY (`orders_OrderID`, `orders_Staff_Information_Staff_InformationID`, `orders_Booking_has_Table_Booking_IDBooking`, `orders_Booking_has_Table_Booking_Customer_IDCustomer`, `orders_Booking_has_Table_Taable_IDTablee`) REFERENCES `orders` (`OrderID`, `Staff_Information_Staff_InformationID`, `Booking_has_Table_Booking_IDBooking`, `Booking_has_Table_Booking_Customer_IDCustomer`, `Booking_has_Table_Taable_IDTablee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_menu`
--

LOCK TABLES `orders_has_menu` WRITE;
/*!40000 ALTER TABLE `orders_has_menu` DISABLE KEYS */;
INSERT INTO `orders_has_menu` VALUES (41,31,2,1,1,4),(42,28,2,1,1,4),(43,29,2,1,1,4),(44,30,2,1,1,4),(45,34,2,4,4,3),(46,33,2,4,4,3),(47,35,2,4,4,3),(48,36,2,4,4,3),(72,32,2,1,1,4),(79,37,2,4,4,3);
/*!40000 ALTER TABLE `orders_has_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff_information`
--

DROP TABLE IF EXISTS `staff_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_information` (
  `Staff_InformationID` int NOT NULL AUTO_INCREMENT,
  `Staff_Salary` int DEFAULT NULL,
  `Staff_Roll` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Staff_InformationID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_information`
--

LOCK TABLES `staff_information` WRITE;
/*!40000 ALTER TABLE `staff_information` DISABLE KEYS */;
INSERT INTO `staff_information` VALUES (1,45000,'Head Chef'),(2,25000,'Waiter - Waitress'),(3,20000,'Kitchen Assistant'),(4,40000,'Manager');
/*!40000 ALTER TABLE `staff_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_history`
--

DROP TABLE IF EXISTS `status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_history` (
  `ID_Status_history` int NOT NULL AUTO_INCREMENT,
  `Date_of_status` datetime DEFAULT NULL,
  `delivery_status_Delivery_Status_ID` int NOT NULL,
  `orders_OrderID` int NOT NULL,
  `orders_Staff_Information_Staff_InformationID` int NOT NULL,
  `orders_Booking_has_Table_Booking_IDBooking` int NOT NULL,
  `orders_Booking_has_Table_Booking_Customer_IDCustomer` int NOT NULL,
  `orders_Booking_has_Table_Taable_IDTablee` int NOT NULL,
  PRIMARY KEY (`ID_Status_history`,`delivery_status_Delivery_Status_ID`,`orders_OrderID`,`orders_Staff_Information_Staff_InformationID`,`orders_Booking_has_Table_Booking_IDBooking`,`orders_Booking_has_Table_Booking_Customer_IDCustomer`,`orders_Booking_has_Table_Taable_IDTablee`),
  KEY `fk_table1_orders1_idx` (`orders_OrderID`,`orders_Staff_Information_Staff_InformationID`,`orders_Booking_has_Table_Booking_IDBooking`,`orders_Booking_has_Table_Booking_Customer_IDCustomer`,`orders_Booking_has_Table_Taable_IDTablee`),
  KEY `fk_table1_deliveryStatus1_idx` (`delivery_status_Delivery_Status_ID`),
  CONSTRAINT `fk_table1_delivery_status1` FOREIGN KEY (`delivery_status_Delivery_Status_ID`) REFERENCES `delivery_status` (`Delivery_Status_ID`),
  CONSTRAINT `fk_table1_orders1` FOREIGN KEY (`orders_OrderID`, `orders_Staff_Information_Staff_InformationID`, `orders_Booking_has_Table_Booking_IDBooking`, `orders_Booking_has_Table_Booking_Customer_IDCustomer`, `orders_Booking_has_Table_Taable_IDTablee`) REFERENCES `orders` (`OrderID`, `Staff_Information_Staff_InformationID`, `Booking_has_Table_Booking_IDBooking`, `Booking_has_Table_Booking_Customer_IDCustomer`, `Booking_has_Table_Taable_IDTablee`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_history`
--

LOCK TABLES `status_history` WRITE;
/*!40000 ALTER TABLE `status_history` DISABLE KEYS */;
INSERT INTO `status_history` VALUES (10,'2024-10-17 04:45:18',1,28,2,1,1,4),(11,'2024-10-17 04:45:18',1,29,2,1,1,4),(12,'2024-10-17 04:45:18',1,30,2,1,1,4),(13,'2024-10-17 04:45:18',1,31,2,1,1,4),(14,'2024-10-17 04:45:18',1,32,2,1,1,4),(15,'2024-10-17 04:45:18',1,33,2,4,4,3),(16,'2024-10-17 04:45:18',1,34,2,4,4,3),(17,'2024-10-17 04:45:18',1,35,2,4,4,3),(18,'2024-10-17 04:45:18',1,36,2,4,4,3),(19,'2024-10-17 04:45:18',1,37,2,4,4,3),(20,'2024-10-17 04:47:10',3,28,2,1,1,4),(21,'2024-10-17 04:48:07',3,29,2,1,1,4),(22,'2024-10-17 04:48:07',3,30,2,1,1,4),(23,'2024-10-17 04:48:07',3,31,2,1,1,4),(24,'2024-10-17 04:48:07',4,32,2,1,1,4),(25,'2024-10-17 04:48:07',4,33,2,4,4,3),(26,'2024-10-17 04:48:07',4,34,2,4,4,3),(27,'2024-10-17 04:48:07',3,35,2,4,4,3),(28,'2024-10-17 04:48:07',3,36,2,4,4,3),(29,'2024-10-18 06:51:41',4,28,2,1,1,4),(32,'2024-10-18 07:03:15',4,28,2,1,1,4),(33,'2024-10-18 07:06:27',4,35,2,4,4,3),(34,'2024-10-18 07:08:35',4,31,2,1,1,4),(35,'2024-10-18 07:09:29',4,29,2,1,1,4);
/*!40000 ALTER TABLE `status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taable`
--

DROP TABLE IF EXISTS `taable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taable` (
  `IDTable` int NOT NULL AUTO_INCREMENT,
  `Tablee` int DEFAULT NULL,
  PRIMARY KEY (`IDTable`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taable`
--

LOCK TABLES `taable` WRITE;
/*!40000 ALTER TABLE `taable` DISABLE KEYS */;
INSERT INTO `taable` VALUES (1,501),(2,502),(3,503),(4,504),(5,505);
/*!40000 ALTER TABLE `taable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `task_3`
--

DROP TABLE IF EXISTS `task_3`;
/*!50001 DROP VIEW IF EXISTS `task_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `task_3` AS SELECT 
 1 AS `Name_of_Menu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `´task_2´`
--

DROP TABLE IF EXISTS `´task_2´`;
/*!50001 DROP VIEW IF EXISTS `´task_2´`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `´task_2´` AS SELECT 
 1 AS `IDCustomer`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `OrderID`,
 1 AS `TotalCost`,
 1 AS `Name_of_Menu`,
 1 AS `Menu_Item`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`proyect_cour`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`Quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `task_3`
--

/*!50001 DROP VIEW IF EXISTS `task_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`proyect_cour`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `task_3` AS select `menuname`.`Name_of_Menu` AS `Name_of_Menu` from (((`orders` join `orders_has_menu` on((`orders`.`OrderID` = `orders_has_menu`.`orders_OrderID`))) join `menu_price` on((`orders_has_menu`.`Menu_Price_idPrice` = `menu_price`.`idPrice`))) join `menuname` on((`menu_price`.`foreing_IDMenuName` = `menuname`.`idMenuName`))) where (`orders`.`Quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `´task_2´`
--

/*!50001 DROP VIEW IF EXISTS `´task_2´`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`proyect_cour`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `´task_2´` AS select `customer`.`IDCustomer` AS `IDCustomer`,`customer`.`FirstName` AS `FirstName`,`customer`.`LastName` AS `LastName`,`orders`.`OrderID` AS `OrderID`,`orders`.`TotalCost` AS `TotalCost`,`menuname`.`Name_of_Menu` AS `Name_of_Menu`,`menu_price`.`Menu_Item` AS `Menu_Item` from ((((((`customer` join `booking` on((`customer`.`IDCustomer` = `booking`.`Customer_IDCustomer`))) join `booking_has_table` on(((`booking`.`IDBooking` = `booking_has_table`.`Booking_IDBooking`) and (`booking`.`Customer_IDCustomer` = `booking_has_table`.`Booking_Customer_IDCustomer`)))) join `orders` on(((`booking_has_table`.`Booking_IDBooking` = `orders`.`Booking_has_Table_Booking_IDBooking`) and (`booking_has_table`.`Booking_Customer_IDCustomer` = `orders`.`Booking_has_Table_Booking_Customer_IDCustomer`) and (`booking_has_table`.`Taable_IDTablee` = `orders`.`Booking_has_Table_Taable_IDTablee`)))) join `orders_has_menu` on(((`orders`.`Booking_has_Table_Booking_IDBooking` = `orders_has_menu`.`orders_Booking_has_Table_Booking_IDBooking`) and (`orders`.`Booking_has_Table_Booking_Customer_IDCustomer` = `orders_has_menu`.`orders_Booking_has_Table_Booking_Customer_IDCustomer`) and (`orders`.`Booking_has_Table_Taable_IDTablee` = `orders_has_menu`.`orders_Booking_has_Table_Taable_IDTablee`)))) join `menu_price` on((`orders_has_menu`.`Menu_Price_idPrice` = `menu_price`.`idPrice`))) join `menuname` on((`menu_price`.`foreing_IDMenuName` = `menuname`.`idMenuName`))) where (`orders`.`TotalCost` > 150) order by `orders`.`TotalCost` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18  7:12:33
