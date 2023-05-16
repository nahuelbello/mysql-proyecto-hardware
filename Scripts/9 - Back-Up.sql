CREATE DATABASE  IF NOT EXISTS `hardware_informatico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hardware_informatico`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hardware_informatico
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_Cliente` smallint NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Localidad` varchar(30) NOT NULL,
  `Provincia` varchar(19) NOT NULL,
  `CP` decimal(4,0) DEFAULT NULL,
  `Telefono` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Emanuel','Scalese','Constitucion 892','Constitucion','CABA',6415,1165494956),(2,'Sabrina','Mendizabal','Av. Montes de Oca 907','Barracas','CABA',1568,1146848689),(3,'Facundo','Rios','Av. Rivadavia 2353','Lanus','Buenos Aires',4156,1143567489);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuente`
--

DROP TABLE IF EXISTS `fuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuente` (
  `ID_Fuente` smallint NOT NULL AUTO_INCREMENT,
  `Potencia` varchar(10) NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_Fuente`),
  KEY `FK_Fuente_Productos` (`ID_Producto`),
  CONSTRAINT `FK_Fuente_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuente`
--

LOCK TABLES `fuente` WRITE;
/*!40000 ALTER TABLE `fuente` DISABLE KEYS */;
INSERT INTO `fuente` VALUES (1,'600',25),(2,'700',26),(3,'850',27);
/*!40000 ALTER TABLE `fuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gabinete`
--

DROP TABLE IF EXISTS `gabinete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gabinete` (
  `ID_Gabinete` smallint NOT NULL AUTO_INCREMENT,
  `Formato` varchar(10) NOT NULL,
  `Color` varchar(10) NOT NULL,
  `Fuente` varchar(10) NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_Gabinete`),
  KEY `FK_Gabinete_Productos` (`ID_Producto`),
  CONSTRAINT `FK_Gabinete_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gabinete`
--

