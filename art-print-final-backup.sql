-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: art_print_final
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL,
  `artist_first_name` varchar(100) NOT NULL,
  `artist_last_name` varchar(100) NOT NULL,
  `artist_alias` varchar(100) DEFAULT NULL,
  `artist_email_address` varchar(100) NOT NULL,
  `artist_phone_number` varchar(20) DEFAULT NULL,
  `artist_bio` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`artist_id`),
  UNIQUE KEY `artist_email_address` (`artist_email_address`),
  UNIQUE KEY `artist_alias` (`artist_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Tim','Bisley','Timbo','tim.bisley@example.com','123 456 7890','A struggling comic book artist.'),(2,'Daisy','Steenkamp','Daisy','daisy.steenkamp@example.com','987 654 3210','An aspiring writer and aspiring everything else.'),(3,'Brian','Topp','Brian','brian.topp@example.com','765 432 1098','An eccentric artist.'),(4,'Mike','Watt','Mike','mike.watt@example.com','555 123 4567','A weapon enthusiast and lover of military hardware.'),(5,'Marsha','Klein','Marsha','marsha.klein@example.com','222 333 4444','A quirky landlady with a taste for alcohol.'),(6,'Tyres','O\'Leary','Tyres','tyres.oleary@example.com','777 888 9999','A hyperactive bicycle messenger.'),(7,'Sophie','Challis','Sophie','sophie.challis@example.com',NULL,NULL),(8,'Twist','Morgan','Twist','twist.morgan@example.com','123 987 6543','Fashionable and trendy.'),(9,'Duane','Benzie','Duane','duane.benzie@example.com','987 654 1234','An eccentric conceptual artist.'),(10,'Molly','Parker','Molly','molly.parker@example.com','555 789 1234','A free-spirited musician and artist.');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `customer_address_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `building_num_or_name` varchar(50) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `post_town` varchar(100) NOT NULL,
  `postcode` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_address_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
INSERT INTO `customer_addresses` VALUES (1,1,'12','High Street','London','SW1A 1AA'),(2,2,'45','Park Avenue','Manchester','M1 2AB'),(3,3,'78','Baker Street','Birmingham','B2 3CD'),(4,4,'33','Church Road','Liverpool','L3 4EF'),(5,5,'56A','Main Street','Edinburgh','EH1 5FG'),(6,6,'8','Queensway','Glasgow','G2 6HI'),(7,7,'22','Market Square','Leeds','LS1 7JK'),(8,8,'14','Green Lane','Bristol','BS2 8LM'),(9,9,'67','Kings Road','Sheffield','S4 9NO'),(10,10,'9','Elm Street','Newcastle','NE3 0PQ'),(11,1,'25B','Queen\'s Road','London','SW1B 2XY'),(12,2,'7','Hillside Lane','Manchester','M1 3YZ');
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_orders` (
  `customer_order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `customer_address_id` int NOT NULL,
  `customer_order_date` date NOT NULL,
  `order_status_id` int DEFAULT '1',
  PRIMARY KEY (`customer_order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_address_id` (`customer_address_id`),
  KEY `order_status_id` (`order_status_id`),
  CONSTRAINT `customer_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `customer_orders_ibfk_2` FOREIGN KEY (`customer_address_id`) REFERENCES `customer_addresses` (`customer_address_id`),
  CONSTRAINT `customer_orders_ibfk_3` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_orders`
--

LOCK TABLES `customer_orders` WRITE;
/*!40000 ALTER TABLE `customer_orders` DISABLE KEYS */;
INSERT INTO `customer_orders` VALUES (1,1,1,'2023-07-10',4),(2,2,2,'2023-07-15',4),(3,3,3,'2023-07-20',4),(4,4,4,'2023-07-25',4),(5,5,5,'2023-07-30',4),(6,6,6,'2023-08-05',4),(7,7,7,'2023-08-10',4),(8,8,8,'2023-08-15',4),(9,9,9,'2023-08-20',4),(10,10,10,'2023-08-25',4),(11,1,11,'2023-09-01',2),(12,2,12,'2023-09-03',5),(13,3,3,'2023-09-05',5),(14,4,4,'2023-09-06',1),(15,5,5,'2023-08-15',3),(17,2,2,'2023-10-02',1);
/*!40000 ALTER TABLE `customer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_first_name` varchar(100) NOT NULL,
  `customer_last_name` varchar(100) NOT NULL,
  `customer_email_address` varchar(100) NOT NULL,
  `customer_phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_email_address` (`customer_email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Doe','john.doe@example.com','1234 567890'),(2,'Jane','Smith','jane.smith@example.com','9876 543210'),(3,'David','Wilson','david.wilson@example.com','7654 321098'),(4,'Sarah','Brown','sarah.brown@example.com','2345 678901'),(5,'Michael','Taylor','michael.taylor@example.com','8765 432109'),(6,'Emily','Johnson','emily.johnson@example.com','3456 789012'),(7,'James','Anderson','james.anderson@example.com','6543 210987'),(8,'Olivia','Clark','olivia.clark@example.com','1234 567890'),(9,'William','Bow','william.bow@example.com','9876 543210'),(10,'Sophia','Lee','sophia.lee@example.com','7654 321098'),(11,'Roberta','Rock','roberta.rock@example.com','1'),(12,'Bob','Smith','bob.smith@example.com',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `image_id` int NOT NULL,
  `artist_id` int NOT NULL,
  `image_title` varchar(100) NOT NULL,
  `image_description` varchar(200) DEFAULT NULL,
  `image_url` varchar(100) NOT NULL,
  `image_creation_date` date NOT NULL,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_url` (`image_url`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'Comic Artwork','A comic book illustration','https://example.com/tim/comic1.jpg','2023-03-15'),(2,1,'Character Sketch','A character design sketch','https://example.com/tim/sketch1.jpg','2023-04-20'),(3,1,'Comic Cover','Cover art','https://example.com/tim/cover1.jpg','2023-05-10'),(4,2,'Writing Inspiration','An inspirational writing space','https://example.com/daisy/writing.jpg','2023-02-10'),(5,2,'Author Portrait','Author\'s profile picture','https://example.com/daisy/author.jpg','2023-03-25'),(6,3,'Zombie Butterflies','An image of zombie butterflies','https://example.com/brian/exhibition.jpg','2023-05-05'),(7,4,'Weapons Collection','Mike\'s collection of military weapons','https://example.com/mike/weapons1.jpg','2023-04-01'),(8,4,'Firearms Training','Mike practicing shooting','https://example.com/mike/firearms.jpg','2023-05-12'),(9,5,'Pub Night','Marsha enjoying a night at the pub','https://example.com/marsha/pub.jpg','2023-03-20'),(10,6,'Bike Messenger','Tyres riding through the city','https://example.com/tyres/bike1.jpg','2023-04-05'),(11,6,'BMX Tricks','Tyres performing BMX tricks','https://example.com/tyres/bmx.jpg','2023-05-15'),(12,6,'Rave','Tyres on a rave','https://example.com/tyres/rave.jpg','2023-06-05'),(13,7,'Buttons','Colourful buttons','https://example.com/sophie/buttons.jpg','2023-05-12'),(14,3,'Abstract Painting','Brian\'s abstract artwork','https://example.com/brian/abstract.jpg','2023-06-10'),(15,7,'Portrait','Sophie\'s artistic self-portrait','https://example.com/sophie/portrait.jpg','2023-06-01'),(16,8,'Fashion Photography','Twist\'s fashion photography','https://example.com/twist/fashion1.jpg','2023-06-05'),(18,9,'Sarah','Portrait of Sarah','https://example.com/duane/sculpture.jpg','2023-07-01');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `customer_order_id` int NOT NULL,
  `image_id` int NOT NULL,
  `stock_item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `item_unit_price` decimal(6,2) NOT NULL,
  `artist_commission_rate` decimal(6,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `customer_order_id` (`customer_order_id`),
  KEY `image_id` (`image_id`),
  KEY `stock_item_id` (`stock_item_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_orders` (`customer_order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`),
  CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`stock_item_id`),
  CONSTRAINT `check_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,3,17.50,0.09),(2,1,2,2,2,9.00,0.08),(3,2,3,3,1,15.00,0.08),(4,3,4,4,4,14.50,0.09),(5,4,5,5,5,6.00,0.10),(6,5,6,6,3,5.00,0.09),(7,6,7,7,2,24.50,0.08),(8,7,8,8,1,6.50,0.08),(9,8,9,9,4,11.00,0.09),(10,9,10,10,5,38.00,0.10),(11,10,11,1,2,17.50,0.08),(12,11,12,2,3,9.00,0.09),(13,12,13,3,1,15.00,0.08),(14,13,14,4,2,14.50,0.08),(15,14,15,5,4,6.00,0.09),(16,15,1,6,5,5.00,0.10),(17,1,2,7,3,24.50,0.09),(18,2,3,8,2,6.50,0.08),(19,3,4,9,1,11.00,0.08),(20,4,5,10,4,38.00,0.09),(21,5,6,1,3,17.50,0.09),(22,6,7,2,2,9.00,0.08),(23,7,8,3,1,15.00,0.08),(24,8,9,4,4,14.50,0.09),(25,9,10,5,5,6.00,0.10),(26,10,11,6,3,5.00,0.09),(27,1,12,7,2,24.50,0.08),(28,2,13,8,1,6.50,0.08),(29,3,14,9,4,11.00,0.09),(30,4,15,10,5,38.00,0.10),(31,17,10,1,2,17.50,0.08);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_item_insert_trigger` AFTER INSERT ON `order_items` FOR EACH ROW BEGIN
    UPDATE stock_items
    SET stock_item_quantity_available = stock_item_quantity_available - NEW.quantity
    WHERE stock_item_id = NEW.stock_item_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `order_status_id` int NOT NULL,
  `order_status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`order_status_id`),
  UNIQUE KEY `order_status_name` (`order_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (5,'Cancelled'),(4,'Delivered'),(1,'Pending'),(2,'Processing'),(3,'Shipped');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_items`
--

DROP TABLE IF EXISTS `stock_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_items` (
  `stock_item_id` int NOT NULL,
  `stock_item_name` varchar(100) NOT NULL,
  `stock_item_description` varchar(200) DEFAULT NULL,
  `stock_item_cost` decimal(6,2) NOT NULL,
  `stock_item_price` decimal(6,2) NOT NULL,
  `stock_item_quantity_available` int NOT NULL,
  PRIMARY KEY (`stock_item_id`),
  UNIQUE KEY `stock_item_name` (`stock_item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_items`
--

LOCK TABLES `stock_items` WRITE;
/*!40000 ALTER TABLE `stock_items` DISABLE KEYS */;
INSERT INTO `stock_items` VALUES (1,'mouse pad','mouse pad for your home office',8.00,17.50,88),(2,'mug','classic mug for your cuppa',4.00,9.00,70),(3,'hardcover journal','A5 size hardcover journal',7.00,15.00,51),(4,'tote bag','cotton tote bag',6.50,14.50,120),(5,'face mask','adult size face mask',3.00,6.00,48),(6,'kids mask','kid size face mask',2.00,5.00,89),(7,'scarf','cotton scarf',10.00,24.50,37),(8,'passport cover','cover for one passport',2.00,6.50,99),(9,'water bottle','aluminium water bottle',5.00,11.00,49),(10,'throw blanket','king size blanket',20.00,38.00,67);
/*!40000 ALTER TABLE `stock_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_orders`
--

DROP TABLE IF EXISTS `stock_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_orders` (
  `stock_order_id` int NOT NULL,
  `stock_item_id` int NOT NULL,
  `stock_order_date` date NOT NULL,
  `stock_order_quantity` int NOT NULL,
  `stock_order_total` decimal(6,2) NOT NULL,
  `order_status_id` int DEFAULT '1',
  PRIMARY KEY (`stock_order_id`),
  KEY `stock_item_id` (`stock_item_id`),
  KEY `order_status_id` (`order_status_id`),
  CONSTRAINT `stock_orders_ibfk_1` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`stock_item_id`),
  CONSTRAINT `stock_orders_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`order_status_id`),
  CONSTRAINT `check_stock_quantity` CHECK ((`stock_order_quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_orders`
--

LOCK TABLES `stock_orders` WRITE;
/*!40000 ALTER TABLE `stock_orders` DISABLE KEYS */;
INSERT INTO `stock_orders` VALUES (1,1,'2023-06-05',50,400.00,4),(2,2,'2023-06-15',50,200.00,4),(3,3,'2023-07-10',50,350.00,4),(4,4,'2023-07-15',50,325.00,4),(5,5,'2023-08-05',50,150.00,4),(6,6,'2023-08-15',50,100.00,4),(7,7,'2023-09-01',50,500.00,4),(8,8,'2023-09-02',50,100.00,4),(9,9,'2023-09-03',50,250.00,4),(10,10,'2023-09-04',50,1000.00,4),(11,1,'2023-09-05',50,400.00,4),(12,2,'2023-09-06',50,200.00,4),(13,3,'2023-09-07',50,350.00,4),(14,4,'2023-09-08',50,325.00,4),(15,5,'2023-09-09',50,150.00,4),(16,6,'2023-09-10',50,100.00,4),(17,7,'2023-09-11',50,500.00,4),(18,8,'2023-09-12',50,100.00,4),(19,9,'2023-09-13',50,250.00,4),(20,10,'2023-09-14',50,1000.00,4),(21,1,'2023-09-15',50,400.00,4),(22,2,'2023-09-16',50,200.00,4),(23,3,'2023-09-17',50,350.00,4),(24,4,'2023-09-18',50,325.00,4),(25,5,'2023-09-19',50,150.00,4),(26,6,'2023-09-20',50,100.00,4),(27,7,'2023-09-21',50,500.00,4),(28,8,'2023-09-22',50,100.00,4),(29,9,'2023-09-23',50,250.00,4),(30,2,'2023-10-03',50,200.00,3),(31,2,'2023-10-02',50,200.00,4);
/*!40000 ALTER TABLE `stock_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `stock_order_insert_trigger` AFTER INSERT ON `stock_orders` FOR EACH ROW BEGIN
    DECLARE order_status INT;
    
    SELECT order_status_id INTO order_status
    FROM order_statuses
    WHERE order_status_id = NEW.order_status_id;
    
    IF order_status = 4 THEN
        UPDATE stock_items
        SET stock_item_quantity_available = stock_item_quantity_available + NEW.stock_order_quantity
        WHERE stock_item_id = NEW.stock_item_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `stock_order_status_update_trigger` AFTER UPDATE ON `stock_orders` FOR EACH ROW BEGIN
    DECLARE new_status INT;
    DECLARE old_status INT;
    DECLARE total_order_quantity INT;
    
    SELECT NEW.order_status_id INTO new_status;
    SELECT OLD.order_status_id INTO old_status;
    
    IF new_status = 4 AND old_status != 4 THEN
        -- Calculate the total quantity of items in the order
        SELECT stock_order_quantity INTO total_order_quantity
        FROM stock_orders
        WHERE stock_order_id = NEW.stock_order_id;
        
        -- Update the stock_item_quantity_available
        UPDATE stock_items
        SET stock_item_quantity_available = stock_item_quantity_available + total_order_quantity
        WHERE stock_item_id = NEW.stock_item_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_artist_orders_details`
--

DROP TABLE IF EXISTS `vw_artist_orders_details`;
/*!50001 DROP VIEW IF EXISTS `vw_artist_orders_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_artist_orders_details` AS SELECT 
 1 AS `artist_id`,
 1 AS `artist_first_name`,
 1 AS `artist_last_name`,
 1 AS `image_id`,
 1 AS `image_title`,
 1 AS `customer_order_id`,
 1 AS `customer_order_date`,
 1 AS `stock_item_id`,
 1 AS `stock_item_name`,
 1 AS `item_unit_price`,
 1 AS `quantity`,
 1 AS `artist_commission_rate`,
 1 AS `subtotal`,
 1 AS `artist_commission_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_order_total`
--

DROP TABLE IF EXISTS `vw_order_total`;
/*!50001 DROP VIEW IF EXISTS `vw_order_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_order_total` AS SELECT 
 1 AS `customer_order_id`,
 1 AS `customer_id`,
 1 AS `customer_order_date`,
 1 AS `total_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'art_print_final'
--

--
-- Dumping routines for database 'art_print_final'
--
/*!50003 DROP FUNCTION IF EXISTS `set_commission_rate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `set_commission_rate`(
	quantity INT) RETURNS decimal(6,2)
    DETERMINISTIC
BEGIN
    DECLARE artist_commission_rate DECIMAL(6, 2);
    IF quantity >= 5 THEN
		SET artist_commission_rate = 0.1; -- 10% commission if 5 or more items ordered
	ELSEIF (quantity >= 3 AND quantity <= 4) THEN
		SET artist_commission_rate = 0.09; -- 9% commission if 3 or 4 items ordered
	ELSEIF quantity < 3 THEN	
		SET artist_commission_rate = 0.08; -- 8% commission if fewer than 3 items ordered
	END IF;
    RETURN (artist_commission_rate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_customer_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer_order`(
    IN customer_order_id INT,
    IN customer_id INT,
    IN customer_address_id INT,
    IN customer_order_date DATE,
    IN order_status_id INT
)
BEGIN
    INSERT INTO customer_orders (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id)
    VALUES (customer_order_id, customer_id, customer_address_id, customer_order_date, order_status_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_order_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_order_item`(
    IN order_item_id INT,
    IN customer_order_id INT,
    IN image_id INT,
    IN stock_item_id INT,
    IN quantity INT,
    IN item_unit_price DECIMAL(6, 2)
)
BEGIN
    DECLARE artist_commission_rate DECIMAL(6, 2);
    SET artist_commission_rate = set_commission_rate(quantity);
    
    INSERT INTO order_items (order_item_id, customer_order_id, image_id, stock_item_id, quantity, item_unit_price, artist_commission_rate)
    VALUES (order_item_id, customer_order_id, image_id, stock_item_id, quantity, item_unit_price, artist_commission_rate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_stock_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_stock_order`(
    IN stock_order_id INT,
    IN stock_item_id INT,
    IN stock_order_date DATE,
    IN stock_order_quantity INT,
    IN stock_order_total DECIMAL(6, 2),
    IN order_status_id INT
)
BEGIN
    INSERT INTO stock_orders (stock_order_id, stock_item_id, stock_order_date, stock_order_quantity, stock_order_total, order_status_id)
    VALUES (stock_order_id, stock_item_id, stock_order_date, stock_order_quantity, stock_order_total, order_status_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_artist_orders_details`
--

/*!50001 DROP VIEW IF EXISTS `vw_artist_orders_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_artist_orders_details` AS select `a`.`artist_id` AS `artist_id`,`a`.`artist_first_name` AS `artist_first_name`,`a`.`artist_last_name` AS `artist_last_name`,`i`.`image_id` AS `image_id`,`i`.`image_title` AS `image_title`,`c`.`customer_order_id` AS `customer_order_id`,`c`.`customer_order_date` AS `customer_order_date`,`o`.`stock_item_id` AS `stock_item_id`,`s`.`stock_item_name` AS `stock_item_name`,`o`.`item_unit_price` AS `item_unit_price`,`o`.`quantity` AS `quantity`,`o`.`artist_commission_rate` AS `artist_commission_rate`,round((`o`.`item_unit_price` * `o`.`quantity`),2) AS `subtotal`,round(((`o`.`artist_commission_rate` * `o`.`quantity`) * `o`.`item_unit_price`),2) AS `artist_commission_amount` from ((((`customer_orders` `c` join `order_items` `o` on((`c`.`customer_order_id` = `o`.`customer_order_id`))) join `stock_items` `s` on((`o`.`stock_item_id` = `s`.`stock_item_id`))) join `images` `i` on((`o`.`image_id` = `i`.`image_id`))) join `artists` `a` on((`i`.`artist_id` = `a`.`artist_id`))) order by `a`.`artist_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_order_total`
--

/*!50001 DROP VIEW IF EXISTS `vw_order_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_order_total` AS select `co`.`customer_order_id` AS `customer_order_id`,`co`.`customer_id` AS `customer_id`,`co`.`customer_order_date` AS `customer_order_date`,sum(`od`.`subtotal`) AS `total_amount` from (`customer_orders` `co` join `vw_artist_orders_details` `od` on((`co`.`customer_order_id` = `od`.`customer_order_id`))) group by `od`.`customer_order_id` order by `co`.`customer_order_id` */;
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

-- Dump completed on 2023-10-04 14:58:19
