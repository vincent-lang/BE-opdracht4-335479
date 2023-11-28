-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 21 nov 2023 om 19:18
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
-- Database: `MVCS1J2Opdracht3`
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
(1, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', b'1', NULL, '2023-11-21 20:09:38.218591', '2023-11-21 20:09:38.218599'),
(2, 'Leroy', '', 'Boerhaven', '06-39398734', '25-06-2018', '*', b'1', NULL, '2023-11-21 20:09:38.291512', '2023-11-21 20:09:38.291519'),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '12-05-2010', '***', b'1', NULL, '2023-11-21 20:09:38.367454', '2023-11-21 20:09:38.367461'),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '10-01-2023', '****', b'1', NULL, '2023-11-21 20:09:38.446765', '2023-11-21 20:09:38.446772'),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '14-06-2010', '*****', b'1', NULL, '2023-11-21 20:09:38.519565', '2023-11-21 20:09:38.519574');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `saves`
--

INSERT INTO `saves` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(1, 1, 5, '2017-06-18', b'1', NULL, '2023-11-21 20:09:40.047430', '2023-11-21 20:09:40.047436'),
(2, 3, 1, '2021-09-26', b'1', NULL, '2023-11-21 20:09:40.124838', '2023-11-21 20:09:40.124845'),
(3, 9, 1, '2021-09-27', b'1', NULL, '2023-11-21 20:09:40.193629', '2023-11-21 20:09:40.193637'),
(4, 4, 4, '2022-08-01', b'1', NULL, '2023-11-21 20:09:40.253793', '2023-11-21 20:09:40.253799'),
(5, 5, 1, '2019-08-30', b'1', NULL, '2023-11-21 20:09:40.309957', '2023-11-21 20:09:40.309963'),
(6, 10, 5, '2020-02-02', b'1', NULL, '2023-11-21 20:09:40.367978', '2023-11-21 20:09:40.367984');

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
(1, 'Personenauto', 'B', b'1', NULL, '2023-11-21 20:09:38.595510', '2023-11-21 20:09:38.595517'),
(2, 'Vrachtwagen', 'C', b'1', NULL, '2023-11-21 20:09:38.660640', '2023-11-21 20:09:38.660648'),
(3, 'Bus', 'D', b'1', NULL, '2023-11-21 20:09:38.727084', '2023-11-21 20:09:38.727091'),
(4, 'Bromfiets', 'AM', b'1', NULL, '2023-11-21 20:09:38.790467', '2023-11-21 20:09:38.790474');

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
(1, 'AU-67-IO', 'Golf', '2017-06-12', 'Diesel', 1, b'1', NULL, '2023-11-21 20:09:38.861721', '2023-11-21 20:09:38.861727'),
(2, 'TR-24-OP', 'DAF', '2019-05-23', 'Diesel', 2, b'1', NULL, '2023-11-21 20:09:38.934217', '2023-11-21 20:09:38.934222'),
(3, 'TH-78-KL', 'Mercedes', '2023-01-01', 'Benzine', 1, b'1', NULL, '2023-11-21 20:09:38.997478', '2023-11-21 20:09:38.997483'),
(4, '90-KL-TR', 'Fiat 500', '2021-09-12', 'Benzine', 1, b'1', NULL, '2023-11-21 20:09:39.060523', '2023-11-21 20:09:39.060528'),
(5, '34-TK-LP', 'Scania', '2015-03-13', 'Diesel', 2, b'1', NULL, '2023-11-21 20:09:39.121905', '2023-11-21 20:09:39.121910'),
(6, 'YY-OP-78', 'BMW M5', '2022-05-13', 'Diesel', 1, b'1', NULL, '2023-11-21 20:09:39.185637', '2023-11-21 20:09:39.185642'),
(7, 'UU-HH-JK', 'M.A.N', '2017-12-03', 'Diesel', 2, b'1', NULL, '2023-11-21 20:09:39.249323', '2023-11-21 20:09:39.249329'),
(8, 'ST-FZ-28', 'Citroën', '2018-01-20', 'Elektrisch', 1, b'1', NULL, '2023-11-21 20:09:39.329368', '2023-11-21 20:09:39.329374'),
(9, '123-FR-T', 'Piaggio ZIP', '2021-02-01', 'Benzine', 4, b'1', NULL, '2023-11-21 20:09:39.390283', '2023-11-21 20:09:39.390288'),
(10, 'DRS-52-P', 'Vespa', '2022-03-21', 'Benzine', 4, b'1', NULL, '2023-11-21 20:09:39.459455', '2023-11-21 20:09:39.459461'),
(11, 'STP-12-U', 'Kymco', '2022-07-02', 'Benzine', 4, b'1', NULL, '2023-11-21 20:09:39.525653', '2023-11-21 20:09:39.525659'),
(12, '45-SD-23', 'Renault', '2023-01-01', 'Diesel', 3, b'1', NULL, '2023-11-21 20:09:39.587150', '2023-11-21 20:09:39.587156');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `voertuig_instructeurs`
--

INSERT INTO `voertuig_instructeurs` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`, `IsActief`, `OpMerkingen`, `DatumAanGemaakt`, `DatumGewijzigd`) VALUES
(2, 3, 1, '2021-09-26', b'1', NULL, '2023-11-21 20:09:39.708856', '2023-11-21 20:09:39.708861'),
(3, 9, 1, '2021-09-27', b'1', NULL, '2023-11-21 20:09:39.770251', '2023-11-21 20:09:39.770257'),
(4, 4, 4, '2022-08-01', b'1', NULL, '2023-11-21 20:09:39.838410', '2023-11-21 20:09:39.838415'),
(5, 5, 1, '2019-08-30', b'1', NULL, '2023-11-21 20:09:39.927357', '2023-11-21 20:09:39.927364'),
(8, 1, 5, '2023-11-21', b'1', NULL, '2023-11-21 07:11:51.000000', '2023-11-21 07:11:51.000000'),
(9, 10, 5, '2023-11-21', b'1', NULL, '2023-11-21 07:11:51.000000', '2023-11-21 07:11:51.000000');

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
