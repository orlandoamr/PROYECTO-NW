-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nw202101
CREATE DATABASE IF NOT EXISTS `nw202101` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `nw202101`;

-- Dumping structure for table nw202101.bitacora
CREATE TABLE IF NOT EXISTS `bitacora` (
  `bitacoracod` int(11) NOT NULL AUTO_INCREMENT,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`bitacoracod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table nw202101.bitacora: ~0 rows (approximately)
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;

-- Dumping structure for table nw202101.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `catid` bigint(8) NOT NULL AUTO_INCREMENT,
  `catnom` varchar(45) DEFAULT NULL,
  `catest` char(3) DEFAULT 'ACT',
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.categorias: ~0 rows (approximately)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Dumping structure for table nw202101.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `clientid` bigint(15) NOT NULL AUTO_INCREMENT,
  `clientname` varchar(128) DEFAULT NULL,
  `clientgender` char(3) DEFAULT NULL,
  `clientphone1` varchar(255) DEFAULT NULL,
  `clientphone2` varchar(255) DEFAULT NULL,
  `clientemail` varchar(255) DEFAULT NULL,
  `clientIdnumber` varchar(45) DEFAULT NULL,
  `clientbio` varchar(5000) DEFAULT NULL,
  `clientstatus` char(3) DEFAULT NULL,
  `clientdatecrt` datetime DEFAULT NULL,
  `clientusercreates` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.clientes: ~0 rows (approximately)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Dumping structure for table nw202101.funciones
CREATE TABLE IF NOT EXISTS `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table nw202101.funciones: ~11 rows (approximately)
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
	('Controllers\\Admin\\Admin', 'Controllers\\Admin\\Admin', 'ACT', 'CTR'),
	('Controllers\\Mnt\\Heroe', 'Controllers\\Mnt\\Heroe', 'ACT', 'CTR'),
	('Controllers\\Mnt\\Heroes', 'Controllers\\Mnt\\Heroes', 'ACT', 'CTR'),
	('Controllers\\Mnt\\Producto', 'Controllers\\Mnt\\Producto', 'ACT', 'CTR'),
	('Controllers\\Mnt\\Productos', 'Controllers\\Mnt\\Productos', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\Del', 'Controllers\\Mnt\\ProductoS\\Del', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\Dsp', 'Controllers\\Mnt\\ProductoS\\Dsp', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\New', 'Controllers\\Mnt\\ProductoS\\New', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\Upd', 'Controllers\\Mnt\\ProductoS\\Upd', 'ACT', 'CTR'),
	('MntCategorias', 'MntCategorias', 'ACT', 'CTR'),
	('MntUsuarios', 'MntUsuarios', 'ACT', 'CTR');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;

-- Dumping structure for table nw202101.funciones_roles
CREATE TABLE IF NOT EXISTS `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table nw202101.funciones_roles: ~6 rows (approximately)
/*!40000 ALTER TABLE `funciones_roles` DISABLE KEYS */;
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
	('ADMIN', 'Controllers\\Admin\\Admin', 'ACT', '2031-07-23 11:40:03'),
	('ADMIN', 'Controllers\\Mnt\\Producto', 'ACT', '2031-07-23 11:40:43'),
	('ADMIN', 'Controllers\\Mnt\\Productos', 'ACT', '2031-07-23 11:41:08'),
	('ADMIN', 'Controllers\\Mnt\\ProductoS\\Del', 'ACT', '2031-07-23 11:44:06'),
	('ADMIN', 'Controllers\\Mnt\\ProductoS\\Dsp', 'ACT', '2031-07-23 11:44:09'),
	('ADMIN', 'Controllers\\Mnt\\ProductoS\\New', 'ACT', '2031-07-23 11:44:12'),
	('ADMIN', 'Controllers\\Mnt\\ProductoS\\Upd', 'ACT', '2031-07-23 11:44:20');
/*!40000 ALTER TABLE `funciones_roles` ENABLE KEYS */;

-- Dumping structure for table nw202101.heroitems
CREATE TABLE IF NOT EXISTS `heroitems` (
  `heroItemId` bigint(18) NOT NULL AUTO_INCREMENT,
  `heroname` varchar(45) DEFAULT NULL,
  `heroimgurl` varchar(256) DEFAULT NULL,
  `heroaction` varchar(512) DEFAULT NULL,
  `heroorder` int(11) DEFAULT NULL,
  `heroest` char(3) DEFAULT NULL,
  PRIMARY KEY (`heroItemId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.heroitems: ~3 rows (approximately)
/*!40000 ALTER TABLE `heroitems` DISABLE KEYS */;
INSERT INTO `heroitems` (`heroItemId`, `heroname`, `heroimgurl`, `heroaction`, `heroorder`, `heroest`) VALUES
	(1, 'Piano 1', 'public/img/hero/1.jpg', '<h1>Hello world 1</h1>', 1, 'ACT'),
	(2, 'Piano 2', 'public/img/hero/2.jpg', '<h1>Hello world 2</h1>', 1, 'ACT'),
	(3, 'Piano 3', 'public/img/hero/3.jpg', '<h1>Hello world 3</h1>', 1, 'ACT');
/*!40000 ALTER TABLE `heroitems` ENABLE KEYS */;

-- Dumping structure for table nw202101.pianos
CREATE TABLE IF NOT EXISTS `pianos` (
  `pianoid` bigint(18) NOT NULL AUTO_INCREMENT,
  `pianodsc` varchar(60) DEFAULT NULL,
  `pianobio` varchar(5000) DEFAULT NULL,
  `pianosales` int(11) DEFAULT NULL,
  `pianoimguri` varchar(128) DEFAULT NULL,
  `pianoimgthb` varchar(128) DEFAULT NULL,
  `pianoprice` decimal(13,2) DEFAULT NULL,
  `pianoest` char(3) DEFAULT NULL,
  PRIMARY KEY (`pianoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.pianos: ~0 rows (approximately)
/*!40000 ALTER TABLE `pianos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pianos` ENABLE KEYS */;

-- Dumping structure for table nw202101.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `invPrdId` bigint(13) NOT NULL AUTO_INCREMENT,
  `invPrdBrCod` varchar(128) DEFAULT NULL,
  `invPrdCodInt` varchar(128) DEFAULT NULL,
  `invPrdDsc` varchar(128) DEFAULT NULL,
  `invPrdTip` char(3) DEFAULT NULL,
  `invPrdEst` char(3) DEFAULT NULL,
  `invPrdPadre` bigint(13) DEFAULT NULL,
  `invPrdFactor` int(11) DEFAULT NULL,
  `invPrdVnd` char(3) DEFAULT NULL,
  PRIMARY KEY (`invPrdId`),
  UNIQUE KEY `invPrdBrCod_UNIQUE` (`invPrdBrCod`),
  UNIQUE KEY `invPrdCodIng_UNIQUE` (`invPrdCodInt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.productos: ~0 rows (approximately)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Dumping structure for table nw202101.products
CREATE TABLE IF NOT EXISTS `products` (
  `prdcod` bigint(18) unsigned NOT NULL AUTO_INCREMENT,
  `prddsc` varchar(45) DEFAULT NULL,
  `prdprc` decimal(18,4) DEFAULT NULL,
  `prdctg` varchar(45) DEFAULT NULL,
  `prdImgPrm` varchar(255) DEFAULT NULL,
  `prdImgScd` varchar(255) DEFAULT NULL,
  `prdest` char(3) DEFAULT NULL,
  PRIMARY KEY (`prdcod`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.products: ~8 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`prdcod`, `prddsc`, `prdprc`, `prdctg`, `prdImgPrm`, `prdImgScd`, `prdest`) VALUES
	(1, 'Teclado Logitech', 300.0000, 'Teclados', 'https://via.placeholder.com/150', 'imgs/products/teclados/cpu_prm.jpg', 'ACT'),
	(2, 'Teclado DELL', 400.0000, 'Teclados', 'https://via.placeholder.com/150', NULL, 'ACT'),
	(3, 'Teclado Genius', 500.0000, 'Teclados', 'https://via.placeholder.com/150', NULL, 'ACT'),
	(4, 'Teclado BENQ', 300.0000, 'Teclados', 'https://via.placeholder.com/150', NULL, 'ACT'),
	(5, 'Mouse Logitech', 700.0000, 'Mouses', 'https://via.placeholder.com/150', NULL, 'ACT'),
	(6, 'Mouse Microsoft', 800.0000, 'Mouses', 'https://via.placeholder.com/150', NULL, 'ACT'),
	(9, 'Mouse Razer', 1200.0000, 'Mouses', 'https://via.placeholder.com/150', NULL, 'ACT'),
	(10, 'Mouse X', 500.0000, 'Mouses', 'https://via.placeholder.com/150', NULL, 'ACT');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table nw202101.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table nw202101.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
	('ADMIN', 'ADMIN', 'ACT'),
	('AUDIT', 'AUDIT', 'ACT');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table nw202101.roles_usuarios
CREATE TABLE IF NOT EXISTS `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table nw202101.roles_usuarios: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES
	(2, 'ADMIN', 'ACT', '2021-07-23 11:38:54', '2030-07-23 11:39:00');
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;

-- Dumping structure for table nw202101.scores
CREATE TABLE IF NOT EXISTS `scores` (
  `scoreid` bigint(18) NOT NULL AUTO_INCREMENT,
  `scoredsc` varchar(128) DEFAULT NULL,
  `scoreauthor` varchar(256) DEFAULT NULL,
  `scoregenre` varchar(256) DEFAULT NULL,
  `scoreyear` int(11) DEFAULT NULL,
  `scoresales` int(11) DEFAULT NULL,
  `scoreprice` decimal(13,2) DEFAULT NULL,
  `scoredocurl` varchar(256) DEFAULT NULL,
  `scoreest` char(3) DEFAULT NULL,
  PRIMARY KEY (`scoreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.scores: ~0 rows (approximately)
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;

-- Dumping structure for table nw202101.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table nw202101.usuario: ~2 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
	(1, 'orlandomrok@gmail.com', 'John Doe', '$2y$10$DEjEvXJ8b9833xfLSh3M4uDRPr4kipoPQhQZJ1o22EUBmujym5adC', '2021-07-08 17:38:43', 'ACT', '2021-10-06 00:00:00', 'ACT', '0e1a7a3ae233deb8363a4bd13190332e9252cf966e94c530dc3ff97cf49855df', '2021-07-08 17:38:43', 'ADM'),
	(2, 'orlando@gmail.com', 'John Doe', '$2y$10$Iw8V.afsEZaEzbuj.tnkjupjA8uQp4gl/C4QQCA5Ijmbqe.ekdcoa', '2021-07-23 08:58:56', 'ACT', '2021-10-21 00:00:00', 'ACT', 'cf56fb857484286bf30affcf8e8d54848540424dcac8d53c1e5090f058a21dd5', '2021-07-23 08:58:56', 'ADM');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
