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
CREATE DATABASE IF NOT EXISTS `roadtriparkansas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `roadtriparkansas`;

-- Dumping structure for table roadtriparkansas.category
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

-- Dumping data for table roadtriparkansas.place: ~114 rows (approximately)
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
	(12, 'Confederate Camp at Richmond Church and Cemetery', 33.638210, -94.183810, ' ', 'http://www.arkansascivilwar150.com/historical-markers/confederate-camp-at-richmond-richmond-church-and-cemetery', 1),
	(13, 'Avon Cemetary', 34.516685, -93.053171, 'It is said if you drop a rock in the well located in the middle of the cemetary, you\'ll hear the cries of a baby whose mother was drawing water form the well when he/she accidentally fell in and drowned. Local tales also say the mother can be seen running through the cemetary at night.', ' ', 6),
	(14, 'Hold $1 million in your hands', 34.746441, -92.287902, 'An exciting part of the Ar state capitol building tour, visitors are able to go into the treasurer\'s vault to hold and take pictures with the state\'s tax money.', ' ', 2),
	(15, 'Wild Wilderness Drive-Thru', 36.296379, -94.496483, 'Basically.. a drive-thru zoo! 400 acres filled with exotic animals and featuring a petting zoo and picinic area.', ' ', 2),
	(16, 'Snake World', 36.397820, -93.642920, 'A reptile ranch ran by Dale Ertel who provides an educational tour of over 70 species of reptiles(far more than the number of those dispayed at the Litlle Rock Zoo).', ' ', 2),
	(17, 'Old Carollton', 36.262535, 93.321670, 'Settled in 1833 the town was used as a training center for troops until it was almost completely destroyed by Guerilla warfare in 1864.', 'http://www.arkansascivilwar150.com/historical-markers/quot-old-quot-carrollton', 1),
	(18, 'Bower\'s Hollow Falls', 35.854300, -93.434600, 'Height: 56ft, Hike: Difficult bushwack, GPS: Highly recommended, Parking: Kapark Cemetary', ' ', 3),
	(19, 'Cathedral Falls', 36.103320, -92.403600, 'Height: 87ft, Hike: Difficult bushwack, GPS: Required, Parking: Push Myn. Fire tower', ' ', 3),
	(20, 'Compton\'s Double Falls', 35.879300, -93.462570, 'Height: 39ft, Hike: Medium bushwack, GPS: Helpful, Parking: none specified', ' ', 3),
	(21, 'Cougar\'s Falls', 36.040550, -92.376850, 'Height: 77ft, Hike: easy bushwack, GPS: Helpful, Parking: none specified', ' ', 3),
	(22, 'Dewey Canyon Falls', 36.090580, -92.347380, 'Height: 88ft, Hike: easy bushwack, GPS: Not needed, Parking: none specified', ' ', 3),
	(23, 'Diamond Falls', 36.071670, -93.309460, 'Height: 148ft, Hike: difficult bushwack, GPS: Not needed, Parking: Compton Trailhead', ' ', 3),
	(24, 'Eden Falls', 36.017520, -93.387300, 'Height: 53ft, Hike: easy, GPS: Not needed, Parking: Lost Valley Campground', ' ', 3),
	(25, 'Fishtrap Hollow Falls', 36.064950, -93.298870, 'Height: 83ft, Hike: difficult bushwack, GPS: Highly recommended, Parking: Compton Trailead', ' ', 3),
	(26, 'Funnel Falls', 36.069750, -92.438400, 'Height: 52ft, Hike: medium, GPS: Helpful, Parking: none specified', ' ', 3),
	(27, 'Hedge\'s Pouroff', 35.944950, -93.417050, 'Height: 113ft, Hike: difficult, GPS: Not needed, Parking: none specified', ' ', 3),
	(28, 'Helen\'s Pouroff', 36.096880, -92.393100, 'Height: 71ft, Hike: difficult, GPS: required, Parking: Push Mtn. Fire Tower', ' ', 3),
	(29, 'Hemmed-In Hollow', 36.072130, -92.307530, 'Height: 209ft, Hike: difficult, GPS: not needed, Parking: Compton Trailhead', ' ', 3),
	(30, 'Paradise Falls', 35.881180, -93.393100, 'Height: 32ft, Hike: difficult, GPS: recommended, Parking: none specified', ' ', 3),
	(31, 'Thunder Canyon Falls', 36.084600, -93.254280, 'Height: 71ft, Hike: medium, GPS: recommended, Parking: Erbie Church', ' ', 3),
	(32, 'Twin Falls at Richland Creek', 35.805820, -92.964070, 'Height: 19ft, Hike: difficult, GPS: recommended, Parking: Hill Cemetary', ' ', 3),
	(33, 'Triple Falls', 36.054700, -93.258300, 'Height: 48ft , Hike: easy, GPS: not needed, Parking: none specified', ' ', 3),
	(34, 'Tunnel Cave Falls', 36.029480, -93.287570, 'Height: 31ft , Hike: difficult, GPS: helpful, Parking: Kyle\'s Landing Campground', ' ', 3),
	(35, 'Devil\'s Canyon Falls', 35.637580, -94.034880, 'Height: 63ft , Hike: difficult, GPS: recommended, Parking: none spcified', ' ', 3),
	(36, 'Dockery Gap Falls', 35.720520, -94.017170, 'Height: 36ft , Hike: difficult, GPS: recommended, Parking: none specified', ' ', 3),
	(37, 'Forever Falls', 35.591880, -93.189150, 'Height: 47ft, Hike: difficult, GPS: recommended, Parking: none specified', ' ', 3),
	(38, 'Glory Hole', 35.822100, -93.393520, 'Height: 31ft, Hike: medium, GPS: not needed , Parking: none specified', ' ', 3),
	(39, 'High Bank Twins', 35.680770, -93.686940, 'Height: 71ft, Hike: easy, GPS: not needed, Parking: High Bank Canoe Access', ' ', 3),
	(40, 'Kings Bluff Falls', 35.724800, -93.025120, 'Height: 114ft, Hike: easy, GPS: not needed, Parking: Pedestal Rocks Scenic Trailhead', ' ', 3),
	(41, 'Kings River Falls', 35.901900, -93.574430, 'Height: 10ft, Hike: easy, GPS: not needed, Parking: Williams Cemetary', ' ', 3),
	(42, 'Steele Falls', 36.017280, -92.179630, 'Height: 66ft, Hike: medium, GPS: not needed, Parking: none specified', ' ', 3),
	(43, 'Murray Falls', 35.743280, -93.807730, 'Height: 37ft, Hike: medium, GPS: helpful , Parking: Cherry Bend Trailhead', ' ', 3),
	(44, 'Sweden Creek Falls', 35.971450, -93.459150, 'Height: 81ft, Hike: medium, GPS: helpful, Parking: none specified', ' ', 3),
	(45, 'Tea Kettle Falls', 36.266330, -93.714870, 'Height: 46ft, Hike: medium, GPS: helpful, Parking: none specified', ' ', 3),
	(46, 'Cossatot Falls', 34.319470, -94.226770, 'Height: 33ft, Hike: easy, GPS: not needed, Parking: Cossatot Falls Campground', ' ', 3),
	(47, 'Little Missouri Falls', 34.421620, -93.918750, 'Height: 2ft, Hike: easy, GPS: not needed, Parking: Little Missourri Picinic Area', ' ', 3),
	(48, 'Slate Falls', 34.983300, -94.271740, 'Height: 54ft, Hike: medium-difficult, GPS: recommended, Parking: none specified', ' ', 3),
	(49, 'Quigley\'s Castle', 36.346980, -93.757826, 'The dream home of Elise Quigley (1910-1984) who\'s grandchildren now keep up the unique property and invite visitors to wander through her perennial garden of over 400 varieties of flowers. You can also view her outstanding butterfly, arrrowhead, and fossil collections.', ' ', 2),
	(50, 'Ozark Medieval Fortres', 36.420013, -92.917544, 'Abandoned and requiring a buyer or investor to be functonal, the Ozark Medieval Fortress is a project that was designed to construct an accurate replica of a 13th century French castle using only materials and techniques appropriate for that era.', ' ', 2),
	(51, 'The Old Mill', 34.791564, -92.250318, 'Appearing in the opening scene of the renowned classic \'Gone with the Wind\'(1939), this beautiful work of art is authentic replicaof an old water powered grist mill.', ' ', 2),
	(52, 'Homebuilt Razorback', 36.381902, -93.595175, 'With stubby and a fierce, catoonish face this homemade monster is just begging for a photo op.', ' ', 2),
	(53, 'Terra Studios', 35.839040, -93.978486, 'Being the home of the Original Bluebird of Happiness, with glassblowing demonstrations, a vast gallery,and an Art Park filled with sculptures, murals, art installations, and fountains, this is the ideal stop for art enthusiasts of all time.', ' ', 2),
	(54, 'NASCAR Mark Martin Museum', 35.713524, -91.631681, 'A state of the art museum woth an ellaborate display of several past cars and pieces of NASCAR history with hi-tech mantrons that tell the story of each piece.', ' ', 2),
	(55, 'Giant Beer Can', 35.312001, -94.198478, 'Farmer and Budweiser lover Earle Harris Sr. painted one of his silos to look like a giant can of the brew circa 1975-76. Located southwest of town on the southeast corner of hwy 22 and 96.', ' ', 2),
	(56, 'Ozark\'s Largest Rocking Chair', 36.391440, -93.731189, 'Standing 8ft tall and 5ft wide a picturein this enormous rocker is a must', ' ', 2),
	(57, 'Maxwell Blade\'s Odditorium and Curiosities', 34.518277, -93.055036, 'A museum of over 300 oddities and rare exhibits.', ' ', 2),
	(58, 'Billy Bass Asoption Center', 34.747202, -92.265109, 'Filled with hundreds of these annoying novelties, this is a place where poor Billy Bass come to die(sit tacked to a wall inevitably). Most brung in by wives who tell workers \'If he comes for it, tell him it isn\'t here.\'', ' ', 2),
	(59, 'Peppersauce Ghost Town', 36.118086, -92.141312, 'Abandoned East Calico, a street lined with ghostly overgrown buildings that have seen better days, markers in front of many tell the stories of their past.', ' ', 6),
	(60, 'Rush Ghost Town', 36.132500, -92.571100, 'Population ), Rush was once a prosperousmining community, now completely abandoned, visitors are just asked to be respectful of the structures. ', ' ', 6),
	(61, 'Cresent Hotel', 36.408300, -93.737300, 'Opened first as a resort, second as a college for girls, then as a hospital and fianally as the hotel we know today. Much of the legends surroun the hospital days of the hotel when the corrupt \'doctor\' Norman Baker killed hundreds of cancer patients with his \'cure\'.', ' ', 6),
	(62, 'Boggy creek Monster', 33.261272, -93.885500, 'Best described as a big-foot type creature with numerous claimed sightings that gave rise to the movie The Boggy Creek Monster and it\'s sequel.', ' ', 6),
	(63, 'Dehorn\'s Grave', 35.225683, -91.221055, 'The haunted grave of Reverend William Dehorn who was a known fortune teller from the late 1800\'s to the early 1900\'s. His head stone sits away from he rest in a very rural African Americsn cemetary where it is surrounded by sany ground and large cacti.', ' ', 6),
	(64, 'Gaudy Goddess of Feminine Cosmic Energy', 36.402420, -93.737100, 'Aza, which is short for Adora Zerlina Astra was built in late 2012 by sculptor Bruce Anderson. She is a non-denominational goddess, a composite of various deities that Anderson says celebrates the feminine energy of the cosmos.', ' ', 2),
	(65, 'Christ of the Ozarks', 36.402422, -93.737105, 'Christ of the Ozarks statue is a monumental sculpture of Jesus located near Eureka Springs, Arkansas, atop Magnetic Mountain. It was erected in 1966 as a \'Sacred Project\' by Gerald L. K. Smith and stands 65.5 feet high.', ' ', 2),
	(66, '\'Old\' Carrollton', 36.262534, -93.321667, ' ', 'http://www.arkansascivilwar150.com/historical-markers/quot-old-quot-carrollton', 1),
	(67, '11th Ar Infantry Regiment', 34.579003, -92.588818, ' ', 'http://www.arkansascivilwar150.com/historical-markers/11th-arkansas-infantry-regiment', 1),
	(68, '14th Arkansas Infantry, C.S.A.', 36.413965, -92.904779, ' ', 'http://www.arkansascivilwar150.com/historical-markers/14th-arkansas-infantry-c-s-a', 1),
	(69, '1st Arkansas Cavalry (U.S.)', 36.461710, -93.753050, ' ', 'http://www.arkansascivilwar150.com/historical-markers/1st-arkansas-cavalry-u-s', 1),
	(70, '1st Kansas Colored Infantry', 33.651760, -92.969030, ' ', 'http://www.arkansascivilwar150.com/historical-markers/1st-kansas-colored-infantry', 1),
	(71, '5th Arkansas Infantry Regiment', 36.129480, -90.538700, ' ', 'http://www.arkansascivilwar150.com/historical-markers/5th-arkansas-infantry-regiment', 1),
	(72, 'Action at Ashley\'s Station', 34.782782, -91.747759, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-ashleys-station', 1),
	(73, 'Action at Cotton Plant', 35.007517, -91.258145, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-cotton-plant', 1),
	(74, 'Action At Dardanelle', 35.237490, -93.163370, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-dardanelle', 1),
	(75, 'Action at Des Arc Bayou', 35.203280, -91.777910, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-des-arc-bayou', 1),
	(76, 'Action at Fitzhugh\'s Woods', 35.341800, -91.357200, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-fitzhughs-woods', 1),
	(77, 'Action at Moscow/Moscow Church and Cemtery', 33.776760, -93.366140, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-moscow-moscow-church-and-cemtery', 1),
	(78, 'Action at Salem', 36.495950, -91.536070, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-salem', 1),
	(79, 'Action At Whitney\'s Lane', 35.246070, -91.675760, ' ', 'http://www.arkansascivilwar150.com/historical-markers/action-at-whitneys-lane', 1),
	(80, 'Arkansas in the Battle of New Market', 34.737190, -92.278490, ' ', 'http://www.arkansascivilwar150.com/historical-markers/arkansas-in-the-battle-of-new-market', 1),
	(81, 'Arkansas Military Institute/Tulip in the Civil War', 34.086060, -92.654700, ' ', 'http://www.arkansascivilwar150.com/historical-markers/arkansas-military-institute-tulip-in-the-civil-war', 1),
	(82, 'Ar Peace Society/Federal Raids', 35.906970, -92.629630, ' ', 'http://www.arkansascivilwar150.com/historical-markers/arkansas-peace-society-federal-raids-on-burrowville', 1),
	(83, 'Ashley County in the Civil War', 33.227000, -91.795740, ' ', 'http://www.arkansascivilwar150.com/historical-markers/ashley-county-in-the-civil-war-third-arkansas-infantry-regiment', 1),
	(84, 'Austin in the Civil War', 34.983880, -91.965280, ' ', 'http://www.arkansascivilwar150.com/historical-markers/austin-in-the-civil-war', 1),
	(85, 'Batesville During The Civil War', 35.772450, -91.644140, ' ', 'http://www.arkansascivilwar150.com/historical-markers/batesville-during-the-civil-war', 1),
	(86, 'Battery A', 34.536240, -90.591700, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battery-a', 1),
	(87, 'Battery B', 34.533580, -90.597690, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battery-b', 1),
	(88, 'Battery D', 34.519420, -90.595500, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battery-d', 1),
	(89, 'Battle of Arkansas Post', 34.033110, -91.373540, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battle-of-arkansas-post', 1),
	(90, 'Battle of Cane Hill', 35.908890, -94.396450, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battle-of-cane-hill', 1),
	(91, 'Battle of Jenkins Ferry', 34.300210, -92.414080, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battle-of-jenkins-ferry', 1),
	(92, 'Mills/Marks Family Experience', 33.785290, -92.244170, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battle-of-marks-mills-marks-family-experience', 1),
	(93, 'Battle of Maysville', 36.404030, -94.602060, ' ', 'http://www.arkansascivilwar150.com/historical-markers/battle-of-maysville', 1),
	(94, 'Bayou Metre Hornets', 34.880380, -92.108980, ' ', 'http://www.arkansascivilwar150.com/historical-markers/bayou-metre-hornets', 1),
	(95, 'Berryville in the Civil War', 36.364560, -93.567490, ' ', 'http://www.arkansascivilwar150.com/historical-markers/berryville-in-the-civil-war', 1),
	(96, 'Boone-Murphy House/Union Strategy and Pine Bluff', 34.225920, -92.010150, ' ', 'http://www.arkansascivilwar150.com/historical-markers/boone-murphy-house-union-strategy-and-pine-bluff', 1),
	(97, 'Bradley County Troops', 33.616600, -92.065500, ' ', 'http://www.arkansascivilwar150.com/historical-markers/bradley-county-troops', 1),
	(98, 'Bridging the Ouachita River', 34.381940, -92.826450, ' ', 'http://www.arkansascivilwar150.com/historical-markers/bridging-the-ouachita-river', 1),
	(99, 'Brig. Gen. Dandridge McRae', 35.253290, -91.731340, ' ', 'http://www.arkansascivilwar150.com/historical-markers/brig-gen-dandridge-mcrae', 1),
	(100, 'C.S.S. Pontchartrain', 34.752750, -92.268610, ' ', 'http://www.arkansascivilwar150.com/historical-markers/c-s-s-pontchartrain', 1),
	(101, 'Cadron in the Civil War', 35.107280, -92.546130, ' ', 'http://www.arkansascivilwar150.com/historical-markers/cadron-in-the-civil-war', 1),
	(102, 'Camp Halleck at Osage Springs', 36.314540, -94.179780, ' ', 'http://www.arkansascivilwar150.com/historical-markers/camp-halleck-at-osage-springs', 1),
	(103, 'Camp Jackson/Confederate Dead', 36.390400, -94.508560, ' ', 'http://www.arkansascivilwar150.com/historical-markers/camp-jackson-confederate-dead', 1),
	(104, 'Camp Shaver', 36.258050, -90.991000, ' ', 'http://www.arkansascivilwar150.com/historical-markers/camp-shaver', 1),
	(105, 'Camp Walker', 36.410090, -94.568730, ' ', 'http://www.arkansascivilwar150.com/historical-markers/camp-walker', 1),
	(106, 'Capture of Missouri \'Swamp Fox\'', 36.261256, -90.969700, ' ', 'http://www.arkansascivilwar150.com/historical-markers/capture-of-missouri-swamp-fox', 1),
	(107, 'Center Point', 34.026700, -93.947670, ' ', 'http://www.arkansascivilwar150.com/historical-markers/center-point', 1),
	(108, 'Chalk Bluff in the Civil War', 36.477510, -90.166690, ' ', 'http://www.arkansascivilwar150.com/historical-markers/chalk-bluff-in-the-civil-war', 1),
	(109, 'Civil War Healing', 36.401290, -93.738180, ' ', 'http://www.arkansascivilwar150.com/historical-markers/civil-war-healing', 1),
	(110, 'Civil War in Fulton County', 36.495950, -91.536070, ' ', 'http://www.arkansascivilwar150.com/historical-markers/civil-war-in-fulton-county', 1),
	(111, 'Clarendon in the Civil War', 34.413460, -91.184820, ' ', 'http://www.arkansascivilwar150.com/historical-markers/clarendon-in-the-civil-war', 1),
	(112, 'Clarksville in the Civil War', 35.470920, -93.465100, ' ', 'http://www.arkansascivilwar150.com/historical-markers/clarksville-in-the-civil-war', 1),
	(113, 'Clash at Whitten\'s Mill', 34.315100, -92.552280, ' ', 'http://www.arkansascivilwar150.com/historical-markers/clash-at-whittens-mill', 1),
	(114, 'Confederate and Union Occupation of Fort Smith', 35.388050, -94.428770, ' ', 'http://www.arkansascivilwar150.com/historical-markers/confederate-and-union-occupation-of-fort-smith', 1),
	(115, 'Confederate Capital', 33.776450, -93.681600, ' ', 'http://www.arkansascivilwar150.com/historical-markers/confederate-capital', 1);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
