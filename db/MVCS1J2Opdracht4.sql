-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 28 nov 2023 om 10:48
-- Serverversie: 5.7.36
-- PHP-versie: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MVCS1J2Opdracht4`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instructeurs`
--

DROP TABLE IF EXISTS `instructeurs`;
CREATE TABLE IF NOT EXISTS `instructeurs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(50) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Mobiel` varchar(50) NOT NULL,
  `DatumInDienst` varchar(50) NOT NULL,
  `AantalSterren` varchar(20) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `instructeurs`
--

INSERT INTO `instructeurs` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `DatumInDienst`, `AantalSterren`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', b'1', NULL, '2023-11-28 11:48:16.439183', '2023-11-28 11:48:16.439187'),
(2, 'Leroy', '', 'Boerhaven', '06-39398734', '25-06-2018', '*', b'1', NULL, '2023-11-28 11:48:16.465760', '2023-11-28 11:48:16.465764'),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '12-05-2010', '***', b'1', NULL, '2023-11-28 11:48:16.491729', '2023-11-28 11:48:16.491732'),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '10-01-2023', '****', b'1', NULL, '2023-11-28 11:48:16.521268', '2023-11-28 11:48:16.521272'),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '14-06-2010', '*****', b'1', NULL, '2023-11-28 11:48:16.548725', '2023-11-28 11:48:16.548729');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `saves`
--

