-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: vitrine
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` varchar(20) NOT NULL,
  `title_en` varchar(50) NOT NULL,
  `title_ro` varchar(50) NOT NULL,
  `title_ru` varchar(50) NOT NULL,
  `long_desc_en` varchar(255) DEFAULT NULL,
  `long_desc_ro` varchar(255) DEFAULT NULL,
  `long_desc_ru` varchar(255) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  UNIQUE KEY `pages_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `title_en`, `title_ro`, `title_ru`, `long_desc_en`, `long_desc_ro`, `long_desc_ru`, `meta`) VALUES ('about','Test lang','Test lăng','Тэст','<p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p><p><br></p><p>Test Test&nbsp;Test Test&nbsp;</p>','<p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  Tăst Tăst Tăst </p><p><br></p><p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  Tăst Tăst Tăst </p><p><br></p><p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  Tăst Tăst Tăst </p><p><br></p><p>Tăst Tăst  Tăst Tăst Tăst  Tăst Tăst  T','<p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест тест тест тест</p><p><br></p><p>тест тест тест тест тест','Professional auto tuning atelier. Custom projects, quality, and experience. Turbo kits,  Exhaust & intake systems,  ECU tuning,  Custom wiring.');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_photos`
--

DROP TABLE IF EXISTS `pages_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_photos_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_photos`
--

LOCK TABLES `pages_photos` WRITE;
/*!40000 ALTER TABLE `pages_photos` DISABLE KEYS */;
INSERT INTO `pages_photos` (`id`, `page_id`, `name`) VALUES (9,'about','img_6943cf9e4581b4.95804031.jpg'),(10,'about','img_6943cf9e45a012.67708170.jpg');
/*!40000 ALTER TABLE `pages_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_photos`
--

DROP TABLE IF EXISTS `project_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_photos`
--

LOCK TABLES `project_photos` WRITE;
/*!40000 ALTER TABLE `project_photos` DISABLE KEYS */;
INSERT INTO `project_photos` (`id`, `project_id`, `name`) VALUES (1,1,'project_2.jpg'),(2,1,'project_3.jpg'),(3,1,'project_4.jpg'),(4,1,'project_5.jpg'),(5,1,'project_6.jpg'),(23,4,'img_693c16ecabd1f7.07478982.jpg'),(24,4,'img_693c16ecac0800.40192603.jpg');
/*!40000 ALTER TABLE `project_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` char(20) NOT NULL,
  `order_index` int(11) NOT NULL,
  `title_ro` char(100) DEFAULT NULL,
  `title_ru` char(100) DEFAULT NULL,
  `title_en` char(100) DEFAULT NULL,
  `long_descriprion_ro` varchar(600) DEFAULT NULL,
  `long_descriprion_ru` varchar(600) DEFAULT NULL,
  `long_descriprion_en` varchar(600) DEFAULT NULL,
  `logo` char(50) DEFAULT NULL,
  `meta` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `uri`, `order_index`, `title_ro`, `title_ru`, `title_en`, `long_descriprion_ro`, `long_descriprion_ru`, `long_descriprion_en`, `logo`, `meta`) VALUES (1,'audi_tt_rally',2,'Audi TT Rally Project','Audi TT Rally Project','Audi TT Rally Project','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum - это текст-рыб, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах котор','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','project_1.jpg',NULL),(2,'icebox_system',3,'NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES','NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES','NXFORGE ICE BOX SYSTEMS — COLD POWER FOR HOT ENGINES','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum - это текст-рыб, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах котор','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','project_2.jpg',NULL),(4,'test_test_lang',1,'Test lăng','Тэстg','Test lang','<p>Test lang<u> lang lang</u></p>','<p><u>Тэст lang</u></p>','<p>Test lang lang</p>','img_693c176ed5bce4.42383043.jpg','test, test, test, tsets ,est set'),(5,'test_test_lang_test',5,'Test','Test','Test','<p>Test</p>','<p>Test</p>','<p>Test</p>','','Test'),(6,'qwerweqrt',4,'rewqrqwt','eqrtqert','trqeteq','<p>tqerteqrt</p>','<p>eqrteqt</p>','<p>trqetreq</p>','','tqerteqt'),(7,'trqetqetre',3,'eqrterqtqert','qertqetqert','qertqetqert','<p>qertqetqertqe</p>','<p>qerteqrtretrqet</p>','<p>terqtqetqetqert</p>','','qertqetrqet'),(8,'wqerqwerqewr',1,'rqwerqwer','qwerqwer','wqerqwer','<p>trewywrtyry</p>','<p>ytwrywrtywryw</p>','<p>qwerqwerqwe</p>','','qwerqwerqw');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  UNIQUE KEY `settings_key_uindex` (`name`),
  UNIQUE KEY `settings_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `name`, `value`) VALUES (4,'address','Chisinau Pan Halippa 9'),(2,'facebook','https://www.facebook.com/groups/496683557152045'),(3,'instagram','https://www.instagram.com/nx_fab_/'),(1,'phone','+37360058785'),(5,'work_time','<p>Luni-Vineri: <strong>08:00-17:00 </strong></p><p><br></p><p>Sâmbata:<strong> 09:00-14:03</strong></p><p><br></p><p>Duminica: <strong>Zi de odihna</strong></p>');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_langs`
--

DROP TABLE IF EXISTS `site_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `en` varchar(255) NOT NULL,
  `ro` varchar(255) NOT NULL,
  `ru` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_langs`
--

LOCK TABLES `site_langs` WRITE;
/*!40000 ALTER TABLE `site_langs` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translates`
--

