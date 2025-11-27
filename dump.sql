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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos_credito`
--

LOCK TABLES `abonos_credito` WRITE;
/*!40000 ALTER TABLE `abonos_credito` DISABLE KEYS */;
INSERT INTO `abonos_credito` VALUES (1,2,'2025-10-11',200000,2,NULL,NULL),(2,4,'2025-10-17',3000000,2,NULL,NULL),(3,5,'2025-10-29',1050000,2,NULL,NULL),(4,5,'2025-10-29',1000000,2,NULL,NULL),(5,6,'2025-10-29',1000000,2,NULL,NULL),(6,7,'2025-10-29',500000,2,'30/092025',NULL),(7,7,'2025-10-29',500000,2,NULL,NULL),(8,7,'2025-10-29',500000,2,NULL,NULL),(9,7,'2025-10-29',500000,2,NULL,NULL),(10,7,'2025-10-29',500000,2,NULL,NULL),(11,7,'2025-10-29',500000,2,NULL,NULL),(12,10,'2025-11-13',500000,2,NULL,NULL),(13,10,'2025-11-13',765000,2,NULL,NULL),(14,2,'2025-11-15',100000,2,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anticipos_trabajadores`
--

LOCK TABLES `anticipos_trabajadores` WRITE;
/*!40000 ALTER TABLE `anticipos_trabajadores` DISABLE KEYS */;
INSERT INTO `anticipos_trabajadores` VALUES (1,2,7,'2025-09-20',250000,250000,'saldado',''),(2,3,2,'2025-09-20',0,0,'saldado',''),(3,11,37,'2025-10-04',150000,100000,'parcial',''),(4,1,31,'2025-10-17',250000,250000,'saldado',''),(5,3,66,'2025-11-07',300000,NULL,'pendiente','');
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
  KEY `idx_descripcion` (`descripcion`(100)),
  KEY `idx_referencia` (`referencia`),
  CONSTRAINT `fk_articulos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'M001','MESA RESTAURANTE TEKA',200000,200000,7,0),(2,'CT140','CAMAROTE 1.40 TEKA',1300000,NULL,4,0),(3,'CAM140','CAMA 1.40 EN TEKA',700000,NULL,4,0),(4,'SOM2X2','SOMIER 2X2 EN TEKA',500000,NULL,4,0),(5,'BANCORED','BANCO REDONDO EN TEKA',120000,60000,2,0),(6,'S001','TAUBRETE EN TECA',120000,5000,5,0),(8,'ME001','MECEDORA MARIMBA EN TECA',150000,100000,3,0),(9,'B002','BANQUILLOS EN TECA REDONDOS',100000,100000,2,0),(10,'C001','COMEDOR EN TECA 80X80',70000,600000,7,1),(11,'P001','PERCHERO EN TECA',120000,100000,6,0),(12,'F002','FRUTERA EN TECA',60000,60000,6,0),(13,'B001','BANQUILLO TK',115000,NULL,2,0),(15,'A003','AGUA MANILA',2000,20000,6,0),(16,'C0001','COMEDOR CUCHARA',22222,3300,7,0),(17,'T003','TAUBRETES CUERO',12222,12333,5,0),(18,'C0004','CAMAS EN TECA  1.40',2000,20000,4,0),(19,'M004','MECEDORAS PICA PIEDRA',30000,30000,3,0),(20,'M0005','MARIMBAS INFANTIL',9000,0,3,0),(21,'T0001','TABLA',33333333,333333,10,0),(22,'B0003','BANQUILLOS PEQUEÑOS 1/55',333333,33333,2,0),(23,'A0001','ATRIL',3333,33333,6,0),(24,'M0002','MESAS PEQUEÑAS',200000,20000,10,0),(25,'E0002','MARCO DE ESPEJO 45X129',33333,NULL,6,0),(26,'ESPEJO','ESPEJO',0,NULL,6,0),(27,'B0001','BARRA',300000,NULL,7,0),(28,'M007','MESA BARRA DE1MTX60X70',300000,NULL,7,0),(29,'S0006','SILLA MESA BARRA 75CM ALTA',150000,NULL,10,0),(30,'M009','MESA HEXAGONAL 1MT',2,NULL,10,0),(31,'S0009','SILLAS PEGABLES',120000,NULL,5,0),(32,'M01','MESAS DE 70X60',300000,NULL,10,0),(33,'M02','JUEGO DE SILLA Y MESAS',800000,NULL,7,0),(34,'M03','MESAS DE 1.60X90 CON BASE',700000,NULL,10,0),(35,'S04','SILLAS CON BRAZOS',140000,NULL,5,0),(36,'S05','SILLA DE BARRA DE 80CM ALTO',150000,NULL,5,0),(37,'MM05','MESAS DE 1X70',500000,NULL,10,0),(38,'S06','SILLAS CON BASE DE MADERA',140000,NULL,5,0),(39,'B06','BANCOS DE 1.60',60000,NULL,2,0),(40,'P06','PARASOLES',50000,NULL,6,0),(41,'M07','MESAS 80X80',30000,NULL,10,0),(42,'M05','MECEDORAS MARIA PALITOS',200000,NULL,3,0),(43,'S07','SILLAS SEBASTIANAS',200000,NULL,3,0),(44,'S08','SILLAS COMEDOR ',120000,NULL,5,0),(45,'M08','MESAS 120X80',300000,NULL,10,0),(46,'M09','MARIMBA P/ÑA',100000,NULL,3,0),(47,'M1','MARCO ESPEJO',100000,NULL,6,0),(48,'M3','MESA 120X80 EN TRIPLE',1,NULL,10,0),(49,'B4','BANQUILLOS TAPIZADOS',2,NULL,2,0),(50,'S9','SILLAS PARA  TAPIZAR',4,NULL,5,0),(51,'C8','MECEDORA CATALANA',160000,60000,3,0),(52,'S7','SILLAS HAROLD CON ASIENTO EN MADERA',50,NULL,5,0),(53,'9','ESTELERA',30000,NULL,4,0),(54,'S8','SILLAS PARA TAPIZAR',20,NULL,5,0),(55,'B2','BANQUILLOS REDONDOS EN TK',115000,NULL,2,0),(56,'B1','BANQUILLO TAPIZADOS PQUEÑOS',4,NULL,2,0),(57,'S1','SOFA EN L',3000000,NULL,43,0),(58,'M2','',700000,100000,10,0),(59,'M4','MESA 160X80',700000,100000,10,0),(60,'M5','MESA DE 6 PUESTOS',800000,NULL,10,0),(61,'S6','SILLAS LARRY',2222,11111,5,0),(62,'P7','PERCHEROS EN ROBLE',120000,60000,44,0),(63,'P8','PERCHERO EN TECA',120000,40000,44,0),(64,'M8','MESITA DE CENTRO',100000,NULL,10,0),(65,'C9','CAMA GRANDE TAPIZADA',200000,NULL,4,0),(67,'P1','PLASTICO X 4 MET CALIBRE 4 / 6',20000,20000,6,0),(68,'T','TELA PARA MUBLES DE EXTERIOR',111111,100000,46,0),(69,'T1','16 MT DE TELA',1223333,12133,45,0),(70,'C','COLBON PREMACOL G1 CONETE CE',2222,3333,45,0),(71,'C1','COLBON PREMACOL G1 X KILO',12222,1111,45,0),(72,'E','#8 LITORAL',12222,1222222,45,0),(73,'E1','#5 D23',33333,6555,45,0),(74,'M','MANIJA NU 12 B 33 NATURAL',33333,3333,47,0),(75,'M 1','MANIGUETA NICOLSO',5555,6666,47,0),(76,'G','GRAPA CAMA 8 CMS CUNA',5555,6666,47,0),(77,'P','PUNTA NU 1 ESTRIA IRWIN 1 Y CUARTO',3333,5555,47,0),(78,'T0','TOTAL MANDRIL 13M ADAPTADOR',7777,7777,47,0),(79,'T3','TORNILO TIRAFOPNDO 1 CUARTO X3 Y MEDIA',22222,22222,47,0),(80,'p5','POLI STRECH VINIPEL 30CM X 200GR',4444,22222,46,0),(81,'SYF','PRIME BRILLO NA  GALON REEBASADO',333,4555,48,0),(82,'S4','SELLADOR CHAPILLA MADERFLEX X  G PLAST',2222,22222,48,0),(83,'T8','TELA ALICANTE 2 1/2',22222,7777,45,0),(84,'0','VIANNA PARA TAPIZAR 3/',555555,66666,45,0),(85,'1','GRAPA1/2',111111,1111,47,0),(86,'1N','NAILON TELA',3333,33333,45,0),(87,'2','SPRAY',55555,55555,48,0),(88,'L1','LISTONES OL 4X2 -4M',3333,3333,46,0),(89,'M9','MOTO CARRO',7777,9999,46,0),(90,'CO','COSEDURA DE MUEBLES',111111,1111,45,0),(91,'T2','ARREGLO DE TALADRO',222,2222,46,0),(92,'E8','ESMERIL',9999,999,47,0),(93,'3','FABRICACION  DE TECHO',333,3333,46,0),(94,'G1','GRAPAS',22222,22222,47,0),(95,'C3','CAMAROTE SENCILLO',1111,11111,4,0),(96,'L2','LISTONES',2222,33333,49,0),(97,'G2','GRAPA PARA CAMA',22222222,22222222,47,0),(98,'10','CUCHILLA',3333,5555,47,0),(99,'11','PEGAS DE CUCHILLA',7777,7777,47,0),(100,'13','CLAJA DE CLAVOS 2\"PUL CON',88888,5000,47,0),(101,'14','COMISION A CAMION',22222222,100000,46,0),(102,'15','CUEROS',33333,333333333,45,0),(103,'L5','LIJA',22222,2000,47,0),(104,'16','COMEDOR DE 4 PUESTOS EN TECA TAPIZADO P/ÑO',111,11111,7,0),(105,'P6','PUNTILLA CABALLO CON C 3 PUL',2222222,1111111,47,0),(106,'T9','TINTE PRIME COLORES VARIOS UNI',33333333,4444,48,0),(107,'D1','DISCO PULIMETAL 9 X UN CUARTO ABRACOL',444444,4444,47,0),(108,'T7','TORNILLO C C ZIN 1 CUARTRO X 2 Y MEDIA PUL',44444,33333,47,0),(109,'G3','GRAPA CAMA INDUMA LUNA MIEL',11111,11111,47,0),(110,'17','TAPAS PARA MESAS',2222,2222,10,0),(111,'B3','BOTAS DE TRABAJO PARA JULIO CANOLE',222222222,222222222,46,0),(113,'XC','CAMA 1/60 SENCILLA',33333,33333333,4,0),(114,'19','CAMA1/60 SENCILLA',22222222,2222,4,0),(115,'09','COMEDOR DE 6 PUESTOS',4444,9999,7,0),(116,'N','COMEDOR 80X80 TK',333,3333,3,0),(117,'g9','GASOLINA',4444,5555,48,0),(118,'M6','MESA PEQUEÑA',33333,333333,10,0),(119,'B9','BROCA DE MEDIA',22222,222222,47,0),(120,'SS','SELLADOR CATALIZADO PRIME X G SELLADO',2222,7777,48,0),(121,'LL','LACA MATE Y SEMIMATE GALON SELLADO',2222222,222222,48,0),(122,'PP','PUNTILLA CABALLO SIN C 1 Y MEDIA PUL',22222,2222222,47,0),(123,'P9','PUNTILLA CABALLO CON C 1 Y MEDIA PUL',33333,3333333,47,0),(125,'TL','TELA ESMERIL GRA 36 X CENT',333,3333,45,0),(126,'TLL','TELA ESMERIL GRA 60 X ANCH CENT',2222,2222,45,0),(127,'TI','TINTE INDUSTRIAL MIEL',2222222,2222222,48,0),(128,'MM','MECEDORAS NOVA',0,0,3,0),(130,'1P','PERCHEROS DE PARED',3333,33333,44,0),(131,'CC','CRUCE DE MADERA TK',111,1111,46,0),(132,'TTT','TAPABOCA INDUSTRIAL',33333,3333,45,0),(133,'II','PUERTAS P/ÑAS',2222,2222,50,0),(134,'LLL','LARGUEROS',3333,3333,4,0),(135,'CCC','CUCHILLA P/ÑA',2222,22222,47,0),(136,'TTTT','TARJETAS ABAKO',3333,3333,45,0),(137,'CCC1','CLAVOS DE 2\"PUL SIN',22222,22222,47,0),(138,'sss','BANQUILLO BB',33333,33333,46,0),(139,'MMM','MESA DE 90X60',22222,2222,10,0),(140,'FF','FRESA REBORDEO UN CUARTO 7/16',22222,22222,47,0),(141,'TT1','LAMINA TRIPLEX 4M',3333,222222,45,0),(142,'A1','ACEITE',22222,22222,46,0),(143,'C2','CLAVOS 1/2 CON',22222,22222,47,0),(144,'C4','CLAVOS 1/2SIN',22222,22222,47,0),(145,'CL','CLAVOS 2 1/2CON',22222,22222,47,0),(146,'CL4','CLAVOS 2 1/2 SIN',33333,33333,47,0),(147,'BL','BOLSAS PLASTICAS',2222,22222,45,0),(148,'V','VIDRIO',2222,22222,46,0),(149,'G8','GOMA',3333,5555,45,0),(150,'M10','MOTO',2222,2222,45,0),(151,'LA','LAMPARA G PARA ABAKO',2222,222,45,0),(152,'M0','MESAS 90X 60',3333,33333,10,0),(153,'000','COMEDOR TAPIZADO SENCILLO',222222,100000,7,0),(154,'002','',2222,33333,45,0),(155,'0006','TELA ESMERIL50XMT',111111,22222,45,0),(156,'0008','TELA ESMERIL GRA 50 X CENT',2222,22222,45,0),(157,'0009','LACA MATE Y SEMI MATE GALON REEMBASADO CE',22222,33333,48,0),(158,'111','TORNILLO C C ZIN 1 CUARTO X 2PUL',22222,22222,47,0),(159,'1111','REATA',22222,2222,45,0),(160,'11111','#3 LITORAL',11111,22222,45,0),(161,'12','CUERINA MUEBLES',11111,22222,45,0),(162,'18','DRAMA  TELA VERDE OLIVA',444,444444,45,0),(163,'5','PLATINA 1/8 X1',1111,11111,47,0),(164,'6','CORTE DE LAMINA',11111,11111,47,0),(165,'8','HUECOS DE LAMINA',222222222,22222,47,0),(166,'23','NAILO  PITA PARA MUEBLE',11111,1111,45,0),(167,'24','BOLSAS DE PAPEL',11111,11111,45,0),(168,'25','ARREGLO DE TUERCAS DE SINFIN',33333,3333,47,0),(169,'26','ENVOLTURA DE MUEBLES',111111,1111,46,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avance_etapas_produccion`
--

