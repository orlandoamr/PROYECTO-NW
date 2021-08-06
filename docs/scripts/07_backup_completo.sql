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
	('Controllers\\Checkout\\Accept', 'Controllers\\Checkout\\Accept', 'ACT', 'CTR'),
	('Controllers\\Index', 'Controllers\\Index', NULL, NULL),
	('Controllers\\Mnt\\Heroe', 'Controllers\\Mnt\\Heroe', 'ACT', 'CTR'),
	('Controllers\\Mnt\\Heroes', 'Controllers\\Mnt\\Heroes', 'ACT', 'CTR'),
	('Controllers\\Mnt\\Producto', 'Controllers\\Mnt\\Producto', 'ACT', 'CTR'),
	('Controllers\\Mnt\\Productos', 'Controllers\\Mnt\\Productos', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\Del', 'Controllers\\Mnt\\ProductoS\\Del', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\Dsp', 'Controllers\\Mnt\\ProductoS\\Dsp', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\New', 'Controllers\\Mnt\\ProductoS\\New', 'ACT', 'CTR'),
	('Controllers\\Mnt\\ProductoS\\Upd', 'Controllers\\Mnt\\ProductoS\\Upd', 'ACT', 'CTR'),
	('Controllers\\TransactionsHistory', 'Controllers\\TransactionsHistory', 'ACT', 'CTR'),
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
	('ADMIN', 'Controllers\\Mnt\\Heroe', NULL, NULL),
	('ADMIN', 'Controllers\\Mnt\\Heroes', NULL, NULL),
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
	(1, 'Combo Mouse + Audifonos Razer', 'http://localhost/proyecto-nw/public/imgs/hero/h3.jpg', '<h1>Hello world 1</h1>', 1, 'ACT'),
	(2, 'Teclado Logitech', 'http://localhost/proyecto-nw/public/imgs/hero/h2.jpg', '<h1>Hello world 2</h1>', 1, 'ACT'),
	(3, 'Mouser Razer', 'http://localhost/proyecto-nw/public/imgs/hero/h1.jpg', '<h1>Hello world 3</h1>', 1, 'ACT');
/*!40000 ALTER TABLE `heroitems` ENABLE KEYS */;

-- Dumping structure for table nw202101.historico_transacciones
CREATE TABLE IF NOT EXISTS `historico_transacciones` (
  `htid` int(13) NOT NULL AUTO_INCREMENT,
  `htprds` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `payres` longtext DEFAULT NULL,
  `usrcod` bigint(20) DEFAULT NULL,
  `fchtrs` datetime DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`htid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.historico_transacciones: ~2 rows (approximately)
/*!40000 ALTER TABLE `historico_transacciones` DISABLE KEYS */;
INSERT INTO `historico_transacciones` (`htid`, `htprds`, `payres`, `usrcod`, `fchtrs`, `total`) VALUES
	(16, '[\n    {\n        "id": "3",\n        "desc": "Teclado Genius",\n        "cant": "2",\n        "price": "12.00",\n        "total": 24,\n        "imgurl": "https:\\/\\/via.placeholder.com\\/150"\n    },\n    {\n        "id": "10",\n        "desc": "Mouse X",\n        "cant": "2",\n        "price": "50.00",\n        "total": 100,\n        "imgurl": "https:\\/\\/via.placeholder.com\\/150"\n    }\n]', '{\n    "statusCode": 201,\n    "result": {\n        "id": "9W994328088102321",\n        "status": "COMPLETED",\n        "purchase_units": [\n            {\n                "reference_id": "test1618156749",\n                "shipping": {\n                    "name": {\n                        "full_name": "John Doe"\n                    },\n                    "address": {\n                        "address_line_1": "Free Trade Zone",\n                        "admin_area_2": "Tegucigalpa",\n                        "admin_area_1": "Tegucigalpa",\n                        "postal_code": "12345",\n                        "country_code": "HN"\n                    }\n                },\n                "payments": {\n                    "captures": [\n                        {\n                            "id": "02225923E05733838",\n                            "status": "COMPLETED",\n                            "amount": {\n                                "currency_code": "USD",\n                                "value": "184.00"\n                            },\n                            "final_capture": true,\n                            "seller_protection": {\n                                "status": "ELIGIBLE",\n                                "dispute_categories": [\n                                    "ITEM_NOT_RECEIVED",\n                                    "UNAUTHORIZED_TRANSACTION"\n                                ]\n                            },\n                            "seller_receivable_breakdown": {\n                                "gross_amount": {\n                                    "currency_code": "USD",\n                                    "value": "184.00"\n                                },\n                                "paypal_fee": {\n                                    "currency_code": "USD",\n                                    "value": "9.32"\n                                },\n                                "net_amount": {\n                                    "currency_code": "USD",\n                                    "value": "174.68"\n                                }\n                            },\n                            "links": [\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/02225923E05733838",\n                                    "rel": "self",\n                                    "method": "GET"\n                                },\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/02225923E05733838\\/refund",\n                                    "rel": "refund",\n                                    "method": "POST"\n                                },\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/9W994328088102321",\n                                    "rel": "up",\n                                    "method": "GET"\n                                }\n                            ],\n                            "create_time": "2021-08-05T09:46:01Z",\n                            "update_time": "2021-08-05T09:46:01Z"\n                        }\n                    ]\n                }\n            }\n        ],\n        "payer": {\n            "name": {\n                "given_name": "John",\n                "surname": "Doe"\n            },\n            "email_address": "sb-zmfyl6865888@personal.example.com",\n            "payer_id": "7R9F4UBM28QWE",\n            "address": {\n                "country_code": "HN"\n            }\n        },\n        "links": [\n            {\n                "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/9W994328088102321",\n                "rel": "self",\n                "method": "GET"\n            }\n        ]\n    },\n    "headers": {\n        "": "",\n        "Content-Type": "application\\/json",\n        "Content-Length": "1446",\n        "Connection": "keep-alive",\n        "Date": "Thu, 05 Aug 2021 09",\n        "Application_id": "APP-80W284485P519543T",\n        "Cache-Control": "max-age=0, no-cache, no-store, must-revalidate",\n        "Caller_acct_num": "LTWWN9E8ZDBA8",\n        "Paypal-Debug-Id": "daf51c4562c63",\n        "Strict-Transport-Security": "max-age=31536000; includeSubDomains"\n    }\n}', 5, '2021-08-05 03:46:02', 124.00),
	(17, '[\n    {\n        "id": "3",\n        "desc": "Teclado Genius",\n        "cant": "1",\n        "price": "12.00",\n        "total": 12,\n        "imgurl": "http:\\/\\/localhost\\/proyecto-nw\\/public\\/imgs\\/products\\/2.jpg"\n    },\n    {\n        "id": "2",\n        "desc": "Teclado DELL",\n        "cant": "1",\n        "price": "15.00",\n        "total": 15,\n        "imgurl": "http:\\/\\/localhost\\/proyecto-nw\\/public\\/imgs\\/products\\/3.jpg"\n    }\n]', '{\n    "statusCode": 201,\n    "result": {\n        "id": "34N98963PU0563450",\n        "status": "COMPLETED",\n        "purchase_units": [\n            {\n                "reference_id": "test1618160284",\n                "shipping": {\n                    "name": {\n                        "full_name": "John Doe"\n                    },\n                    "address": {\n                        "address_line_1": "Free Trade Zone",\n                        "admin_area_2": "Tegucigalpa",\n                        "admin_area_1": "Tegucigalpa",\n                        "postal_code": "12345",\n                        "country_code": "HN"\n                    }\n                },\n                "payments": {\n                    "captures": [\n                        {\n                            "id": "0EE50573GR139642W",\n                            "status": "COMPLETED",\n                            "amount": {\n                                "currency_code": "USD",\n                                "value": "57.00"\n                            },\n                            "final_capture": true,\n                            "seller_protection": {\n                                "status": "ELIGIBLE",\n                                "dispute_categories": [\n                                    "ITEM_NOT_RECEIVED",\n                                    "UNAUTHORIZED_TRANSACTION"\n                                ]\n                            },\n                            "seller_receivable_breakdown": {\n                                "gross_amount": {\n                                    "currency_code": "USD",\n                                    "value": "57.00"\n                                },\n                                "paypal_fee": {\n                                    "currency_code": "USD",\n                                    "value": "3.09"\n                                },\n                                "net_amount": {\n                                    "currency_code": "USD",\n                                    "value": "53.91"\n                                }\n                            },\n                            "links": [\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/0EE50573GR139642W",\n                                    "rel": "self",\n                                    "method": "GET"\n                                },\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/0EE50573GR139642W\\/refund",\n                                    "rel": "refund",\n                                    "method": "POST"\n                                },\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/34N98963PU0563450",\n                                    "rel": "up",\n                                    "method": "GET"\n                                }\n                            ],\n                            "create_time": "2021-08-05T10:44:56Z",\n                            "update_time": "2021-08-05T10:44:56Z"\n                        }\n                    ]\n                }\n            }\n        ],\n        "payer": {\n            "name": {\n                "given_name": "John",\n                "surname": "Doe"\n            },\n            "email_address": "sb-zmfyl6865888@personal.example.com",\n            "payer_id": "7R9F4UBM28QWE",\n            "address": {\n                "country_code": "HN"\n            }\n        },\n        "links": [\n            {\n                "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/34N98963PU0563450",\n                "rel": "self",\n                "method": "GET"\n            }\n        ]\n    },\n    "headers": {\n        "": "",\n        "Content-Type": "application\\/json",\n        "Content-Length": "1443",\n        "Connection": "keep-alive",\n        "Date": "Thu, 05 Aug 2021 10",\n        "Application_id": "APP-80W284485P519543T",\n        "Cache-Control": "max-age=0, no-cache, no-store, must-revalidate",\n        "Caller_acct_num": "LTWWN9E8ZDBA8",\n        "Paypal-Debug-Id": "2924b7d7f6bef",\n        "Strict-Transport-Security": "max-age=31536000; includeSubDomains"\n    }\n}', 5, '2021-08-05 04:44:57', 27.00),
	(18, '{\n    "1": {\n        "id": "3",\n        "desc": "Teclado Genius",\n        "cant": "2",\n        "price": "12.00",\n        "total": 24,\n        "imgurl": "http:\\/\\/localhost\\/proyecto-nw\\/public\\/imgs\\/products\\/2.jpg"\n    },\n    "2": {\n        "id": "4",\n        "desc": "Teclado BENQ",\n        "cant": "1",\n        "price": "30.00",\n        "total": 30,\n        "imgurl": "http:\\/\\/localhost\\/proyecto-nw\\/public\\/imgs\\/products\\/4.jpg"\n    },\n    "3": {\n        "id": "10",\n        "desc": "Mouse X",\n        "cant": "2",\n        "price": "50.00",\n        "total": 100,\n        "imgurl": "http:\\/\\/localhost\\/proyecto-nw\\/public\\/imgs\\/products\\/5.jpg"\n    }\n}', '{\n    "statusCode": 201,\n    "result": {\n        "id": "7N038418HH673640M",\n        "status": "COMPLETED",\n        "purchase_units": [\n            {\n                "reference_id": "test1618193131",\n                "shipping": {\n                    "name": {\n                        "full_name": "John Doe"\n                    },\n                    "address": {\n                        "address_line_1": "Free Trade Zone",\n                        "admin_area_2": "Tegucigalpa",\n                        "admin_area_1": "Tegucigalpa",\n                        "postal_code": "12345",\n                        "country_code": "HN"\n                    }\n                },\n                "payments": {\n                    "captures": [\n                        {\n                            "id": "6JH44626A84619830",\n                            "status": "COMPLETED",\n                            "amount": {\n                                "currency_code": "USD",\n                                "value": "229.00"\n                            },\n                            "final_capture": true,\n                            "seller_protection": {\n                                "status": "ELIGIBLE",\n                                "dispute_categories": [\n                                    "ITEM_NOT_RECEIVED",\n                                    "UNAUTHORIZED_TRANSACTION"\n                                ]\n                            },\n                            "seller_receivable_breakdown": {\n                                "gross_amount": {\n                                    "currency_code": "USD",\n                                    "value": "229.00"\n                                },\n                                "paypal_fee": {\n                                    "currency_code": "USD",\n                                    "value": "11.52"\n                                },\n                                "net_amount": {\n                                    "currency_code": "USD",\n                                    "value": "217.48"\n                                }\n                            },\n                            "links": [\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6JH44626A84619830",\n                                    "rel": "self",\n                                    "method": "GET"\n                                },\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6JH44626A84619830\\/refund",\n                                    "rel": "refund",\n                                    "method": "POST"\n                                },\n                                {\n                                    "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7N038418HH673640M",\n                                    "rel": "up",\n                                    "method": "GET"\n                                }\n                            ],\n                            "create_time": "2021-08-05T19:52:29Z",\n                            "update_time": "2021-08-05T19:52:29Z"\n                        }\n                    ]\n                }\n            }\n        ],\n        "payer": {\n            "name": {\n                "given_name": "John",\n                "surname": "Doe"\n            },\n            "email_address": "sb-zmfyl6865888@personal.example.com",\n            "payer_id": "7R9F4UBM28QWE",\n            "address": {\n                "country_code": "HN"\n            }\n        },\n        "links": [\n            {\n                "href": "https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7N038418HH673640M",\n                "rel": "self",\n                "method": "GET"\n            }\n        ]\n    },\n    "headers": {\n        "": "",\n        "Content-Type": "application\\/json",\n        "Content-Length": "1447",\n        "Connection": "keep-alive",\n        "Date": "Thu, 05 Aug 2021 19",\n        "Application_id": "APP-80W284485P519543T",\n        "Cache-Control": "max-age=0, no-cache, no-store, must-revalidate",\n        "Caller_acct_num": "LTWWN9E8ZDBA8",\n        "Paypal-Debug-Id": "c49551029951d",\n        "Strict-Transport-Security": "max-age=31536000; includeSubDomains"\n    }\n}', 5, '2021-08-05 13:52:31', 154.00);
/*!40000 ALTER TABLE `historico_transacciones` ENABLE KEYS */;

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
  `prdprc` decimal(18,2) DEFAULT NULL,
  `prdctg` varchar(45) DEFAULT NULL,
  `prdImgPrm` varchar(255) DEFAULT NULL,
  `prdImgScd` varchar(255) DEFAULT NULL,
  `prdest` char(3) DEFAULT 'ACT',
  PRIMARY KEY (`prdcod`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table nw202101.products: ~8 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`prdcod`, `prddsc`, `prdprc`, `prdctg`, `prdImgPrm`, `prdImgScd`, `prdest`) VALUES
	(1, 'Teclado Logitech', 10.00, 'Teclados', 'http://localhost/proyecto-nw/public/imgs/products/1.jpg', 'imgs/products/teclados/cpu_prm.jpg', 'ACT'),
	(2, 'Teclado DELL', 15.00, 'Teclados', 'http://localhost/proyecto-nw/public/imgs/products/3.jpg', NULL, 'ACT'),
	(3, 'Teclado Genius', 12.00, 'Teclados', 'http://localhost/proyecto-nw/public/imgs/products/2.jpg', NULL, 'ACT'),
	(4, 'Teclado BENQ', 30.00, 'Teclados', 'http://localhost/proyecto-nw/public/imgs/products/4.jpg', NULL, 'ACT'),
	(5, 'Mouse Logitech', 7.00, 'Mouses', 'http://localhost/proyecto-nw/public/imgs/products/8.jpg', NULL, 'ACT'),
	(6, 'Mouse Microsoft', 20.00, 'Mouses', 'http://localhost/proyecto-nw/public/imgs/products/7.jpg', NULL, 'ACT'),
	(9, 'Mouse Razer', 12.00, 'Mouses', 'http://localhost/proyecto-nw/public/imgs/products/6.jpg', NULL, 'ACT'),
	(10, 'Mouse X', 50.00, 'Mouses', 'http://localhost/proyecto-nw/public/imgs/products/5.jpg', NULL, 'ACT'),
	(11, 'Mouse RedDragon', 20.00, NULL, 'img.jpg', '', NULL);
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
	(2, 'ADMIN', 'ACT', '2021-07-23 11:38:54', '2030-07-23 11:39:00'),
	(4, 'ADMIN', 'ACT', '2021-08-03 16:49:47', '2031-08-03 16:49:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table nw202101.usuario: ~5 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
	(1, 'orlandomrok@gmail.com', 'John Doe', '$2y$10$DEjEvXJ8b9833xfLSh3M4uDRPr4kipoPQhQZJ1o22EUBmujym5adC', '2021-07-08 17:38:43', 'ACT', '2021-10-06 00:00:00', 'ACT', '0e1a7a3ae233deb8363a4bd13190332e9252cf966e94c530dc3ff97cf49855df', '2021-07-08 17:38:43', 'ADM'),
	(2, 'orlando@gmail.com', 'John Doe', '$2y$10$Iw8V.afsEZaEzbuj.tnkjupjA8uQp4gl/C4QQCA5Ijmbqe.ekdcoa', '2021-07-23 08:58:56', 'ACT', '2021-10-21 00:00:00', 'ACT', 'cf56fb857484286bf30affcf8e8d54848540424dcac8d53c1e5090f058a21dd5', '2021-07-23 08:58:56', 'ADM'),
	(3, 'orlando1@gmail.com', 'John Doe', '$2y$10$tTbnvVYqqXePlYS2Q05.5.VMmv6h7s/JR1ShkVobkRX8OixpoQyQW', '2021-07-24 17:43:18', 'ACT', '2021-10-22 00:00:00', 'ACT', '2f9cb1b49a1995afa2d1437e7606176b774476b520eb10dd0ab8ed6c009c7ac2', '2021-07-24 17:43:18', 'PBL'),
	(4, 'lando@gmail.com', 'John Doe', '$2y$10$h7zBzPR/ninIgMRnZ5PT5esNq3oV3OFfSH2X.jMn6r5Z88aXS5qXq', '2021-08-03 16:29:12', 'ACT', '2021-11-01 00:00:00', 'ACT', '06bd9ca87ada981158f62d76976d128980f94e3fbe1cbbabec4325d5e261031f', '2021-08-03 16:29:12', 'PBL'),
	(5, 'lando2@gmail.com', 'John Doe', '$2y$10$9znSNXpaaBRabbSHBUDMn.0.Sl6C2Bd8YVuDSJFb4ZftD1GXtcibK', '2021-08-03 17:01:27', 'ACT', '2021-11-01 00:00:00', 'ACT', 'de3d42293a000d1c8445cf737d7ea1671725416ac93f1901af48ec8ca8bc2a7a', '2021-08-03 17:01:27', 'PBL');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
