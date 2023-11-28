-- Step: 01
-- Goal: drop database
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
drop database if exists MVCS1J2Opdracht3;

-- Step: 02
-- Goal: create database
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
create database if not exists MVCS1J2Opdracht3;

-- Step: 03
-- Goal: use database
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
use MVCS1J2Opdracht3;

-- Step: 04
-- Goal: drop, create table Instructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
drop table if exists instructeurs;
create table if not exists instructeurs (
Id TINYINT UNSIGNED not null auto_increment,
Voornaam varchar(50) not null,
Tussenvoegsel varchar(50) not null,
Achternaam varchar(50) not null,
Mobiel varchar(50) not null,
DatumInDienst varchar(50) not null,
AantalSterren varchar(20) not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT primary key CLUSTERED(Id)
) engine=InnoDB;

-- Step: 05
-- Goal: drop, create table TypeVoertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
drop table if exists type_voertuigs;
create table if not exists type_voertuigs (
Id TINYINT UNSIGNED not null auto_increment,
TypeVoertuig varchar(50) not null,
Rijbewijscategorie varchar(50) not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_TypeVoertuig_Id   PRIMARY KEY CLUSTERED(Id)
) engine=InnoDB;

-- Step: 06
-- Goal: drop, create table Voertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
drop table if exists voertuigs;
create table if not exists voertuigs (
Id TINYINT UNSIGNED not null auto_increment,
Kenteken varchar(20) not null,
Type varchar(30) not null,
Bouwjaar date not null,
Brandstof varchar(20) not null,
TypeVoertuigId TINYINT UNSIGNED not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_Voertuig_Id   PRIMARY KEY CLUSTERED(Id),
foreign key (TypeVoertuigId) references Type_voertuigs(Id)
) engine=InnoDB;

-- Step: 07
-- Goal: drop, create table VoertuigInstructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
drop table if exists voertuig_instructeurs;
create table if not exists voertuig_instructeurs (
Id TINYINT UNSIGNED not null auto_increment,
VoertuigId TINYINT UNSIGNED not null,
InstructeurId TINYINT UNSIGNED not null,
DatumToekenning date not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_VoertuigInstructeur_Id   PRIMARY KEY CLUSTERED(Id),
foreign key (VoertuigId) references Voertuigs(Id),
foreign key (InstructeurId) references Instructeurs(Id)
) engine=InnoDB;

-- Step: 08
-- Goal: drop, create table saves
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
drop table if exists saves;
create table if not exists saves (
Id TINYINT UNSIGNED not null auto_increment,
VoertuigId TINYINT UNSIGNED not null,
InstructeurId TINYINT UNSIGNED not null,
DatumToekenning date not null,
IsActief bit not null default 1,
OpMerkingen varchar(250) null default null,
DatumAanGemaakt datetime(6) not null,
DatumGewijzigd datetime(6) not null,
CONSTRAINT      PK_VoertuigInstructeur_Id   PRIMARY KEY CLUSTERED(Id),
foreign key (VoertuigId) references Voertuigs(Id),
foreign key (InstructeurId) references Instructeurs(Id)
) engine=InnoDB;

-- Step: 09
-- Goal: insert info into the table Instructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
INSERT INTO instructeurs (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO instructeurs (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Leroy', '', 'Boerhaven', '06-39398734', '25-06-2018', '*', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO instructeurs (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Yoeri', 'Van', 'Veen', '06-24383291', '12-05-2010', '***', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO instructeurs (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bert', 'Van', 'Sali', '06-48293823', '10-01-2023', '****', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO instructeurs (Id,Voornaam,Tussenvoegsel,Achternaam,Mobiel,DatumInDienst,AantalSterren,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Mohammed', 'El', 'Yassidi', '06-34291234', '14-06-2010', '*****', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 10
-- Goal: insert info into the table TypeVoertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
INSERT INTO type_voertuigs (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Personenauto', 'B', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO type_voertuigs (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Vrachtwagen', 'C', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO type_voertuigs (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bus', 'D', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO type_voertuigs (Id,TypeVoertuig,Rijbewijscategorie,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'Bromfiets', 'AM', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 11
-- Goal: insert info into the table Voertuig
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'AU-67-IO', 'Golf', '2017-06-12', 'Diesel', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'TR-24-OP', 'DAF', '2019-05-23', 'Diesel', 2, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'TH-78-KL', 'Mercedes', '2023-01-01', 'Benzine', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '90-KL-TR', 'Fiat 500', '2021-09-12', 'Benzine', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '34-TK-LP', 'Scania', '2015-03-13', 'Diesel', 2, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'YY-OP-78', 'BMW M5', '2022-05-13', 'Diesel', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'UU-HH-JK', 'M.A.N', '2017-12-03', 'Diesel', 2, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'ST-FZ-28', 'Citroën', '2018-01-20', 'Elektrisch', 1, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '123-FR-T', 'Piaggio ZIP', '2021-02-01', 'Benzine', 4, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'DRS-52-P', 'Vespa', '2022-03-21', 'Benzine', 4, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, 'STP-12-U', 'Kymco', '2022-07-02', 'Benzine', 4, 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuigs (Id,Kenteken,Type,Bouwjaar,Brandstof,TypeVoertuigId,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd) 
VALUES (null, '45-SD-23', 'Renault', '2023-01-01', 'Diesel', 3, 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 12
-- Goal: insert info into the table VoertuigInstructeur
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
INSERT INTO voertuig_instructeurs (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 1, 5, '2017-06-18', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuig_instructeurs (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 3, 1, '2021-09-26', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuig_instructeurs (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 9, 1, '2021-09-27', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuig_instructeurs (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 4, 4, '2022-08-01', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuig_instructeurs (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 5, 1, '2019-08-30', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO voertuig_instructeurs (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 10, 5, '2020-02-02', 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 13
-- Goal: insert info into the table saves
-- =============================================================================
--  Version       Date:           Author:                     Description: 
-- =============================================================================
--  01            24-10-2023      Vincent van de Merwe            new          
-- =============================================================================
INSERT INTO saves (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 1, 5, '2017-06-18', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO saves (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 3, 1, '2021-09-26', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO saves (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 9, 1, '2021-09-27', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO saves (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 4, 4, '2022-08-01', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO saves (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 5, 1, '2019-08-30', 1, NULL, SYSDATE(6), SYSDATE(6));
INSERT INTO saves (Id,VoertuigId,InstructeurId,DatumToekenning,IsActief,Opmerkingen,DatumAangemaakt,DatumGewijzigd)
VALUES (null, 10, 5, '2020-02-02', 1, NULL, SYSDATE(6), SYSDATE(6));