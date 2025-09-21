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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anticipos_trabajadores`
--

LOCK TABLES `anticipos_trabajadores` WRITE;
/*!40000 ALTER TABLE `anticipos_trabajadores` DISABLE KEYS */;
INSERT INTO `anticipos_trabajadores` VALUES (1,2,7,'2025-09-20',250000,250000,'saldado',''),(2,3,2,'2025-09-20',700000,NULL,'pendiente','');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'M001','MESA RESTAURANTE TEKA',90000,50000,7,0),(2,'CT140','CAMAROTE 1.40 TEKA',1300000,NULL,4,0),(3,'CAM140','CAMA 1.40 EN TEKA',700000,NULL,4,0),(4,'SOM2X2','SOMIER 2X2 EN TEKA',500000,NULL,4,0),(5,'BANCORED','BANCO REDONDO EN TEKA',120000,60000,2,0),(6,'S001','TAUBRETE EN TECA',120000,5000,5,0),(8,'ME001','MECEDORA MARIMBA EN TECA',150000,100000,3,0),(9,'B002','BANQUILLOS EN TECA REDONDOS',100000,100000,2,0),(10,'C001','COMEDOR EN TECA 80X80',70000,600000,7,1),(11,'P001','PERCHERO EN TECA',120000,100000,6,0),(12,'F002','FRUTERA EN TECA',60000,60000,6,0),(13,'B001','BANQUILLO TK',115000,NULL,2,0),(15,'A003','AGUA MANILA',2000,20000,6,0),(16,'C0001','COMEDOR CUCHARA',22222,3300,7,0),(17,'T003','TAUBRETES CUERO',12222,12333,5,0),(18,'C0004','CAMAS EN TECA  1.40',2000,20000,4,0),(19,'M004','MECEDORAS PICA PIEDRA',30000,30000,3,0),(20,'M0005','MARIMBAS INFANTIL',9000,0,3,0),(21,'T0001','TABLA',33333333,333333,10,0),(22,'B0003','BANQUILLOS PEQUEÑOS 1/55',333333,33333,2,0),(23,'A0001','ATRIL',3333,33333,6,0),(24,'M0002','MESAS PEQUEÑAS',200000,20000,10,0),(25,'E0002','MARCO DE ESPEJO 45X129',33333,NULL,6,0),(26,'ESPEJO','ESPEJO',0,NULL,6,0),(27,'B0001','BARRA',300000,NULL,7,0),(28,'M007','MESA BARRA DE1MTX60X70',300000,NULL,7,0),(29,'S0006','SILLA MESA BARRA 75CM ALTA',150000,NULL,10,0),(30,'M009','MESA HEXAGONAL 1MT',2,NULL,10,0),(31,'S0009','SILLAS PEGABLES',120000,NULL,5,0),(32,'M01','MESAS DE 70X60',300000,NULL,10,0),(33,'M02','JUEGO DE SILLA Y MESAS',800000,NULL,7,0),(34,'M03','MESAS DE 1.60X90 CON BASE',700000,NULL,10,0),(35,'S04','SILLAS CON BRAZOS',140000,NULL,5,0),(36,'S05','SILLA DE BARRA DE 80CM ALTO',150000,NULL,5,0),(37,'MM05','MESAS DE 1X70',500000,NULL,10,0),(38,'S06','SILLAS CON BASE DE MADERA',140000,NULL,5,0),(39,'B06','BANCOS DE 1.60',60000,NULL,2,0),(40,'P06','PARASOLES',50000,NULL,6,0),(41,'M07','MESAS 80X80',30000,NULL,10,0),(42,'M05','MECEDORAS MARIA PALITOS',200000,NULL,3,0),(43,'S07','SILLAS SEBASTIANAS',200000,NULL,3,0),(44,'S08','SILLAS COMEDOR ',120000,NULL,5,0),(45,'M08','MESAS 120X80',300000,NULL,10,0),(46,'M09','MARIMBA P/ÑA',100000,NULL,3,0),(47,'M1','MARCO ESPEJO',100000,NULL,6,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avance_etapas_produccion`
--

