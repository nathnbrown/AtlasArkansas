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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table roadtriparkansas.category: ~6 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
REPLACE INTO `category` (`CATEGORY_ID`, `CATEGORY_NAME`) VALUES
	(1, 'Historical Markers'),
	(2, 'Roadside Attractions'),
	(3, 'Waterfalls'),
	(4, 'Caves'),
	(5, 'Movie Sites'),
	(6, 'Legends');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table roadtriparkansas.place: ~6 rows (approximately)
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
REPLACE INTO `place` (`PLACE_ID`, `NAME`, `LATITUDE`, `LONGITUDE`, `DESCRIPTION`, `URL`, `CATEGORY_ID`) VALUES
	(1, 'Camp Shaver', 36.258050, -90.991940, 'Established to train troops near Pocahontas, Camp Shaver was the seventh largest regiment in Arkansas with over 1200 men.', ' ', 1),
	(2, 'Confederate Capitol', 33.776458, -93.681684, 'When Union troops occupied Little Rock in 1863, the Conferderate goverment relocated to Washington, which served as the capitol until Oct. 2 1864.', ' ', 1),
	(3, 'The Gurdon Light', 33.915278, 93.155278, 'An ominous floating light seen near railroad tracks in a wooded area of Gurdon, said to be the lantern light of William McClain, a railroad foreman who was killed in the area during a confrontation with one of his workers.', ' ', 6),
	(4, 'DogPatch USA', 36.106780, -93.132210, 'The now abandoned theme park opened in 1968 and was based on the comic strip Lil Abner that was created by cartoonist Al Capp and set in the fictional village of DogPatch.', ' ', 2),
	(5, 'Adkins Canyon Falls', 35.823200, -93.423300, 'Height: 42ft, Hike: Difficult/Bushwack, GPS: Recommended, Parking: Dahl Memorial Trail Head', ' ', 3),
	(6, 'A Painted House', 35.617190, -90.330898, '2003 film based on John Grisham\'s book that depict\'s John\'s childhood in northeast Arkansas.', 'http://www.arkansas.com/things-to-do/entertainment/film-tv/detail.aspx?id=40', 5),
	(7, 'Cosmic Caverns', 36.435800, -93.497300, '1 hour & 15 minute walking tour, the warmest cave in the Ozark\'s at 64 degrees year round', 'http://cosmiccavern.com/', 4),
	(8, 'Mud', 33.031748, -91.158028, 'A 2013 film inspired by river tales of mark Twain and starred by Matthew McConaughey and Reese Witherspoon.', ' ', 5),
	(9, 'Little Rock Central High: 50 Years Later', 34.736794, -92.298468, 'A 2007 documentary following the lives of present day students and focusing on the racial, social, and economic diversity in their lives.', ' ', 5),
	(10, 'Shotgun Stories', 34.619882, -92.025334, '2007 film following a fued between two brothers after he death of their father.', ' ', 5),
	(11, 'Daddy and Them', 34.836235, -92.470588, 'A 2001 film written, directed, and starred by Arkansas\' own Billy Bob Thornton.', ' ', 5),
	(13, 'Avon Cemetary', 34.516685, -93.053171, 'It is said if you drop a rock in the well located in the middle of the cemetary, you\'ll hear the cries of a baby whose mother was drawing water form the well when he/she accidentally fell in and drowned. Local tales also say the mother can be seen running through the cemetary at night.', ' ', 6),
	(14, 'Hold $1 million in your hands', 34.746441, -92.287902, 'An exciting part of the Ar state capitol building tour, visitors are able to go into the treasurer\'s vault to hold and take pictures with the state\'s tax money.', ' ', 2),
	(15, 'Wild Wilderness Drive-Thru', 36.296379, -94.496483, 'Basically.. a drive-thru zoo! 400 acres filled with exotic animals and featuring a petting zoo and picinic area.', ' ', 2),
	(16, 'Snake World', 36.397820, -93.642920, 'A reptile ranch ran by Dale Ertel who provides an educational tour of over 70 species of reptiles(far more than the number of those dispayed at the Litlle Rock Zoo).', ' ', 2),
	(17, 'Old Carollton', 36.262535, 93.321670, 'Settled in 1833 the town was used as a training center for troops until it was almost completely destroyed by Guerilla warfare in 1864.', 'http://www.arkansascivilwar150.com/historical-markers/quot-old-quot-carrollton', 1);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
