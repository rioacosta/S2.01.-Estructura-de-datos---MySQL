-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: youtubemini
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `idChannel` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` text NOT NULL,
  `CreationDate` date NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idChannel`),
  KEY `fk_User_Channel_idx` (`idUser`),
  CONSTRAINT `fk_User_Channel` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'CryptoBros','Crypto y mas','2025-01-01',1),(2,'Espiritualidad para programadores','hay vida despues del codigo','2025-02-01',2),(3,'Maquillaje con Sofia','Filosofia y maquillaje para todo publico','2025-03-01',3);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `idComment` int NOT NULL AUTO_INCREMENT,
  `Text` text NOT NULL,
  `CommentDateTime` datetime NOT NULL,
  `idUser` int NOT NULL,
  `idVideo` int NOT NULL,
  PRIMARY KEY (`idComment`),
  KEY `fk_User_Comment_idx` (`idUser`),
  KEY `fk_Video_Comment_idx` (`idVideo`),
  CONSTRAINT `fk_User_Comment` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Video_Comment` FOREIGN KEY (`idVideo`) REFERENCES `video` (`idVideo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Bullshit!','2025-04-10 10:30:00',1,2),(2,'Very helpful','2025-04-11 11:30:00',2,1),(3,'I loved it!','2025-04-12 12:30:00',3,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentreaction`
--