LOCK TABLES `gabinete` WRITE;
/*!40000 ALTER TABLE `gabinete` DISABLE KEYS */;
INSERT INTO `gabinete` VALUES (1,'Mid Tower','Negro','No',28),(2,'Mini Tower','Negro','No',29),(3,'Mid Tower','Negro','No',30);
/*!40000 ALTER TABLE `gabinete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hdd`
--

DROP TABLE IF EXISTS `hdd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hdd` (
  `ID_HDD` smallint NOT NULL AUTO_INCREMENT,
  `Capacidad` varchar(10) NOT NULL,
  `Vel_Lectura` varchar(10) NOT NULL,
  `Vel_Escritura` varchar(10) NOT NULL,
  `Vel_Rotacion` varchar(10) NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_HDD`),
  KEY `FK_HDD_Productos` (`ID_Producto`),
  CONSTRAINT `FK_HDD_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hdd`
--

LOCK TABLES `hdd` WRITE;
/*!40000 ALTER TABLE `hdd` DISABLE KEYS */;
INSERT INTO `hdd` VALUES (1,'1 TB','150 MB/s','150 MB/s','7200 RPM',19),(2,'2 TB','147 MB/s','147 MB/s','5400 RPM',20),(3,'1 TB','150 MB/s','150 MB/s','7200 RPM',21);
/*!40000 ALTER TABLE `hdd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_pc_componentes`
--

DROP TABLE IF EXISTS `log_pc_componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pc_componentes` (
  `ID_Log` int NOT NULL AUTO_INCREMENT,
  `ID_PC_Comp` varchar(255) DEFAULT NULL,
  `Accion` varchar(6) DEFAULT NULL,
  `ID_PC` varchar(100) DEFAULT NULL,
  `ID_Producto` varchar(100) DEFAULT NULL,
  `Cantidad` varchar(100) DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_pc_componentes`
--

LOCK TABLES `log_pc_componentes` WRITE;
/*!40000 ALTER TABLE `log_pc_componentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_pc_componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_productos`
--

DROP TABLE IF EXISTS `log_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_productos` (
  `ID_Log` int NOT NULL AUTO_INCREMENT,
  `ID_Producto` varchar(255) DEFAULT NULL,
  `Accion` varchar(6) DEFAULT NULL,
  `Marca` varchar(255) DEFAULT NULL,
  `Modelo` varchar(255) DEFAULT NULL,
  `Tipo` varchar(255) DEFAULT NULL,
  `Stock` varchar(255) DEFAULT NULL,
  `Costo` varchar(255) DEFAULT NULL,
  `Precio` varchar(255) DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_productos`
--

LOCK TABLES `log_productos` WRITE;
/*!40000 ALTER TABLE `log_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motherboard`
--

DROP TABLE IF EXISTS `motherboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motherboard` (
  `ID_Motherboard` smallint NOT NULL AUTO_INCREMENT,
  `Zocalo` varchar(10) NOT NULL,
  `Chipset` varchar(20) NOT NULL,
  `Slots_RAM` decimal(2,0) NOT NULL,
  `Tecnologia_RAM` varchar(4) NOT NULL,
  `Vel_Max_RAM` varchar(10) NOT NULL,
  `Puertos_PCI` decimal(2,0) NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_Motherboard`),
  KEY `FK_Motherboard_Productos` (`ID_Producto`),
  CONSTRAINT `FK_Motherboard_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motherboard`
--

LOCK TABLES `motherboard` WRITE;
/*!40000 ALTER TABLE `motherboard` DISABLE KEYS */;
INSERT INTO `motherboard` VALUES (1,'AM4','A320',2,'DDR4','3200 MHz',1,1),(2,'AM4','A520',4,'DDR4','4800 MHz',2,2),(3,'AM4','B450',4,'DDR4','4400 MHz',1,3),(4,'LGA1700','H610',2,'DDR4','3200 MHz',1,4),(5,'LGA1700','B660',2,'DDR4','3200 MHz',1,5),(6,'LGA1700','Z690',4,'DDR4','3200 MHz',3,6);
/*!40000 ALTER TABLE `motherboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc`
--

DROP TABLE IF EXISTS `pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc` (
  `ID_PC` smallint NOT NULL AUTO_INCREMENT,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_PC`),
  KEY `FK_PC(ID_Producto)_Productos` (`ID_Producto`),
  CONSTRAINT `FK_PC(ID_Producto)_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc`
--

LOCK TABLES `pc` WRITE;
/*!40000 ALTER TABLE `pc` DISABLE KEYS */;
INSERT INTO `pc` VALUES (1,31),(2,32),(3,33);
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_componentes`
--

DROP TABLE IF EXISTS `pc_componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc_componentes` (
  `ID_PC_Comp` smallint NOT NULL AUTO_INCREMENT,
  `ID_PC` smallint NOT NULL,
  `ID_Producto` smallint NOT NULL,
  `Cantidad` smallint NOT NULL,
  PRIMARY KEY (`ID_PC_Comp`),
  KEY `FK_PC_Componentes(ID_PC)_PC` (`ID_PC`),
  KEY `FK_PC_Componentes(ID_Producto)_Productos` (`ID_Producto`),
  CONSTRAINT `FK_PC_Componentes(ID_PC)_PC` FOREIGN KEY (`ID_PC`) REFERENCES `pc` (`ID_PC`),
  CONSTRAINT `FK_PC_Componentes(ID_Producto)_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_componentes`
--

LOCK TABLES `pc_componentes` WRITE;
/*!40000 ALTER TABLE `pc_componentes` DISABLE KEYS */;
INSERT INTO `pc_componentes` VALUES (1,1,1,1),(2,1,7,1),(3,1,13,1),(4,1,16,1),(5,1,22,1),(6,1,25,1),(7,1,28,1),(8,2,2,1),(9,2,8,1),(10,2,14,1),(11,2,17,1),(12,2,23,1),(13,2,26,1),(14,2,29,1),(15,3,3,1),(16,3,9,1),(17,3,15,1),(18,3,18,1),(19,3,24,1),(20,3,27,1),(21,3,30,1);
/*!40000 ALTER TABLE `pc_componentes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_PC_Componentes_Insert` AFTER INSERT ON `pc_componentes` FOR EACH ROW BEGIN

INSERT INTO LOG_PC_Componentes (Accion, ID_PC_Comp, ID_PC, ID_Producto, Cantidad, Usuario, Fecha)
VALUES (
	'INSERT',
    NEW.ID_PC_Comp,
	NEW.ID_PC,
    NEW.ID_Producto,
    NEW.Cantidad,
	CURRENT_USER(),
	NOW()
);

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_PC_Componentes_Update` BEFORE UPDATE ON `pc_componentes` FOR EACH ROW BEGIN

