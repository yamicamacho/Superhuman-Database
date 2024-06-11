-- phpMyAdmin SQL Dump
-- version 4.2.4
-- http://www.phpmyadmin.net
--
-- Host: ovid.u.washington.edu:20345
-- Generation Time: May 23, 2019 at 04:58 PM
-- Server version: 5.5.18
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `point_of_sale`
--
CREATE DATABASE IF NOT EXISTS `SuperheroDatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `SuperheroDatabase`;

-- --------------------------------------------------------
-- Create Table Commands

CREATE TABLE SUPERHUMAN (
    superID INTEGER PRIMARY KEY,
    Alias VARCHAR(255) NOT NULL,
    Origin VARCHAR(255) NOT NULL,
    Alignment VARCHAR(50) NOT NULL
);

CREATE TABLE SIDE_CHARACTER (
    CID INTEGER PRIMARY KEY,
    RealName VARCHAR(255) NOT NULL
);

CREATE TABLE POWERS (
    Name VARCHAR(255) PRIMARY KEY NOT NULL,
    PowerType VARCHAR(255) NOT NULL
);

CREATE TABLE EVENT_ARC (
    Title VARCHAR(255) PRIMARY KEY NOT NULL,
    Outcome VARCHAR(255) DEFAULT 'Unknown',
    PublisherName VARCHAR(255) NOT NULL
);

CREATE TABLE PUBLISHER (
    Name VARCHAR(255) PRIMARY KEY NOT NULL,
    Year INTEGER NOT NULL
);

CREATE TABLE MEDIA (
    Title VARCHAR(255) PRIMARY KEY NOT NULL,
    Format VARCHAR(50) NOT NULL
);

CREATE TABLE ASSOCIATES_WITH (
    SuperID INTEGER,
    SCID INTEGER,
    R_Type VARCHAR(50) NOT NULL,
    PRIMARY KEY (SuperID, SCID)
);

CREATE TABLE CREATORS (
    MediaTitle VARCHAR(255),
    EventTitle VARCHAR(255),
    Creator VARCHAR(255) NOT NULL,
    PRIMARY KEY (MediaTitle, EventTitle)
);

CREATE TABLE PRODUCE (
    PublisherName VARCHAR(255),
    MediaTitle VARCHAR(255),
    PRIMARY KEY (PublisherName, MediaTitle)
);

CREATE TABLE ADAPTS (
    EventTitle VARCHAR(255),
    MediaTitle VARCHAR(255),
    PRIMARY KEY (EventTitle, MediaTitle)
);

CREATE TABLE PARTICIPATES_IN_EVENT (
    SuperID INTEGER,
    SCID INTEGER,
    EventTitle VARCHAR(255),
    PRIMARY KEY (SuperID, SCID, EventTitle)
);

CREATE TABLE FIGHT_ENEMIES (
    SuperID1 INTEGER,
    SuperID2 INTEGER,
    PRIMARY KEY (SuperID1, SuperID2)
);

CREATE TABLE POWERS_POSSESSED (
    ID INTEGER,
    PowerName VARCHAR(255),
    PRIMARY KEY (ID, PowerName)
);

CREATE TABLE SUPERHUMAN_REALNAME (
    heroID INTEGER PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Mname VARCHAR(50) DEFAULT '',
    Lname VARCHAR(50) NOT NULL
);

CREATE TABLE POWER_LEVEL (
    powerName VARCHAR(255) PRIMARY KEY NOT NULL,
    strength INTEGER NOT NULL,
    control INTEGER NOT NULL,
    `range` INTEGER NOT NULL
);

CREATE TABLE MEDIA_AIRTIME (
    Title VARCHAR(255),
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (Title)
);

CREATE TABLE EVENT_ARC_DATE (
    Title VARCHAR(255),
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (Title)
);

-- Sample Data Commands
INSERT INTO SUPERHUMAN (superID, Alias, Origin, Alignment) VALUES
(1, 'Spider-Man', 'Radioactive Spider Bite', 'Hero'),
(2, 'Iron Man', 'Technology', 'Hero'),
(3, 'Thor', 'Asgardian God', 'Hero'),
(4, 'Loki', 'Asgardian God', 'Villain'),
(5, 'Thanos', 'Titanian Eternal', 'Villain'),
(6, 'Captain America', 'Super Soldier Serum', 'Hero'),
(7, 'Hulk', 'Gamma Radiation', 'Hero'),
(8, 'Black Widow', 'Training and Skill', 'Hero'),
(9, 'Hawkeye', 'Training and Skill', 'Hero'),
(10, 'Black Panther', 'Herb Enhancement', 'Hero'),
(11, 'Doctor Strange', 'Mystical Arts', 'Hero'),
(12, 'Scarlet Witch', 'Chaos Magic', 'Hero'),
(13, 'Vision', 'Artificial Intelligence', 'Hero'),
(14, 'Falcon', 'Technology', 'Hero'),
(15, 'Winter Soldier', 'Super Soldier Serum', 'Anti-Hero'),
(16, 'Ant-Man', 'Pym Particles', 'Hero'),
(17, 'Wasp', 'Pym Particles', 'Hero'),
(18, 'Star-Lord', 'Celestial DNA', 'Hero'),
(19, 'Gamora', 'Enhanced Physiology', 'Hero'),
(20, 'Drax the Destroyer', 'Enhanced Physiology', 'Hero'),
(21, 'Rocket Raccoon', 'Genetic and Cybernetic Enhancements', 'Hero'),
(22, 'Groot', 'Flora Colossus', 'Hero'),
(23, 'Nebula', 'Cybernetic Enhancements', 'Anti-Hero'),
(24, 'Mantis', 'Empathic Abilities', 'Hero'),
(25, 'Yondu', 'Centaurian Physiology', 'Anti-Hero'),
(26, 'War Machine', 'Technology', 'Hero'),
(27, 'Quicksilver', 'Enhanced Speed', 'Hero'),
(28, 'Nick Fury', 'Training and Skill', 'Hero'),
(29, 'Maria Hill', 'Training and Skill', 'Hero'),
(30, 'Phil Coulson', 'Training and Skill', 'Hero'),
(31, 'Shuri', 'Genius Intellect', 'Hero'),
(32, 'Okoye', 'Training and Skill', 'Hero'),
(33, 'Valkyrie', 'Asgardian Warrior', 'Hero'),
(34, 'Hela', 'Asgardian God', 'Villain'),
(35, 'Red Skull', 'Super Soldier Serum', 'Villain'),
(36, 'Ultron', 'Artificial Intelligence', 'Villain'),
(37, 'Killmonger', 'Herb Enhancement', 'Villain'),
(38, 'Erik Selvig', 'Genius Intellect', 'Hero'),
(39, 'Wong', 'Mystical Arts', 'Hero'),
(40, 'The Ancient One', 'Mystical Arts', 'Hero'),
(41, 'Jean Grey', 'Mutant', 'Hero'),
(42, 'Cyclops', 'Mutant', 'Hero'),
(43, 'Storm', 'Mutant', 'Hero'),
(44, 'Beast', 'Mutant', 'Hero'),
(45, 'Nightcrawler', 'Mutant', 'Hero'),
(46, 'Colossus', 'Mutant', 'Hero'),
(47, 'Wolverine', 'Mutant', 'Hero'),
(48, 'Professor X', 'Mutant', 'Hero'),
(49, 'Magneto', 'Mutant', 'Villain'),
(50, 'Mystique', 'Mutant', 'Villain'),
(51, 'Sabretooth', 'Mutant', 'Villain'),
(52, 'Juggernaut', 'Magical Gem', 'Villain'),
(53, 'Cable', 'Mutant', 'Hero'),
(54, 'Domino', 'Mutant', 'Hero'),
(55, 'Psylocke', 'Mutant', 'Hero'),
(56, 'Iceman', 'Mutant', 'Hero'),
(57, 'Archangel', 'Mutant', 'Hero'),
(58, 'Kitty Pryde', 'Mutant', 'Hero'),
(59, 'Rogue', 'Mutant', 'Hero');


INSERT INTO SIDE_CHARACTER (CID, RealName) VALUES
(1, 'Mary Jane Watson'),
(2, 'Pepper Potts'),
(3, 'Jane Foster'),
(4, 'Heimdall'),
(5, 'Nebula'),
(6, 'Happy Hogan'),
(7, 'Aunt May'),
(8, 'Ned Leeds'),
(9, 'J. Jonah Jameson'),
(10, 'Harold "Happy" Hogan'),
(11, 'Betty Ross'),
(12, 'Sharon Carter'),
(13, 'Darcy Lewis'),
(14, 'Agent Phil Coulson'),
(15, 'Agent Maria Hill'),
(16, 'Nick Fury'),
(17, 'Peggy Carter'),
(18, 'Erik Selvig'),
(19, 'Sif'),
(20, 'Wong'),
(21, 'Nakia'),
(22, 'Everett Ross'),
(23, 'Ramonda'),
(24, 'MBaku'),
(25, 'Misty Knight'),
(26, 'Colleen Wing'),
(27, 'Jessica Jones'),
(28, 'Luke Cage'),
(29, 'Danny Rand'),
(30, 'Claire Temple'),
(31, 'Karen Page'),
(32, 'Foggy Nelson'),
(33, 'Frank Castle'),
(34, 'Electra Natchios'),
(35, 'Howard Stark'),
(36, 'Christine Palmer'),
(37, 'Hank Pym'),
(38, 'Janet Van Dyne'),
(39, 'Cassie Lang'),
(40, 'Jimmy Woo'),
(41, 'Monica Rambeau'),
(42, 'Pietro Maximoff'),
(43, 'Wanda Maximoff'),
(44, 'Laura Barton'),
(45, 'Kate Bishop'),
(46, 'Yelena Belova'),
(47, 'Melina Vostokoff'),
(48, 'Alexei Shostakov'),
(49, 'Clint Barton'),
(50, 'Peter Quill');



INSERT INTO POWERS (Name, PowerType) VALUES
('Web-Slinging', 'Physical'),
('Flying', 'Technology'),
('Super Strength', 'Godly'),
('Illusion Casting', 'Magic'),
('Infinity Gauntlet', 'Cosmic'),
('Super Speed', 'Mutant'),
('Telepathy', 'Mutant'),
('Telekinesis', 'Mutant'),
('Healing Factor', 'Mutant'),
('Weather Manipulation', 'Mutant'),
('Magnetism Control', 'Mutant'),
('Shape Shifting', 'Mutant'),
('Energy Blasts', 'Cosmic'),
('Size Manipulation', 'Technology'),
('Invisibility', 'Mutant'),
('Invulnerability', 'Godly'),
('Fire Manipulation', 'Mutant'),
('Ice Manipulation', 'Mutant'),
('Mind Control', 'Magic'),
('Teleportation', 'Mutant'),
('Enhanced Reflexes', 'Training'),
('Martial Arts', 'Training'),
('Archery', 'Training'),
('Genius Intellect', 'Technology'),
('Technopathy', 'Technology'),
('Cosmic Awareness', 'Cosmic'),
('Psionic Energy', 'Mutant'),
('Darkforce Manipulation', 'Magic'),
('Lightforce Manipulation', 'Magic'),
('Photographic Reflexes', 'Training'),
('Time Manipulation', 'Magic'),
('Space Manipulation', 'Cosmic'),
('Reality Manipulation', 'Cosmic'),
('Soul Manipulation', 'Magic'),
('Elasticity', 'Mutant'),
('Density Control', 'Technology'),
('Sound Manipulation', 'Technology'),
('Force Fields', 'Technology'),
('Radiation Control', 'Mutant'),
('Gravity Control', 'Cosmic'),
('Sonic Scream', 'Mutant'),
('Energy Absorption', 'Mutant'),
('Energy Projection', 'Technology'),
('Regeneration', 'Mutant'),
('Power Absorption', 'Mutant'),
('Animal Communication', 'Magic'),
('Enhanced Senses', 'Mutant'),
('Super Agility', 'Mutant'),
('Pheromone Control', 'Mutant');



INSERT INTO EVENT_ARC (Title, Outcome, PublisherName) VALUES
('Civil War', 'Hero Conflict', 'Marvel Comics'),
('Infinity War', 'Villain Victory', 'Marvel Comics'),
('Ragnarok', 'Asgard Destroyed', 'Marvel Comics'),
('Secret Invasion', 'Skrull Infiltration', 'Marvel Comics'),
('Dark Phoenix Saga', 'Mutant Transformation', 'Marvel Comics'),
('Days of Future Past', 'Alternate Future', 'Marvel Comics'),
('Age of Ultron', 'Artificial Intelligence Uprising', 'Marvel Comics'),
('House of M', 'Reality Alteration', 'Marvel Comics'),
('Secret Wars', 'Multiverse Battle', 'Marvel Comics'),
('Avengers Disassembled', 'Team Breakdown', 'Marvel Comics'),
('World War Hulk', 'Hero vs. Hero', 'Marvel Comics'),
('Fear Itself', 'God of Fear', 'Marvel Comics'),
('Annihilation', 'Cosmic War', 'Marvel Comics'),
('Siege', 'Asgardian Invasion', 'Marvel Comics'),
('Original Sin', 'Secrets Revealed', 'Marvel Comics'),
('Axis', 'Hero and Villain Role Reversal', 'Marvel Comics'),
('Infinity', 'Cosmic Threat', 'Marvel Comics'),
('War of the Realms', 'Inter-Realm Conflict', 'Marvel Comics'),
('The Clone Saga', 'Spider-Man Clones', 'Marvel Comics'),
('Spider-Verse', 'Multiverse Spider-People', 'Marvel Comics'),
('Maximum Carnage', 'Symbiote Rampage', 'Marvel Comics'),
('Shadowland', 'Hells Kitchen Battle', 'Marvel Comics'),
('Operation: Galactic Storm', 'Intergalactic War', 'Marvel Comics'),
('Planet Hulk', 'Gladiator Hulk', 'Marvel Comics'),
('The Winter Soldier', 'Resurrected Assassin', 'Marvel Comics'),
('The Infinity Gauntlet', 'Thanos Reign', 'Marvel Comics'),
('Acts of Vengeance', 'Villain Team-Up', 'Marvel Comics'),
('The Kree-Skrull War', 'Interstellar War', 'Marvel Comics'),
('The Eternals Saga', 'God-like Beings', 'Marvel Comics'),
('The Evolutionary War', 'Genetic Manipulation', 'Marvel Comics'),
('Armor Wars', 'Stark Tech Theft', 'Marvel Comics'),
('The Trial of Jean Grey', 'Space Trial', 'Marvel Comics'),
('The Korvac Saga', 'Cosmic Being', 'Marvel Comics'),
('Secret Empire', 'Hydra Takeover', 'Marvel Comics');





INSERT INTO PUBLISHER (Name, Year) VALUES
('Marvel Comics', 1939);

INSERT INTO MEDIA (Title, Format) VALUES
('Avengers: Endgame', 'Movie'),
('Spider-Man: Homecoming', 'Movie'),
('Thor: Ragnarok', 'Movie'),
('Iron Man', 'Movie'),
('Captain America: The First Avenger', 'Movie'),
('Guardians of the Galaxy', 'Movie'),
('Black Panther', 'Movie'),
('Doctor Strange', 'Movie'),
('Ant-Man', 'Movie'),
('Captain Marvel', 'Movie'),
('Avengers: Infinity War', 'Movie'),
('Avengers: Age of Ultron', 'Movie'),
('The Avengers', 'Movie'),
('Thor: The Dark World', 'Movie'),
('Iron Man 2', 'Movie'),
('Iron Man 3', 'Movie'),
('Captain America: The Winter Soldier', 'Movie'),
('Captain America: Civil War', 'Movie'),
('Guardians of the Galaxy Vol. 2', 'Movie'),
('Ant-Man and The Wasp', 'Movie'),
('Spider-Man: Far From Home', 'Movie'),
('WandaVision', 'Live Action TV Show'),
('The Falcon and The Winter Soldier', 'Live Action TV Show'),
('Loki', 'Live Action TV Show'),
('Hawkeye', 'Live Action TV Show'),
('What If...?', 'Animated TV Show'),
('The Incredible Hulk', 'Movie'),
('Eternals', 'Movie'),
('Shang-Chi and the Legend of the Ten Rings', 'Movie'),
('Ms. Marvel', 'Live Action TV Show'),
('Moon Knight', 'Live Action TV Show'),
('She-Hulk: Attorney at Law', 'Live Action TV Show'),
('Black Widow', 'Movie'),
('Spider-Man: No Way Home', 'Movie'),
('X-Men', 'Movie'),
('X2: X-Men United', 'Movie'),
('X-Men: The Last Stand', 'Movie'),
('X-Men: First Class', 'Movie'),
('X-Men: Days of Future Past', 'Movie'),
('X-Men: Apocalypse', 'Movie'),
('X-Men: Dark Phoenix', 'Movie'),
('Deadpool', 'Movie'),
('Deadpool 2', 'Movie'),
('The New Mutants', 'Movie'),
('The Wolverine', 'Movie'),
('Logan', 'Movie'),
('Blade', 'Movie'),
('Blade II', 'Movie'),
('Blade: Trinity', 'Movie'),
('Daredevil', 'Movie'),
('The Punisher', 'Movie'),
('Punisher: War Zone', 'Movie'),
('Ghost Rider', 'Movie'),
('Ghost Rider: Spirit of Vengeance', 'Movie'),
('Fantastic Four', 'Movie'),
('Fantastic Four: Rise of the Silver Surfer', 'Movie'),
('Fantastic Four (2015)', 'Movie'),
('Venom', 'Movie'),
('Venom: Let There Be Carnage', 'Movie'),
('Morbius', 'Movie'),
('Spider-Man: The Animated Series', 'Animated TV Show'),
('X-Men: The Animated Series', 'Animated TV Show'),
('Avengers Assemble', 'Animated TV Show'),
('Ultimate Spider-Man', 'Animated TV Show'),
('The Spectacular Spider-Man', 'Animated TV Show'),
('Spider-Man Comics', 'Comic'),
('X-Men Comics', 'Comic'),
('The Avengers Comics', 'Comic'),
('Fantastic Four Comics', 'Comic'),
('Black Panther Comics', 'Comic'),
('Doctor Strange Comics', 'Comic'),
('Captain America Comics', 'Comic'),
('Iron Man Comics', 'Comic'),
('Thor Comics', 'Comic'),
('Hulk Comics', 'Comic');







INSERT INTO ASSOCIATES_WITH (SuperID, SCID, R_Type) VALUES
(1, 1, 'Romantic'),
(2, 2, 'Professional'),
(3, 3, 'Romantic'),
(4, 4, 'Ally'),
(5, 5, 'Family'),
(1, 7, 'Family'), -- Spider-Man and Aunt May
(2, 6, 'Friend'), -- Iron Man and Happy Hogan
(6, 17, 'Romantic'), -- Captain America and Peggy Carter
(7, 11, 'Romantic'), -- Hulk and Betty Ross
(8, 2, 'Professional'), -- Black Widow and Pepper Potts
(9, 8, 'Friend'), -- Hawkeye and Ned Leeds
(10, 21, 'Romantic'), -- Black Panther and Nakia
(11, 38, 'Friend'), -- Doctor Strange and Erik Selvig
(12, 43, 'Sibling'), -- Scarlet Witch and Quicksilver
(13, 31, 'Friend'), -- Vision and Shuri
(14, 28, 'Professional'), -- Falcon and Nick Fury
(15, 6, 'Friend'), -- Winter Soldier and Captain America
(16, 39, 'Family'), -- Ant-Man and Cassie Lang
(17, 37, 'Family'), -- Wasp and Hank Pym
(18, 24, 'Ally'), -- Star-Lord and Mantis
(19, 22, 'Ally'), -- Gamora and Groot
(20, 21, 'Ally'), -- Drax the Destroyer and Rocket Raccoon
(21, 22, 'Friend'), -- Rocket Raccoon and Groot
(22, 19, 'Friend'), -- Groot and Gamora
(23, 24, 'Sibling'), -- Nebula and Mantis
(24, 18, 'Ally'), -- Mantis and Star-Lord
(25, 18, 'Mentor'), -- Yondu and Star-Lord
(26, 2, 'Professional'), -- War Machine and Pepper Potts
(27, 43, 'Sibling'), -- Quicksilver and Scarlet Witch
(28, 14, 'Mentor'), -- Nick Fury and Falcon
(29, 14, 'Professional'), -- Maria Hill and Falcon
(30, 29, 'Professional'), -- Phil Coulson and Maria Hill
(31, 10, 'Sibling'), -- Shuri and Black Panther
(32, 10, 'Ally'), -- Okoye and Black Panther
(33, 4, 'Ally'), -- Valkyrie and Loki
(34, 33, 'Sibling'), -- Hela and Valkyrie
(35, 6, 'Enemy'), -- Red Skull and Captain America
(36, 2, 'Enemy'), -- Ultron and Iron Man
(37, 10, 'Enemy'), -- Killmonger and Black Panther
(38, 12, 'Friend'), -- Erik Selvig and Scarlet Witch
(39, 11, 'Friend'), -- Wong and Doctor Strange
(40, 11, 'Mentor'); -- The Ancient One and Doctor Strange

INSERT INTO CREATORS (MediaTitle, EventTitle, Creator) VALUES
('Avengers: Endgame', 'Infinity War', 'Stan Lee'),
('Spider-Man: Homecoming', 'Civil War', 'Steve Ditko'),
('Thor: Ragnarok', 'Ragnarok', 'Jack Kirby'),
('Iron Man', 'Iron Man Origins', 'Stan Lee'), -- Replaced NULL with a relevant event
('Captain America: The First Avenger', 'World War II', 'Joe Simon'),
('Guardians of the Galaxy', 'Annihilation', 'Dan Abnett'),
('Black Panther', 'Wakanda Forever', 'Jack Kirby'),
('Doctor Strange', 'Sorcerer Supreme', 'Steve Ditko'),
('Ant-Man', 'Ant-Man Origins', 'Stan Lee'),
('Captain Marvel', 'Kree-Skrull War', 'Roy Thomas'),
('Avengers: Infinity War', 'Infinity Gauntlet', 'Jim Starlin'),
('Avengers: Age of Ultron', 'Age of Ultron', 'Brian Michael Bendis'),
('The Avengers', 'Avengers Assemble', 'Stan Lee'),
('Thor: The Dark World', 'The Dark World', 'Walter Simonson'),
('Iron Man 2', 'Demon in a Bottle', 'David Michelinie'),
('Iron Man 3', 'Extremis', 'Warren Ellis'),
('Captain America: The Winter Soldier', 'Winter Soldier', 'Ed Brubaker'),
('Captain America: Civil War', 'Civil War', 'Mark Millar'),
('Guardians of the Galaxy Vol. 2', 'Guardians Origins', 'Dan Abnett'),
('Ant-Man and The Wasp', 'Ant-Man and The Wasp Origins', 'Stan Lee'),
('Spider-Man: Far From Home', 'Spider-Verse', 'Dan Slott'),
('WandaVision', 'House of M', 'Brian Michael Bendis'),
('The Falcon and The Winter Soldier', 'Secret Empire', 'Nick Spencer'),
('Loki', 'Journey Into Mystery', 'Walter Simonson'),
('Hawkeye', 'My Life as a Weapon', 'Matt Fraction'),
('What If...?', 'What If?', 'Roy Thomas'),
('The Incredible Hulk', 'Planet Hulk', 'Greg Pak'),
('Eternals', 'The Eternals', 'Jack Kirby'),
('Shang-Chi and the Legend of the Ten Rings', 'Master of Kung Fu', 'Steve Englehart'),
('Ms. Marvel', 'Ms. Marvel Origins', 'G. Willow Wilson'),
('Moon Knight', 'Moon Knight Origins', 'Doug Moench'),
('She-Hulk: Attorney at Law', 'She-Hulk Origins', 'Stan Lee'),
('Black Widow', 'Black Widow Origins', 'Don Rico'),
('Spider-Man: No Way Home', 'Spider-Verse', 'Dan Slott'),
('X-Men', 'X-Men Origins', 'Stan Lee'),
('X2: X-Men United', 'God Loves, Man Kills', 'Chris Claremont'),
('X-Men: The Last Stand', 'The Dark Phoenix Saga', 'Chris Claremont'),
('X-Men: First Class', 'First Class', 'Jeff Parker'),
('X-Men: Days of Future Past', 'Days of Future Past', 'Chris Claremont'),
('X-Men: Apocalypse', 'Age of Apocalypse', 'Scott Lobdell'),
('X-Men: Dark Phoenix', 'The Dark Phoenix Saga', 'Chris Claremont'),
('Deadpool', 'Deadpool Origins', 'Rob Liefeld'),
('Deadpool 2', 'Deadpool and Cable', 'Fabian Nicieza'),
('The New Mutants', 'The New Mutants', 'Chris Claremont'),
('The Wolverine', 'Wolverine', 'Chris Claremont'),
('Logan', 'Old Man Logan', 'Mark Millar'),
('Blade', 'Tomb of Dracula', 'Marv Wolfman'),
('Blade II', 'Blade: Bloodstorm', 'Marv Wolfman'),
('Blade: Trinity', 'Blade: Trinity', 'Marv Wolfman'),
('Daredevil', 'Daredevil Origins', 'Stan Lee'),
('The Punisher', 'The Punisher: War Journal', 'Gerry Conway'),
('Punisher: War Zone', 'The Punisher: War Zone', 'Chuck Dixon'),
('Ghost Rider', 'Ghost Rider Origins', 'Roy Thomas'),
('Ghost Rider: Spirit of Vengeance', 'Ghost Rider: Road to Damnation', 'Garth Ennis'),
('Fantastic Four', 'Fantastic Four Origins', 'Stan Lee'),
('Fantastic Four: Rise of the Silver Surfer', 'The Galactus Trilogy', 'Stan Lee'),
('Fantastic Four (2015)', 'Ultimate Fantastic Four', 'Mark Millar'),
('Venom', 'Venom: Lethal Protector', 'David Michelinie'),
('Venom: Let There Be Carnage', 'Maximum Carnage', 'David Michelinie'),
('Morbius', 'Morbius Origins', 'Roy Thomas');


INSERT INTO PRODUCE (PublisherName, MediaTitle) VALUES
('Marvel Comics', 'Avengers: Endgame'),
('Marvel Comics', 'Spider-Man: Homecoming'),
('Marvel Comics', 'Thor: Ragnarok'),
('Marvel Comics', 'Iron Man'),
('Marvel Comics', 'Captain America: The First Avenger'),
('Marvel Comics', 'Guardians of the Galaxy'),
('Marvel Comics', 'Black Panther'),
('Marvel Comics', 'Doctor Strange'),
('Marvel Comics', 'Ant-Man'),
('Marvel Comics', 'Captain Marvel'),
('Marvel Comics', 'Avengers: Infinity War'),
('Marvel Comics', 'Avengers: Age of Ultron'),
('Marvel Comics', 'The Avengers'),
('Marvel Comics', 'Thor: The Dark World'),
('Marvel Comics', 'Iron Man 2'),
('Marvel Comics', 'Iron Man 3'),
('Marvel Comics', 'Captain America: The Winter Soldier'),
('Marvel Comics', 'Captain America: Civil War'),
('Marvel Comics', 'Guardians of the Galaxy Vol. 2'),
('Marvel Comics', 'Ant-Man and The Wasp'),
('Marvel Comics', 'Spider-Man: Far From Home'),
('Marvel Comics', 'WandaVision'),
('Marvel Comics', 'The Falcon and The Winter Soldier'),
('Marvel Comics', 'Loki'),
('Marvel Comics', 'Hawkeye'),
('Marvel Comics', 'What If...?'),
('Marvel Comics', 'The Incredible Hulk'),
('Marvel Comics', 'Eternals'),
('Marvel Comics', 'Shang-Chi and the Legend of the Ten Rings'),
('Marvel Comics', 'Ms. Marvel'),
('Marvel Comics', 'Moon Knight'),
('Marvel Comics', 'She-Hulk: Attorney at Law'),
('Marvel Comics', 'Black Widow'),
('Marvel Comics', 'Spider-Man: No Way Home'),
('Marvel Comics', 'X-Men'),
('Marvel Comics', 'X2: X-Men United'),
('Marvel Comics', 'X-Men: The Last Stand'),
('Marvel Comics', 'X-Men: First Class'),
('Marvel Comics', 'X-Men: Days of Future Past'),
('Marvel Comics', 'X-Men: Apocalypse'),
('Marvel Comics', 'X-Men: Dark Phoenix'),
('Marvel Comics', 'Deadpool'),
('Marvel Comics', 'Deadpool 2'),
('Marvel Comics', 'The New Mutants'),
('Marvel Comics', 'The Wolverine'),
('Marvel Comics', 'Logan'),
('Marvel Comics', 'Blade'),
('Marvel Comics', 'Blade II'),
('Marvel Comics', 'Blade: Trinity'),
('Marvel Comics', 'Daredevil'),
('Marvel Comics', 'The Punisher'),
('Marvel Comics', 'Punisher: War Zone'),
('Marvel Comics', 'Ghost Rider'),
('Marvel Comics', 'Ghost Rider: Spirit of Vengeance'),
('Marvel Comics', 'Fantastic Four'),
('Marvel Comics', 'Fantastic Four: Rise of the Silver Surfer'),
('Marvel Comics', 'Fantastic Four (2015)'),
('Marvel Comics', 'Venom'),
('Marvel Comics', 'Venom: Let There Be Carnage'),
('Marvel Comics', 'Morbius');


INSERT INTO ADAPTS (EventTitle, MediaTitle) VALUES
('Infinity War', 'Avengers: Endgame'),
('Civil War', 'Spider-Man: Homecoming'),
('Ragnarok', 'Thor: Ragnarok'),
('The Infinity Gauntlet', 'Avengers: Infinity War'),
('Age of Ultron', 'Avengers: Age of Ultron'),
('Avengers Assemble', 'The Avengers'),
('The Dark World', 'Thor: The Dark World'),
('Demon in a Bottle', 'Iron Man 2'),
('Extremis', 'Iron Man 3'),
('Winter Soldier', 'Captain America: The Winter Soldier'),
('Civil War', 'Captain America: Civil War'),
('Guardians Origins', 'Guardians of the Galaxy Vol. 2'),
('Ant-Man Origins', 'Ant-Man'),
('Kree-Skrull War', 'Captain Marvel'),
('Planet Hulk', 'Thor: Ragnarok'),
('World War Hulk', 'The Incredible Hulk'),
('House of M', 'WandaVision'),
('Secret Empire', 'The Falcon and The Winter Soldier'),
('Journey Into Mystery', 'Loki'),
('My Life as a Weapon', 'Hawkeye'),
('What If?', 'What If...?'),
('The New Mutants', 'The New Mutants'),
('Days of Future Past', 'X-Men: Days of Future Past'),
('The Dark Phoenix Saga', 'X-Men: Dark Phoenix'),
('Old Man Logan', 'Logan'),
('Tomb of Dracula', 'Blade'),
('Ghost Rider Origins', 'Ghost Rider'),
('Fantastic Four Origins', 'Fantastic Four'),
('Maximum Carnage', 'Venom: Let There Be Carnage'),
('Spider-Verse', 'Spider-Man: Into the Spider-Verse'),
('Venom: Lethal Protector', 'Venom'),
('Secret Wars', 'Secret Wars'),
('Fear Itself', 'Fear Itself'),
('Original Sin', 'Original Sin'),
('Annihilation', 'Guardians of the Galaxy'),
('Siege', 'Thor: The Dark World'),
('Acts of Vengeance', 'The Avengers'),
('The Kree-Skrull War', 'Captain Marvel'),
('Armor Wars', 'Iron Man 2'),
('The Korvac Saga', 'Guardians of the Galaxy Vol. 3'),
('Operation: Galactic Storm', 'Guardians of the Galaxy Vol. 3'),
('The Trial of Jean Grey', 'X-Men: Dark Phoenix'),
('The Eternals Saga', 'Eternals'),
('The Evolutionary War', 'The Avengers: Infinity War'),
('The Clone Saga', 'Spider-Man: No Way Home'),
('Shadowland', 'Daredevil'),
('Secret Invasion', 'Captain Marvel'),
('Infinity', 'Avengers: Infinity War'),
('War of the Realms', 'Thor: Ragnarok');

INSERT INTO PARTICIPATES_IN_EVENT (SuperID, SCID, EventTitle) VALUES
(1, 2, 'Civil War'),
(3, 4, 'Ragnarok'),
(5, 1, 'Infinity War'),
(6, 8, 'Civil War'),  -- Captain America and Black Widow
(2, 6, 'Infinity War'),  -- Iron Man and Happy Hogan
(7, 11, 'World War Hulk'),  -- Hulk and Betty Ross
(8, 17, 'Secret Invasion'),  -- Black Widow and Peggy Carter
(10, 21, 'Wakanda Forever'),  -- Black Panther and Nakia
(12, 43, 'House of M'),  -- Scarlet Witch and Quicksilver
(15, 14, 'Civil War'),  -- Winter Soldier and Falcon
(16, 37, 'Ant-Man Origins'),  -- Ant-Man and Hank Pym
(18, 24, 'Annihilation'),  -- Star-Lord and Mantis
(19, 22, 'Infinity War'),  -- Gamora and Groot
(21, 24, 'Guardians Origins'),  -- Rocket Raccoon and Mantis
(22, 19, 'Guardians Origins'),  -- Groot and Gamora
(23, 25, 'Guardians Origins'),  -- Nebula and Yondu
(24, 18, 'Guardians Origins'),  -- Mantis and Star-Lord
(27, 43, 'Infinity War'),  -- Quicksilver and Scarlet Witch
(28, 14, 'Secret Invasion'),  -- Nick Fury and Falcon
(31, 10, 'Wakanda Forever'),  -- Shuri and Black Panther
(32, 10, 'Wakanda Forever'),  -- Okoye and Black Panther
(35, 6, 'World War II'),  -- Red Skull and Captain America
(36, 2, 'Age of Ultron'),  -- Ultron and Iron Man
(37, 10, 'Wakanda Forever'),  -- Killmonger and Black Panther
(39, 11, 'Infinity War'),  -- Wong and Doctor Strange
(40, 11, 'Sorcerer Supreme'),  -- The Ancient One and Doctor Strange
(9, 7, 'Infinity War'),  -- Hawkeye and Hulk
(4, 34, 'Ragnarok'),  -- Loki and Hela
(13, 12, 'Infinity War'),  -- Vision and Scarlet Witch
(26, 2, 'Infinity War'),  -- War Machine and Iron Man
(29, 28, 'Secret Invasion'),  -- Maria Hill and Nick Fury
(30, 28, 'Secret Invasion'),  -- Phil Coulson and Nick Fury
(14, 1, 'Infinity War'),  -- Falcon and Spider-Man
(11, 3, 'Ragnarok'),  -- Doctor Strange and Thor
(20, 21, 'Guardians Origins'),  -- Drax the Destroyer and Rocket Raccoon
(33, 4, 'Ragnarok'),  -- Valkyrie and Loki
(38, 12, 'Age of Ultron');  -- Erik Selvig and Scarlet Witch



INSERT INTO FIGHT_ENEMIES (SuperID1, SuperID2) VALUES
(1, 5),  -- Spider-Man and Thanos
(2, 5),  -- Iron Man and Thanos
(3, 4),  -- Thor and Loki
(3, 5),  -- Thor and Thanos
(6, 35),  -- Captain America and Red Skull
(7, 36),  -- Hulk and Ultron
(8, 36),  -- Black Widow and Ultron
(9, 36),  -- Hawkeye and Ultron
(10, 37),  -- Black Panther and Killmonger
(11, 36),  -- Doctor Strange and Ultron
(12, 36),  -- Scarlet Witch and Ultron
(13, 36),  -- Vision and Ultron
(14, 36),  -- Falcon and Ultron
(15, 36),  -- Winter Soldier and Ultron
(16, 36),  -- Ant-Man and Ultron
(17, 36),  -- Wasp and Ultron
(18, 36),  -- Star-Lord and Ultron
(19, 36),  -- Gamora and Ultron
(20, 36),  -- Drax the Destroyer and Ultron
(21, 36),  -- Rocket Raccoon and Ultron
(22, 36),  -- Groot and Ultron
(23, 36),  -- Nebula and Ultron
(24, 36),  -- Mantis and Ultron
(25, 36),  -- Yondu and Ultron
(26, 36),  -- War Machine and Ultron
(27, 36),  -- Quicksilver and Ultron
(28, 36),  -- Nick Fury and Ultron
(29, 36),  -- Maria Hill and Ultron
(30, 36),  -- Phil Coulson and Ultron
(31, 36),  -- Shuri and Ultron
(32, 36),  -- Okoye and Ultron
(33, 4),  -- Valkyrie and Loki
(34, 33),  -- Hela and Valkyrie
(35, 6),  -- Red Skull and Captain America
(36, 2),  -- Ultron and Iron Man
(37, 10),  -- Killmonger and Black Panther
(38, 12),  -- Erik Selvig and Scarlet Witch
(39, 36),  -- Wong and Ultron
(40, 36),  -- The Ancient One and Ultron
(9, 37),  -- Hawkeye and Killmonger
(4, 35),  -- Loki and Red Skull
(13, 34),  -- Vision and Hela
(26, 35),  -- War Machine and Red Skull
(29, 37),  -- Maria Hill and Killmonger
(30, 37),  -- Phil Coulson and Killmonger
(14, 34),  -- Falcon and Hela
(20, 35),  -- Drax the Destroyer and Red Skull
(33, 37),  -- Valkyrie and Killmonger
(38, 34);  -- Erik Selvig and Hela


INSERT INTO POWERS_POSSESSED (ID, PowerName) VALUES
(1, 'Web-Slinging'),  -- Spider-Man
(2, 'Flying'),  -- Iron Man
(3, 'Super Strength'),  -- Thor
(4, 'Illusion Casting'),  -- Loki
(5, 'Infinity Gauntlet'),  -- Thanos
(6, 'Super Strength'),  -- Captain America
(7, 'Super Strength'),  -- Hulk
(8, 'Martial Arts'),  -- Black Widow
(9, 'Archery'),  -- Hawkeye
(10, 'Enhanced Senses'),  -- Black Panther
(11, 'Mystical Arts'),  -- Doctor Strange
(12, 'Chaos Magic'),  -- Scarlet Witch
(13, 'Density Control'),  -- Vision
(14, 'Flying'),  -- Falcon
(15, 'Super Strength'),  -- Winter Soldier
(16, 'Size Manipulation'),  -- Ant-Man
(17, 'Size Manipulation'),  -- Wasp
(18, 'Enhanced Reflexes'),  -- Star-Lord
(19, 'Enhanced Physiology'),  -- Gamora
(20, 'Enhanced Strength'),  -- Drax the Destroyer
(21, 'Technopathy'),  -- Rocket Raccoon
(22, 'Regeneration'),  -- Groot
(23, 'Cybernetic Enhancements'),  -- Nebula
(24, 'Empathic Abilities'),  -- Mantis
(25, 'Enhanced Strength'),  -- Yondu
(26, 'Flying'),  -- War Machine
(27, 'Super Speed'),  -- Quicksilver
(28, 'Genius Intellect'),  -- Nick Fury
(29, 'Genius Intellect'),  -- Maria Hill
(30, 'Genius Intellect'),  -- Phil Coulson
(31, 'Genius Intellect'),  -- Shuri
(32, 'Martial Arts'),  -- Okoye
(33, 'Super Strength'),  -- Valkyrie
(34, 'Super Strength'),  -- Hela
(35, 'Super Strength'),  -- Red Skull
(36, 'Technopathy'),  -- Ultron
(37, 'Enhanced Strength'),  -- Killmonger
(38, 'Genius Intellect'),  -- Erik Selvig
(39, 'Mystical Arts'),  -- Wong
(40, 'Mystical Arts'),  -- The Ancient One
(41, 'Telekinesis'),  -- Jean Grey
(42, 'Optic Blasts'),  -- Cyclops
(43, 'Weather Manipulation'),  -- Storm
(44, 'Super Strength'),  -- Beast
(45, 'Teleportation'),  -- Nightcrawler
(46, 'Super Strength'),  -- Colossus
(47, 'Healing Factor'),  -- Wolverine
(48, 'Telepathy'),  -- Professor X
(49, 'Magnetism Control'),  -- Magneto
(50, 'Shape Shifting'),  -- Mystique
(51, 'Healing Factor'),  -- Sabretooth
(52, 'Super Strength'),  -- Juggernaut
(53, 'Healing Factor'),  -- Deadpool
(54, 'Technopathy'),  -- Cable
(55, 'Probability Manipulation'),  -- Domino
(56, 'Telekinesis'),  -- Psylocke
(57, 'Ice Manipulation'),  -- Iceman
(58, 'Flight'),  -- Archangel
(59, 'Phasing'),  -- Kitty Pryde
(60, 'Power Absorption');  -- Rogue


INSERT INTO SUPERHUMAN_REALNAME (heroID, Fname, Mname, Lname) VALUES
(1, 'Peter', 'Benjamin', 'Parker'),  -- Spider-Man
(2, 'Anthony', 'Edward', 'Stark'),  -- Iron Man
(3, 'Thor', '', 'Odinson'),  -- Thor
(4, 'Loki', '', 'Laufeyson'),  -- Loki
(5, 'Thanos', '', ''),  -- Thanos
(6, 'Steven', 'Grant', 'Rogers'),  -- Captain America
(7, 'Bruce', 'Robert', 'Banner'),  -- Hulk
(8, 'Natalia', 'Alianovna', 'Romanova'),  -- Black Widow
(9, 'Clinton', 'Francis', 'Barton'),  -- Hawkeye
(10, 'T\'Challa', 'N/A', 'Udaku'),  -- Black Panther
(11, 'Stephen', 'Vincent', 'Strange'),  -- Doctor Strange
(12, 'Wanda', 'Marya', 'Maximoff'),  -- Scarlet Witch
(13, 'Vision', '', ''),  -- Vision
(14, 'Samuel', 'Thomas', 'Wilson'),  -- Falcon
(15, 'James', 'Buchanan', 'Barnes'),  -- Winter Soldier
(16, 'Scott', 'Edward', 'Lang'),  -- Ant-Man
(17, 'Hope', 'Van Dyne', ''),  -- Wasp
(18, 'Peter', 'Jason', 'Quill'),  -- Star-Lord
(19, 'Gamora', '', ''),  -- Gamora
(20, 'Drax', 'the', 'Destroyer'),  -- Drax the Destroyer
(21, 'Rocket', '', 'Raccoon'),  -- Rocket Raccoon
(22, 'Groot', '', ''),  -- Groot
(23, 'Nebula', '', ''),  -- Nebula
(24, 'Mantis', '', ''),  -- Mantis
(25, 'Yondu', '', 'Udonta'),  -- Yondu
(26, 'James', 'Rupert', 'Rhodes'),  -- War Machine
(27, 'Pietro', 'Django', 'Maximoff'),  -- Quicksilver
(28, 'Nicholas', 'Joseph', 'Fury'),  -- Nick Fury
(29, 'Maria', '', 'Hill'),  -- Maria Hill
(30, 'Philip', 'J.', 'Coulson'),  -- Phil Coulson
(31, 'Shuri', '', 'Udaku'),  -- Shuri
(32, 'Okoye', '', ''),  -- Okoye
(33, 'Brunnhilde', '', ''),  -- Valkyrie
(34, 'Hela', '', 'Odinsdottir'),  -- Hela
(35, 'Johann', 'Shmidt', ''),  -- Red Skull
(36, 'Ultron', '', ''),  -- Ultron
(37, 'Erik', 'Killmonger', 'Stevens'),  -- Killmonger
(38, 'Erik', '', 'Selvig'),  -- Erik Selvig
(39, 'Wong', '', ''),  -- Wong
(40, 'Ancient', '', 'One'),  -- The Ancient One
(41, 'Jean', 'Elaine', 'Grey'),  -- Jean Grey
(42, 'Scott', '', 'Summers'),  -- Cyclops
(43, 'Ororo', '', 'Munroe'),  -- Storm
(44, 'Henry', 'Philip', 'McCoy'),  -- Beast
(45, 'Kurt', '', 'Wagner'),  -- Nightcrawler
(46, 'Piotr', 'Nikolaievitch', 'Rasputin'),  -- Colossus
(47, 'James', 'Logan', 'Howlett'),  -- Wolverine
(48, 'Charles', 'Francis', 'Xavier'),  -- Professor X
(49, 'Max', 'Eisenhardt', ''),  -- Magneto
(50, 'Raven', '', 'Darkholme'),  -- Mystique
(51, 'Victor', '', 'Creed'),  -- Sabretooth
(52, 'Cain', '', 'Marko'),  -- Juggernaut
(53, 'Wade', 'Winston', 'Wilson'),  -- Deadpool
(54, 'Nathan', 'Christopher', 'Summers'),  -- Cable
(55, 'Neena', '', 'Thurman'),  -- Domino
(56, 'Elizabeth', 'Braddock', ''),  -- Psylocke
(57, 'Robert', '', 'Drake'),  -- Iceman
(58, 'Warren', 'Kenneth', 'Worthington III'),  -- Archangel
(59, 'Katherine', 'Anne', 'Pryde'),  -- Kitty Pryde
(60, 'Anna', 'Marie', 'LeBeau');  -- Rogue



INSERT INTO POWER_LEVEL (powerName, strength, control, `range`) VALUES
('Web-Slinging', 80, 90, 70),
('Flying', 90, 85, 100),
('Super Strength', 100, 95, 85),
('Illusion Casting', 75, 80, 60),
('Infinity Gauntlet', 100, 100, 100),
('Super Speed', 85, 80, 90),
('Telepathy', 65, 95, 80),
('Telekinesis', 70, 90, 85),
('Healing Factor', 90, 90, 0),
('Weather Manipulation', 85, 90, 100),
('Magnetism Control', 80, 85, 90),
('Shape Shifting', 70, 80, 70),
('Energy Blasts', 90, 85, 95),
('Size Manipulation', 80, 75, 70),
('Invisibility', 70, 90, 60),
('Invulnerability', 100, 85, 0),
('Fire Manipulation', 85, 80, 90),
('Ice Manipulation', 80, 75, 85),
('Mind Control', 65, 95, 70),
('Teleportation', 75, 85, 100),
('Enhanced Reflexes', 80, 85, 70),
('Martial Arts', 70, 90, 50),
('Archery', 70, 85, 60),
('Genius Intellect', 60, 100, 50),
('Technopathy', 80, 85, 70),
('Cosmic Awareness', 90, 95, 100),
('Psionic Energy', 85, 90, 90),
('Darkforce Manipulation', 80, 85, 80),
('Lightforce Manipulation', 80, 85, 80),
('Photographic Reflexes', 70, 85, 60),
('Time Manipulation', 95, 90, 100),
('Space Manipulation', 95, 90, 100),
('Reality Manipulation', 100, 95, 100),
('Soul Manipulation', 90, 85, 100),
('Elasticity', 75, 80, 85),
('Density Control', 85, 90, 70),
('Sound Manipulation', 70, 85, 90),
('Force Fields', 85, 90, 85),
('Radiation Control', 85, 80, 90),
('Gravity Control', 90, 85, 100),
('Sonic Scream', 70, 75, 80),
('Energy Absorption', 80, 90, 85),
('Energy Projection', 90, 85, 90),
('Regeneration', 95, 90, 0),
('Power Absorption', 85, 80, 70),
('Animal Communication', 70, 85, 60),
('Enhanced Senses', 75, 85, 70),
('Super Agility', 80, 85, 80),
('Pheromone Control', 70, 80, 70);


INSERT INTO MEDIA_AIRTIME (Title, StartDate, EndDate) VALUES
('Avengers: Endgame', '2019-04-26', '2019-08-30'),
('Spider-Man: Homecoming', '2017-07-07', '2017-12-31'),
('Thor: Ragnarok', '2017-11-03', '2018-03-15'),
('Iron Man', '2008-05-02', '2008-09-30'),
('Captain America: The First Avenger', '2011-07-22', '2011-11-30'),
('Guardians of the Galaxy', '2014-08-01', '2014-12-15'),
('Black Panther', '2018-02-16', '2018-07-04'),
('Doctor Strange', '2016-11-04', '2017-03-15'),
('Ant-Man', '2015-07-17', '2015-11-30'),
('Captain Marvel', '2019-03-08', '2019-07-31'),
('Avengers: Infinity War', '2018-04-27', '2018-09-15'),
('Avengers: Age of Ultron', '2015-05-01', '2015-09-30'),
('The Avengers', '2012-05-04', '2012-10-31'),
('Thor: The Dark World', '2013-11-08', '2014-03-15'),
('Iron Man 2', '2010-05-07', '2010-10-30'),
('Iron Man 3', '2013-05-03', '2013-10-31'),
('Captain America: The Winter Soldier', '2014-04-04', '2014-09-15'),
('Captain America: Civil War', '2016-05-06', '2016-10-15'),
('Guardians of the Galaxy Vol. 2', '2017-05-05', '2017-10-30'),
('Ant-Man and The Wasp', '2018-07-06', '2018-12-15'),
('Spider-Man: Far From Home', '2019-07-02', '2019-11-30'),
('WandaVision', '2021-01-15', '2021-03-05'),
('The Falcon and The Winter Soldier', '2021-03-19', '2021-04-23'),
('Loki', '2021-06-09', '2021-07-14'),
('Hawkeye', '2021-11-24', '2021-12-22'),
('What If...?', '2021-08-11', '2021-10-06'),
('The Incredible Hulk', '2008-06-13', '2008-10-30'),
('Eternals', '2021-11-05', '2022-03-15'),
('Shang-Chi and the Legend of the Ten Rings', '2021-09-03', '2021-12-15'),
('Ms. Marvel', '2022-06-08', '2022-07-13'),
('Moon Knight', '2022-03-30', '2022-05-04'),
('She-Hulk: Attorney at Law', '2022-08-18', '2022-10-13'),
('Black Widow', '2021-07-09', '2021-11-15'),
('Spider-Man: No Way Home', '2021-12-17', '2022-04-30'),
('X-Men', '2000-07-14', '2000-12-15'),
('X2: X-Men United', '2003-05-02', '2003-10-15'),
('X-Men: The Last Stand', '2006-05-26', '2006-10-30'),
('X-Men: First Class', '2011-06-03', '2011-10-31'),
('X-Men: Days of Future Past', '2014-05-23', '2014-09-30'),
('X-Men: Apocalypse', '2016-05-27', '2016-10-15'),
('X-Men: Dark Phoenix', '2019-06-07', '2019-10-30'),
('Deadpool', '2016-02-12', '2016-06-30'),
('Deadpool 2', '2018-05-18', '2018-09-30'),
('The New Mutants', '2020-08-28', '2020-12-15'),
('The Wolverine', '2013-07-26', '2013-12-15'),
('Logan', '2017-03-03', '2017-07-15'),
('Blade', '1998-08-21', '1998-12-31'),
('Blade II', '2002-03-22', '2002-07-31'),
('Blade: Trinity', '2004-12-08', '2005-03-31'),
('Daredevil', '2003-02-14', '2003-06-30'),
('The Punisher', '2004-04-16', '2004-08-31'),
('Punisher: War Zone', '2008-12-05', '2009-04-30'),
('Ghost Rider', '2007-02-16', '2007-06-30'),
('Ghost Rider: Spirit of Vengeance', '2012-02-17', '2012-06-30'),
('Fantastic Four', '2005-07-08', '2005-11-30'),
('Fantastic Four: Rise of the Silver Surfer', '2007-06-15', '2007-10-30'),
('Fantastic Four (2015)', '2015-08-07', '2015-12-15'),
('Venom', '2018-10-05', '2019-01-30'),
('Venom: Let There Be Carnage', '2021-10-01', '2022-01-30'),
('Morbius', '2022-04-01', '2022-07-31');



INSERT INTO EVENT_ARC_DATE (Title, StartDate, EndDate) VALUES
('Civil War', '2006-05-01', '2007-01-01'),
('Infinity War', '2018-04-27', '2018-09-30'),
('Ragnarok', '2017-11-03', '2018-03-15'),
('Secret Invasion', '2008-06-01', '2009-01-01'),
('Dark Phoenix Saga', '1980-01-01', '1980-10-01'),
('Days of Future Past', '1981-01-01', '1981-02-01'),
('Age of Ultron', '2013-05-01', '2013-11-01'),
('House of M', '2005-06-01', '2005-11-01'),
('Secret Wars', '1984-05-01', '1985-12-01'),
('Avengers Disassembled', '2004-08-01', '2004-12-01'),
('World War Hulk', '2007-05-01', '2007-11-01'),
('Fear Itself', '2011-04-01', '2011-12-01'),
('Annihilation', '2006-03-01', '2007-03-01'),
('Siege', '2010-01-01', '2010-05-01'),
('Original Sin', '2014-05-01', '2014-09-01'),
('Axis', '2014-10-01', '2015-01-01'),
('Infinity', '2013-08-01', '2013-12-01'),
('War of the Realms', '2019-04-01', '2019-07-01'),
('The Clone Saga', '1994-10-01', '1996-12-01'),
('Spider-Verse', '2014-11-01', '2015-02-01'),
('Maximum Carnage', '1993-04-01', '1993-09-01'),
('Shadowland', '2010-07-01', '2011-01-01'),
('Operation: Galactic Storm', '1992-03-01', '1992-12-01'),
('Planet Hulk', '2006-04-01', '2007-06-01'),
('The Winter Soldier', '2005-01-01', '2006-01-01'),
('The Infinity Gauntlet', '1991-07-01', '1991-12-01'),
('Acts of Vengeance', '1989-12-01', '1990-03-01'),
('The Kree-Skrull War', '1971-06-01', '1972-03-01'),
('The Eternals Saga', '1976-07-01', '1977-05-01'),
('The Evolutionary War', '1988-06-01', '1988-09-01'),
('Armor Wars', '1987-12-01', '1988-06-01'),
('The Trial of Jean Grey', '2014-01-01', '2014-06-01'),
('The Korvac Saga', '1978-06-01', '1979-03-01'),
('Secret Empire', '2017-04-01', '2017-09-01');


INSERT INTO EVENT_ARC (Title, Outcome, PublisherName) VALUES
-- Missing data that is needed for ADAPTS table
('Avengers Assemble', 'Unknown', 'Marvel Comics'),
('The Dark World', 'Unknown', 'Marvel Comics'),
('Demon in a Bottle', 'Unknown', 'Marvel Comics'),
('Extremis', 'Unknown', 'Marvel Comics'),
('Winter Soldier', 'Unknown', 'Marvel Comics'),
('Guardians Origins', 'Unknown', 'Marvel Comics'),
('Ant-Man Origins', 'Unknown', 'Marvel Comics'),
('Kree-Skrull War', 'Unknown', 'Marvel Comics'),
('Journey Into Mystery', 'Unknown', 'Marvel Comics'),
('My Life as a Weapon', 'Unknown', 'Marvel Comics'),
('What If?', 'Unknown', 'Marvel Comics'),
('The New Mutants', 'Unknown', 'Marvel Comics'),
('The Dark Phoenix Saga', 'Unknown', 'Marvel Comics'),
('Old Man Logan', 'Unknown', 'Marvel Comics'),
('Tomb of Dracula', 'Unknown', 'Marvel Comics'),
('Ghost Rider Origins', 'Unknown', 'Marvel Comics'),
('Fantastic Four Origins', 'Unknown', 'Marvel Comics'),
('Venom: Lethal Protector', 'Unknown', 'Marvel Comics');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

----
CREATE USER 'Yami2'@'vergil.u.washington.edu' IDENTIFIED BY 'YES';