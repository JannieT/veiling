# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: veiling
# Generation Time: 2014-04-25 06:19:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `veiling`;

# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nommer` int(11) DEFAULT NULL,
  `beskrywing` varchar(255) DEFAULT NULL,
  `bieer_id` int(11) DEFAULT NULL,
  `bedrag` decimal(10,2) DEFAULT NULL,
  `betaal` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`id`, `nommer`, `beskrywing`, `bieer_id`, `bedrag`, `betaal`)
VALUES
	(1,1,'3 skaap boude',5,120.05,1),
	(2,2,'2010 Cabernet Simonsvlei',3,300.00,NULL),
	(4,7,'Simonsvlei Pinotage 1999',5,33.00,1),
	(13,15,'Rooiwyn 2011',NULL,NULL,NULL),
	(14,16,'Boschendal Rose 2012',NULL,NULL,NULL),
	(15,17,'Constantia Shiraz',NULL,NULL,NULL),
	(16,18,'Vergelegen Port',NULL,NULL,NULL),
	(18,19,'Johannesberger Wit',NULL,NULL,NULL),
	(19,30,'Wyn',12,230.00,NULL);

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
