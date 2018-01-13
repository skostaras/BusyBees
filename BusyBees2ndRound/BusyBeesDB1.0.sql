CREATE DATABASE  IF NOT EXISTS `bees` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bees`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: bees
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `idcustomer` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idcustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (9,'stefanos','123456','stefanos@hotmail.com'),(10,'elena','123456','elena@hotmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `idprovider` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`idprovider`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (12,'filologos@otenet.gr','123456','filologos'),(13,'daskalos@otenet.gr','123456','daskalos'),(14,'mathimatikos@otenet.gr','123456','mathimatikos'),(15,'fisikoulis@otenet.gr','123456','fisikoulis'),(16,'ilektrologos@otenet.gr','123456','ilektrologos'),(17,'idraylikoulis@otenet.gr','123456','idraylikoulis'),(18,'elaixromatistis@otenet.gr','123456','elaixromatistis'),(19,'fullstacker@otenet.gr','123456','fullstacker'),(20,'webdesigner@otenet.gr','123456','webdesigner'),(21,'wineksipnakias@otenet.gr','123456','wineksipnakias'),(22,'mousikaras@otenet.gr','123456','mousikaras'),(23,'clown@otenet.gr','123456','clown'),(24,'dentist@otenet.gr','123456','dentist'),(25,'pathologos@otenet.gr','123456','pathologos'),(26,'ksilourgos@otenet.gr','123456','ksilourgos');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_job`
--

