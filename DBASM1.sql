-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: asm1
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `donation`
--
CREATE DATABASE asm1;
use asm1;

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `visited` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (4,'AK212UPDATE',NULL,'NhÃÂ¡ÃÂºÃÂ­p nÃÂ¡ÃÂ»ÃÂi dung2313132','2023-07-14',528000,'XXXX','Phi thÃÂ¡ÃÂ»ÃÂ thao','0901302102','2023-07-09',3,0),(5,'AOK212',NULL,'Hello','2023-07-29',0,'Tre em ngheo','WHO','123123123','2023-07-09',0,1),(6,'CCK123',NULL,'Nháº­p ná»i dung sadasdasd','2023-07-22',124000,'To chuc chong Ung thu','Tu thien','1233123','2023-07-02',3,0),(7,'KXUPDATE',NULL,'Tu thien','2023-07-16',0,'Khuyet tat','Some','090131221','2023-07-02',0,1),(8,'FBI123',NULL,'Ok','2023-07-12',19000,'The White','wqe','0901311231','2023-07-02',2,0),(9,'ADD1',NULL,'Cho ngÆ°á»i giÃ ','2023-07-03',0,'HALALA','fifa','1233123123','2023-07-02',1,0),(10,'ON23UPDATE',NULL,'Qua de','2023-08-23',0,'Cuu nguoi khuyet tat','UEFA','321312312','2023-07-02',1,0),(11,'KXY31',NULL,'Ung ho tre em','2023-08-20',0,'Vi tre em','WBA','1231331','2023-07-10',1,0),(12,'AKJDKJAsdfdsfs',NULL,'Ung ho moi nguoi','2023-07-20',0,'adaffsdf231','UEFA','3213123','2023-07-02',1,0),(13,'Anew',NULL,'Chao moi nguoi','2023-07-16',700000,'A new donation','WHP','123123','2023-07-02',1,0),(14,'NewAD',NULL,'Thu nghiem lan thu 4','2023-07-29',0,'LEONA Frank','ASIANA','090121313','2023-07-02',0,0);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'2 LÃª LÆ¡i quáº­n 1','Kayako Update','noted','123456','99991311',0,'kayako','Ok',2,'kayako@yahoo.com'),(4,'5 Nguyễn Huệ, Quận 1','Tom Cat',NULL,'0000','223456565',1,'tomCatVersion9',NULL,2,'tomCat@ser.com'),(6,'Address2','Full Name 2','Note 2','Password2','2313142',1,'Username2','2023-07-12',2,'email2@example.com'),(7,'Address3','Full Name 3','Note 3','Password3','77773',1,'Username3','2023-07-12',2,'email3@example.com'),(8,'Address4','Full Name 4','Note 4','Password4','1232131',0,'Username4','2023-07-12',2,'email4@example.com'),(9,'Address5','Full Name 5','Note 5','Password5','778979',0,'Username5','2023-07-12',2,'email5@example.com'),(10,'Address6','Full Name 6','Note 6','Password6','565756',1,'Username6','2023-07-12',2,'email6@example.com'),(11,'Address7','Full Name 7','Note 7','Password7','798667',1,'Username7','2023-07-12',2,'email7@example.com'),(12,'Address8','Full Name 8UPDATE','Note 8','Password8','34536',1,'Username8','2023-07-12',2,'email8@example.com'),(14,'Address10','Full Name 10','Note 10','Password10','12312309',0,'Username10','2023-07-12',2,'email10@example.com'),(15,'Address11','Full Name 11','Note 11','Password11','099123123',1,'Username11','2023-07-12',2,'email11@example.com'),(16,'Address12','Full Name 12','Note 12','Password12','1212312',0,'Username12','2023-07-12',1,'email12@example.com'),(17,'Address13','Full Name 13','Note 13','Password13','898998',1,'Username13','2023-07-12',2,'email13@example.com'),(18,'Address14','Full Name 14','Note 14','Password14','213123',1,'Username14','2023-07-12',2,'email14@example.com'),(19,'Address15','Full Name 15','Note 15','Password15','100015',1,'Username15','2023-07-12',2,'email15@example.com'),(20,'Address16','Full Name 16','Note 16','Password16','83216',1,'Username16','2023-07-12',2,'email16@example.com'),(21,'Address17','Full Name 17','Note 17','Password17','234655138',0,'Username17','2023-07-12',2,'email17@example.com'),(25,'gjjg','Mr An',NULL,'7777','0901302199',0,'anAU',NULL,2,'an.lennon2014@gmail.com'),(26,'1 Nguyễn Huệ, Quận 1','KenShin',NULL,'87','0901302122',0,'MrKen',NULL,2,'an.lennon2014@gmail.com'),(27,'34 Sư vạn hạnh','Harry Porter',NULL,'010001','113',1,'harryPorter',NULL,2,'harry@hogwarts.edu.uk'),(29,'23 Baker str','Luis II',NULL,'3425adad','12314345',0,'luisII',NULL,2,'luisII@fr.com.vn'),(30,'312 Cong Hoa Str','Addnew',NULL,'213123','213213',0,'addnew213',NULL,2,'Addnew@gmail.com'),(31,'23 Truong dinh','New User',NULL,'989898','1223131',0,'newUser',NULL,2,'newuser@cnn.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_donation`
--

DROP TABLE IF EXISTS `user_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` varchar(255) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `test` varchar(255) DEFAULT NULL,
  `donation_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `donation_id` (`donation_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_donation_ibfk_1` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`),
  CONSTRAINT `user_donation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_donation`
--

LOCK TABLES `user_donation` WRITE;
/*!40000 ALTER TABLE `user_donation` DISABLE KEYS */;
INSERT INTO `user_donation` VALUES (3,'2023-07-19',450000,'Paul mccartney',1,'cho tien do',4,NULL),(4,'2023-07-20',34000,'Ringo',2,'Tien boi thuong',4,NULL),(5,'2023-07-20',23000,'Ringo',1,'Cuu nguoi',4,NULL),(6,'2023-07-20',55000,'Elton John',1,'Chuc suc khoe',4,NULL),(7,'2023-07-20',45000,'Maroon 5',2,'Thich cho tien',4,NULL),(10,'2023-07-20',19000,'Mr John',1,'Cho tien tu thien',8,NULL),(11,'2023-07-20',34000,'Amin Test',1,'Testing the final problem',6,NULL),(12,'2023-07-20',90000,'Admin2 test ',1,'Test',6,NULL),(13,'2023-07-20',5000,'Ãu há»ng Ã¢n',2,'Tra no ngan hang',11,NULL),(14,'2023-07-20',300000,'Ricardo Kaka',1,'Thich tang tien',13,NULL),(15,'2023-07-20',400000,'Donald peter',1,'Cho tre em ngoan',13,NULL),(16,'2023-07-20',3000,'Tester',2,'testing',8,NULL);
/*!40000 ALTER TABLE `user_donation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-20 18:25:14
