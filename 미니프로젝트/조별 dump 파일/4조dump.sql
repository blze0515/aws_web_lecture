-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 14.63.62.56    Database: sagaji_4
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `t_sgj_cart`
--

DROP TABLE IF EXISTS `t_sgj_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_cart` (
  `USER_ID` varchar(30) NOT NULL,
  `PRDCT_NO` varchar(15) NOT NULL,
  `PRDCT_DETAIL_NO` int NOT NULL,
  `CART_CNT` int NOT NULL,
  `CART_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`USER_ID`,`PRDCT_NO`,`PRDCT_DETAIL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_cart`
--

LOCK TABLES `t_sgj_cart` WRITE;
/*!40000 ALTER TABLE `t_sgj_cart` DISABLE KEYS */;
INSERT INTO `t_sgj_cart` VALUES ('admin','PRDCT_K_05',1,1,'2022-12-02 14:21:08'),('admin','PRDCT_S_05',1,1,'2022-12-02 14:21:44'),('ezen','PRDCT20221128_1',1,3,'2022-12-01 19:46:22'),('ezen','PRDCT20221128_1',2,1,'2022-12-01 19:47:34'),('ezen','PRDCT20221128_1',3,2,'2022-12-01 19:47:43'),('ezen','PRDCT20221128_1',4,1,'2022-12-01 19:48:12'),('ezen','PRDCT20221128_1',5,1,'2022-12-01 19:48:10');
/*!40000 ALTER TABLE `t_sgj_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_category`
--

DROP TABLE IF EXISTS `t_sgj_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_category` (
  `CATEGORY_CD` int NOT NULL AUTO_INCREMENT,
  `CATEGORY_NM` varchar(30) NOT NULL,
  `CATEGORY_USE_YN` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`CATEGORY_CD`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_category`
--

LOCK TABLES `t_sgj_category` WRITE;
/*!40000 ALTER TABLE `t_sgj_category` DISABLE KEYS */;
INSERT INTO `t_sgj_category` VALUES (1,'모든 제품','Y'),(2,'옷장','Y'),(3,'테이블','Y'),(4,'침대','Y'),(5,'주방가구','Y'),(6,'쇼파','Y');
/*!40000 ALTER TABLE `t_sgj_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_image`
--

DROP TABLE IF EXISTS `t_sgj_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_image` (
  `PRDCT_NO` varchar(15) NOT NULL,
  `PRDCT_DETAIL_NO` int NOT NULL,
  `PRDCT_IMAGE_NO` int NOT NULL,
  `PRDCT_IMAGE_NM` varchar(100) NOT NULL,
  `PRDCT_IMAGE_TYPE` varchar(10) NOT NULL,
  PRIMARY KEY (`PRDCT_NO`,`PRDCT_DETAIL_NO`,`PRDCT_IMAGE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_image`
--

LOCK TABLES `t_sgj_image` WRITE;
/*!40000 ALTER TABLE `t_sgj_image` DISABLE KEYS */;
INSERT INTO `t_sgj_image` VALUES ('PRDCT_C_01',1,1,'closet1','.png'),('PRDCT_C_02',1,1,'closet2','.png'),('PRDCT_C_03',1,1,'closet3','.png'),('PRDCT_C_04',1,1,'closet4','.png'),('PRDCT_C_05',1,1,'closet5','.png'),('PRDCT_K_01',1,1,'kitchen1','.png'),('PRDCT_K_02',1,1,'kitchen2','.png'),('PRDCT_K_03',1,1,'kitchen3','.png'),('PRDCT_K_04',1,1,'kitchen4','.png'),('PRDCT_K_04',2,1,'kitchen5','.png'),('PRDCT_K_05',1,1,'kitchen6','.png'),('PRDCT_K_05',2,1,'kitchen7','.png'),('PRDCT_S_01',1,1,'sofa1','.png'),('PRDCT_S_02',1,1,'sofa2','.png'),('PRDCT_S_03',1,1,'sofa3','.png'),('PRDCT_S_04',1,1,'sofa4','.png'),('PRDCT_S_05',1,1,'sofa5','.png');
/*!40000 ALTER TABLE `t_sgj_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_order`
--

DROP TABLE IF EXISTS `t_sgj_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_order` (
  `ORDER_NO` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(30) NOT NULL,
  `ORDER_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ORDER_TOTAL_AMT` int NOT NULL DEFAULT '0',
  `PAY_YN` char(1) NOT NULL DEFAULT 'N',
  `CANCEL_YN` char(1) DEFAULT 'N',
  PRIMARY KEY (`ORDER_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_order`
--

LOCK TABLES `t_sgj_order` WRITE;
/*!40000 ALTER TABLE `t_sgj_order` DISABLE KEYS */;
INSERT INTO `t_sgj_order` VALUES (1,'ezen','2022-12-02 02:49:27',170000,'Y','N'),(2,'ezen','2022-12-02 03:15:07',175000,'Y','N'),(3,'ezen','2022-12-02 03:21:50',60000,'Y','N'),(4,'ezen','2022-12-02 03:23:31',200000,'Y','N'),(5,'ezen','2022-12-02 03:34:09',118000,'Y','N'),(6,'test','2022-12-02 09:48:03',212000,'Y','N');
/*!40000 ALTER TABLE `t_sgj_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_order_item`
--

DROP TABLE IF EXISTS `t_sgj_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_order_item` (
  `ORDER_NO` int NOT NULL,
  `PRDCT_NO` varchar(15) NOT NULL,
  `PRDCT_DETAIL_NO` int NOT NULL,
  `ORDER_CNT` int NOT NULL,
  `ORDER_AMT` int NOT NULL,
  PRIMARY KEY (`ORDER_NO`,`PRDCT_NO`,`PRDCT_DETAIL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_order_item`
--

LOCK TABLES `t_sgj_order_item` WRITE;
/*!40000 ALTER TABLE `t_sgj_order_item` DISABLE KEYS */;
INSERT INTO `t_sgj_order_item` VALUES (1,'PRDCT_K_01',1,5,170000),(2,'PRDCT_K_03',1,7,175000),(3,'PRDCT_K_02',1,3,60000),(4,'PRDCT_K_02',1,10,200000),(5,'PRDCT_K_04',2,2,118000),(6,'PRDCT_K_05',1,4,212000);
/*!40000 ALTER TABLE `t_sgj_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_prdct`
--

DROP TABLE IF EXISTS `t_sgj_prdct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_prdct` (
  `PRDCT_NO` varchar(20) NOT NULL,
  `PRDCT_NM` varchar(50) NOT NULL,
  `PRDCT_INFO` varchar(50) NOT NULL,
  `PRDCT_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRDCT_USE_YN` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`PRDCT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_prdct`
--

LOCK TABLES `t_sgj_prdct` WRITE;
/*!40000 ALTER TABLE `t_sgj_prdct` DISABLE KEYS */;
INSERT INTO `t_sgj_prdct` VALUES ('PRDCT_C_01','GRIMO 그리모','도어','2022-12-02 03:26:42','Y'),('PRDCT_C_02','JONAXEL 요낙셀','옷장콤비네이션','2022-12-02 03:27:19','Y'),('PRDCT_C_03','BOAXEL 보악셀','옷장콤비네이션','2022-12-02 03:42:52','Y'),('PRDCT_C_04','RAKKESTAD 라케스타드','오픈형 옷장','2022-12-02 03:33:04','Y'),('PRDCT_C_05','MUSKEN 무스켄','옷장+도어2/서랍3','2022-12-02 03:40:51','Y'),('PRDCT_K_01','TOLLSJÖN 톨셴','주방샤워수도꼭지, 블랙 광택메탈','2022-12-02 02:40:22','Y'),('PRDCT_K_02','SÄLJAN 셀리안','조리대, 참나무무늬/라미네이트','2022-12-02 03:00:04','Y'),('PRDCT_K_03','UPPDATERA 우프다테라','식기도구트레이/트레이 및 칼+양념통선반','2022-12-02 03:12:24','Y'),('PRDCT_K_04','TORNVIKEN 토른비켄','키친 아일랜드, 오프화이트/참나무','2022-12-02 03:30:57','Y'),('PRDCT_K_05','ENHET 엔헤트','주방 아일랜드','2022-12-02 09:40:37','Y'),('PRDCT_S_01','GLOSTAD 글로스타드','작고 귀여운 소파로 좁은 공간에도 잘 어울립니다.','2022-12-02 10:33:46','Y'),('PRDCT_S_02','BACKSÄLEN 박셀렌','커버는 분리하여 물세탁이 가능하기 때문에 오랫동안 깨끗하게 사용할 수 있습니다.','2022-12-02 10:35:13','Y'),('PRDCT_S_03','SÖDERHAMN 쇠데르함','3인용섹션, 비아르프 베이지/브라운','2022-12-02 10:43:16','Y'),('PRDCT_S_04','LANDSKRONA 란스크로나','3인용소파, 그란/봄스타드 블랙/메탈','2022-12-02 10:44:26','Y'),('PRDCT_S_05','VIMLE 빔레','3인용소파, 머리받침/그란/봄스타드 블랙','2022-12-02 10:45:12','Y');
/*!40000 ALTER TABLE `t_sgj_prdct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_prdct_bak`
--

DROP TABLE IF EXISTS `t_sgj_prdct_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_prdct_bak` (
  `PRDCT_NO` varchar(255) NOT NULL,
  `PRDCT_NM` varchar(50) NOT NULL,
  `PRDCT_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRDCT_USE_YN` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`PRDCT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_prdct_bak`
--

LOCK TABLES `t_sgj_prdct_bak` WRITE;
/*!40000 ALTER TABLE `t_sgj_prdct_bak` DISABLE KEYS */;
INSERT INTO `t_sgj_prdct_bak` VALUES ('','','2022-11-30 23:36:19','Y'),('PRDCT20221128_1','테스트 제품','2022-11-28 22:28:55','Y'),('PRDCT20221128_10','테스트이름','2022-11-30 23:11:43','Y'),('PRDCT20221128_11','','2022-11-30 23:38:33','Y'),('PRDCT20221128_2','테스트 제품2','2022-11-28 22:29:10','Y'),('PRDCT20221128_3','TEST_제품3','2022-11-28 22:29:22','Y'),('PRDCT20221128_4','TEST_제품4','2022-11-29 17:11:58','Y'),('PRDCT20221128_5','TEST_제품5','2022-11-29 17:12:02','Y'),('PRDCT20221128_6','TEST_제품6','2022-11-29 17:12:07','Y'),('PRDCT20221128_7','TEST_제품7','2022-11-29 17:12:12','Y'),('PRDCT20221128_8','TEST_제품8','2022-11-29 17:12:16','Y'),('PRDCT20221128_9','TEST_제품9','2022-11-29 17:12:21','Y');
/*!40000 ALTER TABLE `t_sgj_prdct_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_prdct_bak_1202`
--

DROP TABLE IF EXISTS `t_sgj_prdct_bak_1202`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_prdct_bak_1202` (
  `PRDCT_NO` varchar(20) NOT NULL,
  `PRDCT_NM` varchar(50) NOT NULL,
  `PRDCT_INFO` varchar(50) NOT NULL,
  `PRDCT_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRDCT_USE_YN` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_prdct_bak_1202`
--

LOCK TABLES `t_sgj_prdct_bak_1202` WRITE;
/*!40000 ALTER TABLE `t_sgj_prdct_bak_1202` DISABLE KEYS */;
INSERT INTO `t_sgj_prdct_bak_1202` VALUES ('','','제품 설명 TEST','2022-11-30 23:36:19','Y'),('C_1','신규제품','파란색 옷장입니다.','2022-12-01 19:59:09','Y'),('PRDCT20221128_1','테스트 제품','제품 설명 TEST','2022-11-28 22:28:55','Y'),('PRDCT20221128_10','테스트이름','제품 설명 TEST','2022-11-30 23:11:43','Y'),('PRDCT20221128_11','','제품 설명 TEST','2022-11-30 23:38:33','Y'),('PRDCT20221128_12','듀오백','제품에 대한 설명 입력','2022-12-01 13:50:31','Y'),('PRDCT20221128_16','TESTTEST','SDFF','2022-12-01 16:09:19','Y'),('PRDCT20221128_17','테스트이름','aaaa','2022-12-01 15:38:44','Y'),('PRDCT20221128_2','테스트 제품2','제품 설명 TEST','2022-11-28 22:29:10','Y'),('PRDCT20221128_20','TESTTEST','aaaaa','2022-12-01 16:13:46','Y'),('PRDCT20221128_22','테스트이름','AAA','2022-12-01 16:19:47','Y'),('PRDCT20221128_23','TESTTEST','상세내용 작성','2022-12-01 17:40:17','Y'),('PRDCT20221128_3','TEST_제품3','제품 설명 TEST','2022-11-28 22:29:22','Y'),('PRDCT20221128_4','TEST_제품4','제품 설명 TEST','2022-11-29 17:11:58','Y'),('PRDCT20221128_5','TEST_제품5','제품 설명 TEST','2022-11-29 17:12:02','Y'),('PRDCT20221128_6','TEST_제품6','제품 설명 TEST','2022-11-29 17:12:07','Y'),('PRDCT20221128_7','TEST_제품7','제품 설명 TEST','2022-11-29 17:12:12','Y'),('PRDCT20221128_8','TEST_제품8','제품 설명 TEST','2022-11-29 17:12:16','Y'),('PRDCT20221128_9','TEST_제품9','제품 설명 TEST','2022-11-29 17:12:21','Y'),('','','제품 설명 TEST','2022-11-30 23:36:19','Y'),('C_1','신규제품','파란색 옷장입니다.','2022-12-01 19:59:09','Y'),('PRDCT20221128_1','테스트 제품','제품 설명 TEST','2022-11-28 22:28:55','Y'),('PRDCT20221128_10','테스트이름','제품 설명 TEST','2022-11-30 23:11:43','Y'),('PRDCT20221128_11','','제품 설명 TEST','2022-11-30 23:38:33','Y'),('PRDCT20221128_12','듀오백','제품에 대한 설명 입력','2022-12-01 13:50:31','Y'),('PRDCT20221128_16','TESTTEST','SDFF','2022-12-01 16:09:19','Y'),('PRDCT20221128_17','테스트이름','aaaa','2022-12-01 15:38:44','Y'),('PRDCT20221128_2','테스트 제품2','제품 설명 TEST','2022-11-28 22:29:10','Y'),('PRDCT20221128_20','TESTTEST','aaaaa','2022-12-01 16:13:46','Y'),('PRDCT20221128_22','테스트이름','AAA','2022-12-01 16:19:47','Y'),('PRDCT20221128_23','TESTTEST','상세내용 작성','2022-12-01 17:40:17','Y'),('PRDCT20221128_3','TEST_제품3','제품 설명 TEST','2022-11-28 22:29:22','Y'),('PRDCT20221128_4','TEST_제품4','제품 설명 TEST','2022-11-29 17:11:58','Y'),('PRDCT20221128_5','TEST_제품5','제품 설명 TEST','2022-11-29 17:12:02','Y'),('PRDCT20221128_6','TEST_제품6','제품 설명 TEST','2022-11-29 17:12:07','Y'),('PRDCT20221128_7','TEST_제품7','제품 설명 TEST','2022-11-29 17:12:12','Y'),('PRDCT20221128_8','TEST_제품8','제품 설명 TEST','2022-11-29 17:12:16','Y'),('PRDCT20221128_9','TEST_제품9','제품 설명 TEST','2022-11-29 17:12:21','Y');
/*!40000 ALTER TABLE `t_sgj_prdct_bak_1202` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_prdct_detail`
--

DROP TABLE IF EXISTS `t_sgj_prdct_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_prdct_detail` (
  `PRDCT_NO` varchar(255) NOT NULL,
  `PRDCT_DETAIL_NO` int NOT NULL,
  `PRDCT_CATEGORY_CD` int NOT NULL,
  `PRDCT_SIZE` varchar(50) NOT NULL,
  `PRDCT_COLOR` varchar(5) NOT NULL,
  `PRDCT_MATERIAL` varchar(5) NOT NULL,
  `PRDCT_PRICE` int NOT NULL,
  `PRDCT_REMAIN` int NOT NULL,
  `PRDCT_DETAIL_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRDCT_MODF_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRDCT_DETAIL_USE_YN` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`PRDCT_NO`,`PRDCT_DETAIL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_prdct_detail`
--

LOCK TABLES `t_sgj_prdct_detail` WRITE;
/*!40000 ALTER TABLE `t_sgj_prdct_detail` DISABLE KEYS */;
INSERT INTO `t_sgj_prdct_detail` VALUES ('PRDCT_C_01',1,2,'L','A0003','B0001',24500,4,'2022-12-02 03:47:15','2022-12-02 03:47:15','Y'),('PRDCT_C_02',1,2,'L','A0003','B0002',15000,12,'2022-12-02 03:47:46','2022-12-02 03:47:46','Y'),('PRDCT_C_03',1,2,'M','A0001','B0002',13500,21,'2022-12-02 03:48:45','2022-12-02 03:48:45','Y'),('PRDCT_C_04',1,2,'M','A0002','B0001',45000,3,'2022-12-02 03:49:16','2022-12-02 03:49:16','Y'),('PRDCT_C_05',1,2,'L','A0001','B0001',57000,2,'2022-12-02 03:49:51','2022-12-02 03:49:51','Y'),('PRDCT_K_01',1,5,'M','A0002','B0002',34000,120,'2022-12-02 02:41:08','2022-12-02 02:41:08','Y'),('PRDCT_K_02',1,5,'L','A0003','B0003',20000,200,'2022-12-02 03:00:08','2022-12-02 16:24:13','Y'),('PRDCT_K_03',1,5,'L','A0001','B0001',25000,70,'2022-12-02 03:12:57','2022-12-02 03:12:57','Y'),('PRDCT_K_04',1,5,'M','A0003','B0003',39000,50,'2022-12-02 03:31:53','2022-12-02 03:31:53','Y'),('PRDCT_K_04',2,5,'L','A0003','B0003',59000,60,'2022-12-02 03:32:20','2022-12-02 03:32:20','Y'),('PRDCT_K_05',1,5,'M','A0002','B0002',53000,300,'2022-12-02 09:41:35','2022-12-02 09:41:35','Y'),('PRDCT_K_05',2,5,'M','A0003','B0002',53000,420,'2022-12-02 09:43:07','2022-12-02 09:43:07','Y'),('PRDCT_S_01',1,6,'M','A0002','B0001',55000,15,'2022-12-02 10:33:46','2022-12-02 10:33:46','Y'),('PRDCT_S_02',1,6,'M','A0003','B0001',53000,10,'2022-12-02 10:35:13','2022-12-02 10:35:13','Y'),('PRDCT_S_03',1,6,'L','A0003','B0001',59000,20,'2022-12-02 10:43:16','2022-12-02 10:43:16','Y'),('PRDCT_S_04',1,6,'L','A0002','B0002',56000,20,'2022-12-02 10:44:26','2022-12-02 10:44:26','Y'),('PRDCT_S_05',1,6,'L','A0002','B0003',59500,10,'2022-12-02 10:45:12','2022-12-02 10:45:12','Y');
/*!40000 ALTER TABLE `t_sgj_prdct_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_prdct_detail_bak_1202`
--

DROP TABLE IF EXISTS `t_sgj_prdct_detail_bak_1202`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_prdct_detail_bak_1202` (
  `PRDCT_NO` varchar(255) NOT NULL,
  `PRDCT_DETAIL_NO` int NOT NULL,
  `PRDCT_CATEGORY_CD` int NOT NULL,
  `PRDCT_SIZE` varchar(50) NOT NULL,
  `PRDCT_COLOR` varchar(5) NOT NULL,
  `PRDCT_MATERIAL` varchar(5) NOT NULL,
  `PRDCT_PRICE` int NOT NULL,
  `PRDCT_REMAIN` int NOT NULL,
  `PRDCT_DETAIL_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRDCT_MODF_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRDCT_DETAIL_USE_YN` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_prdct_detail_bak_1202`
--

LOCK TABLES `t_sgj_prdct_detail_bak_1202` WRITE;
/*!40000 ALTER TABLE `t_sgj_prdct_detail_bak_1202` DISABLE KEYS */;
INSERT INTO `t_sgj_prdct_detail_bak_1202` VALUES ('C_1',1,1,'S','A0002','B0002',50000,20,'2022-12-01 19:59:10','2022-12-01 19:59:10','Y'),('PRDCT20221128_1',1,2,'S','A0001','B0001',10000,100,'2022-11-28 22:38:53','2022-11-28 22:38:53','Y'),('PRDCT20221128_1',2,2,'M','A0002','B0002',20000,150,'2022-11-28 22:38:55','2022-11-28 22:38:55','Y'),('PRDCT20221128_1',3,2,'S','A0003','B0003',7870,23,'2022-11-29 21:27:38','2022-11-29 21:27:38','Y'),('PRDCT20221128_1',4,2,'S','A0004','B0004',8000,17,'2022-11-29 21:28:01','2022-11-29 21:28:01','Y'),('PRDCT20221128_1',5,2,'S','A0005','B0005',125700,57,'2022-11-29 21:28:27','2022-11-29 21:28:27','Y'),('PRDCT20221128_1',6,2,'M','A0006','B0006',83000,66,'2022-11-29 21:28:50','2022-11-29 21:28:50','Y'),('PRDCT20221128_10',1,3,'M','blue','metal',100000,100,'2022-11-30 23:11:43','2022-11-30 23:11:43','Y'),('PRDCT20221128_12',1,2,'M','green','tree',500000,200,'2022-12-01 13:50:31','2022-12-01 13:50:31','Y'),('PRDCT20221128_2',1,3,'L','A0007','B0004',500000,270,'2022-11-28 22:41:05','2022-11-28 22:41:05','Y'),('PRDCT20221128_22',1,3,'S','','B0002',100000,100,'2022-12-01 16:19:47','2022-12-01 16:19:47','Y'),('PRDCT20221128_23',1,1,'S','black','tree',700000,200,'2022-12-01 17:40:17','2022-12-02 01:09:40','Y'),('PRDCT20221201_1',1,2,'S','A0001','B0002',100000,20,'2022-12-02 00:00:12','2022-12-02 00:00:12','Y'),('C_1',1,1,'S','A0002','B0002',50000,20,'2022-12-01 19:59:10','2022-12-01 19:59:10','Y'),('PRDCT20221128_1',1,2,'S','A0001','B0001',10000,100,'2022-11-28 22:38:53','2022-11-28 22:38:53','Y'),('PRDCT20221128_1',2,2,'M','A0002','B0002',20000,150,'2022-11-28 22:38:55','2022-11-28 22:38:55','Y'),('PRDCT20221128_1',3,2,'S','A0003','B0003',7870,23,'2022-11-29 21:27:38','2022-11-29 21:27:38','Y'),('PRDCT20221128_1',4,2,'S','A0004','B0004',8000,17,'2022-11-29 21:28:01','2022-11-29 21:28:01','Y'),('PRDCT20221128_1',5,2,'S','A0005','B0005',125700,57,'2022-11-29 21:28:27','2022-11-29 21:28:27','Y'),('PRDCT20221128_1',6,2,'M','A0006','B0006',83000,66,'2022-11-29 21:28:50','2022-11-29 21:28:50','Y'),('PRDCT20221128_10',1,3,'M','blue','metal',100000,100,'2022-11-30 23:11:43','2022-11-30 23:11:43','Y'),('PRDCT20221128_12',1,2,'M','green','tree',500000,200,'2022-12-01 13:50:31','2022-12-01 13:50:31','Y'),('PRDCT20221128_2',1,3,'L','A0007','B0004',500000,270,'2022-11-28 22:41:05','2022-11-28 22:41:05','Y'),('PRDCT20221128_22',1,3,'S','','B0002',100000,100,'2022-12-01 16:19:47','2022-12-01 16:19:47','Y'),('PRDCT20221128_23',1,1,'S','black','tree',700000,200,'2022-12-01 17:40:17','2022-12-02 01:09:40','Y'),('PRDCT20221201_1',1,2,'S','A0001','B0002',100000,20,'2022-12-02 00:00:12','2022-12-02 00:00:12','Y');
/*!40000 ALTER TABLE `t_sgj_prdct_detail_bak_1202` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_question`
--

DROP TABLE IF EXISTS `t_sgj_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_question` (
  `QUESTION_NO` int NOT NULL,
  `QUESTION_TITLE` varchar(150) NOT NULL,
  `QUESTION_CONTENT` varchar(1500) NOT NULL,
  `QUESTION_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `QUESTION_MODF_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `QUESTION_STATE` varchar(20) NOT NULL DEFAULT '접수중',
  `QUESTION_ANSWER` varchar(1500) DEFAULT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `QUESTION_SECRET_YN` char(1) DEFAULT 'N',
  PRIMARY KEY (`QUESTION_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_question`
--

LOCK TABLES `t_sgj_question` WRITE;
/*!40000 ALTER TABLE `t_sgj_question` DISABLE KEYS */;
INSERT INTO `t_sgj_question` VALUES (2,'test','test','2022-12-01 16:52:21','2022-12-01 16:52:21','접수중',NULL,'ezen',NULL),(3,'ff','ff','2022-12-01 17:51:20','2022-12-01 17:51:20','접수중',NULL,'ezen',''),(4,'aa','aa','2022-12-01 17:53:59','2022-12-01 17:53:59','접수중',NULL,'ezen','Y'),(5,'비밀글 확인용','비밀글 확인용','2022-12-01 18:07:22','2022-12-02 16:24:46','접수중',' 답변입니다.','yy',''),(6,'비밀글 확인용2','비밀글 확인용2','2022-12-01 18:07:41','2022-12-01 18:07:41','접수중',NULL,'yy','Y'),(7,'비밀글 입니다.','비밀글 입니다.','2022-12-02 15:38:52','2022-12-02 15:38:52','접수중',NULL,'ezen','Y'),(8,'비밀글 작성','비밀글 작성','2022-12-02 16:21:54','2022-12-02 16:21:54','접수중',NULL,'ezen','Y');
/*!40000 ALTER TABLE `t_sgj_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_question_bak`
--

DROP TABLE IF EXISTS `t_sgj_question_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_question_bak` (
  `QUESTION_NO` int NOT NULL,
  `QUESTION_TITLE` varchar(150) NOT NULL,
  `QUESTION_CONTENT` varchar(1500) NOT NULL,
  `QUESTION_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `QUESTION_STATE` varchar(20) NOT NULL DEFAULT '접수중',
  `QUESTION_ANSWER` varchar(1500) DEFAULT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `QUESTION_SECRET_YN` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_question_bak`
--

LOCK TABLES `t_sgj_question_bak` WRITE;
/*!40000 ALTER TABLE `t_sgj_question_bak` DISABLE KEYS */;
INSERT INTO `t_sgj_question_bak` VALUES (1,'가구는 오프라인에서','보고 사세요','2022-12-01 15:31:33','접수중',NULL,'ezen','N'),(2,'test','test','2022-12-01 16:52:21','접수중',NULL,'ezen',NULL),(3,'ff','ff','2022-12-01 17:51:20','접수중',NULL,'ezen',''),(4,'aa','aa','2022-12-01 17:53:59','접수중',NULL,'ezen','Y'),(5,'비밀글 확인용','비밀글 확인용','2022-12-01 18:07:22','접수중',NULL,'yy',''),(6,'비밀글 확인용2','비밀글 확인용2','2022-12-01 18:07:41','접수중',NULL,'yy','Y');
/*!40000 ALTER TABLE `t_sgj_question_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sgj_user`
--

DROP TABLE IF EXISTS `t_sgj_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sgj_user` (
  `USER_ID` varchar(30) NOT NULL,
  `USER_PW` varchar(45) NOT NULL,
  `USER_NM` varchar(30) NOT NULL,
  `USER_TEL` varchar(20) NOT NULL,
  `USER_EMAIL` varchar(30) NOT NULL,
  `USER_ADDR1` varchar(200) NOT NULL,
  `USER_ADDR2` varchar(200) NOT NULL,
  `USER_TYPE` varchar(5) NOT NULL DEFAULT 'USER',
  `USER_RGST_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_MODF_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_USE_YN` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sgj_user`
--

LOCK TABLES `t_sgj_user` WRITE;
/*!40000 ALTER TABLE `t_sgj_user` DISABLE KEYS */;
INSERT INTO `t_sgj_user` VALUES ('admin','!ezen1234','ADMIN','025326500','reaver75@ezenac.co.kr','서울특별시 서초구 서초대로77길 54','서초더블유타워 13,14층','ADMIN','2022-11-30 03:58:06','2022-11-30 03:58:06','Y'),('ezen','!ezen1234','EZEN','025326500','reaver75@ezenac.co.kr','서울특별시 서초구 서초대로77길 54','서초더블유타워 13,14층','USER','2022-11-30 03:58:55','2022-12-01 17:34:03','Y'),('ezen1','!ezen1234','EZEN1','025326500','reaver75@ezenac.co.kr','서울 서초구 서초대로77길 54','서초더블유타워 13,14층','USER','2022-11-30 19:12:20','2022-12-01 10:44:52','Y'),('test','!ezen1234','test','01033271429','wkdud423@gmail.com','서울 강동구 아리수로 46','1234','USER','2022-12-01 09:46:43','2022-12-01 09:46:43','Y'),('test1','!ezen1234','test1','01033271429','wkdud423@gmail.com','부산 강서구 르노삼성대로 14','1234','USER','2022-12-01 09:48:59','2022-12-01 09:48:59','Y'),('test2','!ezen1234','test2','01033271429','wkdud423@gmail.com','서울 노원구 공릉로 264','1234','USER','2022-12-01 09:52:22','2022-12-01 09:52:22','Y'),('test3','!ezen1234','test3','01033271429','wkdud423@gmail.com','전북 군산시 경암로 6','1233','USER','2022-12-01 10:00:43','2022-12-01 10:00:43','Y'),('test4','!ezen1234','test4','01033271429','wkdud423@gmail.com','경기 가평군 가평읍 가화로 225-3','1234','USER','2022-12-01 10:18:04','2022-12-01 10:18:04','N'),('test5','!ezen1234','test5','01033271429','wkdud423@gmail.com','경기 가평군 가평읍 가화로 225-3','qewqewe','USER','2022-12-01 10:19:54','2022-12-01 10:19:54','N'),('test6','!ezen1234','test6','01033271429','wkdud423@gmail.com','서울 성동구 아차산로 2-1','1407호','USER','2022-12-01 12:48:31','2022-12-02 15:56:37','N'),('yy','!ezen1234','왕왕','01012345678','ezen@gmail.com','부산 해운대구 APEC로 55','주소없음','ADMIN','2022-12-01 18:06:52','2022-12-02 09:42:21','N');
/*!40000 ALTER TABLE `t_sgj_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 17:39:03
