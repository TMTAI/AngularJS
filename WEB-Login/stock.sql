-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: stock
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `user_role` varchar(45) NOT NULL DEFAULT '',
  `first_name` varchar(45) NOT NULL DEFAULT '',
  `last_name` varchar(45) NOT NULL DEFAULT '',
  `birthday` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `address` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(45) NOT NULL DEFAULT '',
  `phone` varchar(45) NOT NULL DEFAULT '',
  `gender` varchar(45) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('admin','$2a$10$hJ0/eW5phSKH4JiHdHyDeuryGXYUJko22Sa8nV7XID33uYSHdn6Ge','ROLE_ADMIN','Administrator','Yuri','1995-04-09 00:00:00','TP. HCM','admin@gmail.com','0898133817','Male',1),('member','$2a$10$bYUr16uKY0C.UtVMLwsZwOk6CYD4IJXXpCGh7vqE1RkngaL7dLT2i','ROLE_MEMBER','Member','Yuri','1995-04-09 00:00:00','TP. HCM','member@gmail.com','0898133817','Male',1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `image` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `ID` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Price` double NOT NULL,
  `Quanity` int(11) NOT NULL,
  `ORDER_ID` varchar(50) NOT NULL,
  `PRODUCT_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ORDER_DETAIL_PROD_FK` (`PRODUCT_ID`),
  CONSTRAINT `ORDER_DETAIL_PROD_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ID` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Customer_Address` varchar(255) NOT NULL,
  `Customer_Email` varchar(128) NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Customer_Phone` varchar(128) NOT NULL,
  `Order_Date` datetime NOT NULL,
  `Order_Num` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_details` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(20) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `image_view_before` longblob,
  `image_view_center` longblob,
  `image_view_after` longblob,
  `image_function` longblob,
  `cpu_technology` varchar(255) NOT NULL DEFAULT '',
  `cpu_type` varchar(255) NOT NULL DEFAULT '',
  `cpu_speed` varchar(255) NOT NULL DEFAULT '',
  `cpu_speed_max` varchar(255) NOT NULL DEFAULT '',
  `cpu_bus_speed` varchar(255) NOT NULL DEFAULT '',
  `ram` varchar(255) NOT NULL DEFAULT '',
  `ram_type` varchar(255) NOT NULL DEFAULT '',
  `ram_bus_speed` varchar(255) NOT NULL DEFAULT '',
  `ram_max` varchar(255) NOT NULL DEFAULT '',
  `hard_drive` varchar(255) NOT NULL DEFAULT '',
  `screen_size` varchar(255) NOT NULL DEFAULT '',
  `resolution` varchar(255) NOT NULL DEFAULT '',
  `screen_technology` varchar(255) NOT NULL DEFAULT '0',
  `screen_touch` varchar(255) NOT NULL DEFAULT '',
  `card_design` varchar(255) NOT NULL DEFAULT '',
  `card_graphics` varchar(255) NOT NULL DEFAULT '',
  `audio_technology` varchar(255) NOT NULL DEFAULT '',
  `connector` varchar(255) NOT NULL DEFAULT '',
  `wireless_connectivity` varchar(255) NOT NULL DEFAULT '',
  `memory_card_reader` varchar(255) NOT NULL DEFAULT '',
  `optical_drive` varchar(255) NOT NULL DEFAULT '',
  `webcam` varchar(255) NOT NULL DEFAULT '0',
  `keyboad_light` varchar(255) NOT NULL DEFAULT '',
  `orther_function` varchar(255) NOT NULL DEFAULT '',
  `operating_system` varchar(255) NOT NULL DEFAULT '',
  `pin` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(255) NOT NULL DEFAULT '',
  `weight` varchar(255) NOT NULL DEFAULT '',
  `meterial` varchar(255) NOT NULL DEFAULT '',
  `trademark` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `PROD_DETAIL_PROD_FK` (`product_id`),
  CONSTRAINT `PROD_DETAIL_PROD_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `Code` varchar(20) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Image` longblob,
  `Name` varchar(255) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('S001','2017-11-29 12:00:00','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	 \"\" $(4,$&1\'%2-1,.000#+4@?.749/-\n\n\n\r+%+877+7--7+77-++-+77-7+++7-++-++-7-+++++-++++++++++��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0?\0\0\0\0\0\0!1AQa\"q��2B�#��\�CRr�\�3Sbc����4�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0#\0\0\0\0\0\0\0\0\0!1A\"BQa�\�\0\0\0?\0\�(�����������������������������������U5]tQ4�YF�=���k8�iXLWj�p�:_�\�\�oT�\���@4��G��͌{jV�[\�\�\"��l�C#�\�A\�.��^\�\�\�\�\�ꝥ\�\�.W;��\�bo�l����iYT\�[+\\~\"\�� \�*�\��S�)�L���*�z\Z�\�r�ݏk\\\��.B�\�\" \"\"\" \"\"\" !V�&k�CX\�\\\�w�rWǻk�3\�ILְ\Z\�n^z\��v\�ni\��\\�4qq\r\�O�\�^kެ\�9D\�\�=\����\r��!֞�ۃ�$��\�\�{�\�6�;\�	�G\�\��\�#\��\�j؇mtm�\0秚c\�\�!��\�}��l����u�aݐ\�\�z�\�\�M�ԩ�VrV=�q\�q	4�`\�y�-r�l�Y\�W\�Kwnd_t}2꺽g8tV&#1dq?Aa�SԸd0��\�ȇ&5�Eh�\�\�\�Du\�\�T8<\�\�\��k�\�6�n��ړc#\�\�\�W`|[��/�zڸ�\�\�o��x�\�`\�m�\�!\�<gG���\�$-�23�ܩ�G��q\�62E˜l�}\�<=V\�\�\'x�o�-\'.<~�\�<\�{��j>�\n/\��\���\�\�.��a$�\�k�\����Z�m�\�t\�%�\�\�~}=\�E>UmI����\�c\�e\�\��\�{��f����CoE��E\�{YWWL\��6��\�\�\�\�W�=���\n�\"����������1\�i[,rD�vH\�5Û\\,�N\r�\�\�Q���.k\�X\�]�z.�sO�_O/�;^�u6\"ʘ�.-�����]�ܩ�Lp\�XF\�\��1Q\�79\�\�7\\��1[\�*\�<QNςV5\��p�\��?	�\�,^L]U�\ny+8��\�շ3��^\�\�,T\�ʹ�\0\�z\�h�C$�\�\�<\0\�Z\�ڕ�1�D:]C��\\\�\Z\0\'U\�1m����G�\0sFR㐏��UF \\\�\�TLـ\��%�\�\�\r<r����������c\�\�^՚\���U�OI��^���	���=\�-s�[�I�\��\�z.�C�?�k�rg����\�E�\��U)Xր��ex\�t\��W\��ʴ:F�\����\�E�xo�E�}}���[pe���\�==֓[�H\�Ǹ��a�\�Jױ,ri\�\�m�\�ֺ\��/�\�wT�ת�J\�#\�\�l. ��z\\\�\r\�C�\�|�E�\�_\�L\�m��=W\�;)�}���s����\�\�\r�e+�3\�\�	2RG;E\�N7\0_C��-\�b�ڌ3\�4�\0�Ö�\0x5i��ض*&\�\�7t-\�s���~�z-�pn\�1v\�\�ML�dd��\�\�\�\�Z\\�\�W`\�����\�O���?�z�\�\�\�1u�m�<\�b|lx���8�\�E϶ӵ	3>*cݳ(!ߵ\���\�\�8�ҹ\��K7\�~�z\����f5\r��\�nd��;\�\�-j�h�\�\�Z��\��\���V=�N��W��[Nh֪�`��\�Ƥ;����\�\�M�\�}\�e.\�9�\�\\�-\�\�R5\'+M��u�\�k*�d�-<�N��}��\nWM#\"�f�\����\�iE�\�f\0�m\�__��«\�!sK s�񋹷��wk�\0j��ɾ!���p�`�\�\�\�\��\���\\��\\\���\�\�\�\�q[�yM\rC\�Of|�qslE�6\Z�Z�V��SF\�\�)n�\r�\��\�[YM/�ָ�f���kx\�e4\r1��k?\�B\��\�\�$��s\�?�\������jf.qv�\�p\���b\�:�\�\�a+\\\�\�\Z���\��S\�զ��\�Ȉ��P��A�Wh�{��9{��3�\��\�\�ܟe�T\�3���<��+�v���i\���NRzˮV\Zב��\�L#[{k\�5$�/6���\�\r,�\�\�`a|�6kF�}Wv\�]���k*&�����\�\�t�6���\�gf⼸��j\�M�t\��H斲\�\�ׇ��+bm\� ��C꾋�\��\�b�\�+�E�\�4\�Lu�9��\�#�y\�\�ˀ9�ͥ�\�x[d;m\�|�]\�6V����C߯\�k8�(u\�vҎ{\�t�\�0�[(p\��ȱi:�V\�9(\�B��3P\r�:�v���**Y\�դClsy\�\�|�a`�\�\��8\�\'\�r�����̲j\�ZI��ś\'\�^����Q\�Ml�$\�z�\�\�75�o67 y���\Z�\��T�5+#7\�̬*����@\�\�p@ �^֛ٶ;�} {\�^\�\�;\�NQ��p��^��\�*(*Yk�\�\�-s��z\\z��\�6���k�Ƌ지AP�Xڌ�����xI;�\0�S�z\��a��fl�h\�\�>\�\�cHԞD�\�U�uP�8��\�T-f)�U׏\�ɖfe5[�uZ�~)\�D\�\�{�PuU��]U�V\�f\�\�\�D�*���\�K1;�V�\�N�\�g|\��a\�̳]xdv��\�T\�4\�\�\�s`l\�\�̬J\��\��l\�-k_�=W�̺�4Ǉo\�o�+\�V3@@\�7��X=\\��Kx�\0�Vφ\�d���ـ\�I\�\�YRԩ�\��\�I\�/o>Km�vi2���^\�7W����Γi)a\�3���?M.V(\�\�q\�7p\�,l��O^:\�)�4\�k7]\�X~�bC�R�\�ѳ\�Z@v�	\�ir٤\0:\�\�\�E���\�\�!\0eq7.�4:\�吃�a{{�<9�hM��[=%|R�\��\�Ю�ZK]r\�t\��\�\0zH\�^\�N*�>%,g3evpl\����\�=7\�\�\�*��\��<y�s˷�\�E\��E�,p\�cv�\��\�q�j�v8;\�^@DDDAB�gn�a��\Z�,\0$s\Z~��-��$O��\�\���lt?��H�\��	:\�GUW�\�k\�T8��Q\�_�F�ٍ\���g\�\�F��O\�\�~J�ok���Y}N�[��\��H=tW�p��\�\�Z\�g�?R��[[�oZEG\�\�iǐԫq\�$�,L%\�5?\�l\�n\�F.d��\���uR3└\�\re�xř�K�r\�W@\��\'3\�3;\'A\�\�\�IH�f�M]y%<�\��P�{GQ(p�\�7�Cg\�\�ξ\�Ļ\�/q>+����Ume���\�h\\�wMߊ����R\�4�^V#8�\�\�ea�\�\�cet2\�c�w����\�lH�ZH\�󦛸�z<\�\�2�����\�ƻ�V\r9�L/w]ǥ���q��p�g�	\��?.h3$�\�\�\Z��f�\�\�\�\�@EC>2����N=w��\0�FX�<�\���q\���ߧ5?�\0�\�;�j\�F\r�h����� $\Zj���\�Fƽ\�\�\�o7�\�{ٹ\�֗\�e����f\�0x)�\�\�\�q�HORuY\�AG�\�\r\�M��\0�hϙY�FCCK��Y���\�xqS3�Dhk�\�af��L\�\�<r;\�#�G�\�c�oq=\�e�Y\�A�� \�|\�\���Ks\�k�\�\�4\�\�o�E\���6(���jo̝\��(�-6!H٢�\'\�ǵ\�>DYd�%\�;UO4�:3\��\�\�^\�o�*\�\�/+\�\��\�t\�\�\�-�\�ZJ\���^\�\�\��#Q�%\�q54\�eE����1\��q\������\n��\�-aߚCw�!�\�Y�\�H�my\�\�8\�\�\Z?5Lc\0|�\�\�C.N�\�~W\�\�V�,	�-6- �1\�\�Ju���74�\\pυ��w~%b�?IZ,uy\�_�pH\�m@�\"\�p\�\�Q�m�Ë�\�\�D�X�-!6�#+W�\�qs&����\�o�\�n]ͷ�\�{m�\�\��G��nT-e\�Z\�\�\�\�\�zȅ�ر���pG��\�\�\03\�}2�\�}8y��\�)\�C�Or\�\�\�o)�wE\"8���\��C��Ap�=V\�C��\�cPDl�9\0\��:�[&�\�r\�`\��<\�sT|/��	\�\�\�\�\�U&ɏU�U[�����z�\�b�\�n�>��i.K)\�z\�׿ݷ̠���dm.{�h\�I�Z\�V;,�m3l\��W\�V+0\�\�\�����7\�ALS\��#h��\�<�$?3�w�\�\\\ZY#p-$t\�\�C��\Zsග?\ndv6\�\�h3bq ,y*+����\n�UY�}�\�\�\��\�y$��]-v\�Sn\n\�؃�W\���<\�L\����8r!DVEMRDuQ��q��h\�~^z.�=0+_\��\�-)C�c-D.\�S�x\0\�\�;��\'�\�D�79�ͳX4�\�5T\��F\��c��£\�0\�\�\�\rt2\�t �D�.>�4�hs;��7K/�7E�a�%Q<q��g5�ѱ4�5��-�\�ၙ\"���M\�ԝ\�\�f�(K\n\� �nX#lc�#\�w�!�\��Y0rT\0\�\�גɺ�\�1�a�\'<�s�\�	\�\r^}.)�Q\�{���O\�f�\�\�\n*g\�\���1��Y�X{#cm��A�i��7�}�?�i�}O+MF\ZZ\�\0\�e�\r!;\�Æ\�$�]\�U�. \0I䶌?\0\r\�O�-MJ\�4[���`�\0:/h�����w�\�\�iQx��@r0l�B�B�-9�ԑ�l�Z�\"��8X��c�2\��jӕ��.�\�w8\��b���\�o�܃�S\�uT\�-KL��\�\�G�ⶬ>�)��\'���ǘ\�V\�a\�\�\�X�f^\���\�0\�ͻ��\�nG\�x\�0�\��\�O 8�É��\�#\0���\�Wh��\�p2Hw�ڟNC\��\�\�th�<^��+�~w ]\�{�\�\�z�*V*S\�E!I��\��\�G\�M~\nk\r�\��\�NeM\��[b�O �Z\�4\Z4\\q\�\�sY�UE ���������jw�J\�1 �Y\�q�Ê�S��,�h\�\�kZ\�TZ�4�Q�,E\���\"�p\�-\�rXN�\�%i���^4}��p<��`��D\�\�\�Bt\nZ\Z�f�+���UD@DDD@DDD@DDL��*�\�','JAVA',120000),('S002','2017-11-29 12:00:00',NULL,'C++',100000),('S003','2017-11-29 12:00:00',NULL,'BASIC JAVA',110000),('S004','2017-11-29 12:00:00',NULL,'DESIGN PATTERN',180000),('S005','2017-11-29 12:00:00',NULL,'BASIC JAVA',120000),('S006','2017-11-29 12:00:00',NULL,'MULTI THREAD IN JAVA',100000),('S007','2017-11-29 12:00:00',NULL,'BASIC C++',100000),('S008','2017-11-29 12:00:00',NULL,'OOP IN JAVA',150000),('S009','2017-11-29 12:00:00',NULL,'HTML5',160000);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30  7:39:12
