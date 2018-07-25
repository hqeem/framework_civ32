/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.25-MariaDB : Database - ci4
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ci4` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ci4`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `barang` */

insert  into `barang`(`id`,`nama`,`keterangan`,`tgl`,`kategori`) values (6,'Odol','Pasta Gigi','2017-06-12','biasa'),(8,'Beras','Macam2 Beras','2017-06-12','biasa'),(9,'Kooo kokk dfdsfd','Kokokok','2017-06-13','pecah belah');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fact` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`id`,`name`,`email`,`fact`,`created_at`,`updated_at`) values (1,'John','john@aaabbb.com','Loves coding XXX',NULL,'2017-05-31 04:24:48'),(2,'Jim','jim@example.com','Developed on CodeIgniter',NULL,NULL),(3,'Jane','jane@example.com','Lives in the USA',NULL,NULL),(4,'John X','john@example.com','Loves coding','2017-05-30 08:36:41',NULL),(5,'John X','john@example.com','Loves coding','2017-05-30 08:40:25',NULL),(6,'John XX','john@example.com','Loves coding','2017-05-30 08:41:35',NULL),(7,'John XX','john@example.com','Loves coding','2017-05-30 08:42:14',NULL),(8,'John XX','john@example.com','Loves coding','2017-05-30 08:42:29',NULL),(9,'John XX','john@example.com','Loves coding','2017-05-30 08:42:50',NULL),(10,'John XX','john@example.com','Loves coding','2017-05-30 08:43:03',NULL),(11,'John XX','john@example.com','Loves coding','2017-05-30 08:44:05',NULL),(12,'John XX','john@example.com','Loves coding','2017-05-30 08:48:02',NULL),(13,'John XX','john@example.com','Loves coding','2017-05-30 08:48:39',NULL),(14,'John XX','john@example.com','Loves coding','2017-05-30 08:50:06',NULL),(15,'John XX','john@example.com','Loves coding','2017-05-30 08:50:30',NULL),(16,'John XX','john@example.com','Loves coding','2017-05-30 08:51:18',NULL),(17,'John XX','john@example.com','Loves coding','2017-05-30 08:51:53',NULL),(18,'John XX','john@example.com','Loves coding','2017-05-30 08:52:16',NULL),(20,'John XX','john@example.com','Loves coding','2017-05-30 08:52:51',NULL);

/*Table structure for table `detail_barang` */

DROP TABLE IF EXISTS `detail_barang`;

CREATE TABLE `detail_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) DEFAULT NULL,
  `jenis_barang` varchar(255) DEFAULT NULL,
  `barang` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Data for the table `detail_barang` */

insert  into `detail_barang`(`id`,`id_barang`,`jenis_barang`,`barang`,`created_at`) values (1,1,NULL,'Abcd efgh','2017-06-12 05:56:13'),(2,1,NULL,'dsxfdsfdsfdsf','2017-06-12 05:56:13'),(3,2,NULL,'sdasdsad','2017-06-12 06:02:19'),(4,2,NULL,'sdsadsadsadsad','2017-06-12 06:02:19'),(5,3,NULL,'sdasdsad','2017-06-12 07:49:59'),(6,3,NULL,'sdsadsadsadsad','2017-06-12 07:49:59'),(7,3,NULL,'wkwkwkwkw','2017-06-12 07:49:59'),(8,4,NULL,'sdasdsad','2017-06-12 07:52:13'),(9,4,NULL,'sdsadsadsadsad','2017-06-12 07:52:13'),(10,4,NULL,'wkwkwkwkw','2017-06-12 07:52:13'),(11,5,NULL,'sdasdsad','2017-06-12 07:54:21'),(12,5,NULL,'sdsadsadsadsad','2017-06-12 07:54:21'),(13,5,NULL,'Wkwkwkw','2017-06-12 07:54:21'),(16,7,NULL,'Close Up','2017-06-12 07:55:38'),(17,7,NULL,'Pepsodent','2017-06-12 07:55:38'),(18,7,NULL,'Rita Dent','2017-06-12 07:55:38'),(36,6,NULL,'Ritadent','2017-06-12 09:08:57'),(37,6,NULL,'Enzim','2017-06-12 09:08:57'),(38,6,NULL,'Close Up','2017-06-12 09:08:57'),(39,6,NULL,'Pepsodent','2017-06-12 09:08:57'),(45,8,NULL,'Beras Merah','2017-06-12 09:15:15'),(46,8,NULL,'Beras Biasa','2017-06-12 09:15:15'),(47,8,NULL,'Beras Campur','2017-06-12 09:15:15'),(48,8,NULL,'Beras Ketan','2017-06-12 09:15:15'),(49,9,'Elektronik','Kulkas','2017-06-13 09:04:18');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`description`) values (1,'admin','Administrator'),(2,'members','General User');