LOCK TABLES `avance_etapas_produccion` WRITE;
/*!40000 ALTER TABLE `avance_etapas_produccion` DISABLE KEYS */;
INSERT INTO `avance_etapas_produccion` VALUES (1,1,11,1,12,'completado','','2025-09-10 22:11:09',0,1,30000),(2,2,11,3,4,'completado','','2025-09-10 22:23:33',1,2,200000),(3,6,11,5,3,'completado','','2025-09-12 15:14:59',1,1,30000),(4,7,11,2,4,'completado','','2025-09-12 15:27:22',1,18,100000),(5,8,11,1,8,'completado','','2025-09-12 16:08:20',0,22,12000),(6,8,12,6,8,'completado','','2025-09-12 16:34:23',0,22,12000),(7,8,3,7,8,'completado','','2025-09-12 16:35:08',0,22,3500),(8,8,11,9,1,'completado','','2025-09-13 18:40:38',0,11,1),(9,8,11,5,4,'completado','','2025-09-13 19:14:27',0,19,35000),(10,8,11,2,1,'completado','','2025-09-13 19:17:48',0,21,1),(11,8,11,5,1,'completado','','2025-09-13 19:21:32',0,25,20000),(12,8,11,5,1,'completado','','2025-09-13 19:38:51',0,26,20000),(13,11,11,1,12,'completado','','2025-09-13 21:23:27',1,41,30000),(14,12,11,3,2,'completado','','2025-09-15 14:35:52',0,41,35000),(15,12,11,3,3,'completado','','2025-09-15 14:36:40',0,42,30000),(16,12,12,7,2,'completado','','2025-09-15 14:38:41',0,41,5000),(17,13,11,2,8,'completado','','2025-09-15 14:44:14',1,43,15000),(18,13,11,2,4,'completado','','2025-09-15 14:45:03',1,44,20000),(19,13,11,2,1,'completado','','2025-09-15 14:45:35',1,45,80000),(20,13,11,2,1,'completado','','2025-09-15 14:45:56',1,24,20000),(21,10,11,5,2,'completado','','2025-09-17 19:40:29',1,8,1),(22,10,12,6,2,'completado','','2025-09-17 19:41:33',1,8,18000),(23,10,3,7,2,'completado','','2025-09-17 19:42:26',1,8,7000),(24,14,11,3,2,'completado','','2025-09-17 19:59:53',1,41,35000),(25,14,11,3,3,'completado','','2025-09-17 20:00:39',1,42,30000),(26,15,11,3,2,'completado','','2025-09-17 20:44:48',0,41,35000),(27,15,11,3,3,'completado','','2025-09-17 20:45:14',0,42,30000),(28,16,11,5,4,'completado','','2025-09-17 20:57:09',1,19,35000),(29,16,12,6,4,'completado','','2025-09-17 20:57:56',1,19,25000),(30,16,3,7,4,'completado','','2025-09-17 20:58:46',1,19,8000),(31,16,11,2,1,'completado','','2025-09-17 20:59:16',1,21,1),(32,16,12,6,1,'completado','','2025-09-17 20:59:42',1,21,1),(33,16,3,7,1,'completado','','2025-09-17 21:00:04',1,21,1),(34,16,11,1,8,'completado','','2025-09-17 21:00:53',1,22,12000),(35,17,11,11,1,'completado','','2025-09-23 13:45:18',0,24,20000),(36,17,12,4,1,'completado','','2025-09-23 13:46:20',0,24,15000),(37,17,3,7,1,'completado','','2025-09-23 13:46:49',0,24,3500),(38,13,12,4,8,'completado','','2025-09-23 13:49:39',0,43,10000),(39,13,3,7,8,'completado','','2025-09-23 13:50:51',0,43,3000),(40,13,12,4,4,'completado','','2025-09-23 13:52:08',0,44,30000),(41,18,11,11,8,'completado','','2025-09-23 14:00:12',1,43,15000),(42,18,12,4,8,'completado','','2025-09-23 14:00:46',1,43,10000),(43,18,3,7,8,'completado','','2025-09-23 14:01:06',1,43,3000),(44,18,11,11,4,'completado','','2025-09-23 14:01:53',1,44,20000),(45,18,12,4,4,'completado','','2025-09-23 14:02:42',1,44,7500),(46,18,11,11,1,'completado','','2025-09-23 14:04:24',1,24,20000),(47,18,12,4,1,'completado','','2025-09-23 14:05:04',1,24,15000),(48,14,12,4,3,'completado','','2025-09-23 14:16:25',1,42,20000),(49,14,3,7,3,'completado','','2025-09-23 14:16:53',1,42,8000),(50,7,12,4,1,'completado','','2025-09-23 14:24:19',1,18,70000),(51,2,12,4,3,'completado','','2025-09-23 14:26:58',1,2,100000),(52,19,11,5,2,'completado','','2025-09-23 14:33:02',1,45,80000),(53,19,11,5,1,'completado','','2025-09-23 14:35:43',1,48,70000),(54,16,12,4,8,'completado','','2025-09-23 14:42:55',1,22,10000),(55,16,3,7,8,'completado','','2025-09-23 14:43:22',1,22,3500),(56,22,11,3,13,'completado','','2025-09-23 15:20:19',1,42,30000),(57,22,12,4,13,'completado','','2025-09-23 15:20:49',1,42,20000),(58,22,3,7,13,'completado','','2025-09-23 15:21:10',1,42,8000),(59,23,11,1,13,'completado','','2025-09-23 15:24:43',1,22,12000),(60,23,12,4,12,'completado','','2025-09-23 15:25:27',1,22,10000),(61,23,3,7,12,'completado','','2025-09-23 15:26:16',1,22,3500),(62,16,11,5,1,'completado','','2025-09-23 15:58:46',1,25,20000),(63,16,12,4,1,'completado','','2025-09-23 16:01:22',1,25,10000),(64,16,3,7,1,'completado','','2025-09-23 16:04:22',1,25,3500),(65,21,11,1,13,'completado','','2025-09-23 16:07:54',0,22,12000),(66,21,12,4,12,'en proceso','','2025-09-23 16:08:22',0,22,10000),(67,21,3,7,12,'en proceso','','2025-09-23 16:08:40',0,22,3500),(68,19,12,4,1,'completado','','2025-09-23 16:10:41',1,48,25000),(69,19,3,7,1,'completado','','2025-09-23 16:11:14',1,48,15000),(70,19,12,4,1,'completado','','2025-09-23 16:11:43',1,45,25000),(71,16,11,5,1,'completado','','2025-09-23 16:15:48',1,46,1),(72,16,12,4,1,'completado','','2025-09-23 16:16:13',1,46,1),(73,16,3,7,1,'completado','','2025-09-23 16:16:30',1,46,1),(74,16,11,2,1,'completado','','2025-09-23 16:17:15',1,47,10000),(75,16,12,4,1,'completado','','2025-09-23 16:18:24',1,47,10000),(76,24,11,2,1,'completado','','2025-09-23 16:21:23',1,24,10000),(77,24,12,4,1,'completado','','2025-09-23 16:21:56',1,24,10000),(78,16,11,2,1,'completado','','2025-09-26 22:03:40',1,23,1),(79,16,12,4,1,'completado','','2025-09-26 22:04:05',1,23,1),(80,16,11,2,1,'completado','','2025-09-26 22:07:28',1,11,1),(81,16,12,9,1,'completado','','2025-09-26 22:08:58',1,11,12000),(82,16,3,7,1,'completado','','2025-09-26 22:10:12',1,11,5000),(83,25,11,2,1,'completado','','2025-09-26 22:13:26',0,8,1),(84,25,12,4,1,'completado','','2025-09-26 22:14:14',0,8,1),(85,26,11,2,1,'completado','','2025-09-26 22:16:29',1,8,1),(86,26,12,6,1,'completado','','2025-09-26 22:22:08',1,8,18000),(87,26,3,7,1,'completado','','2025-09-26 22:22:24',1,8,7000),(88,23,11,1,2,'completado','','2025-09-26 22:31:16',1,49,25000),(89,19,3,7,1,'completado','','2025-09-26 22:44:59',1,45,7000),(90,27,11,5,4,'completado','','2025-09-26 23:14:30',1,50,20000),(91,27,12,4,4,'completado','','2025-09-26 23:15:18',1,50,7500),(92,27,3,7,4,'completado','','2025-09-26 23:16:47',1,50,4000),(93,27,13,10,4,'completado','','2025-09-26 23:17:12',1,50,25000),(94,28,11,11,32,'completado','SE REGISTRA COMO AVANCE','2025-09-27 19:21:06',1,52,25000),(95,24,3,7,1,'completado','','2025-09-27 19:39:38',1,24,3500),(96,29,11,3,3,'completado','','2025-09-27 19:50:20',1,53,30000),(97,2,11,3,1,'completado','','2025-09-27 19:54:20',1,4,70000),(98,30,11,5,14,'completado','SE ABONARON ADEUDA PENDIENTE','2025-09-27 20:12:07',1,54,20000),(99,31,11,1,17,'completado','ADELANTO DE TRABAJO EMPEZADO','2025-09-27 20:37:34',1,9,15000),(100,28,11,11,18,'completado','','2025-10-01 19:09:48',1,52,25000),(101,16,3,7,1,'completado','','2025-10-01 19:19:30',1,47,3500),(102,16,3,7,1,'completado','','2025-10-01 19:20:05',1,23,5000),(103,14,12,13,2,'completado','','2025-10-01 19:23:39',1,41,20000),(104,14,3,7,2,'completado','','2025-10-01 19:24:05',1,41,5000),(105,11,12,13,12,'completado','','2025-10-01 19:25:02',1,41,20000),(106,11,3,7,6,'completado','','2025-10-01 19:40:25',1,41,5000),(107,2,12,13,1,'completado','','2025-10-01 19:48:17',1,2,100000),(108,2,3,7,4,'completado','','2025-10-01 19:49:27',1,2,25000),(109,2,11,3,1,'completado','','2025-10-01 19:50:20',1,3,100000),(110,23,12,13,1,'completado','','2025-10-01 20:07:28',1,22,10000),(111,23,3,7,1,'completado','','2025-10-01 20:09:09',1,22,3500),(112,28,12,13,12,'en proceso','','2025-10-01 20:16:24',1,52,18000),(113,19,12,13,1,'completado','','2025-10-01 20:19:19',1,45,25000),(114,18,3,7,4,'completado','','2025-10-01 20:22:36',1,44,2000),(115,7,12,13,1,'completado','','2025-10-01 20:39:07',1,18,40000),(116,7,3,7,2,'en proceso','','2025-10-01 20:39:57',1,18,10000),(117,30,12,13,4,'en proceso','','2025-10-01 20:44:12',0,54,7500),(118,30,3,7,4,'en proceso','','2025-10-01 20:44:36',0,54,2000),(119,34,11,5,14,'completado','SE ABONO A SALDO PENDIENTE','2025-10-01 21:14:36',1,50,20000),(120,34,12,13,4,'en proceso','','2025-10-01 21:15:13',1,50,7500),(121,18,13,10,8,'completado','','2025-10-01 21:21:15',1,43,20000),(122,18,13,10,4,'completado','','2025-10-01 21:21:50',1,44,25000),(123,34,3,7,2,'en proceso','','2025-10-01 21:44:55',1,50,2000),(124,35,11,5,4,'completado','','2025-10-01 21:51:12',0,19,1),(125,35,12,4,1,'completado','','2025-10-01 21:51:47',0,19,1),(126,35,12,4,3,'completado','','2025-10-01 21:52:15',0,19,1),(127,35,3,7,4,'completado','','2025-10-01 21:52:33',0,19,8000),(128,36,11,1,5,'completado','','2025-10-01 22:03:25',1,22,1),(129,36,11,1,4,'completado','','2025-10-01 22:03:58',1,56,1),(130,36,12,13,5,'completado','','2025-10-01 22:04:23',1,22,10000),(131,36,12,13,4,'completado','','2025-10-01 22:04:43',1,56,10000),(132,36,3,7,5,'completado','','2025-10-01 22:05:04',1,22,3500),(133,36,3,7,4,'completado','','2025-10-01 22:05:22',1,56,3500),(134,36,13,10,4,'completado','','2025-10-01 22:05:46',1,56,5000),(135,37,11,11,50,'completado','CANCELADAS ','2025-10-01 22:13:22',1,38,25000),(136,37,12,13,12,'completado','','2025-10-01 22:14:32',1,38,18000),(137,38,11,5,4,'completado','','2025-10-02 21:06:10',1,19,1),(138,38,12,4,4,'completado','','2025-10-02 21:06:31',1,19,1),(139,38,3,7,1,'completado','','2025-10-02 21:06:53',1,19,8000),(140,38,3,7,3,'completado','','2025-10-02 21:07:17',1,19,8000),(141,39,11,1,20,'completado','ADELANTO DE TRABAJO EMPEZADO ','2025-10-02 21:29:16',0,6,20000),(142,39,11,1,20,'completado','ADELANTO DE TRABAJO EMPEZADO ','2025-10-02 21:29:18',0,6,20000),(143,40,11,1,20,'completado','ADELANTO DE TRABAJO EMPEZADO','2025-10-02 21:32:22',1,6,20000),(144,40,11,1,26,'completado','','2025-10-02 21:32:54',1,6,20000),(145,41,11,5,6,'completado','SE COMPRARON ECHAS','2025-10-02 21:48:31',1,51,1),(146,41,12,13,6,'completado','','2025-10-02 21:49:08',1,51,15000),(147,42,11,2,1,'completado','','2025-10-02 21:50:58',1,24,1),(148,42,12,4,1,'completado','','2025-10-02 21:51:18',1,24,1),(149,42,3,7,1,'completado','','2025-10-02 21:51:39',1,24,3500),(150,37,11,11,14,'completado','','2025-10-04 20:05:41',1,35,20000),(151,40,12,13,46,'completado','','2025-10-06 20:36:34',1,6,12000),(152,40,3,7,46,'completado','','2025-10-06 20:37:26',1,6,3500),(153,37,12,13,15,'completado','','2025-10-06 20:40:02',1,38,18000),(154,2,12,13,1,'completado','','2025-10-06 20:45:40',1,4,30000),(155,11,3,7,6,'completado','','2025-10-06 20:50:59',1,41,5000),(156,43,11,3,8,'completado','','2025-10-06 21:17:42',1,1,1),(157,43,12,13,8,'completado','','2025-10-06 21:18:12',1,1,1),(158,43,3,7,8,'completado','','2025-10-06 21:18:39',1,1,5000),(159,44,11,2,4,'completado','','2025-10-06 21:22:26',1,6,1),(160,44,12,13,4,'completado','','2025-10-06 21:22:47',1,6,12000),(161,44,3,7,4,'completado','','2025-10-06 21:23:09',1,6,3500),(162,19,3,7,1,'completado','','2025-10-06 21:24:03',1,45,5000),(163,45,11,3,3,'completado','','2025-10-06 21:29:53',1,1,33300),(164,45,11,3,1,'completado','','2025-10-06 21:30:20',1,2,150000),(165,46,11,11,1,'completado','','2025-10-10 19:02:19',1,57,900000),(166,47,11,1,31,'completado','','2025-10-15 14:11:33',0,9,15000),(167,47,11,1,8,'completado','','2025-10-15 14:12:09',0,17,15000),(168,47,11,1,7,'completado','','2025-10-15 14:12:40',0,13,12000),(169,45,12,13,1,'completado','','2025-10-15 14:22:35',1,2,80000),(170,45,3,7,1,'completado','','2025-10-15 14:23:25',1,2,20000),(171,45,12,13,1,'completado','','2025-10-15 14:24:08',1,1,20000),(172,45,3,7,1,'completado','','2025-10-15 14:24:37',1,1,5000),(173,2,12,13,1,'completado','','2025-10-15 14:35:47',1,3,50000),(174,2,3,7,1,'completado','','2025-10-15 14:36:39',1,3,15000),(175,2,3,7,1,'completado','','2025-10-15 14:38:52',1,4,5000),(176,37,12,13,22,'completado','','2025-10-15 14:40:44',1,38,18000),(177,37,3,7,30,'completado','','2025-10-15 14:48:02',1,38,3500),(178,49,11,5,3,'completado','','2025-10-15 15:02:44',1,62,1),(179,49,12,4,3,'completado','','2025-10-15 15:03:08',1,62,1),(180,49,3,7,3,'completado','','2025-10-15 15:04:13',1,62,7000),(181,49,11,5,8,'completado','','2025-10-15 15:04:35',1,63,1),(182,49,12,8,8,'completado','','2025-10-15 15:06:20',1,63,13000),(183,49,3,7,4,'completado','','2025-10-15 15:07:10',1,63,5000),(184,46,12,13,1,'completado','','2025-10-15 15:18:43',1,57,350000),(185,46,3,7,1,'completado','','2025-10-15 15:19:43',1,57,70000),(186,31,11,1,14,'completado','','2025-10-15 15:27:31',1,9,15000),(187,50,11,1,8,'completado','','2025-10-15 15:33:11',1,17,15000),(188,50,11,1,7,'completado','','2025-10-15 15:34:17',1,5,12000),(189,51,11,5,2,'completado','','2025-10-15 16:00:59',1,19,1),(190,51,12,13,2,'completado','','2025-10-15 16:01:27',1,19,1),(191,51,3,7,2,'completado','','2025-10-15 16:01:52',1,19,8000),(192,52,11,1,6,'completado','','2025-10-15 16:11:57',1,6,1),(193,52,12,13,5,'completado','','2025-10-15 16:13:21',1,6,10000),(194,52,12,4,1,'completado','','2025-10-15 16:17:50',1,6,1),(195,52,3,7,6,'completado','','2025-10-15 16:18:31',1,6,3500),(196,50,12,13,4,'completado','','2025-10-15 16:26:05',1,5,10000),(197,50,3,7,4,'completado','','2025-10-15 16:27:35',1,5,3500),(198,53,11,11,1,'completado','','2025-10-15 16:30:10',1,64,1),(199,53,12,13,1,'completado','','2025-10-15 16:30:43',1,64,15000),(200,54,11,5,1,'completado','','2025-10-15 16:34:37',1,65,1),(201,54,12,4,1,'completado','','2025-10-15 16:34:59',1,65,1),(202,54,3,7,1,'completado','','2025-10-15 16:35:21',1,65,15000),(203,48,11,3,2,'completado','','2025-10-20 19:20:50',1,1,35000),(204,48,11,3,1,'completado','','2025-10-20 19:22:19',1,60,80000),(205,48,11,3,12,'completado','ANTICIPO DE 250 ','2025-10-20 19:29:17',1,61,20000),(206,48,11,3,2,'completado','','2025-10-20 19:29:39',1,61,20000),(207,31,12,13,27,'completado','','2025-10-20 19:45:21',1,9,12000),(208,31,3,7,12,'en proceso','','2025-10-20 19:46:09',1,9,3500),(209,50,12,13,8,'completado','','2025-10-20 19:47:54',1,17,10000),(210,50,3,7,8,'completado','','2025-10-20 19:48:35',1,17,3500),(211,53,3,7,1,'completado','','2025-10-20 19:51:06',1,64,4000),(212,37,11,11,30,'completado','ANTICIPO DE TRABAJO','2025-10-20 20:51:00',1,31,17000),(213,55,11,11,16,'completado','','2025-10-20 20:54:25',0,31,17000),(214,56,11,11,16,'completado','ANTICIPO DELOS 800 TRABAJO PAGO','2025-10-20 21:00:26',1,31,17000),(215,56,12,13,16,'completado','','2025-10-20 21:00:57',1,31,12000),(216,57,11,11,1,'completado','PAGADA','2025-10-20 21:03:17',1,31,17000),(217,57,12,13,1,'completado','','2025-10-20 21:03:36',1,31,12000),(218,37,3,7,10,'completado','','2025-10-20 21:07:33',1,38,3500),(219,45,12,13,2,'completado','','2025-10-20 21:22:34',1,1,20000),(220,45,3,7,2,'completado','','2025-10-20 21:23:18',1,1,5000),(221,48,12,13,1,'en proceso','','2025-10-20 21:24:35',1,1,20000),(222,48,3,7,1,'en proceso','','2025-10-20 21:25:14',1,1,5000),(223,58,11,1,15,'completado','ANTICIPO DE TRABAJO ','2025-10-20 21:29:32',1,6,20000),(224,58,11,1,10,'completado','','2025-10-20 21:30:23',1,6,20000),(225,37,11,11,20,'completado','','2025-10-23 16:54:24',1,29,20000),(226,37,11,11,4,'completado','PAGADAS CON ANTICIPO DE 700 MIL INCLUYENDO LOS 20 BANQUILLOS DE 75 DE ALTO','2025-10-23 16:57:49',1,36,20000),(227,37,11,11,6,'completado','REGISTRA COMO AVANCE DE LOS 700','2025-10-23 17:10:52',1,32,30000),(228,37,11,11,1,'completado','REGISTRA COMO AVANCE PARA COMPLETAR LOS700','2025-10-23 17:13:07',1,28,40000),(229,59,11,3,6,'completado','SE REGISTRA COMO AVANCE ','2025-10-24 20:32:17',1,61,20000),(230,46,13,10,1,'completado','','2025-10-24 20:57:54',1,57,300000),(231,58,12,13,25,'completado','','2025-10-28 21:05:32',1,6,12000),(232,58,3,7,25,'completado','','2025-10-28 21:05:51',1,6,3500),(233,60,11,1,1,'completado','','2025-10-28 21:10:10',1,6,20000),(234,60,12,13,1,'completado','','2025-10-28 21:10:41',1,6,12000),(235,60,3,7,1,'completado','','2025-10-28 21:10:54',1,6,3500),(236,61,11,16,10,'completado','','2025-10-28 21:22:15',1,41,35000),(237,61,12,13,10,'completado','','2025-10-28 21:22:59',1,41,20000),(238,61,3,7,7,'en proceso','','2025-10-28 21:23:33',1,41,5000),(239,63,11,3,2,'completado','','2025-10-28 21:29:53',1,110,30000),(240,63,11,3,2,'completado','','2025-10-28 21:30:16',1,41,35000),(241,37,11,11,4,'completado','','2025-10-29 14:29:08',1,28,40000),(242,37,11,11,6,'completado','','2025-10-29 14:31:07',1,34,70000),(243,37,11,11,4,'completado','','2025-10-29 14:36:01',1,37,50000),(244,37,11,11,4,'completado','ESTAS SON SOLO LAS MESAS QUE VAN CON LAS SILLAS  PLEGABLES PERO ESTAN REGISTRADAS LAS SILLAS SOLAS','2025-10-29 14:38:13',1,33,50000),(245,37,12,13,1,'completado','','2025-10-29 14:39:26',1,38,18000),(246,37,12,13,12,'en proceso','','2025-10-29 14:49:25',1,31,12000),(247,50,12,13,3,'completado','','2025-10-29 15:00:01',1,5,12000),(248,31,12,13,4,'completado','','2025-10-29 15:01:49',1,9,12000),(249,64,11,11,5,'completado','','2025-10-29 15:24:22',1,35,20000),(250,64,12,13,5,'completado','','2025-10-29 15:24:50',1,35,18000),(251,37,11,11,5,'completado','','2025-10-30 14:33:13',1,39,50000),(252,37,12,13,14,'completado','','2025-10-30 14:34:26',1,35,18000),(253,65,11,11,1,'completado','','2025-10-31 15:00:06',1,118,1),(254,65,12,13,1,'completado','','2025-10-31 15:00:38',1,118,20000),(255,65,3,7,1,'completado','','2025-10-31 15:01:00',1,118,4000),(256,66,11,3,10,'completado','','2025-11-04 14:10:18',0,128,40000),(257,37,11,11,2,'completado','','2025-11-04 14:20:29',1,30,50000),(258,37,12,13,6,'completado','','2025-11-04 14:25:59',1,32,30000),(259,37,12,13,3,'en proceso','','2025-11-04 14:29:53',1,33,20000),(260,37,12,13,20,'completado','','2025-11-04 14:31:46',1,29,12000),(261,37,12,13,4,'completado','','2025-11-04 14:33:00',1,36,12000),(262,56,3,7,15,'en proceso','','2025-11-04 14:43:59',1,31,4000),(263,50,3,7,3,'completado','','2025-11-04 14:46:18',1,5,3500),(264,49,3,7,4,'completado','','2025-11-04 14:51:39',1,63,5000),(265,31,3,7,16,'en proceso','','2025-11-04 14:54:42',1,9,3500),(266,67,11,5,15,'completado','','2025-11-04 15:15:08',1,8,1),(267,67,12,8,15,'completado','','2025-11-04 15:15:42',1,8,20000),(268,67,3,7,10,'en proceso','','2025-11-04 15:16:10',1,8,7000),(269,37,12,8,6,'en proceso','','2025-11-04 15:17:59',1,31,15000),(270,63,12,13,2,'completado','','2025-11-04 15:23:27',1,110,15000),(271,68,11,5,1,'completado','','2025-11-04 15:26:58',1,19,1),(272,68,12,13,1,'completado','','2025-11-04 15:27:24',1,19,25000),(273,68,3,7,1,'completado','','2025-11-04 15:27:41',1,19,8000),(274,37,12,13,5,'completado','','2025-11-04 16:14:47',1,28,15000),(275,37,12,13,6,'completado','','2025-11-04 16:16:01',1,34,15000),(276,37,12,13,4,'completado','','2025-11-04 16:16:45',1,37,15000),(277,69,11,1,24,'completado','','2025-11-05 14:55:28',1,6,20000),(278,48,12,13,1,'completado','','2025-11-05 14:58:02',1,60,40000),(279,70,11,5,1,'completado','','2025-11-05 14:59:43',1,46,1),(280,70,12,13,1,'completado','','2025-11-05 15:00:09',1,46,10000),(281,71,11,2,3,'completado','','2025-11-06 14:29:34',1,133,1),(282,71,12,13,3,'completado','','2025-11-06 14:30:24',1,133,7000),(283,71,11,2,2,'completado','','2025-11-06 14:30:48',1,134,1),(284,71,12,13,2,'completado','','2025-11-06 14:31:33',1,134,4500),(285,74,11,1,17,'completado','','2025-11-11 14:12:16',1,13,12000),(286,69,12,13,24,'completado','','2025-11-11 14:15:05',1,6,12000),(287,69,3,7,24,'completado','','2025-11-11 14:15:32',0,6,3500),(288,59,12,13,6,'completado','','2025-11-11 14:20:55',1,61,18000),(289,59,3,7,6,'completado','','2025-11-11 14:21:17',0,61,4000),(290,48,12,13,9,'en proceso','','2025-11-11 14:23:50',1,61,18000),(291,37,3,7,10,'completado','','2025-11-11 14:28:32',0,38,3500),(292,37,3,7,7,'en proceso','','2025-11-11 14:30:42',0,31,4000),(293,37,3,7,5,'en proceso','','2025-11-11 14:32:36',0,35,5000),(294,75,11,3,10,'completado','','2025-11-11 14:36:43',1,41,35000),(295,74,12,13,11,'en proceso','','2025-11-12 14:05:56',1,13,10000),(296,37,3,7,3,'en proceso','','2025-11-12 14:15:33',0,33,5000),(297,76,11,5,1,'completado','','2025-11-12 14:34:46',0,138,1),(298,76,12,13,1,'completado','','2025-11-12 14:35:12',1,138,15000),(299,76,3,7,1,'completado','','2025-11-12 14:35:34',0,138,3500),(300,77,11,5,1,'completado','','2025-11-12 14:37:13',0,23,1),(301,77,12,13,1,'completado','','2025-11-12 14:37:36',1,23,17000),(302,77,3,7,1,'completado','','2025-11-12 14:37:51',0,23,5000),(303,75,12,13,3,'en proceso','','2025-11-12 15:44:14',1,41,20000),(304,75,3,7,3,'en proceso','','2025-11-12 15:44:41',0,41,5000);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'BANCOS'),(3,'MECEDORAS'),(4,'ALCOBAS'),(5,'SILLAS'),(6,'ACCESORIOS'),(7,'COMEDORES'),(10,'MESAS'),(43,'MUEBLES TAPIZADOS'),(44,'PERCHEROS'),(45,'MATERIA PRIMA'),(46,'COSTO DE PRODUCCION'),(47,'HERRAJE Y TORNILLERIA'),(48,'PINTURA'),(49,'MADERA'),(50,'PUERTAS');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cierres_caja`
--

DROP TABLE IF EXISTS `cierres_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cierres_caja` (
  `id_cierre` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `numero_semana` int DEFAULT NULL,
  `anio_semana` int DEFAULT NULL,
  `estado` enum('abierto','pendiente_cierre','cerrado') NOT NULL DEFAULT 'abierto',
  `es_primer_periodo` tinyint(1) DEFAULT '0',
  `saldos_iniciales_confirmados` tinyint(1) DEFAULT '0',
  `fecha_cierre` datetime DEFAULT NULL,
  `id_usuario_cierre` bigint unsigned DEFAULT NULL,
  `tipo_cierre` enum('manual','automatico','migracion') DEFAULT NULL,
  `observaciones` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cierre`),
  KEY `id_usuario_cierre` (`id_usuario_cierre`),
  KEY `idx_cierres_estado` (`estado`),
  KEY `idx_cierres_fecha_inicio` (`fecha_inicio`),
  KEY `idx_cierres_fecha_fin` (`fecha_fin`),
  KEY `idx_estado_fecha` (`estado`,`fecha_inicio`),
  KEY `idx_semana_anio` (`anio_semana`,`numero_semana`),
  CONSTRAINT `cierres_caja_ibfk_1` FOREIGN KEY (`id_usuario_cierre`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cierres_caja`
--

LOCK TABLES `cierres_caja` WRITE;
/*!40000 ALTER TABLE `cierres_caja` DISABLE KEYS */;
INSERT INTO `cierres_caja` VALUES (2,'2025-09-29','2025-10-05',40,2025,'cerrado',1,1,'2025-10-05 23:59:59',NULL,'migracion','Migración automática - Período 1','2025-11-17 17:11:54'),(3,'2025-10-06','2025-10-12',41,2025,'cerrado',0,0,'2025-10-12 23:59:59',NULL,'migracion','Migración automática - Período 2','2025-11-17 17:11:54'),(4,'2025-10-13','2025-10-19',42,2025,'cerrado',0,0,'2025-10-19 23:59:59',NULL,'migracion','Migración automática - Período 3','2025-11-17 17:11:54'),(5,'2025-10-20','2025-10-26',43,2025,'cerrado',0,0,'2025-10-26 23:59:59',NULL,'migracion','Migración automática - Período 4','2025-11-17 17:11:54'),(6,'2025-10-27','2025-11-02',44,2025,'cerrado',0,0,'2025-11-02 23:59:59',NULL,'migracion','Migración automática - Período 5','2025-11-17 17:11:54'),(7,'2025-11-03','2025-11-09',45,2025,'cerrado',0,0,'2025-11-09 23:59:59',NULL,'migracion','Migración automática - Período 6','2025-11-17 17:11:54'),(8,'2025-11-10','2025-11-16',46,2025,'cerrado',0,0,'2025-11-16 23:59:59',NULL,'migracion','Migración automática - Período 7','2025-11-17 17:11:54'),(9,'2025-11-17','2025-11-17',47,2025,'cerrado',0,0,'2025-11-17 17:13:02',NULL,'migracion','Cierre inicial','2025-11-17 17:11:54'),(10,'2025-11-18',NULL,NULL,NULL,'abierto',0,0,NULL,NULL,NULL,NULL,'2025-11-17 17:13:02');
/*!40000 ALTER TABLE `cierres_caja` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'ABAKO MUEBLES','1038116','300857',NULL,NULL,NULL),(2,'HERNANDO',NULL,'3134683796',NULL,'CUCUTA',NULL),(3,'JALISSA AREIZA',NULL,'3234025269',NULL,'MEDELLIN',NULL),(4,'ABAKO MUEBLES','23333333','12345667777',NULL,NULL,NULL),(5,'JORGUE FRANCO',NULL,'3017204784',NULL,NULL,NULL),(6,'PAOLA GIRALDO',NULL,'3022728445',NULL,'SINCELEJO',NULL),(7,'CAMILA RINCON ANGARITA',NULL,'315483420',NULL,'FUSAGASUGA CUNDINAMARCA',NULL),(9,'RAFAEL',NULL,'3000027635',NULL,NULL,NULL),(10,'RUBEN SERNA',NULL,'3054499362',NULL,NULL,NULL),(11,'SAULON OSPINA',NULL,'3104544968',NULL,NULL,NULL),(12,'WILMAR TORRES',NULL,'3005377726',NULL,NULL,NULL),(13,'ENALFO RAMOS',NULL,'3005876213',NULL,NULL,NULL),(15,'OSCAR','2222222222222','222222222',NULL,NULL,NULL),(16,'ELIS',NULL,'3185666232',NULL,'COVEÑAS',NULL),(17,'ASTRID',NULL,'3333333333',NULL,NULL,NULL),(18,'EMIRO TAMARA',NULL,'22222',NULL,NULL,NULL),(19,'ELKIN FONSECA','222222','11111111',NULL,NULL,NULL),(20,'LORENA L','1111111111','3106627304',NULL,'SUAN',NULL),(21,'JUAN',NULL,'22222222',NULL,'BELLO ANTIOQUIA',NULL),(22,'PEDRO RODRIGUES','1111111111','33333',NULL,NULL,NULL),(24,'NELSON AREIZA','11111','11111',NULL,NULL,NULL);
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
-- Table structure for table `configuracion_cierres`
--

DROP TABLE IF EXISTS `configuracion_cierres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_cierres` (
  `id_config` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `descripcion` text,
  `tipo_dato` enum('string','number','boolean') DEFAULT 'string',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_config`),
  UNIQUE KEY `clave` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_cierres`
--

LOCK TABLES `configuracion_cierres` WRITE;
/*!40000 ALTER TABLE `configuracion_cierres` DISABLE KEYS */;
INSERT INTO `configuracion_cierres` VALUES (1,'cierre_dia_semana','7','Día de cierre automático (7=Domingo)','number','2025-11-15 14:32:19','2025-11-15 14:32:19'),(2,'primer_periodo_configurado','true','Sistema inicializado','boolean','2025-11-15 14:32:19','2025-11-17 17:11:54');
/*!40000 ALTER TABLE `configuracion_cierres` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos_indirectos`
--

