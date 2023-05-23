-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.10.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para projecte
CREATE DATABASE IF NOT EXISTS `projecte` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `projecte`;

-- Volcando estructura para tabla projecte.actors
CREATE TABLE IF NOT EXISTS `actors` (
  `id_actor` int(11) NOT NULL,
  `nomactor` varchar(100) NOT NULL,
  `nacionalitat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.actors: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.actuen
CREATE TABLE IF NOT EXISTS `actuen` (
  `id_actor` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `protagonista` tinyint(1) NOT NULL,
  KEY `actuen_ibfk_1` (`id_actor`),
  KEY `actuen_ibfk_2` (`id_produccio`),
  CONSTRAINT `actuen_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actuen_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `pel_licules` (`id_produccio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.actuen: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `DNI` varchar(50) NOT NULL,
  `edat_data_naixement_` date NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `nacionalitat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` varchar(50) NOT NULL,
  `num_tarjeta` varchar(50) NOT NULL,
  `num_compte_banc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.clients: ~2 rows (aproximadamente)
INSERT INTO `clients` (`id_client`, `Nom`, `DNI`, `edat_data_naixement_`, `adresa`, `nacionalitat`, `email`, `telefon`, `num_tarjeta`, `num_compte_banc`) VALUES
	(1, 'jordi', '47382938L', '1029-12-02', 'xcvxcv', 'Catalana', 'zeusjan333@yahoo.es', '666666666', '6567567567567567', NULL),
	(2, 'fasf', '34343434K', '1987-02-22', 'sdfsdf', 'Catalana', 'sdfsdf@sdsdf.com', '444444444', '6567567567567567', NULL);

-- Volcando estructura para tabla projecte.compte
CREATE TABLE IF NOT EXISTS `compte` (
  `id_compte` int(11) NOT NULL AUTO_INCREMENT,
  `usuari` varchar(50) NOT NULL,
  `contrassenya` varchar(50) NOT NULL,
  `data_alta` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_client` int(11) NOT NULL,
  `id_modalitat` int(11) NOT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `compte_ibfk_1` (`id_client`),
  KEY `compte_ibfk_2` (`id_modalitat`),
  CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`id_modalitat`) REFERENCES `modalitat` (`id_modalitat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.compte: ~2 rows (aproximadamente)
INSERT INTO `compte` (`id_compte`, `usuari`, `contrassenya`, `data_alta`, `id_client`, `id_modalitat`) VALUES
	(1, 'prova', 'prova', '2023-05-22 22:37:34', 1, 2),
	(2, 'prova1', 'prova', '2023-05-22 22:40:35', 2, 3);

-- Volcando estructura para tabla projecte.director
CREATE TABLE IF NOT EXISTS `director` (
  `id_director` int(11) NOT NULL,
  `nomdirector` varchar(100) NOT NULL,
  `nacionalitat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.director: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.dirigeix_episodi
CREATE TABLE IF NOT EXISTS `dirigeix_episodi` (
  `id_director` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `id_episodi` int(11) NOT NULL,
  PRIMARY KEY (`id_director`,`id_produccio`,`id_episodi`),
  KEY `dirigeix_episodi_ibfk_2` (`id_produccio`,`id_episodi`),
  CONSTRAINT `dirigeix_episodi_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dirigeix_episodi_ibfk_2` FOREIGN KEY (`id_produccio`, `id_episodi`) REFERENCES `episodi` (`id_produccio`, `id_episodi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.dirigeix_episodi: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.dirigeix_pel_licula
CREATE TABLE IF NOT EXISTS `dirigeix_pel_licula` (
  `id_director` int(11) DEFAULT NULL,
  `id_produccio` int(11) DEFAULT NULL,
  KEY `dirigeix_pel_licula_ibfk_1` (`id_director`),
  KEY `dirigeix_pel_licula_ibfk_2` (`id_produccio`),
  CONSTRAINT `dirigeix_pel_licula_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dirigeix_pel_licula_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `pel_licules` (`id_produccio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.dirigeix_pel_licula: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.episodi
CREATE TABLE IF NOT EXISTS `episodi` (
  `id_produccio` int(11) NOT NULL,
  `id_episodi` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `durada` varchar(10) NOT NULL,
  PRIMARY KEY (`id_produccio`,`id_episodi`),
  CONSTRAINT `episodi_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `series` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.episodi: ~264 rows (aproximadamente)
INSERT INTO `episodi` (`id_produccio`, `id_episodi`, `nom`, `durada`) VALUES
	(1, 1, 'Que se lo coman ellos', '20:10'),
	(1, 2, 'No sin mi hija', '20:10'),
	(1, 3, 'La madre del sibato', '20:10'),
	(1, 4, 'El padrino de Gob', '20:10'),
	(2, 1, 'BoJack Horseman: The BoJack Horseman Story', '25:36'),
	(2, 2, 'BoJack Horseman: Zoës and Zeldas', '25:37'),
	(2, 3, 'BoJack Horseman: The Telescope', '25:36'),
	(2, 4, 'BoJack Horseman: Live Fast, Diane Nguyen', '25:36'),
	(3, 1, 'Club de Cuervos: Bienvenidos al imperio', '47:06'),
	(3, 2, 'Club de Cuervos: Yo soy Falcón', '45:22'),
	(3, 3, 'Club de Cuervos: El corazón de una ballena', '44:22'),
	(3, 4, 'Club de Cuervos: Háganse a un lado', '43:22'),
	(4, 1, 'F Is for Family: The Bleedin in Sweden', '27:20'),
	(4, 2, 'F Is for Family: Heavy Sledding', '27:20'),
	(4, 3, 'F Is for Family: The Liars Club', '28:26'),
	(4, 4, 'F Is for Family: Night Shift', '26:55'),
	(5, 1, 'Star Trek: Encounter at Farpoint', '1:32'),
	(5, 2, 'Star Trek: The Naked Now', '46:33'),
	(5, 3, 'Star Trek: Code of Honor', '45:28'),
	(5, 4, 'Star Trek: The Last Outpost', '45:27'),
	(6, 1, 'Summer Heights High: Episode 1', '29:43'),
	(6, 2, 'Summer Heights High: Episode 2', '28:59'),
	(6, 3, 'Summer Heights High: Episode 3', '29:03'),
	(6, 4, 'Summer Heights High: Episode 4', '28:59'),
	(7, 1, 'Unbreakable Kimmy Schmidt: Kimmy Goes Outside!', '24:29'),
	(7, 2, 'Unbreakable Kimmy Schmidt: Kimmy Gets a Job!', '24:28'),
	(7, 3, 'Unbreakable Kimmy Schmidt: Kimmy Goes on a Date!', '24:28'),
	(7, 4, 'Unbreakable Kimmy Schmidt: Kimmy Goes to the Doctor!', '24:29'),
	(8, 1, 'Wet Hot American Summer: Campers Arrive', '29:02'),
	(8, 2, 'Wet Hot American Summer: Lunch', '25:50'),
	(8, 3, 'Wet Hot American Summer: Activities', '26:20'),
	(8, 4, 'Wet Hot American Summer: Auditions', '27:08'),
	(9, 1, 'House: Maternity', '44:11'),
	(9, 2, 'House: TB or Not TB', '44:13'),
	(9, 3, 'House: Guardian Angels', '44:13'),
	(9, 4, 'House: Guardian Angels', '44:10'),
	(10, 1, 'Perdidos: Walkabout', '44:13'),
	(10, 2, 'Perdidos: Everybody Hates Hugo', '44:14'),
	(10, 3, 'Perdidos: Every Man for Himself', '43:56'),
	(10, 4, 'Perdidos: Eggtown', '43:44'),
	(11, 1, 'The Killing: A Soundless Echo', '43:37'),
	(11, 2, 'The Killing: Ogi Jun', '43:37'),
	(11, 3, 'The Killing: Scared and Running', '43:38'),
	(11, 4, 'The Killing: The Good Soldier', '43:39'),
	(12, 1, 'Homeland: Semper I', '49:15'),
	(12, 2, 'Homeland: New Car Smell', '49:02'),
	(12, 3, 'Homeland: Tower of David', '47:43'),
	(12, 4, 'Homeland: Iron in the Fire', '48:37'),
	(13, 1, 'House of Cards: Chapter 4', '47:25'),
	(13, 2, 'House of Cards: Chapter 17', '49:10'),
	(13, 3, 'House of Cards: Chapter 30', '49:28'),
	(13, 4, 'House of Cards: Chapter 43', '49:43'),
	(14, 1, 'Occupied: April', '45:00'),
	(14, 2, 'Occupied: November', '45:00'),
	(14, 3, 'Occupied: March', '45:00'),
	(14, 4, 'Occupied: December', '45:00'),
	(15, 1, 'The Good Wife: Fixed', '43:11'),
	(15, 2, 'The Good Wife: VIP Treatment', '43:10'),
	(15, 3, 'The Good Wife: Dont Haze Me, Bro', '43:10'),
	(15, 4, 'The Good Wife: Here Comes Santa', '43:10'),
	(16, 1, 'The West Wing: Pilot', '43:44'),
	(16, 2, 'The West Wing: Post Hoc, Ergo Propter Hoc', '42:58'),
	(16, 3, 'The West Wing: A Proportional Response', '42:58'),
	(16, 4, 'The West Wing: Five Votes Down', '42:56'),
	(17, 1, 'Narcos: Descenso', '54:14'),
	(17, 2, 'Narcos: The Sword of Simón Bolivar', '49:40'),
	(17, 3, 'Narcos: The Men of Always', '50:11'),
	(17, 4, 'Narcos: The Palace in Flames', '52:07'),
	(18, 1, 'Peaky Blinders: Episode 1', '57:46'),
	(18, 2, 'Peaky Blinders: Episode 2', '58:16'),
	(18, 3, 'Peaky Blinders: Episode 3', '58:48'),
	(18, 4, 'Peaky Blinders: Episode 4', '57:52'),
	(19, 1, 'The Americans: Pilot', '58:41'),
	(19, 2, 'The Americans: The Clock', '47:15'),
	(19, 3, 'The Americans: Gregory', '45:10'),
	(19, 4, 'The Americans: Gregory part Two', '45:10'),
	(20, 1, 'Gotham: Pilot', '43:12'),
	(20, 2, 'Gotham: Selina Kyle', '43:26'),
	(20, 3, 'Gotham: The Balloonman', '42:51'),
	(20, 4, 'Gotham: Arkham', '43:14'),
	(21, 1, 'Helstrom: Mothers Little Helpers', '50:00'),
	(21, 2, 'Helstrom: Viaticum', '50:00'),
	(21, 3, 'Helstrom: The One Who Got Away', '50:00'),
	(21, 4, 'Helstrom: Containment', '50:00'),
	(22, 1, 'Jessica Jones: AKA Ladies Night', '52:00'),
	(22, 2, 'Jessica Jones: AKA Crush Syndrome', '53:00'),
	(22, 3, 'Jessica Jones: AKA It`s Called Whiskey', '54:00'),
	(22, 4, 'Jessica Jones: AKA 99 Friends', '52:00'),
	(23, 1, 'The Flash: City of Heroes', '42:00'),
	(23, 2, 'The Flash: Fastest Man Alive', '42:00'),
	(23, 3, 'The Flash: Things You Can`t Outrun', '42:00'),
	(23, 4, 'The Flash: Going Rogue', '42:00'),
	(24, 1, 'Better Call Saul: Uno', '53:00'),
	(24, 2, 'Better Call Saul: Mijo', '46:00'),
	(24, 3, 'Better Call Saul: Nacho', '48:00'),
	(24, 4, 'Better Call Saul: Hero', '45:00'),
	(25, 1, 'Los campos de la muerte de Texas: Capítulo 1', '44:00'),
	(25, 2, 'Los campos de la muerte de Texas: Capítulo 2', '42:00'),
	(25, 3, 'Los campos de la muerte de Texas: Capítulo 3', '43:00'),
	(25, 4, 'Los campos de la muerte de Texas: Capítulo 4', '45:00'),
	(26, 1, 'Fargo: The Crocodile`s Dilemma', '57:00'),
	(26, 2, 'Fargo: The Rooster Prince', '48:00'),
	(26, 3, 'Fargo: A Muddy Road', '50:00'),
	(26, 4, 'Fargo: Eating the Blame', '58:00'),
	(27, 1, 'The Blacklist: Pilot', '43:00'),
	(27, 2, 'The Blacklist: The Freelancer', '43:00'),
	(27, 3, 'The Blacklist: Wujing', '43:00'),
	(27, 4, 'The Blacklist: The Stewmaker', '43:00'),
	(28, 1, 'Hotel Fawlty: A Touch of Class', '30:00'),
	(28, 2, 'Hotel Fawlty: The Builders', '30:00'),
	(28, 3, 'Hotel Fawlty: The Wedding Party', '30:00'),
	(28, 4, 'Hotel Fawlty: The Hotel Inspectors', '30:00'),
	(29, 1, 'Twin Peaks: Pilot', '94:00'),
	(29, 2, 'Twin Peaks: Episode 2', '46:00'),
	(29, 3, 'Twin Peaks: Episode 3', '47:00'),
	(29, 4, 'Twin Peaks: Episode 4', '48:00'),
	(30, 1, 'Flaked: Westminster', '31:00'),
	(30, 2, 'Flaked: Horizon', '32:00'),
	(30, 3, 'Flaked: Rose', '32:00'),
	(30, 4, 'Flaked: Palms', '30:00'),
	(31, 1, 'Grace & Frankie: The End', '32:00'),
	(31, 2, 'Grace & Frankie: The Credit Cards', '28:00'),
	(31, 3, 'Grace & Frankie: The Dinner', '31:00'),
	(31, 4, 'Grace & Frankie: The Funeral', '27:00'),
	(32, 1, 'Nurse Jackie: Pilot', '27:00'),
	(32, 2, 'Nurse Jackie: Sweet All', '27:00'),
	(32, 3, 'Nurse Jackie: Chicken Soup', '28:00'),
	(32, 4, 'Nurse Jackie: School Nurse', '28:00'),
	(33, 1, 'Orange Is the New Black: I Wasn`t Ready', '59:00'),
	(33, 2, 'Orange Is the New Black: Tit Punch', '55:00'),
	(33, 3, 'Orange Is the New Black: Lesbian Request Denied', '51:00'),
	(33, 4, 'Orange Is the New Black: Imaginary Enemies', '60:00'),
	(34, 1, 'Parenthood: Pilot', '45:00'),
	(34, 2, 'Parenthood: Man vs. Possum', '43:00'),
	(34, 3, 'Parenthood: The Deep End of the Pool', '42:00'),
	(34, 4, 'Parenthood: Wassup', '42:00'),
	(35, 1, 'Rescue Me: Pilot', '53:00'),
	(35, 2, 'Rescue Me: Gay', '46:00'),
	(35, 3, 'Rescue Me: Kansas', '45:00'),
	(35, 4, 'Rescue Me: Rebirth', '46:00'),
	(36, 1, 'Weeds: You Can`t Miss the Bear', '28:00'),
	(36, 2, 'Weeds: Free Goat', '28:00'),
	(36, 3, 'Weeds: Good Shit Lollipop', '27:00'),
	(36, 4, 'Weeds: Fashion of the Christ', '28:00'),
	(37, 1, '24: 12:00 a.m. - 1:00 a.m.', '43:00'),
	(37, 2, '24: 1:00 a.m. - 2:00 a.m.', '43:00'),
	(37, 3, '24: 2:00 a.m. - 3:00 a.m.', '43:00'),
	(37, 4, '24: 3:00 a.m. - 4:00 a.m.', '43:00'),
	(38, 1, 'Arrow: Pilot', '45:00'),
	(38, 2, 'Arrow: Honor Thy Father', '42:00'),
	(38, 3, 'Arrow: Lone Gunmen', '42:00'),
	(38, 4, 'Arrow: An Innocent Man', '42:00'),
	(39, 1, 'La Reina del Sur: Episode 1', '42:00'),
	(39, 2, 'La Reina del Sur: Episode 2', '42:00'),
	(39, 3, 'La Reina del Sur: Episode 3', '42:00'),
	(39, 4, 'La Reina del Sur: Episode 4', '42:00'),
	(40, 1, 'Marco Polo: The Wayfarer', '54:00'),
	(40, 2, 'Marco Polo: The Wolf and the Deer', '57:00'),
	(40, 3, 'Marco Polo: Feast', '53:00'),
	(40, 4, 'Marco Polo: The Fourth Step', '57:00'),
	(41, 1, 'Outlander: Sassenach', '64:00'),
	(41, 2, 'Outlander: Castle Leoch', '64:00'),
	(41, 3, 'Outlander: The Way Out', '64:00'),
	(41, 4, 'Outlander: The Gathering', '64:00'),
	(42, 1, 'Prison Break: Pilot', '44:00'),
	(42, 2, 'Prison Break: Allen', '43:00'),
	(42, 3, 'Prison Break: Cell Test', '43:00'),
	(42, 4, 'Prison Break: Cute Poison', '43:00'),
	(43, 1, 'The Last Kingdom: Episode 1', '59:00'),
	(43, 2, 'The Last Kingdom: Episode 2', '59:00'),
	(43, 3, 'The Last Kingdom: Episode 3', '59:00'),
	(43, 4, 'The Last Kingdom: Episode 4', '59:00'),
	(44, 1, 'Los jóvenes: Episode 1', '50:00'),
	(44, 2, 'Los jóvenes: Episode 2', '50:00'),
	(44, 3, 'Los jóvenes: Episode 3', '50:00'),
	(44, 4, 'Los jóvenes: Episode 4', '50:00'),
	(45, 1, 'Vikings: Rites of Passage', '45:00'),
	(45, 2, 'Vikings: Wrath of the Northmen', '45:00'),
	(45, 3, 'Vikings: Dispossessed', '45:00'),
	(45, 4, 'Vikings: Trial', '45:00'),
	(46, 1, 'Ascension: Night One', '85:00'),
	(46, 2, 'Ascension: Night Two', '85:00'),
	(46, 3, 'Ascension: Night Three', '85:00'),
	(46, 4, 'Ascension: Night Four', '85:00'),
	(47, 1, 'Magnum: I Saw the Sun Rise', '43:00'),
	(47, 2, 'Magnum: From the Head Down', '43:00'),
	(47, 3, 'Magnum: The Woman Who Never Died', '43:00'),
	(47, 4, 'Magnum: Six Paintings, One Frame', '43:00'),
	(48, 1, 'Heroes: Genesis', '45:00'),
	(48, 2, 'Heroes: Don`t Look Back', '43:00'),
	(48, 3, 'Heroes: One Giant Leap', '43:00'),
	(48, 4, 'Heroes: Collision', '43:00'),
	(49, 1, 'Orphan Black: Natural Selection', '44:00'),
	(49, 2, 'Orphan Black: Instinct', '43:00'),
	(49, 3, 'Orphan Black: Variation Under Nature', '43:00'),
	(49, 4, 'Orphan Black: Effects of External Conditions', '44:00'),
	(50, 1, 'Sense8: Limbic Resonance', '67:00'),
	(50, 2, 'Sense8: I Am Also a We', '58:00'),
	(50, 3, 'Sense8: Smart Money Is on the Skinny Bitch', '57:00'),
	(50, 4, 'Sense8: What`s Going On?', '59:00'),
	(51, 1, 'The 100: Pilot', '42:00'),
	(51, 2, 'The 100: Earth Skills', '42:00'),
	(51, 3, 'The 100: Earth Kills', '42:00'),
	(51, 4, 'The 100: Murphy`s Law', '42:00'),
	(52, 1, 'The 4400: Pilot (Part 1)', '42:00'),
	(52, 2, 'The 4400: Pilot (Part 2)', '42:00'),
	(52, 3, 'The 4400: The New and Improved Carl Morrissey', '42:00'),
	(52, 4, 'The 4400: Becoming', '42:00'),
	(53, 1, 'Under the Dome: Pilot', '43:00'),
	(53, 2, 'Under the Dome: The Fire', '43:00'),
	(53, 3, 'Under the Dome: Manhunt', '43:00'),
	(53, 4, 'Under the Dome: Outbreak', '43:00'),
	(54, 1, 'American Horror Story: Pilot', '52:00'),
	(54, 2, 'American Horror Story: Home Invasion', '44:00'),
	(54, 3, 'American Horror Story: Murder House', '47:00'),
	(54, 4, 'American Horror Story: Halloween: Part 1', '43:00'),
	(55, 1, 'Hemlock Grove: Jellyfish in the Sky', '58:00'),
	(55, 2, 'Hemlock Grove: The Angel', '57:00'),
	(55, 3, 'Hemlock Grove: The Order of the Dragon', '53:00'),
	(55, 4, 'Hemlock Grove: In Poor Taste', '47:00'),
	(56, 1, 'Penny Dreadful: Night Work', '58:00'),
	(56, 2, 'Penny Dreadful: Séance', '56:00'),
	(56, 3, 'Penny Dreadful: Resurrection', '54:00'),
	(56, 4, 'Penny Dreadful: Demimonde', '52:00'),
	(57, 1, 'Dragon Ball: Secret of the Dragon Balls', '25:00'),
	(57, 2, 'Dragon Ball: The Emperor`s Quest', '25:00'),
	(57, 3, 'Dragon Ball: The Nimbus Cloud of Roshi', '25:00'),
	(57, 4, 'Dragon Ball: Oolong the Terrible', '25:00'),
	(58, 1, 'The Walking Dead: Days Gone Bye', '67:00'),
	(58, 2, 'The Walking Dead: Guts', '45:00'),
	(58, 3, 'The Walking Dead: Tell It to the Frogs', '44:00'),
	(58, 4, 'The Walking Dead: Vatos', '44:00'),
	(59, 1, 'Z Nation: Puppies and Kittens', '43:00'),
	(59, 2, 'Z Nation: Fracking Zombies', '43:00'),
	(59, 3, 'Z Nation: Philly Feast', '43:00'),
	(59, 4, 'Z Nation: Full Metal Zombie', '43:00'),
	(60, 1, 'Bates Motel: First You Dream, Then You Die', '44:00'),
	(60, 2, 'Bates Motel: Nice Town You Picked, Norma...', '43:00'),
	(60, 3, 'Bates Motel: What`s Wrong with Norman', '43:00'),
	(60, 4, 'Bates Motel: Trust Me', '42:00'),
	(61, 1, 'Breaking Bad: Pilot', '58:00'),
	(61, 2, 'Breaking Bad: Cat`s in the Bag...', '48:00'),
	(61, 3, 'Breaking Bad: ...And the Bag`s in the River', '48:00'),
	(61, 4, 'Breaking Bad: Cancer Man', '48:00'),
	(62, 1, 'Dexter: Dexter', '52:00'),
	(62, 2, 'Dexter: Crocodile', '51:00'),
	(62, 3, 'Dexter: Popping Cherry', '53:00'),
	(62, 4, 'Dexter: Let`s Give the Boy a Hand', '54:00'),
	(63, 1, 'Sons of Anarchy: Pilot', '62:00'),
	(63, 2, 'Sons of Anarchy: Seeds', '60:00'),
	(63, 3, 'Sons of Anarchy: Fun Town', '60:00'),
	(63, 4, 'Sons of Anarchy: Patch Over', '60:00'),
	(64, 1, 'Ozark: Sugarwood', '58:00'),
	(64, 2, 'Ozark: Blue Cat', '60:00'),
	(64, 3, 'Ozark: My Dripping Sleep', '60:00'),
	(64, 4, 'Ozark: Tonight We Improvise', '60:00'),
	(65, 1, 'The Following: Pilot', '48:00'),
	(65, 2, 'The Following: Chapter Two', '44:00'),
	(65, 3, 'The Following: The Poet`s Fire', '43:00'),
	(65, 4, 'The Following: Mad Love', '44:00'),
	(66, 1, 'Black Adder: The Foretelling', '30:00'),
	(66, 2, 'Black Adder: Born to Be King', '31:00'),
	(66, 3, 'Black Adder: The Archbishop', '32:00'),
	(66, 4, 'Black Adder: The Queen of Spain`s Beard', '32:00');

-- Volcando estructura para tabla projecte.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int(11) NOT NULL,
  `dates` date NOT NULL,
  `preu_cost_` decimal(10,2) NOT NULL,
  `id_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `factura_ibfk_1` (`id_compte`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.factura: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.genere
CREATE TABLE IF NOT EXISTS `genere` (
  `id_categoria` int(11) NOT NULL,
  `nom_genere` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.genere: ~10 rows (aproximadamente)
INSERT INTO `genere` (`id_categoria`, `nom_genere`) VALUES
	(1, 'comedia'),
	(2, 'drames politics'),
	(3, 'drames històrics'),
	(4, 'drames de super-herois'),
	(5, 'crim drames'),
	(6, 'comedia dramàtica'),
	(7, 'acció & aventura'),
	(8, 'ciència ficció'),
	(9, 'horror'),
	(10, 'thriller');

-- Volcando estructura para tabla projecte.ha_consumit
CREATE TABLE IF NOT EXISTS `ha_consumit` (
  `id_compte` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `num_visualitzacio` int(11) NOT NULL,
  `favorit` tinyint(1) NOT NULL,
  KEY `ha_consumit_ibfk_1` (`id_compte`),
  KEY `ha_consumit_ibfk_2` (`id_produccio`),
  CONSTRAINT `ha_consumit_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ha_consumit_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.ha_consumit: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.ha_consumit_episodi
CREATE TABLE IF NOT EXISTS `ha_consumit_episodi` (
  `id_compte` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `id_episodi` int(11) NOT NULL,
  `num_visualitzacio` int(11) NOT NULL,
  PRIMARY KEY (`id_compte`,`id_produccio`,`id_episodi`),
  KEY `ha_consumit_episodi_ibfk_2` (`id_produccio`,`id_episodi`),
  CONSTRAINT `ha_consumit_episodi_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ha_consumit_episodi_ibfk_2` FOREIGN KEY (`id_produccio`, `id_episodi`) REFERENCES `episodi` (`id_produccio`, `id_episodi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.ha_consumit_episodi: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.modalitat
CREATE TABLE IF NOT EXISTS `modalitat` (
  `id_modalitat` int(11) NOT NULL,
  `tipus` varchar(255) NOT NULL,
  PRIMARY KEY (`id_modalitat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.modalitat: ~3 rows (aproximadamente)
INSERT INTO `modalitat` (`id_modalitat`, `tipus`) VALUES
	(1, 'gratuita'),
	(2, 'basica'),
	(3, 'premium');

-- Volcando estructura para tabla projecte.participen
CREATE TABLE IF NOT EXISTS `participen` (
  `id_actor` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  `id_episodi` int(11) NOT NULL,
  `protagonista` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_actor`,`id_produccio`,`id_episodi`),
  KEY `participen_ibfk_2` (`id_produccio`,`id_episodi`),
  CONSTRAINT `participen_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participen_ibfk_2` FOREIGN KEY (`id_produccio`, `id_episodi`) REFERENCES `episodi` (`id_produccio`, `id_episodi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.participen: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.pel_licules
CREATE TABLE IF NOT EXISTS `pel_licules` (
  `id_produccio` int(11) NOT NULL,
  `durada` int(11) NOT NULL,
  PRIMARY KEY (`id_produccio`),
  CONSTRAINT `pel_licules_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.pel_licules: ~0 rows (aproximadamente)

-- Volcando estructura para tabla projecte.pertany
CREATE TABLE IF NOT EXISTS `pertany` (
  `id_produccio` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  KEY `pertany_ibfk_1` (`id_produccio`),
  KEY `pertany_ibfk_2` (`id_categoria`),
  CONSTRAINT `pertany_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pertany_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `genere` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.pertany: ~60 rows (aproximadamente)
INSERT INTO `pertany` (`id_produccio`, `id_categoria`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 2),
	(5, 3),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 4),
	(10, 5),
	(11, 6),
	(12, 6),
	(13, 5),
	(14, 4),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 2),
	(19, 3),
	(20, 4),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 3),
	(25, 3),
	(26, 3),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 5),
	(31, 8),
	(32, 5),
	(33, 1),
	(34, 10),
	(35, 10),
	(36, 1),
	(37, 10),
	(38, 9),
	(39, 9),
	(40, 1),
	(41, 4),
	(42, 1),
	(43, 9),
	(44, 8),
	(45, 8),
	(46, 7),
	(47, 7),
	(48, 1),
	(49, 9),
	(50, 9),
	(51, 9),
	(52, 1),
	(53, 10),
	(54, 10),
	(55, 10),
	(56, 1),
	(57, 3),
	(58, 8),
	(59, 9),
	(60, 9),
	(61, 7),
	(62, 6),
	(63, 4),
	(64, 2),
	(65, 2),
	(66, 1);

-- Volcando estructura para tabla projecte.pot_visualitzar
CREATE TABLE IF NOT EXISTS `pot_visualitzar` (
  `id_modalitat` int(11) NOT NULL,
  `id_produccio` int(11) NOT NULL,
  KEY `id_modalitat` (`id_modalitat`),
  KEY `id_produccio` (`id_produccio`),
  CONSTRAINT `pot_visualitzar_ibfk_1` FOREIGN KEY (`id_modalitat`) REFERENCES `modalitat` (`id_modalitat`),
  CONSTRAINT `pot_visualitzar_ibfk_2` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.pot_visualitzar: ~137 rows (aproximadamente)
INSERT INTO `pot_visualitzar` (`id_modalitat`, `id_produccio`) VALUES
	(1, 5),
	(1, 7),
	(1, 9),
	(1, 10),
	(1, 15),
	(1, 16),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 28),
	(1, 29),
	(1, 31),
	(1, 32),
	(1, 36),
	(1, 38),
	(1, 44),
	(1, 47),
	(1, 48),
	(1, 52),
	(1, 55),
	(1, 57),
	(1, 61),
	(1, 62),
	(1, 66),
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 9),
	(2, 10),
	(2, 12),
	(2, 14),
	(2, 15),
	(2, 16),
	(2, 17),
	(2, 18),
	(2, 19),
	(2, 20),
	(2, 21),
	(2, 22),
	(2, 23),
	(2, 24),
	(2, 28),
	(2, 29),
	(2, 30),
	(2, 31),
	(2, 32),
	(2, 33),
	(2, 35),
	(2, 36),
	(2, 38),
	(2, 39),
	(2, 44),
	(2, 45),
	(2, 47),
	(2, 48),
	(2, 52),
	(2, 53),
	(2, 55),
	(2, 56),
	(2, 57),
	(2, 58),
	(2, 61),
	(2, 62),
	(2, 63),
	(2, 64),
	(2, 66),
	(3, 1),
	(3, 2),
	(3, 3),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(3, 8),
	(3, 9),
	(3, 10),
	(3, 11),
	(3, 12),
	(3, 13),
	(3, 14),
	(3, 15),
	(3, 16),
	(3, 17),
	(3, 18),
	(3, 19),
	(3, 20),
	(3, 21),
	(3, 22),
	(3, 23),
	(3, 24),
	(3, 25),
	(3, 26),
	(3, 27),
	(3, 28),
	(3, 29),
	(3, 30),
	(3, 31),
	(3, 32),
	(3, 33),
	(3, 34),
	(3, 35),
	(3, 36),
	(3, 37),
	(3, 38),
	(3, 39),
	(3, 40),
	(3, 41),
	(3, 42),
	(3, 43),
	(3, 44),
	(3, 45),
	(3, 46),
	(3, 47),
	(3, 48),
	(3, 49),
	(3, 50),
	(3, 51),
	(3, 52),
	(3, 53),
	(3, 54),
	(3, 55),
	(3, 56),
	(3, 57),
	(3, 58),
	(3, 59),
	(3, 60),
	(3, 61),
	(3, 62),
	(3, 63),
	(3, 64),
	(3, 65),
	(3, 66);

-- Volcando estructura para tabla projecte.produccions
CREATE TABLE IF NOT EXISTS `produccions` (
  `id_produccio` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `nacionalitat` varchar(255) NOT NULL,
  `anys` int(11) NOT NULL,
  `caratula` varchar(8) NOT NULL,
  `favorit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_produccio`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.produccions: ~66 rows (aproximadamente)
INSERT INTO `produccions` (`id_produccio`, `nom`, `nacionalitat`, `anys`, `caratula`, `favorit`) VALUES
	(1, 'Arrested Development', 'Ingles', 2016, '1.jpg', NULL),
	(2, 'BoJack Horseman', 'Ingles', 2017, '2.jpg', NULL),
	(3, 'Club de Cuervos', 'Ingles', 2017, '3.jpg', NULL),
	(4, 'F Is for Family', 'Ingles', 2016, '4.jpg', NULL),
	(5, 'Star Trek', 'Ingles', 1987, '5.jpg', NULL),
	(6, 'Summer Heights High', 'Ingles', 2020, '6.jpg', NULL),
	(7, 'Unbreakable', 'Ingles', 2015, '7.jpg', NULL),
	(8, 'Wet Hot American Summer', 'Ingles', 2017, '8.jpg', NULL),
	(9, 'House', 'Ingles', 2004, '9.jpg', NULL),
	(10, 'Perdidos', 'Ingles', 2004, '10.jpg', NULL),
	(11, 'The Killing Tree', 'Ingles', 2022, '11.jpg', NULL),
	(12, 'Homeland', 'Ingles', 2017, '12.jpg', NULL),
	(13, 'House of Cards', 'Ingles', 2022, '13.jpg', NULL),
	(14, 'Occupied', 'Ingles', 2017, '14.jpg', NULL),
	(15, 'The Good Wife', 'Ingles', 2009, '15.jpg', NULL),
	(16, 'The West Wing', 'Ingles', 1999, '16.jpg', NULL),
	(17, 'Narcos', 'Ingles', 2016, '17.jpg', NULL),
	(18, 'Peaky Blinders', 'Ingles', 2016, '18.jpg', NULL),
	(19, 'The Americans', 'Ingles', 2018, '19.jpg', NULL),
	(20, 'Gotham', 'Ingles', 2019, '20.jpg', NULL),
	(21, 'Helstrom', 'Ingles', 2020, '21.jpg', NULL),
	(22, 'Jessica Jones', 'Ingles', 2015, '22.jpg', NULL),
	(23, 'The Flash', 'Ingles', 2014, '23.jpg', NULL),
	(24, 'Better Call Saul', 'Ingles', 2015, '24.jpg', NULL),
	(25, 'Los campos de la muerte de Texas', 'Ingles', 2022, '25.jpg', NULL),
	(26, 'Fargo', 'Ingles', 2023, '26.jpg', NULL),
	(27, 'The Blacklist', 'Ingles', 2023, '27.jpg', NULL),
	(28, 'Hotel Fawlty', 'Ingles', 1975, '28.jpg', NULL),
	(29, 'Twin Peaks', 'Ingles', 1990, '29.jpg', NULL),
	(30, 'Flaked', 'Ingles', 2019, '30.jpg', NULL),
	(31, 'Grace & Frankie', 'Ingles', 2015, '31.jpg', NULL),
	(32, 'Nurse Jackie', 'Ingles', 2009, '32.jpg', NULL),
	(33, 'Orange Is the New Black', 'Ingles', 2020, '33.jpg', NULL),
	(34, 'Parenthood', 'Ingles', 2021, '34.jpg', NULL),
	(35, 'Rescue Me', 'Ingles', 2019, '35.jpg', NULL),
	(36, 'Weeds', 'Ingles', 2005, '36.jpg', NULL),
	(37, '24', 'Ingles', 2021, '37.jpg', NULL),
	(38, 'Arrow', 'Ingles', 2012, '38.jpg', NULL),
	(39, 'La Reina del Sur', 'Ingles', 2017, '39.jpg', NULL),
	(40, 'Marco Polo', 'Ingles', 2021, '40.jpg', NULL),
	(41, 'Outlander', 'Ingles', 2022, '41.jpg', NULL),
	(42, 'Prison Break', 'Ingles', 2022, '42.jpg', NULL),
	(43, 'The Last Kingdom', 'Ingles', 2021, '43.jpg', NULL),
	(44, 'Los jóvenes', 'Ingles', 1982, '44.jpg', NULL),
	(45, 'Vikings', 'Ingles', 2017, '45.jpg', NULL),
	(46, 'Ascension', 'Ingles', 2021, '46.jpg', NULL),
	(47, 'Magnum', 'Ingles', 1980, '47.jpg', NULL),
	(48, 'Heroes', 'Ingles', 2006, '48.jpg', NULL),
	(49, 'Orphan Black', 'Ingles', 2021, '49.jpg', NULL),
	(50, 'Sense8', 'Ingles', 2022, '50.jpg', NULL),
	(51, 'The 100', 'Ingles', 2022, '51.jpg', NULL),
	(52, 'The 4400', 'Ingles', 2004, '52.jpg', NULL),
	(53, 'Under the Dome', 'Ingles', 2016, '53.jpg', NULL),
	(54, 'American Horror Story', 'Ingles', 2023, '54.jpg', NULL),
	(55, 'Hemlock Grove', 'Ingles', 2013, '55.jpg', NULL),
	(56, 'Penny Dreadful', 'Ingles', 2016, '56.jpg', NULL),
	(57, 'Dragon Ball', 'Ingles', 1986, '57.jpg', NULL),
	(58, 'the Walking Dead', 'Ingles', 2020, '58.jpg', NULL),
	(59, 'Z Nation', 'Ingles', 2022, '59.jpg', NULL),
	(60, 'Bates Motel', 'Ingles', 2023, '60.jpg', NULL),
	(61, 'Breaking Bad', 'Ingles', 2008, '61.jpg', NULL),
	(62, 'Dexter', 'Ingles', 2010, '62.jpg', NULL),
	(63, 'Sons of Anarchy', 'Ingles', 2018, '63.jpg', NULL),
	(64, 'Ozark ', 'Ingles', 2017, '64.jpg', NULL),
	(65, 'The Following', 'Ingles', 2021, '65.jpg', NULL),
	(66, 'black adder', 'Ingles', 1983, '66.jpg', NULL);

-- Volcando estructura para tabla projecte.series
CREATE TABLE IF NOT EXISTS `series` (
  `id_produccio` int(11) NOT NULL,
  PRIMARY KEY (`id_produccio`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`id_produccio`) REFERENCES `produccions` (`id_produccio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla projecte.series: ~35 rows (aproximadamente)
INSERT INTO `series` (`id_produccio`) VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40),
	(41),
	(42),
	(43),
	(44),
	(45),
	(46),
	(47),
	(48),
	(49),
	(50),
	(51),
	(52),
	(53),
	(54),
	(55),
	(56),
	(57),
	(58),
	(59),
	(60),
	(61),
	(62),
	(63),
	(64),
	(65),
	(66);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
