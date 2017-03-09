-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.20-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for roadtriparkansas
DROP DATABASE IF EXISTS `roadtriparkansas`;
CREATE DATABASE IF NOT EXISTS `roadtriparkansas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `roadtriparkansas`;

-- Dumping structure for table roadtriparkansas.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` char(50) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table roadtriparkansas.category: ~8 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
REPLACE INTO `category` (`CATEGORY_ID`, `CATEGORY_NAME`) VALUES
	(1, 'Historical'),
	(2, 'Landmarks/Roadside Attractions'),
	(3, 'Waterfalls'),
	(4, 'Caves'),
	(5, 'ScenicRoutes'),
	(6, 'Movie Sites'),
	(7, 'Oddities'),
	(8, 'Creepy');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table roadtriparkansas.photo
DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `PHOTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PHOTO_DATA` longblob NOT NULL,
  `PLACE_ID` int(11) NOT NULL,
  PRIMARY KEY (`PHOTO_ID`),
  KEY `place_photo_fk` (`PLACE_ID`),
  CONSTRAINT `place_photo_fk` FOREIGN KEY (`PLACE_ID`) REFERENCES `place` (`PLACE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table roadtriparkansas.photo: ~0 rows (approximately)
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

-- Dumping structure for table roadtriparkansas.place
DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `PLACE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` char(50) NOT NULL,
  `LATITUDE` decimal(9,6) NOT NULL,
  `LONGITUDE` decimal(9,6) NOT NULL,
  `DESCRIPTION` varchar(300) NOT NULL,
  `URL` text NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`PLACE_ID`),
  KEY `category_place_fk` (`CATEGORY_ID`),
  CONSTRAINT `category_place_fk` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table roadtriparkansas.place: ~0 rows (approximately)
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
REPLACE INTO `place` (`PLACE_ID`, `NAME`, `LATITUDE`, `LONGITUDE`, `DESCRIPTION`, `URL`, `CATEGORY_ID`) VALUES
	(1, 'Chaffee Barbershop', 35.310225, -94.303588, 'This restored WWII barbershop us wgere thousandsof US soldiers recieved their first buzz, including Elvis Presley in 1958 when reporting for duty.', ' ', 1),
	(2, 'Northern Ohio School', 35.279722, -90.557778, 'Now fully restored, this schoolhouse was an essential part of the African American mill workers community.', ' ', 1),
	(3, 'The Gallows of Hanging Judge Parker', 35.387619, -94.429082, 'A tour of Judge Parkers courtroom, jail, office, and gallows give you a glance at the past and how the judge senteced over 150 men to hang.', ' ', 1);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
