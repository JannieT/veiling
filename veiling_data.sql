# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11-log)
# Database: veiling
# Generation Time: 2017-03-18 14:58:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bieers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bieers`;

CREATE TABLE `bieers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nommer` int(11) NOT NULL,
  `naam` varchar(50) DEFAULT NULL,
  `telefoon` varchar(15) DEFAULT NULL,
  `epos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FIRST` (`nommer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bieers` WRITE;
/*!40000 ALTER TABLE `bieers` DISABLE KEYS */;

INSERT INTO `bieers` (`id`, `nommer`, `naam`, `telefoon`, `epos`)
VALUES
	(1,1,NULL,NULL,NULL),
	(2,2,NULL,NULL,NULL),
	(3,3,NULL,NULL,NULL),
	(4,4,NULL,NULL,NULL),
	(5,5,NULL,NULL,NULL),
	(6,6,NULL,NULL,NULL),
	(7,7,NULL,NULL,NULL),
	(8,8,NULL,NULL,NULL),
	(9,9,NULL,NULL,NULL),
	(10,10,NULL,NULL,NULL),
	(11,11,NULL,NULL,NULL),
	(12,12,NULL,NULL,NULL),
	(13,13,NULL,NULL,NULL),
	(14,14,NULL,NULL,NULL),
	(15,15,NULL,NULL,NULL),
	(16,16,NULL,NULL,NULL),
	(17,17,NULL,NULL,NULL),
	(18,18,NULL,NULL,NULL),
	(19,19,NULL,NULL,NULL),
	(20,20,NULL,NULL,NULL),
	(21,21,NULL,NULL,NULL),
	(22,22,NULL,NULL,NULL),
	(23,23,NULL,NULL,NULL),
	(24,24,NULL,NULL,NULL),
	(25,25,NULL,NULL,NULL),
	(26,26,NULL,NULL,NULL),
	(27,27,NULL,NULL,NULL),
	(28,28,NULL,NULL,NULL),
	(29,29,NULL,NULL,NULL),
	(30,30,NULL,NULL,NULL),
	(31,31,NULL,NULL,NULL),
	(32,32,NULL,NULL,NULL),
	(33,33,NULL,NULL,NULL),
	(34,34,NULL,NULL,NULL),
	(35,35,NULL,NULL,NULL),
	(36,36,NULL,NULL,NULL),
	(37,37,NULL,NULL,NULL),
	(38,38,NULL,NULL,NULL),
	(39,39,NULL,NULL,NULL),
	(40,40,NULL,NULL,NULL),
	(41,41,NULL,NULL,NULL),
	(42,42,NULL,NULL,NULL),
	(43,43,NULL,NULL,NULL),
	(44,44,NULL,NULL,NULL),
	(45,45,NULL,NULL,NULL),
	(46,46,NULL,NULL,NULL),
	(47,47,NULL,NULL,NULL),
	(48,48,NULL,NULL,NULL),
	(49,49,NULL,NULL,NULL),
	(50,50,NULL,NULL,NULL),
	(51,51,NULL,NULL,NULL),
	(52,52,NULL,NULL,NULL),
	(53,53,NULL,NULL,NULL),
	(54,54,NULL,NULL,NULL),
	(55,55,NULL,NULL,NULL),
	(56,56,NULL,NULL,NULL),
	(57,57,NULL,NULL,NULL),
	(58,58,NULL,NULL,NULL),
	(59,59,NULL,NULL,NULL),
	(60,60,NULL,NULL,NULL),
	(61,61,NULL,NULL,NULL),
	(62,62,NULL,NULL,NULL),
	(63,63,NULL,NULL,NULL),
	(64,64,NULL,NULL,NULL),
	(65,65,NULL,NULL,NULL),
	(66,66,NULL,NULL,NULL),
	(67,67,NULL,NULL,NULL),
	(68,68,NULL,NULL,NULL),
	(69,69,NULL,NULL,NULL),
	(70,70,NULL,NULL,NULL),
	(71,71,NULL,NULL,NULL),
	(72,72,NULL,NULL,NULL),
	(73,73,NULL,NULL,NULL),
	(74,74,NULL,NULL,NULL),
	(75,75,NULL,NULL,NULL),
	(76,76,NULL,NULL,NULL),
	(77,77,NULL,NULL,NULL),
	(78,78,NULL,NULL,NULL),
	(79,79,NULL,NULL,NULL),
	(80,80,NULL,NULL,NULL),
	(81,81,NULL,NULL,NULL);

/*!40000 ALTER TABLE `bieers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nommer` int(11) DEFAULT NULL,
  `beskrywing` varchar(255) DEFAULT NULL,
  `bieer_id` int(11) DEFAULT NULL,
  `bedrag` decimal(10,2) DEFAULT NULL,
  `betaal` tinyint(1) DEFAULT NULL,
  `soort` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bieers` (`bieer_id`),
  CONSTRAINT `fk_bieers` FOREIGN KEY (`bieer_id`) REFERENCES `bieers` (`nommer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`id`, `nommer`, `beskrywing`, `bieer_id`, `bedrag`, `betaal`, `soort`)
VALUES
	(1,1,NULL,NULL,NULL,NULL,NULL),
	(2,2,NULL,NULL,NULL,NULL,NULL),
	(3,3,NULL,NULL,NULL,NULL,NULL),
	(4,4,NULL,NULL,NULL,NULL,NULL),
	(5,5,NULL,NULL,NULL,NULL,NULL),
	(6,6,NULL,NULL,NULL,NULL,NULL),
	(7,7,NULL,NULL,NULL,NULL,NULL),
	(8,8,NULL,NULL,NULL,NULL,NULL),
	(9,9,NULL,NULL,NULL,NULL,NULL),
	(10,10,NULL,NULL,NULL,NULL,NULL),
	(11,11,NULL,NULL,NULL,NULL,NULL),
	(12,12,NULL,NULL,NULL,NULL,NULL),
	(13,13,NULL,NULL,NULL,NULL,NULL),
	(14,14,NULL,NULL,NULL,NULL,NULL),
	(15,15,NULL,NULL,NULL,NULL,NULL),
	(16,16,NULL,NULL,NULL,NULL,NULL),
	(17,17,NULL,NULL,NULL,NULL,NULL),
	(18,18,NULL,NULL,NULL,NULL,NULL),
	(19,19,NULL,NULL,NULL,NULL,NULL),
	(20,20,NULL,NULL,NULL,NULL,NULL),
	(21,21,NULL,NULL,NULL,NULL,NULL),
	(22,22,NULL,NULL,NULL,NULL,NULL),
	(23,23,NULL,NULL,NULL,NULL,NULL),
	(24,24,NULL,NULL,NULL,NULL,NULL),
	(25,25,NULL,NULL,NULL,NULL,NULL),
	(26,26,NULL,NULL,NULL,NULL,NULL),
	(27,27,NULL,NULL,NULL,NULL,NULL),
	(28,28,NULL,NULL,NULL,NULL,NULL),
	(29,29,NULL,NULL,NULL,NULL,NULL),
	(30,30,NULL,NULL,NULL,NULL,NULL),
	(31,31,NULL,NULL,NULL,NULL,NULL),
	(32,32,NULL,NULL,NULL,NULL,NULL),
	(33,33,NULL,NULL,NULL,NULL,NULL),
	(34,34,NULL,NULL,NULL,NULL,NULL),
	(35,35,NULL,NULL,NULL,NULL,NULL),
	(36,36,NULL,NULL,NULL,NULL,NULL),
	(37,37,NULL,NULL,NULL,NULL,NULL),
	(38,38,NULL,NULL,NULL,NULL,NULL),
	(39,39,NULL,NULL,NULL,NULL,NULL),
	(40,40,NULL,NULL,NULL,NULL,NULL),
	(41,41,NULL,NULL,NULL,NULL,NULL),
	(42,42,NULL,NULL,NULL,NULL,NULL),
	(43,43,NULL,NULL,NULL,NULL,NULL),
	(44,44,NULL,NULL,NULL,NULL,NULL),
	(45,45,NULL,NULL,NULL,NULL,NULL),
	(46,46,NULL,NULL,NULL,NULL,NULL),
	(47,47,NULL,NULL,NULL,NULL,NULL),
	(48,48,NULL,NULL,NULL,NULL,NULL),
	(49,49,NULL,NULL,NULL,NULL,NULL),
	(50,50,NULL,NULL,NULL,NULL,NULL),
	(51,51,NULL,NULL,NULL,NULL,NULL),
	(52,52,NULL,NULL,NULL,NULL,NULL),
	(53,53,NULL,NULL,NULL,NULL,NULL),
	(54,54,NULL,NULL,NULL,NULL,NULL),
	(55,55,NULL,NULL,NULL,NULL,NULL),
	(56,56,NULL,NULL,NULL,NULL,NULL),
	(57,57,NULL,NULL,NULL,NULL,NULL),
	(58,58,NULL,NULL,NULL,NULL,NULL),
	(59,59,NULL,NULL,NULL,NULL,NULL),
	(60,60,NULL,NULL,NULL,NULL,NULL),
	(61,61,NULL,NULL,NULL,NULL,NULL),
	(62,62,NULL,NULL,NULL,NULL,NULL),
	(63,63,NULL,NULL,NULL,NULL,NULL),
	(64,64,NULL,NULL,NULL,NULL,NULL),
	(65,65,NULL,NULL,NULL,NULL,NULL),
	(66,66,NULL,NULL,NULL,NULL,NULL),
	(67,67,NULL,NULL,NULL,NULL,NULL),
	(68,68,NULL,NULL,NULL,NULL,NULL),
	(69,69,NULL,NULL,NULL,NULL,NULL),
	(70,70,NULL,NULL,NULL,NULL,NULL),
	(71,71,NULL,NULL,NULL,NULL,NULL),
	(72,72,NULL,NULL,NULL,NULL,NULL),
	(73,73,NULL,NULL,NULL,NULL,NULL),
	(74,74,NULL,NULL,NULL,NULL,NULL),
	(75,75,NULL,NULL,NULL,NULL,NULL),
	(76,76,NULL,NULL,NULL,NULL,NULL),
	(77,77,NULL,NULL,NULL,NULL,NULL),
	(78,78,NULL,NULL,NULL,NULL,NULL),
	(79,79,NULL,NULL,NULL,NULL,NULL),
	(80,80,NULL,NULL,NULL,NULL,NULL),
	(81,81,NULL,NULL,NULL,NULL,NULL),
	(82,82,NULL,NULL,NULL,NULL,NULL),
	(83,83,NULL,NULL,NULL,NULL,NULL),
	(84,84,NULL,NULL,NULL,NULL,NULL),
	(85,85,NULL,NULL,NULL,NULL,NULL),
	(86,86,NULL,NULL,NULL,NULL,NULL),
	(87,87,NULL,NULL,NULL,NULL,NULL),
	(88,88,NULL,NULL,NULL,NULL,NULL),
	(89,89,NULL,NULL,NULL,NULL,NULL),
	(90,90,NULL,NULL,NULL,NULL,NULL),
	(91,91,NULL,NULL,NULL,NULL,NULL),
	(92,92,NULL,NULL,NULL,NULL,NULL),
	(93,93,NULL,NULL,NULL,NULL,NULL),
	(94,94,NULL,NULL,NULL,NULL,NULL),
	(95,95,NULL,NULL,NULL,NULL,NULL),
	(96,96,NULL,NULL,NULL,NULL,NULL),
	(97,97,NULL,NULL,NULL,NULL,NULL),
	(98,98,NULL,NULL,NULL,NULL,NULL),
	(99,99,NULL,NULL,NULL,NULL,NULL),
	(100,100,NULL,NULL,NULL,NULL,NULL),
	(101,101,NULL,NULL,NULL,NULL,NULL),
	(102,102,NULL,NULL,NULL,NULL,NULL),
	(103,103,NULL,NULL,NULL,NULL,NULL),
	(104,104,NULL,NULL,NULL,NULL,NULL),
	(105,105,NULL,NULL,NULL,NULL,NULL),
	(106,106,NULL,NULL,NULL,NULL,NULL),
	(107,107,NULL,NULL,NULL,NULL,NULL),
	(108,108,NULL,NULL,NULL,NULL,NULL),
	(109,109,NULL,NULL,NULL,NULL,NULL),
	(110,110,NULL,NULL,NULL,NULL,NULL),
	(111,111,NULL,NULL,NULL,NULL,NULL),
	(112,112,NULL,NULL,NULL,NULL,NULL),
	(113,113,NULL,NULL,NULL,NULL,NULL),
	(114,114,NULL,NULL,NULL,NULL,NULL),
	(115,115,NULL,NULL,NULL,NULL,NULL),
	(116,116,NULL,NULL,NULL,NULL,NULL),
	(117,117,NULL,NULL,NULL,NULL,NULL),
	(118,118,NULL,NULL,NULL,NULL,NULL),
	(119,119,NULL,NULL,NULL,NULL,NULL),
	(120,120,NULL,NULL,NULL,NULL,NULL),
	(121,121,NULL,NULL,NULL,NULL,NULL),
	(122,122,NULL,NULL,NULL,NULL,NULL),
	(123,123,NULL,NULL,NULL,NULL,NULL),
	(124,124,NULL,NULL,NULL,NULL,NULL),
	(125,125,NULL,NULL,NULL,NULL,NULL),
	(126,126,NULL,NULL,NULL,NULL,NULL),
	(127,127,NULL,NULL,NULL,NULL,NULL),
	(128,128,NULL,NULL,NULL,NULL,NULL),
	(129,129,NULL,NULL,NULL,NULL,NULL),
	(130,130,NULL,NULL,NULL,NULL,NULL),
	(131,131,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