DROP TABLE IF EXISTS `commentreaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentreaction` (
  `idComment` int NOT NULL,
  `idUser` int NOT NULL,
  `ReactionType` enum('like','dislike') NOT NULL,
  `ReactionDateTime` datetime NOT NULL,
  PRIMARY KEY (`idComment`,`idUser`),
  KEY `fk_Comment_idx` (`idComment`),
  KEY `fk_CommentReaction_User` (`idUser`),
  CONSTRAINT `fk_CommentReaction_Comment` FOREIGN KEY (`idComment`) REFERENCES `comment` (`idComment`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CommentReaction_User` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentreaction`
--

LOCK TABLES `commentreaction` WRITE;
/*!40000 ALTER TABLE `commentreaction` DISABLE KEYS */;
INSERT INTO `commentreaction` VALUES (1,2,'like','2025-04-10 11:00:00'),(2,3,'dislike','2025-04-11 12:00:00'),(3,1,'like','2025-04-12 13:00:00');
/*!40000 ALTER TABLE `commentreaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `idPlaylist` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `Visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `idUser` int NOT NULL,
  PRIMARY KEY (`idPlaylist`),
  KEY `fk_User_Playlist_idx` (`idUser`),
  CONSTRAINT `fk_User_Playlist` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Musica para estudiar','2025-04-05 15:00:00','public',1),(2,'Junta dos sillas y acuesta al niño','2025-04-06 16:00:00','private',2),(3,'Hardcore kawai','2025-04-07 17:00:00','public',3);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlistvideo`
--

DROP TABLE IF EXISTS `playlistvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlistvideo` (
  `idPlaylist` int NOT NULL,
  `idVideo` int NOT NULL,
  PRIMARY KEY (`idPlaylist`,`idVideo`),
  KEY `fk_Playlist_idx` (`idPlaylist`),
  KEY `fk_Video_idx` (`idVideo`),
  CONSTRAINT `fk_PlaylistVideo_Playlist` FOREIGN KEY (`idPlaylist`) REFERENCES `playlist` (`idPlaylist`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PlaylistVideo_Video` FOREIGN KEY (`idVideo`) REFERENCES `video` (`idVideo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlistvideo`
--

LOCK TABLES `playlistvideo` WRITE;
/*!40000 ALTER TABLE `playlistvideo` DISABLE KEYS */;
INSERT INTO `playlistvideo` VALUES (1,1),(1,2),(2,3),(3,1),(3,3);
/*!40000 ALTER TABLE `playlistvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `idSubscriber` int NOT NULL,
  `idChannel` int NOT NULL,
  `SubscriptionDate` datetime NOT NULL,
  PRIMARY KEY (`idSubscriber`,`idChannel`),
  KEY `fk_Channel_idx` (`idChannel`),
  CONSTRAINT `fk_Channel` FOREIGN KEY (`idChannel`) REFERENCES `channel` (`idChannel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Subscriber` FOREIGN KEY (`idSubscriber`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,2,'2025-04-01 08:00:00'),(2,3,'2025-04-02 09:00:00'),(3,1,'2025-04-03 10:00:00');
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `idTag` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idTag`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Education'),(2,'Entertainment'),(3,'Technology');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(60) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Username` varchar(60) NOT NULL,
  `BirthDate` date NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Country` varchar(20) NOT NULL,
  `PostalCode` int NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lalai@example.com','password123','Marco','1990-01-01','M','USA',22222),(2,'loloi@example.com','password321','Laura','1995-05-15','F','Canada',11111),(3,'lere@example.com','password111','Kay','1988-08-20','O','UK',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `idVideo` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(60) NOT NULL,
  `Description` text,
  `Size` decimal(10,2) NOT NULL,
  `FileName` varchar(100) NOT NULL,
  `Duration` time NOT NULL,
  `Thumbnail` blob NOT NULL,
  `Views` int NOT NULL DEFAULT '0',
  `Likes` int NOT NULL DEFAULT '0',
  `Dislikes` int NOT NULL DEFAULT '0',
  `Visibility` enum('public','hidden','private') NOT NULL DEFAULT 'public',
  `idUser` int NOT NULL,
  `UploadDateTime` datetime NOT NULL,
  PRIMARY KEY (`idVideo`),
  KEY `fk_User_idx` (`idUser`),
  CONSTRAINT `fk_User_Video` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'Como entrenar a tu huron','Tecnica y herramientas para entrenar a tu huron',102.50,'video1.mp4','00:30:30',_binary '0x1234',100,10,2,'public',1,'2025-04-01 10:00:00'),(2,'No lo vas a creer cuando lo veas','Video poco sorprendente con un nombre clickbait',204.80,'video2.mp4','00:10:15',_binary '0x5678',200,20,4,'hidden',2,'2025-04-02 11:00:00'),(3,'Como usar mysql y no morir en el intento','No se puede jaja te mueres pero no es find de mundo',150.00,'video3.mp4','00:07:45',_binary '0x9abc',150,15,3,'private',3,'2025-04-03 12:00:00');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoreaction`
--

DROP TABLE IF EXISTS `videoreaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videoreaction` (
  `idUser` int NOT NULL,
  `idVideo` int NOT NULL,
  `ReactionType` enum('like','dislike') NOT NULL,
  `ReactionDateTime` datetime NOT NULL,
  PRIMARY KEY (`idUser`,`idVideo`),
  KEY `fk_Video_idx` (`idVideo`),
  CONSTRAINT `fk_User_Reaction` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Video_Reaction` FOREIGN KEY (`idVideo`) REFERENCES `video` (`idVideo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoreaction`
--

LOCK TABLES `videoreaction` WRITE;
/*!40000 ALTER TABLE `videoreaction` DISABLE KEYS */;
INSERT INTO `videoreaction` VALUES (1,2,'like','2025-04-01 12:00:00'),(2,1,'dislike','2025-04-02 13:00:00'),(3,1,'like','2025-04-03 14:00:00');
/*!40000 ALTER TABLE `videoreaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videotag`
--

DROP TABLE IF EXISTS `videotag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videotag` (
  `idVideo` int NOT NULL,
  `idTag` int NOT NULL,
  PRIMARY KEY (`idVideo`,`idTag`),
  KEY `fk_Video_idx` (`idVideo`),
  KEY `fk_Tag_idx` (`idTag`),
  CONSTRAINT `fk_VideoTag_Tag` FOREIGN KEY (`idTag`) REFERENCES `tag` (`idTag`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_VideoTag_Video` FOREIGN KEY (`idVideo`) REFERENCES `video` (`idVideo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videotag`
--

LOCK TABLES `videotag` WRITE;
/*!40000 ALTER TABLE `videotag` DISABLE KEYS */;
INSERT INTO `videotag` VALUES (1,1),(1,2),(2,3),(3,1),(3,3);
/*!40000 ALTER TABLE `videotag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-17 23:20:28