/*Table structure for table `hobbies` */

DROP TABLE IF EXISTS `hobbies`;

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `hobbies` */

insert  into `hobbies`(`id`,`customer_id`,`hobbies`,`created_at`,`updated_at`) values (14,1,'AAAADDDDEEE','2017-05-31 03:28:14','2017-05-31 04:24:48'),(15,1,'BBBBCCCDDD','2017-05-31 03:54:42','2017-05-31 04:24:48'),(18,1,'EEEEECCCDDD','2017-05-31 04:24:48',NULL);

/*Table structure for table `jenis_barang` */

DROP TABLE IF EXISTS `jenis_barang`;

CREATE TABLE `jenis_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_barang` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `jenis_barang` */

insert  into `jenis_barang`(`id`,`jenis_barang`,`keterangan`) values (1,'Elektronik','EK'),(2,'Perabot Rumah Tangga','PRR');

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `job` */

insert  into `job`(`name`) values ('PoliticianX'),('AccountantX');

/*Table structure for table `keys` */

DROP TABLE IF EXISTS `keys`;

CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `keys` */

insert  into `keys`(`id`,`key`,`level`,`ignore_limits`,`is_private_key`,`ip_addresses`,`date_created`) values (1,'api/example/users',1,0,0,NULL,0);

/*Table structure for table `login_attempts` */

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `login_attempts` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `logs` */