LOCK TABLES `costos_indirectos` WRITE;
/*!40000 ALTER TABLE `costos_indirectos` DISABLE KEYS */;
INSERT INTO `costos_indirectos` VALUES (1,'ENEGIA ELECTRICA','2025-11-01',2069980,NULL);
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
  `valor_asignado` int DEFAULT NULL,
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
-- Table structure for table `detalle_cierre_caja`
--

DROP TABLE IF EXISTS `detalle_cierre_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_cierre_caja` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_cierre` int NOT NULL,
  `id_metodo_pago` int NOT NULL,
  `saldo_inicial` int DEFAULT '0',
  `total_ingresos` int DEFAULT '0',
  `total_egresos` int DEFAULT '0',
  `saldo_final` int GENERATED ALWAYS AS (((`saldo_inicial` + `total_ingresos`) - `total_egresos`)) STORED,
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `uk_cierre_metodo` (`id_cierre`,`id_metodo_pago`),
  KEY `idx_detalle_cierre` (`id_cierre`),
  KEY `idx_detalle_metodo` (`id_metodo_pago`),
  CONSTRAINT `fk_detalle_cierre` FOREIGN KEY (`id_cierre`) REFERENCES `cierres_caja` (`id_cierre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_metodo` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id_metodo_pago`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_cierre_caja`
--

LOCK TABLES `detalle_cierre_caja` WRITE;
/*!40000 ALTER TABLE `detalle_cierre_caja` DISABLE KEYS */;
INSERT INTO `detalle_cierre_caja` (`id_detalle`, `id_cierre`, `id_metodo_pago`, `saldo_inicial`, `total_ingresos`, `total_egresos`) VALUES (5,2,1,0,6000,360000),(6,2,2,0,0,0),(7,2,3,0,0,0),(8,2,4,0,0,0),(9,3,1,-354000,1040000,0),(10,3,2,0,900000,0),(11,3,3,0,0,0),(12,3,4,0,0,0),(13,4,1,686000,2275000,1347800),(14,4,2,900000,3140000,1350000),(15,4,3,0,0,0),(16,4,4,0,0,0),(17,5,1,1613200,1820000,1565800),(18,5,2,2690000,0,0),(19,5,3,0,0,0),(20,5,4,0,0,0),(21,6,1,1867400,0,647100),(22,6,2,2690000,6050000,0),(23,6,3,0,0,0),(24,6,4,0,0,0),(25,7,1,1220300,300000,3131690),(26,7,2,8740000,0,0),(27,7,3,0,0,0),(28,7,4,0,0,0),(29,8,1,-1611390,100000,1608804),(30,8,2,8740000,5595000,0),(31,8,3,0,0,0),(32,8,4,0,0,0),(33,9,1,-3120194,NULL,NULL),(34,9,2,14335000,NULL,NULL),(35,9,3,0,NULL,NULL),(36,9,4,0,NULL,NULL),(37,10,1,-3120194,0,0),(38,10,2,14335000,0,0),(39,10,3,0,0,0),(40,10,4,0,0,0);
/*!40000 ALTER TABLE `detalle_cierre_caja` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_compra`
--

