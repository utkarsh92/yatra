-- MySQL dump 10.11
--
-- Host: localhost    Database: agency
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `agent` (
  `ag_id` int(11) NOT NULL,
  `t_id` int(11) default NULL,
  `f_name` varchar(50) default NULL,
  `l_name` varchar(50) default NULL,
  `city` varchar(50) default NULL,
  `age` int(11) default NULL,
  `gender` char(1) default NULL,
  PRIMARY KEY  (`ag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (330,220,'Sharad','Jain','Patna',31,'M'),(331,220,'Akshay','Sharma','Delhi',42,'M'),(332,221,'Ajay','Bansal','Mumbai',25,'M'),(333,222,'Darshan','Singh','Indore',56,'M'),(334,222,'Parni','Gupta','Udaipur',19,'F'),(335,230,'Pragati','Singh','Goa',53,'F'),(336,230,'Akshay','Goel','Varanasi',62,'M'),(337,230,'Vinay','Garg','Kolkata',28,'M'),(340,231,'Saurabh','Rawat','Pune',35,'M'),(341,231,'Ankit','Kumar','Delhi',38,'M');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bus` (
  `b_no` int(11) NOT NULL,
  `b_type` varchar(50) default NULL,
  `dept` varchar(50) NOT NULL,
  `dest` varchar(50) NOT NULL,
  `dept_time` varchar(50) default NULL,
  `dest_time` varchar(50) default NULL,
  `price` int(11) default NULL,
  `travels` varchar(50) default NULL,
  PRIMARY KEY  (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (8220,'Sleeper','Patna','Delhi','19:30','05:00',1000,'Neetu'),(8221,'AC Sitting','Jaipur','Mumbai','08:00','18:00',1500,'Jindal'),(8222,'AC Sleeper','Pune','Jammu','02:00','22:00',4000,'Maharastra Public Transport Corp.'),(8223,'Volvo Sleeper','Ahmeadbad','Kolkata','06:00','15:00',3000,'Diamond'),(8224,'AC Sitting','Udaipur','Indore','08:00','16:00',1000,'Shreenath'),(8225,'AC Sleeper','Mumbai','Hyderabad','09:00','18:00',2000,'Neetu'),(8226,'Sitting','Noida','Bangalore','05:00','20:30',1500,'Star');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `update_bus` BEFORE DELETE ON `bus` FOR EACH ROW begin
if old.b_no is not null then
update cust_details 
set b_no=NULL
where b_no=old.b_no;
end if;
end */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `cust_details`
--

DROP TABLE IF EXISTS `cust_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cust_details` (
  `ag_id` int(11) default NULL,
  `t_id` int(11) default NULL,
  `p_id` int(11) NOT NULL,
  `f_no` int(11) default NULL,
  `h_id` int(11) default NULL,
  `trip_id` int(11) default NULL,
  `b_no` int(11) default NULL,
  `amount` int(11) default NULL,
  PRIMARY KEY  (`p_id`),
  KEY `t_id` (`t_id`),
  KEY `ag_id` (`ag_id`),
  KEY `f_no` (`f_no`),
  KEY `h_id` (`h_id`),
  KEY `trip_id` (`trip_id`),
  KEY `b_no` (`b_no`),
  CONSTRAINT `cust_details_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `customer` (`p_id`),
  CONSTRAINT `cust_details_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `travel_agency` (`t_id`),
  CONSTRAINT `cust_details_ibfk_3` FOREIGN KEY (`ag_id`) REFERENCES `agent` (`ag_id`),
  CONSTRAINT `cust_details_ibfk_4` FOREIGN KEY (`f_no`) REFERENCES `flight` (`f_no`),
  CONSTRAINT `cust_details_ibfk_5` FOREIGN KEY (`h_id`) REFERENCES `hotel` (`h_id`),
  CONSTRAINT `cust_details_ibfk_6` FOREIGN KEY (`trip_id`) REFERENCES `package` (`trip_id`),
  CONSTRAINT `cust_details_ibfk_7` FOREIGN KEY (`b_no`) REFERENCES `bus` (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cust_details`
--

LOCK TABLES `cust_details` WRITE;
/*!40000 ALTER TABLE `cust_details` DISABLE KEYS */;
INSERT INTO `cust_details` VALUES (330,220,111,9102,420,552,NULL,200000),(332,221,112,9101,422,550,NULL,50000),(333,222,113,9100,424,553,NULL,30000),(334,222,120,9103,425,551,NULL,250000),(331,220,121,NULL,422,NULL,8220,11000),(332,221,122,9101,NULL,NULL,NULL,20000),(330,220,123,NULL,421,NULL,NULL,40000),(335,230,130,NULL,NULL,NULL,8223,3000),(336,230,131,NULL,NULL,554,NULL,20000),(337,230,132,9104,NULL,555,8225,82000),(340,231,133,9105,428,556,8226,331500),(340,231,134,9105,NULL,556,8226,331500);
/*!40000 ALTER TABLE `cust_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customer` (
  `p_id` int(11) NOT NULL default '0',
  `f_name` varchar(50) default NULL,
  `l_name` varchar(50) default NULL,
  `street` varchar(50) default NULL,
  `city` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `gender` varchar(50) default 'M',
  `age` int(11) default NULL,
  PRIMARY KEY  (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (111,'Yugal','Jain','Nehru Marg','Noida','UP','M',19),(112,'Utkarsh','Indaliya','Vile Parle','Mumbai','Maharastra','M',19),(113,'Dishank','Godlia','Sant Street','Kolkata','West Bengal','M',19),(120,'Mohan','Pal','Kaka Nagar','Ahmedabad','Gujarat','M',40),(121,'Hardhik','Mishra','pink street','Jaipur','Rajasthan','M',35),(122,'Ankit','Jain','Mahatma Society','Bangalore','Karnataka','M',27),(123,'Nikita','Verma','Thermal Colony','Kota','Rajasthan','F',32),(130,'Ayush','Jha','Patliputra Colony','Patna','Bihar','M',55),(131,'Komal','Malhotra','Pushpa Marg','Mumbai','Maharastra','F',26),(132,'Ankit','Avasthi','Gyan Nagar','Udaipur','Rajasthan','M',52),(133,'Astha','Gupta','Nizam Street','Hyderabad','Andhra Pradesh','F',46),(134,'Prakhar','Gupta','Gomati Nagar','Lucknow','Uttar Pradesh','M',19);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `del_customer` BEFORE DELETE ON `customer` FOR EACH ROW begin
if old.p_id is not null then
delete from cust_details where p_id=old.p_id;
end if;
end */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `flight` (
  `f_no` int(11) NOT NULL,
  `name` varchar(50) default 'Air India',
  `dept` varchar(50) NOT NULL,
  `dest` varchar(50) NOT NULL,
  `dept_time` varchar(50) default NULL,
  `dest_time` varchar(50) default NULL,
  `f_type` varchar(50) default 'Domestic',
  `price` int(11) default NULL,
  PRIMARY KEY  (`f_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (9100,'Kingfisher Airlines','Kanpur','Mumbai','11:00','12:00','Domestic',7000),(9101,'Indigo Airlines','Andaman and Nicobar Island','Delhi','15:00','17:00','Domestic',20000),(9102,'Qatar Airlines','Amritsar','Las Vegas','05:00','16:00','International',80000),(9103,'Air Greenland','Delhi','Greenland','02:00','22:00','International',90000),(9104,'British Airways','Ahmedabad','London','03:00','20:00','International',55000),(9105,'Lufthansa','Chennai','Paris','07:30','21:00','International',60000);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `update_flight` BEFORE DELETE ON `flight` FOR EACH ROW begin
if old.f_no is not null then
update cust_details 
set f_no=NULL
where f_no=old.f_no;
end if;
end */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hotel` (
  `h_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `h_type` varchar(50) default 'fun',
  `city` varchar(50) default 'Goa',
  `star` int(11) default '3',
  `ppnight` int(11) default '2000',
  PRIMARY KEY  (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (420,'The Mirage','Business','Las Vegas',3,30000),(421,'Bellagio','Casino','Las Vegas',5,40000),(422,'ITC','Suite','Delhi',5,10000),(423,'Time','Resort','Amritsar',4,10000),(424,'Taj','Luxury','Mumbai',5,20000),(425,'Wonder','Eco Hotel','Greenland',3,30000),(426,'Gold','Comfort','Jammu',2,5000),(427,'Ginger','Resort','London',1,15000),(428,'Park ascent','Island Hotel','Paris',3,20000),(429,'Royal Park','Luxury','Indore',2,5000),(430,'Green Leaf','Business','Hyderabad',2,10000),(431,'Countrt Inn','Suite','Bangalore',1,3000),(432,'Orange Pie','Luxury','Kolkata',3,9000),(433,'Sapphire','Resort','Goa',2,5000),(434,'Crown','Luxury','Shimla',3,7000);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

/*!50003 SET @SAVE_SQL_MODE=@@SQL_MODE*/;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `add_in_package` AFTER INSERT ON `hotel` FOR EACH ROW begin
declare temp int;
if new.h_id is not null then
if new.ppnight>=30000 then
select trip_id into temp from package_details where dest=new.city; 
if temp is not null then
insert into package_hotel values(new.h_id,temp);
end if;
end if;
end if;
end */;;

/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `del_package` BEFORE DELETE ON `hotel` FOR EACH ROW begin
if old.h_id is not null then
delete from package_hotel where h_id=old.h_id;
update cust_details 
set h_id=NULL
where h_id=old.h_id;
end if;
end */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@SAVE_SQL_MODE*/;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `login` (
  `ag_id` int(11) default NULL,
  `password` varchar(50) default NULL,
  KEY `ag_id` (`ag_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`ag_id`) REFERENCES `agent` (`ag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (330,'sharad123'),(331,'akshay123'),(332,'ajay123'),(333,'darshan123'),(334,'parni123'),(335,'pragati123'),(336,'akshay123'),(337,'vinay123'),(340,'saurabh123'),(341,'ankit123');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_ph`
--

DROP TABLE IF EXISTS `p_ph`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `p_ph` (
  `p_id` int(11) default NULL,
  `ph_no` int(11) default NULL,
  KEY `p_id` (`p_id`),
  CONSTRAINT `p_ph_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `customer` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `p_ph`
--

LOCK TABLES `p_ph` WRITE;
/*!40000 ALTER TABLE `p_ph` DISABLE KEYS */;
INSERT INTO `p_ph` VALUES (111,987349212),(112,915896422),(112,856942356),(113,987569874),(120,963852741),(121,965412872),(122,985641231),(122,951753614),(123,941257863),(130,962478965),(131,965214541),(131,985324532),(132,963254255),(133,998624565);
/*!40000 ALTER TABLE `p_ph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `package` (
  `trip_id` int(11) NOT NULL,
  `theme` varchar(50) default NULL,
  PRIMARY KEY  (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (550,'Honeymoon'),(551,'Eco-Tourism'),(552,'Party, Casino'),(553,'Youth'),(554,'Beach'),(555,'Snow'),(556,'Landmarks of Paris');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_details`
--

DROP TABLE IF EXISTS `package_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `package_details` (
  `trip_id` int(11) default NULL,
  `dest` varchar(50) default NULL,
  `budget` int(11) default NULL,
  `dept` varchar(50) default NULL,
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `package_details_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `package` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `package_details`
--

LOCK TABLES `package_details` WRITE;
/*!40000 ALTER TABLE `package_details` DISABLE KEYS */;
INSERT INTO `package_details` VALUES (550,'Delhi',50000,'11th December'),(551,'Greenland',200000,'18th December'),(552,'Las Vegas',200000,'21st December'),(553,'Mumbai',30000,'11th January'),(554,'Goa',20000,'20th January'),(555,'Shimla',25000,'25th January'),(556,'Paris',250000,'10th January');
/*!40000 ALTER TABLE `package_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_hotel`
--

DROP TABLE IF EXISTS `package_hotel`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `package_hotel` (
  `h_id` int(11) default NULL,
  `trip_id` int(11) default NULL,
  KEY `trip_id` (`trip_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `package_hotel_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `package` (`trip_id`),
  CONSTRAINT `package_hotel_ibfk_2` FOREIGN KEY (`h_id`) REFERENCES `hotel` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `package_hotel`
--

LOCK TABLES `package_hotel` WRITE;
/*!40000 ALTER TABLE `package_hotel` DISABLE KEYS */;
INSERT INTO `package_hotel` VALUES (420,552),(422,550),(424,553),(425,551),(433,554),(434,555),(428,556);
/*!40000 ALTER TABLE `package_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_ph`
--

DROP TABLE IF EXISTS `ta_ph`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ta_ph` (
  `t_id` int(11) default NULL,
  `c_no` int(11) default NULL,
  KEY `t_id` (`t_id`),
  CONSTRAINT `ta_ph_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `travel_agency` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ta_ph`
--

LOCK TABLES `ta_ph` WRITE;
/*!40000 ALTER TABLE `ta_ph` DISABLE KEYS */;
INSERT INTO `ta_ph` VALUES (220,939658962),(220,956874256),(221,942658912),(221,965859821),(221,987356864),(222,953287452),(222,965824872),(230,984168742),(230,954578214),(230,951258526),(231,982542774),(231,951235132);
/*!40000 ALTER TABLE `ta_ph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_agency`
--

DROP TABLE IF EXISTS `travel_agency`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `travel_agency` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(50) default NULL,
  `street` varchar(50) default NULL,
  `city` varchar(50) default 'Delhi',
  `website` varchar(50) default 'www.travel.com',
  PRIMARY KEY  (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `travel_agency`
--

LOCK TABLES `travel_agency` WRITE;
/*!40000 ALTER TABLE `travel_agency` DISABLE KEYS */;
INSERT INTO `travel_agency` VALUES (220,'Everest Travel Pvt Ltd.','Bhoomi Marg','Delhi','www.everest.com'),(221,'Make My Trip Ltd.','Malad West','Mumbai','www.makemytrip.com'),(222,'Yatra Ltd.','Gandhi Nagar','Vishakhapatnam','www.yatra.com'),(230,'Beauty travel Ltd.','Bhagwan nagar','Gandhinagar','www.beauty.com'),(231,'Cleartrip Ltd.','Sai Street','Chennai','www.cleartrip.com');
/*!40000 ALTER TABLE `travel_agency` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-02 11:51:01