insert  into `logs`(`id`,`uri`,`method`,`params`,`api_key`,`ip_address`,`time`,`rtime`,`authorized`,`response_code`) values (1,'api/example/users','get',NULL,'','127.0.0.1',1496117142,0.074677,'1',200),(2,'api/example/users','get',NULL,'','127.0.0.1',1496117805,0.0905309,'1',200),(3,'api/example/users','get',NULL,'','127.0.0.1',1496118530,0.144681,'1',0),(4,'api/example/users','get',NULL,'','127.0.0.1',1496118576,0.117867,'1',404),(5,'api/example/users','get',NULL,'','127.0.0.1',1496118702,0.078768,'1',200),(6,'api/example/users','get',NULL,'','127.0.0.1',1496119259,0.102483,'1',0),(7,'api/example/users','get',NULL,'','127.0.0.1',1496119296,0.0738502,'1',200),(8,'api/example/users','get',NULL,'','127.0.0.1',1496119338,0.140558,'1',200),(9,'api/example/users','get',NULL,'','127.0.0.1',1496122795,0.126308,'1',200),(10,'api/example/users','get',NULL,'','127.0.0.1',1496123042,0.0670409,'1',200),(11,'api/example/users','get',NULL,'','127.0.0.1',1496123125,0.106953,'1',200),(12,'api/example/users','get',NULL,'','127.0.0.1',1496123159,0.06971,'1',200),(13,'api/example/users','get',NULL,'','127.0.0.1',1496123196,0.124738,'1',200),(14,'api/example/users','get',NULL,'','127.0.0.1',1496123318,0.096081,'1',200),(15,'api/example/users','get',NULL,'','127.0.0.1',1496123334,0.0718069,'1',200),(16,'api/example/users','get',NULL,'','127.0.0.1',1496123458,0.0992951,'1',200),(17,'api/example/users','get',NULL,'','127.0.0.1',1496123497,0.0948091,'1',200),(18,'api/example/users','get',NULL,'','127.0.0.1',1496123669,0.0857852,'1',200),(19,'api/example/users','get',NULL,'','127.0.0.1',1496123686,0.151381,'1',200),(20,'api/example/users','get',NULL,'','127.0.0.1',1496123837,0.0828459,'1',200),(21,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496123847,0.0731189,'1',0),(22,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124032,0.0799241,'1',404),(23,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124061,0.0924251,'1',404),(24,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124082,0.256184,'1',404),(25,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124167,0.11669,'1',404),(26,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124205,0.0773292,'1',404),(27,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124236,0.0772748,'1',404),(28,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124323,0.109822,'1',404),(29,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124355,0.0932381,'1',200),(30,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124369,0.0999439,'1',200),(31,'api/example/users/id/2','get','a:1:{s:2:\"id\";s:1:\"2\";}','','127.0.0.1',1496124425,0.0714579,'1',200),(32,'api/example/users/id/2','get','a:1:{s:2:\"id\";s:1:\"2\";}','','127.0.0.1',1496124453,0.110648,'1',200),(33,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124464,0.101979,'1',200),(34,'api/example/users/id/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496124473,0.096652,'1',200),(35,'api/example/users','post','a:3:{s:4:\"name\";s:6:\"John X\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";}','','127.0.0.1',1496126084,0.0972679,'1',0),(36,'api/example/users','post','a:3:{s:4:\"name\";s:6:\"John X\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";}','','127.0.0.1',1496126201,0.242061,'1',201),(37,'api/example/users','post','a:3:{s:4:\"name\";s:6:\"John X\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";}','','127.0.0.1',1496126425,0.172727,'1',201),(38,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126495,0.127612,'1',201),(39,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126534,0.209381,'1',201),(40,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126549,0.143759,'1',0),(41,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126570,0.137136,'1',0),(42,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126583,0.198734,'1',0),(43,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126645,0.119795,'1',0),(44,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126882,0.137248,'1',0),(45,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496126919,0.165653,'1',0),(46,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127006,0.117209,'1',0),(47,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127030,0.116015,'1',0),(48,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127078,0.138249,'1',201),(49,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127113,0.118997,'1',0),(50,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127136,0.156057,'1',0),(51,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127154,0.0992231,'1',0),(52,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127171,0.170843,'1',0),(53,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127275,0.117749,'1',0),(54,'api/example/users','post','a:4:{s:4:\"name\";s:7:\"John XX\";s:5:\"email\";s:16:\"john@example.com\";s:4:\"fact\";s:12:\"Loves coding\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"AAAA\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:4:\"BBBB\";}}}','','127.0.0.1',1496127299,0.223043,'1',201),(55,'api/example/users/22','delete','a:2:{s:2:\"id\";s:2:\"22\";s:97:\"{\r\n__\"name\":_\"John_XX\",\r\n__\"email\":_\"john@example_com\",\r\n__\"fact\":_\"Loves_coding\",\r\n__\"hobbies\":_\";a:1:{s:173:\"\r\n    {\r\n      \"id\": \"1\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"AAAA\"\r\n    },\r\n    {\r\n      \"id\": \"2\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"BBBB\"\r\n    }\r\n  \";s:0:\"\";}}','','127.0.0.1',1496129185,0.0489972,'1',0),(56,'api/example/users/22','delete','a:2:{s:2:\"id\";s:2:\"22\";s:97:\"{\r\n__\"name\":_\"John_XX\",\r\n__\"email\":_\"john@example_com\",\r\n__\"fact\":_\"Loves_coding\",\r\n__\"hobbies\":_\";a:1:{s:173:\"\r\n    {\r\n      \"id\": \"1\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"AAAA\"\r\n    },\r\n    {\r\n      \"id\": \"2\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"BBBB\"\r\n    }\r\n  \";s:0:\"\";}}','','127.0.0.1',1496129205,0.194541,'1',204),(57,'api/example/users/22','delete','a:2:{s:2:\"id\";s:2:\"22\";s:97:\"{\r\n__\"name\":_\"John_XX\",\r\n__\"email\":_\"john@example_com\",\r\n__\"fact\":_\"Loves_coding\",\r\n__\"hobbies\":_\";a:1:{s:173:\"\r\n    {\r\n      \"id\": \"1\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"AAAA\"\r\n    },\r\n    {\r\n      \"id\": \"2\",\r\n      \"customer_id\": \"1\",\r\n      \"hobbies\": \"BBBB\"\r\n    }\r\n  \";s:0:\"\";}}','','127.0.0.1',1496129218,0.073669,'1',204),(58,'api/example/users/22','delete','a:1:{s:2:\"id\";s:2:\"22\";}','','127.0.0.1',1496129260,0.077739,'1',204),(59,'api/example/users/22','delete','a:1:{s:2:\"id\";s:2:\"22\";}','','127.0.0.1',1496129294,0.085495,'1',204),(60,'api/example/users/22','get','a:1:{s:2:\"id\";s:2:\"22\";}','','127.0.0.1',1496129309,0.141071,'1',404),(61,'api/example/users','get',NULL,'','127.0.0.1',1496129315,0.0739141,'1',200),(62,'api/example/users/21','delete','a:1:{s:2:\"id\";s:2:\"21\";}','','127.0.0.1',1496129340,0.137978,'1',204),(63,'api/example/users','get',NULL,'','127.0.0.1',1496129346,0.071759,'1',200),(64,'api/example/users/19','delete','a:1:{s:2:\"id\";s:2:\"19\";}','','127.0.0.1',1496129396,0.127202,'1',200),(65,'api/example/users','get',NULL,'','127.0.0.1',1496191816,0.076838,'1',200),(66,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496191887,0.0885398,'1',0),(67,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496191955,0.110837,'1',0),(68,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496191989,0.241593,'1',200),(69,'api/example/users','get',NULL,'','127.0.0.1',1496192013,0.106055,'1',200),(70,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496192070,0.186649,'1',200),(71,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496192137,0.104844,'1',0),(72,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496192177,0.133644,'1',0),(73,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496192189,0.101151,'1',0),(74,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496192237,0.240928,'1',200),(75,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"1\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"2\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496192249,0.203525,'1',200),(76,'api/example/users','get',NULL,'','127.0.0.1',1496192308,0.0773909,'1',200),(77,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"9\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496192353,0.203109,'1',200),(78,'api/example/users','get',NULL,'','127.0.0.1',1496193339,0.071697,'1',200),(79,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:3:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:1:\"9\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:2;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496193361,0.113544,'1',0),(80,'api/example/users','get',NULL,'','127.0.0.1',1496193426,0.168796,'1',200),(81,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496193445,0.105406,'1',0),(82,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496193806,0.101265,'1',0),(83,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496193843,0.128615,'1',0),(84,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496193884,0.125421,'1',0),(85,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496193891,0.234174,'1',0),(86,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496193922,0.222062,'1',0),(87,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496194029,0.178115,'1',0),(88,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496194060,0.19086,'1',0),(89,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496194094,0.170164,'1',0),(90,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:1:\"8\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:8:\"AAAADDDD\";}i:1;a:3:{s:2:\"id\";s:2:\"10\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:7:\"BBBBCCC\";}}}','','127.0.0.1',1496195682,0.272937,'1',200),(91,'api/example/users','get',NULL,'','127.0.0.1',1496197092,0.595644,'1',200),(92,'api/example/users','get',NULL,'','127.0.0.1',1496197120,0.096559,'1',200),(93,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}','','127.0.0.1',1496197145,0.517957,'1',200),(94,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}','','127.0.0.1',1496197212,0.191146,'1',200),(95,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}','','127.0.0.1',1496197256,0.114279,'1',200),(96,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}','','127.0.0.1',1496197300,0.135532,'1',200),(97,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:2:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}}}','','127.0.0.1',1496197451,0.435196,'1',200),(98,'api/example/users/1','put','a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:4:\"John\";s:5:\"email\";s:15:\"john@aaabbb.com\";s:4:\"fact\";s:16:\"Loves coding XXX\";s:7:\"hobbies\";a:3:{i:0;a:3:{s:2:\"id\";s:2:\"14\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"AAAADDDDEEE\";}i:1;a:3:{s:2:\"id\";s:2:\"15\";s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:10:\"BBBBCCCDDD\";}i:2;a:2:{s:11:\"customer_id\";s:1:\"1\";s:7:\"hobbies\";s:11:\"EEEEECCCDDD\";}}}','','127.0.0.1',1496197488,0.229864,'1',200),(99,'api/example/users/1','get','a:1:{s:2:\"id\";s:1:\"1\";}','','127.0.0.1',1496199374,0.068589,'1',200),(100,'api/example/users','get',NULL,'','127.0.0.1',1496199395,0.073669,'1',200),(101,'api/example/users','get',NULL,'','127.0.0.1',1496199405,0.0735459,'1',200),(102,'api/example/users','get',NULL,'','127.0.0.1',1496993395,0.209022,'1',200);

/*Table structure for table `menu_section` */

DROP TABLE IF EXISTS `menu_section`;

CREATE TABLE `menu_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_section` char(50) CHARACTER SET latin1 NOT NULL,
  `urutan` int(11) DEFAULT NULL,
  `icons` varchar(255) DEFAULT NULL,
  `status` enum('AKTIF','NON-AKTIF') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `menu_section` */

insert  into `menu_section`(`id`,`nama_section`,`urutan`,`icons`,`status`,`created_at`,`updated_at`) values (1,'Laporan',3,'glyphicon glyphicon-file','AKTIF','2017-11-17 08:58:36',NULL),(2,'Master',1,'glyphicon glyphicon-play-circle','AKTIF','2017-11-17 08:58:32',NULL),(3,'Transaksi',2,'glyphicon glyphicon-tasks','AKTIF','2017-11-17 08:58:34',NULL);

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL,
  `section` int(11) DEFAULT NULL,
  `nama_menu` varchar(255) CHARACTER SET latin1 NOT NULL,
  `url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `icons` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `urutan` int(11) DEFAULT NULL,
  `status` enum('AKTIF','NON-AKTIF') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `group_id` (`group_id`),
  KEY `section` (`section`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`section`) REFERENCES `menu_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `menus` */

insert  into `menus`(`id`,`parent_id`,`group_id`,`section`,`nama_menu`,`url`,`icons`,`urutan`,`status`) values (1,0,1,2,'Barang','master/barang','glyphicon glyphicon-th',1,'AKTIF'),(2,0,1,2,'Customers','master/customers','glyphicon glyphicon-th-list',2,'AKTIF'),(3,0,1,2,'Menu 3','#','glyphicon glyphicon-road',3,'AKTIF'),(4,0,1,3,'Menu 4','#','glyphicon glyphicon-cloud',4,'AKTIF'),(5,4,1,3,'Menu 5','#','glyphicon glyphicon-list-alt',1,'AKTIF'),(6,4,1,3,'Menu 6','#','glyphicon glyphicon-barcode',2,'AKTIF'),(7,0,1,3,'Menu 7','#','glyphicon glyphicon-retweet',5,'AKTIF'),(8,5,1,3,'Menu 8','#','glyphicon glyphicon-folder-close',1,'AKTIF');

/*Table structure for table `misc` */

DROP TABLE IF EXISTS `misc`;

CREATE TABLE `misc` (
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `misc` */

insert  into `misc`(`key`,`value`) values ('password','y$ErQlCj/Mo10il.FthAm0WOjYdf3chZEGPFqaPzjqOX2aj2uYf5Ihq');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_login` tinyint(1) NOT NULL DEFAULT '0',
  `last_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`,`is_login`,`last_ip`) values (1,'127.0.0.1','administrator','$2y$08$G0h47xFzvBDD3DjwWD13XeCfwGuZgqtSodh5ARhDJLLWPRv0jSgfG','','admin@admin.com','',NULL,NULL,NULL,1268889823,1532492339,1,'Administrator','','ADMIN','0',0,'127.0.0.1'),(2,'172.17.0.1','coba@coba.com','$2y$08$uGrWVA6PAMqe.5nbGjBpvufetRdq24dM/3rRE5XbJVxyaLYXE3LYa',NULL,'coba@coba.com',NULL,NULL,NULL,NULL,1503046181,1503047865,1,'coba','coba','','',0,NULL);

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `users_groups` */

insert  into `users_groups`(`id`,`user_id`,`group_id`) values (1,1,1),(2,1,2),(3,2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