LOCK TABLES `detalle_orden_compra` WRITE;
/*!40000 ALTER TABLE `detalle_orden_compra` DISABLE KEYS */;
INSERT INTO `detalle_orden_compra` VALUES (1,1,12,2,60000.00,NULL),(2,2,51,6,60000.00,NULL),(3,3,51,6,60000.00,NULL),(4,4,67,1,27000.00,NULL),(5,5,70,1,158000.00,NULL),(6,5,71,1,9000.00,NULL),(7,6,68,1,550000.00,NULL),(8,7,72,1,688000.00,NULL),(9,7,73,1,38000.00,NULL),(10,8,69,1,800000.00,NULL),(11,9,74,1,19200.00,NULL),(12,9,75,1,3600.00,NULL),(13,10,76,2,10000.00,NULL),(14,10,77,1,2000.00,NULL),(15,10,78,1,16000.00,NULL),(16,11,79,20,350.00,NULL),(17,12,80,1,17000.00,NULL),(18,13,81,1,73000.00,NULL),(19,13,82,1,60000.00,NULL),(20,14,83,1,32500.00,NULL),(21,14,84,1,39000.00,NULL),(22,14,73,1,38000.00,NULL),(23,14,85,1,3000.00,NULL),(24,14,86,1,2500.00,NULL),(25,14,87,1,7000.00,NULL),(26,15,90,1,180000.00,NULL),(27,16,94,2,8000.00,NULL),(28,17,93,1,150000.00,NULL),(29,18,92,1,4000.00,NULL),(32,19,88,1,40000.00,NULL),(34,20,96,4,39250.00,NULL),(35,21,99,2,4000.00,NULL),(36,22,98,1,54800.00,NULL),(37,23,100,2,5000.00,NULL),(38,24,101,1,100000.00,NULL),(39,25,101,1,100000.00,NULL),(40,26,102,10,33000.00,NULL),(41,27,81,1,80000.00,NULL),(42,27,82,1,60000.00,NULL),(43,28,103,2,2000.00,NULL),(44,29,108,100,180.00,NULL),(45,30,109,1,8000.00,NULL),(46,31,81,1,350000.00,NULL),(47,32,107,1,16500.00,NULL),(48,33,82,1,60000.00,NULL),(49,33,105,1,4600.00,NULL),(50,33,106,2,1000.00,NULL),(51,34,111,1,95000.00,NULL),(52,35,108,100,180.00,NULL),(53,36,89,1,3000.00,NULL),(54,37,89,1,3000.00,NULL),(55,38,117,1,15000.00,NULL),(56,39,119,1,39000.00,NULL),(57,40,117,1,15000.00,NULL),(58,41,126,30,273.00,NULL),(59,42,125,1,14500.00,NULL),(60,43,120,2,59000.00,NULL),(61,43,121,2,65000.00,NULL),(62,43,122,3,4600.00,NULL),(63,43,105,2,4600.00,NULL),(64,43,127,1,30000.00,NULL),(65,44,11,2,80000.00,NULL),(66,45,130,3,18000.00,NULL),(67,46,117,1,15000.00,NULL),(68,47,100,1,6000.00,NULL),(69,48,8,15,95000.00,NULL),(70,49,63,2,60000.00,NULL),(71,50,131,1,180000.00,NULL),(72,51,46,7,45000.00,NULL),(73,52,70,1,152000.00,NULL),(74,52,132,1,1000.00,NULL),(75,53,98,1,125000.00,NULL),(76,54,135,1,54000.00,NULL),(77,54,99,1,4000.00,NULL),(78,55,135,1,53000.00,NULL),(79,56,99,1,4000.00,NULL),(80,57,136,100,1300.00,NULL),(81,58,137,2,5000.00,NULL),(82,59,120,1,59000.00,NULL),(83,59,121,1,65000.00,NULL),(84,60,140,1,17000.00,NULL),(85,61,119,1,14900.00,NULL),(86,62,141,1,36000.00,NULL),(87,63,100,1,5000.00,NULL),(88,63,137,1,6000.00,NULL),(89,64,142,1,7000.00,NULL),(90,64,117,1,13000.00,NULL),(91,65,143,4,7600.00,NULL),(92,65,144,6,4500.00,NULL),(93,65,100,1,6750.00,NULL),(94,65,137,1,6750.00,NULL),(95,65,145,2,4500.00,NULL),(96,65,146,1,9000.00,NULL),(97,65,147,1,2000.00,NULL),(98,65,80,1,20000.00,NULL),(99,65,85,1,11500.00,NULL),(100,66,148,1,20000.00,NULL),(101,67,100,2,6000.00,NULL),(102,68,127,1,20000.00,NULL),(103,69,149,1,10000.00,NULL),(104,70,138,1,60000.00,NULL),(105,71,99,1,15000.00,NULL),(106,72,150,1,3000.00,NULL),(107,73,11,1,40000.00,NULL),(108,74,23,4,60000.00,NULL),(109,75,151,1,19000.00,NULL),(110,76,155,1,28000.00,NULL),(111,76,156,1,6000.00,NULL),(112,77,157,1,61000.00,NULL),(113,77,120,1,59000.00,NULL),(114,77,158,100,180.00,NULL),(115,77,127,1,30000.00,NULL),(116,78,160,3,32000.00,NULL),(117,78,159,1,9000.00,NULL),(118,78,87,1,13000.00,NULL),(119,78,85,1,10000.00,NULL),(120,78,161,1,15000.00,NULL),(121,79,162,5,16000.00,NULL),(122,80,108,200,180.00,NULL),(123,80,158,200,200.00,NULL),(124,81,163,4,15126.00,NULL),(125,81,164,1,30000.00,NULL),(126,81,165,1,50000.00,NULL),(127,82,92,1,10000.00,NULL),(128,83,166,1,50000.00,NULL),(129,84,168,1,15000.00,NULL),(130,85,99,1,8000.00,NULL),(131,86,169,1,100000.00,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_fabricacion`
--

LOCK TABLES `detalle_orden_fabricacion` WRITE;
/*!40000 ALTER TABLE `detalle_orden_fabricacion` DISABLE KEYS */;
INSERT INTO `detalle_orden_fabricacion` VALUES (1,1,1,12,3),(2,2,2,4,3),(3,2,3,1,3),(4,2,4,1,3),(5,3,5,12,3),(6,3,13,8,3),(7,4,1,2,3),(8,5,1,3,3),(9,6,1,3,3),(10,7,18,4,3),(11,8,19,4,3),(12,8,20,1,3),(13,8,25,1,3),(14,8,21,1,13),(15,8,22,8,3),(16,8,26,1,3),(17,8,23,1,3),(18,8,11,1,3),(19,9,24,1,11),(20,10,8,2,3),(21,11,41,12,3),(22,12,41,2,3),(23,12,42,3,3),(24,13,43,8,13),(25,13,44,4,13),(26,13,45,1,3),(27,13,24,1,3),(28,14,41,2,3),(29,14,42,3,3),(30,15,41,2,3),(31,15,42,3,3),(32,16,19,4,3),(33,16,46,1,3),(34,16,25,1,3),(35,16,47,1,3),(36,16,21,1,3),(37,16,22,8,3),(38,16,23,1,3),(39,16,11,1,3),(40,17,24,1,3),(41,18,43,8,13),(42,18,44,4,13),(43,18,45,1,3),(44,18,24,1,3),(45,19,45,2,3),(46,19,48,1,3),(47,20,22,21,3),(48,21,22,13,3),(49,22,42,13,3),(50,23,22,13,3),(51,23,49,2,13),(52,24,24,1,3),(53,25,8,1,3),(54,26,8,1,3),(55,27,50,4,13),(56,28,52,50,3),(57,29,53,3,3),(58,30,54,14,13),(59,31,9,31,3),(60,32,9,20,3),(61,33,50,14,13),(62,34,50,14,13),(63,35,19,4,3),(64,36,22,5,3),(65,36,56,4,13),(66,37,28,5,3),(67,37,29,20,3),(68,37,30,2,3),(69,37,31,30,3),(70,37,32,6,3),(71,37,33,4,3),(72,37,34,6,3),(73,37,35,14,13),(74,37,36,4,3),(75,37,37,4,3),(76,37,38,50,3),(77,37,39,5,3),(78,37,40,2,3),(79,38,19,4,3),(80,39,6,46,3),(81,40,6,46,3),(82,41,51,6,13),(83,42,24,1,3),(84,43,1,8,3),(85,44,6,4,3),(86,45,1,3,3),(87,45,2,1,3),(88,46,57,1,13),(89,47,9,31,3),(90,47,17,8,3),(91,47,13,7,3),(92,48,1,2,3),(93,48,60,1,3),(94,48,61,14,3),(95,49,62,3,3),(96,49,63,8,3),(97,50,17,8,3),(98,50,5,7,3),(99,51,19,2,3),(100,52,6,6,3),(101,53,64,1,3),(102,54,65,1,13),(103,55,31,16,3),(104,56,31,16,3),(105,57,31,1,3),(106,58,6,25,3),(107,59,61,6,3),(108,60,6,1,3),(109,61,41,10,3),(110,62,110,1,3),(111,62,41,2,3),(112,63,110,2,3),(113,63,41,2,3),(114,64,35,5,3),(115,65,118,1,3),(116,66,128,10,3),(117,67,8,15,3),(118,68,19,1,3),(119,69,6,24,3),(120,70,46,1,3),(121,71,133,3,3),(122,71,134,2,3),(123,72,13,12,3),(124,73,13,17,3),(125,74,13,17,3),(126,75,41,10,3),(127,76,138,1,3),(128,77,23,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_venta`
--

LOCK TABLES `detalle_orden_venta` WRITE;
/*!40000 ALTER TABLE `detalle_orden_venta` DISABLE KEYS */;
INSERT INTO `detalle_orden_venta` VALUES (1,3,8,2,150000.00,''),(2,4,23,1,1000.00,''),(3,5,59,1,700000.00,''),(5,7,2,1,1100000.00,''),(6,8,19,4,275000.00,''),(7,9,22,1,75000.00,''),(8,10,22,2,70000.00,''),(9,11,57,1,7000000.00,''),(10,12,22,6,70000.00,''),(11,13,95,1,600000.00,''),(12,14,104,1,800000.00,''),(13,15,115,1,1200000.00,''),(14,15,10,2,850000.00,''),(15,16,113,1,700000.00,''),(16,16,3,1,600000.00,''),(17,16,5,3,90000.00,''),(18,16,42,2,200000.00,''),(19,17,116,4,750000.00,''),(20,18,42,1,200000.00,''),(23,19,62,1,100000.00,NULL),(24,20,15,1,450000.00,''),(25,20,23,1,120000.00,''),(26,21,5,10,80000.00,''),(27,22,9,11,115000.00,''),(28,23,8,3,160000.00,''),(29,24,41,6,220000.00,''),(30,24,6,9,120000.00,''),(31,24,138,1,120000.00,''),(32,6,6,8,120000.00,NULL),(33,6,42,2,225000.00,NULL),(34,6,19,2,300000.00,NULL),(35,25,153,1,1500000.00,''),(36,26,5,20,115000.00,''),(37,26,13,2,80000.00,''),(38,26,63,6,100000.00,''),(39,27,8,6,115000.00,''),(40,28,46,1,100000.00,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pago_trabajador`
--

LOCK TABLES `detalle_pago_trabajador` WRITE;
/*!40000 ALTER TABLE `detalle_pago_trabajador` DISABLE KEYS */;
INSERT INTO `detalle_pago_trabajador` (`id_detalle_pago`, `id_pago`, `id_avance_etapa`, `cantidad`, `pago_unitario`, `es_descuento`) VALUES (1,1,13,12,30000,0),(2,2,21,2,1,0),(3,2,3,3,30000,0),(4,3,25,3,30000,0),(5,3,24,2,35000,0),(6,3,2,4,200000,0),(7,4,20,1,20000,0),(8,4,19,1,80000,0),(9,4,18,4,20000,0),(10,4,17,8,15000,0),(11,5,4,4,100000,0),(12,5,NULL,1,-250000,1),(13,6,28,4,35000,0),(14,7,59,13,12000,0),(15,8,34,8,12000,0),(16,9,94,32,25000,0),(17,10,46,1,20000,0),(18,10,44,4,20000,0),(19,10,41,8,15000,0),(20,11,58,13,8000,0),(21,12,30,4,8000,0),(22,13,61,12,3500,0),(23,14,69,1,15000,0),(24,15,43,8,3000,0),(25,16,73,1,1,0),(26,16,33,1,1,0),(27,17,95,1,3500,0),(28,18,85,1,1,0),(29,19,80,1,1,0),(30,19,78,1,1,0),(31,19,31,1,1,0),(32,20,71,1,1,0),(33,21,56,13,30000,0),(34,22,97,1,70000,0),(35,22,NULL,1,-70000,1),(36,23,96,3,30000,0),(37,24,90,4,20000,0),(38,25,53,1,70000,0),(39,25,52,2,80000,0),(40,26,62,1,20000,0),(41,27,51,3,100000,0),(42,28,60,12,10000,0),(43,29,57,13,20000,0),(44,30,42,8,10000,0),(45,31,91,4,7500,0),(46,32,47,1,15000,0),(47,33,79,1,1,0),(48,33,72,1,1,0),(49,34,50,1,70000,0),(50,35,75,1,10000,0),(51,36,77,1,10000,0),(52,37,98,14,20000,0),(53,38,93,4,25000,0),(54,39,88,2,25000,0),(55,40,143,20,20000,0),(56,40,129,4,1,0),(57,40,128,5,1,0),(58,41,109,1,100000,0),(59,42,100,18,25000,0),(60,43,135,50,25000,0),(61,44,146,6,15000,0),(62,44,131,4,10000,0),(63,44,130,5,10000,0),(64,44,120,4,7500,0),(65,44,115,1,40000,0),(66,44,113,1,25000,0),(67,44,112,12,18000,0),(68,44,107,1,100000,0),(69,44,105,12,20000,0),(70,44,103,2,20000,0),(71,45,136,12,18000,0),(72,46,110,1,10000,0),(73,47,149,1,3500,0),(74,47,140,3,8000,0),(75,47,133,4,3500,0),(76,47,132,5,3500,0),(77,47,123,2,2000,0),(78,47,116,2,10000,0),(79,47,114,4,2000,0),(80,47,108,4,25000,0),(81,47,106,6,5000,0),(82,47,104,2,5000,0),(83,47,102,1,5000,0),(84,47,64,1,3500,0),(85,48,139,1,8000,0),(86,48,111,1,3500,0),(87,48,101,1,3500,0),(88,48,92,4,4000,0),(89,48,89,1,7000,0),(90,48,87,1,7000,0),(91,48,82,1,5000,0),(92,48,55,8,3500,0),(93,48,49,3,8000,0),(94,48,23,2,7000,0),(95,49,134,4,5000,0),(96,49,122,4,25000,0),(97,49,121,8,20000,0),(98,50,144,26,20000,0),(99,51,165,1,900000,0),(100,52,160,4,12000,0),(101,52,157,8,1,0),(102,52,154,1,30000,0),(103,52,153,15,18000,0),(104,52,151,46,12000,0),(105,53,162,1,5000,0),(106,53,161,4,3500,0),(107,53,158,8,5000,0),(108,53,155,6,5000,0),(109,53,152,46,3500,0),(110,54,164,1,150000,0),(111,54,163,3,33300,0),(112,54,156,8,1,0),(113,55,148,1,1,0),(114,55,138,4,1,0),(115,56,159,4,1,0),(116,56,147,1,1,0),(117,57,145,6,1,0),(118,57,137,4,1,0),(119,58,32,1,1,0),(120,59,186,14,15000,0),(121,59,99,17,15000,0),(122,59,NULL,1,-250000,1),(123,60,188,7,12000,0),(124,60,192,6,1,0),(125,60,187,8,15000,0),(126,61,196,4,10000,0),(127,61,173,1,50000,0),(128,61,169,1,80000,0),(129,61,190,2,1,0),(130,61,171,1,20000,0),(131,61,199,1,15000,0),(132,61,176,22,18000,0),(133,61,184,1,350000,0),(134,61,193,5,10000,0),(135,62,182,8,13000,0),(136,63,197,4,3500,0),(137,63,174,1,15000,0),(138,63,202,1,15000,0),(139,63,170,1,20000,0),(140,63,191,2,8000,0),(141,63,172,1,5000,0),(142,63,183,4,5000,0),(143,63,180,3,7000,0),(144,63,177,30,3500,0),(145,63,185,1,70000,0),(146,63,175,1,5000,0),(147,63,195,6,3500,0),(148,64,224,10,20000,0),(149,64,223,15,20000,0),(150,65,228,1,40000,0),(151,65,227,6,30000,0),(152,65,226,4,20000,0),(153,65,225,20,20000,0),(154,66,216,1,17000,0),(155,66,214,16,17000,0),(156,66,212,30,17000,0),(157,67,198,1,1,0),(158,68,150,14,20000,0),(159,68,NULL,1,-100000,1),(160,69,207,27,12000,0),(161,69,221,1,20000,0),(162,69,219,2,20000,0),(163,69,217,1,12000,0),(164,69,215,16,12000,0),(165,69,209,8,10000,0),(166,70,208,12,3500,0),(167,70,222,1,5000,0),(168,70,220,2,5000,0),(169,70,211,1,4000,0),(170,70,218,10,3500,0),(171,70,210,8,3500,0),(172,71,204,1,80000,0),(173,71,203,2,35000,0),(174,71,206,2,20000,0),(175,71,205,12,20000,0),(176,72,229,6,20000,0),(177,73,230,1,300000,0),(178,78,233,1,20000,0),(179,79,253,1,1,0),(180,79,251,5,50000,0),(181,79,249,5,20000,0),(182,79,244,4,50000,0),(183,79,243,4,50000,0),(184,79,242,6,70000,0),(185,79,241,4,40000,0),(186,80,240,2,35000,0),(187,80,239,2,30000,0),(188,81,236,10,35000,0),(189,82,255,1,4000,0),(190,82,238,7,5000,0),(191,82,235,1,3500,0),(192,82,232,25,3500,0),(193,83,254,1,20000,0),(194,83,252,14,18000,0),(195,83,250,5,18000,0),(196,83,248,4,12000,0),(197,83,247,3,12000,0),(198,83,245,1,18000,0),(199,83,237,10,20000,0),(200,83,234,1,12000,0),(201,83,231,25,12000,0),(202,84,277,24,20000,0),(203,85,257,2,50000,0),(204,86,280,1,10000,0),(205,86,278,1,40000,0),(206,86,276,4,15000,0),(207,86,275,6,15000,0),(208,86,274,5,15000,0),(209,86,272,1,25000,0),(210,86,270,2,15000,0),(211,87,284,2,4500,0),(212,87,282,3,7000,0),(213,87,261,4,12000,0),(214,87,260,20,12000,0),(215,87,259,3,20000,0),(216,87,258,6,30000,0),(217,87,246,12,12000,0),(218,88,273,1,8000,0),(219,88,268,10,7000,0),(220,88,265,16,3500,0),(221,88,264,4,5000,0),(222,88,263,3,3500,0),(223,88,262,15,4000,0),(224,89,269,6,15000,0),(225,89,267,15,20000,0),(226,90,279,1,1,0),(227,90,271,1,1,0),(228,90,266,15,1,0),(229,90,200,1,1,0),(230,90,189,2,1,0),(231,90,181,8,1,0),(232,90,178,3,1,0),(233,90,119,14,20000,0),(234,91,283,2,1,0),(235,91,281,3,1,0),(236,91,76,1,10000,0),(237,91,74,1,10000,0),(238,92,81,1,12000,0),(239,93,86,1,18000,0),(240,93,29,4,25000,0),(241,93,22,2,18000,0),(242,94,201,1,1,0),(243,94,194,1,1,0),(244,94,179,3,1,0),(245,94,70,1,25000,0),(246,94,68,1,25000,0),(247,94,63,1,10000,0),(248,94,54,8,10000,0),(249,94,48,3,20000,0),(250,94,45,4,7500,0),(251,95,285,17,12000,0),(252,96,294,10,35000,0),(253,97,303,3,20000,0),(254,97,301,1,17000,0),(255,97,298,1,15000,0),(256,97,295,11,10000,0),(257,97,290,9,18000,0),(258,97,288,6,18000,0),(259,97,286,24,12000,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,12,'',90000),(2,2,2,4,'',1300000),(3,2,3,1,'',700000),(4,2,4,1,'',500000),(5,3,5,12,'',120000),(6,3,13,8,'',115000),(7,4,1,3,'',90000),(8,5,18,1,'',2000),(9,6,19,4,'',30000),(10,6,20,1,'',9000),(11,6,25,1,'',33333),(12,6,21,1,'',33333333),(13,6,22,8,'',333333),(14,6,26,1,'',0),(15,6,23,1,'',3333),(16,6,24,1,'',200000),(17,7,24,1,'',200000),(18,8,8,2,'',150000),(19,9,28,5,'',300000),(20,9,29,20,'',150000),(21,9,30,2,'',2),(22,9,31,30,'',120000),(23,9,32,6,'',300000),(24,9,33,4,'',800000),(25,9,34,6,'',700000),(26,9,35,14,'',140000),(27,9,36,4,'',150000),(28,9,37,4,'',500000),(29,9,38,50,'',140000),(30,9,39,5,'',60000),(31,9,40,2,'',50000),(32,10,19,6,'',30000),(33,11,41,12,'',30000),(34,12,41,2,'',30000),(35,12,42,3,'',200000),(36,13,43,8,'',200000),(37,13,44,4,'',120000),(38,13,45,1,'',300000),(39,13,24,1,'',200000),(40,14,41,2,'',30000),(41,14,42,3,'',200000),(42,15,19,4,'',30000),(43,15,46,1,'',100000),(44,15,25,1,'',33333),(45,15,47,1,'',100000),(46,15,21,1,'',33333333),(47,15,22,8,'',333333),(48,15,23,1,'',3333),(49,15,11,1,'',120000),(50,16,45,2,'',300000),(51,16,48,1,'',1),(52,17,42,10,'',200000),(53,18,22,21,'',333333),(54,19,22,13,'',333333),(55,20,42,13,'',200000),(56,21,22,13,'',333333),(57,21,49,2,'',2),(58,22,8,1,'',150000),(59,23,50,4,'',4),(60,24,52,50,'',50),(61,25,53,3,'',30000),(62,26,54,20,'',20),(64,28,9,31,'',100000),(65,29,9,20,'',100000),(66,30,50,14,'',4),(67,31,50,14,'',4),(68,32,19,4,'',30000),(69,33,22,5,'',333333),(70,34,22,5,'',333333),(71,34,56,1,'',4),(72,35,6,46,'',120000),(73,36,51,6,'',160000),(74,37,24,1,'',200000),(75,27,55,31,NULL,115000),(76,38,1,3,'',200000),(77,38,2,1,'',1300000),(78,39,1,8,'',200000),(79,40,6,4,'',120000),(80,41,57,1,'',3000000),(81,42,9,31,'',100000),(82,42,17,8,'',12222),(83,42,13,7,'',115000),(84,43,1,2,'',200000),(85,43,60,1,'',800000),(86,43,61,14,'',120000),(87,44,62,3,'',120000),(88,44,63,8,'',120000),(89,45,17,8,'',12222),(90,45,5,7,'',120000),(91,46,19,2,'',30000),(92,47,6,6,'',120000),(93,48,64,1,'',100000),(94,49,65,1,'',200000),(95,50,31,16,'',17000),(96,51,31,16,'',17000),(97,52,31,1,'',17000),(98,53,6,25,'',120000),(99,54,61,6,'',100000),(100,55,6,1,'',120000),(101,56,41,10,'',30000),(102,57,110,1,'',2222),(103,57,41,2,'',30000),(104,58,35,5,'',100000),(105,59,118,1,'',33333),(106,60,128,10,'',100000),(107,61,8,15,'',150000),(108,62,19,1,'',30000),(109,63,6,24,'',120000),(110,64,46,1,'',100000),(111,65,133,3,'',3333),(112,65,134,2,'',3333),(113,66,13,12,'',90000),(114,67,13,17,'',90000),(115,68,41,10,'',30000),(116,69,138,1,'',33333),(117,70,23,1,'',3333),(118,71,41,3,'',220000),(119,71,139,3,'',220000),(120,71,6,9,'',120000),(121,71,138,1,'',120000);
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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,12,12,2,'2025-10-20 21:25:15'),(2,2,4,5,2,'2025-10-16 21:10:36'),(3,3,0,1,2,'2025-10-29 18:30:53'),(4,4,1,1,2,'2025-10-15 14:38:53'),(5,5,9,7,0,'2025-11-15 19:16:17'),(6,10,0,0,0,'2025-10-29 18:14:50'),(7,11,9,1,0,'2025-11-13 16:09:03'),(8,12,2,0,2,'2025-09-13 13:20:58'),(9,13,0,0,2,'2025-11-15 19:16:18'),(10,15,0,0,1,'2025-11-13 16:24:51'),(11,16,1,0,0,'2025-09-12 14:24:33'),(12,17,14,8,0,'2025-10-20 19:48:35'),(13,18,2,2,2,'2025-10-01 20:39:57'),(14,19,11,15,0,'2025-11-04 15:27:42'),(15,20,1,0,1,'2025-09-12 16:21:37'),(16,21,1,1,0,'2025-09-17 21:00:04'),(17,22,37,46,0,'2025-10-21 14:52:07'),(18,23,6,2,2,'2025-11-13 16:24:51'),(19,24,3,3,0,'2025-10-02 21:51:40'),(20,8,17,13,2,'2025-11-15 20:21:59'),(21,25,1,1,2,'2025-09-23 16:04:22'),(22,26,0,0,2,'2025-09-12 15:46:03'),(23,28,0,0,2,'2025-09-13 20:12:41'),(24,29,0,0,2,'2025-09-13 20:14:06'),(25,30,0,0,2,'2025-09-13 20:16:48'),(26,31,22,22,2,'2025-11-11 14:30:43'),(27,32,0,0,2,'2025-09-13 20:21:56'),(28,33,3,3,2,'2025-11-12 14:15:34'),(29,34,0,0,2,'2025-09-13 20:24:54'),(30,35,0,0,2,'2025-09-13 20:27:17'),(31,36,0,0,2,'2025-09-13 20:29:08'),(32,37,0,0,2,'2025-09-13 20:30:14'),(33,38,50,50,2,'2025-11-11 14:28:33'),(34,39,0,0,2,'2025-09-13 20:36:13'),(35,40,0,0,2,'2025-09-13 20:38:06'),(36,41,18,24,2,'2025-11-15 18:42:05'),(37,42,13,16,2,'2025-11-05 15:28:50'),(38,43,8,8,2,'2025-10-01 21:21:16'),(39,44,4,4,2,'2025-10-01 21:21:51'),(40,45,2,2,2,'2025-10-06 21:24:04'),(41,46,7,1,2,'2025-11-15 20:38:11'),(42,47,1,1,2,'2025-10-01 19:19:31'),(43,48,1,1,2,'2025-09-23 16:11:15'),(44,49,0,0,2,'2025-09-23 15:23:12'),(45,50,4,4,2,'2025-09-26 23:17:13'),(46,51,6,0,2,'2025-10-04 20:48:08'),(47,52,0,0,2,'2025-09-27 19:18:03'),(48,53,0,0,2,'2025-09-27 19:43:24'),(49,54,0,0,2,'2025-09-27 20:07:51'),(50,55,0,0,2,'2025-09-27 20:27:34'),(51,9,20,28,2,'2025-11-15 19:12:15'),(52,56,4,4,2,'2025-10-01 22:05:46'),(53,6,105,106,2,'2025-11-15 18:42:06'),(54,57,1,1,2,'2025-10-24 20:57:55'),(55,59,0,0,0,'2025-10-11 20:48:56'),(56,60,0,0,2,'2025-10-15 14:15:32'),(57,61,6,6,2,'2025-11-11 14:21:18'),(58,62,2,3,2,'2025-11-05 15:30:45'),(59,63,4,8,2,'2025-11-15 19:16:18'),(60,64,1,1,2,'2025-10-20 19:51:06'),(61,65,0,0,2,'2025-10-15 16:33:36'),(62,67,1,0,2,'2025-10-17 21:27:54'),(63,70,2,0,2,'2025-11-06 14:17:57'),(64,71,1,0,2,'2025-10-17 21:27:49'),(65,68,1,0,2,'2025-10-17 21:27:46'),(66,72,1,0,2,'2025-10-17 21:27:43'),(67,73,2,0,2,'2025-10-21 14:49:38'),(68,69,1,0,2,'2025-10-17 21:27:40'),(69,74,1,0,2,'2025-10-17 21:27:35'),(70,75,1,0,2,'2025-10-17 21:27:35'),(71,76,2,0,2,'2025-10-17 21:27:32'),(72,77,1,0,2,'2025-10-17 21:27:32'),(73,78,1,0,2,'2025-10-17 21:27:32'),(74,79,20,0,2,'2025-10-17 21:27:22'),(75,80,2,0,2,'2025-11-13 15:25:56'),(76,81,3,0,2,'2025-10-28 20:48:55'),(77,82,3,0,2,'2025-10-28 20:52:00'),(78,83,1,0,2,'2025-10-21 14:49:38'),(79,84,1,0,2,'2025-10-21 14:49:38'),(80,85,3,0,2,'2025-11-15 19:51:26'),(81,86,1,0,2,'2025-10-21 14:49:39'),(82,87,2,0,2,'2025-11-15 19:51:26'),(83,90,1,0,2,'2025-10-21 14:56:59'),(84,94,2,0,2,'2025-10-21 14:59:24'),(85,93,1,0,2,'2025-10-21 15:00:23'),(86,92,2,0,2,'2025-11-15 20:25:21'),(87,95,0,0,1,'2025-10-23 15:34:04'),(88,88,1,0,2,'2025-10-23 15:44:09'),(89,96,4,0,2,'2025-10-23 16:06:40'),(90,99,6,0,2,'2025-11-15 20:37:32'),(91,98,2,0,2,'2025-11-06 14:52:08'),(92,100,7,0,2,'2025-11-13 15:46:05'),(93,101,2,0,2,'2025-10-24 20:12:13'),(94,102,10,0,2,'2025-10-24 20:20:57'),(95,103,2,0,2,'2025-10-25 16:13:03'),(96,104,0,0,0,'2025-10-25 17:44:51'),(97,108,300,0,2,'2025-11-15 19:59:03'),(98,109,1,0,2,'2025-10-28 20:45:47'),(99,107,1,0,2,'2025-10-28 20:50:03'),(100,105,3,0,2,'2025-11-05 15:23:30'),(101,106,2,0,2,'2025-10-28 20:52:00'),(102,110,0,0,2,'2025-10-28 21:14:50'),(103,111,1,0,2,'2025-10-29 17:37:53'),(104,89,2,0,2,'2025-10-29 17:42:55'),(105,115,0,0,1,'2025-10-29 18:14:50'),(106,113,0,0,1,'2025-10-29 18:30:53'),(107,116,0,0,4,'2025-10-29 18:37:19'),(108,117,3,0,2,'2025-11-13 14:57:21'),(109,118,1,1,2,'2025-10-31 15:01:00'),(110,119,2,0,2,'2025-11-13 14:48:15'),(111,120,4,0,2,'2025-11-15 19:44:21'),(112,121,3,0,2,'2025-11-13 14:44:05'),(113,122,3,0,2,'2025-11-05 15:23:30'),(114,123,0,0,2,'2025-11-01 20:42:51'),(115,128,0,0,2,'2025-11-04 14:06:27'),(118,126,30,0,2,'2025-11-05 15:18:36'),(119,125,1,0,2,'2025-11-05 15:20:18'),(120,127,3,0,2,'2025-11-15 19:44:22'),(121,130,3,0,2,'2025-11-05 15:27:28'),(122,131,1,0,2,'2025-11-05 15:36:32'),(123,132,1,0,2,'2025-11-06 14:17:57'),(124,133,0,0,2,'2025-11-06 14:22:10'),(125,134,0,0,2,'2025-11-06 14:27:03'),(126,135,2,0,2,'2025-11-06 14:52:19'),(127,136,100,0,2,'2025-11-06 14:58:04'),(128,137,4,0,2,'2025-11-13 15:25:56'),(129,138,1,1,2,'2025-11-15 18:42:06'),(130,139,0,0,2,'2025-11-13 14:24:25'),(131,140,1,0,2,'2025-11-13 14:47:15'),(132,141,1,0,2,'2025-11-13 14:51:23'),(133,142,1,0,2,'2025-11-13 14:57:21'),(134,143,4,0,2,'2025-11-13 15:25:56'),(135,144,6,0,2,'2025-11-13 15:25:56'),(136,145,2,0,2,'2025-11-13 15:25:56'),(137,146,1,0,2,'2025-11-13 15:25:56'),(138,147,1,0,2,'2025-11-13 15:25:56'),(139,148,1,0,2,'2025-11-13 15:44:15'),(140,149,1,0,2,'2025-11-13 15:49:50'),(141,150,1,0,2,'2025-11-13 15:56:05'),(142,151,1,0,2,'2025-11-13 16:10:39'),(143,153,0,0,1,'2025-11-15 18:58:01'),(144,155,1,0,2,'2025-11-15 19:44:12'),(145,156,1,0,2,'2025-11-15 19:44:12'),(146,157,1,0,2,'2025-11-15 19:44:21'),(147,158,300,0,2,'2025-11-15 19:59:03'),(148,160,3,0,2,'2025-11-15 19:51:26'),(149,159,1,0,2,'2025-11-15 19:51:26'),(150,161,1,0,2,'2025-11-15 19:51:26'),(151,162,5,0,2,'2025-11-15 19:56:09'),(152,163,4,0,2,'2025-11-15 20:25:02'),(153,164,1,0,2,'2025-11-15 20:25:02'),(154,165,1,0,2,'2025-11-15 20:25:02'),(155,166,1,0,2,'2025-11-15 20:25:25'),(156,167,0,0,2,'2025-11-15 20:28:26'),(157,168,1,0,2,'2025-11-15 20:36:36'),(158,169,1,0,2,'2025-11-15 20:45:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes_fabricados`
--

LOCK TABLES `lotes_fabricados` WRITE;
/*!40000 ALTER TABLE `lotes_fabricados` DISABLE KEYS */;
INSERT INTO `lotes_fabricados` VALUES (2,10,8,7,2,'2025-09-17 19:42:26',NULL),(3,16,19,7,4,'2025-09-17 20:58:46',NULL),(4,16,21,7,1,'2025-09-17 21:00:04',NULL),(6,14,42,7,3,'2025-09-23 14:16:53',NULL),(7,16,22,7,8,'2025-09-23 14:43:22',NULL),(8,22,42,7,13,'2025-09-23 15:21:10',NULL),(9,23,22,7,12,'2025-09-23 15:26:16',NULL),(10,16,25,7,1,'2025-09-23 16:04:22',NULL),(12,19,48,7,1,'2025-09-23 16:11:15',NULL),(13,16,46,7,1,'2025-09-23 16:16:30',NULL),(14,16,11,7,1,'2025-09-26 22:10:12',NULL),(15,26,8,7,1,'2025-09-26 22:22:24',NULL),(16,19,45,7,1,'2025-09-26 22:44:59',NULL),(17,27,50,10,4,'2025-09-26 23:17:12',NULL),(18,24,24,7,1,'2025-09-27 19:39:38',NULL),(19,16,47,7,1,'2025-10-01 19:19:30',NULL),(20,16,23,7,1,'2025-10-01 19:20:05',NULL),(21,14,41,7,2,'2025-10-01 19:24:05',NULL),(22,11,41,7,6,'2025-10-01 19:40:25',NULL),(23,2,2,7,4,'2025-10-01 19:49:27',NULL),(24,23,22,7,1,'2025-10-01 20:09:09',NULL),(25,7,18,7,2,'2025-10-01 20:39:57',NULL),(26,18,43,10,8,'2025-10-01 21:21:15',NULL),(27,18,44,10,4,'2025-10-01 21:21:51',NULL),(29,36,22,7,5,'2025-10-01 22:05:04',NULL),(30,36,56,10,4,'2025-10-01 22:05:46',NULL),(31,38,19,7,1,'2025-10-02 21:06:53',NULL),(32,38,19,7,3,'2025-10-02 21:07:17',NULL),(33,42,24,7,1,'2025-10-02 21:51:39',NULL),(34,40,6,7,46,'2025-10-06 20:37:27',NULL),(35,11,41,7,6,'2025-10-06 20:50:59',NULL),(36,43,1,7,8,'2025-10-06 21:18:39',NULL),(37,44,6,7,4,'2025-10-06 21:23:09',NULL),(38,19,45,7,1,'2025-10-06 21:24:03',NULL),(39,45,2,7,1,'2025-10-15 14:23:25',NULL),(40,45,1,7,1,'2025-10-15 14:24:37',NULL),(41,2,3,7,1,'2025-10-15 14:36:39',NULL),(42,2,4,7,1,'2025-10-15 14:38:52',NULL),(43,37,38,7,30,'2025-10-15 14:48:02',NULL),(44,49,62,7,3,'2025-10-15 15:04:13',NULL),(45,49,63,7,4,'2025-10-15 15:07:10',NULL),(46,51,19,7,2,'2025-10-15 16:01:52',NULL),(47,52,6,7,6,'2025-10-15 16:18:31',NULL),(48,50,5,7,4,'2025-10-15 16:27:35',NULL),(49,31,9,7,12,'2025-10-20 19:46:09',NULL),(50,50,17,7,8,'2025-10-20 19:48:35',NULL),(51,53,64,7,1,'2025-10-20 19:51:06',NULL),(52,37,38,7,10,'2025-10-20 21:07:33',NULL),(53,45,1,7,2,'2025-10-20 21:23:18',NULL),(54,48,1,7,1,'2025-10-20 21:25:15',NULL),(55,46,57,10,1,'2025-10-24 20:57:54',NULL),(56,58,6,7,25,'2025-10-28 21:05:51',NULL),(57,60,6,7,1,'2025-10-28 21:10:54',NULL),(58,61,41,7,7,'2025-10-28 21:23:33',NULL),(59,65,118,7,1,'2025-10-31 15:01:00',NULL),(60,56,31,7,15,'2025-11-04 14:43:59',NULL),(61,50,5,7,3,'2025-11-04 14:46:18',NULL),(62,49,63,7,4,'2025-11-04 14:51:39',NULL),(63,31,9,7,16,'2025-11-04 14:54:42',NULL),(64,67,8,7,10,'2025-11-04 15:16:10',NULL),(65,68,19,7,1,'2025-11-04 15:27:41',NULL),(66,69,6,7,24,'2025-11-11 14:15:32',NULL),(67,59,61,7,6,'2025-11-11 14:21:17',NULL),(68,37,38,7,10,'2025-11-11 14:28:33',NULL),(69,37,31,7,7,'2025-11-11 14:30:42',NULL),(70,37,33,7,3,'2025-11-12 14:15:33',NULL),(71,76,138,7,1,'2025-11-12 14:35:34',NULL),(72,77,23,7,1,'2025-11-12 14:37:51',NULL),(73,75,41,7,3,'2025-11-12 15:44:41',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,1,0,'entrada','2025-09-10 22:01:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(2,2,0,'entrada','2025-09-10 22:19:22','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(3,3,0,'entrada','2025-09-10 22:20:29','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(4,4,0,'entrada','2025-09-10 22:21:21','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(5,5,35,'entrada','2025-09-10 22:39:13','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(6,10,2,'entrada','2025-09-10 22:59:07','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(7,11,5,'entrada','2025-09-10 23:00:44','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(8,12,0,'entrada','2025-09-10 23:07:01','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(9,13,0,'entrada','2025-09-10 23:23:35','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(10,11,0,'ajuste','2025-09-12 14:21:43','Ajuste manual de stock. Stock anterior: 5, Nuevo stock: 5. Stock mínimo: 0','ajuste_manual',NULL,NULL),(11,15,1,'entrada','2025-09-12 14:23:14','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(12,16,1,'entrada','2025-09-12 14:24:33','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(13,17,6,'entrada','2025-09-12 14:29:14','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(14,18,0,'entrada','2025-09-12 15:20:49','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(15,19,0,'entrada','2025-09-12 15:36:28','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(16,20,0,'entrada','2025-09-12 15:37:34','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(17,21,0,'entrada','2025-09-12 15:38:33','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(18,22,0,'entrada','2025-09-12 15:39:38','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(19,23,0,'entrada','2025-09-12 15:40:18','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(20,24,0,'entrada','2025-09-12 15:41:17','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(21,8,0,'entrada','2025-09-12 15:42:58','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(22,25,0,'entrada','2025-09-12 15:44:39','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(23,26,0,'entrada','2025-09-12 15:46:03','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(24,23,1,'ajuste','2025-09-12 16:14:04','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 0','ajuste_manual',NULL,NULL),(25,23,1,'ajuste','2025-09-12 16:17:58','Ajuste manual de stock. Stock anterior: 1, Nuevo stock: 2. Stock mínimo: 2','ajuste_manual',NULL,NULL),(26,20,1,'ajuste','2025-09-12 16:21:37','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 1','ajuste_manual',NULL,NULL),(27,22,8,'entrada','2025-09-12 16:35:08','Lote #1 de Orden de Fabricación #8 completado.','produccion',1,'lote'),(28,12,2,'entrada','2025-09-13 13:20:58','Entrada por recepción de orden de compra #1','compra',1,'orden_compra'),(29,28,0,'entrada','2025-09-13 20:12:41','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(30,29,0,'entrada','2025-09-13 20:14:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(31,30,0,'entrada','2025-09-13 20:16:48','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(32,31,0,'entrada','2025-09-13 20:20:04','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(33,32,0,'entrada','2025-09-13 20:21:56','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(34,33,0,'entrada','2025-09-13 20:23:38','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(35,34,0,'entrada','2025-09-13 20:24:54','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(36,35,0,'entrada','2025-09-13 20:27:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(37,36,0,'entrada','2025-09-13 20:29:08','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(38,37,0,'entrada','2025-09-13 20:30:14','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(39,38,0,'entrada','2025-09-13 20:31:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(40,39,0,'entrada','2025-09-13 20:36:13','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(41,40,0,'entrada','2025-09-13 20:38:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(42,41,0,'entrada','2025-09-13 21:20:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(43,42,0,'entrada','2025-09-15 14:32:47','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(44,43,0,'entrada','2025-09-15 14:40:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(45,44,0,'entrada','2025-09-15 14:41:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(46,45,0,'entrada','2025-09-15 14:41:46','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(47,8,2,'entrada','2025-09-17 19:42:26','Lote #2 de Orden de Fabricación #10 completado.','produccion',2,'lote'),(48,46,0,'entrada','2025-09-17 20:52:23','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(49,47,0,'entrada','2025-09-17 20:53:34','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(50,19,4,'entrada','2025-09-17 20:58:47','Lote #3 de Orden de Fabricación #16 completado.','produccion',3,'lote'),(51,21,1,'entrada','2025-09-17 21:00:04','Lote #4 de Orden de Fabricación #16 completado.','produccion',4,'lote'),(52,24,1,'entrada','2025-09-23 13:46:50','Lote #5 de Orden de Fabricación #17 completado.','produccion',5,'lote'),(53,42,3,'entrada','2025-09-23 14:16:54','Lote #6 de Orden de Fabricación #14 completado.','produccion',6,'lote'),(54,48,0,'entrada','2025-09-23 14:30:20','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(55,22,8,'entrada','2025-09-23 14:43:23','Lote #7 de Orden de Fabricación #16 completado.','produccion',7,'lote'),(56,42,13,'entrada','2025-09-23 15:21:10','Lote #8 de Orden de Fabricación #22 completado.','produccion',8,'lote'),(57,49,0,'entrada','2025-09-23 15:23:12','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(58,22,12,'entrada','2025-09-23 15:26:17','Lote #9 de Orden de Fabricación #23 completado.','produccion',9,'lote'),(59,25,1,'entrada','2025-09-23 16:04:22','Lote #10 de Orden de Fabricación #16 completado.','produccion',10,'lote'),(60,22,12,'entrada','2025-09-23 16:08:41','Lote #11 de Orden de Fabricación #21 completado.','produccion',11,'lote'),(61,48,1,'entrada','2025-09-23 16:11:15','Lote #12 de Orden de Fabricación #19 completado.','produccion',12,'lote'),(62,46,1,'entrada','2025-09-23 16:16:30','Lote #13 de Orden de Fabricación #16 completado.','produccion',13,'lote'),(63,11,1,'entrada','2025-09-26 22:10:13','Lote #14 de Orden de Fabricación #16 completado.','produccion',14,'lote'),(64,8,1,'entrada','2025-09-26 22:22:25','Lote #15 de Orden de Fabricación #26 completado.','produccion',15,'lote'),(65,45,1,'entrada','2025-09-26 22:44:59','Lote #16 de Orden de Fabricación #19 completado.','produccion',16,'lote'),(66,50,0,'entrada','2025-09-26 23:12:37','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(67,50,4,'entrada','2025-09-26 23:17:13','Lote #17 de Orden de Fabricación #27 completado.','produccion',17,'lote'),(68,51,0,'entrada','2025-09-26 23:23:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(69,52,0,'entrada','2025-09-27 19:18:03','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(70,24,1,'entrada','2025-09-27 19:39:38','Lote #18 de Orden de Fabricación #24 completado.','produccion',18,'lote'),(71,53,0,'entrada','2025-09-27 19:43:24','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(72,54,0,'entrada','2025-09-27 20:07:51','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(73,55,0,'entrada','2025-09-27 20:27:34','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(74,9,0,'entrada','2025-09-27 20:30:42','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(75,47,1,'entrada','2025-10-01 19:19:31','Lote #19 de Orden de Fabricación #16 completado.','produccion',19,'lote'),(76,23,1,'entrada','2025-10-01 19:20:06','Lote #20 de Orden de Fabricación #16 completado.','produccion',20,'lote'),(77,41,2,'entrada','2025-10-01 19:24:06','Lote #21 de Orden de Fabricación #14 completado.','produccion',21,'lote'),(78,41,6,'entrada','2025-10-01 19:40:25','Lote #22 de Orden de Fabricación #11 completado.','produccion',22,'lote'),(79,2,4,'entrada','2025-10-01 19:49:28','Lote #23 de Orden de Fabricación #2 completado.','produccion',23,'lote'),(80,22,1,'entrada','2025-10-01 20:09:09','Lote #24 de Orden de Fabricación #23 completado.','produccion',24,'lote'),(81,18,2,'entrada','2025-10-01 20:39:57','Lote #25 de Orden de Fabricación #7 completado.','produccion',25,'lote'),(82,43,8,'entrada','2025-10-01 21:21:16','Lote #26 de Orden de Fabricación #18 completado.','produccion',26,'lote'),(83,44,4,'entrada','2025-10-01 21:21:51','Lote #27 de Orden de Fabricación #18 completado.','produccion',27,'lote'),(84,19,4,'entrada','2025-10-01 21:52:34','Lote #28 de Orden de Fabricación #35 completado.','produccion',28,'lote'),(85,56,0,'entrada','2025-10-01 21:57:13','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(86,22,5,'entrada','2025-10-01 22:05:04','Lote #29 de Orden de Fabricación #36 completado.','produccion',29,'lote'),(87,56,4,'entrada','2025-10-01 22:05:46','Lote #30 de Orden de Fabricación #36 completado.','produccion',30,'lote'),(88,19,1,'entrada','2025-10-02 21:06:54','Lote #31 de Orden de Fabricación #38 completado.','produccion',31,'lote'),(89,19,3,'entrada','2025-10-02 21:07:17','Lote #32 de Orden de Fabricación #38 completado.','produccion',32,'lote'),(90,6,0,'entrada','2025-10-02 21:20:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(91,24,1,'entrada','2025-10-02 21:51:40','Lote #33 de Orden de Fabricación #42 completado.','produccion',33,'lote'),(92,15,1,'salida','2025-10-04 07:34:40','Salida por orden de venta #1','venta',1,'orden_venta'),(93,15,1,'entrada','2025-10-04 07:38:49','Reintegro por anulación de orden de venta #1','devolucion_cliente',1,'anulacion_orden_venta'),(94,15,1,'salida','2025-10-04 08:05:03','Salida por orden de venta #2','venta',2,'orden_venta'),(95,15,1,'entrada','2025-10-04 08:06:08','Reintegro por anulación de orden de venta #2','devolucion_cliente',2,'anulacion_orden_venta'),(96,51,6,'entrada','2025-10-04 20:48:08','Entrada por recepción de orden de compra #2','compra',2,'orden_compra'),(97,6,46,'entrada','2025-10-06 20:37:27','Lote #34 de Orden de Fabricación #40 completado.','produccion',34,'lote'),(98,41,6,'entrada','2025-10-06 20:50:59','Lote #35 de Orden de Fabricación #11 completado.','produccion',35,'lote'),(99,1,8,'entrada','2025-10-06 21:18:40','Lote #36 de Orden de Fabricación #43 completado.','produccion',36,'lote'),(100,6,4,'entrada','2025-10-06 21:23:09','Lote #37 de Orden de Fabricación #44 completado.','produccion',37,'lote'),(101,45,1,'entrada','2025-10-06 21:24:04','Lote #38 de Orden de Fabricación #19 completado.','produccion',38,'lote'),(102,57,0,'entrada','2025-10-06 21:35:36','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(103,8,2,'salida','2025-10-11 19:53:54','Salida por orden de venta #3','venta',3,'orden_venta'),(104,23,1,'salida','2025-10-11 20:02:30','Salida por orden de venta #4','venta',4,'orden_venta'),(105,59,1,'entrada','2025-10-11 20:47:52','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(106,59,1,'salida','2025-10-11 20:48:56','Salida por orden de venta #5','venta',5,'orden_venta'),(107,6,8,'salida','2025-10-11 20:53:59','Salida por orden de venta #6','venta',6,'orden_venta'),(108,60,0,'entrada','2025-10-15 14:15:32','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(109,61,0,'entrada','2025-10-15 14:16:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(110,2,1,'entrada','2025-10-15 14:23:25','Lote #39 de Orden de Fabricación #45 completado.','produccion',39,'lote'),(111,1,1,'entrada','2025-10-15 14:24:37','Lote #40 de Orden de Fabricación #45 completado.','produccion',40,'lote'),(112,3,1,'entrada','2025-10-15 14:36:40','Lote #41 de Orden de Fabricación #2 completado.','produccion',41,'lote'),(113,4,1,'entrada','2025-10-15 14:38:53','Lote #42 de Orden de Fabricación #2 completado.','produccion',42,'lote'),(114,38,30,'entrada','2025-10-15 14:48:02','Lote #43 de Orden de Fabricación #37 completado.','produccion',43,'lote'),(115,62,0,'entrada','2025-10-15 14:55:45','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(116,63,0,'entrada','2025-10-15 14:57:12','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(117,62,3,'entrada','2025-10-15 15:04:14','Lote #44 de Orden de Fabricación #49 completado.','produccion',44,'lote'),(118,63,4,'entrada','2025-10-15 15:07:10','Lote #45 de Orden de Fabricación #49 completado.','produccion',45,'lote'),(119,19,2,'entrada','2025-10-15 16:01:53','Lote #46 de Orden de Fabricación #51 completado.','produccion',46,'lote'),(120,6,6,'entrada','2025-10-15 16:18:32','Lote #47 de Orden de Fabricación #52 completado.','produccion',47,'lote'),(121,5,4,'entrada','2025-10-15 16:27:36','Lote #48 de Orden de Fabricación #50 completado.','produccion',48,'lote'),(122,64,0,'entrada','2025-10-15 16:28:56','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(123,65,0,'entrada','2025-10-15 16:33:36','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(124,2,1,'salida','2025-10-16 21:10:36','Salida por orden de venta #7','venta',7,'orden_venta'),(125,19,4,'salida','2025-10-16 21:12:24','Salida por orden de venta #8','venta',8,'orden_venta'),(126,22,1,'salida','2025-10-16 21:48:11','Salida por orden de venta #9','venta',9,'orden_venta'),(127,67,0,'entrada','2025-10-16 21:55:10','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(128,22,2,'salida','2025-10-16 22:02:43','Salida por orden de venta #10','venta',10,'orden_venta'),(129,57,1,'ajuste','2025-10-17 20:18:53','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 2','ajuste_manual',NULL,NULL),(130,57,1,'salida','2025-10-17 20:20:06','Salida por orden de venta #11','venta',11,'orden_venta'),(131,70,0,'entrada','2025-10-17 20:43:16','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(132,71,0,'entrada','2025-10-17 20:43:41','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(133,68,0,'entrada','2025-10-17 20:45:02','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(134,72,0,'entrada','2025-10-17 20:49:54','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(135,73,0,'entrada','2025-10-17 20:50:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(136,69,0,'entrada','2025-10-17 20:52:24','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(137,74,0,'entrada','2025-10-17 20:54:54','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(138,75,0,'entrada','2025-10-17 20:56:59','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(139,76,0,'entrada','2025-10-17 21:01:43','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(140,77,0,'entrada','2025-10-17 21:03:56','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(141,78,0,'entrada','2025-10-17 21:04:19','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(142,79,0,'entrada','2025-10-17 21:06:54','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(143,79,20,'entrada','2025-10-17 21:27:22','Entrada por recepción de orden de compra #11','compra',11,'orden_compra'),(144,76,2,'entrada','2025-10-17 21:27:32','Entrada por recepción de orden de compra #10','compra',10,'orden_compra'),(145,77,1,'entrada','2025-10-17 21:27:32','Entrada por recepción de orden de compra #10','compra',10,'orden_compra'),(146,78,1,'entrada','2025-10-17 21:27:32','Entrada por recepción de orden de compra #10','compra',10,'orden_compra'),(147,74,1,'entrada','2025-10-17 21:27:35','Entrada por recepción de orden de compra #9','compra',9,'orden_compra'),(148,75,1,'entrada','2025-10-17 21:27:35','Entrada por recepción de orden de compra #9','compra',9,'orden_compra'),(149,69,1,'entrada','2025-10-17 21:27:40','Entrada por recepción de orden de compra #8','compra',8,'orden_compra'),(150,72,1,'entrada','2025-10-17 21:27:43','Entrada por recepción de orden de compra #7','compra',7,'orden_compra'),(151,73,1,'entrada','2025-10-17 21:27:43','Entrada por recepción de orden de compra #7','compra',7,'orden_compra'),(152,68,1,'entrada','2025-10-17 21:27:46','Entrada por recepción de orden de compra #6','compra',6,'orden_compra'),(153,70,1,'entrada','2025-10-17 21:27:49','Entrada por recepción de orden de compra #5','compra',5,'orden_compra'),(154,71,1,'entrada','2025-10-17 21:27:49','Entrada por recepción de orden de compra #5','compra',5,'orden_compra'),(155,67,1,'entrada','2025-10-17 21:27:54','Entrada por recepción de orden de compra #4','compra',4,'orden_compra'),(156,9,12,'entrada','2025-10-20 19:46:10','Lote #49 de Orden de Fabricación #31 completado.','produccion',49,'lote'),(157,17,8,'entrada','2025-10-20 19:48:35','Lote #50 de Orden de Fabricación #50 completado.','produccion',50,'lote'),(158,64,1,'entrada','2025-10-20 19:51:06','Lote #51 de Orden de Fabricación #53 completado.','produccion',51,'lote'),(159,38,10,'entrada','2025-10-20 21:07:34','Lote #52 de Orden de Fabricación #37 completado.','produccion',52,'lote'),(160,1,2,'entrada','2025-10-20 21:23:18','Lote #53 de Orden de Fabricación #45 completado.','produccion',53,'lote'),(161,1,1,'entrada','2025-10-20 21:25:15','Lote #54 de Orden de Fabricación #48 completado.','produccion',54,'lote'),(162,80,0,'entrada','2025-10-21 14:44:33','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(163,80,1,'entrada','2025-10-21 14:44:52','Entrada por recepción de orden de compra #12','compra',12,'orden_compra'),(164,81,0,'entrada','2025-10-21 14:45:29','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(165,82,0,'entrada','2025-10-21 14:45:46','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(166,81,1,'entrada','2025-10-21 14:46:32','Entrada por recepción de orden de compra #13','compra',13,'orden_compra'),(167,82,1,'entrada','2025-10-21 14:46:32','Entrada por recepción de orden de compra #13','compra',13,'orden_compra'),(168,83,0,'entrada','2025-10-21 14:47:00','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(169,84,0,'entrada','2025-10-21 14:47:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(170,85,0,'entrada','2025-10-21 14:48:07','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(171,86,0,'entrada','2025-10-21 14:48:24','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(172,87,0,'entrada','2025-10-21 14:48:57','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(173,83,1,'entrada','2025-10-21 14:49:38','Entrada por recepción de orden de compra #14','compra',14,'orden_compra'),(174,84,1,'entrada','2025-10-21 14:49:38','Entrada por recepción de orden de compra #14','compra',14,'orden_compra'),(175,73,1,'entrada','2025-10-21 14:49:38','Entrada por recepción de orden de compra #14','compra',14,'orden_compra'),(176,85,1,'entrada','2025-10-21 14:49:39','Entrada por recepción de orden de compra #14','compra',14,'orden_compra'),(177,86,1,'entrada','2025-10-21 14:49:39','Entrada por recepción de orden de compra #14','compra',14,'orden_compra'),(178,87,1,'entrada','2025-10-21 14:49:39','Entrada por recepción de orden de compra #14','compra',14,'orden_compra'),(179,22,6,'salida','2025-10-21 14:52:07','Salida por orden de venta #12','venta',12,'orden_venta'),(180,90,0,'entrada','2025-10-21 14:56:38','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(181,90,1,'entrada','2025-10-21 14:56:59','Entrada por recepción de orden de compra #15','compra',15,'orden_compra'),(182,94,0,'entrada','2025-10-21 14:58:57','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(183,94,2,'entrada','2025-10-21 14:59:24','Entrada por recepción de orden de compra #16','compra',16,'orden_compra'),(184,93,0,'entrada','2025-10-21 14:59:53','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(185,93,1,'entrada','2025-10-21 15:00:23','Entrada por recepción de orden de compra #17','compra',17,'orden_compra'),(186,92,0,'entrada','2025-10-21 15:00:58','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(187,92,1,'entrada','2025-10-21 15:01:20','Entrada por recepción de orden de compra #18','compra',18,'orden_compra'),(188,95,1,'entrada','2025-10-23 15:33:23','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(189,95,1,'salida','2025-10-23 15:34:04','Salida por orden de venta #13','venta',13,'orden_venta'),(190,88,0,'entrada','2025-10-23 15:42:10','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(191,96,0,'entrada','2025-10-23 15:42:31','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(192,88,1,'entrada','2025-10-23 15:44:09','Entrada por recepción de orden de compra #19','compra',19,'orden_compra'),(193,96,4,'entrada','2025-10-23 16:06:40','Entrada por recepción de orden de compra #20','compra',20,'orden_compra'),(194,99,0,'entrada','2025-10-23 16:13:43','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(195,99,2,'entrada','2025-10-23 16:14:04','Entrada por recepción de orden de compra #21','compra',21,'orden_compra'),(196,98,0,'entrada','2025-10-23 16:15:00','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(197,98,1,'entrada','2025-10-23 16:15:21','Entrada por recepción de orden de compra #22','compra',22,'orden_compra'),(198,100,0,'entrada','2025-10-24 20:09:28','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(199,100,2,'entrada','2025-10-24 20:09:45','Entrada por recepción de orden de compra #23','compra',23,'orden_compra'),(200,101,0,'entrada','2025-10-24 20:11:23','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(201,101,1,'entrada','2025-10-24 20:11:45','Entrada por recepción de orden de compra #24','compra',24,'orden_compra'),(202,101,1,'entrada','2025-10-24 20:12:13','Entrada por recepción de orden de compra #25','compra',25,'orden_compra'),(203,102,0,'entrada','2025-10-24 20:19:46','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(204,102,10,'entrada','2025-10-24 20:20:57','Entrada por recepción de orden de compra #26','compra',26,'orden_compra'),(205,57,1,'entrada','2025-10-24 20:57:55','Lote #55 de Orden de Fabricación #46 completado.','produccion',55,'lote'),(206,81,1,'entrada','2025-10-25 16:09:56','Entrada por recepción de orden de compra #27','compra',27,'orden_compra'),(207,82,1,'entrada','2025-10-25 16:09:56','Entrada por recepción de orden de compra #27','compra',27,'orden_compra'),(208,103,0,'entrada','2025-10-25 16:12:51','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(209,103,2,'entrada','2025-10-25 16:13:03','Entrada por recepción de orden de compra #28','compra',28,'orden_compra'),(210,104,1,'entrada','2025-10-25 17:44:08','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(211,104,1,'salida','2025-10-25 17:44:51','Salida por orden de venta #14','venta',14,'orden_venta'),(212,108,0,'entrada','2025-10-28 20:36:42','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(213,108,100,'entrada','2025-10-28 20:42:20','Entrada por recepción de orden de compra #29','compra',29,'orden_compra'),(214,109,0,'entrada','2025-10-28 20:45:02','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(215,109,1,'entrada','2025-10-28 20:45:47','Entrada por recepción de orden de compra #30','compra',30,'orden_compra'),(216,81,1,'entrada','2025-10-28 20:48:55','Entrada por recepción de orden de compra #31','compra',31,'orden_compra'),(217,107,0,'entrada','2025-10-28 20:49:45','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(218,107,1,'entrada','2025-10-28 20:50:03','Entrada por recepción de orden de compra #32','compra',32,'orden_compra'),(219,105,0,'entrada','2025-10-28 20:51:07','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(220,106,0,'entrada','2025-10-28 20:51:32','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(221,82,1,'entrada','2025-10-28 20:52:00','Entrada por recepción de orden de compra #33','compra',33,'orden_compra'),(222,105,1,'entrada','2025-10-28 20:52:00','Entrada por recepción de orden de compra #33','compra',33,'orden_compra'),(223,106,2,'entrada','2025-10-28 20:52:00','Entrada por recepción de orden de compra #33','compra',33,'orden_compra'),(224,6,25,'entrada','2025-10-28 21:05:51','Lote #56 de Orden de Fabricación #58 completado.','produccion',56,'lote'),(225,6,1,'entrada','2025-10-28 21:10:54','Lote #57 de Orden de Fabricación #60 completado.','produccion',57,'lote'),(226,110,0,'entrada','2025-10-28 21:14:50','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(227,41,7,'entrada','2025-10-28 21:23:33','Lote #58 de Orden de Fabricación #61 completado.','produccion',58,'lote'),(228,111,0,'entrada','2025-10-29 17:35:29','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(229,111,1,'entrada','2025-10-29 17:37:53','Entrada por recepción de orden de compra #34','compra',34,'orden_compra'),(230,89,0,'entrada','2025-10-29 17:41:57','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(231,89,1,'entrada','2025-10-29 17:42:47','Entrada por recepción de orden de compra #36','compra',36,'orden_compra'),(232,89,1,'entrada','2025-10-29 17:42:55','Entrada por recepción de orden de compra #37','compra',37,'orden_compra'),(233,115,1,'entrada','2025-10-29 18:10:07','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(234,115,1,'salida','2025-10-29 18:14:50','Salida por orden de venta #15','venta',15,'orden_venta'),(235,10,2,'salida','2025-10-29 18:14:50','Salida por orden de venta #15','venta',15,'orden_venta'),(236,113,1,'entrada','2025-10-29 18:21:03','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(237,113,1,'salida','2025-10-29 18:30:53','Salida por orden de venta #16','venta',16,'orden_venta'),(238,3,1,'salida','2025-10-29 18:30:53','Salida por orden de venta #16','venta',16,'orden_venta'),(239,5,3,'salida','2025-10-29 18:30:53','Salida por orden de venta #16','venta',16,'orden_venta'),(240,42,2,'salida','2025-10-29 18:30:53','Salida por orden de venta #16','venta',16,'orden_venta'),(241,116,4,'entrada','2025-10-29 18:36:23','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(242,116,4,'salida','2025-10-29 18:37:19','Salida por orden de venta #17','venta',17,'orden_venta'),(243,117,0,'entrada','2025-10-30 15:31:55','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(244,117,1,'entrada','2025-10-30 15:32:08','Entrada por recepción de orden de compra #38','compra',38,'orden_compra'),(245,118,0,'entrada','2025-10-31 14:58:22','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(246,118,1,'entrada','2025-10-31 15:01:00','Lote #59 de Orden de Fabricación #65 completado.','produccion',59,'lote'),(247,119,0,'entrada','2025-10-31 15:10:02','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(248,119,1,'entrada','2025-10-31 15:10:23','Entrada por recepción de orden de compra #39','compra',39,'orden_compra'),(249,117,1,'entrada','2025-10-31 15:12:20','Entrada por recepción de orden de compra #40','compra',40,'orden_compra'),(250,117,1,'salida','2025-10-31 15:12:53','Reversión por cancelación de orden de compra completada #38','devolucion_proveedor',38,'cancelacion_orden_compra'),(251,6,8,'entrada','2025-10-31 15:18:24','Reintegro por anulación de orden de venta #6','devolucion_cliente',6,'anulacion_orden_venta'),(252,6,8,'entrada','2025-10-31 15:26:16','Reintegro por anulación de orden de venta #6','devolucion_cliente',6,'anulacion_orden_venta'),(253,120,0,'entrada','2025-11-01 20:39:48','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(254,121,0,'entrada','2025-11-01 20:40:39','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(255,122,0,'entrada','2025-11-01 20:41:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(256,123,0,'entrada','2025-11-01 20:42:51','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(257,128,0,'entrada','2025-11-04 14:06:27','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(258,31,15,'entrada','2025-11-04 14:44:00','Lote #60 de Orden de Fabricación #56 completado.','produccion',60,'lote'),(259,91,0,'entrada','2025-11-04 14:45:52','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(260,5,3,'entrada','2025-11-04 14:46:19','Lote #61 de Orden de Fabricación #50 completado.','produccion',61,'lote'),(261,63,4,'entrada','2025-11-04 14:51:39','Lote #62 de Orden de Fabricación #49 completado.','produccion',62,'lote'),(262,9,16,'entrada','2025-11-04 14:54:42','Lote #63 de Orden de Fabricación #31 completado.','produccion',63,'lote'),(263,91,0,'entrada','2025-11-04 14:57:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(264,8,10,'entrada','2025-11-04 15:16:10','Lote #64 de Orden de Fabricación #67 completado.','produccion',64,'lote'),(265,19,1,'entrada','2025-11-04 15:27:42','Lote #65 de Orden de Fabricación #68 completado.','produccion',65,'lote'),(266,126,0,'entrada','2025-11-05 15:15:24','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(267,126,30,'entrada','2025-11-05 15:18:36','Entrada por recepción de orden de compra #41','compra',41,'orden_compra'),(268,125,0,'entrada','2025-11-05 15:19:57','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(269,125,1,'entrada','2025-11-05 15:20:18','Entrada por recepción de orden de compra #42','compra',42,'orden_compra'),(270,127,0,'entrada','2025-11-05 15:22:47','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(271,120,2,'entrada','2025-11-05 15:23:30','Entrada por recepción de orden de compra #43','compra',43,'orden_compra'),(272,121,2,'entrada','2025-11-05 15:23:30','Entrada por recepción de orden de compra #43','compra',43,'orden_compra'),(273,122,3,'entrada','2025-11-05 15:23:30','Entrada por recepción de orden de compra #43','compra',43,'orden_compra'),(274,105,2,'entrada','2025-11-05 15:23:30','Entrada por recepción de orden de compra #43','compra',43,'orden_compra'),(275,127,1,'entrada','2025-11-05 15:23:31','Entrada por recepción de orden de compra #43','compra',43,'orden_compra'),(276,11,2,'entrada','2025-11-05 15:25:35','Entrada por recepción de orden de compra #44','compra',44,'orden_compra'),(277,130,0,'entrada','2025-11-05 15:27:03','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(278,130,3,'entrada','2025-11-05 15:27:28','Entrada por recepción de orden de compra #45','compra',45,'orden_compra'),(279,42,1,'salida','2025-11-05 15:28:50','Salida por orden de venta #18','venta',18,'orden_venta'),(280,62,1,'salida','2025-11-05 15:30:45','Salida por orden de venta #19','venta',19,'orden_venta'),(281,8,15,'entrada','2025-11-05 15:32:35','Entrada por recepción de orden de compra #48','compra',48,'orden_compra'),(282,100,1,'entrada','2025-11-05 15:33:54','Entrada por recepción de orden de compra #47','compra',47,'orden_compra'),(283,117,1,'entrada','2025-11-05 15:33:57','Entrada por recepción de orden de compra #46','compra',46,'orden_compra'),(284,63,2,'entrada','2025-11-05 15:34:02','Entrada por recepción de orden de compra #49','compra',49,'orden_compra'),(285,131,0,'entrada','2025-11-05 15:36:16','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(286,131,1,'entrada','2025-11-05 15:36:32','Entrada por recepción de orden de compra #50','compra',50,'orden_compra'),(287,46,7,'entrada','2025-11-05 16:54:55','Entrada por recepción de orden de compra #51','compra',51,'orden_compra'),(288,132,0,'entrada','2025-11-06 14:17:35','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(289,70,1,'entrada','2025-11-06 14:17:57','Entrada por recepción de orden de compra #52','compra',52,'orden_compra'),(290,132,1,'entrada','2025-11-06 14:17:57','Entrada por recepción de orden de compra #52','compra',52,'orden_compra'),(291,133,0,'entrada','2025-11-06 14:22:10','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(292,134,0,'entrada','2025-11-06 14:27:03','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(293,135,0,'entrada','2025-11-06 14:46:22','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(294,98,1,'entrada','2025-11-06 14:52:08','Entrada por recepción de orden de compra #53','compra',53,'orden_compra'),(295,135,1,'entrada','2025-11-06 14:52:13','Entrada por recepción de orden de compra #54','compra',54,'orden_compra'),(296,99,1,'entrada','2025-11-06 14:52:13','Entrada por recepción de orden de compra #54','compra',54,'orden_compra'),(297,135,1,'entrada','2025-11-06 14:52:19','Entrada por recepción de orden de compra #55','compra',55,'orden_compra'),(298,99,1,'entrada','2025-11-06 14:56:05','Entrada por recepción de orden de compra #56','compra',56,'orden_compra'),(299,136,0,'entrada','2025-11-06 14:56:40','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(300,136,100,'entrada','2025-11-06 14:58:04','Entrada por recepción de orden de compra #57','compra',57,'orden_compra'),(301,137,0,'entrada','2025-11-06 15:01:00','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(302,137,2,'entrada','2025-11-06 15:01:15','Entrada por recepción de orden de compra #58','compra',58,'orden_compra'),(303,6,24,'entrada','2025-11-11 14:15:33','Lote #66 de Orden de Fabricación #69 completado.','produccion',66,'lote'),(304,61,6,'entrada','2025-11-11 14:21:18','Lote #67 de Orden de Fabricación #59 completado.','produccion',67,'lote'),(305,38,10,'entrada','2025-11-11 14:28:33','Lote #68 de Orden de Fabricación #37 completado.','produccion',68,'lote'),(306,31,7,'entrada','2025-11-11 14:30:43','Lote #69 de Orden de Fabricación #37 completado.','produccion',69,'lote'),(307,33,3,'entrada','2025-11-12 14:15:34','Lote #70 de Orden de Fabricación #37 completado.','produccion',70,'lote'),(308,138,0,'entrada','2025-11-12 14:33:50','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(309,138,1,'entrada','2025-11-12 14:35:34','Lote #71 de Orden de Fabricación #76 completado.','produccion',71,'lote'),(310,23,1,'entrada','2025-11-12 14:37:51','Lote #72 de Orden de Fabricación #77 completado.','produccion',72,'lote'),(311,41,3,'entrada','2025-11-12 15:44:42','Lote #73 de Orden de Fabricación #75 completado.','produccion',73,'lote'),(312,139,0,'entrada','2025-11-13 14:24:25','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(313,120,1,'entrada','2025-11-13 14:44:05','Entrada por recepción de orden de compra #59','compra',59,'orden_compra'),(314,121,1,'entrada','2025-11-13 14:44:05','Entrada por recepción de orden de compra #59','compra',59,'orden_compra'),(315,140,0,'entrada','2025-11-13 14:46:56','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(316,140,1,'entrada','2025-11-13 14:47:15','Entrada por recepción de orden de compra #60','compra',60,'orden_compra'),(317,119,1,'entrada','2025-11-13 14:48:15','Entrada por recepción de orden de compra #61','compra',61,'orden_compra'),(318,141,0,'entrada','2025-11-13 14:51:02','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(319,141,1,'entrada','2025-11-13 14:51:23','Entrada por recepción de orden de compra #62','compra',62,'orden_compra'),(320,100,1,'entrada','2025-11-13 14:53:07','Entrada por recepción de orden de compra #63','compra',63,'orden_compra'),(321,137,1,'entrada','2025-11-13 14:53:07','Entrada por recepción de orden de compra #63','compra',63,'orden_compra'),(322,142,0,'entrada','2025-11-13 14:56:42','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(323,142,1,'entrada','2025-11-13 14:57:21','Entrada por recepción de orden de compra #64','compra',64,'orden_compra'),(324,117,1,'entrada','2025-11-13 14:57:21','Entrada por recepción de orden de compra #64','compra',64,'orden_compra'),(325,143,0,'entrada','2025-11-13 15:02:25','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(326,144,0,'entrada','2025-11-13 15:03:06','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(327,145,0,'entrada','2025-11-13 15:04:59','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(328,146,0,'entrada','2025-11-13 15:05:32','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(329,147,0,'entrada','2025-11-13 15:12:30','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(330,143,4,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(331,144,6,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(332,100,1,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(333,137,1,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(334,145,2,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(335,146,1,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(336,147,1,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(337,80,1,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(338,85,1,'entrada','2025-11-13 15:25:56','Entrada por recepción de orden de compra #65','compra',65,'orden_compra'),(339,148,0,'entrada','2025-11-13 15:44:02','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(340,148,1,'entrada','2025-11-13 15:44:15','Entrada por recepción de orden de compra #66','compra',66,'orden_compra'),(341,100,2,'entrada','2025-11-13 15:46:05','Entrada por recepción de orden de compra #67','compra',67,'orden_compra'),(342,127,1,'entrada','2025-11-13 15:47:11','Entrada por recepción de orden de compra #68','compra',68,'orden_compra'),(343,149,0,'entrada','2025-11-13 15:48:25','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(344,149,1,'entrada','2025-11-13 15:49:50','Entrada por recepción de orden de compra #69','compra',69,'orden_compra'),(345,138,1,'entrada','2025-11-13 15:49:53','Entrada por recepción de orden de compra #70','compra',70,'orden_compra'),(346,99,1,'entrada','2025-11-13 15:51:03','Entrada por recepción de orden de compra #71','compra',71,'orden_compra'),(347,150,0,'entrada','2025-11-13 15:54:01','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(348,150,1,'entrada','2025-11-13 15:56:05','Entrada por recepción de orden de compra #72','compra',72,'orden_compra'),(349,11,1,'entrada','2025-11-13 16:09:03','Entrada por recepción de orden de compra #73','compra',73,'orden_compra'),(350,23,4,'entrada','2025-11-13 16:09:07','Entrada por recepción de orden de compra #74','compra',74,'orden_compra'),(351,151,0,'entrada','2025-11-13 16:10:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(352,151,1,'entrada','2025-11-13 16:10:39','Entrada por recepción de orden de compra #75','compra',75,'orden_compra'),(353,15,1,'salida','2025-11-13 16:24:51','Salida por orden de venta #20','venta',20,'orden_venta'),(354,23,1,'salida','2025-11-13 16:24:51','Salida por orden de venta #20','venta',20,'orden_venta'),(355,5,10,'salida','2025-11-13 16:26:05','Salida por orden de venta #21','venta',21,'orden_venta'),(356,9,11,'salida','2025-11-13 16:28:10','Salida por orden de venta #22','venta',22,'orden_venta'),(357,8,3,'salida','2025-11-13 16:31:35','Salida por orden de venta #23','venta',23,'orden_venta'),(358,41,6,'salida','2025-11-15 18:42:05','Salida por orden de venta #24','venta',24,'orden_venta'),(359,6,9,'salida','2025-11-15 18:42:06','Salida por orden de venta #24','venta',24,'orden_venta'),(360,138,1,'salida','2025-11-15 18:42:06','Salida por orden de venta #24','venta',24,'orden_venta'),(361,153,0,'entrada','2025-11-15 18:55:23','Ingreso inicial de artículo al inventario','inicial',NULL,NULL),(362,153,1,'ajuste','2025-11-15 18:56:41','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 1. Stock mínimo: 1','ajuste_manual',NULL,NULL),(363,153,1,'salida','2025-11-15 18:58:01','Salida por orden de venta #25','venta',25,'orden_venta'),(364,9,3,'ajuste','2025-11-15 19:12:15','Ajuste manual de stock. Stock anterior: 17, Nuevo stock: 20. Stock mínimo: 2','ajuste_manual',NULL,NULL),(365,13,2,'ajuste','2025-11-15 19:14:48','Ajuste manual de stock. Stock anterior: 0, Nuevo stock: 2. Stock mínimo: 2','ajuste_manual',NULL,NULL),(366,5,20,'salida','2025-11-15 19:16:17','Salida por orden de venta #26','venta',26,'orden_venta'),(367,13,2,'salida','2025-11-15 19:16:18','Salida por orden de venta #26','venta',26,'orden_venta'),(368,63,6,'salida','2025-11-15 19:16:18','Salida por orden de venta #26','venta',26,'orden_venta'),(369,155,0,'entrada','2025-11-15 19:27:44','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(370,156,0,'entrada','2025-11-15 19:29:46','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(371,157,0,'entrada','2025-11-15 19:41:08','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(372,158,0,'entrada','2025-11-15 19:41:58','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(373,155,1,'entrada','2025-11-15 19:44:12','Entrada por recepción de orden de compra #76','compra',76,'orden_compra'),(374,156,1,'entrada','2025-11-15 19:44:12','Entrada por recepción de orden de compra #76','compra',76,'orden_compra'),(375,157,1,'entrada','2025-11-15 19:44:21','Entrada por recepción de orden de compra #77','compra',77,'orden_compra'),(376,120,1,'entrada','2025-11-15 19:44:21','Entrada por recepción de orden de compra #77','compra',77,'orden_compra'),(377,158,100,'entrada','2025-11-15 19:44:21','Entrada por recepción de orden de compra #77','compra',77,'orden_compra'),(378,127,1,'entrada','2025-11-15 19:44:22','Entrada por recepción de orden de compra #77','compra',77,'orden_compra'),(379,160,0,'entrada','2025-11-15 19:46:53','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(380,159,0,'entrada','2025-11-15 19:47:17','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(381,161,0,'entrada','2025-11-15 19:50:11','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(382,160,3,'entrada','2025-11-15 19:51:26','Entrada por recepción de orden de compra #78','compra',78,'orden_compra'),(383,159,1,'entrada','2025-11-15 19:51:26','Entrada por recepción de orden de compra #78','compra',78,'orden_compra'),(384,87,1,'entrada','2025-11-15 19:51:26','Entrada por recepción de orden de compra #78','compra',78,'orden_compra'),(385,85,1,'entrada','2025-11-15 19:51:26','Entrada por recepción de orden de compra #78','compra',78,'orden_compra'),(386,161,1,'entrada','2025-11-15 19:51:26','Entrada por recepción de orden de compra #78','compra',78,'orden_compra'),(387,162,0,'entrada','2025-11-15 19:55:19','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(388,162,5,'entrada','2025-11-15 19:56:09','Entrada por recepción de orden de compra #79','compra',79,'orden_compra'),(389,108,200,'entrada','2025-11-15 19:59:03','Entrada por recepción de orden de compra #80','compra',80,'orden_compra'),(390,158,200,'entrada','2025-11-15 19:59:03','Entrada por recepción de orden de compra #80','compra',80,'orden_compra'),(391,163,0,'entrada','2025-11-15 20:05:25','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(392,164,0,'entrada','2025-11-15 20:06:23','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(393,165,0,'entrada','2025-11-15 20:06:31','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(394,8,6,'salida','2025-11-15 20:21:59','Salida por orden de venta #27','venta',27,'orden_venta'),(395,166,0,'entrada','2025-11-15 20:24:41','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(396,163,4,'entrada','2025-11-15 20:25:02','Entrada por recepción de orden de compra #81','compra',81,'orden_compra'),(397,164,1,'entrada','2025-11-15 20:25:02','Entrada por recepción de orden de compra #81','compra',81,'orden_compra'),(398,165,1,'entrada','2025-11-15 20:25:02','Entrada por recepción de orden de compra #81','compra',81,'orden_compra'),(399,92,1,'entrada','2025-11-15 20:25:21','Entrada por recepción de orden de compra #82','compra',82,'orden_compra'),(400,166,1,'entrada','2025-11-15 20:25:25','Entrada por recepción de orden de compra #83','compra',83,'orden_compra'),(401,167,0,'entrada','2025-11-15 20:28:26','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(402,168,0,'entrada','2025-11-15 20:36:05','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(403,168,1,'entrada','2025-11-15 20:36:36','Entrada por recepción de orden de compra #84','compra',84,'orden_compra'),(404,99,1,'entrada','2025-11-15 20:37:32','Entrada por recepción de orden de compra #85','compra',85,'orden_compra'),(405,46,1,'salida','2025-11-15 20:38:11','Salida por orden de venta #28','venta',28,'orden_venta'),(406,169,0,'entrada','2025-11-15 20:43:58','Inicialización de artículo en inventario a petición del usuario.','inicial',NULL,'inicializacion_manual'),(407,169,1,'entrada','2025-11-15 20:45:18','Entrada por recepción de orden de compra #86','compra',86,'orden_compra');
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_tesoreria`
--

LOCK TABLES `movimientos_tesoreria` WRITE;
/*!40000 ALTER TABLE `movimientos_tesoreria` DISABLE KEYS */;
INSERT INTO `movimientos_tesoreria` VALUES (1,2,'orden_venta','2025-10-04 08:05:03',6000.00,1,'',''),(2,2,'orden_compra','2025-10-04 20:47:53',-360000.00,1,NULL,NULL),(3,2,'abono_credito','2025-10-11 19:54:25',200000.00,2,NULL,NULL),(4,5,'orden_venta','2025-10-11 20:48:57',700000.00,2,'',''),(5,6,'orden_venta','2025-10-11 20:53:59',1040000.00,1,'',''),(6,3,'orden_compra','2025-10-16 21:05:51',-360000.00,1,NULL,NULL),(7,7,'orden_venta','2025-10-16 21:10:36',1100000.00,1,'',''),(8,8,'orden_venta','2025-10-16 21:12:24',1100000.00,1,'',''),(9,9,'orden_venta','2025-10-16 21:48:11',75000.00,1,'',''),(10,4,'orden_compra','2025-10-16 21:56:18',-27000.00,1,NULL,NULL),(11,10,'orden_venta','2025-10-16 22:02:43',140000.00,2,'',''),(12,4,'abono_credito','2025-10-17 20:23:31',3000000.00,2,NULL,NULL),(13,5,'orden_compra','2025-10-17 20:44:27',-167000.00,1,NULL,NULL),(14,6,'orden_compra','2025-10-17 20:45:27',-550000.00,2,NULL,NULL),(15,7,'orden_compra','2025-10-17 20:51:35',-726000.00,1,NULL,NULL),(16,8,'orden_compra','2025-10-17 20:52:50',-800000.00,2,NULL,NULL),(17,9,'orden_compra','2025-10-17 20:57:18',-22800.00,1,NULL,NULL),(18,10,'orden_compra','2025-10-17 21:04:37',-38000.00,1,NULL,NULL),(19,11,'orden_compra','2025-10-17 21:07:20',-7000.00,1,NULL,NULL),(20,12,'orden_compra','2025-10-21 14:44:44',-17000.00,1,NULL,NULL),(21,13,'orden_compra','2025-10-21 14:46:05',-133000.00,1,NULL,NULL),(22,14,'orden_compra','2025-10-21 14:49:21',-122000.00,1,NULL,NULL),(23,12,'orden_venta','2025-10-21 14:52:07',420000.00,1,'',''),(24,15,'orden_compra','2025-10-21 14:56:52',-180000.00,1,NULL,NULL),(25,16,'orden_compra','2025-10-21 14:59:15',-16000.00,1,NULL,NULL),(26,17,'orden_compra','2025-10-21 15:00:17',-150000.00,1,NULL,NULL),(27,18,'orden_compra','2025-10-21 15:01:15',-4000.00,1,NULL,NULL),(28,13,'orden_venta','2025-10-23 15:34:04',600000.00,1,'',''),(29,19,'orden_compra','2025-10-23 15:43:40',-40000.00,1,NULL,NULL),(30,20,'orden_compra','2025-10-23 16:05:39',-157000.00,1,NULL,NULL),(31,21,'orden_compra','2025-10-23 16:13:55',-8000.00,1,NULL,NULL),(32,22,'orden_compra','2025-10-23 16:15:12',-54800.00,1,NULL,NULL),(33,23,'orden_compra','2025-10-24 20:09:39',-10000.00,1,NULL,NULL),(34,24,'orden_compra','2025-10-24 20:11:35',-100000.00,1,NULL,NULL),(35,25,'orden_compra','2025-10-24 20:12:07',-100000.00,1,NULL,NULL),(36,26,'orden_compra','2025-10-24 20:20:06',-330000.00,1,NULL,NULL),(37,27,'orden_compra','2025-10-25 16:09:50',-140000.00,1,NULL,NULL),(38,28,'orden_compra','2025-10-25 16:12:56',-4000.00,1,NULL,NULL),(39,14,'orden_venta','2025-10-25 17:44:51',800000.00,1,'',''),(40,29,'orden_compra','2025-10-28 20:37:56',-18000.00,1,NULL,NULL),(41,30,'orden_compra','2025-10-28 20:45:30',-8000.00,1,NULL,NULL),(42,31,'orden_compra','2025-10-28 20:48:43',-350000.00,1,NULL,NULL),(43,32,'orden_compra','2025-10-28 20:49:59',-16500.00,1,NULL,NULL),(44,33,'orden_compra','2025-10-28 20:51:50',-66600.00,1,NULL,NULL),(45,34,'orden_compra','2025-10-29 17:37:44',-95000.00,1,NULL,NULL),(46,35,'orden_compra','2025-10-29 17:40:19',-18000.00,1,NULL,NULL),(47,36,'orden_compra','2025-10-29 17:42:08',-3000.00,1,NULL,NULL),(48,37,'orden_compra','2025-10-29 17:42:43',-3000.00,1,NULL,NULL),(49,5,'abono_credito','2025-10-29 18:16:04',1050000.00,2,NULL,NULL),(50,5,'abono_credito','2025-10-29 18:16:28',1000000.00,2,NULL,NULL),(51,6,'abono_credito','2025-10-29 18:31:20',1000000.00,2,NULL,NULL),(52,7,'abono_credito','2025-10-29 18:38:11',500000.00,2,'30/092025',NULL),(53,7,'abono_credito','2025-10-29 18:38:35',500000.00,2,NULL,NULL),(54,7,'abono_credito','2025-10-29 18:38:56',500000.00,2,NULL,NULL),(55,7,'abono_credito','2025-10-29 18:39:09',500000.00,2,NULL,NULL),(56,7,'abono_credito','2025-10-29 18:39:20',500000.00,2,NULL,NULL),(57,7,'abono_credito','2025-10-29 18:39:36',500000.00,2,NULL,NULL),(58,38,'orden_compra','2025-10-30 15:32:02',-15000.00,1,NULL,NULL),(59,39,'orden_compra','2025-10-31 15:10:15',-39000.00,1,NULL,NULL),(60,40,'orden_compra','2025-10-31 15:12:11',-15000.00,1,NULL,NULL),(61,41,'orden_compra','2025-11-05 00:00:00',-8190.00,1,NULL,NULL),(62,42,'orden_compra','2025-11-05 00:00:00',-14500.00,1,NULL,NULL),(63,43,'orden_compra','2025-11-05 00:00:00',-301000.00,1,NULL,NULL),(64,44,'orden_compra','2025-11-05 00:00:00',-160000.00,1,NULL,NULL),(65,45,'orden_compra','2025-11-05 00:00:00',-54000.00,1,NULL,NULL),(66,46,'orden_compra','2025-11-05 00:00:00',-15000.00,1,NULL,NULL),(67,18,'orden_venta','2025-11-05 00:00:00',200000.00,1,'',''),(68,47,'orden_compra','2025-11-05 00:00:00',-6000.00,1,NULL,NULL),(69,19,'orden_venta','2025-11-05 00:00:00',100000.00,1,'',''),(70,48,'orden_compra','2025-11-05 00:00:00',-1425000.00,1,NULL,NULL),(71,49,'orden_compra','2025-11-05 00:00:00',-120000.00,1,NULL,NULL),(72,50,'orden_compra','2025-11-05 00:00:00',-180000.00,1,NULL,NULL),(73,51,'orden_compra','2025-11-05 00:00:00',-315000.00,1,NULL,NULL),(74,52,'orden_compra','2025-11-06 00:00:00',-153000.00,1,NULL,NULL),(75,53,'orden_compra','2025-11-06 00:00:00',-125000.00,1,NULL,NULL),(76,54,'orden_compra','2025-11-06 00:00:00',-58000.00,1,NULL,NULL),(77,55,'orden_compra','2025-11-06 00:00:00',-53000.00,1,NULL,NULL),(78,56,'orden_compra','2025-11-06 00:00:00',-4000.00,1,NULL,NULL),(79,57,'orden_compra','2025-11-06 00:00:00',-130000.00,1,NULL,NULL),(80,58,'orden_compra','2025-11-06 00:00:00',-10000.00,1,NULL,NULL),(81,59,'orden_compra','2025-11-13 00:00:00',-124000.00,1,NULL,NULL),(82,60,'orden_compra','2025-11-13 00:00:00',-17000.00,1,NULL,NULL),(83,61,'orden_compra','2025-11-13 00:00:00',-14900.00,1,NULL,NULL),(84,62,'orden_compra','2025-11-13 00:00:00',-36000.00,1,NULL,NULL),(85,63,'orden_compra','2025-11-13 00:00:00',-11000.00,1,NULL,NULL),(86,64,'orden_compra','2025-11-13 00:00:00',-20000.00,1,NULL,NULL),(87,65,'orden_compra','2025-11-13 00:00:00',-122400.00,1,NULL,NULL),(88,66,'orden_compra','2025-11-13 00:00:00',-20000.00,1,NULL,NULL),(89,67,'orden_compra','2025-11-13 00:00:00',-12000.00,1,NULL,NULL),(90,68,'orden_compra','2025-11-13 00:00:00',-20000.00,1,NULL,NULL),(91,69,'orden_compra','2025-11-13 00:00:00',-10000.00,1,NULL,NULL),(92,70,'orden_compra','2025-11-13 00:00:00',-60000.00,1,NULL,NULL),(93,71,'orden_compra','2025-11-13 00:00:00',-15000.00,1,NULL,NULL),(94,72,'orden_compra','2025-11-13 00:00:00',-3000.00,1,NULL,NULL),(95,73,'orden_compra','2025-11-13 00:00:00',-40000.00,1,NULL,NULL),(96,74,'orden_compra','2025-11-13 00:00:00',-240000.00,1,NULL,NULL),(97,75,'orden_compra','2025-11-13 00:00:00',-19000.00,1,NULL,NULL),(98,10,'abono_credito','2025-11-13 16:29:19',500000.00,2,NULL,NULL),(99,10,'abono_credito','2025-11-13 16:29:39',765000.00,2,NULL,NULL),(100,23,'orden_venta','2025-11-13 00:00:00',480000.00,2,'',''),(101,2,'abono_credito','2025-11-15 18:36:04',100000.00,2,NULL,NULL),(102,26,'orden_venta','2025-11-15 00:00:00',3060000.00,2,'',''),(103,76,'orden_compra','2025-11-15 00:00:00',-34000.00,1,NULL,NULL),(104,77,'orden_compra','2025-11-15 00:00:00',-168000.00,1,NULL,NULL),(105,78,'orden_compra','2025-11-15 00:00:00',-143000.00,1,NULL,NULL),(106,79,'orden_compra','2025-11-15 00:00:00',-80000.00,1,NULL,NULL),(107,80,'orden_compra','2025-11-15 00:00:00',-76000.00,1,NULL,NULL),(108,81,'orden_compra','2025-11-15 00:00:00',-140504.00,1,NULL,NULL),(109,82,'orden_compra','2025-11-15 00:00:00',-10000.00,1,NULL,NULL),(110,27,'orden_venta','2025-11-15 00:00:00',690000.00,2,'',''),(111,83,'orden_compra','2025-11-15 00:00:00',-50000.00,1,NULL,NULL),(112,84,'orden_compra','2025-11-15 00:00:00',-15000.00,1,NULL,NULL),(113,85,'orden_compra','2025-11-15 00:00:00',-8000.00,1,NULL,NULL),(114,28,'orden_venta','2025-11-15 00:00:00',100000.00,1,'',''),(115,86,'orden_compra','2025-11-15 00:00:00',-100000.00,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_compra`
--

LOCK TABLES `ordenes_compra` WRITE;
/*!40000 ALTER TABLE `ordenes_compra` DISABLE KEYS */;
INSERT INTO `ordenes_compra` VALUES (1,1,'2025-09-10 23:07:08',NULL,NULL,'completada'),(2,1,'2025-10-04 20:47:53',NULL,NULL,'completada'),(3,1,'2025-10-16 21:05:50',NULL,NULL,'cancelada'),(4,2,'2025-10-16 21:56:17',NULL,NULL,'completada'),(5,2,'2025-10-17 20:44:27',NULL,NULL,'completada'),(6,3,'2025-10-17 20:45:27',NULL,NULL,'completada'),(7,4,'2025-10-17 20:51:35',NULL,NULL,'completada'),(8,4,'2025-10-17 20:52:49',NULL,NULL,'completada'),(9,2,'2025-10-17 20:57:17',NULL,NULL,'completada'),(10,2,'2025-10-17 21:04:36',NULL,NULL,'completada'),(11,2,'2025-10-17 21:07:20',NULL,NULL,'completada'),(12,2,'2025-10-21 14:44:43',NULL,NULL,'completada'),(13,2,'2025-10-21 14:46:05',NULL,NULL,'completada'),(14,4,'2025-10-21 14:49:21',NULL,NULL,'completada'),(15,1,'2025-10-21 14:56:52',NULL,NULL,'completada'),(16,1,'2025-10-21 14:59:15',NULL,NULL,'completada'),(17,1,'2025-10-21 15:00:16',NULL,NULL,'completada'),(18,4,'2025-10-21 15:01:14',NULL,NULL,'completada'),(19,6,'2025-10-23 00:00:00','',NULL,'completada'),(20,6,'2025-10-23 00:00:00','',NULL,'completada'),(21,7,'2025-10-23 16:13:55',NULL,NULL,'completada'),(22,7,'2025-10-23 16:15:12',NULL,NULL,'completada'),(23,8,'2025-10-24 20:09:38',NULL,NULL,'completada'),(24,1,'2025-10-24 20:11:34',NULL,NULL,'completada'),(25,1,'2025-10-24 20:12:07',NULL,NULL,'completada'),(26,9,'2025-10-24 20:20:06',NULL,NULL,'completada'),(27,2,'2025-10-25 16:09:49',NULL,NULL,'completada'),(28,8,'2025-10-25 16:12:56',NULL,NULL,'completada'),(29,2,'2025-10-28 20:37:55',NULL,NULL,'completada'),(30,2,'2025-10-28 20:45:30',NULL,NULL,'completada'),(31,2,'2025-10-28 20:48:42',NULL,NULL,'completada'),(32,2,'2025-10-28 20:49:58',NULL,NULL,'completada'),(33,2,'2025-10-28 20:51:49',NULL,NULL,'completada'),(34,1,'2025-10-29 17:37:44',NULL,NULL,'completada'),(35,2,'2025-10-29 17:40:18',NULL,NULL,'cancelada'),(36,1,'2025-10-29 17:42:07',NULL,NULL,'completada'),(37,1,'2025-10-29 17:42:42',NULL,NULL,'completada'),(38,1,'2025-10-30 15:32:02',NULL,NULL,'cancelada'),(39,2,'2025-10-31 15:10:14',NULL,NULL,'completada'),(40,10,'2025-10-31 15:12:10',NULL,NULL,'completada'),(41,2,'2025-11-05 15:15:52',NULL,NULL,'completada'),(42,2,'2025-11-05 15:20:11',NULL,NULL,'completada'),(43,2,'2025-11-05 15:23:21',NULL,NULL,'completada'),(44,11,'2025-11-05 15:25:29',NULL,NULL,'completada'),(45,11,'2025-11-05 15:27:22',NULL,NULL,'completada'),(46,10,'2025-11-05 15:28:01',NULL,NULL,'completada'),(47,8,'2025-11-05 15:29:47',NULL,NULL,'completada'),(48,1,'2025-11-05 15:32:19',NULL,NULL,'completada'),(49,11,'2025-11-05 15:33:47',NULL,NULL,'completada'),(50,1,'2025-11-05 15:36:26',NULL,NULL,'completada'),(51,12,'2025-11-05 16:54:46',NULL,NULL,'completada'),(52,2,'2025-11-06 14:17:49',NULL,NULL,'completada'),(53,7,'2025-11-06 14:45:34',NULL,NULL,'completada'),(54,7,'2025-11-06 14:46:49',NULL,NULL,'completada'),(55,7,'2025-11-06 14:47:29',NULL,NULL,'completada'),(56,7,'2025-11-06 14:48:06',NULL,NULL,'completada'),(57,1,'2025-11-06 14:57:49',NULL,NULL,'completada'),(58,8,'2025-11-06 15:01:08',NULL,NULL,'completada'),(59,2,'2025-11-13 14:43:57',NULL,NULL,'completada'),(60,2,'2025-11-13 14:47:09',NULL,NULL,'completada'),(61,2,'2025-11-13 14:48:09',NULL,NULL,'completada'),(62,2,'2025-11-13 14:51:16',NULL,NULL,'completada'),(63,2,'2025-11-13 14:52:47',NULL,NULL,'completada'),(64,10,'2025-11-13 14:57:15',NULL,NULL,'completada'),(65,4,'2025-11-13 15:24:19',NULL,NULL,'completada'),(66,13,'2025-11-13 15:44:09',NULL,NULL,'completada'),(67,7,'2025-11-13 15:45:00',NULL,NULL,'completada'),(68,4,'2025-11-13 15:47:05',NULL,NULL,'completada'),(69,4,'2025-11-13 15:48:35',NULL,NULL,'completada'),(70,12,'2025-11-13 15:49:45',NULL,NULL,'completada'),(71,7,'2025-11-13 15:50:57',NULL,NULL,'completada'),(72,14,'2025-11-13 15:54:07',NULL,NULL,'completada'),(73,11,'2025-11-13 16:08:14',NULL,NULL,'completada'),(74,11,'2025-11-13 16:08:53',NULL,NULL,'completada'),(75,1,'2025-11-13 16:10:33',NULL,NULL,'completada'),(76,2,'2025-11-15 19:35:31',NULL,NULL,'completada'),(77,2,'2025-11-15 19:44:03',NULL,NULL,'completada'),(78,4,'2025-11-15 19:51:16',NULL,NULL,'completada'),(79,3,'2025-11-15 19:56:02',NULL,NULL,'completada'),(80,2,'2025-11-15 19:58:56',NULL,NULL,'completada'),(81,15,'2025-11-15 20:06:54',NULL,NULL,'completada'),(82,8,'2025-11-15 20:20:36',NULL,NULL,'completada'),(83,4,'2025-11-15 20:24:54',NULL,NULL,'completada'),(84,17,'2025-11-15 20:36:31',NULL,NULL,'completada'),(85,7,'2025-11-15 20:37:18',NULL,NULL,'completada'),(86,1,'2025-11-15 20:45:10',NULL,NULL,'completada');
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
  `estado` enum('pendiente','en proceso','completada','entregada','cancelada') DEFAULT 'pendiente',
  `fecha_entrega` datetime DEFAULT NULL,
  `id_pedido` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id_orden_fabricacion`),
  UNIQUE KEY `id_orden_fabricacion` (`id_orden_fabricacion`),
  KEY `fk_ofab_orden_venta` (`id_orden_venta`),
  KEY `fk_ofab_pedido` (`id_pedido`),
  CONSTRAINT `fk_ofab_orden_venta` FOREIGN KEY (`id_orden_venta`) REFERENCES `ordenes_venta` (`id_orden_venta`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ofab_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_fabricacion`
--

LOCK TABLES `ordenes_fabricacion` WRITE;
/*!40000 ALTER TABLE `ordenes_fabricacion` DISABLE KEYS */;
INSERT INTO `ordenes_fabricacion` VALUES (1,NULL,'2025-09-01','2025-10-01','cancelada',NULL,1),(2,NULL,'2025-08-27','2025-09-27','completada',NULL,2),(3,NULL,'2025-09-10','2025-10-10','cancelada',NULL,3),(4,NULL,'2025-09-01','2025-09-30','cancelada',NULL,1),(5,NULL,'2025-09-01','2025-09-13','cancelada',NULL,1),(6,NULL,'2025-09-01','2025-09-20','cancelada',NULL,4),(7,NULL,'2025-09-01','2025-10-01','en proceso',NULL,5),(8,NULL,'2025-09-08','2025-10-08','cancelada',NULL,6),(9,NULL,'2025-09-08','2025-10-08','cancelada',NULL,7),(10,NULL,'2025-09-10','2025-09-10','completada',NULL,8),(11,NULL,'2025-09-06','2025-09-06','completada',NULL,11),(12,NULL,'2025-09-06','2025-09-30','cancelada',NULL,12),(13,NULL,'2025-09-07','2025-09-30','cancelada',NULL,13),(14,NULL,'2025-09-13','2025-09-30','completada',NULL,12),(15,NULL,'2025-09-13','2025-09-30','cancelada',NULL,14),(16,NULL,'2025-09-08','2025-10-08','completada',NULL,15),(17,NULL,'2025-09-13','2025-09-30','cancelada',NULL,7),(18,NULL,'2025-09-13','2025-10-13','en proceso',NULL,13),(19,NULL,'2025-09-06','2025-09-06','completada',NULL,16),(20,NULL,'2025-09-20','2025-09-30','cancelada',NULL,18),(21,NULL,'2025-09-20','2025-09-30','cancelada',NULL,19),(22,NULL,'2025-09-20','2025-09-30','completada',NULL,20),(23,NULL,'2025-09-20','2025-10-06','en proceso',NULL,21),(24,NULL,'2025-09-20','2025-09-15','completada',NULL,7),(25,NULL,'2025-08-30','2025-09-30','cancelada',NULL,22),(26,NULL,'2025-08-30','2025-09-30','completada',NULL,22),(27,NULL,'2025-07-12','2025-09-13','completada',NULL,23),(28,NULL,'2025-09-20','2025-10-20','en proceso',NULL,24),(29,NULL,'2025-09-20','2025-10-20','en proceso',NULL,25),(30,NULL,'2025-09-20','2025-10-20','cancelada',NULL,26),(31,NULL,'2025-09-20','2025-10-20','en proceso',NULL,28),(32,NULL,'2025-09-10','2025-10-10','cancelada',NULL,29),(33,NULL,'2025-09-20','2025-10-20','cancelada',NULL,30),(34,NULL,'2025-09-20','2025-10-20','en proceso',NULL,31),(35,NULL,'2025-09-27','2025-10-17','cancelada',NULL,32),(36,NULL,'2025-09-27','2025-10-09','completada',NULL,34),(37,NULL,'2025-09-27','2025-10-27','en proceso',NULL,9),(38,NULL,'2025-09-27','2025-10-10','completada',NULL,32),(39,NULL,'2025-09-27','2025-10-27','cancelada',NULL,35),(40,NULL,'2025-09-27','2025-10-27','completada',NULL,35),(41,NULL,'2025-09-27','2025-10-27','en proceso',NULL,36),(42,NULL,'2025-09-27','2025-10-02','completada',NULL,37),(43,NULL,'2025-10-04','2025-10-07','completada',NULL,39),(44,NULL,'2025-10-04','2025-10-07','completada',NULL,40),(45,NULL,'2025-10-04','2025-10-04','completada',NULL,38),(46,NULL,'2025-10-04','2025-11-04','completada',NULL,41),(47,NULL,'2025-10-11','2025-11-11','cancelada',NULL,42),(48,NULL,'2025-10-11','2025-11-11','en proceso',NULL,43),(49,NULL,'2025-10-11','2025-11-11','completada',NULL,44),(50,NULL,'2025-10-11','2025-11-11','completada',NULL,45),(51,NULL,'2025-10-11','2025-10-16','completada',NULL,46),(52,NULL,'2025-10-11','2025-10-17','completada',NULL,47),(53,NULL,'2025-10-11','2025-10-18','completada',NULL,48),(54,NULL,'2025-10-11','2025-11-11','en proceso',NULL,49),(55,NULL,'2025-10-11','2025-10-11','cancelada',NULL,50),(56,NULL,'2025-10-11','2025-10-11','en proceso',NULL,51),(57,NULL,'2025-10-11','2025-10-11','en proceso',NULL,52),(58,NULL,'2025-10-11','2025-10-11','completada',NULL,53),(59,NULL,'2025-10-18','2025-11-18','completada',NULL,54),(60,NULL,'2025-10-25','2025-10-25','completada',NULL,55),(61,NULL,'2025-10-25','2025-10-30','en proceso',NULL,56),(62,NULL,'2025-10-25','2025-11-25','cancelada',NULL,57),(63,NULL,'2025-10-25','2025-11-25','en proceso',NULL,57),(64,NULL,'2025-10-25','2025-10-25','en proceso',NULL,58),(65,NULL,'2025-10-25','2025-11-10','completada',NULL,59),(66,NULL,'2025-11-01','2025-11-01','en proceso',NULL,60),(67,NULL,'2025-11-01','2025-12-01','en proceso',NULL,61),(68,NULL,'2025-11-01','2025-11-20','completada',NULL,62),(69,NULL,'2025-11-01','2025-12-01','completada',NULL,63),(70,NULL,'2025-11-01','2025-11-20','en proceso',NULL,64),(71,NULL,'2025-11-01','2025-11-01','en proceso',NULL,65),(72,NULL,'2025-11-08','2025-12-08','cancelada',NULL,66),(73,NULL,'2025-11-08','2025-12-08','cancelada',NULL,66),(74,NULL,'2025-11-08','2025-12-08','en proceso',NULL,67),(75,NULL,'2025-11-08','2025-12-08','en proceso',NULL,68),(76,NULL,'2025-11-01','2025-11-30','completada',NULL,69),(77,NULL,'2025-11-01','2025-11-30','completada',NULL,70);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_venta`
--

LOCK TABLES `ordenes_venta` WRITE;
/*!40000 ALTER TABLE `ordenes_venta` DISABLE KEYS */;
INSERT INTO `ordenes_venta` VALUES (2,'2025-10-04 00:00:00',1,'anulada',6000,6000,NULL),(3,'2025-10-11 00:00:00',6,'completada',300000,300000,NULL),(4,'2025-10-11 00:00:00',1,'completada',1000,1000,NULL),(5,'2025-10-04 00:00:00',10,'completada',700000,700000,NULL),(6,'2025-10-08 00:00:00',11,'completada',1040000,2010000,NULL),(7,'2025-10-11 00:00:00',12,'completada',1100000,1100000,NULL),(8,'2025-10-11 00:00:00',13,'completada',1100000,1100000,NULL),(9,'2025-10-11 00:00:00',1,'completada',75000,75000,NULL),(10,'2025-10-08 00:00:00',1,'completada',140000,140000,NULL),(11,'2025-10-03 00:00:00',9,'completada',7000000,7000000,NULL),(12,'2025-10-17 00:00:00',1,'completada',420000,420000,NULL),(13,'2025-10-21 00:00:00',1,'completada',600000,600000,NULL),(14,'2025-10-25 00:00:00',1,'completada',800000,800000,NULL),(15,'2025-10-28 00:00:00',17,'completada',2900000,2900000,NULL),(16,'2025-10-02 00:00:00',16,'completada',1970000,1970000,NULL),(17,'2025-09-30 00:00:00',15,'completada',3000000,3000000,NULL),(18,'2025-11-05 00:00:00',1,'completada',200000,200000,NULL),(19,'2025-11-05 00:00:00',1,'completada',100000,100000,NULL),(20,'2025-11-13 00:00:00',20,'completada',570000,570000,NULL),(21,'2025-11-13 00:00:00',19,'completada',800000,800000,NULL),(22,'2025-11-13 00:00:00',3,'completada',1265000,1265000,NULL),(23,'2025-11-13 00:00:00',21,'completada',480000,480000,NULL),(24,'2025-11-15 00:00:00',18,'completada',2520000,2520000,NULL),(25,'2025-11-15 00:00:00',22,'completada',1500000,1500000,NULL),(26,'2025-11-15 00:00:00',24,'completada',3060000,3060000,NULL),(27,'2025-11-15 00:00:00',1,'completada',690000,690000,NULL),(28,'2025-11-15 00:00:00',1,'completada',100000,100000,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_trabajadores`
--

LOCK TABLES `pagos_trabajadores` WRITE;
/*!40000 ALTER TABLE `pagos_trabajadores` DISABLE KEYS */;
INSERT INTO `pagos_trabajadores` VALUES (1,1,'2025-09-20 15:20:57',360000,''),(2,5,'2025-09-20 15:36:10',90002,''),(3,3,'2025-09-20 15:42:31',960000,''),(4,2,'2025-09-20 15:45:42',300000,''),(5,2,'2025-09-20 15:46:20',150000,''),(6,5,'2025-09-20 15:52:45',140000,'ESTO ES DE TRABAJO VIEJO. SE FINALIZAN PARA QUE TERMINE EL PROCESO'),(7,1,'2025-09-27 19:05:06',156000,'pago el 20 de septiembre'),(8,1,'2025-09-27 19:05:38',96000,'pagado 20 de septiembre'),(9,11,'2025-09-27 19:22:29',800000,'Se paga un anticipo de la orden completa, que esta pendiente por terminar. solo se ha adelantado'),(10,11,'2025-09-27 19:26:03',220000,''),(11,7,'2025-09-27 19:28:55',104000,''),(12,7,'2025-09-27 19:30:15',32000,''),(13,7,'2025-09-27 19:32:03',42000,''),(14,7,'2025-09-27 19:32:42',15000,''),(15,7,'2025-09-27 19:35:31',24000,''),(16,7,'2025-09-27 19:37:03',2,''),(17,7,'2025-09-27 19:41:04',3500,''),(18,2,'2025-09-27 19:42:59',1,''),(19,2,'2025-09-27 19:43:19',3,''),(20,5,'2025-09-27 19:45:06',1,''),(21,3,'2025-09-27 19:46:50',390000,''),(22,3,'2025-09-27 19:55:30',0,''),(23,3,'2025-09-27 19:55:45',90000,''),(24,5,'2025-09-27 19:58:12',80000,''),(25,5,'2025-09-27 19:59:03',230000,''),(26,5,'2025-09-27 20:01:50',20000,''),(27,4,'2025-09-27 20:04:49',300000,''),(28,4,'2025-09-27 20:05:21',120000,''),(29,4,'2025-09-27 20:05:42',260000,''),(30,4,'2025-09-27 20:06:50',80000,''),(31,4,'2025-09-27 20:07:28',30000,''),(32,4,'2025-09-27 20:08:13',15000,''),(33,4,'2025-09-27 20:08:32',2,''),(34,4,'2025-09-27 20:08:55',70000,''),(35,4,'2025-09-27 20:10:02',10000,''),(36,4,'2025-09-27 20:10:13',10000,''),(37,5,'2025-09-27 20:12:42',280000,'ESTE VALOR ES ABONADO A DEUDA PENDIENTE'),(38,10,'2025-09-27 20:13:09',100000,''),(39,1,'2025-10-04 19:48:45',50000,'pagos semana del 20 de septiembre'),(40,1,'2025-10-04 19:49:33',400009,'pago semana del 27 de septiembre'),(41,3,'2025-10-04 19:51:19',100000,''),(42,11,'2025-10-04 20:01:34',450000,''),(43,11,'2025-10-04 20:03:26',1250000,'Esto ya habia sido pagado en 2 semanas anteriores, primero 800 y luego 450'),(44,13,'2025-10-04 20:21:27',871000,''),(45,13,'2025-10-04 20:21:44',216000,''),(46,13,'2025-10-04 20:22:31',10000,''),(47,7,'2025-10-04 20:36:15',239500,'falta un taburete, previamente fabricado en 3500. Total semana del 27 septiembre 243'),(48,7,'2025-10-04 20:37:23',116000,''),(49,10,'2025-10-04 20:38:04',280000,''),(50,1,'2025-10-11 19:23:30',520000,''),(51,11,'2025-10-11 19:28:27',900000,''),(52,13,'2025-10-11 19:31:41',900008,''),(53,7,'2025-10-11 19:32:20',250000,''),(54,3,'2025-10-11 19:39:34',249908,''),(55,4,'2025-10-11 20:09:02',5,''),(56,2,'2025-10-11 20:09:20',5,''),(57,5,'2025-10-11 20:09:33',10,''),(58,6,'2025-10-11 20:09:45',1,''),(59,1,'2025-10-17 22:08:01',215000,''),(60,1,'2025-10-17 22:08:17',204006,''),(61,13,'2025-10-17 22:12:57',1001002,''),(62,8,'2025-10-17 22:13:19',104000,''),(63,7,'2025-10-17 22:29:24',327000,''),(64,1,'2025-10-25 17:30:56',500000,''),(65,11,'2025-10-25 17:34:04',700000,''),(66,11,'2025-10-25 17:36:44',799000,'Pagado el dia 11 de octubre de 2025'),(67,11,'2025-10-25 17:37:23',1,''),(68,11,'2025-10-25 17:55:21',180000,''),(69,13,'2025-10-25 17:56:33',668000,''),(70,7,'2025-10-25 17:57:17',124000,''),(71,3,'2025-10-25 17:58:28',430000,''),(72,3,'2025-10-25 17:58:48',120000,''),(73,10,'2025-10-25 17:59:09',300000,''),(74,1,'2025-11-01 00:00:00',0,''),(75,1,'2025-11-01 00:00:00',0,''),(76,1,'2025-11-01 00:00:00',0,''),(77,1,'2025-11-01 00:00:00',0,''),(78,1,'2025-11-01 00:00:00',20000,''),(79,11,'2025-11-01 00:00:00',1330001,''),(80,3,'2025-11-01 00:00:00',130000,''),(81,16,'2025-11-01 00:00:00',350000,''),(82,7,'2025-11-01 00:00:00',130000,''),(83,13,'2025-11-01 00:00:00',976000,''),(84,1,'2025-11-07 00:00:00',480000,''),(85,11,'2025-11-07 00:00:00',100000,''),(86,13,'2025-11-07 00:00:00',330000,''),(87,13,'2025-11-07 00:00:00',702000,''),(88,7,'2025-11-07 00:00:00',224500,''),(89,8,'2025-11-07 00:00:00',390000,''),(90,5,'2025-11-07 00:00:00',280031,''),(91,2,'2025-11-07 00:00:00',20005,''),(92,9,'2025-11-07 00:00:00',12000,''),(93,6,'2025-11-07 00:00:00',154000,''),(94,4,'2025-11-07 00:00:00',230005,''),(95,1,'2025-11-17 00:00:00',204000,''),(96,3,'2025-11-17 00:00:00',350000,''),(97,13,'2025-11-17 00:00:00',760000,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2025-09-10 22:01:28','cancelado',NULL),(2,2,'2025-09-10 22:21:27','listo para entrega',NULL),(3,3,'2025-09-10 23:23:49','cancelado',NULL),(4,1,'2025-09-12 15:13:06','cancelado',NULL),(5,1,'2025-09-12 15:21:02','pendiente',NULL),(6,5,'2025-09-12 15:46:33','cancelado',NULL),(7,5,'2025-09-13 19:46:56','listo para entrega',NULL),(8,6,'2025-09-13 20:01:27','completado',NULL),(9,7,'2025-09-13 20:39:11','pendiente',NULL),(10,1,'2025-09-13 20:45:38','cancelado',NULL),(11,1,'2025-09-13 21:20:33','listo para entrega',NULL),(12,1,'2025-09-15 14:33:14','listo para entrega',NULL),(13,1,'2025-09-15 14:42:05','pendiente',NULL),(14,1,'2025-09-17 19:57:40','pendiente',NULL),(15,5,'2025-09-17 20:54:48','listo para entrega',NULL),(16,1,'2025-09-23 14:30:28','listo para entrega',NULL),(17,1,'2025-09-23 14:59:06','cancelado',NULL),(18,1,'2025-09-23 15:00:38','cancelado',NULL),(19,1,'2025-09-23 15:14:44','cancelado',NULL),(20,1,'2025-09-23 15:17:32','listo para entrega',NULL),(21,1,'2025-09-23 15:23:19','pendiente',NULL),(22,1,'2025-09-26 22:11:25','listo para entrega',NULL),(23,1,'2025-09-26 23:12:44','listo para entrega',NULL),(24,1,'2025-09-27 19:18:26','pendiente',NULL),(25,1,'2025-09-27 19:43:34','pendiente',NULL),(26,1,'2025-09-27 20:07:59','pendiente',NULL),(27,2,'2025-09-27 20:27:50','pendiente',''),(28,1,'2025-09-27 20:31:27','pendiente',NULL),(29,3,'2025-10-01 19:55:39','cancelado',NULL),(30,1,'2025-10-01 21:07:13','cancelado',NULL),(31,1,'2025-10-01 21:12:19','pendiente',NULL),(32,1,'2025-10-01 21:50:07','listo para entrega',NULL),(33,1,'2025-10-01 21:55:52','cancelado',NULL),(34,1,'2025-10-01 21:58:00','listo para entrega',NULL),(35,1,'2025-10-02 21:20:46','listo para entrega',NULL),(36,1,'2025-10-02 21:46:18','pendiente',NULL),(37,1,'2025-10-02 21:49:52','listo para entrega',NULL),(38,1,'2025-10-06 21:01:44','listo para entrega',NULL),(39,1,'2025-10-06 21:13:04','listo para entrega',NULL),(40,1,'2025-10-06 21:20:43','listo para entrega',NULL),(41,9,'2025-10-06 21:36:06','listo para entrega',NULL),(42,1,'2025-10-15 14:09:33','en fabricacion',NULL),(43,1,'2025-10-15 14:16:16','en fabricacion',NULL),(44,1,'2025-10-15 15:01:05','listo para entrega',NULL),(45,4,'2025-10-15 15:32:05','listo para entrega',NULL),(46,1,'2025-10-15 15:59:30','listo para entrega',NULL),(47,1,'2025-10-15 16:10:42','listo para entrega',NULL),(48,1,'2025-10-15 16:29:05','listo para entrega',NULL),(49,1,'2025-10-15 16:33:42','en fabricacion',NULL),(50,7,'2025-10-20 20:52:56','en fabricacion',NULL),(51,7,'2025-10-20 20:59:00','en fabricacion',NULL),(52,1,'2025-10-20 21:02:08','en fabricacion',NULL),(53,1,'2025-10-20 21:27:59','listo para entrega',NULL),(54,1,'2025-10-24 20:30:31','listo para entrega',NULL),(55,1,'2025-10-28 21:06:39','listo para entrega',NULL),(56,1,'2025-10-28 21:18:24','en fabricacion',NULL),(57,1,'2025-10-28 21:18:58','en fabricacion',NULL),(58,1,'2025-10-29 15:23:10','en fabricacion',NULL),(59,1,'2025-10-31 14:58:40','listo para entrega',NULL),(60,1,'2025-11-04 14:06:52','en fabricacion',NULL),(61,1,'2025-11-04 15:09:39','en fabricacion',NULL),(62,1,'2025-11-04 15:25:49','listo para entrega',NULL),(63,1,'2025-11-05 14:54:19','listo para entrega',NULL),(64,1,'2025-11-05 14:58:35','en fabricacion',NULL),(65,1,'2025-11-06 14:28:26','en fabricacion',NULL),(66,1,'2025-11-11 14:05:33','cancelado',NULL),(67,1,'2025-11-11 14:11:08','en fabricacion',NULL),(68,1,'2025-11-11 14:35:27','en fabricacion',NULL),(69,1,'2025-11-12 14:33:55','listo para entrega',NULL),(70,1,'2025-11-12 14:36:26','listo para entrega',NULL),(71,18,'2025-11-13 14:26:02','cancelado',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'ABAKO',122334565,'300367234','','',''),(2,'FERRETERIA EL PAISA',323907844,'3117560369','','SAMPUES','SUCRE'),(3,'CHADIDTEX SINCELEJO',901874472,'3015021616','','SINCELEJO','SUCRE'),(4,'ANTANA',111111111,'12222222','','SAMPUES','SUCRE'),(6,'VENTA DE MADERA',333333333,'23356267','','',''),(7,'TALLER SAMPUES',222222222,'33333333333','','SAMPUES',''),(8,'VENTA DE TRIPLEX',222222222,'33333333333','','',''),(9,'CUERO SAMPUES',222222222,'6666666','','',''),(10,'GASOLINERA SAMPUES',1111111,'222222222222','','',''),(11,'PERCHEROS SAMPUES',2222222,'22222222','','',''),(12,'CAMILO MARIMBA',22222,'222222','','',''),(13,'VIDRIERIA SAMPUES',222222222222,'222222222','','',''),(14,'MIGUEL MOTO',2222,'22222222','','',''),(15,'FERRTERIA  LAMINAS Y METALES S.A.S',12222,'3137729884','','',''),(16,'CASA VENTA DE BOLSA PAPEL',2222,'222222222','','',''),(17,'JUAN ELECTRICO',2222222,'222222222','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'JULIO CANOLE',NULL,'CARPINTERO',1),(2,'FRAIMER',NULL,'CARPINTERO',1),(3,'FRANK',NULL,'CARPINTERO',1),(4,'LUIS TARRA',NULL,'PULIDOR',1),(5,'DEIBIS',NULL,'CARPINTERO',1),(6,'JUAN DAVID',NULL,'PULIDOR',1),(7,'DAIRO RIOS',NULL,'PINTOR',1),(8,'EDOIN',NULL,'PULIDOR',1),(9,'JESUS ARRIETA',NULL,'PULIDOR',1),(10,'JUAN CAMILO',NULL,'TAPIZADOR',1),(11,'FRAINER Y DEIBID',NULL,'CARPINTERO',1),(12,'LUIS Y JUAN DAVID',NULL,NULL,1),(13,'LUIS Y JUAN DAVID',NULL,'PULIDOR',1),(14,'EDOIN',NULL,NULL,1),(15,'FRANK Y JULIO',NULL,NULL,0),(16,'FRANK Y JULIO',NULL,'CARPINTERO',1),(17,'LORENA',NULL,'INFORMES',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (5,'admin','$2b$10$FLfFXnGX/JaaH8bgamaWH.D7zrcD.X7.5QDsbC6ec0OcfQxQi5ci6',1,NULL),(6,'DerleyL','$2b$10$amb/OARR9epbGCd0mizWgOgLLkuL2n23EY630HnNL/55LwxV3g70.',1,NULL),(7,'ABAKO','$2b$10$gOX.AEY0U9i1RerYFi.5Fu3uogeDD8W8DrAtn22Gc64oKonbqaivK',1,1),(8,'LORE','$2b$10$zd5EQofQJvbFUn8qpRm6Y.Chi3ikzyqteD6A0v1lUaUKOkpBt7dyW',2,17),(9,'OP','$2b$10$OCZHGL1zAPT4NrMzdhPtmuSm5HU0iKpJ/jLWaaKmNRVwNodQHoVXq',2,NULL);
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
  `id_orden_venta` bigint unsigned DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_credito`
--

LOCK TABLES `ventas_credito` WRITE;
/*!40000 ALTER TABLE `ventas_credito` DISABLE KEYS */;
INSERT INTO `ventas_credito` VALUES (2,3,6,300000,0,'2025-10-11','pagado',NULL),(3,4,1,1000,1000,'2025-10-11','pendiente',NULL),(4,11,9,7000000,4000000,'2025-10-17','parcial',NULL),(5,15,17,2900000,850000,'2025-10-29','pagado',NULL),(6,16,16,1970000,970000,'2025-10-29','pagado',NULL),(7,17,15,3000000,0,'2025-10-29','pagado',NULL),(8,20,20,570000,570000,'2025-11-13','pendiente',NULL),(9,21,19,800000,800000,'2025-11-13','pendiente',NULL),(10,22,3,1265000,0,'2025-11-13','pagado',NULL),(11,24,18,2520000,2520000,'2025-11-15','pendiente',NULL),(12,25,22,1500000,1500000,'2025-11-15','pendiente',NULL);
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

-- Dump completed on 2025-11-17 12:59:01