INSERT INTO LOG_PC_Componentes (Accion, ID_PC_Comp, ID_PC, ID_Producto, Cantidad, Usuario, Fecha)
VALUES (
	'UPDATE',
    CONCAT('ANTERIOR: ', OLD.ID_PC_Comp, ' - ', 'Nuevo: ', NEW.ID_PC_Comp),
    CONCAT('ANTERIOR: ', OLD.ID_PC, ' - ', 'Nuevo: ', NEW.ID_PC),
    CONCAT('ANTERIOR: ', OLD.ID_Producto, ' - ', 'Nuevo: ', NEW.ID_Producto),
    CONCAT('ANTERIOR: ', OLD.Cantidad, ' - ', 'Nuevo: ', NEW.Cantidad),
	CURRENT_USER(),
	NOW()
);

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_PC_Componentes_Delete` BEFORE DELETE ON `pc_componentes` FOR EACH ROW BEGIN

INSERT INTO LOG_PC_Componentes (Accion, ID_PC_Comp, ID_PC, ID_Producto, Cantidad, Usuario, Fecha)
VALUES (
	'DELETE',
    OLD.ID_PC_Comp,
	OLD.ID_PC,
	OLD.ID_Producto,
	OLD.Cantidad,
	CURRENT_USER(),
	NOW()
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `procesador`
--

DROP TABLE IF EXISTS `procesador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procesador` (
  `ID_Procesador` smallint NOT NULL AUTO_INCREMENT,
  `Zocalo` varchar(10) NOT NULL,
  `Chipset` varchar(10) NOT NULL,
  `Cant_Nucleos` tinyint NOT NULL,
  `Vel_Max` varchar(10) NOT NULL,
  `VGA` varchar(20) NOT NULL,
  `Cooler` enum('Si','No') NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_Procesador`),
  KEY `FK_Procesador_Productos` (`ID_Producto`),
  CONSTRAINT `FK_Procesador_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesador`
--