DROP TABLE IF EXISTS `provider_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_job` (
  `idprovider_job` int(11) NOT NULL AUTO_INCREMENT,
  `idprovider` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `description` longtext,
  `price` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `pc` varchar(100) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `workemail` varchar(100) DEFAULT NULL,
  `webpage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idprovider_job`),
  KEY `fk_provider_job_provider1_idx` (`idprovider`),
  CONSTRAINT `fk_provider_job_provider1` FOREIGN KEY (`idprovider`) REFERENCES `provider` (`idprovider`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_job`
--

LOCK TABLES `provider_job` WRITE;
/*!40000 ALTER TABLE `provider_job` DISABLE KEYS */;
INSERT INTO `provider_job` VALUES (8,12,'Εκπαιδευτικός','Φιλόλογος','Φίλη','Λόγου','Λατινικά και ό,τι άλλο προκύψει','Διαδάσκω όλες τις ξεχασμένες γλώσσες',20,'Την ώρα','Πάτρα','Παλαιοκαστρίτσας','12232','6972809585','filologoulis@otenet.gr','www.filologoulis.gr'),(9,13,'Εκπαιδευτικός','Δάσκαλος','Ιωάννα','Δακρύβρεχτη','Γλώσσα - Γλώσσα - Μαθηματικά','Χρόνια προϋπηρεσίας με στουρνάρια',15,'Την ώρα','Χανιά','Απέναντι Δρόμου 23','22343','6972809585','daskalakos@hotmail.com','www.daskalakos.gr'),(10,14,'Εκπαιδευτικός','Μαθηματικός','Τετράγωνος','Ρίζας','Ολοκληρώματα και άλλα','Φανταστικοί αριθμοί',18,'Την ώρα','Πάτρα','Γενικού Ολοκληρώματος 46','12232','6972809585','pithagorakos@otenet.gr',''),(11,15,'Εκπαιδευτικός','Φυσικός','Αλβέρτος','Φραγκλίνος','Πυρηνική Φυσική για όλους. ','Το από πάνω. Χρόνια προϋπηρεσίας σε ανατινάξεις ηλεκτρονίων.',120,'Εφάπαξ','Αθήνα','Ανατιναγμένου Πρωτονίου 32','12343','6972809585','pirinikoulis@otenet.gr',''),(12,16,'Μάστορας','Ηλεκτρολόγος','Μπομπ','Μάστορας','Φωτιστικά, μπρίζες, πρίζες, ντουί','Καταστρέφω τις πρίζες σας και τον πίνακά σας σε πολύ καλές τιμές και χωρίς απόδειξη.',60,'Εφάπαξ','Αθήνα','Καμένου Πίνακα 88','12222','6972809585','',''),(13,17,'Μάστορας','Υδραυλικός','Μάριος','Λουΐτζης','Κυρίως αποχετεύσεις και καζανάκια ναούμε','Τα ξεβουλώνω όλα με το χέρι',15,'Τον μήνα','Αθήνα','Χαμένης Πριγκήπισσας 33','33321','6972809585','email@email.email',''),(14,18,'Μάστορας','Ελαιοχρωματιστής','Εκρού','Τησλεβάντας','Χρώματα παντού','Τα πάντα εκτός από σοβατίσματα. ',12,'Την ώρα','Αθήνα','','','6972809585','',''),(15,19,'Κομπιουτεράς','Developer','get.Attribute(\"name\")','get.Attribute(\"surname\")','virtual reality app σε 5 ημέρες','Spring, MVC, Boot, Hibernate με τα ηρεμιστικά δικά μου',150,'Εφάπαξ','Πάτρα','','','6972809585','billgates234@hotmail.com','www.ideveloper.gr'),(16,20,'Κομπιουτεράς','Web Designer','Βουτστράπιος','Γουορντπρέσσορας','Ιστοσελίδες κάθε είδους (εφόσον βρω templates). ','Αντιγραφές, πατικοσούρες και κοπιπαστες για κάθε γούστο.\r\n',130,'Άλλο','Θεσσαλονίκη','Αγίας Έιτστιεμελ Ντοκ Κομ 404','40440','6972809585','wordpressor@hotmail.com',''),(17,21,'Κομπιουτεράς','Windows Expert','Ριστάρτη','Αχρηστούδη','Κάνω format, καθαρίζω ιούς και απενεργοποιώ την startup σαβούρα σας.','2 δεκαετίες στον χώρο δεν ξέρω και εγώ πόσα πισις έχω καθαρίσει. Από IRC conflicts έως driver updates έως ILOVEYOU viruses, τα πάντα όλα. ',30,'Εφάπαξ','Χανιά','','','6972809585','katharizokaimoketes@gmail.com',''),(18,22,'Καλλιτέχνης','Μουσικός','Κακομοίρης','Πεινασμένουρας','μπαγλαμάς, κιθάρα, βιολί, άρπα','Παίζω 4 έγχορδα αλλά με ένα καλό χαρτζιλίκι μαθαίνω και πέμπτο. Απόφοιτος ανώτατης μουσικής σχολής, συμφοιτητής των Dream Theater, διαθέσιμος για γάμους, πανηγύρια, κηδείες, μπουζούκια και όπου άλλού παίζει μεροκάματο.',2,'Την ώρα','Θεσσαλονίκη','Κακοτυχίας και Κακομοιριάς 66','','','allaoneiraeixastinzoimou@gmail.com','www.gamotinkoloxora.gr'),(19,23,'Καλλιτέχνης','Κλόουν','Κίνγκος','Παλιάτσουρας','παιδικά πάρτυ, γενέθλια, γιορτές','Τρομάζω τα παιδιά σας σε πολύ καλές τιμές. Όσο περισσότερα παιδάκια, τόσο το καλύτερο. Πλάκες κατά παραγγελία.',28,'Εφάπαξ','Λάρισα','','','6972809585','',''),(20,24,'Γιατρός','Οδοντίατρος','Ντούλης','Φαφούτογλου','σφραγίσματα, ξεδοντιάσματα, ξεκιτρινιάσματα, ξεκατινιάσματα και πάσης φύσεως εξαγωγές','Εξαγωγές με το κιλό, με το γραμμάριο και με την ουγκιά. Στις 2 εξαγωγές, δώρο η τρίτη. Φύλαγμα παιδικών δοντιών κατά παραγγελία σε ειδική τράπεζα παιδικών δοντιών (όπου αποθηκεύονται τα παιδικά δόντια κατά παραγγελία). ',20,'Τον μήνα','Λάρισα','Κιτρινιάρογλου 55','12321','6972809585','teethandteeth@tooth.com','www.tokalodonti.gr'),(21,25,'Γιατρός','Παθολόγος','Μπάμπης','Μπαλαντέρογλου','τα πάντα όλα','Πάμε: Κύστες κόκυγγος, πόνοι σε πλάτη, σε δάχτυλα, σε πόδια, σε δόντια, σε σπόνδυλους, χιαστοί, γόνατα και καρποί, πυρετοί και απύρετοι, αντιβιώσεις κατά παραγγελία, ευθανασίες υπερήλικων, πιστοποιητικά γέννησης, απολυτήρια στρατού, γνήσια υπογραφής, proficiency (cambridge) και προσεχώς και πτυχία ΑΕΙ. ',70,'Τον μήνα','Αθήνα','Ξερόγλου 24','24342','6972809585','ftinaxeirourgia@gmail.gr','www.tokalomaxairi.gr'),(22,26,'Μάστορας','Ξυλουργός','Ργούλης','Ξυλούρης','τραπέζια, κρεβάτια, βιβλιοθήκες, κομοδίνα, υποπόδια, παιδικά','',1,'Άλλο','Αθήνα','','',' ','','www.togrigorosfiri.gr');
/*!40000 ALTER TABLE `provider_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `ratingId` int(11) NOT NULL AUTO_INCREMENT,
  `stars` int(11) DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `providerJobId` int(11) NOT NULL,
  PRIMARY KEY (`ratingId`),
  KEY `fk_rating_provider_job1_idx` (`providerJobId`),
  KEY `fk_rating_customer_idx` (`customerId`),
  CONSTRAINT `fk_rating_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`idcustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_provider_job1` FOREIGN KEY (`providerJobId`) REFERENCES `provider_job` (`idprovider_job`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-16  1:17:07