DROP TABLE IF EXISTS `saves`;
CREATE TABLE IF NOT EXISTS `saves` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoertuigId` tinyint(3) UNSIGNED NOT NULL,
  `InstructeurId` tinyint(3) UNSIGNED NOT NULL,
  `DatumToekenning` date NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `VoertuigId` (`VoertuigId`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `saves`
--

INSERT INTO `saves` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2017-06-18', b'1', NULL, '2023-11-28 11:48:17.209970', '2023-11-28 11:48:17.209972'),
(2, 3, 1, '2021-09-26', b'1', NULL, '2023-11-28 11:48:17.234903', '2023-11-28 11:48:17.234907'),
(3, 9, 1, '2021-09-27', b'1', NULL, '2023-11-28 11:48:17.262872', '2023-11-28 11:48:17.262874'),
(4, 4, 4, '2022-08-01', b'1', NULL, '2023-11-28 11:48:17.296794', '2023-11-28 11:48:17.296797'),
(5, 5, 1, '2019-08-30', b'1', NULL, '2023-11-28 11:48:17.324318', '2023-11-28 11:48:17.324321'),
(6, 10, 5, '2020-02-02', b'1', NULL, '2023-11-28 11:48:17.352630', '2023-11-28 11:48:17.352633');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `type_voertuigs`
--

DROP TABLE IF EXISTS `type_voertuigs`;
CREATE TABLE IF NOT EXISTS `type_voertuigs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypeVoertuig` varchar(50) NOT NULL,
  `Rijbewijscategorie` varchar(50) NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `type_voertuigs`
--

INSERT INTO `type_voertuigs` (`Id`, `TypeVoertuig`, `Rijbewijscategorie`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'Personenauto', 'B', b'1', NULL, '2023-11-28 11:48:16.578101', '2023-11-28 11:48:16.578105'),
(2, 'Vrachtwagen', 'C', b'1', NULL, '2023-11-28 11:48:16.601867', '2023-11-28 11:48:16.601870'),
(3, 'Bus', 'D', b'1', NULL, '2023-11-28 11:48:16.628513', '2023-11-28 11:48:16.628518'),
(4, 'Bromfiets', 'AM', b'1', NULL, '2023-11-28 11:48:16.654059', '2023-11-28 11:48:16.654063');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `voertuigs`
--

DROP TABLE IF EXISTS `voertuigs`;
CREATE TABLE IF NOT EXISTS `voertuigs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(20) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Bouwjaar` date NOT NULL,
  `Brandstof` varchar(20) NOT NULL,
  `TypeVoertuigId` tinyint(3) UNSIGNED NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TypeVoertuigId` (`TypeVoertuigId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `voertuigs`
--

INSERT INTO `voertuigs` (`Id`, `Kenteken`, `Type`, `Bouwjaar`, `Brandstof`, `TypeVoertuigId`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 'AU-67-IO', 'Golf', '2017-06-12', 'Diesel', 1, b'1', NULL, '2023-11-28 11:48:16.683432', '2023-11-28 11:48:16.683435'),
(2, 'TR-24-OP', 'DAF', '2019-05-23', 'Diesel', 2, b'1', NULL, '2023-11-28 11:48:16.707973', '2023-11-28 11:48:16.707977'),
(3, 'TH-78-KL', 'Mercedes', '2023-01-01', 'Benzine', 1, b'1', NULL, '2023-11-28 11:48:16.735300', '2023-11-28 11:48:16.735304'),
(4, '90-KL-TR', 'Fiat 500', '2021-09-12', 'Benzine', 1, b'1', NULL, '2023-11-28 11:48:16.764054', '2023-11-28 11:48:16.764057'),
(5, '34-TK-LP', 'Scania', '2015-03-13', 'Diesel', 2, b'1', NULL, '2023-11-28 11:48:16.791112', '2023-11-28 11:48:16.791115'),
(6, 'YY-OP-78', 'BMW M5', '2022-05-13', 'Diesel', 1, b'1', NULL, '2023-11-28 11:48:16.819329', '2023-11-28 11:48:16.819333'),
(7, 'UU-HH-JK', 'M.A.N', '2017-12-03', 'Diesel', 2, b'1', NULL, '2023-11-28 11:48:16.847713', '2023-11-28 11:48:16.847716'),
(8, 'ST-FZ-28', 'Citroën', '2018-01-20', 'Elektrisch', 1, b'1', NULL, '2023-11-28 11:48:16.900846', '2023-11-28 11:48:16.900849'),
(9, '123-FR-T', 'Piaggio ZIP', '2021-02-01', 'Benzine', 4, b'1', NULL, '2023-11-28 11:48:16.929596', '2023-11-28 11:48:16.929598'),
(10, 'DRS-52-P', 'Vespa', '2022-03-21', 'Benzine', 4, b'1', NULL, '2023-11-28 11:48:16.958677', '2023-11-28 11:48:16.958680'),
(11, 'STP-12-U', 'Kymco', '2022-07-02', 'Benzine', 4, b'1', NULL, '2023-11-28 11:48:16.985991', '2023-11-28 11:48:16.985994'),
(12, '45-SD-23', 'Renault', '2023-01-01', 'Diesel', 3, b'1', NULL, '2023-11-28 11:48:17.016382', '2023-11-28 11:48:17.016385');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `voertuig_instructeurs`
--

DROP TABLE IF EXISTS `voertuig_instructeurs`;
CREATE TABLE IF NOT EXISTS `voertuig_instructeurs` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoertuigId` tinyint(3) UNSIGNED NOT NULL,
  `InstructeurId` tinyint(3) UNSIGNED NOT NULL,
  `DatumToekenning` date NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `OpMerkingen` varchar(250) DEFAULT NULL,
  `DatumAanGemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `VoertuigId` (`VoertuigId`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `voertuig_instructeurs`
--

INSERT INTO `voertuig_instructeurs` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2017-06-18', b'1', NULL, '2023-11-28 11:48:17.047345', '2023-11-28 11:48:17.047348'),
(2, 3, 1, '2021-09-26', b'1', NULL, '2023-11-28 11:48:17.071193', '2023-11-28 11:48:17.071196'),
(3, 9, 1, '2021-09-27', b'1', NULL, '2023-11-28 11:48:17.097495', '2023-11-28 11:48:17.097498'),
(4, 4, 4, '2022-08-01', b'1', NULL, '2023-11-28 11:48:17.122589', '2023-11-28 11:48:17.122592'),
(5, 5, 1, '2019-08-30', b'1', NULL, '2023-11-28 11:48:17.150393', '2023-11-28 11:48:17.150397'),
(6, 10, 5, '2020-02-02', b'1', NULL, '2023-11-28 11:48:17.179398', '2023-11-28 11:48:17.179401');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `saves`
--
ALTER TABLE `saves`
  ADD CONSTRAINT `saves_ibfk_1` FOREIGN KEY (`VoertuigId`) REFERENCES `Voertuigs` (`Id`),
  ADD CONSTRAINT `saves_ibfk_2` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeurs` (`Id`);

--
-- Beperkingen voor tabel `voertuigs`
--
ALTER TABLE `voertuigs`
  ADD CONSTRAINT `voertuigs_ibfk_1` FOREIGN KEY (`TypeVoertuigId`) REFERENCES `Type_voertuigs` (`Id`);

--
-- Beperkingen voor tabel `voertuig_instructeurs`
--
ALTER TABLE `voertuig_instructeurs`
  ADD CONSTRAINT `voertuig_instructeurs_ibfk_1` FOREIGN KEY (`VoertuigId`) REFERENCES `Voertuigs` (`Id`),
  ADD CONSTRAINT `voertuig_instructeurs_ibfk_2` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeurs` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