LOCK TABLES `avance_etapas_produccion` WRITE;
/*!40000 ALTER TABLE `avance_etapas_produccion` DISABLE KEYS */;
INSERT INTO `avance_etapas_produccion` VALUES (1,1,11,1,12,'completado','','2025-09-10 22:11:09',0,1,30000),(2,2,11,3,4,'completado','','2025-09-10 22:23:33',1,2,200000),(3,6,11,5,3,'completado','','2025-09-12 15:14:59',1,1,30000),(4,7,11,2,4,'completado','','2025-09-12 15:27:22',1,18,100000),(5,8,11,1,8,'completado','','2025-09-12 16:08:20',0,22,12000),(6,8,12,6,8,'completado','','2025-09-12 16:34:23',0,22,12000),(7,8,3,7,8,'completado','','2025-09-12 16:35:08',0,22,3500),(8,8,11,9,1,'completado','','2025-09-13 18:40:38',0,11,1),(9,8,11,5,4,'completado','','2025-09-13 19:14:27',0,19,35000),(10,8,11,2,1,'completado','','2025-09-13 19:17:48',0,21,1),(11,8,11,5,1,'completado','','2025-09-13 19:21:32',0,25,20000),(12,8,11,5,1,'completado','','2025-09-13 19:38:51',0,26,20000),(13,11,11,1,12,'completado','','2025-09-13 21:23:27',1,41,30000),(14,12,11,3,2,'completado','','2025-09-15 14:35:52',0,41,35000),(15,12,11,3,3,'completado','','2025-09-15 14:36:40',0,42,30000),(16,12,12,7,2,'completado','','2025-09-15 14:38:41',0,41,5000),(17,13,11,2,8,'completado','','2025-09-15 14:44:14',1,43,15000),(18,13,11,2,4,'completado','','2025-09-15 14:45:03',1,44,20000),(19,13,11,2,1,'completado','','2025-09-15 14:45:35',1,45,80000),(20,13,11,2,1,'completado','','2025-09-15 14:45:56',1,24,20000),(21,10,11,5,2,'completado','','2025-09-17 19:40:29',1,8,1),(22,10,12,6,2,'completado','','2025-09-17 19:41:33',0,8,18000),(23,10,3,7,2,'completado','','2025-09-17 19:42:26',0,8,7000),(24,14,11,3,2,'completado','','2025-09-17 19:59:53',1,41,35000),(25,14,11,3,3,'completado','','2025-09-17 20:00:39',1,42,30000),(26,15,11,3,2,'completado','','2025-09-17 20:44:48',0,41,35000),(27,15,11,3,3,'completado','','2025-09-17 20:45:14',0,42,30000),(28,16,11,5,4,'completado','','2025-09-17 20:57:09',1,19,35000),(29,16,12,6,4,'completado','','2025-09-17 20:57:56',0,19,25000),(30,16,3,7,4,'completado','','2025-09-17 20:58:46',0,19,8000),(31,16,11,2,1,'completado','','2025-09-17 20:59:16',0,21,1),(32,16,12,6,1,'completado','','2025-09-17 20:59:42',0,21,1),(33,16,3,7,1,'completado','','2025-09-17 21:00:04',0,21,1),(34,16,11,1,8,'completado','','2025-09-17 21:00:53',0,22,12000);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'BANCOS'),(3,'MECEDORAS'),(4,'ALCOBAS'),(5,'SILLAS'),(6,'ACCESORIOS'),(7,'COMEDORES'),(10,'MESAS');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'ABAKO MUEBLES','1038116','300857',NULL,NULL,NULL),(2,'HERNANDO',NULL,'3134683796',NULL,'CUCUTA',NULL),(3,'JALISSA AREIZA',NULL,'3234025269',NULL,'MEDELLIN',NULL),(4,'ABAKO MUEBLES','23333333','12345667777',NULL,NULL,NULL),(5,'JORGUE FRANCO',NULL,'3017204784',NULL,NULL,NULL),(6,'PAOLA GIRALDO',NULL,'3022728445',NULL,'SINCELEJO',NULL),(7,'CAMILA RINCON ANGARITA',NULL,'315483420',NULL,'FUSAGASUGA CUNDINAMARCA',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_compra`
--

LOCK TABLES `detalle_orden_compra` WRITE;
/*!40000 ALTER TABLE `detalle_orden_compra` DISABLE KEYS */;
INSERT INTO `detalle_orden_compra` VALUES (1,1,12,2,60000.00,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_fabricacion`
--

LOCK TABLES `detalle_orden_fabricacion` WRITE;
/*!40000 ALTER TABLE `detalle_orden_fabricacion` DISABLE KEYS */;
INSERT INTO `detalle_orden_fabricacion` VALUES (1,1,1,12,3),(2,2,2,4,3),(3,2,3,1,3),(4,2,4,1,3),(5,3,5,12,3),(6,3,13,8,3),(7,4,1,2,3),(8,5,1,3,3),(9,6,1,3,3),(10,7,18,4,3),(11,8,19,4,3),(12,8,20,1,3),(13,8,25,1,3),(14,8,21,1,13),(15,8,22,8,3),(16,8,26,1,3),(17,8,23,1,3),(18,8,11,1,3),(19,9,24,1,11),(20,10,8,2,3),(21,11,41,12,3),(22,12,41,2,3),(23,12,42,3,3),(24,13,43,8,13),(25,13,44,4,13),(26,13,45,1,3),(27,13,24,1,3),(28,14,41,2,3),(29,14,42,3,3),(30,15,41,2,3),(31,15,42,3,3),(32,16,19,4,3),(33,16,46,1,3),(34,16,25,1,3),(35,16,47,1,3),(36,16,21,1,3),(37,16,22,8,3),(38,16,23,1,3),(39,16,11,1,3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_venta`
--

LOCK TABLES `detalle_orden_venta` WRITE;
/*!40000 ALTER TABLE `detalle_orden_venta` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pago_trabajador`
--

LOCK TABLES `detalle_pago_trabajador` WRITE;
/*!40000 ALTER TABLE `detalle_pago_trabajador` DISABLE KEYS */;
INSERT INTO `detalle_pago_trabajador` (`id_detalle_pago`, `id_pago`, `id_avance_etapa`, `cantidad`, `pago_unitario`, `es_descuento`) VALUES (1,1,13,12,30000,0),(2,2,21,2,1,0),(3,2,3,3,30000,0),(4,3,25,3,30000,0),(5,3,24,2,35000,0),(6,3,2,4,200000,0),(7,4,20,1,20000,0),(8,4,19,1,80000,0),(9,4,18,4,20000,0),(10,4,17,8,15000,0),(11,5,4,4,100000,0),(12,5,NULL,1,-250000,1),(13,6,28,4,35000,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,12,'',90000),(2,2,2,4,'',1300000),(3,2,3,1,'',700000),(4,2,4,1,'',500000),(5,3,5,12,'',120000),(6,3,13,8,'',115000),(7,4,1,3,'',90000),(8,5,18,1,'',2000),(9,6,19,4,'',30000),(10,6,20,1,'',9000),(11,6,25,1,'',33333),(12,6,21,1,'',33333333),(13,6,22,8,'',333333),(14,6,26,1,'',0),(15,6,23,1,'',3333),(16,6,24,1,'',200000),(17,7,24,1,'',200000),(18,8,8,2,'',150000),(19,9,28,5,'',300000),(20,9,29,20,'',150000),(21,9,30,2,'',2),(22,9,31,30,'',120000),(23,9,32,6,'',300000),(24,9,33,4,'',800000),(25,9,34,6,'',700000),(26,9,35,14,'',140000),(27,9,36,4,'',150000),(28,9,37,4,'',500000),(29,9,38,50,'',140000),(30,9,39,5,'',60000),(31,9,40,2,'',50000),(32,10,19,6,'',30000),(33,11,41,12,'',30000),(34,12,41,2,'',30000),(35,12,42,3,'',200000),(36,13,43,8,'',200000),(37,13,44,4,'',120000),(38,13,45,1,'',300000),(39,13,24,1,'',200000),(40,14,41,2,'',30000),(41,14,42,3,'',200000),(42,15,19,4,'',30000),(43,15,46,1,'',100000),(44,15,25,1,'',33333),(45,15,47,1,'',100000),(46,15,21,1,'',33333333),(47,15,22,8,'',333333),(48,15,23,1,'',3333),(49,15,11,1,'',120000);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,0,0,2,'2025-09-10 22:01:06'),(2,2,0,0,2,'2025-09-10 22:19:22'),(3,3,0,0,2,'2025-09-10 22:20:29'),(4,4,0,0,2,'2025-09-10 22:21:21'),(5,5,35,0,0,'2025-09-10 22:39:13'),(6,10,2,0,0,'2025-09-10 22:59:07'),(7,11,5,0,0,'2025-09-12 14:21:43'),(8,12,2,0,2,'2025-09-13 13:20:58'),(9,13,0,0,2,'2025-09-10 23:23:35'),(10,15,1,0,1,'2025-09-12 16:27:31'),(11,16,1,0,0,'2025-09-12 14:24:33'),(12,17,6,0,0,'2025-09-12 14:29:14'),(13,18,0,0,2,'2025-09-12 15:20:49'),(14,19,4,4,0,'2025-09-17 20:58:47'),(15,20,1,0,1,'2025-09-12 16:21:37'),(16,21,1,1,0,'2025-09-17 21:00:04'),(17,22,8,8,0,'2025-09-12 16:35:08'),(18,23,2,0,2,'2025-09-12 16:17:58'),(19,24,0,0,0,'2025-09-12 15:41:17'),(20,8,2,2,2,'2025-09-17 19:42:26'),(21,25,0,0,2,'2025-09-12 15:44:39'),(22,26,0,0,2,'2025-09-12 15:46:03'),(23,28,0,0,2,'2025-09-13 20:12:41'),(24,29,0,0,2,'2025-09-13 20:14:06'),(25,30,0,0,2,'2025-09-13 20:16:48'),(26,31,0,0,2,'2025-09-13 20:20:04'),(27,32,0,0,2,'2025-09-13 20:21:56'),(28,33,0,0,2,'2025-09-13 20:23:38'),(29,34,0,0,2,'2025-09-13 20:24:54'),(30,35,0,0,2,'2025-09-13 20:27:17'),(31,36,0,0,2,'2025-09-13 20:29:08'),(32,37,0,0,2,'2025-09-13 20:30:14'),(33,38,0,0,2,'2025-09-13 20:31:26'),(34,39,0,0,2,'2025-09-13 20:36:13'),(35,40,0,0,2,'2025-09-13 20:38:06'),(36,41,0,0,2,'2025-09-13 21:20:17'),(37,42,0,0,2,'2025-09-15 14:32:47'),(38,43,0,0,2,'2025-09-15 14:40:17'),(39,44,0,0,2,'2025-09-15 14:41:06'),(40,45,0,0,2,'2025-09-15 14:41:46'),(41,46,0,0,2,'2025-09-17 20:52:23'),(42,47,0,0,2,'2025-09-17 20:53:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes_fabricados`
--

LOCK TABLES `lotes_fabricados` WRITE;
/*!40000 ALTER TABLE `lotes_fabricados` DISABLE KEYS */;
INSERT INTO `lotes_fabricados` VALUES (2,10,8,7,2,'2025-09-17 19:42:26',NULL),(3,16,19,7,4,'2025-09-17 20:58:46',NULL),(4,16,21,7,1,'2025-09-17 21:00:04',NULL);
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
  PRIMARY KEY (`id_metodo_pago`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,1,0,'entrada','2025-09-10 22:01:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(2,2,0,'entrada','2025-09-10 22:19:22','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(3,3,0,'entrada','2025-09-10 22:20:29','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(4,4,0,'entrada','2025-09-10 22:21:21','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(5,5,35,'entrada','2025-09-10 22:39:13','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(6,10,2,'entrada','2025-09-10 22:59:07','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(7,11,5,'entrada','2025-09-10 23:00:44','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(8,12,0,'entrada','2025-09-10 23:07:01','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(9,13,0,'entrada','2025-09-10 23:23:35','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(10,11,0,'ajuste','2025-09-12 14:21:43','Ajuste manual de stock. Stock anterior: 5, Nuevo stock: 5. Stock mínimo: 0','ajuste_manual',NULL,NULL),(11,15,1,'entrada','2025-09-12 14:23:14','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(12,16,1,'entrada','2025-09-12 14:24:33','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(13,17,6,'entrada','2025-09-12 14:29:14','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(14,18,0,'entrada','2025-09-12 15:20:49','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(15,19,0,'entrada','2025-09-12 15:36:28','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(16,20,0,'entrada','2025-09-12 15:37:34','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(17,21,0,'entrada','2025-09-12 15:38:33','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(18,22,0,'entrada','2025-09-12 15:39:38','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(19,23,0,'entrada','2025-09-12 15:40:18','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(20,24,0,'entrada','2025-09-12 15:41:17','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(21,8,0,'entrada','2025-09-12 15:42:58','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(22,25,0,'entrada','2025-09-12 15:44:39','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(23,26,0,'entrada','2025-09-12 15:46:03','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(24,23,1,'ajuste','2025-09-12 16:14:04','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 0','ajuste_manual',NULL,NULL),(25,23,1,'ajuste','2025-09-12 16:17:58','Ajuste manual de stock. Stock anterior: 1, Nuevo stock: 2. Stock mínimo: 2','ajuste_manual',NULL,NULL),(26,20,1,'ajuste','2025-09-12 16:21:37','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 1','ajuste_manual',NULL,NULL),(27,22,8,'entrada','2025-09-12 16:35:08','Lote #1 de Orden de Fabricación #8 completado.','produccion',1,'lote'),(28,12,2,'entrada','2025-09-13 13:20:58','Entrada por recepción de orden de compra #1','compra',1,'orden_compra'),(29,28,0,'entrada','2025-09-13 20:12:41','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(30,29,0,'entrada','2025-09-13 20:14:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(31,30,0,'entrada','2025-09-13 20:16:48','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(32,31,0,'entrada','2025-09-13 20:20:04','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(33,32,0,'entrada','2025-09-13 20:21:56','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(34,33,0,'entrada','2025-09-13 20:23:38','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(35,34,0,'entrada','2025-09-13 20:24:54','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(36,35,0,'entrada','2025-09-13 20:27:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(37,36,0,'entrada','2025-09-13 20:29:08','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(38,37,0,'entrada','2025-09-13 20:30:14','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(39,38,0,'entrada','2025-09-13 20:31:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(40,39,0,'entrada','2025-09-13 20:36:13','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(41,40,0,'entrada','2025-09-13 20:38:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(42,41,0,'entrada','2025-09-13 21:20:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(43,42,0,'entrada','2025-09-15 14:32:47','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(44,43,0,'entrada','2025-09-15 14:40:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(45,44,0,'entrada','2025-09-15 14:41:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(46,45,0,'entrada','2025-09-15 14:41:46','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(47,8,2,'entrada','2025-09-17 19:42:26','Lote #2 de Orden de Fabricación #10 completado.','produccion',2,'lote'),(48,46,0,'entrada','2025-09-17 20:52:23','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(49,47,0,'entrada','2025-09-17 20:53:34','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(50,19,4,'entrada','2025-09-17 20:58:47','Lote #3 de Orden de Fabricación #16 completado.','produccion',3,'lote'),(51,21,1,'entrada','2025-09-17 21:00:04','Lote #4 de Orden de Fabricación #16 completado.','produccion',4,'lote');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_tesoreria`
--

LOCK TABLES `movimientos_tesoreria` WRITE;
/*!40000 ALTER TABLE `movimientos_tesoreria` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_compra`
--

LOCK TABLES `ordenes_compra` WRITE;
/*!40000 ALTER TABLE `ordenes_compra` DISABLE KEYS */;
INSERT INTO `ordenes_compra` VALUES (1,1,'2025-09-10 23:07:08',NULL,NULL,'completada');
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
  `fecha_inicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_fin_estimada` date DEFAULT NULL,
  `estado` enum('pendiente','en proceso','completada','cancelada') NOT NULL DEFAULT 'pendiente',
  `id_pedido` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_orden_fabricacion`),
  UNIQUE KEY `id_orden_fabricacion` (`id_orden_fabricacion`),
  KEY `fk_ofab_orden_venta` (`id_orden_venta`),
  KEY `fk_ofab_pedido` (`id_pedido`),
  CONSTRAINT `fk_ofab_orden_venta` FOREIGN KEY (`id_orden_venta`) REFERENCES `ordenes_venta` (`id_orden_venta`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ofab_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_fabricacion`
--

LOCK TABLES `ordenes_fabricacion` WRITE;
/*!40000 ALTER TABLE `ordenes_fabricacion` DISABLE KEYS */;
INSERT INTO `ordenes_fabricacion` VALUES (1,NULL,'2025-09-01 00:00:00','2025-10-01','cancelada',1),(2,NULL,'2025-08-27 00:00:00','2025-09-27','en proceso',2),(3,NULL,'2025-09-10 00:00:00','2025-10-10','pendiente',3),(4,NULL,'2025-09-01 00:00:00','2025-09-30','cancelada',1),(5,NULL,'2025-09-01 00:00:00','2025-09-13','cancelada',1),(6,NULL,'2025-09-01 00:00:00','2025-09-20','en proceso',4),(7,NULL,'2025-09-01 00:00:00','2025-10-01','en proceso',5),(8,NULL,'2025-09-08 00:00:00','2025-10-08','cancelada',6),(9,NULL,'2025-09-08 00:00:00','2025-10-08','cancelada',7),(10,NULL,'2025-09-10 00:00:00','2025-09-10','completada',8),(11,NULL,'2025-09-06 00:00:00','2025-09-06','en proceso',11),(12,NULL,'2025-09-06 00:00:00','2025-09-30','cancelada',12),(13,NULL,'2025-09-07 00:00:00','2025-09-30','en proceso',13),(14,NULL,'2025-09-13 00:00:00','2025-09-30','en proceso',12),(15,NULL,'2025-09-13 00:00:00','2025-09-30','cancelada',14),(16,NULL,'2025-09-08 00:00:00','2025-10-08','en proceso',15);
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
  PRIMARY KEY (`id_orden_venta`),
  UNIQUE KEY `id_orden_venta` (`id_orden_venta`),
  KEY `fk_ov_cliente` (`id_cliente`),
  CONSTRAINT `fk_ordenes_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_ov_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_venta`
--

LOCK TABLES `ordenes_venta` WRITE;
/*!40000 ALTER TABLE `ordenes_venta` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_trabajadores`
--

LOCK TABLES `pagos_trabajadores` WRITE;
/*!40000 ALTER TABLE `pagos_trabajadores` DISABLE KEYS */;
INSERT INTO `pagos_trabajadores` VALUES (1,1,'2025-09-20 15:20:57',360000,''),(2,5,'2025-09-20 15:36:10',90002,''),(3,3,'2025-09-20 15:42:31',960000,''),(4,2,'2025-09-20 15:45:42',300000,''),(5,2,'2025-09-20 15:46:20',150000,''),(6,5,'2025-09-20 15:52:45',140000,'ESTO ES DE TRABAJO VIEJO. SE FINALIZAN PARA QUE TERMINE EL PROCESO');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2025-09-10 22:01:28','cancelado',NULL),(2,2,'2025-09-10 22:21:27','pendiente',NULL),(3,3,'2025-09-10 23:23:49','pendiente',NULL),(4,1,'2025-09-12 15:13:06','pendiente',NULL),(5,1,'2025-09-12 15:21:02','pendiente',NULL),(6,5,'2025-09-12 15:46:33','cancelado',NULL),(7,5,'2025-09-13 19:46:56','pendiente',NULL),(8,6,'2025-09-13 20:01:27','completado',NULL),(9,7,'2025-09-13 20:39:11','pendiente',NULL),(10,1,'2025-09-13 20:45:38','pendiente',NULL),(11,1,'2025-09-13 21:20:33','pendiente',NULL),(12,1,'2025-09-15 14:33:14','cancelado',NULL),(13,1,'2025-09-15 14:42:05','pendiente',NULL),(14,1,'2025-09-17 19:57:40','pendiente',NULL),(15,5,'2025-09-17 20:54:48','pendiente',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'JULIO CANOLE',NULL,'CARPINTERO',1),(2,'FRAIMER',NULL,'CARPINTERO',1),(3,'FRANK',NULL,'CARPINTERO',1),(4,'LUIS TARRA',NULL,'PULIDOR',1),(5,'DEIBIS',NULL,'CARPINTERO',1),(6,'JUAN DAVID',NULL,'PULIDOR',1),(7,'DAIRO RIOS',NULL,'PINTOR',1),(8,'EDOIN',NULL,'PULIDOR',1),(9,'JESUS ARRIETA',NULL,'PULIDOR',1),(10,'JUAN CAMILO',NULL,'TAPIZADOR',1),(11,'FRAINER Y DEIBID',NULL,'CARPINTERO',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (5,'admin','$2b$10$FLfFXnGX/JaaH8bgamaWH.D7zrcD.X7.5QDsbC6ec0OcfQxQi5ci6',1,NULL),(6,'DerleyL','$2b$10$KCL83op.hlxNfY5YBFU5XuBcEa.YzoAS6F4tffm.h40ruCp1f/sCu',1,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-21 11:13:52