LOCK TABLES `procesador` WRITE;
/*!40000 ALTER TABLE `procesador` DISABLE KEYS */;
INSERT INTO `procesador` VALUES (1,'AM4','AM4',4,'3.8 GHz','Radeon Vega 8','Si',7),(2,'AM4','AM4',6,'3.6 GHz','No','Si',8),(3,'AM4','AM4',8,'3.4 GHz','No','No',9),(4,'LGA1700','LGA1700',4,'4.3 GHz','Intel UHD 730','Si',10),(5,'LGA1700','LGA1700',6,'4.4 GHz','Intel UHD 730','Si',11),(6,'LGA1700','LGA1700',12,'5.0 GHz','Intel UHD 730','No',12);
/*!40000 ALTER TABLE `procesador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_Producto` smallint NOT NULL AUTO_INCREMENT,
  `Marca` varchar(20) NOT NULL,
  `Modelo` varchar(80) NOT NULL,
  `Tipo` varchar(12) NOT NULL,
  `Stock` decimal(2,0) NOT NULL,
  `Costo` decimal(10,2) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'ASUS','Prime A320M-K AM4','Motherboard',1,14499.00,18849.00),(2,'ASUS','Prime A520M-A II CSM AM4','Motherboard',3,20999.00,27299.00),(3,'ASUS','Prime B450M-A II AM4','Motherboard',4,23499.00,30549.00),(4,'MSI','PRO H610M-G LGA1700 DDR4','Motherboard',7,254299.00,330589.00),(5,'MSI','PRO B660M-G LGA1700 DDR4','Motherboard',6,30719.00,39935.00),(6,'MSI','Z690-A LGA1700 DDR4','Motherboard',1,53559.00,69627.00),(7,'Amd','Ryzen 3 3200G 3.8 GHz + Vega8 + Cooler Aerocool','Procesador',9,30998.00,40297.00),(8,'Amd','Ryzen 5 4500 3.6 GHz Sin GPU','Procesador',1,30499.00,39649.00),(9,'Amd','Ryzen 7 5800X3D 3.4 GHz','Procesador',3,132779.00,172613.00),(10,'Intel','Core i3 12100 4.3 GHz Alder Lake','Procesador',4,36699.00,47709.00),(11,'Intel','Core i5 12400 4.4 GHz Alder Lake','Procesador',1,58489.00,76036.00),(12,'Intel','Core i7 12700K 5.0 GHz Alder Lake','Procesador',10,116949.00,152034.00),(13,'Kingston','Fury Beast 4 GB 3200 MHz','RAM',9,9999.00,12999.00),(14,'Kingston','Fury Beast 8 GB 3200 MHz','RAM',4,14999.00,19499.00),(15,'Kingston','Fury Beast 16 GB 3200 MHz','RAM',2,28999.00,37699.00),(16,'Crucial','BX500 240 GB SATA','SSD',5,5999.00,7799.00),(17,'Hikvision','E100N 256 GB M.2 SATA','SSD',1,5749.00,7474.00),(18,'Kingston','KC3000 1 TB M.2 PCI-E','SSD',2,37999.00,49399.00),(19,'Western Digital','Blue 1 TB','HDD',1,10999.00,14299.00),(20,'Western Digital','Blue 2 TB','HDD',9,17499.00,22749.00),(21,'Western Digital','Black 1 TB','HDD',3,29999.00,38999.00),(22,'Gigabyte','Nvidia RTX 3050 8 GB Eagle OC','VGA',3,118939.00,154621.00),(23,'Evga','Nvidia RTX 3090 24 GB FTW3 Ultra','VGA',4,511149.00,664494.00),(24,'Gigabyte','Radeon RX 6900 16 GB XT Gaming OC','VGA',6,336799.00,437839.00),(25,'Thermaltake','Smart 600 W 80 Plus White','Fuente',4,17999.00,23399.00),(26,'Thermaltake','Smart 700 W 80 Plus White','Fuente',5,20959.00,27247.00),(27,'Gigabyte','Aorus 850 W 80 Plus Gold','Fuente',9,37239.00,48411.00),(28,'Thermaltake','H350 Mid Tower Vidrio Templado RGB','Gabinete',1,21869.00,28430.00),(29,'Thermaltake','Versa H18 Mini Tower','Gabinete',9,17339.00,22541.00),(30,'Corsair','220T Mid Tower Vidrio Templado Negro RGB','Gabinete',1,40999.00,53299.00),(31,'PC Armado','Start','PC',3,1.00,1.00),(32,'PC Armado','Mid','PC',3,1.00,1.00),(33,'PC Armado','High','PC',3,1.00,1.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_Productos_INSERT` AFTER INSERT ON `productos` FOR EACH ROW BEGIN

INSERT INTO LOG_Productos (Accion, ID_Producto, Marca, Modelo, Tipo, Stock, Costo, Precio, Usuario, Fecha)
VALUES (
	'INSERT',
    NEW.ID_Producto,
	NEW.Marca,
    NEW.Modelo,
    NEW.Tipo,
    NEW.Stock,
    NEW.Costo,
    NEW.Precio,
	CURRENT_USER(),
	NOW()
);

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_Productos_UPDATE` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN

INSERT INTO LOG_Productos (Accion, ID_Producto, Marca, Modelo, Tipo, Stock, Costo, Precio, Usuario, Fecha)
VALUES (
	'UPDATE',
    CONCAT('ANTERIOR: ', OLD.ID_Producto, ' - ', 'Nuevo: ', NEW.ID_Producto),
    CONCAT('ANTERIOR: ', OLD.Marca, ' - ', 'Nuevo: ', NEW.Marca),
    CONCAT('ANTERIOR: ', OLD.Modelo, ' - ', 'Nuevo: ', NEW.Modelo),
    CONCAT('ANTERIOR: ', OLD.Tipo, ' - ', 'Nuevo: ', NEW.Tipo),
    CONCAT('ANTERIOR: ', OLD.Stock, ' - ', 'Nuevo: ', NEW.Stock),
    CONCAT('ANTERIOR: ', OLD.Costo, ' - ', 'Nuevo: ', NEW.Costo),
    CONCAT('ANTERIOR: ', OLD.Precio, ' - ', 'Nuevo: ', NEW.Precio),
	CURRENT_USER(),
	NOW()
);

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_Productos_Delete` BEFORE DELETE ON `productos` FOR EACH ROW BEGIN

INSERT INTO LOG_Productos (Accion, ID_Producto, Marca, Modelo, Tipo, Stock, Costo, Precio, Usuario, Fecha)
VALUES (
	'DELETE',
    OLD.ID_Producto,
	OLD.Marca,
    OLD.Modelo,
    OLD.Tipo,
    OLD.Stock,
    OLD.Costo,
    OLD.Precio,
	CURRENT_USER(),
	NOW()
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ram`
--

DROP TABLE IF EXISTS `ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ram` (
  `ID_RAM` smallint NOT NULL AUTO_INCREMENT,
  `Tecnologia` varchar(4) NOT NULL,
  `Vel_Max` varchar(10) NOT NULL,
  `Capacidad` varchar(10) NOT NULL,
  `PC_Notebook` enum('PC','Notebook') NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_RAM`),
  KEY `FK_RAM_Productos` (`ID_Producto`),
  CONSTRAINT `FK_RAM_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ram`
--

LOCK TABLES `ram` WRITE;
/*!40000 ALTER TABLE `ram` DISABLE KEYS */;
INSERT INTO `ram` VALUES (1,'DDR4','3200 MHz','4 GB','PC',13),(2,'DDR4','3200 MHz','8 GB','PC',14),(3,'DDR4','3200 MHz','16 GB','PC',15);
/*!40000 ALTER TABLE `ram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssd`
--

DROP TABLE IF EXISTS `ssd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ssd` (
  `ID_SSD` smallint NOT NULL AUTO_INCREMENT,
  `Tecnologia` varchar(10) NOT NULL,
  `Capacidad` varchar(10) NOT NULL,
  `Vel_Lectura` varchar(10) NOT NULL,
  `Vel_Escritura` varchar(10) NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_SSD`),
  KEY `FK_SSD_Productos` (`ID_Producto`),
  CONSTRAINT `FK_SSD_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssd`
--

LOCK TABLES `ssd` WRITE;
/*!40000 ALTER TABLE `ssd` DISABLE KEYS */;
INSERT INTO `ssd` VALUES (1,'SATA 3','240 GB','540 MB/s','500 MB/s',16),(2,'M.2 SATA','256 GB','500 MB/s','347 MB/s',17),(3,'M.2 PCI-E','1 TB','7000 MB/s','6000 MB/s',18);
/*!40000 ALTER TABLE `ssd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `ID_Vendedor` smallint NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Marcos','Perez'),(2,'Marta','Caceres');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ID_Venta` smallint NOT NULL AUTO_INCREMENT,
  `Nro_Venta` smallint NOT NULL,
  `ID_Producto` smallint NOT NULL,
  `Cantidad` smallint NOT NULL,
  `Precio` decimal(12,2) NOT NULL,
  `Descuento` decimal(2,0) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Cliente` smallint NOT NULL,
  `Vendedor` smallint NOT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `FK_Ventas_Productos` (`ID_Producto`),
  KEY `FK_Ventas_Clientes` (`Cliente`),
  KEY `FK_Ventas_Vendedores` (`Vendedor`),
  CONSTRAINT `FK_Ventas_Clientes` FOREIGN KEY (`Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  CONSTRAINT `FK_Ventas_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  CONSTRAINT `FK_Ventas_Vendedores` FOREIGN KEY (`Vendedor`) REFERENCES `vendedores` (`ID_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,6,1,69627.00,0,'2023-01-18 16:18:37',1,1),(2,2,13,1,12999.00,0,'2023-01-18 16:18:37',2,1),(3,2,4,1,330589.00,0,'2023-01-18 16:18:37',2,1),(4,3,20,1,22749.00,0,'2023-01-18 16:18:37',3,2),(5,3,9,1,172613.00,0,'2023-01-18 16:18:37',3,2),(6,3,28,1,28430.00,0,'2023-01-18 16:18:37',3,2);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vga`
--

DROP TABLE IF EXISTS `vga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vga` (
  `ID_VGA` smallint NOT NULL AUTO_INCREMENT,
  `Capacidad` varchar(10) NOT NULL,
  `Tasa_Reloj` varchar(10) NOT NULL,
  `Consumo` varchar(10) NOT NULL,
  `ID_Producto` smallint NOT NULL,
  PRIMARY KEY (`ID_VGA`),
  KEY `FK_VGA_Productos` (`ID_Producto`),
  CONSTRAINT `FK_VGA_Productos` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vga`
--

LOCK TABLES `vga` WRITE;
/*!40000 ALTER TABLE `vga` DISABLE KEYS */;
INSERT INTO `vga` VALUES (1,'8 TB','1792 MB/s','250 W',22),(2,'24 TB','1800 MB/s','350 W',23),(3,'16 TB','2285 MB/s','300 W',24);
/*!40000 ALTER TABLE `vga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clientes`
--

DROP TABLE IF EXISTS `vw_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes` AS SELECT 
 1 AS `ID_Cliente`,
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Direccion`,
 1 AS `Localidad`,
 1 AS `Provincia`,
 1 AS `CP`,
 1 AS `Telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_fuente`
--

DROP TABLE IF EXISTS `vw_fuente`;
/*!50001 DROP VIEW IF EXISTS `vw_fuente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_fuente` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Potencia`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_gabinete`
--

DROP TABLE IF EXISTS `vw_gabinete`;
/*!50001 DROP VIEW IF EXISTS `vw_gabinete`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_gabinete` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Formato`,
 1 AS `Color`,
 1 AS `Fuente`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_hdd`
--

DROP TABLE IF EXISTS `vw_hdd`;
/*!50001 DROP VIEW IF EXISTS `vw_hdd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_hdd` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Capacidad`,
 1 AS `Vel_Lectura`,
 1 AS `Vel_Escritura`,
 1 AS `Vel_Rotacion`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_motherboard`
--

DROP TABLE IF EXISTS `vw_motherboard`;
/*!50001 DROP VIEW IF EXISTS `vw_motherboard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_motherboard` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Zocalo`,
 1 AS `Chipset`,
 1 AS `Slots_RAM`,
 1 AS `Tecnologia_RAM`,
 1 AS `Vel_Max_RAM`,
 1 AS `Puertos_PCI`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_procesador`
--

DROP TABLE IF EXISTS `vw_procesador`;
/*!50001 DROP VIEW IF EXISTS `vw_procesador`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_procesador` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Zocalo`,
 1 AS `Chipset`,
 1 AS `Cant_Nucleos`,
 1 AS `Vel_Max`,
 1 AS `VGA`,
 1 AS `Cooler`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ram`
--

DROP TABLE IF EXISTS `vw_ram`;
/*!50001 DROP VIEW IF EXISTS `vw_ram`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ram` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Tecnologia`,
 1 AS `Vel_Max`,
 1 AS `Capacidad`,
 1 AS `PC_Notebook`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ssd`
--

DROP TABLE IF EXISTS `vw_ssd`;
/*!50001 DROP VIEW IF EXISTS `vw_ssd`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ssd` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Tecnologia`,
 1 AS `Capacidad`,
 1 AS `Vel_Lectura`,
 1 AS `Vel_Escritura`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendedores`
--

DROP TABLE IF EXISTS `vw_vendedores`;
/*!50001 DROP VIEW IF EXISTS `vw_vendedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendedores` AS SELECT 
 1 AS `ID_Vendedor`,
 1 AS `Nombre`,
 1 AS `Apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vga`
--

DROP TABLE IF EXISTS `vw_vga`;
/*!50001 DROP VIEW IF EXISTS `vw_vga`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vga` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Marca`,
 1 AS `Modelo`,
 1 AS `Capacidad`,
 1 AS `Tasa_Reloj`,
 1 AS `Consumo`,
 1 AS `Stock`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hardware_informatico'
--

--
-- Dumping routines for database 'hardware_informatico'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_CargarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CargarVenta`(Venta INT, Producto INT, Cantidad INT, Descuento INT, Cliente INT, Vendedor INT) RETURNS int
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
SET @precio = (SELECT Precio FROM Productos WHERE ID_Producto = Producto);
INSERT INTO `Ventas` (`Nro_Venta`,`ID_Producto`,`Cantidad`,`Precio`,`Descuento`,`Fecha`,`Cliente`,`Vendedor`)
VALUES (Venta,Producto,Cantidad,@precio,Descuento,NOW(),Cliente,Vendedor);
RETURN @precio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_PrecioPC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_PrecioPC`(PC_nro INT) RETURNS int
    DETERMINISTIC
BEGIN
SET @resultado = (SELECT SUM(p.Precio * c.Cantidad) FROM PC_Componentes c
LEFT JOIN Productos p
ON c.ID_Producto = p.ID_Producto
WHERE c.ID_PC = PC_nro);
RETURN @resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_AgregarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AgregarStock`(IN Prod SMALLINT, IN Cant INT)
BEGIN
	SET @NuevoStock = Cant + (SELECT Stock FROM Productos WHERE ID_Producto = Prod);
	UPDATE Productos SET Stock = @NuevoStock WHERE ID_Producto = Prod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ConsultarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ConsultarStock`(IN Prod INT)
BEGIN
	SET @Resultado = CONCAT('SELECT Marca,Modelo,Stock FROM Productos WHERE ID_Producto = ', Prod);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ConsultarVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ConsultarVentas`(IN Nro_Venta INT)
BEGIN
	SET @Resultado = CONCAT('SELECT * FROM Ventas WHERE Nro_Venta = ', Nro_Venta);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ConsultarVentasCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ConsultarVentasCliente`(IN Cliente INT)
BEGIN
	SET @Resultado = CONCAT('SELECT * FROM Ventas WHERE Cliente = ', Cliente);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insercion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insercion`(IN Marca VARCHAR(20), IN Modelo VARCHAR(80), IN Tipo VARCHAR(12), IN Stock DECIMAL(2, 0), IN Costo DECIMAL(10, 2), IN Precio DECIMAL(10, 2), OUT Fallo VARCHAR(60))
BEGIN
IF (Marca = '' OR Modelo = '' OR Tipo = '' OR Stock = '' OR Costo = '' OR Precio = '') THEN
	SET Fallo = 'Los campos no pueden estar vacíos.';

ELSEIF (Stock < 0) THEN
	SET Fallo = 'El stock debe ser un número válido';

ELSEIF (Precio <= 0) THEN
	SET Fallo = 'El precio debe ser un número válido';

ELSEIF (Costo <= 0) THEN
	SET Fallo = 'El costo debe ser un número válido';

ELSE
	INSERT INTO `Productos` (`Marca`,`Modelo`,`Tipo`,`Stock`,`Costo`,`Precio`) VALUES (Marca, Modelo, Tipo, Stock, Costo, Precio);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ModificarPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ModificarPrecio`(IN Prod SMALLINT, IN Costo INT)
BEGIN
	SET @Precio = Costo * 1.3;
	UPDATE Productos SET Costo = Costo, Precio = @Precio WHERE ID_Producto = Prod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Ordenamiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Ordenamiento`(IN Columna VARCHAR(20), IN Orden VARCHAR(4), OUT Fallo VARCHAR(60))
BEGIN
IF (Columna = '' OR Orden = '') THEN
	SET Fallo = 'Los campos no pueden estar vacíos.';
	
ELSEIF (Orden != 'asc' AND Orden != 'desc') THEN
	SET Fallo = 'El campo orden solo admite valores "asc" y "desc".';

ELSE
	SET @Resultado = CONCAT('SELECT * FROM Productos ORDER BY ', Columna, ' ', Orden);
    PREPARE Param FROM @Resultado;
    EXECUTE Param;
    DEALLOCATE PREPARE Param;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes` AS select `clientes`.`ID_Cliente` AS `ID_Cliente`,`clientes`.`Nombre` AS `Nombre`,`clientes`.`Apellido` AS `Apellido`,`clientes`.`Direccion` AS `Direccion`,`clientes`.`Localidad` AS `Localidad`,`clientes`.`Provincia` AS `Provincia`,`clientes`.`CP` AS `CP`,`clientes`.`Telefono` AS `Telefono` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_fuente`
--

/*!50001 DROP VIEW IF EXISTS `vw_fuente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_fuente` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`f`.`Potencia` AS `Potencia`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`fuente` `f` left join `productos` `p` on((`f`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gabinete`
--

/*!50001 DROP VIEW IF EXISTS `vw_gabinete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gabinete` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`g`.`Formato` AS `Formato`,`g`.`Color` AS `Color`,`g`.`Fuente` AS `Fuente`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`gabinete` `g` left join `productos` `p` on((`g`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_hdd`
--

/*!50001 DROP VIEW IF EXISTS `vw_hdd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_hdd` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`h`.`Capacidad` AS `Capacidad`,`h`.`Vel_Lectura` AS `Vel_Lectura`,`h`.`Vel_Escritura` AS `Vel_Escritura`,`h`.`Vel_Rotacion` AS `Vel_Rotacion`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`hdd` `h` left join `productos` `p` on((`h`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_motherboard`
--

/*!50001 DROP VIEW IF EXISTS `vw_motherboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_motherboard` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`m`.`Zocalo` AS `Zocalo`,`m`.`Chipset` AS `Chipset`,`m`.`Slots_RAM` AS `Slots_RAM`,`m`.`Tecnologia_RAM` AS `Tecnologia_RAM`,`m`.`Vel_Max_RAM` AS `Vel_Max_RAM`,`m`.`Puertos_PCI` AS `Puertos_PCI`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`motherboard` `m` left join `productos` `p` on((`m`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_procesador`
--

/*!50001 DROP VIEW IF EXISTS `vw_procesador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_procesador` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`a`.`Zocalo` AS `Zocalo`,`a`.`Chipset` AS `Chipset`,`a`.`Cant_Nucleos` AS `Cant_Nucleos`,`a`.`Vel_Max` AS `Vel_Max`,`a`.`VGA` AS `VGA`,`a`.`Cooler` AS `Cooler`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`procesador` `a` left join `productos` `p` on((`a`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ram`
--

/*!50001 DROP VIEW IF EXISTS `vw_ram`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ram` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`r`.`Tecnologia` AS `Tecnologia`,`r`.`Vel_Max` AS `Vel_Max`,`r`.`Capacidad` AS `Capacidad`,`r`.`PC_Notebook` AS `PC_Notebook`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`ram` `r` left join `productos` `p` on((`r`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ssd`
--

/*!50001 DROP VIEW IF EXISTS `vw_ssd`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ssd` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`s`.`Tecnologia` AS `Tecnologia`,`s`.`Capacidad` AS `Capacidad`,`s`.`Vel_Lectura` AS `Vel_Lectura`,`s`.`Vel_Escritura` AS `Vel_Escritura`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`ssd` `s` left join `productos` `p` on((`s`.`ID_Producto` = `p`.`ID_Producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendedores`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendedores` AS select `vendedores`.`ID_Vendedor` AS `ID_Vendedor`,`vendedores`.`Nombre` AS `Nombre`,`vendedores`.`Apellido` AS `Apellido` from `vendedores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vga`
--

/*!50001 DROP VIEW IF EXISTS `vw_vga`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vga` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Marca` AS `Marca`,`p`.`Modelo` AS `Modelo`,`v`.`Capacidad` AS `Capacidad`,`v`.`Tasa_Reloj` AS `Tasa_Reloj`,`v`.`Consumo` AS `Consumo`,`p`.`Stock` AS `Stock`,`p`.`Precio` AS `Precio` from (`vga` `v` left join `productos` `p` on((`v`.`ID_Producto` = `p`.`ID_Producto`))) */;
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

-- Dump completed on 2023-01-18 16:20:03
