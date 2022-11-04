CREATE DATABASE  IF NOT EXISTS `papeleravipdatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `papeleravipdatabase`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: papeleravipdatabase
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategoria` int DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Utiles Escolares'),(2,'Insumos Computacion'),(3,'Libreria Tecnica');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `nombre` varchar(48) NOT NULL,
  `direccion` varchar(64) NOT NULL,
  `password` varchar(16) NOT NULL,
  `mail` varchar(64) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'David Canovas','Bulnes 3060','David1234','davidcanovas@gmail.com'),(4,'Martin perez disalvo','Humboldt 1141','CoscuArmy','coscu@gmail.com'),(5,'Uriel Rabih','Yatay 240','RABIH','urielcarlosrabih@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL,
  `nombre` varchar(56) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `foto` varchar(256) NOT NULL,
  `marca` varchar(32) NOT NULL,
  `precio` double NOT NULL,
  `stock` int NOT NULL,
  `destacado` tinyint(1) DEFAULT NULL,
  `idSubCategoria` int DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  `foto2` varchar(256) DEFAULT NULL,
  `foto3` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `FK_productos_categorias` (`idSubCategoria`),
  CONSTRAINT `FK_productos_categorias` FOREIGN KEY (`idSubCategoria`) REFERENCES `subcategorias` (`idSubcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (3,'Voligoma','Adhesivo Sintético Voligoma Original 30ml Por Unidad','https://inkgenio.com.ar/2291-large_default/voligoma-x-30-ml.jpg','POXIPOL',107,47,1,18,1,'https://librerialacentral.com.ar/wp-content/uploads/2021/10/Adhesivo-voligoma-x50ml.jpg.png','https://d3ugyf2ht6aenh.cloudfront.net/stores/001/636/171/products/2951-daa51798502d162aa216213638227244-640-0.jpg'),(4,'Lapicera Filgo Fast Track',' Bolígrafo retráctil con tinta suave a base de aceite','https://http2.mlstatic.com/D_NQ_NP_667597-MLA31041922374_062019-O.webp','Filgo',60,50,1,4,1,'https://www.copiart.com.ar/img/33105/7795513053263.jpg','http://d3ugyf2ht6aenh.cloudfront.net/stores/001/175/039/products/boligrafo_filgo_fastrack_x3611-9076e676ace502fabd15959460750533-640-01-d0d4478bf56b022a8c16002780465133-640-0.jpg'),(6,'Cuaderno Exito Tapa dura 48 hojas','Cuaderno Exito Tapa Dura 48 Hojas Lunares O Colores Araña','https://www.lacoopeencasa.coop/media/lcec/publico/articulos/2/4/c/24ce68028f7b5471fd2f1d8cdfd51bd1','Éxito',500,13,1,1,1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0i9yxg07BGrtvi5KM9FttGtNwx6LAYGa7kA&usqp=CAU','http://d3ugyf2ht6aenh.cloudfront.net/stores/934/828/products/lunares1-4b497bfd2e5062fe1016401994182195-640-0.jpg'),(15,'Globo terraqueo  Gloter Elbrus','Globo Terráqueo Elbrus\r\n-Globo terráqueo con base de madera\r\n-Altura: 42 cm\r\n-Diametro: 30 cm\r\n-Peso: 1,225 gr\r\n-Base: Madera\r\n-Ideal decoración, hogar, oficinas\r\nMarca: Gloter\r\nOrigen: Argentina','https://www.gloter.net/images/globos/Elbrus_opt.jpeg',' Gloter Elbrus',16000,1,0,NULL,NULL,'http://d3ugyf2ht6aenh.cloudfront.net/stores/102/583/products/gloter-globo-terraqueo-elbrus-30-cm-cartografia-politica-tienda-pepino-21-b9dab993cb0ce681f415132759120324-640-0.jpg','https://d3ugyf2ht6aenh.cloudfront.net/stores/001/144/668/products/107a-10-cm-base-plastica-antiguo1-603d6ddc4fec90a4bf15953794524401-480-0.jpg'),(16,'Cuaderno Rivadavia Abc Espiralado 100h Rayado','Cuaderno ABC con Espiral Tapa Cartón x 100 hojas Rayadas\r\nFormato 21 x 27cm\r\nHojas rayadas, sin perforar ni micropuntillar.\r\nDiseños de tapas no elegibles.','https://clicknow.com.ar/wp-content/uploads/2020/11/Riv_Cuaderno_ABC_21x27_Espiral_02.jpg','Rivadavia',1069,10,0,1,1,'http://d2r9epyceweg5n.cloudfront.net/stores/001/280/843/products/thumb_15862084041-c2b3aaf6186d6c15c416040806822110-640-0.jpg','http://librerianuevaera.com.ar/wp-content/uploads/2020/05/7792216050407_02.jpg'),(22,'Lapicera Roller Simball Genio Plus Tinta borrable Azul','Lapicera Roller Simball Genio Plus Tinta borrable Azul','http://librerianuevaera.com.ar/wp-content/uploads/2022/04/genio-plus.jpg','Simball',250,15,0,4,1,'https://libreriasanpablo.com.ar/uploads/1578063255_Qk9MSUdSQUZPIFNJTUJBTEwgUk9MTEVSIEdFTklPIDAuNyBBWlVMCQ==.jpg','http://www.congresoinsumos.com.ar/productos/0206230101.jpg'),(23,'Lapicera BIC trazo medio AZUL','Lapicera BIC trazo medio AZUL','https://www.bikabik.com.ar/wp-content/uploads/2020/07/boligrafo-bic-azul-trazo-grueso-1mm-opaco-x50-unid-D_NQ_NP_897138-MLA31037651428_062019-F-min.jpg','BIC',80,13,0,4,1,'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/275/036/products/e021d1-e12d50eb7ab6ec537215950828675337-640-0.jpg','http://d3ugyf2ht6aenh.cloudfront.net/stores/001/175/039/products/diseno-sin-titulo-991-dcaf34bb3c007dd05116268877498704-640-0.png'),(24,'Block Anotador Congreso A5 40 Hojas Rayado','Block anotador Congreso\r\nRayado - 40 Hojas - Papel Obra 70 g- 160x210 mm\r\n','https://somosconfirma.com/wp-content/uploads/2021/02/AE1110118.jpg','Congreso',230,14,0,6,1,'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/144/668/products/59691-89c72406b6d8af96a815915613050158-480-0.png','https://www.libreriaascorti.com.ar/185-large_default/block-anotador-congreso-rayado-16x21cm.jpg'),(25,'LAPIZ GRAFITO STAEDTLER TRADITION HB','LAPIZ GRAFITO STAEDTLER TRADITION HB','https://unipack.com.ar/wp-content/uploads/2018/01/LAPTRADHB.jpg','STAEDTLER',249,12,0,2,3,'https://cdn.shopify.com/s/files/1/1086/1234/products/N7794_L_large.jpg?v=1579739771','http://d3ugyf2ht6aenh.cloudfront.net/stores/001/421/947/products/staedtle2r1-dc035176f539770d8a16153966142954-640-0.jpg'),(34,'Regla Galleti 30 Cm 100% Acrílico Grabada Transparente','Ideal para trabajos de dibujo técnico, arquitectura o trabajos artísticos\r\nestas reglas se destacan por ser 100% de acrílico y los números están grabados sobre el mismo permitiendo así, su conservación en el tiempo.\r\n• Marca: Galetti\r\n• Largo: 30 cm\r\n•','https://alotar.vteximg.com.br/arquivos/ids/167135-500-500/REGPZCRI30C_1.jpg?v=637405444769270000','Galleti',330,10,0,3,1,'https://alotar.vteximg.com.br/arquivos/ids/167132-500-500/REGPZ40CM_1.jpg?v=637405444759700000','http://www.romanohnos.com/images/000000001088017506990242030.jpg'),(38,'Marcadores Touch Star Linea Clasica X 36 Unidades','Son permanentes, cada uno tiene punta amplia y punta fina, lo que le permite dibujar trazos gruesos y delgados, diseñados para durar y no desvanecerse fácilmente.','https://http2.mlstatic.com/D_NQ_NP_710546-MLA48366220616_112021-O.webp','Touch Star',3745,14,0,5,1,'https://http2.mlstatic.com/D_NQ_NP_602637-MLA49179636907_022022-O.webp','https://panafargo.com/wp-content/uploads/2022/04/Marcadores-Tocuh-Varios-Colores-Muestra-Regados.jpg'),(40,'Set Resaltadores Trabi Pasteles + Fluo / 18 Unidades\r\n','Set Resaltadores Trabi Pasteles + Fluo / 18 Unidades\r\n','https://http2.mlstatic.com/D_NQ_NP_998939-MLA46760026026_072021-O.webp','Trabi',1799,18,0,9,1,'http://d3ugyf2ht6aenh.cloudfront.net/stores/001/404/379/products/thumb_1596034003-511-d494fc16c818bf7dd816072496846652-640-0.jpg','http://d2r9epyceweg5n.cloudfront.net/stores/001/720/617/products/t21-55a732bd7cbb90856816598304995356-640-0.png'),(41,'Tijera Escolar Maped Cosmic Kids 13 Cm','Tijera Escolar Maped Cosmic Kids','https://unipack.com.ar/wp-content/uploads/2017/11/464310_pr_blue.jpg','Maped',319,20,0,10,1,'https://http2.mlstatic.com/D_Q_NP_2X_695996-MLA45521623799_042021-P.jpg','https://www.distribuidoraorfei.com.ar/fotito/500/500/xy/grafica/productos/065000/067120-01-01.jpg'),(50,'Cartulina Escolar Luma 45x63cm Varios Colores ','Cartulina Escolar Luma 45x63cm Varios Colores Calidad X 10un','https://http2.mlstatic.com/D_NQ_NP_754069-MLA47327725304_092021-O.webp','Luma',500,16,0,7,1,'http://d3ugyf2ht6aenh.cloudfront.net/stores/001/421/947/products/cartulina-fuertes1-8322f9b2b3655a415e16141053485590-640-0.jpg','https://cdn.shopify.com/s/files/1/0045/4131/7231/products/COLORE185_600x600.jpg?v=1661285154'),(55,'Mouse Logitech G203 Lightsync 8.000 Dpi Negro ','Mouse Logitech G203 Lightsync 8.000 Dpi Negro 6b Cable 2.1mt','https://http2.mlstatic.com/D_NQ_NP_941244-MLA44331789634_122020-O.webp','Logitech',2949,5,0,13,2,'https://nissei.com/media/catalog/product/cache/16a9529cefd63504739dab4fc3414065/n/e/new_project_-_2021-01-27t090253.046.jpg','https://i0.wp.com/hardloots.com.ar/wp-content/uploads/2021/11/G203-NUEVO-01.jpg?fit=600%2C600&ssl=1'),(62,'Lápices De Colores Faber Castell Eco 60 Colores Original','Madera 100% procedente de manejo forestal sostenible y certificado\r\nFormula exclusiva y proceso especial de fabricación que proporciona mayor resistencia a la punta de su EcoLapiz\r\nComposición: pigmentos, aglutinantes, carga inerte, ceras y maderas.\r\n','https://http2.mlstatic.com/D_NQ_NP_887355-MLA46196491286_052021-O.webp','Faber Castell',5650,2,0,2,3,'https://librerialacentral.com.ar/wp-content/uploads/2021/12/Lapices-Fabercastell-x60-2-600x600.png','https://d3ugyf2ht6aenh.cloudfront.net/stores/001/132/430/products/lapices-de-colores-largos-faber-castell-caja-60-unidades_iz1106442058xvzgrandexpz3xfz11527328-679954000-3xsz11527328xim1-a6a8876ed7a12bd57416041535205538-640-0.jpg'),(63,'Cuaderno universitario Avon','Cuaderno universitario Avon x 84 hojas 22 cm x 29cm rayado anillado','https://d22fxaf9t8d39k.cloudfront.net/3de931892b739e63435a366e13d3950fdf09c3c6eed0c256eeff2f17b08b102a80237.png','Avon',450,12,0,1,1,'https://d22fxaf9t8d39k.cloudfront.net/ffe71ccb339dcadbccf797c011e0853b9a061f8ac20b14b022e5e18b4d3ab8a980237.png','https://sdbe.com.ar/wp-content/uploads/2021/09/avon-2.png'),(64,'Resaltador Sharpie violeta','Resaltador Sharpie color violeta gran calidad tinta durable y lavable','https://d27u4zunn9iyud.cloudfront.net/filters:format(webp)/fit-in/600x600/PAA2272_0_1611928502.webp','Sharpie',120,21,0,9,1,'https://www.ramospapeleria.com.ar/img/p/31205/1.jpeg','https://www.lacoopeencasa.coop/media/lcec/publico/articulos/3/2/e/32ef3b0cdaa6d69fc56083c999f7383e'),(71,'Resaltadores Faber Castell pastel pack x 10','Resaltadores Faber Castell calidad excepcional pack pastel x 10 unidades','https://librerialacentral.com.ar/wp-content/uploads/2021/10/RESALTADOR-FABER-PASTEL-VERDE.JPG.png','Faber Castell',2899,6,0,9,1,'https://http2.mlstatic.com/D_NQ_NP_864802-MLA49433771675_032022-O.webp','http://d3ugyf2ht6aenh.cloudfront.net/stores/001/261/715/products/1657559259498-a3416cefc349906fbc16588547528818-640-0.png'),(73,'Lapiz Bic HB negro','Producto: Lápiz Grafito\r\nMarca: Bic\r\nLínea: Evolution\r\nLargo: 17.5 cm\r\nColores: Negro\r\nGraduación: HB 2\r\nCantidad: 1\r\nIndustria: Brasil\r\nFormato: unidad','https://d2r9epyceweg5n.cloudfront.net/stores/001/272/685/products/lote1p482-lapicero-bic-ecolutions-650-hb-caja-12-unds1-e89effd71c1aaed25e15994860040960-1024-1024.jpg','BIC',70,50,0,2,3,'https://officejob.com.ar/wp-content/uploads/2015/11/bic-evolution-con-goma.jpg','https://supermecas.com/568-large_default/lapices-bic-evolution-con-goma-hb-n2-x4.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategorias` (
  `idSubcategoria` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idCategoria` int DEFAULT NULL,
  PRIMARY KEY (`idSubcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (1,'cuadernos',1),(2,'lapices',1),(3,'reglas',1),(4,'lapiceras',1),(5,'marcadores',1),(6,'hojas',1),(7,'cartulinas',1),(8,'gomas',1),(9,'resaltadores',1),(10,'tijeras',1),(11,'cartuchos',3),(12,'toners',2),(13,'mouse y teclado',2),(14,'cuaderno de caligrafia',3),(15,'escuadras',3),(16,'lapices graduados',3),(17,'transportadores',3),(18,'adhesivo',1);
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'papeleravipdatabase'
--

--
-- Dumping routines for database 'papeleravipdatabase'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-16 12:16:22
