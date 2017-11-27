-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: stock
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
  `User_Name` varchar(20) NOT NULL,
  `Active` bit(1) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `User_Role` varchar(20) NOT NULL,
  PRIMARY KEY (`User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('admin','','123456','ROLE_ADMIN'),('member','','123','ROLE_MEMBER');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
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
INSERT INTO `products` VALUES ('S001','2017-11-27 16:40:13',NULL,'Core Java',100),('S002','2017-11-27 16:39:56',NULL,'Spring for Beginners',50),('S003','2017-11-27 16:39:45',NULL,'Swift for Beginners',120),('S004','2017-11-27 16:39:29',NULL,'Oracle XML Parser',120),('S005','2017-11-27 09:54:43','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0�\�\0C�\�\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\�\�!\"!\"!\"!\"!\" 	�\0\0\0\0\0i54\�-\Z�i\Z�D��S\0 ���o\\c5�\��/߃>�8��\�v\�\0t�:(XY��.���v\�/�!\�<��<\�V;v\�1 \0\0t߷�W�J���\�Ӫ\�\�\�\�u\��\�=�M\��\��)\�.��m\�[������{���I\�ِ�?�w1 \0& p���C�}�~c\�\�\�\�_%\�\�Ín#u�;]�;nW���g=l\�q��yY�\�s�}�u}\�\�_D\����\�\0!?3\��\0_;�C�\��\�?a�\��~�\�M\�\r\�ן�\�T?�A��\�~�{��X���\�8�\�_��t_\�0&$\0���c�6\0\�B\�0}y~˵iu�;c\�\�\�7G\\��(\�\�ʖ\�͐\�\� \�{+~�5\�Ǻ_Nt�\0�\�\�s�\��\�K���~�\�\�v�v�\�w\�/ʴ;V��m\�.ܡ\�7=��ƇX٫fQ��b8\�\�ȴv;M_\��\��=;�s\�|�@-?=����\�F�L}\\\�\'Y.D\��\�ᴩ\�(n��{]\������\�}JM:�_�\�X�\�gɻF ��\�\�\��&$�tc�Z�\�\�%�\�\0\�o?z�fw\�\��\�\�\�\�mݕ�F+d�\0b��#�|�\�{�)d\���\0��\0#aP���ϱ�\0�\�O��R&|]dO�\n\�OO��\�\�ZEZd\0\0 	�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0,\0\0\0\0\0\0\0\0\00! 1`\"2@�\�\0\0��\��\�\�)&\�\Z:g�ֳ,�\"vi���d��\��ۣ��}ζ/\�\�֊�\�^\�>������\�\�~GnSa��O����[Gm2\�:���s\�F��=\�\\�\�Ҷ|\���h)G\��0c��{f��:\�`~;]x�K`�W��\�\� \�b\�=�a���(\�o��a��\0+\Z\�\�9�\�f\�\r\Zbh�\�ON�m��\�(ͅ���@\�� ,UY��k\�Q�ܒL��\�\�\�U����n�K�hj�9\�SK$��ʖ\�5�\Z�9{c��W,ڻI2�^%\�+\�C.J(>\�M\�����\� �\�\�\�\�H?\ZR2B\�\\���$ͭ\���=\�\\�A\�6U��X����1ZĨ�����L<+��!<|ɲ���C��j��6Qo4Y\�\�򍯡`�L\�er\��e3�r�,�&�I�9\��\�\�^#��R\��~\�En���\�N\\GN�\�2�e�1E�W�9<p\�	���DzQ1~-�>5�}\�M�URa$��U<F\�\��l�{\�P{��y�\\p\�d����7W�\�\�~\�1�\�omu\nInL��\�;�aX�׮�.+�g	\\�/\�n\��R|�90�/	�0�U1�z��\�\�7\n��ُ\�cB��(�\�y;\��{�d\�\�\�\�\\�D���t��f\��\\\�\�)\�v\�\�#\Z��pP:+\'���Ȯf`�\�m\�5W\��t��\�\�y7ly�{\�b����j+<hb\�\�D\�Rb\���X�\�\�\�1\�v��[\�\�\�e�g�\�\�nl�\���\�\�����u:�\�j26b.\�\��],\�5qW�(�C�\�C%,\�W�\r����f��\�3\�C����\�$.*\0S�u9\�{(�ů�\ZU�\n:SZ\�it\�@u\��Z5�,\�6\�<�\�f�\Z\�*�P7���w�ۨ��I���&�ND�1RjD\0�8\']X��\�g���\�m�#N\��~\�\\\')L$�q�-\�\�u���a\0��\0���\�[��{URvr˵\\H�\�;\n�\�ƃ���@j��Z[�hV0�\Z��V���V�	t\��E�i�e|\�	\�,�\�\\1z���^�FU�jΡ2��Y2���\n\�U�j\�q��\�u$<\�Vm�(�\��+�qr\�5u�xi:%�i!�\�#ʋ$Q/�\"@3V\�\�!bW`0b�տ�\�\00\0\0\0\0\0\0\0\0\0! \"AQ1P02R���b���\�\0?�LAi�+j���\�+�-�U\�B\�\�i�\�f\�Oՙ,K�Ss�xr��\�gz�L\�!H\�\�L�\n�\�\nI�K���S\nM\�Bk\�{E;P.q\�@\�kh���\�\�\�\�]О�sm?�\�\�)1i�\���G\��M�yK�k�\���\��s\��\0ߪ��i\nn�\�E�v�z��թ\�q	\�8/\�\�T�g\�3\�*F�\�j�\�۵4��忁DrN���>�(�H\�!�\�+\�^¤`��	\"\�\�]`�����*ȍ\�\�K%��\�)\�\�\\-u\�\"\�\n\�a�\�\04\0\0\0\0\0\0\0\0\0!Q1A 02q\"PSa�#3BC����\�\0?�T�Ǒ�(��cU~Q�cU~Q�I��\�0i\�ËfӍ([��9\�&�\\i)\�\"]\�>�\�\�\�\�2�lu�XViC\�:\�\�l�D?/Ո�/5ECn��\�ufӶ�h�9\��NBl3l	���\�\�L�\�m	.+(F\�rV���\�-\�1;V�3UP\0�yi�#�X�zĝl\�E#%�\��e\�兩�EL%��h}޹�/s\�\�_S��C ��e\�\n \�!��Ҧo�ύ��\r��\�XH\�\'*��\�m���R��\�\�\08C9�o\"\�3�*���\�d�~b!8�A\�\�h\��eҖ\�~�1�-\�ux7�\�,\"\�\�o߼_���\�����\�\0M\0\n\0\0\0\0\0!\"12AQaq�#03BRr�� Cb��\�$6S���\�5`�4@DTs���\�\��\�\0\0?�\0\�\�g\�Fd\�%\�Ƀ�)��P\�\�.�ZY��ǉC��9��5Խe��&I\�$�ć�\�\�\�	�<J\�=Kw��$ѡ\��G�\0PZ��K%\�4�\�Zz�Fh\�8|J��Mr�	�퇹O�\�\��\0\�\�?]gG�\\�~Q��YtA?m\�������}\0��R\�5\'\�+\�\�ZuS�;m\�� LW\�M�|\�l��Te\��\0E\"DD�\��\�J 0�\�,Erq\���\�\�ۋ��ץN8���~8\�G\0�aH��R��X�d=m��G����P��\��O<���}r�Ї�T��ϔp\�\n]Stp�\��tn�Ѻ7E�\�\�J\�$\�\�\r�( ;-Dh��}a�%�\�\�i}T�O\�\r�[~ͽ��U��F\�[�H)\Z--Pt$*\�W:�!G\�cy�!K�2\�d愬HT\n�Cƃ0�\�~]Wr���vF\��}��OU��F�\�D�e^�ަ;�\�Cm6�[hA:�w�Ҫ�ў \�\�T��\�!�b\�<\�v�\�\����\�\�X@�\Z-+\�^GS\�\�K�X��\�p��nB�-0�)7-u��K��\�ꫥ��*�j̝%(�M��}�\�$~N_�\�X��\"\��	��nF�s3N\r�\��\�y����<t�&j\�6�׮	\�U�\�hZ|�\'Y�a��\�#��\�鴜�t\��t9d\�Z��٠R\�&�\�\�\���\�I\�\0�զ�Q{-m�\�\��l����Ս1Ѫ\\\�.\�*^7y\�]g����ݽe\�\�\�\�t�\�g^jb�J�M 7/C�[JJ!�\�5\�(��Z\�7��\�ߗ�l�ry~`Kz�6H�	Ɍ.OՌ\�M�K�&\�E�n��ȣ\�\�Ӟ�oDfA�54\\s�A���tm�:!J��R\�əFD^pk\�\�:.讝.]�Zw��I)vx�+%��;\�wy6\�`\�;��-\�S\�g��`\�=V�[�\�9F\�֏\�\��	�\�=��\�DK&kq鍡N\�j�K��\'��\��i}U\��T\��U]0\�J��;0��ܻa�M\n\�\�)\�+�\�>\�\��h9�:�lxK�\�:D�ʔ	�D$<$eH\�E\�X��+\�(���H	e�N�u�d���J\\\�f;]+�\�\��jK�R\�\Z[ZC\�37]teW\�Ap����QBm���&\�/\�7|#�cr$o�\�=U���\ZNk�E6�\�\�v�<\�-�s��$Sil\"#4\�e۷�\0��\�\�\�}tQ\�\n�K\���l?5�%��-˵ca\��q�{\�x\�dK\�[F\�:\�u\�fi;m�\�Ա\�x���\�\�Py�EZ \�\�:`\�_ęY��|�\�\�Tgd\�%\�{�\"\�|V��3Z!+(\�\�I\�O���\��{G���\\�y�~\�N�|b�FY\�B�X�6*2/JYp�*�� >�El�\�\�\�o�\�X\�e�T\�\�3\���\�&�!��Z� 7U\�x��\�\�f\�i��\�Q�mP�؍�]ca\�p�>�\�G�l݌��ӕ\�Q\�[%\�~\�Ɨi+�\�$�Y��s�\�\\e�ѹ*\n\'9F����М�̄����\�ls�EFjO\�=\rB�\\�_\�\��+4\�u-s\�\�\� <?�\\�\�r��IMW[3�s*𧻞\��,6\'�\�f�$=���#���4���^B��|7���ն��\�\�t\��(\�\�*\\Mp�=7U�qu�ds%D\�`�\�ڏ+,7��<�\�\��8�E\���V6��?�$�����\�ȘLcرdޫhb�M�?�UG\�V�\�\�o\��!�˲\�8\r�Ĩ\\�\�\�N�\� �R��F��}yCߔ*\�4��4�2���(Ńo���N��E+6�EĳM�q��\�9$\\ǉڪ�sK\��\�e6B}\��G�ze���B�,\�4�.gy%Y\��R-����!zf�ê^B�`�\�v\�a�gFP۶̭=\�\�\0\�Y1�u�U.�En_�2)�_d��:\�e\�0)zi���|b\'\Z�\�\\#R\�.\"]�\��\�\�+�Y\�U�\�y9�N\r�M_\"\��P���JY�S\�\�\�vry\�A�\�W\�і�0\�i,��9\nf�\�6�&\�B�7.�7(�\�LbboD�I�\�Uf�<x���\�Vd�\��w��q��^�\��a�(�4n��Fɣ=(\�g÷\�\n\�_�[\\�\'�4�ԑ�q��?۴�\�?�Ļ\�Ә�n\�G\�|\�\�\\n`�Ӂ\�!Di;\�9[\�12�{\r̻�F�`]`��e��Xա�0\�d���	�m\�S\�8^..#�\��m�J\�\�\�\��\�gl\�e��ċg5kh\�.�󊾉>\�\�-sRÖ�]�n�E�(Q$\�\��t�r�R&?H%<�.l�7}��\�\�/ZC�OSؘ\�6�\�h\�\�*�𪘛^\� �\�_`\0�\�e�]\�\�\nXE\���_�y2�3EN��x��\�\0w�X-t\�Q�E\��m\�\r�2\�\�\�;�\�\�\��\�j\�\�NbO@�o\�\r�J��\�\�$�\�R��\"Y{#i�E\�\�h+8\�\�rf�\r�FN�d%\�V	\��9dk�\�ԭ=\�\�(\�d�\�E�\��(y��� �5מ\0Ʉw&\��kpK\���=�rj�#3{\�%�~P\�\'\�)p_��a\�\�![U!tw�08O\�\�\�\\���f\�H\�,vT\�\��mǬ�\r�Y`Tɩl	��3X�%z\�`\�\�\ZٻI�΂�K\r3K� ۻ\�j\��\'E����n�\�\nXw\�\�\�\n\"d(�$�0\�y�(�#�\"�C�R-���ͦ�îS\r*\�b�2�)g:�e�2\�4Ʉ[j�\�ܱ{��r\�/2\�7ld{���t8ʛ,\�B\�6���:�$�&b]����\�AsŒ7nkZɶ\��\�\�&\�\�I�\�7\"e�إ��$�I�B�\�H0��e\��?@�z\\R꒏m\�SW��4\�B�+	�=a/2\�.%�7@�N�~����\�D����\�tw��[&WHDD�B�f��ѷ.�{\�\"ŝ�\�N�$\0��t*3k\�\�1��#\�\�J�.)�FB)؟\�o�\�\0*\0\0\0\0\0\0!1AQaq��0���� \�@P`\��\�\0\0?!�\0\�_\����\��>����oil˭x�lr`]�x9]�\\*Ŕ@Sݍ�\���\\ ^�ٲ2)=\� \"�n��n\�\�\�\�TXJ��[\�8wB\���.7H�\�q�M�fff~��d�[�=ܶ\�^2B4SY�J\�\�E:h�\�\�S~\�K\"\�j\�S\�N\�\�>��˜�2惖�\�\�s��+��\�]�hm\�O�*�W6u0\�>\"/0/�\�f�\�\�?D\�$tx�(l�pk�13�b`\�\�\��\�p^�\�Շ\�\�\0Ȫ�-\�X�uA\�i7���\�\rZJ-\�\Z��\\Y�o��8�\�\�Sp��\�����\�\�s0j�f\�IK �\0�0\���:\�Z.{u��i�N�ydO��]�\�\�\�\0�i�\�rF�-��\\c0�M�����S��B�\�Zff�\�Z\�s\n専\�8�F�jP\�\�\�\�n�U6\0N�F\�\���R��ae�\�bc,�\�\�\�P�|�,cOFs�uׇ\r��%c>��\0r\�􈁧p�ql��\�u|�\�\���\�K<������w[A	S\�HgZ.\"rVZI̲x�|}�O\�]bd\�W\�6����Xp\�\re9G�\�\�2ll\\R�\n�>\���r�3\��\�8?f4�{�}\"[���a��� �.10U\�U�\�RS�n:-\�\�5I\0SU\�,<\�l/\�\�-�]C�\�`˻Q�\ry�Q\�C��\�6�\�\�\�<��r\�M	��ٜog�H�o[���ܭ�&I�7���W�\"�~�\0W����^!~i\�:Q\�N8�_\�xAk6��Np���P���rz\�^�\��#��\�\�c��\�{�g��Px�\�#��ά�m�F�B�I\�\�\�S�\�9P��+�}\�^�VEp��V�b3D�߶\\?�֠\�\"\�\�\���M\�j�\�:����6��\�w6 N7�2n��y.�af�t�a\��\�\�^\��\n�\�w�3m\�\�\�ji��\�H.*\n���O��q�O..X�?z�m��1\�Ѕ\�*�\�e�)[Ja5\'�r��C\�\�\�(\�X������	�\��0ڰ\�\�PrG7Z��=\�;�PTxJ�*��O�\�S�b\\�$LLqI\�B.	\�dXꬉ�kD\�B\�jH])0�\�yg\�\�Lк\�\�$>bjVT\�y�\�BՏ6.J~\�\�\�(\��9\�\�`1�n��\�7;`ڸ�\�\�\�\'�\�[<\� 5\�\�\�\�<�_3l�x\�|�T������9��J�@}\�Y2�\�a�6�ǭ\��B{\�\��\�[�q�?R5�\0��\�\��	��^v1[I*ԭ~���ȿ�_\�$_\�9\��S��z\�.��\�m\�7戩\�Xd\��r_2\�,qEߒ\r#.�Q\�p�\�\�\�B\�[[ڮp�IF辿T�<\�qSVK�A�ԋ�\�{\�?�&U\� ��^v!��zo\�KN\�\�zB\�\�,��2�;4�(ĩ\�rv\�_;Jpq�\�\�,n\�?2È�\�ѬNc\�5:.5��c�H\���\0\�h^`\�\�\�`����\�;\�\�\'(�\�8���w��2$R\�]!�\�GA�{ҙe�JW���\0hg��\�Ţj�q�n[˛�> M[E\n�\�-�\Zf(�x�P��\Z[��۴[�?:\�t����A\�)\�A��K�b*r�\�����\�\�\�\�Cp$+\�\�I��PK\��v=ˌ,�~�,\�1�#\�f1G��c	X�t���i�0}Z!���\�\�\�g����Ĵ#�	Շ���n�X��0���b\�\���<!��5֞q�\�W�{b\�`ҩ^���%��_T��\nǹV]�\0h�\0�OY��\�V;�\0Y\Z��\�U\�\�\�`{\'\�it\�5�\0{r\�˗.\\�r\�˗.\\�r\�˗._\��\�\0\0\0\0\0\0c0\�0\�02�\0\0\0\0\0\0\n\0\0�(l�ڋ\0(\0\0\0�-a`*\0�\0\0BA�r*3�\0BI��.�\�\0\0�tM8�\�#�\�Dc@<\��>f�+���.Mˇs|�\�\0C9�\0\0(\0\0\0\0\0\0\0\0<s\�<�\�<�\�<�\�\0\"\0\0\0\0\0\0\0\0\0\0!1A Qa�0Pq��\�\0?�\nq\����R\�_����g[7d\�B\�\�ԛ�A\�w�ks�)�y�\�?�e���7�@ԫېOB	\�/��\�X([\�3K��\�\�9�\�zq\�͖)��\�\�x�\�\0\��[Ef[\�y��r�h��\���\'�kZ�N^�Va\�b�6Fv\�B\��\�\�)\�W�<�,�Q��\�/Q5�\n\��\\�QwģM�\n\� )s��\0�lU��\�\0)\0\0\0\0\0\0\0\0\0!1 AQa��q��\��0@P���\�\0?����\�>�\�ώ\'�\�B뿩B2�`��\�\�f ���!E0�m\�C�9kS\��w\�C\n��\�#\�\�G�u>�bx�*`�\\�SAuV-i�,q�7@C�y��Jef	�+�Z�nx>w��;\��	Epa?9J\0\�]Pf�\0\r\04�upE���+)\n6\�OI�����җ{�\�7��S\��,\�\�\Z��gΐ \�t\r�Ţ\�e�7ܴ��\��6��$j�)�A�%8\�p\"�\���\�\0)\0\0\0\0\0\0!1AQq�a�� �\�0�@�\���\�\0\0?�\Z\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�Q\�\�!N\ru\r?\�:|CG���\�\����\��\0�\�\��v�\��\0\�[�U�V\�\�\����\"pk�>\�\�\��|�P\nav���\�H(Z&x\�t.\�s��r�lО\'.0e�.���se.�/\\\�Pi~\�~�^\�\�cL��w�\�O\���i+�\0���D��\'\�\�\�q\Z|��_\�\�$4x��@�ԗԇ`�\�7�pށ\�!:��\�\�\0/\�)�7=(�\0(k)K�3?X\�C|\Z�է4ZL��ja~-�\0R\������H1F7�f�\�c��:��@Z�Eu\r?\�\�D�22\�\�%O\��\�7\� ೂX�\�\�b\r�ɉ\�Ca�>\�\"mjֈ`	��\�r�\�\��Rá����!!4KX2��)k�\n~A�>���&,|CG��! ����v\�x�<�U�%F�\�8�lB\\\0Y@�h��م�\�h6\�\�(Hioi��ն\�\�<�\�˵�n#DU�c��>�\�L�\\]c�\�\�.�)��S��Fd�,C�:ρ\'�!�\��A�0\���[�\Z�\�S��\�\�m)��F���\\-#\�:�\��T��z��u:{T\�A{�x�3(W�\0�D(*�)A�tfԊ\�@%\n\0�X`�F˸�Qh���\0PX�M�+�%��Yȍl)\�\�\�\�?\�\���U\�KR��\�V{,\\�M��\�?7U�)B,$�V(w�\�`����E+Q��2�S�<�!��<��\�\�R\�\�@H6j.\�\�w2\\�Y_\'��E�\�\�9.��;0-��\�qY�n\�S\rz��\�\����p^J���R��\Z���\�[�\�ž�Ү��P�8\0r|��o\\�]k0����6\�y[a\���h����q�Ա��o�\�L/o���)�\�e\r\�\�ӟ>\�!��w\��ׁ�ʻ&�\�� &3V>�\�#�\�4x�\0	\�`xV�\�(.ܬ\�s���\��N��0cο�JDG�H%9?\"P���e�~�\�P�d�S@�\�}F.B�\�|\�V\0����\�\0@2\�8_$��᎟\�\��_<w.\\맀�x\�\�\\\�]\���£z_HU\�*[\�\�$c���H���׈@��\�\�̮d\�\��\n\���\�\�yW\��ҍz\�\0g�~?�5M\�#�`��pQ�%���\�\��h��B\�;�e�\���\�����\�\�馮g���mpv\�V `(\�e���J�̧�R�\�=\�\���9\Z��	�x%4\�\�\�1�\��[���\�m_\�U,\�^.XP�\�x�\0\�B�pRR\� �/��\�3\�?GO�h��h9SjШ\�C@�\�w:�c�C��%�CmE�,\�\n�:`c	n\�!���a,@�/^ᴡ�������C\�\�\n4�ȃ�Mg\�80E���L@h�A7K\�\�8j��w�1\�/�&6\�Ik*�`f\�(ru\�<\\\\\�$�J^[X0ŎcOÎIEᓃN\�4�\�\�\���\�N$\r!\�_s�\��Lf����fY�*o\�\�\�j�\�\r�ː\�mPV��8\�\�E�zy#�ߙ}� �\0ZM$b\�\�br\r�e\�W�\�0!�\�\�3��X�\� kz$�:cp.ХB�\�bͯ\�4(Y1\��Q\�\n�G�]�b\���$\�19/+�\�\�-\�x#T	�\�\�V>\�\�\�Mq�q3$\�)����ƌiK\n\0\'Pmi`2_6o��\�\�\�y\r�뾁�1U\�f�C\0u��P�q_�*/R�7駞\'z�\�\0;�ϩ��\'A��QڽbS�\�\�	��S\�\�\�\�(�\� \�>B$a\�\0R\�a\����(,��\�p� \�\r\�\�\�Ea�\"F�9.`e\Z[#�\�k��g)�`l~I��� ��+n�s�\�t3#� \���$��\�4<\�j\"\�H-\�\�\�\��J�\�$\r��Ͽ\�\�\�a�\�g�\�\�\�\�z�Ӯ����8�r\�7�\�_`_ʱ\�&�\n|�\�\�Z\�?(!!p�igΎ��\�`0��J`\�%�Ľ���OFe�X�;�\�,e\�\�:GP6�BQm���e\�\�\�\�\0�aTq\�\�O`\�e�e�(C\�\r��*PӨ �XP�Z/\0X\0\04��\�4x��\"�dԄ	���6�Fo7Ã��\�h!\�,\�A2:F��G�8ȵz?��Q�\�G^#z\�U���6B��i���*�\�\�P\�F\���0�H�@۶\�F��+>`c\��\���\'�`\�M\�$\�\�J32K�K�:�ڨ�9�D\��\�%C\Z\�P~�O�h��\�i��\��DJK.Lq4\�x#�\�\�`�_��3J(\�>\�	��?\�.al\�\�,~r\�Ț\�\r�\� dd�h\�\�\�&��X\n��av|r�n	>3Q\�̨�\�c\�DV*+�\0�\�t�����8v$R8\�\'\�%\�ey\�-\�\�L\�L���\�\�&�=�/S �%��|\"\�`&sľe�\�Pθ�>a)0��\�\�i��	�\�x�Ο\�\���\�\�\\\n�\�����m�\�\���{�a\� >cjcG\�P8���\\\n\0+\���\�\��C�\�4x�\0�\���&�;=\�v{�\��)\�\�S�ܧg�N\�r��\�;=\�v{�\��)\�\�S�ܧg�N\�r��\�;=\�v{�\��)\�\�S�ܧg�N\�qJrj�\�','CSharp Tutorial for Beginers',110);
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

-- Dump completed on 2017-11-27 18:10:44
