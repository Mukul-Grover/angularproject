-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: shopping_cart_db
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Current Database: `shopping_cart_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shopping_cart_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `shopping_cart_db`;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `idcarts` bigint(20) NOT NULL AUTO_INCREMENT,
  `idcustomer` bigint(20) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idcarts`),
  KEY `carts_customers_fk_idx` (`idcustomer`),
  CONSTRAINT `carts_customers_fk` FOREIGN KEY (`idcustomer`) REFERENCES `customers` (`idcustomer`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (12,1,75893.00),(13,1,21999.00);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(40) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Mobile','1 Segment Best 108MP Quad Camera Setup with exciting features like Single Take, Object Eraser, \r\nand Photo Remaster  Super AMOLED Plus Display, FHD resolution, pixels with 120Hz Refresh Rate'),(2,'Headphone','Featuring newly developed diaphragm that is 80% thinner than the he400 series resulting in a wider frequency response, faster and more detailed'),(3,'Laptop','Processor:AMD Ryzen 5 5625U (up to 4.3 GHz max boost clock(2i),16 MB L3 cache, 6 cores, 12 threads)|Memory & Storage: 8 GB DDR4-3200 SDRAM (2 x 4 GB), Upto 16 GB DDR4-3200 SDRAM (2 x 8 GB)| Storage: 512 GB PCIe NVMe M.2 SSD');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `idcustomer` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`idcustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'mukul','Grover','mukul@gmail.com','a3cb97a29495ad28c0ae8b7081c1d8df50b89d8e34edf6ca5ec650801b8126b0'),(2,'HImanshu','H','himanshu@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lines_item`
--

DROP TABLE IF EXISTS `lines_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lines_item` (
  `idlines_item` bigint(20) NOT NULL AUTO_INCREMENT,
  `idorder` bigint(20) DEFAULT NULL,
  `idproduct` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `idcart` bigint(20) NOT NULL,
  PRIMARY KEY (`idlines_item`),
  KEY `lines_item_orders_fk_idx` (`idorder`),
  KEY `lines_item_products_fk_idx` (`idproduct`),
  KEY `lines_item_carts_fk_idx` (`idcart`),
  CONSTRAINT `lines_item_carts_fk` FOREIGN KEY (`idcart`) REFERENCES `carts` (`idcarts`) ON UPDATE CASCADE,
  CONSTRAINT `lines_item_orders_fk` FOREIGN KEY (`idorder`) REFERENCES `orders` (`idorder`) ON UPDATE CASCADE,
  CONSTRAINT `lines_item_products_fk` FOREIGN KEY (`idproduct`) REFERENCES `products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines_item`
--

LOCK TABLES `lines_item` WRITE;
/*!40000 ALTER TABLE `lines_item` DISABLE KEYS */;
INSERT INTO `lines_item` VALUES (3,1,1,1,28499.00,12),(4,1,25,1,42750.00,12),(5,1,18,5,1745.00,12),(6,1,16,1,2899.00,12),(7,2,4,1,21999.00,13);
/*!40000 ALTER TABLE `lines_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idorder` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordered` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `idcustomer` bigint(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `orders_customers_fk_idx` (`idcustomer`),
  CONSTRAINT `orders_customers_fk` FOREIGN KEY (`idcustomer`) REFERENCES `customers` (`idcustomer`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-02-22 10:30:20','Delivered',1,75893.00),(2,'2022-06-04 20:19:07','In progress',1,21999.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `idproduct` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `idcategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduct`),
  KEY `products_categories_fk` (`idcategory`),
  CONSTRAINT `products_categories_fk` FOREIGN KEY (`idcategory`) REFERENCES `categories` (`idcategory`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Samsung Galaxy M53 5G (Deep Ocean Blue, 8GB, 128GB Storage)',28499.00,1),(2,'Samsung Galaxy M33 5G (Mystique Green, 8GB, 128GB Storage)',19499.00,1),(3,'realme narzo 50i (Mint Green, 4GB RAM+64GB Storage)',8999.00,1),(4,'OnePlus Nord CE 2 Lite 5G (Blue Tide, 8GB RAM, 128GB Storage)',21999.00,1),(5,'Redmi 9A Sport (Coral Green, 2GB RAM, 32GB Storage)',6999.00,1),(6,'Samsung Galaxy S20 FE 5G (Cloud Navy, 8GB RAM, 128GB Storage)',34990.00,1),(7,'Vivo X60 (Shimmer Blue, 8GB RAM, 128GB Storage) Without Offers',35090.00,1),(8,'realme 8s 5G (Universe Blue, 8GB RAM, 128GB Storage), Medium',18851.00,1),(9,'realme narzo 50i (Carbon Black, 4GB RAM+64GB Storage)',8999.00,1),(10,'OPPO A31 (Mystery Black, 6GB RAM, 128GB Storage)',12989.00,1),(11,'HiFiMAN Sundara Wired Over The Ear Headphone Without Mic (Black)',24999.00,2),(12,'ANT AUDIO W56 Wired in Ear Earphone with Mic (Black)',618.00,2),(13,'boAt Rockerz 510 Over Ear Bluetooth Headphones with Upto 20 Hours Playback',1199.00,2),(14,'pTron Pride Lite HBE (High Bass Earphones) in-Ear Wired Headphones with in-line Mic',149.00,2),(15,'boAt Rockerz 400 Bluetooth On Ear Headphones with upto 8 Hours',1299.00,2),(16,'JBL Tune 500BT by Harman Powerful Bass Wireless On-Ear Headphones',2899.00,2),(17,'Skullcandy Crusher Wireless Bluetooth Over The Ear Headphone',8095.00,2),(18,'boAt Bassheads 100 in Ear Wired Earphones(Mint Green)',349.00,2),(19,'boAt Rockerz 450 On Ear Bluetooth Headphones',899.00,2),(20,'boAt Rockerz 450 On Ear Bluetooth Headphones',899.00,2),(21,'HP Pavilion 14, Ryzen 5-5625U, 8GB RAM/512GB SSD 14 inch(35.6 cm) Laptop',53990.00,3),(22,'HP 15s- Ryzen 5- 8GB RAM/512GB SSD 15.6 Inches FHD, Micro-Edge, Anti-Glare Display',47490.00,3),(23,'Acer Aspire Thin and Light Laptop, 15.6\" FHD Display, Intel Celeron Dual-Core N4500 Processor',62074.00,3),(24,'ASUS VivoBook 15 (2021), 15.6-inch (39.62 cm) HD, Dual Core Intel Celeron N4020',26990.00,3),(25,'Lenovo ThinkPad E14 Intel Core i3',42750.00,3),(26,'ASUS ZenBook 14 (2020) Intel Core i5',73499.00,3),(27,'Acer Acer One Intel Pentium Gold',30490.00,3),(28,'HP 15s-11th Gen Intel Core i3 15.6 Inches Laptop',42899.00,3),(29,'HP 15- AMD Ryzen 3-3250 15.6 inch(39.6 cm) FHD,Thin & Light Laptop',39990.00,3),(30,'ASUS VivoBook 14 (2021), Intel Core i3-1115G4 11th Gen',33990.00,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-04 23:54:37