DROP TABLE IF EXISTS `translates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translates` (
  `lang_index` varchar(20) NOT NULL,
  `en` varchar(100) DEFAULT NULL,
  `ru` varchar(100) DEFAULT NULL,
  `ro` varchar(100) DEFAULT NULL,
  UNIQUE KEY `translates_lang_index_uindex` (`lang_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translates`
--

LOCK TABLES `translates` WRITE;
/*!40000 ALTER TABLE `translates` DISABLE KEYS */;
INSERT INTO `translates` (`lang_index`, `en`, `ru`, `ro`) VALUES ('about_us','ABOUT US','О НАС','DESPRE NOI'),('address','ADDRESS','АДДРЕСС','ADRESA'),('all_projects','ALL PROJECTS AT A GLANCE ','ВСЕ ПРОЕКТЫ В ОДНОМ МЕСТЕ','TOATE PROIECTELE ÎNTR-UN SINGUR LOC'),('deliver_quality','DELIVER QUALITY','ПОСТАВЛЯЕМ КАЧЕСТВО','ASIGURĂM CALITATEA'),('our_works','OUR WORKS','ПРОЕКТЫ','PROIECTE');
/*!40000 ALTER TABLE `translates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `pwd`, `name`, `phone`, `address`) VALUES (2,'qwe','4297f44b13955235245b2497399d7a93','Имя2','222222','Адрес222'),(3,'asd','4297f44b13955235245b2497399d7a93','','',''),(4,'qwe1','4297f44b13955235245b2497399d7a93','','',''),(5,'dfgdfger','4297f44b13955235245b2497399d7a93','','',''),(6,'dfgdfg','4297f44b13955235245b2497399d7a93','','',''),(7,'qwe2','4297f44b13955235245b2497399d7a93','qwe222','222','eqwe3333'),(8,'qwer','4297f44b13955235245b2497399d7a93','qwer1','11111','Адрес'),(9,'testuser1','4297f44b13955235245b2497399d7a93','testuser','444444','АдресАдресАдрес'),(10,'test@mail.com','25d55ad283aa400af464c76d713c07ad','Taras','06000000','Jora de Jos 666'),(11,'ichiselii@mail.ru','1bbd886460827015e5d605ed44252251','','',''),(12,'ichiseliii@mail.ru','f5bb0c8de146c67b44babbf4e6584cc0','','',''),(13,'ichiseli@qiwi.com','f5bb0c8de146c67b44babbf4e6584cc0','Iuri','060000000','Chisinau, str. Pan Halipa 9');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-18 16:16:15
