-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: first_db
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birth` date DEFAULT NULL,
  `biography` text,
  `nationality` varchar(100) DEFAULT NULL,
  `awards` varchar(255) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `blog` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.K. Rowling','1965-07-31','British author best known for the \"Harry Potter\" series.','British','Multiple awards including the Hugo Award and British Book Awards','www.jkrowling.com','www.jkrowling.com/blog'),(2,'Stephen King','1947-09-21','American author known for his horror, supernatural fiction, suspense, and fantasy novels.','American','Multiple awards including Bram Stoker Awards and World Fantasy Awards','www.stephenking.com','www.stephenking.com/news'),(3,'Agatha Christie','1890-09-15','British writer known for her detective novels, particularly those featuring Hercule Poirot and Miss Marple.','British','Multiple awards including the Edgar Award and Agatha Award',NULL,NULL),(4,'George R.R. Martin','1948-09-20','American novelist and short story writer, best known for his series of epic fantasy novels, \"A Song of Ice and Fire,\" which was adapted into the television series \"Game of Thrones.\"','American','Hugo, Nebula, and Bram Stoker Awards','www.georgerrmartin.com','www.georgerrmartin.com/notablog'),(5,'Toni Morrison','1931-02-18','American novelist, essayist, editor, and professor, known for her novels exploring the African American experience.','American','Nobel Prize in Literature, Pulitzer Prize for Fiction',NULL,NULL),(6,'Neil Gaiman','1960-11-10','British author known for his works of fantasy and horror fiction, graphic novels, and comics.','British','Multiple awards including Hugo, Nebula, and Bram Stoker Awards','www.neilgaiman.com','www.neilgaiman.com/journal'),(7,'Margaret Atwood','1939-11-18','Canadian poet, novelist, literary critic, and essayist, known for her works of fiction and poetry.','Canadian','Booker Prize, Arthur C. Clarke Award, and Governor General\'s Award','www.margaretatwood.ca','www.margaretatwood.ca/news');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isbn` char(13) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `edition` tinyint unsigned DEFAULT '1',
  `year_published` year DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `pages` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `reviews` int DEFAULT NULL,
  `rating` double(3,2) DEFAULT NULL,
  `status` enum('Sold','Available','Borrowed','Restocking') DEFAULT 'Available',
  PRIMARY KEY (`id`),
  KEY `genre_id` (`genre_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'9780590353427','Harry Potter and the Philosopher\'s Stone',1,1997,10.99,320,1,1,1,10000,4.70,'Available'),(2,'9780439064866','Harry Potter and the Chamber of Secrets',1,1998,11.99,352,1,1,1,9500,4.60,'Available'),(3,'9780439136365','Harry Potter and the Prisoner of Azkaban',1,1999,12.99,448,1,1,1,9200,4.80,'Available'),(4,'9780439139601','Harry Potter and the Goblet of Fire',1,2000,13.99,640,1,1,1,8700,4.90,'Available'),(5,'9780439358071','Harry Potter and the Order of the Phoenix',1,2003,14.99,896,1,1,1,8500,4.80,'Available'),(6,'9780439784542','Harry Potter and the Half-Blood Prince',1,2005,15.99,672,1,1,1,8200,4.80,'Available'),(7,'9780545010221','Harry Potter and the Deathly Hallows',1,2007,16.99,784,1,1,1,8100,4.90,'Available'),(8,'9781501175466','The Shining',1,1977,9.99,688,7,2,2,9500,4.50,'Available'),(9,'9780307743657','The Stand',1,1978,10.99,1152,7,2,2,9200,4.60,'Available'),(10,'9780451169532','Misery',1,1987,11.99,368,7,2,2,8900,4.70,'Available'),(11,'9781501166273','It',1,1986,12.99,1168,7,2,2,8600,4.80,'Available'),(12,'9781501142970','The Girl on the Train',1,2015,13.99,336,2,3,3,9300,4.40,'Available'),(13,'9781594634024','Gone Girl',1,2012,14.99,432,2,3,3,9200,4.50,'Available'),(14,'9780385349956','The Da Vinci Code',1,2003,15.99,592,2,3,3,9000,4.60,'Available'),(15,'9780062315007','Crazy Rich Asians',1,2013,16.99,544,3,4,4,9500,4.30,'Available'),(16,'9780525555713','The Hating Game',1,2016,17.99,384,3,4,4,9400,4.40,'Available'),(17,'9780345535527','The Notebook',1,1996,18.99,256,3,4,4,9100,4.50,'Available'),(18,'9780143135169','The Silent Patient',1,2019,19.99,352,7,5,5,9600,4.20,'Available'),(19,'9780446675536','Big Little Lies',1,2014,20.99,480,7,5,5,9500,4.30,'Available'),(20,'9781538718466','The Woman in the Window',1,2018,21.99,448,7,5,5,9400,4.40,'Available'),(21,'9781982123966','The Night Circus',1,2011,22.99,512,4,6,6,9300,4.10,'Available'),(22,'9780062073459','The Starless Sea',1,2019,23.99,512,4,6,6,9200,4.20,'Available'),(23,'9780061854149','Neverwhere',1,1996,24.99,448,4,6,6,9000,4.30,'Available'),(24,'9780385472579','The Testaments',1,2019,25.99,432,14,7,7,9900,4.00,'Available'),(25,'9780525559063','The Handmaid\'s Tale',1,1985,26.99,311,14,7,7,9800,4.10,'Available'),(26,'9781444767465','The Blind Assassin',1,2000,27.99,637,14,7,7,9700,4.20,'Available'),(27,'9780062273092','American Gods',1,2001,28.99,635,6,1,6,9500,4.00,'Available'),(28,'9780062457738','Norse Mythology',1,2017,29.99,304,6,1,6,9400,4.10,'Available'),(29,'9780060735273','Stardust',1,1999,30.99,288,6,1,6,9300,4.20,'Available'),(30,'9780385671753','Oryx and Crake',1,2003,31.99,374,6,1,6,9200,4.30,'Available'),(31,'9780385475723','Cat\'s Eye',1,1988,32.99,446,6,1,6,9100,4.40,'Available'),(32,'9780385544337','The Testaments',1,2019,33.99,432,14,1,7,9000,4.50,'Available'),(33,'9780385544290','The Handmaid\'s Tale',1,1985,34.99,311,14,1,7,8900,4.60,'Available'),(34,'9780385653453','The Blind Assassin',1,2000,35.99,637,14,1,7,8800,4.70,'Available');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Doe','123 Main St, Anytown, USA','+1 555-123-4567','john.doe@example.com','johndoe123'),(2,'Alice Smith','456 Elm St, Anycity, USA','+1 555-987-6543','alice.smith@example.com','alicesmith456'),(3,'Robert Johnson','789 Oak St, Anyville, USA','+1 555-567-8901','robert.johnson@example.com','robertjohnson789'),(4,'Emily Brown','101 Pine St, Anystate, USA','+1 555-234-5678','emily.brown@example.com','emilybrown101'),(5,'Michael Wilson','222 Maple St, Anycity, USA','+1 555-876-5432','michael.wilson@example.com','michaelwilson222'),(6,'Sarah Martinez','333 Oak St, Anytown, USA','+1 555-345-6789','sarah.martinez@example.com','sarahmartinez333'),(7,'David Miller','444 Pine St, Anystate, USA','+1 555-987-6543','david.miller@example.com','davidmiller444');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fiction','Literature created from the imagination, not based on real events or people.'),(2,'Mystery','Novels focused on solving a crime or puzzle, often involving a detective or amateur sleuth.'),(3,'Romance','Novels primarily focusing on the romantic relationship between characters, often with a happy ending.'),(4,'Fantasy','Novels featuring magical or supernatural elements, often set in imaginary worlds with their own rules and mythology.'),(5,'Science Fiction','Exploring speculative concepts such as futuristic technology, space exploration, and alternate realities.'),(6,'Thriller','Characterized by tension, suspense, and excitement, often involving danger and high stakes.'),(7,'Horror','Aiming to evoke fear, dread, and suspense, often featuring supernatural elements, monsters, or psychological terror.'),(8,'Historical Fiction','Set in the past and seeking to recreate the atmosphere, events, and characters of a particular time period.'),(9,'Young Adult','Novels aimed at readers aged 12 to 18, often exploring themes relevant to teenagers, such as identity, relationships, and coming-of-age.'),(10,'Mystery Thriller','Combining elements of mystery and thriller genres, featuring suspenseful plots with a focus on solving a crime or unraveling a mystery.'),(11,'Contemporary','Set in the present time and dealing with current issues and themes relevant to modern society.'),(12,'Adventure','Involving exciting journeys, quests, or expeditions, often featuring daring feats, exploration, and challenges.'),(13,'Drama','Focusing on realistic portrayals of human emotions, relationships, and conflicts, often exploring complex themes and character development.'),(14,'Poetry','Using language to evoke emotions and express ideas, often characterized by rhythm, meter, and vivid imagery.'),(15,'Biography','Telling the life story of a real person, often focusing on significant events, achievements, and experiences.');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `book_ids` text,
  `loan_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `due_date` datetime DEFAULT ((now() + interval 1 month)),
  `return_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,'1','2024-02-14 13:56:43','2024-03-14 13:56:43','2024-02-14 13:57:05'),(2,1,'2','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(3,2,'31','2024-02-14 13:56:43','2024-03-14 13:56:43','2024-02-14 13:57:05'),(4,3,'23','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(5,4,'15','2024-02-14 13:56:43','2024-03-14 13:56:43','2024-02-14 13:57:05'),(6,5,'34','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(7,6,'24','2024-02-14 13:56:43','2024-03-14 13:56:43','2024-02-14 13:57:05'),(8,7,'14','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(9,1,'18','2024-02-14 13:56:43','2024-03-14 13:56:43','2024-02-14 13:57:05'),(10,1,'6','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(11,2,'27','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(12,3,'9','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(13,4,'12','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(14,5,'6','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(15,6,'11,17,18','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(16,7,'3,4','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(17,1,'5,7','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(18,2,'5','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(19,3,'19','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(20,4,'33','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(21,5,'35','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(22,6,'26,8','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(23,7,'25,7,3','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(24,1,'32','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(25,2,'27','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(26,3,'24,16,13','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(27,4,'18,15,22','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(28,5,'20,13','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(29,6,'12,17','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(30,7,'31,5','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL),(31,1,'29,30','2024-02-14 13:56:43','2024-03-14 13:56:43',NULL);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `publications_number` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Penguin Random House','1745 Broadway, New York, NY 10019, USA','+1 212-782-9000','www.penguinrandomhouse.com','info@penguinrandomhouse.com',1000),(2,'HarperCollins Publishers','195 Broadway, New York, NY 10007, USA','+1 212-207-7000','www.harpercollins.com','info@harpercollins.com',700),(3,'Simon & Schuster','1230 Avenue of the Americas, New York, NY 10020, USA','+1 212-698-7000','www.simonandschuster.com','info@simonandschuster.com',500),(4,'Hachette Book Group','1290 Avenue of the Americas, New York, NY 10104, USA','+1 212-364-1100','www.hachettebookgroup.com','info@hachettebookgroup.com',400),(5,'Macmillan Publishers','120 Broadway, New York, NY 10271, USA','+1 212-226-7520','us.macmillan.com','info@macmillan.com',300),(6,'Scholastic Corporation','557 Broadway, New York, NY 10012, USA','+1 212-343-6100','www.scholastic.com','info@scholastic.com',200),(7,'Bloomsbury Publishing','1385 Broadway, New York, NY 10018, USA','+1 212-419-5800','www.bloomsbury.com','info@bloomsbury.com',150);
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 10:55:49
