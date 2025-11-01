-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 82.197.67.107    Database: gestion_abako
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `abonos_credito`
--

DROP TABLE IF EXISTS `abonos_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonos_credito` (
  `id_abono` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_venta_credito` bigint unsigned NOT NULL,
  `fecha` date NOT NULL DEFAULT (curdate()),
  `monto` int NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_abono`),
  KEY `id_venta_credito` (`id_venta_credito`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `abonos_credito_ibfk_1` FOREIGN KEY (`id_venta_credito`) REFERENCES `ventas_credito` (`id_venta_credito`),
  CONSTRAINT `abonos_credito_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos_credito`
--

LOCK TABLES `abonos_credito` WRITE;
/*!40000 ALTER TABLE `abonos_credito` DISABLE KEYS */;
INSERT INTO `abonos_credito` VALUES (1,2,'2025-10-11',200000,2,NULL,NULL);
/*!40000 ALTER TABLE `abonos_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anticipos_trabajadores`
--

DROP TABLE IF EXISTS `anticipos_trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anticipos_trabajadores` (
  `id_anticipo` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_trabajador` bigint unsigned NOT NULL,
  `id_orden_fabricacion` bigint unsigned NOT NULL,
  `fecha` date NOT NULL,
  `monto` int DEFAULT NULL,
  `monto_usado` int DEFAULT NULL,
  `estado` enum('pendiente','parcial','saldado') DEFAULT 'pendiente',
  `observaciones` text,
  PRIMARY KEY (`id_anticipo`),
  KEY `id_trabajador` (`id_trabajador`),
  KEY `id_orden_fabricacion` (`id_orden_fabricacion`),
  CONSTRAINT `anticipos_trabajadores_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`),
  CONSTRAINT `anticipos_trabajadores_ibfk_2` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anticipos_trabajadores`
--

LOCK TABLES `anticipos_trabajadores` WRITE;
/*!40000 ALTER TABLE `anticipos_trabajadores` DISABLE KEYS */;
INSERT INTO `anticipos_trabajadores` VALUES (1,2,7,'2025-09-20',250000,250000,'saldado',''),(2,3,2,'2025-09-20',0,0,'saldado',''),(3,11,37,'2025-10-04',150000,NULL,'pendiente','');
/*!40000 ALTER TABLE `anticipos_trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id_articulo` bigint unsigned NOT NULL AUTO_INCREMENT,
  `referencia` varchar(100) NOT NULL,
  `descripcion` text,
  `precio_venta` int DEFAULT NULL,
  `precio_costo` int DEFAULT NULL,
  `id_categoria` bigint unsigned DEFAULT NULL,
  `es_compuesto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `id_articulo` (`id_articulo`),
  KEY `fk_articulos_categoria` (`id_categoria`),
  CONSTRAINT `fk_articulos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'M001','MESA RESTAURANTE TEKA',200000,200000,7,0),(2,'CT140','CAMAROTE 1.40 TEKA',1300000,NULL,4,0),(3,'CAM140','CAMA 1.40 EN TEKA',700000,NULL,4,0),(4,'SOM2X2','SOMIER 2X2 EN TEKA',500000,NULL,4,0),(5,'BANCORED','BANCO REDONDO EN TEKA',120000,60000,2,0),(6,'S001','TAUBRETE EN TECA',120000,5000,5,0),(8,'ME001','MECEDORA MARIMBA EN TECA',150000,100000,3,0),(9,'B002','BANQUILLOS EN TECA REDONDOS',100000,100000,2,0),(10,'C001','COMEDOR EN TECA 80X80',70000,600000,7,1),(11,'P001','PERCHERO EN TECA',120000,100000,6,0),(12,'F002','FRUTERA EN TECA',60000,60000,6,0),(13,'B001','BANQUILLO TK',115000,NULL,2,0),(15,'A003','AGUA MANILA',2000,20000,6,0),(16,'C0001','COMEDOR CUCHARA',22222,3300,7,0),(17,'T003','TAUBRETES CUERO',12222,12333,5,0),(18,'C0004','CAMAS EN TECA  1.40',2000,20000,4,0),(19,'M004','MECEDORAS PICA PIEDRA',30000,30000,3,0),(20,'M0005','MARIMBAS INFANTIL',9000,0,3,0),(21,'T0001','TABLA',33333333,333333,10,0),(22,'B0003','BANQUILLOS PEQUEÑOS 1/55',333333,33333,2,0),(23,'A0001','ATRIL',3333,33333,6,0),(24,'M0002','MESAS PEQUEÑAS',200000,20000,10,0),(25,'E0002','MARCO DE ESPEJO 45X129',33333,NULL,6,0),(26,'ESPEJO','ESPEJO',0,NULL,6,0),(27,'B0001','BARRA',300000,NULL,7,0),(28,'M007','MESA BARRA DE1MTX60X70',300000,NULL,7,0),(29,'S0006','SILLA MESA BARRA 75CM ALTA',150000,NULL,10,0),(30,'M009','MESA HEXAGONAL 1MT',2,NULL,10,0),(31,'S0009','SILLAS PEGABLES',120000,NULL,5,0),(32,'M01','MESAS DE 70X60',300000,NULL,10,0),(33,'M02','JUEGO DE SILLA Y MESAS',800000,NULL,7,0),(34,'M03','MESAS DE 1.60X90 CON BASE',700000,NULL,10,0),(35,'S04','SILLAS CON BRAZOS',140000,NULL,5,0),(36,'S05','SILLA DE BARRA DE 80CM ALTO',150000,NULL,5,0),(37,'MM05','MESAS DE 1X70',500000,NULL,10,0),(38,'S06','SILLAS CON BASE DE MADERA',140000,NULL,5,0),(39,'B06','BANCOS DE 1.60',60000,NULL,2,0),(40,'P06','PARASOLES',50000,NULL,6,0),(41,'M07','MESAS 80X80',30000,NULL,10,0),(42,'M05','MECEDORAS MARIA PALITOS',200000,NULL,3,0),(43,'S07','SILLAS SEBASTIANAS',200000,NULL,3,0),(44,'S08','SILLAS COMEDOR ',120000,NULL,5,0),(45,'M08','MESAS 120X80',300000,NULL,10,0),(46,'M09','MARIMBA P/ÑA',100000,NULL,3,0),(47,'M1','MARCO ESPEJO',100000,NULL,6,0),(48,'M3','MESA 120X80 EN TRIPLE',1,NULL,10,0),(49,'B4','BANQUILLOS TAPIZADOS',2,NULL,2,0),(50,'S9','SILLAS PARA  TAPIZAR',4,NULL,5,0),(51,'C8','MECEDORA CATALANA',160000,60000,3,0),(52,'S7','SILLAS HAROLD CON ASIENTO EN MADERA',50,NULL,5,0),(53,'9','ESTELERA',30000,NULL,4,0),(54,'S8','SILLAS PARA TAPIZAR',20,NULL,5,0),(55,'B2','BANQUILLOS REDONDOS EN TK',115000,NULL,2,0),(56,'B1','BANQUILLO TAPIZADOS PQUEÑOS',4,NULL,2,0),(57,'S1','SOFA EN L',3000000,NULL,43,0),(58,'M2','',700000,100000,10,0),(59,'M4','MESA 160X80',700000,100000,10,0),(60,'M5','MESA DE 6 PUESTOS',800000,NULL,10,0),(61,'S6','SILLAS LARRY',120000,NULL,5,0),(62,'P7','PERCHEROS EN ROBLE',120000,60000,44,0),(63,'P8','PERCHERO EN TECA',120000,40000,44,0),(64,'M8','MESITA DE CENTRO',100000,NULL,10,0),(65,'C9','CAMA GRANDE TAPIZADA',200000,NULL,4,0);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_componentes`
--

DROP TABLE IF EXISTS `articulos_componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos_componentes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `articulo_padre_id` bigint unsigned NOT NULL,
  `articulo_componente_id` bigint unsigned NOT NULL,
  `cantidad_requerida` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articulo_padre_id` (`articulo_padre_id`),
  KEY `articulo_componente_id` (`articulo_componente_id`),
  CONSTRAINT `articulos_componentes_ibfk_1` FOREIGN KEY (`articulo_padre_id`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE,
  CONSTRAINT `articulos_componentes_ibfk_2` FOREIGN KEY (`articulo_componente_id`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_componentes`
--

LOCK TABLES `articulos_componentes` WRITE;
/*!40000 ALTER TABLE `articulos_componentes` DISABLE KEYS */;
INSERT INTO `articulos_componentes` VALUES (1,10,1,1),(2,10,6,4);
/*!40000 ALTER TABLE `articulos_componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avance_etapas_produccion`
--

DROP TABLE IF EXISTS `avance_etapas_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avance_etapas_produccion` (
  `id_avance_etapa` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_orden_fabricacion` bigint unsigned NOT NULL,
  `id_etapa_produccion` bigint unsigned NOT NULL,
  `id_trabajador` bigint unsigned NOT NULL,
  `cantidad` int NOT NULL,
  `estado` enum('pendiente','en proceso','completado') DEFAULT 'pendiente',
  `observaciones` text,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `pagado` tinyint(1) DEFAULT '0',
  `id_articulo` bigint unsigned DEFAULT NULL,
  `costo_fabricacion` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_avance_etapa`),
  UNIQUE KEY `id_produccion_etapa` (`id_avance_etapa`),
  KEY `avance_etapas_produccion_ibfk_1` (`id_orden_fabricacion`),
  KEY `avance_etapas_produccion_ibfk_2` (`id_etapa_produccion`),
  KEY `fk_avance_trabajador` (`id_trabajador`),
  KEY `fk_avance_articulo` (`id_articulo`),
  CONSTRAINT `avance_etapas_produccion_ibfk_1` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`) ON DELETE CASCADE,
  CONSTRAINT `avance_etapas_produccion_ibfk_2` FOREIGN KEY (`id_etapa_produccion`) REFERENCES `etapas_produccion` (`id_etapa`) ON DELETE CASCADE,
  CONSTRAINT `fk_avance_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_avance_trabajador` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avance_etapas_produccion`
--

LOCK TABLES `avance_etapas_produccion` WRITE;
/*!40000 ALTER TABLE `avance_etapas_produccion` DISABLE KEYS */;
INSERT INTO `avance_etapas_produccion` VALUES (1,1,11,1,12,'completado','','2025-09-10 22:11:09',0,1,30000),(2,2,11,3,4,'completado','','2025-09-10 22:23:33',1,2,200000),(3,6,11,5,3,'completado','','2025-09-12 15:14:59',1,1,30000),(4,7,11,2,4,'completado','','2025-09-12 15:27:22',1,18,100000),(5,8,11,1,8,'completado','','2025-09-12 16:08:20',0,22,12000),(6,8,12,6,8,'completado','','2025-09-12 16:34:23',0,22,12000),(7,8,3,7,8,'completado','','2025-09-12 16:35:08',0,22,3500),(8,8,11,9,1,'completado','','2025-09-13 18:40:38',0,11,1),(9,8,11,5,4,'completado','','2025-09-13 19:14:27',0,19,35000),(10,8,11,2,1,'completado','','2025-09-13 19:17:48',0,21,1),(11,8,11,5,1,'completado','','2025-09-13 19:21:32',0,25,20000),(12,8,11,5,1,'completado','','2025-09-13 19:38:51',0,26,20000),(13,11,11,1,12,'completado','','2025-09-13 21:23:27',1,41,30000),(14,12,11,3,2,'completado','','2025-09-15 14:35:52',0,41,35000),(15,12,11,3,3,'completado','','2025-09-15 14:36:40',0,42,30000),(16,12,12,7,2,'completado','','2025-09-15 14:38:41',0,41,5000),(17,13,11,2,8,'completado','','2025-09-15 14:44:14',1,43,15000),(18,13,11,2,4,'completado','','2025-09-15 14:45:03',1,44,20000),(19,13,11,2,1,'completado','','2025-09-15 14:45:35',1,45,80000),(20,13,11,2,1,'completado','','2025-09-15 14:45:56',1,24,20000),(21,10,11,5,2,'completado','','2025-09-17 19:40:29',1,8,1),(22,10,12,6,2,'completado','','2025-09-17 19:41:33',0,8,18000),(23,10,3,7,2,'completado','','2025-09-17 19:42:26',1,8,7000),(24,14,11,3,2,'completado','','2025-09-17 19:59:53',1,41,35000),(25,14,11,3,3,'completado','','2025-09-17 20:00:39',1,42,30000),(26,15,11,3,2,'completado','','2025-09-17 20:44:48',0,41,35000),(27,15,11,3,3,'completado','','2025-09-17 20:45:14',0,42,30000),(28,16,11,5,4,'completado','','2025-09-17 20:57:09',1,19,35000),(29,16,12,6,4,'completado','','2025-09-17 20:57:56',0,19,25000),(30,16,3,7,4,'completado','','2025-09-17 20:58:46',1,19,8000),(31,16,11,2,1,'completado','','2025-09-17 20:59:16',1,21,1),(32,16,12,6,1,'completado','','2025-09-17 20:59:42',1,21,1),(33,16,3,7,1,'completado','','2025-09-17 21:00:04',1,21,1),(34,16,11,1,8,'completado','','2025-09-17 21:00:53',1,22,12000),(35,17,11,11,1,'completado','','2025-09-23 13:45:18',0,24,20000),(36,17,12,4,1,'completado','','2025-09-23 13:46:20',0,24,15000),(37,17,3,7,1,'completado','','2025-09-23 13:46:49',0,24,3500),(38,13,12,4,8,'completado','','2025-09-23 13:49:39',0,43,10000),(39,13,3,7,8,'completado','','2025-09-23 13:50:51',0,43,3000),(40,13,12,4,4,'completado','','2025-09-23 13:52:08',0,44,30000),(41,18,11,11,8,'completado','','2025-09-23 14:00:12',1,43,15000),(42,18,12,4,8,'completado','','2025-09-23 14:00:46',1,43,10000),(43,18,3,7,8,'completado','','2025-09-23 14:01:06',1,43,3000),(44,18,11,11,4,'completado','','2025-09-23 14:01:53',1,44,20000),(45,18,12,4,4,'completado','','2025-09-23 14:02:42',0,44,7500),(46,18,11,11,1,'completado','','2025-09-23 14:04:24',1,24,20000),(47,18,12,4,1,'completado','','2025-09-23 14:05:04',1,24,15000),(48,14,12,4,3,'completado','','2025-09-23 14:16:25',0,42,20000),(49,14,3,7,3,'completado','','2025-09-23 14:16:53',1,42,8000),(50,7,12,4,1,'completado','','2025-09-23 14:24:19',1,18,70000),(51,2,12,4,3,'completado','','2025-09-23 14:26:58',1,2,100000),(52,19,11,5,2,'completado','','2025-09-23 14:33:02',1,45,80000),(53,19,11,5,1,'completado','','2025-09-23 14:35:43',1,48,70000),(54,16,12,4,8,'completado','','2025-09-23 14:42:55',0,22,10000),(55,16,3,7,8,'completado','','2025-09-23 14:43:22',1,22,3500),(56,22,11,3,13,'completado','','2025-09-23 15:20:19',1,42,30000),(57,22,12,4,13,'completado','','2025-09-23 15:20:49',1,42,20000),(58,22,3,7,13,'completado','','2025-09-23 15:21:10',1,42,8000),(59,23,11,1,13,'completado','','2025-09-23 15:24:43',1,22,12000),(60,23,12,4,12,'completado','','2025-09-23 15:25:27',1,22,10000),(61,23,3,7,12,'completado','','2025-09-23 15:26:16',1,22,3500),(62,16,11,5,1,'completado','','2025-09-23 15:58:46',1,25,20000),(63,16,12,4,1,'completado','','2025-09-23 16:01:22',0,25,10000),(64,16,3,7,1,'completado','','2025-09-23 16:04:22',1,25,3500),(65,21,11,1,13,'completado','','2025-09-23 16:07:54',0,22,12000),(66,21,12,4,12,'en proceso','','2025-09-23 16:08:22',0,22,10000),(67,21,3,7,12,'en proceso','','2025-09-23 16:08:40',0,22,3500),(68,19,12,4,1,'completado','','2025-09-23 16:10:41',0,48,25000),(69,19,3,7,1,'completado','','2025-09-23 16:11:14',1,48,15000),(70,19,12,4,1,'completado','','2025-09-23 16:11:43',0,45,25000),(71,16,11,5,1,'completado','','2025-09-23 16:15:48',1,46,1),(72,16,12,4,1,'completado','','2025-09-23 16:16:13',1,46,1),(73,16,3,7,1,'completado','','2025-09-23 16:16:30',1,46,1),(74,16,11,2,1,'completado','','2025-09-23 16:17:15',0,47,10000),(75,16,12,4,1,'completado','','2025-09-23 16:18:24',1,47,10000),(76,24,11,2,1,'completado','','2025-09-23 16:21:23',0,24,10000),(77,24,12,4,1,'completado','','2025-09-23 16:21:56',1,24,10000),(78,16,11,2,1,'completado','','2025-09-26 22:03:40',1,23,1),(79,16,12,4,1,'completado','','2025-09-26 22:04:05',1,23,1),(80,16,11,2,1,'completado','','2025-09-26 22:07:28',1,11,1),(81,16,12,9,1,'completado','','2025-09-26 22:08:58',0,11,12000),(82,16,3,7,1,'completado','','2025-09-26 22:10:12',1,11,5000),(83,25,11,2,1,'completado','','2025-09-26 22:13:26',0,8,1),(84,25,12,4,1,'completado','','2025-09-26 22:14:14',0,8,1),(85,26,11,2,1,'completado','','2025-09-26 22:16:29',1,8,1),(86,26,12,6,1,'completado','','2025-09-26 22:22:08',0,8,18000),(87,26,3,7,1,'completado','','2025-09-26 22:22:24',1,8,7000),(88,23,11,1,2,'completado','','2025-09-26 22:31:16',1,49,25000),(89,19,3,7,1,'completado','','2025-09-26 22:44:59',1,45,7000),(90,27,11,5,4,'completado','','2025-09-26 23:14:30',1,50,20000),(91,27,12,4,4,'completado','','2025-09-26 23:15:18',1,50,7500),(92,27,3,7,4,'completado','','2025-09-26 23:16:47',1,50,4000),(93,27,13,10,4,'completado','','2025-09-26 23:17:12',1,50,25000),(94,28,11,11,32,'completado','SE REGISTRA COMO AVANCE','2025-09-27 19:21:06',1,52,25000),(95,24,3,7,1,'completado','','2025-09-27 19:39:38',1,24,3500),(96,29,11,3,3,'completado','','2025-09-27 19:50:20',1,53,30000),(97,2,11,3,1,'completado','','2025-09-27 19:54:20',1,4,70000),(98,30,11,5,14,'completado','SE ABONARON ADEUDA PENDIENTE','2025-09-27 20:12:07',1,54,20000),(99,31,11,1,17,'completado','ADELANTO DE TRABAJO EMPEZADO','2025-09-27 20:37:34',0,9,15000),(100,28,11,11,18,'completado','','2025-10-01 19:09:48',1,52,25000),(101,16,3,7,1,'completado','','2025-10-01 19:19:30',1,47,3500),(102,16,3,7,1,'completado','','2025-10-01 19:20:05',1,23,5000),(103,14,12,13,2,'completado','','2025-10-01 19:23:39',1,41,20000),(104,14,3,7,2,'completado','','2025-10-01 19:24:05',1,41,5000),(105,11,12,13,12,'completado','','2025-10-01 19:25:02',1,41,20000),(106,11,3,7,6,'completado','','2025-10-01 19:40:25',1,41,5000),(107,2,12,13,1,'completado','','2025-10-01 19:48:17',1,2,100000),(108,2,3,7,4,'completado','','2025-10-01 19:49:27',1,2,25000),(109,2,11,3,1,'completado','','2025-10-01 19:50:20',1,3,100000),(110,23,12,13,1,'completado','','2025-10-01 20:07:28',1,22,10000),(111,23,3,7,1,'completado','','2025-10-01 20:09:09',1,22,3500),(112,28,12,13,12,'en proceso','','2025-10-01 20:16:24',1,52,18000),(113,19,12,13,1,'completado','','2025-10-01 20:19:19',1,45,25000),(114,18,3,7,4,'completado','','2025-10-01 20:22:36',1,44,2000),(115,7,12,13,1,'completado','','2025-10-01 20:39:07',1,18,40000),(116,7,3,7,2,'en proceso','','2025-10-01 20:39:57',1,18,10000),(117,30,12,13,4,'en proceso','','2025-10-01 20:44:12',0,54,7500),(118,30,3,7,4,'en proceso','','2025-10-01 20:44:36',0,54,2000),(119,34,11,5,14,'completado','SE ABONO A SALDO PENDIENTE','2025-10-01 21:14:36',0,50,20000),(120,34,12,13,4,'en proceso','','2025-10-01 21:15:13',1,50,7500),(121,18,13,10,8,'completado','','2025-10-01 21:21:15',1,43,20000),(122,18,13,10,4,'completado','','2025-10-01 21:21:50',1,44,25000),(123,34,3,7,2,'en proceso','','2025-10-01 21:44:55',1,50,2000),(124,35,11,5,4,'completado','','2025-10-01 21:51:12',0,19,1),(125,35,12,4,1,'completado','','2025-10-01 21:51:47',0,19,1),(126,35,12,4,3,'completado','','2025-10-01 21:52:15',0,19,1),(127,35,3,7,4,'completado','','2025-10-01 21:52:33',0,19,8000),(128,36,11,1,5,'completado','','2025-10-01 22:03:25',1,22,1),(129,36,11,1,4,'completado','','2025-10-01 22:03:58',1,56,1),(130,36,12,13,5,'completado','','2025-10-01 22:04:23',1,22,10000),(131,36,12,13,4,'completado','','2025-10-01 22:04:43',1,56,10000),(132,36,3,7,5,'completado','','2025-10-01 22:05:04',1,22,3500),(133,36,3,7,4,'completado','','2025-10-01 22:05:22',1,56,3500),(134,36,13,10,4,'completado','','2025-10-01 22:05:46',1,56,5000),(135,37,11,11,50,'completado','CANCELADAS ','2025-10-01 22:13:22',1,38,25000),(136,37,12,13,12,'completado','','2025-10-01 22:14:32',1,38,18000),(137,38,11,5,4,'completado','','2025-10-02 21:06:10',1,19,1),(138,38,12,4,4,'completado','','2025-10-02 21:06:31',1,19,1),(139,38,3,7,1,'completado','','2025-10-02 21:06:53',1,19,8000),(140,38,3,7,3,'completado','','2025-10-02 21:07:17',1,19,8000),(141,39,11,1,20,'completado','ADELANTO DE TRABAJO EMPEZADO ','2025-10-02 21:29:16',0,6,20000),(142,39,11,1,20,'completado','ADELANTO DE TRABAJO EMPEZADO ','2025-10-02 21:29:18',0,6,20000),(143,40,11,1,20,'completado','ADELANTO DE TRABAJO EMPEZADO','2025-10-02 21:32:22',1,6,20000),(144,40,11,1,26,'completado','','2025-10-02 21:32:54',1,6,20000),(145,41,11,5,6,'completado','SE COMPRARON ECHAS','2025-10-02 21:48:31',1,51,1),(146,41,12,13,6,'completado','','2025-10-02 21:49:08',1,51,15000),(147,42,11,2,1,'completado','','2025-10-02 21:50:58',1,24,1),(148,42,12,4,1,'completado','','2025-10-02 21:51:18',1,24,1),(149,42,3,7,1,'completado','','2025-10-02 21:51:39',1,24,3500),(150,37,11,11,14,'completado','','2025-10-04 20:05:41',0,35,20000),(151,40,12,13,46,'completado','','2025-10-06 20:36:34',1,6,12000),(152,40,3,7,46,'completado','','2025-10-06 20:37:26',1,6,3500),(153,37,12,13,15,'completado','','2025-10-06 20:40:02',1,38,18000),(154,2,12,13,1,'completado','','2025-10-06 20:45:40',1,4,30000),(155,11,3,7,6,'completado','','2025-10-06 20:50:59',1,41,5000),(156,43,11,3,8,'completado','','2025-10-06 21:17:42',1,1,1),(157,43,12,13,8,'completado','','2025-10-06 21:18:12',1,1,1),(158,43,3,7,8,'completado','','2025-10-06 21:18:39',1,1,5000),(159,44,11,2,4,'completado','','2025-10-06 21:22:26',1,6,1),(160,44,12,13,4,'completado','','2025-10-06 21:22:47',1,6,12000),(161,44,3,7,4,'completado','','2025-10-06 21:23:09',1,6,3500),(162,19,3,7,1,'completado','','2025-10-06 21:24:03',1,45,5000),(163,45,11,3,3,'completado','','2025-10-06 21:29:53',1,1,33300),(164,45,11,3,1,'completado','','2025-10-06 21:30:20',1,2,150000),(165,46,11,11,1,'completado','','2025-10-10 19:02:19',1,57,900000),(166,47,11,1,31,'completado','','2025-10-15 14:11:33',0,9,15000),(167,47,11,1,8,'completado','','2025-10-15 14:12:09',0,17,15000),(168,47,11,1,7,'completado','','2025-10-15 14:12:40',0,13,12000),(169,45,12,13,1,'completado','','2025-10-15 14:22:35',0,2,80000),(170,45,3,7,1,'completado','','2025-10-15 14:23:25',0,2,20000),(171,45,12,13,1,'en proceso','','2025-10-15 14:24:08',0,1,20000),(172,45,3,7,1,'en proceso','','2025-10-15 14:24:37',0,1,5000),(173,2,12,13,1,'completado','','2025-10-15 14:35:47',0,3,50000),(174,2,3,7,1,'completado','','2025-10-15 14:36:39',0,3,15000),(175,2,3,7,1,'completado','','2025-10-15 14:38:52',0,4,5000),(176,37,12,13,22,'completado','','2025-10-15 14:40:44',0,38,18000),(177,37,3,7,30,'en proceso','','2025-10-15 14:48:02',0,38,3500),(178,49,11,5,3,'completado','','2025-10-15 15:02:44',0,62,1),(179,49,12,4,3,'completado','','2025-10-15 15:03:08',0,62,1),(180,49,3,7,3,'completado','','2025-10-15 15:04:13',0,62,7000),(181,49,11,5,8,'completado','','2025-10-15 15:04:35',0,63,1),(182,49,12,8,8,'completado','','2025-10-15 15:06:20',0,63,13000),(183,49,3,7,4,'en proceso','','2025-10-15 15:07:10',0,63,5000),(184,46,12,13,1,'completado','','2025-10-15 15:18:43',0,57,350000),(185,46,3,7,1,'completado','','2025-10-15 15:19:43',0,57,70000),(186,31,11,1,14,'completado','','2025-10-15 15:27:31',0,9,15000),(187,50,11,1,8,'completado','','2025-10-15 15:33:11',0,17,15000),(188,50,11,1,7,'completado','','2025-10-15 15:34:17',0,5,12000),(189,51,11,5,2,'completado','','2025-10-15 16:00:59',0,19,1),(190,51,12,13,2,'completado','','2025-10-15 16:01:27',0,19,1),(191,51,3,7,2,'completado','','2025-10-15 16:01:52',0,19,8000),(192,52,11,1,6,'completado','','2025-10-15 16:11:57',0,6,1),(193,52,12,13,5,'completado','','2025-10-15 16:13:21',0,6,10000),(194,52,12,4,1,'completado','','2025-10-15 16:17:50',0,6,1),(195,52,3,7,6,'completado','','2025-10-15 16:18:31',0,6,3500),(196,50,12,13,4,'en proceso','','2025-10-15 16:26:05',0,5,10000),(197,50,3,7,4,'en proceso','','2025-10-15 16:27:35',0,5,3500),(198,53,11,11,1,'completado','','2025-10-15 16:30:10',0,64,1),(199,53,12,13,1,'completado','','2025-10-15 16:30:43',0,64,15000),(200,54,11,5,1,'completado','','2025-10-15 16:34:37',0,65,1),(201,54,12,4,1,'completado','','2025-10-15 16:34:59',0,65,1),(202,54,3,7,1,'completado','','2025-10-15 16:35:21',0,65,15000);
/*!40000 ALTER TABLE `avance_etapas_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'BANCOS'),(3,'MECEDORAS'),(4,'ALCOBAS'),(5,'SILLAS'),(6,'ACCESORIOS'),(7,'COMEDORES'),(10,'MESAS'),(43,'MUEBLES TAPIZADOS'),(44,'PERCHEROS');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `identificacion` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` text,
  `ciudad` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'ABAKO MUEBLES','1038116','300857',NULL,NULL,NULL),(2,'HERNANDO',NULL,'3134683796',NULL,'CUCUTA',NULL),(3,'JALISSA AREIZA',NULL,'3234025269',NULL,'MEDELLIN',NULL),(4,'ABAKO MUEBLES','23333333','12345667777',NULL,NULL,NULL),(5,'JORGUE FRANCO',NULL,'3017204784',NULL,NULL,NULL),(6,'PAOLA GIRALDO',NULL,'3022728445',NULL,'SINCELEJO',NULL),(7,'CAMILA RINCON ANGARITA',NULL,'315483420',NULL,'FUSAGASUGA CUNDINAMARCA',NULL),(9,'RAFAEL',NULL,'3000027635',NULL,NULL,NULL),(10,'RUBEN SERNA',NULL,'3054499362',NULL,NULL,NULL),(11,'SAULON OSPINA',NULL,'3104544968',NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_materia_prima`
--

DROP TABLE IF EXISTS `compras_materia_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_materia_prima` (
  `id_compra_materia_prima` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descripcion_gasto` varchar(255) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` int DEFAULT NULL,
  `fecha_compra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_proveedor` bigint unsigned DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_compra_materia_prima`),
  KEY `idx_compra_mp_proveedor` (`id_proveedor`),
  KEY `idx_compra_mp_fecha` (`fecha_compra`),
  CONSTRAINT `compras_materia_prima_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_materia_prima`
--

LOCK TABLES `compras_materia_prima` WRITE;
/*!40000 ALTER TABLE `compras_materia_prima` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_materia_prima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costos_indirectos`
--

DROP TABLE IF EXISTS `costos_indirectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costos_indirectos` (
  `id_costo_indirecto` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tipo_costo` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `valor` int DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_costo_indirecto`),
  UNIQUE KEY `id_costo_indirecto` (`id_costo_indirecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos_indirectos`
--

LOCK TABLES `costos_indirectos` WRITE;
/*!40000 ALTER TABLE `costos_indirectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos_indirectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costos_indirectos_asignados`
--

DROP TABLE IF EXISTS `costos_indirectos_asignados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costos_indirectos_asignados` (
  `id_asignacion` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_costo_indirecto` bigint unsigned NOT NULL,
  `id_orden_fabricacion` bigint unsigned DEFAULT NULL,
  `anio` year NOT NULL,
  `mes` tinyint NOT NULL,
  `valor_asignado` decimal(10,2) NOT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_orden_fabricacion` (`id_orden_fabricacion`),
  KEY `costos_indirectos_asignados_ibfk_1` (`id_costo_indirecto`),
  CONSTRAINT `costos_indirectos_asignados_ibfk_1` FOREIGN KEY (`id_costo_indirecto`) REFERENCES `costos_indirectos` (`id_costo_indirecto`) ON DELETE CASCADE,
  CONSTRAINT `costos_indirectos_asignados_ibfk_2` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos_indirectos_asignados`
--

LOCK TABLES `costos_indirectos_asignados` WRITE;
/*!40000 ALTER TABLE `costos_indirectos_asignados` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos_indirectos_asignados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden_compra`
--

DROP TABLE IF EXISTS `detalle_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden_compra` (
  `id_detalle_compra` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_orden_compra` bigint unsigned DEFAULT NULL,
  `id_articulo` bigint unsigned DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_orden_fabricacion` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  UNIQUE KEY `id_detalle_compra` (`id_detalle_compra`),
  KEY `id_orden_fabricacion` (`id_orden_fabricacion`),
  KEY `idx_id_orden_compra` (`id_orden_compra`),
  KEY `idx_id_articulo_detalle_compra` (`id_articulo`),
  CONSTRAINT `detalle_orden_compra_ibfk_1` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`),
  CONSTRAINT `fk_detalle_compra_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_oc_orden` FOREIGN KEY (`id_orden_compra`) REFERENCES `ordenes_compra` (`id_orden_compra`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_compra`
--

LOCK TABLES `detalle_orden_compra` WRITE;
/*!40000 ALTER TABLE `detalle_orden_compra` DISABLE KEYS */;
INSERT INTO `detalle_orden_compra` VALUES (1,1,12,2,60000.00,NULL),(2,2,51,6,60000.00,NULL);
/*!40000 ALTER TABLE `detalle_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden_fabricacion`
--

DROP TABLE IF EXISTS `detalle_orden_fabricacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden_fabricacion` (
  `id_detalle_fabricacion` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_orden_fabricacion` bigint unsigned DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `id_etapa_final` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_detalle_fabricacion`),
  UNIQUE KEY `id_detalle_fabricacion` (`id_detalle_fabricacion`),
  KEY `fk_orden_fabricacion` (`id_orden_fabricacion`),
  KEY `etapa_final_cliente` (`id_etapa_final`),
  CONSTRAINT `detalle_orden_fabricacion_ibfk_1` FOREIGN KEY (`id_etapa_final`) REFERENCES `etapas_produccion` (`id_etapa`),
  CONSTRAINT `fk_orden_fabricacion` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_fabricacion`
--

LOCK TABLES `detalle_orden_fabricacion` WRITE;
/*!40000 ALTER TABLE `detalle_orden_fabricacion` DISABLE KEYS */;
INSERT INTO `detalle_orden_fabricacion` VALUES (1,1,1,12,3),(2,2,2,4,3),(3,2,3,1,3),(4,2,4,1,3),(5,3,5,12,3),(6,3,13,8,3),(7,4,1,2,3),(8,5,1,3,3),(9,6,1,3,3),(10,7,18,4,3),(11,8,19,4,3),(12,8,20,1,3),(13,8,25,1,3),(14,8,21,1,13),(15,8,22,8,3),(16,8,26,1,3),(17,8,23,1,3),(18,8,11,1,3),(19,9,24,1,11),(20,10,8,2,3),(21,11,41,12,3),(22,12,41,2,3),(23,12,42,3,3),(24,13,43,8,13),(25,13,44,4,13),(26,13,45,1,3),(27,13,24,1,3),(28,14,41,2,3),(29,14,42,3,3),(30,15,41,2,3),(31,15,42,3,3),(32,16,19,4,3),(33,16,46,1,3),(34,16,25,1,3),(35,16,47,1,3),(36,16,21,1,3),(37,16,22,8,3),(38,16,23,1,3),(39,16,11,1,3),(40,17,24,1,3),(41,18,43,8,13),(42,18,44,4,13),(43,18,45,1,3),(44,18,24,1,3),(45,19,45,2,3),(46,19,48,1,3),(47,20,22,21,3),(48,21,22,13,3),(49,22,42,13,3),(50,23,22,13,3),(51,23,49,2,13),(52,24,24,1,3),(53,25,8,1,3),(54,26,8,1,3),(55,27,50,4,13),(56,28,52,50,3),(57,29,53,3,3),(58,30,54,14,13),(59,31,9,31,3),(60,32,9,20,3),(61,33,50,14,13),(62,34,50,14,13),(63,35,19,4,3),(64,36,22,5,3),(65,36,56,4,13),(66,37,28,5,3),(67,37,29,20,3),(68,37,30,2,3),(69,37,31,30,3),(70,37,32,6,3),(71,37,33,4,3),(72,37,34,6,3),(73,37,35,14,13),(74,37,36,4,3),(75,37,37,4,3),(76,37,38,50,3),(77,37,39,5,3),(78,37,40,2,3),(79,38,19,4,3),(80,39,6,46,3),(81,40,6,46,3),(82,41,51,6,13),(83,42,24,1,3),(84,43,1,8,3),(85,44,6,4,3),(86,45,1,3,3),(87,45,2,1,3),(88,46,57,1,13),(89,47,9,31,3),(90,47,17,8,3),(91,47,13,7,3),(92,48,1,2,3),(93,48,60,1,3),(94,48,61,14,3),(95,49,62,3,3),(96,49,63,8,3),(97,50,17,8,3),(98,50,5,7,3),(99,51,19,2,3),(100,52,6,6,3),(101,53,64,1,3),(102,54,65,1,13);
/*!40000 ALTER TABLE `detalle_orden_fabricacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden_venta`
--

DROP TABLE IF EXISTS `detalle_orden_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden_venta` (
  `id_detalle_venta` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_orden_venta` bigint unsigned DEFAULT NULL,
  `id_articulo` bigint unsigned DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  UNIQUE KEY `id_detalle_venta` (`id_detalle_venta`),
  KEY `idx_dov_orden` (`id_orden_venta`),
  KEY `idx_dov_articulo` (`id_articulo`),
  CONSTRAINT `fk_dov_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_dov_orden_venta` FOREIGN KEY (`id_orden_venta`) REFERENCES `ordenes_venta` (`id_orden_venta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_venta`
--

LOCK TABLES `detalle_orden_venta` WRITE;
/*!40000 ALTER TABLE `detalle_orden_venta` DISABLE KEYS */;
INSERT INTO `detalle_orden_venta` VALUES (1,3,8,2,150000.00,''),(2,4,23,1,1000.00,''),(3,5,59,1,700000.00,''),(4,6,6,8,130000.00,'');
/*!40000 ALTER TABLE `detalle_orden_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pago_trabajador`
--

DROP TABLE IF EXISTS `detalle_pago_trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pago_trabajador` (
  `id_detalle_pago` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pago` bigint unsigned NOT NULL,
  `id_avance_etapa` bigint unsigned DEFAULT NULL,
  `cantidad` int NOT NULL,
  `pago_unitario` bigint DEFAULT NULL,
  `subtotal` decimal(12,2) GENERATED ALWAYS AS ((`cantidad` * `pago_unitario`)) STORED,
  `es_descuento` tinyint DEFAULT '0',
  PRIMARY KEY (`id_detalle_pago`),
  UNIQUE KEY `id_detalle_pago` (`id_detalle_pago`),
  KEY `ix_detalle_pago_por_pago` (`id_pago`),
  KEY `ix_detalle_pago_por_avance_etapa` (`id_avance_etapa`),
  CONSTRAINT `detalle_pago_trabajador_ibfk_2` FOREIGN KEY (`id_avance_etapa`) REFERENCES `avance_etapas_produccion` (`id_avance_etapa`) ON DELETE CASCADE,
  CONSTRAINT `fk_detalle_pago_avance` FOREIGN KEY (`id_avance_etapa`) REFERENCES `avance_etapas_produccion` (`id_avance_etapa`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_pago_pago` FOREIGN KEY (`id_pago`) REFERENCES `pagos_trabajadores` (`id_pago`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pago_trabajador` FOREIGN KEY (`id_pago`) REFERENCES `pagos_trabajadores` (`id_pago`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pago_trabajador`
--

LOCK TABLES `detalle_pago_trabajador` WRITE;
/*!40000 ALTER TABLE `detalle_pago_trabajador` DISABLE KEYS */;
INSERT INTO `detalle_pago_trabajador` (`id_detalle_pago`, `id_pago`, `id_avance_etapa`, `cantidad`, `pago_unitario`, `es_descuento`) VALUES (1,1,13,12,30000,0),(2,2,21,2,1,0),(3,2,3,3,30000,0),(4,3,25,3,30000,0),(5,3,24,2,35000,0),(6,3,2,4,200000,0),(7,4,20,1,20000,0),(8,4,19,1,80000,0),(9,4,18,4,20000,0),(10,4,17,8,15000,0),(11,5,4,4,100000,0),(12,5,NULL,1,-250000,1),(13,6,28,4,35000,0),(14,7,59,13,12000,0),(15,8,34,8,12000,0),(16,9,94,32,25000,0),(17,10,46,1,20000,0),(18,10,44,4,20000,0),(19,10,41,8,15000,0),(20,11,58,13,8000,0),(21,12,30,4,8000,0),(22,13,61,12,3500,0),(23,14,69,1,15000,0),(24,15,43,8,3000,0),(25,16,73,1,1,0),(26,16,33,1,1,0),(27,17,95,1,3500,0),(28,18,85,1,1,0),(29,19,80,1,1,0),(30,19,78,1,1,0),(31,19,31,1,1,0),(32,20,71,1,1,0),(33,21,56,13,30000,0),(34,22,97,1,70000,0),(35,22,NULL,1,-70000,1),(36,23,96,3,30000,0),(37,24,90,4,20000,0),(38,25,53,1,70000,0),(39,25,52,2,80000,0),(40,26,62,1,20000,0),(41,27,51,3,100000,0),(42,28,60,12,10000,0),(43,29,57,13,20000,0),(44,30,42,8,10000,0),(45,31,91,4,7500,0),(46,32,47,1,15000,0),(47,33,79,1,1,0),(48,33,72,1,1,0),(49,34,50,1,70000,0),(50,35,75,1,10000,0),(51,36,77,1,10000,0),(52,37,98,14,20000,0),(53,38,93,4,25000,0),(54,39,88,2,25000,0),(55,40,143,20,20000,0),(56,40,129,4,1,0),(57,40,128,5,1,0),(58,41,109,1,100000,0),(59,42,100,18,25000,0),(60,43,135,50,25000,0),(61,44,146,6,15000,0),(62,44,131,4,10000,0),(63,44,130,5,10000,0),(64,44,120,4,7500,0),(65,44,115,1,40000,0),(66,44,113,1,25000,0),(67,44,112,12,18000,0),(68,44,107,1,100000,0),(69,44,105,12,20000,0),(70,44,103,2,20000,0),(71,45,136,12,18000,0),(72,46,110,1,10000,0),(73,47,149,1,3500,0),(74,47,140,3,8000,0),(75,47,133,4,3500,0),(76,47,132,5,3500,0),(77,47,123,2,2000,0),(78,47,116,2,10000,0),(79,47,114,4,2000,0),(80,47,108,4,25000,0),(81,47,106,6,5000,0),(82,47,104,2,5000,0),(83,47,102,1,5000,0),(84,47,64,1,3500,0),(85,48,139,1,8000,0),(86,48,111,1,3500,0),(87,48,101,1,3500,0),(88,48,92,4,4000,0),(89,48,89,1,7000,0),(90,48,87,1,7000,0),(91,48,82,1,5000,0),(92,48,55,8,3500,0),(93,48,49,3,8000,0),(94,48,23,2,7000,0),(95,49,134,4,5000,0),(96,49,122,4,25000,0),(97,49,121,8,20000,0),(98,50,144,26,20000,0),(99,51,165,1,900000,0),(100,52,160,4,12000,0),(101,52,157,8,1,0),(102,52,154,1,30000,0),(103,52,153,15,18000,0),(104,52,151,46,12000,0),(105,53,162,1,5000,0),(106,53,161,4,3500,0),(107,53,158,8,5000,0),(108,53,155,6,5000,0),(109,53,152,46,3500,0),(110,54,164,1,150000,0),(111,54,163,3,33300,0),(112,54,156,8,1,0),(113,55,148,1,1,0),(114,55,138,4,1,0),(115,56,159,4,1,0),(116,56,147,1,1,0),(117,57,145,6,1,0),(118,57,137,4,1,0),(119,58,32,1,1,0);
/*!40000 ALTER TABLE `detalle_pago_trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pedido` bigint unsigned NOT NULL,
  `id_articulo` bigint unsigned NOT NULL,
  `cantidad` int NOT NULL,
  `observaciones` text,
  `precio_unitario` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,12,'',90000),(2,2,2,4,'',1300000),(3,2,3,1,'',700000),(4,2,4,1,'',500000),(5,3,5,12,'',120000),(6,3,13,8,'',115000),(7,4,1,3,'',90000),(8,5,18,1,'',2000),(9,6,19,4,'',30000),(10,6,20,1,'',9000),(11,6,25,1,'',33333),(12,6,21,1,'',33333333),(13,6,22,8,'',333333),(14,6,26,1,'',0),(15,6,23,1,'',3333),(16,6,24,1,'',200000),(17,7,24,1,'',200000),(18,8,8,2,'',150000),(19,9,28,5,'',300000),(20,9,29,20,'',150000),(21,9,30,2,'',2),(22,9,31,30,'',120000),(23,9,32,6,'',300000),(24,9,33,4,'',800000),(25,9,34,6,'',700000),(26,9,35,14,'',140000),(27,9,36,4,'',150000),(28,9,37,4,'',500000),(29,9,38,50,'',140000),(30,9,39,5,'',60000),(31,9,40,2,'',50000),(32,10,19,6,'',30000),(33,11,41,12,'',30000),(34,12,41,2,'',30000),(35,12,42,3,'',200000),(36,13,43,8,'',200000),(37,13,44,4,'',120000),(38,13,45,1,'',300000),(39,13,24,1,'',200000),(40,14,41,2,'',30000),(41,14,42,3,'',200000),(42,15,19,4,'',30000),(43,15,46,1,'',100000),(44,15,25,1,'',33333),(45,15,47,1,'',100000),(46,15,21,1,'',33333333),(47,15,22,8,'',333333),(48,15,23,1,'',3333),(49,15,11,1,'',120000),(50,16,45,2,'',300000),(51,16,48,1,'',1),(52,17,42,10,'',200000),(53,18,22,21,'',333333),(54,19,22,13,'',333333),(55,20,42,13,'',200000),(56,21,22,13,'',333333),(57,21,49,2,'',2),(58,22,8,1,'',150000),(59,23,50,4,'',4),(60,24,52,50,'',50),(61,25,53,3,'',30000),(62,26,54,20,'',20),(64,28,9,31,'',100000),(65,29,9,20,'',100000),(66,30,50,14,'',4),(67,31,50,14,'',4),(68,32,19,4,'',30000),(69,33,22,5,'',333333),(70,34,22,5,'',333333),(71,34,56,1,'',4),(72,35,6,46,'',120000),(73,36,51,6,'',160000),(74,37,24,1,'',200000),(75,27,55,31,NULL,115000),(76,38,1,3,'',200000),(77,38,2,1,'',1300000),(78,39,1,8,'',200000),(79,40,6,4,'',120000),(80,41,57,1,'',3000000),(81,42,9,31,'',100000),(82,42,17,8,'',12222),(83,42,13,7,'',115000),(84,43,1,2,'',200000),(85,43,60,1,'',800000),(86,43,61,14,'',120000),(87,44,62,3,'',120000),(88,44,63,8,'',120000),(89,45,17,8,'',12222),(90,45,5,7,'',120000),(91,46,19,2,'',30000),(92,47,6,6,'',120000),(93,48,64,1,'',100000),(94,49,65,1,'',200000);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapas_produccion`
--

DROP TABLE IF EXISTS `etapas_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapas_produccion` (
  `id_etapa` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `orden` int NOT NULL DEFAULT '1',
  `cargo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_etapa`),
  UNIQUE KEY `id_etapa` (`id_etapa`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapas_produccion`
--

LOCK TABLES `etapas_produccion` WRITE;
/*!40000 ALTER TABLE `etapas_produccion` DISABLE KEYS */;
INSERT INTO `etapas_produccion` VALUES (3,'Pintura',NULL,3,'pintor'),(11,'Carpinteria',NULL,1,'carpintero'),(12,'Pulido',NULL,2,'pulidor'),(13,'Tapizado',NULL,4,'tapizador');
/*!40000 ALTER TABLE `etapas_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_costos`
--

DROP TABLE IF EXISTS `historial_costos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_costos` (
  `id_historial` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_articulo` bigint unsigned DEFAULT NULL,
  `id_etapa` bigint unsigned DEFAULT NULL,
  `costo_unitario` decimal(10,2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_articulo` (`id_articulo`),
  KEY `ix_historial_etapa_fecha` (`id_etapa`,`fecha_inicio`),
  CONSTRAINT `historial_costos_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`),
  CONSTRAINT `historial_costos_ibfk_2` FOREIGN KEY (`id_etapa`) REFERENCES `etapas_produccion` (`id_etapa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_costos`
--

LOCK TABLES `historial_costos` WRITE;
/*!40000 ALTER TABLE `historial_costos` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_costos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_articulo` bigint unsigned NOT NULL,
  `stock` int DEFAULT NULL,
  `stock_fabricado` int NOT NULL DEFAULT '0',
  `stock_minimo` int DEFAULT NULL,
  `ultima_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inventario`),
  KEY `fk1_inventario_articulo` (`id_articulo`),
  CONSTRAINT `fk1_inventario_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`) ON DELETE CASCADE,
  CONSTRAINT `inventario_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,9,9,2,'2025-10-15 14:24:37'),(2,2,5,5,2,'2025-10-15 14:23:25'),(3,3,1,1,2,'2025-10-15 14:36:40'),(4,4,1,1,2,'2025-10-15 14:38:53'),(5,5,39,4,0,'2025-10-15 16:27:36'),(6,10,2,0,0,'2025-09-10 22:59:07'),(7,11,6,1,0,'2025-09-26 22:10:13'),(8,12,2,0,2,'2025-09-13 13:20:58'),(9,13,0,0,2,'2025-09-10 23:23:35'),(10,15,1,0,1,'2025-10-04 08:06:08'),(11,16,1,0,0,'2025-09-12 14:24:33'),(12,17,6,0,0,'2025-09-12 14:29:14'),(13,18,2,2,2,'2025-10-01 20:39:57'),(14,19,14,14,0,'2025-10-15 16:01:53'),(15,20,1,0,1,'2025-09-12 16:21:37'),(16,21,1,1,0,'2025-09-17 21:00:04'),(17,22,46,46,0,'2025-10-01 22:05:04'),(18,23,2,1,2,'2025-10-11 20:02:30'),(19,24,3,3,0,'2025-10-02 21:51:40'),(20,8,1,3,2,'2025-10-11 19:53:54'),(21,25,1,1,2,'2025-09-23 16:04:22'),(22,26,0,0,2,'2025-09-12 15:46:03'),(23,28,0,0,2,'2025-09-13 20:12:41'),(24,29,0,0,2,'2025-09-13 20:14:06'),(25,30,0,0,2,'2025-09-13 20:16:48'),(26,31,0,0,2,'2025-09-13 20:20:04'),(27,32,0,0,2,'2025-09-13 20:21:56'),(28,33,0,0,2,'2025-09-13 20:23:38'),(29,34,0,0,2,'2025-09-13 20:24:54'),(30,35,0,0,2,'2025-09-13 20:27:17'),(31,36,0,0,2,'2025-09-13 20:29:08'),(32,37,0,0,2,'2025-09-13 20:30:14'),(33,38,30,30,2,'2025-10-15 14:48:02'),(34,39,0,0,2,'2025-09-13 20:36:13'),(35,40,0,0,2,'2025-09-13 20:38:06'),(36,41,14,14,2,'2025-10-06 20:50:59'),(37,42,16,16,2,'2025-09-23 15:21:10'),(38,43,8,8,2,'2025-10-01 21:21:16'),(39,44,4,4,2,'2025-10-01 21:21:51'),(40,45,2,2,2,'2025-10-06 21:24:04'),(41,46,1,1,2,'2025-09-23 16:16:30'),(42,47,1,1,2,'2025-10-01 19:19:31'),(43,48,1,1,2,'2025-09-23 16:11:15'),(44,49,0,0,2,'2025-09-23 15:23:12'),(45,50,4,4,2,'2025-09-26 23:17:13'),(46,51,6,0,2,'2025-10-04 20:48:08'),(47,52,0,0,2,'2025-09-27 19:18:03'),(48,53,0,0,2,'2025-09-27 19:43:24'),(49,54,0,0,2,'2025-09-27 20:07:51'),(50,55,0,0,2,'2025-09-27 20:27:34'),(51,9,0,0,2,'2025-09-27 20:30:42'),(52,56,4,4,2,'2025-10-01 22:05:46'),(53,6,48,56,2,'2025-10-15 16:18:32'),(54,57,0,0,2,'2025-10-06 21:35:36'),(55,59,0,0,0,'2025-10-11 20:48:56'),(56,60,0,0,2,'2025-10-15 14:15:32'),(57,61,0,0,2,'2025-10-15 14:16:06'),(58,62,3,3,2,'2025-10-15 15:04:14'),(59,63,4,4,2,'2025-10-15 15:07:10'),(60,64,0,0,2,'2025-10-15 16:28:56'),(61,65,0,0,2,'2025-10-15 16:33:36');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotes_fabricados`
--

DROP TABLE IF EXISTS `lotes_fabricados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes_fabricados` (
  `id_lote` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_orden_fabricacion` bigint unsigned NOT NULL,
  `id_articulo` bigint unsigned NOT NULL,
  `id_trabajador` bigint unsigned NOT NULL,
  `cantidad` int NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` text,
  PRIMARY KEY (`id_lote`),
  KEY `id_articulo` (`id_articulo`),
  KEY `id_trabajador` (`id_trabajador`),
  KEY `lotes_fabricados_ibfk_1` (`id_orden_fabricacion`),
  CONSTRAINT `lotes_fabricados_ibfk_1` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`) ON DELETE CASCADE,
  CONSTRAINT `lotes_fabricados_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`),
  CONSTRAINT `lotes_fabricados_ibfk_3` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes_fabricados`
--

LOCK TABLES `lotes_fabricados` WRITE;
/*!40000 ALTER TABLE `lotes_fabricados` DISABLE KEYS */;
INSERT INTO `lotes_fabricados` VALUES (2,10,8,7,2,'2025-09-17 19:42:26',NULL),(3,16,19,7,4,'2025-09-17 20:58:46',NULL),(4,16,21,7,1,'2025-09-17 21:00:04',NULL),(6,14,42,7,3,'2025-09-23 14:16:53',NULL),(7,16,22,7,8,'2025-09-23 14:43:22',NULL),(8,22,42,7,13,'2025-09-23 15:21:10',NULL),(9,23,22,7,12,'2025-09-23 15:26:16',NULL),(10,16,25,7,1,'2025-09-23 16:04:22',NULL),(12,19,48,7,1,'2025-09-23 16:11:15',NULL),(13,16,46,7,1,'2025-09-23 16:16:30',NULL),(14,16,11,7,1,'2025-09-26 22:10:12',NULL),(15,26,8,7,1,'2025-09-26 22:22:24',NULL),(16,19,45,7,1,'2025-09-26 22:44:59',NULL),(17,27,50,10,4,'2025-09-26 23:17:12',NULL),(18,24,24,7,1,'2025-09-27 19:39:38',NULL),(19,16,47,7,1,'2025-10-01 19:19:30',NULL),(20,16,23,7,1,'2025-10-01 19:20:05',NULL),(21,14,41,7,2,'2025-10-01 19:24:05',NULL),(22,11,41,7,6,'2025-10-01 19:40:25',NULL),(23,2,2,7,4,'2025-10-01 19:49:27',NULL),(24,23,22,7,1,'2025-10-01 20:09:09',NULL),(25,7,18,7,2,'2025-10-01 20:39:57',NULL),(26,18,43,10,8,'2025-10-01 21:21:15',NULL),(27,18,44,10,4,'2025-10-01 21:21:51',NULL),(29,36,22,7,5,'2025-10-01 22:05:04',NULL),(30,36,56,10,4,'2025-10-01 22:05:46',NULL),(31,38,19,7,1,'2025-10-02 21:06:53',NULL),(32,38,19,7,3,'2025-10-02 21:07:17',NULL),(33,42,24,7,1,'2025-10-02 21:51:39',NULL),(34,40,6,7,46,'2025-10-06 20:37:27',NULL),(35,11,41,7,6,'2025-10-06 20:50:59',NULL),(36,43,1,7,8,'2025-10-06 21:18:39',NULL),(37,44,6,7,4,'2025-10-06 21:23:09',NULL),(38,19,45,7,1,'2025-10-06 21:24:03',NULL),(39,45,2,7,1,'2025-10-15 14:23:25',NULL),(40,45,1,7,1,'2025-10-15 14:24:37',NULL),(41,2,3,7,1,'2025-10-15 14:36:39',NULL),(42,2,4,7,1,'2025-10-15 14:38:52',NULL),(43,37,38,7,30,'2025-10-15 14:48:02',NULL),(44,49,62,7,3,'2025-10-15 15:04:13',NULL),(45,49,63,7,4,'2025-10-15 15:07:10',NULL),(46,51,19,7,2,'2025-10-15 16:01:52',NULL),(47,52,6,7,6,'2025-10-15 16:18:31',NULL),(48,50,5,7,4,'2025-10-15 16:27:35',NULL);
/*!40000 ALTER TABLE `lotes_fabricados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('contado','credito') NOT NULL DEFAULT 'contado',
  PRIMARY KEY (`id_metodo_pago`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'EFECTIVO','contado'),(2,'TRANSFERENCIA BANCARIA','contado'),(3,'NEQUI','contado'),(4,'CREDITO','credito');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id_movimiento` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_articulo` bigint unsigned DEFAULT NULL,
  `cantidad_movida` int NOT NULL,
  `tipo_movimiento` enum('entrada','salida','ajuste') NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` text,
  `tipo_origen_movimiento` enum('inicial','produccion','venta','compra','ajuste_manual','devolucion_cliente','devolucion_proveedor') NOT NULL,
  `referencia_documento_id` bigint unsigned DEFAULT NULL,
  `referencia_documento_tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  UNIQUE KEY `id_inventario` (`id_movimiento`),
  KEY `ix_inventario_articulo_fecha` (`id_articulo`,`fecha_movimiento`),
  KEY `ix_inventario_tipo` (`tipo_movimiento`),
  KEY `ix_inventario_origen` (`tipo_origen_movimiento`),
  CONSTRAINT `fk_inventario_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,1,0,'entrada','2025-09-10 22:01:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(2,2,0,'entrada','2025-09-10 22:19:22','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(3,3,0,'entrada','2025-09-10 22:20:29','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(4,4,0,'entrada','2025-09-10 22:21:21','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(5,5,35,'entrada','2025-09-10 22:39:13','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(6,10,2,'entrada','2025-09-10 22:59:07','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(7,11,5,'entrada','2025-09-10 23:00:44','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(8,12,0,'entrada','2025-09-10 23:07:01','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(9,13,0,'entrada','2025-09-10 23:23:35','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(10,11,0,'ajuste','2025-09-12 14:21:43','Ajuste manual de stock. Stock anterior: 5, Nuevo stock: 5. Stock mínimo: 0','ajuste_manual',NULL,NULL),(11,15,1,'entrada','2025-09-12 14:23:14','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(12,16,1,'entrada','2025-09-12 14:24:33','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(13,17,6,'entrada','2025-09-12 14:29:14','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(14,18,0,'entrada','2025-09-12 15:20:49','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(15,19,0,'entrada','2025-09-12 15:36:28','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(16,20,0,'entrada','2025-09-12 15:37:34','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(17,21,0,'entrada','2025-09-12 15:38:33','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(18,22,0,'entrada','2025-09-12 15:39:38','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(19,23,0,'entrada','2025-09-12 15:40:18','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(20,24,0,'entrada','2025-09-12 15:41:17','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(21,8,0,'entrada','2025-09-12 15:42:58','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(22,25,0,'entrada','2025-09-12 15:44:39','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(23,26,0,'entrada','2025-09-12 15:46:03','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(24,23,1,'ajuste','2025-09-12 16:14:04','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 0','ajuste_manual',NULL,NULL),(25,23,1,'ajuste','2025-09-12 16:17:58','Ajuste manual de stock. Stock anterior: 1, Nuevo stock: 2. Stock mínimo: 2','ajuste_manual',NULL,NULL),(26,20,1,'ajuste','2025-09-12 16:21:37','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 1','ajuste_manual',NULL,NULL),(27,22,8,'entrada','2025-09-12 16:35:08','Lote #1 de Orden de Fabricación #8 completado.','produccion',1,'lote'),(28,12,2,'entrada','2025-09-13 13:20:58','Entrada por recepción de orden de compra #1','compra',1,'orden_compra'),(29,28,0,'entrada','2025-09-13 20:12:41','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(30,29,0,'entrada','2025-09-13 20:14:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(31,30,0,'entrada','2025-09-13 20:16:48','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(32,31,0,'entrada','2025-09-13 20:20:04','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(33,32,0,'entrada','2025-09-13 20:21:56','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(34,33,0,'entrada','2025-09-13 20:23:38','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(35,34,0,'entrada','2025-09-13 20:24:54','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(36,35,0,'entrada','2025-09-13 20:27:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(37,36,0,'entrada','2025-09-13 20:29:08','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(38,37,0,'entrada','2025-09-13 20:30:14','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(39,38,0,'entrada','2025-09-13 20:31:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(40,39,0,'entrada','2025-09-13 20:36:13','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(41,40,0,'entrada','2025-09-13 20:38:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(42,41,0,'entrada','2025-09-13 21:20:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(43,42,0,'entrada','2025-09-15 14:32:47','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(44,43,0,'entrada','2025-09-15 14:40:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(45,44,0,'entrada','2025-09-15 14:41:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(46,45,0,'entrada','2025-09-15 14:41:46','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(47,8,2,'entrada','2025-09-17 19:42:26','Lote #2 de Orden de Fabricación #10 completado.','produccion',2,'lote'),(48,46,0,'entrada','2025-09-17 20:52:23','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(49,47,0,'entrada','2025-09-17 20:53:34','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(50,19,4,'entrada','2025-09-17 20:58:47','Lote #3 de Orden de Fabricación #16 completado.','produccion',3,'lote'),(51,21,1,'entrada','2025-09-17 21:00:04','Lote #4 de Orden de Fabricación #16 completado.','produccion',4,'lote'),(52,24,1,'entrada','2025-09-23 13:46:50','Lote #5 de Orden de Fabricación #17 completado.','produccion',5,'lote'),(53,42,3,'entrada','2025-09-23 14:16:54','Lote #6 de Orden de Fabricación #14 completado.','produccion',6,'lote'),(54,48,0,'entrada','2025-09-23 14:30:20','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(55,22,8,'entrada','2025-09-23 14:43:23','Lote #7 de Orden de Fabricación #16 completado.','produccion',7,'lote'),(56,42,13,'entrada','2025-09-23 15:21:10','Lote #8 de Orden de Fabricación #22 completado.','produccion',8,'lote'),(57,49,0,'entrada','2025-09-23 15:23:12','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(58,22,12,'entrada','2025-09-23 15:26:17','Lote #9 de Orden de Fabricación #23 completado.','produccion',9,'lote'),(59,25,1,'entrada','2025-09-23 16:04:22','Lote #10 de Orden de Fabricación #16 completado.','produccion',10,'lote'),(60,22,12,'entrada','2025-09-23 16:08:41','Lote #11 de Orden de Fabricación #21 completado.','produccion',11,'lote'),(61,48,1,'entrada','2025-09-23 16:11:15','Lote #12 de Orden de Fabricación #19 completado.','produccion',12,'lote'),(62,46,1,'entrada','2025-09-23 16:16:30','Lote #13 de Orden de Fabricación #16 completado.','produccion',13,'lote'),(63,11,1,'entrada','2025-09-26 22:10:13','Lote #14 de Orden de Fabricación #16 completado.','produccion',14,'lote'),(64,8,1,'entrada','2025-09-26 22:22:25','Lote #15 de Orden de Fabricación #26 completado.','produccion',15,'lote'),(65,45,1,'entrada','2025-09-26 22:44:59','Lote #16 de Orden de Fabricación #19 completado.','produccion',16,'lote'),(66,50,0,'entrada','2025-09-26 23:12:37','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(67,50,4,'entrada','2025-09-26 23:17:13','Lote #17 de Orden de Fabricación #27 completado.','produccion',17,'lote'),(68,51,0,'entrada','2025-09-26 23:23:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(69,52,0,'entrada','2025-09-27 19:18:03','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(70,24,1,'entrada','2025-09-27 19:39:38','Lote #18 de Orden de Fabricación #24 completado.','produccion',18,'lote'),(71,53,0,'entrada','2025-09-27 19:43:24','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(72,54,0,'entrada','2025-09-27 20:07:51','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(73,55,0,'entrada','2025-09-27 20:27:34','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(74,9,0,'entrada','2025-09-27 20:30:42','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(75,47,1,'entrada','2025-10-01 19:19:31','Lote #19 de Orden de Fabricación #16 completado.','produccion',19,'lote'),(76,23,1,'entrada','2025-10-01 19:20:06','Lote #20 de Orden de Fabricación #16 completado.','produccion',20,'lote'),(77,41,2,'entrada','2025-10-01 19:24:06','Lote #21 de Orden de Fabricación #14 completado.','produccion',21,'lote'),(78,41,6,'entrada','2025-10-01 19:40:25','Lote #22 de Orden de Fabricación #11 completado.','produccion',22,'lote'),(79,2,4,'entrada','2025-10-01 19:49:28','Lote #23 de Orden de Fabricación #2 completado.','produccion',23,'lote'),(80,22,1,'entrada','2025-10-01 20:09:09','Lote #24 de Orden de Fabricación #23 completado.','produccion',24,'lote'),(81,18,2,'entrada','2025-10-01 20:39:57','Lote #25 de Orden de Fabricación #7 completado.','produccion',25,'lote'),(82,43,8,'entrada','2025-10-01 21:21:16','Lote #26 de Orden de Fabricación #18 completado.','produccion',26,'lote'),(83,44,4,'entrada','2025-10-01 21:21:51','Lote #27 de Orden de Fabricación #18 completado.','produccion',27,'lote'),(84,19,4,'entrada','2025-10-01 21:52:34','Lote #28 de Orden de Fabricación #35 completado.','produccion',28,'lote'),(85,56,0,'entrada','2025-10-01 21:57:13','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(86,22,5,'entrada','2025-10-01 22:05:04','Lote #29 de Orden de Fabricación #36 completado.','produccion',29,'lote'),(87,56,4,'entrada','2025-10-01 22:05:46','Lote #30 de Orden de Fabricación #36 completado.','produccion',30,'lote'),(88,19,1,'entrada','2025-10-02 21:06:54','Lote #31 de Orden de Fabricación #38 completado.','produccion',31,'lote'),(89,19,3,'entrada','2025-10-02 21:07:17','Lote #32 de Orden de Fabricación #38 completado.','produccion',32,'lote'),(90,6,0,'entrada','2025-10-02 21:20:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(91,24,1,'entrada','2025-10-02 21:51:40','Lote #33 de Orden de Fabricación #42 completado.','produccion',33,'lote'),(92,15,1,'salida','2025-10-04 07:34:40','Salida por orden de venta #1','venta',1,'orden_venta'),(93,15,1,'entrada','2025-10-04 07:38:49','Reintegro por anulación de orden de venta #1','devolucion_cliente',1,'anulacion_orden_venta'),(94,15,1,'salida','2025-10-04 08:05:03','Salida por orden de venta #2','venta',2,'orden_venta'),(95,15,1,'entrada','2025-10-04 08:06:08','Reintegro por anulación de orden de venta #2','devolucion_cliente',2,'anulacion_orden_venta'),(96,51,6,'entrada','2025-10-04 20:48:08','Entrada por recepción de orden de compra #2','compra',2,'orden_compra'),(97,6,46,'entrada','2025-10-06 20:37:27','Lote #34 de Orden de Fabricación #40 completado.','produccion',34,'lote'),(98,41,6,'entrada','2025-10-06 20:50:59','Lote #35 de Orden de Fabricación #11 completado.','produccion',35,'lote'),(99,1,8,'entrada','2025-10-06 21:18:40','Lote #36 de Orden de Fabricación #43 completado.','produccion',36,'lote'),(100,6,4,'entrada','2025-10-06 21:23:09','Lote #37 de Orden de Fabricación #44 completado.','produccion',37,'lote'),(101,45,1,'entrada','2025-10-06 21:24:04','Lote #38 de Orden de Fabricación #19 completado.','produccion',38,'lote'),(102,57,0,'entrada','2025-10-06 21:35:36','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(103,8,2,'salida','2025-10-11 19:53:54','Salida por orden de venta #3','venta',3,'orden_venta'),(104,23,1,'salida','2025-10-11 20:02:30','Salida por orden de venta #4','venta',4,'orden_venta'),(105,59,1,'entrada','2025-10-11 20:47:52','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(106,59,1,'salida','2025-10-11 20:48:56','Salida por orden de venta #5','venta',5,'orden_venta'),(107,6,8,'salida','2025-10-11 20:53:59','Salida por orden de venta #6','venta',6,'orden_venta'),(108,60,0,'entrada','2025-10-15 14:15:32','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(109,61,0,'entrada','2025-10-15 14:16:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(110,2,1,'entrada','2025-10-15 14:23:25','Lote #39 de Orden de Fabricación #45 completado.','produccion',39,'lote'),(111,1,1,'entrada','2025-10-15 14:24:37','Lote #40 de Orden de Fabricación #45 completado.','produccion',40,'lote'),(112,3,1,'entrada','2025-10-15 14:36:40','Lote #41 de Orden de Fabricación #2 completado.','produccion',41,'lote'),(113,4,1,'entrada','2025-10-15 14:38:53','Lote #42 de Orden de Fabricación #2 completado.','produccion',42,'lote'),(114,38,30,'entrada','2025-10-15 14:48:02','Lote #43 de Orden de Fabricación #37 completado.','produccion',43,'lote'),(115,62,0,'entrada','2025-10-15 14:55:45','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(116,63,0,'entrada','2025-10-15 14:57:12','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(117,62,3,'entrada','2025-10-15 15:04:14','Lote #44 de Orden de Fabricación #49 completado.','produccion',44,'lote'),(118,63,4,'entrada','2025-10-15 15:07:10','Lote #45 de Orden de Fabricación #49 completado.','produccion',45,'lote'),(119,19,2,'entrada','2025-10-15 16:01:53','Lote #46 de Orden de Fabricación #51 completado.','produccion',46,'lote'),(120,6,6,'entrada','2025-10-15 16:18:32','Lote #47 de Orden de Fabricación #52 completado.','produccion',47,'lote'),(121,5,4,'entrada','2025-10-15 16:27:36','Lote #48 de Orden de Fabricación #50 completado.','produccion',48,'lote'),(122,64,0,'entrada','2025-10-15 16:28:56','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(123,65,0,'entrada','2025-10-15 16:33:36','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual');
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_tesoreria`
--

DROP TABLE IF EXISTS `movimientos_tesoreria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_tesoreria` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_documento` bigint unsigned DEFAULT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `fecha_movimiento` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `movimientos_tesoreria_ibfk_1` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_tesoreria`
--

LOCK TABLES `movimientos_tesoreria` WRITE;
/*!40000 ALTER TABLE `movimientos_tesoreria` DISABLE KEYS */;
INSERT INTO `movimientos_tesoreria` VALUES (1,2,'orden_venta','2025-10-04 08:05:03',6000.00,1,'',''),(2,2,'orden_compra','2025-10-04 20:47:53',-360000.00,1,NULL,NULL),(3,2,'abono_credito','2025-10-11 19:54:25',200000.00,2,NULL,NULL),(4,5,'orden_venta','2025-10-11 20:48:57',700000.00,2,'',''),(5,6,'orden_venta','2025-10-11 20:53:59',1040000.00,1,'','');
/*!40000 ALTER TABLE `movimientos_tesoreria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_compra`
--

DROP TABLE IF EXISTS `ordenes_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_compra` (
  `id_orden_compra` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_proveedor` bigint unsigned NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria_costo` varchar(100) DEFAULT NULL,
  `id_orden_fabricacion` bigint unsigned DEFAULT NULL,
  `estado` enum('pendiente','completada','cancelada') NOT NULL DEFAULT 'pendiente',
  PRIMARY KEY (`id_orden_compra`),
  UNIQUE KEY `id_compra` (`id_orden_compra`),
  KEY `fk_ordenes_compra_proveedor` (`id_proveedor`),
  KEY `fk_oc_ordenCompra` (`id_orden_fabricacion`),
  CONSTRAINT `fk_oc_ordenCompra` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`) ON DELETE CASCADE,
  CONSTRAINT `fk_ordenes_compra_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_compra`
--

LOCK TABLES `ordenes_compra` WRITE;
/*!40000 ALTER TABLE `ordenes_compra` DISABLE KEYS */;
INSERT INTO `ordenes_compra` VALUES (1,1,'2025-09-10 23:07:08',NULL,NULL,'completada'),(2,1,'2025-10-04 20:47:53',NULL,NULL,'completada');
/*!40000 ALTER TABLE `ordenes_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_fabricacion`
--

DROP TABLE IF EXISTS `ordenes_fabricacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_fabricacion` (
  `id_orden_fabricacion` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_orden_venta` bigint unsigned DEFAULT NULL,
  `fecha_inicio` date DEFAULT (curdate()),
  `fecha_fin_estimada` date DEFAULT NULL,
  `estado` enum('pendiente','en proceso','completada','cancelada') NOT NULL DEFAULT 'pendiente',
  `id_pedido` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_orden_fabricacion`),
  UNIQUE KEY `id_orden_fabricacion` (`id_orden_fabricacion`),
  KEY `fk_ofab_orden_venta` (`id_orden_venta`),
  KEY `fk_ofab_pedido` (`id_pedido`),
  CONSTRAINT `fk_ofab_orden_venta` FOREIGN KEY (`id_orden_venta`) REFERENCES `ordenes_venta` (`id_orden_venta`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ofab_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_fabricacion`
--

LOCK TABLES `ordenes_fabricacion` WRITE;
/*!40000 ALTER TABLE `ordenes_fabricacion` DISABLE KEYS */;
INSERT INTO `ordenes_fabricacion` VALUES (1,NULL,'2025-09-01','2025-10-01','cancelada',1),(2,NULL,'2025-08-27','2025-09-27','completada',2),(3,NULL,'2025-09-10','2025-10-10','cancelada',3),(4,NULL,'2025-09-01','2025-09-30','cancelada',1),(5,NULL,'2025-09-01','2025-09-13','cancelada',1),(6,NULL,'2025-09-01','2025-09-20','cancelada',4),(7,NULL,'2025-09-01','2025-10-01','en proceso',5),(8,NULL,'2025-09-08','2025-10-08','cancelada',6),(9,NULL,'2025-09-08','2025-10-08','cancelada',7),(10,NULL,'2025-09-10','2025-09-10','completada',8),(11,NULL,'2025-09-06','2025-09-06','completada',11),(12,NULL,'2025-09-06','2025-09-30','cancelada',12),(13,NULL,'2025-09-07','2025-09-30','cancelada',13),(14,NULL,'2025-09-13','2025-09-30','completada',12),(15,NULL,'2025-09-13','2025-09-30','cancelada',14),(16,NULL,'2025-09-08','2025-10-08','completada',15),(17,NULL,'2025-09-13','2025-09-30','cancelada',7),(18,NULL,'2025-09-13','2025-10-13','en proceso',13),(19,NULL,'2025-09-06','2025-09-06','completada',16),(20,NULL,'2025-09-20','2025-09-30','cancelada',18),(21,NULL,'2025-09-20','2025-09-30','cancelada',19),(22,NULL,'2025-09-20','2025-09-30','completada',20),(23,NULL,'2025-09-20','2025-10-06','en proceso',21),(24,NULL,'2025-09-20','2025-09-15','completada',7),(25,NULL,'2025-08-30','2025-09-30','cancelada',22),(26,NULL,'2025-08-30','2025-09-30','completada',22),(27,NULL,'2025-07-12','2025-09-13','completada',23),(28,NULL,'2025-09-20','2025-10-20','en proceso',24),(29,NULL,'2025-09-20','2025-10-20','en proceso',25),(30,NULL,'2025-09-20','2025-10-20','cancelada',26),(31,NULL,'2025-09-20','2025-10-20','en proceso',28),(32,NULL,'2025-09-10','2025-10-10','cancelada',29),(33,NULL,'2025-09-20','2025-10-20','cancelada',30),(34,NULL,'2025-09-20','2025-10-20','en proceso',31),(35,NULL,'2025-09-27','2025-10-17','cancelada',32),(36,NULL,'2025-09-27','2025-10-09','completada',34),(37,NULL,'2025-09-27','2025-10-27','en proceso',9),(38,NULL,'2025-09-27','2025-10-10','completada',32),(39,NULL,'2025-09-27','2025-10-27','cancelada',35),(40,NULL,'2025-09-27','2025-10-27','completada',35),(41,NULL,'2025-09-27','2025-10-27','en proceso',36),(42,NULL,'2025-09-27','2025-10-02','completada',37),(43,NULL,'2025-10-04','2025-10-07','completada',39),(44,NULL,'2025-10-04','2025-10-07','completada',40),(45,NULL,'2025-10-04','2025-10-04','en proceso',38),(46,NULL,'2025-10-04','2025-11-04','en proceso',41),(47,NULL,'2025-10-11','2025-11-11','cancelada',42),(48,NULL,'2025-10-11','2025-11-11','pendiente',43),(49,NULL,'2025-10-11','2025-11-11','en proceso',44),(50,NULL,'2025-10-11','2025-11-11','en proceso',45),(51,NULL,'2025-10-11','2025-10-16','completada',46),(52,NULL,'2025-10-11','2025-10-17','completada',47),(53,NULL,'2025-10-11','2025-10-18','en proceso',48),(54,NULL,'2025-10-11','2025-11-11','en proceso',49);
/*!40000 ALTER TABLE `ordenes_fabricacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_venta`
--

DROP TABLE IF EXISTS `ordenes_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_venta` (
  `id_orden_venta` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` bigint unsigned DEFAULT NULL,
  `estado` enum('pendiente','completada','anulada') DEFAULT 'pendiente',
  `monto` int NOT NULL,
  `total` int DEFAULT NULL,
  `id_pedido` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_orden_venta`),
  UNIQUE KEY `id_orden_venta` (`id_orden_venta`),
  KEY `fk_ov_cliente` (`id_cliente`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `fk_ordenes_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_ov_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ordenes_venta_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_venta`
--

LOCK TABLES `ordenes_venta` WRITE;
/*!40000 ALTER TABLE `ordenes_venta` DISABLE KEYS */;
INSERT INTO `ordenes_venta` VALUES (2,'2025-10-04 00:00:00',1,'anulada',6000,6000,NULL),(3,'2025-10-11 00:00:00',6,'completada',300000,300000,NULL),(4,'2025-10-11 00:00:00',1,'completada',1000,1000,NULL),(5,'2025-10-04 00:00:00',10,'completada',700000,700000,NULL),(6,'2025-10-08 00:00:00',11,'completada',1040000,1040000,NULL);
/*!40000 ALTER TABLE `ordenes_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_trabajadores`
--

DROP TABLE IF EXISTS `pagos_trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_trabajadores` (
  `id_pago` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_trabajador` bigint unsigned NOT NULL,
  `fecha_pago` datetime DEFAULT CURRENT_TIMESTAMP,
  `monto_total` bigint DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `id_pago` (`id_pago`),
  KEY `ix_pagos_por_trabajador` (`id_trabajador`),
  CONSTRAINT `fk_pagos_trabajador_trabajador` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_trabajadores`
--

LOCK TABLES `pagos_trabajadores` WRITE;
/*!40000 ALTER TABLE `pagos_trabajadores` DISABLE KEYS */;
INSERT INTO `pagos_trabajadores` VALUES (1,1,'2025-09-20 15:20:57',360000,''),(2,5,'2025-09-20 15:36:10',90002,''),(3,3,'2025-09-20 15:42:31',960000,''),(4,2,'2025-09-20 15:45:42',300000,''),(5,2,'2025-09-20 15:46:20',150000,''),(6,5,'2025-09-20 15:52:45',140000,'ESTO ES DE TRABAJO VIEJO. SE FINALIZAN PARA QUE TERMINE EL PROCESO'),(7,1,'2025-09-27 19:05:06',156000,'pago el 20 de septiembre'),(8,1,'2025-09-27 19:05:38',96000,'pagado 20 de septiembre'),(9,11,'2025-09-27 19:22:29',800000,'Se paga un anticipo de la orden completa, que esta pendiente por terminar. solo se ha adelantado'),(10,11,'2025-09-27 19:26:03',220000,''),(11,7,'2025-09-27 19:28:55',104000,''),(12,7,'2025-09-27 19:30:15',32000,''),(13,7,'2025-09-27 19:32:03',42000,''),(14,7,'2025-09-27 19:32:42',15000,''),(15,7,'2025-09-27 19:35:31',24000,''),(16,7,'2025-09-27 19:37:03',2,''),(17,7,'2025-09-27 19:41:04',3500,''),(18,2,'2025-09-27 19:42:59',1,''),(19,2,'2025-09-27 19:43:19',3,''),(20,5,'2025-09-27 19:45:06',1,''),(21,3,'2025-09-27 19:46:50',390000,''),(22,3,'2025-09-27 19:55:30',0,''),(23,3,'2025-09-27 19:55:45',90000,''),(24,5,'2025-09-27 19:58:12',80000,''),(25,5,'2025-09-27 19:59:03',230000,''),(26,5,'2025-09-27 20:01:50',20000,''),(27,4,'2025-09-27 20:04:49',300000,''),(28,4,'2025-09-27 20:05:21',120000,''),(29,4,'2025-09-27 20:05:42',260000,''),(30,4,'2025-09-27 20:06:50',80000,''),(31,4,'2025-09-27 20:07:28',30000,''),(32,4,'2025-09-27 20:08:13',15000,''),(33,4,'2025-09-27 20:08:32',2,''),(34,4,'2025-09-27 20:08:55',70000,''),(35,4,'2025-09-27 20:10:02',10000,''),(36,4,'2025-09-27 20:10:13',10000,''),(37,5,'2025-09-27 20:12:42',280000,'ESTE VALOR ES ABONADO A DEUDA PENDIENTE'),(38,10,'2025-09-27 20:13:09',100000,''),(39,1,'2025-10-04 19:48:45',50000,'pagos semana del 20 de septiembre'),(40,1,'2025-10-04 19:49:33',400009,'pago semana del 27 de septiembre'),(41,3,'2025-10-04 19:51:19',100000,''),(42,11,'2025-10-04 20:01:34',450000,''),(43,11,'2025-10-04 20:03:26',1250000,'Esto ya habia sido pagado en 2 semanas anteriores, primero 800 y luego 450'),(44,13,'2025-10-04 20:21:27',871000,''),(45,13,'2025-10-04 20:21:44',216000,''),(46,13,'2025-10-04 20:22:31',10000,''),(47,7,'2025-10-04 20:36:15',239500,'falta un taburete, previamente fabricado en 3500. Total semana del 27 septiembre 243'),(48,7,'2025-10-04 20:37:23',116000,''),(49,10,'2025-10-04 20:38:04',280000,''),(50,1,'2025-10-11 19:23:30',520000,''),(51,11,'2025-10-11 19:28:27',900000,''),(52,13,'2025-10-11 19:31:41',900008,''),(53,7,'2025-10-11 19:32:20',250000,''),(54,3,'2025-10-11 19:39:34',249908,''),(55,4,'2025-10-11 20:09:02',5,''),(56,2,'2025-10-11 20:09:20',5,''),(57,5,'2025-10-11 20:09:33',10,''),(58,6,'2025-10-11 20:09:45',1,'');
/*!40000 ALTER TABLE `pagos_trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` bigint unsigned NOT NULL,
  `fecha_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','en fabricacion','listo para entrega','completado','cancelado') DEFAULT 'pendiente',
  `observaciones` text,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2025-09-10 22:01:28','cancelado',NULL),(2,2,'2025-09-10 22:21:27','listo para entrega',NULL),(3,3,'2025-09-10 23:23:49','cancelado',NULL),(4,1,'2025-09-12 15:13:06','cancelado',NULL),(5,1,'2025-09-12 15:21:02','pendiente',NULL),(6,5,'2025-09-12 15:46:33','cancelado',NULL),(7,5,'2025-09-13 19:46:56','listo para entrega',NULL),(8,6,'2025-09-13 20:01:27','completado',NULL),(9,7,'2025-09-13 20:39:11','pendiente',NULL),(10,1,'2025-09-13 20:45:38','cancelado',NULL),(11,1,'2025-09-13 21:20:33','listo para entrega',NULL),(12,1,'2025-09-15 14:33:14','listo para entrega',NULL),(13,1,'2025-09-15 14:42:05','pendiente',NULL),(14,1,'2025-09-17 19:57:40','pendiente',NULL),(15,5,'2025-09-17 20:54:48','listo para entrega',NULL),(16,1,'2025-09-23 14:30:28','listo para entrega',NULL),(17,1,'2025-09-23 14:59:06','cancelado',NULL),(18,1,'2025-09-23 15:00:38','cancelado',NULL),(19,1,'2025-09-23 15:14:44','cancelado',NULL),(20,1,'2025-09-23 15:17:32','listo para entrega',NULL),(21,1,'2025-09-23 15:23:19','pendiente',NULL),(22,1,'2025-09-26 22:11:25','listo para entrega',NULL),(23,1,'2025-09-26 23:12:44','listo para entrega',NULL),(24,1,'2025-09-27 19:18:26','pendiente',NULL),(25,1,'2025-09-27 19:43:34','pendiente',NULL),(26,1,'2025-09-27 20:07:59','pendiente',NULL),(27,2,'2025-09-27 20:27:50','pendiente',''),(28,1,'2025-09-27 20:31:27','pendiente',NULL),(29,3,'2025-10-01 19:55:39','cancelado',NULL),(30,1,'2025-10-01 21:07:13','cancelado',NULL),(31,1,'2025-10-01 21:12:19','pendiente',NULL),(32,1,'2025-10-01 21:50:07','listo para entrega',NULL),(33,1,'2025-10-01 21:55:52','cancelado',NULL),(34,1,'2025-10-01 21:58:00','listo para entrega',NULL),(35,1,'2025-10-02 21:20:46','listo para entrega',NULL),(36,1,'2025-10-02 21:46:18','pendiente',NULL),(37,1,'2025-10-02 21:49:52','listo para entrega',NULL),(38,1,'2025-10-06 21:01:44','en fabricacion',NULL),(39,1,'2025-10-06 21:13:04','listo para entrega',NULL),(40,1,'2025-10-06 21:20:43','listo para entrega',NULL),(41,9,'2025-10-06 21:36:06','en fabricacion',NULL),(42,1,'2025-10-15 14:09:33','en fabricacion',NULL),(43,1,'2025-10-15 14:16:16','pendiente',NULL),(44,1,'2025-10-15 15:01:05','en fabricacion',NULL),(45,4,'2025-10-15 15:32:05','en fabricacion',NULL),(46,1,'2025-10-15 15:59:30','listo para entrega',NULL),(47,1,'2025-10-15 16:10:42','listo para entrega',NULL),(48,1,'2025-10-15 16:29:05','en fabricacion',NULL),(49,1,'2025-10-15 16:33:42','en fabricacion',NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `identificacion` bigint DEFAULT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` text,
  `ciudad` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'ABAKO',122334565,'300367234','','','');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'operario'),(3,'supervisor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_tercerizados`
--

DROP TABLE IF EXISTS `servicios_tercerizados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_tercerizados` (
  `id_servicio` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_proveedor` bigint unsigned NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` enum('pendiente','finalizado') DEFAULT 'pendiente',
  `fecha_inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `costo` int NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `servicios_tercerizados_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_tercerizados`
--

LOCK TABLES `servicios_tercerizados` WRITE;
/*!40000 ALTER TABLE `servicios_tercerizados` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios_tercerizados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_tercerizados_asignados`
--

DROP TABLE IF EXISTS `servicios_tercerizados_asignados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_tercerizados_asignados` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_servicio` bigint unsigned NOT NULL,
  `id_orden_fabricacion` bigint unsigned NOT NULL,
  `id_etapa_produccion` bigint unsigned NOT NULL,
  `fecha_asignacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_asignacion`),
  UNIQUE KEY `unique_asignacion` (`id_servicio`,`id_orden_fabricacion`,`id_etapa_produccion`),
  KEY `fk_etapa_produccion` (`id_etapa_produccion`),
  KEY `fk1_orden_fabricacion` (`id_orden_fabricacion`),
  CONSTRAINT `fk1_orden_fabricacion` FOREIGN KEY (`id_orden_fabricacion`) REFERENCES `ordenes_fabricacion` (`id_orden_fabricacion`) ON DELETE CASCADE,
  CONSTRAINT `fk_etapa_produccion` FOREIGN KEY (`id_etapa_produccion`) REFERENCES `etapas_produccion` (`id_etapa`) ON DELETE CASCADE,
  CONSTRAINT `fk_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicios_tercerizados` (`id_servicio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_tercerizados_asignados`
--

LOCK TABLES `servicios_tercerizados_asignados` WRITE;
/*!40000 ALTER TABLE `servicios_tercerizados_asignados` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios_tercerizados_asignados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `id_trabajador` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_trabajador`),
  UNIQUE KEY `id_trabajador` (`id_trabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'JULIO CANOLE',NULL,'CARPINTERO',1),(2,'FRAIMER',NULL,'CARPINTERO',1),(3,'FRANK',NULL,'CARPINTERO',1),(4,'LUIS TARRA',NULL,'PULIDOR',1),(5,'DEIBIS',NULL,'CARPINTERO',1),(6,'JUAN DAVID',NULL,'PULIDOR',1),(7,'DAIRO RIOS',NULL,'PINTOR',1),(8,'EDOIN',NULL,'PULIDOR',1),(9,'JESUS ARRIETA',NULL,'PULIDOR',1),(10,'JUAN CAMILO',NULL,'TAPIZADOR',1),(11,'FRAINER Y DEIBID',NULL,'CARPINTERO',1),(12,'LUIS Y JUAN DAVID',NULL,NULL,1),(13,'LUIS Y JUAN DAVID',NULL,'PULIDOR',1),(14,'EDOIN',NULL,NULL,1);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `id_rol` bigint unsigned DEFAULT NULL,
  `id_trabajador` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `fk_usuario_rol` (`id_rol`),
  KEY `fk_usuarios_trabajador` (`id_trabajador`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `fk_usuarios_trabajador` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (5,'admin','$2b$10$FLfFXnGX/JaaH8bgamaWH.D7zrcD.X7.5QDsbC6ec0OcfQxQi5ci6',1,NULL),(6,'DerleyL','$2b$10$KCL83op.hlxNfY5YBFU5XuBcEa.YzoAS6F4tffm.h40ruCp1f/sCu',1,1),(7,'ABAKO','$2b$10$CChpPkfZXA0c5Eyux7Loz.0run5qhWTi11HhGYCcAV7n58pv1pWAu',1,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_credito`
--

DROP TABLE IF EXISTS `ventas_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_credito` (
  `id_venta_credito` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_orden_venta` bigint unsigned NOT NULL,
  `id_cliente` bigint unsigned NOT NULL,
  `monto_total` int NOT NULL,
  `saldo_pendiente` int NOT NULL,
  `fecha` date NOT NULL DEFAULT (curdate()),
  `estado` enum('pendiente','parcial','pagado') DEFAULT 'pendiente',
  `observaciones` text,
  PRIMARY KEY (`id_venta_credito`),
  KEY `id_orden_venta` (`id_orden_venta`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `ventas_credito_ibfk_1` FOREIGN KEY (`id_orden_venta`) REFERENCES `ordenes_venta` (`id_orden_venta`),
  CONSTRAINT `ventas_credito_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_credito`
--

LOCK TABLES `ventas_credito` WRITE;
/*!40000 ALTER TABLE `ventas_credito` DISABLE KEYS */;
INSERT INTO `ventas_credito` VALUES (2,3,6,300000,100000,'2025-10-11','pagado',NULL),(3,4,1,1000,1000,'2025-10-11','pendiente',NULL);
/*!40000 ALTER TABLE `ventas_credito` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 14:29:08
