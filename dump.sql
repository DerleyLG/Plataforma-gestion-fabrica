-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_abako
-- ------------------------------------------------------
-- Server version	8.0.41

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anticipos_trabajadores`
--

LOCK TABLES `anticipos_trabajadores` WRITE;
/*!40000 ALTER TABLE `anticipos_trabajadores` DISABLE KEYS */;
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
  PRIMARY KEY (`id_articulo`),
  UNIQUE KEY `id_articulo` (`id_articulo`),
  KEY `fk_articulos_categoria` (`id_categoria`),
  CONSTRAINT `fk_articulos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avance_etapas_produccion`
--

LOCK TABLES `avance_etapas_produccion` WRITE;
/*!40000 ALTER TABLE `avance_etapas_produccion` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_compra`
--

LOCK TABLES `detalle_orden_compra` WRITE;
/*!40000 ALTER TABLE `detalle_orden_compra` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden_fabricacion`
--

LOCK TABLES `detalle_orden_fabricacion` WRITE;
/*!40000 ALTER TABLE `detalle_orden_fabricacion` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pago_trabajador`
--

LOCK TABLES `detalle_pago_trabajador` WRITE;
/*!40000 ALTER TABLE `detalle_pago_trabajador` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
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
  PRIMARY KEY (`id_etapa`),
  UNIQUE KEY `id_etapa` (`id_etapa`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapas_produccion`
--

LOCK TABLES `etapas_produccion` WRITE;
/*!40000 ALTER TABLE `etapas_produccion` DISABLE KEYS */;
INSERT INTO `etapas_produccion` VALUES (3,'Pintura',NULL,3),(11,'Carpinteria',NULL,1),(12,'Pulido',NULL,2),(13,'Tapizado',NULL,4);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes_fabricados`
--

LOCK TABLES `lotes_fabricados` WRITE;
/*!40000 ALTER TABLE `lotes_fabricados` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotes_fabricados` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_compra`
--

LOCK TABLES `ordenes_compra` WRITE;
/*!40000 ALTER TABLE `ordenes_compra` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_fabricacion`
--

LOCK TABLES `ordenes_fabricacion` WRITE;
/*!40000 ALTER TABLE `ordenes_fabricacion` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_trabajadores`
--

LOCK TABLES `pagos_trabajadores` WRITE;
/*!40000 ALTER TABLE `pagos_trabajadores` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
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

-- Dump completed on 2025-08-03 15:45:33
