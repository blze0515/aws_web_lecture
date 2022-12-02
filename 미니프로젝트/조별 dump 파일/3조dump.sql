-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 14.63.62.56    Database: kkurly_5
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
-- Table structure for table `t_prod`
--

DROP TABLE IF EXISTS `t_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_prod` (
  `PROD_NO` int NOT NULL,
  `PROD_CgCd` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROD_NM` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROD_PRICE` int DEFAULT NULL,
  `PROD_QTY` int DEFAULT NULL,
  `INPUT_DT` datetime DEFAULT NULL,
  `UPDATE_DT` datetime DEFAULT NULL,
  `PROD_UNIT` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROD_VOL` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USE_YN` varchar(1) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `SALE_Qty` int DEFAULT NULL,
  PRIMARY KEY (`PROD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_prod`
--

LOCK TABLES `t_prod` WRITE;
/*!40000 ALTER TABLE `t_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `USER_ID` varchar(40) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_PW` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_NM` varchar(40) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_MAIL` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_TEL` varchar(13) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `USER_REGDATE` datetime DEFAULT NULL,
  `USER_ROLE` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT 'ROLE_USER',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('aaa','1234','홍길동',NULL,NULL,NULL,'ROLE_USER'),('test','1234','홍길동',NULL,NULL,NULL,'ROLE_USER');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart`
--

DROP TABLE IF EXISTS `tb_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cart` (
  `CART_NO` int NOT NULL,
  `QTY` int NOT NULL,
  `PROD_NO` int NOT NULL,
  `USER_NO` int NOT NULL,
  PRIMARY KEY (`PROD_NO`,`USER_NO`),
  KEY `fk_TB_CART_TB_PROD1_idx` (`PROD_NO`),
  KEY `fk_TB_CART_TB_USER1_idx` (`USER_NO`),
  CONSTRAINT `fk_TB_CART_TB_PROD1` FOREIGN KEY (`PROD_NO`) REFERENCES `tb_prod` (`PROD_NO`),
  CONSTRAINT `fk_TB_CART_TB_USER1` FOREIGN KEY (`USER_NO`) REFERENCES `tb_user` (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart`
--

LOCK TABLES `tb_cart` WRITE;
/*!40000 ALTER TABLE `tb_cart` DISABLE KEYS */;
INSERT INTO `tb_cart` VALUES (4,1,7,6),(3,1,7,15),(1,1,8,2),(14,1,8,6),(4,1,8,13),(4,1,8,15),(2,1,10,2),(12,1,10,6),(1,1,10,13),(1,1,10,15),(10,1,10,16),(7,1,11,6),(11,1,11,16),(3,6,12,6),(1,6,12,8),(4,1,12,16),(8,1,13,6),(2,1,13,8),(6,1,13,16),(2,1,14,16),(12,1,15,16),(6,1,16,6),(3,1,16,8),(5,1,17,13),(3,1,17,16),(11,1,19,6),(3,1,20,2),(1,1,20,14),(13,1,21,6),(2,1,21,13),(2,1,21,15);
/*!40000 ALTER TABLE `tb_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cd`
--

DROP TABLE IF EXISTS `tb_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cd` (
  `CD_NO` int NOT NULL AUTO_INCREMENT,
  `CD` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `P_CD` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CD_NM` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `CD_GROUP` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USE_YN` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`CD_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cd`
--

LOCK TABLES `tb_cd` WRITE;
/*!40000 ALTER TABLE `tb_cd` DISABLE KEYS */;
INSERT INTO `tb_cd` VALUES (1,'VET','T01','채소','PROD','Y'),(2,'MEAT','T01','육류','PROD','Y'),(3,'FRUT','T01','과일','PROD','Y'),(4,'AQUA','T01','수산물','PROD','Y'),(5,'KIT','T01','간편식','PROD','Y'),(6,'DRINK','T01','음료','PROD','Y'),(7,'BEK','T01','베이커리','PROD','Y'),(8,'ALCO','T01','주류','PROD','Y'),(9,'PET','T01','반려동물','PROD','Y'),(10,'VET','T02','채소','PROD','Y'),(11,'MEAT','T02','육류','PROD','Y'),(12,'FRUT','T02','과일','PROD','Y'),(13,'AQUA','T02','수산물','PROD','Y'),(14,'KIT','T02','간편식','PROD','Y'),(15,'DRINK','T02','음료','PROD','Y'),(16,'BEK','T02','베이커리','PROD','Y'),(17,'ALCO','T02','주류','PROD','Y'),(18,'PET','T02','반려동물','PROD','Y'),(19,'VET','T03','채소','PROD','Y'),(20,'MEAT','T03','육류','PROD','Y'),(21,'FRUT','T03','과일','PROD','Y'),(22,'AQUA','T03','수산물','PROD','Y'),(23,'KIT','T03','간편식','PROD','Y'),(24,'DRINK','T03','음료','PROD','Y'),(25,'BEK','T03','베이커리','PROD','Y'),(26,'ALCO','T03','주류','PROD','Y'),(27,'PET','T03','반려동물','PROD','Y'),(28,'R01','','단순변심','RETURN','Y'),(29,'R02','','파손','RETURN','Y'),(30,'R03','','배송오류','RETURN','Y'),(31,'Q01','','배송문의','QNA','Y'),(32,'Q02','','상품문의','QNA','Y'),(33,'Q03','','기타','QNA','Y'),(35,'T01','','상온','TEMP','Y'),(36,'T02','','냉장','TEMP','Y'),(37,'T03','','냉동','TEMP','Y');
/*!40000 ALTER TABLE `tb_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_coupon`
--

DROP TABLE IF EXISTS `tb_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_coupon` (
  `COUPON_NO` int NOT NULL,
  `COUPON_TIME` datetime NOT NULL,
  `COUPON_DCT` int NOT NULL,
  `COUPON_CONTENT` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`COUPON_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_coupon`
--

LOCK TABLES `tb_coupon` WRITE;
/*!40000 ALTER TABLE `tb_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order` (
  `ORDER_NO` int NOT NULL,
  `USER_NO` int NOT NULL,
  `ORDER_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ADR_NO` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RECEIVER_NM` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `RECEIVER_TEL` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PAY_WAY` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ORDER_STATUS` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '주문확인중',
  `TOTAL_PRICE` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ORDER_NO`),
  KEY `fk_TB_ORDER_TB_USER1_idx` (`USER_NO`),
  CONSTRAINT `fk_TB_ORDER_TB_USER1` FOREIGN KEY (`USER_NO`) REFERENCES `tb_user` (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
INSERT INTO `tb_order` VALUES (1,16,'2022-12-02 14:13:52','서울특별시 서초구 서초대로77길 54 서초더블유타워 13층','샘','01001233219','무통장입금','배송 준비','74820'),(2,13,'2022-12-02 14:17:53','서울 종로구 경교장길 8 123456','생일테스트','01000000000','무통장입금','배송 준비','79250'),(3,14,'2022-12-02 15:23:21','서울 송파구 올림픽로 240 롯데월드','운영자','01000000000','무통장입금','배송 준비','0');
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_detail`
--

DROP TABLE IF EXISTS `tb_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order_detail` (
  `ORDER_NO` int NOT NULL,
  `ORDER_D_NO` int NOT NULL,
  `PROD_NO` int NOT NULL,
  `PROD_QTY` int NOT NULL,
  `COUPON_NO` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '적용안됨',
  `TOTAL_PRICE` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`ORDER_NO`,`ORDER_D_NO`),
  KEY `fk_TB_ORDER_DETAIL_TB_ORDER1_idx` (`ORDER_NO`),
  KEY `fk_TB_ORDER_DETAIL_TB_PROD1_idx` (`PROD_NO`),
  CONSTRAINT `fk_TB_ORDER_DETAIL_TB_ORDER1` FOREIGN KEY (`ORDER_NO`) REFERENCES `tb_order` (`ORDER_NO`),
  CONSTRAINT `fk_TB_ORDER_DETAIL_TB_PROD1` FOREIGN KEY (`PROD_NO`) REFERENCES `tb_prod` (`PROD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_detail`
--

LOCK TABLES `tb_order_detail` WRITE;
/*!40000 ALTER TABLE `tb_order_detail` DISABLE KEYS */;
INSERT INTO `tb_order_detail` VALUES (1,1,11,1,'1','4500'),(1,2,12,1,'1','1320'),(1,3,13,1,'1','7800'),(1,4,17,1,'1','32000'),(1,5,10,1,'1','6200'),(1,6,14,1,'1','12000'),(1,7,15,1,'1','11000'),(2,1,8,1,'1','40000'),(2,2,17,1,'1','32000'),(2,3,10,1,'1','6200'),(2,4,21,1,'1','1050');
/*!40000 ALTER TABLE `tb_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prod`
--

DROP TABLE IF EXISTS `tb_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_prod` (
  `PROD_NO` int NOT NULL,
  `PROD_CG_CD` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROD_NM` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROD_PRICE` int NOT NULL,
  `PROD_QTY` int NOT NULL,
  `PROD_UNIT` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `PROD_VOL` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INPUT_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SALE_QTY` int NOT NULL,
  `USE_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `PROD_IMG_NM` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `PROD_IMG_PATH` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PROD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prod`
--

LOCK TABLES `tb_prod` WRITE;
/*!40000 ALTER TABLE `tb_prod` DISABLE KEYS */;
INSERT INTO `tb_prod` VALUES (7,'T02VET','구운고구마',5000,10,'개','500g','2022-11-29 18:21:02','2022-11-29 18:21:02',0,'Y','20221129182116_c9242ef3-08f0-4eee-8ecb-40ceecdfffe9_고구마.jpg','C:\\Users\\영롱\\OneDrive\\바탕 화면\\SpringFrameWork\\market\\Kkurly\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kkurly\\/upload/'),(8,'T03ALCO','냉장고구마',40000,50,'개','800g','2022-11-30 15:10:25','2022-11-30 15:10:25',0,'Y','20221130151042_d9df497a-8549-4739-a112-75d9e38b731b_고구마.jpg','C:\\Users\\영롱\\OneDrive\\바탕 화면\\SpringFrameWork\\market\\Kkurly\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kkurly\\/upload/'),(9,'T01VET','가격테스',65000,12,'개','200g','2022-11-30 18:54:48','2022-11-30 18:54:48',0,'Y',NULL,NULL),(10,'T01ALCO','[껄리] 육개장 밀키트 1인분 650g',6200,300,'봉','650g','2022-12-01 01:52:10','2022-12-01 01:52:10',0,'Y','img-prod01.png','/images/'),(11,'T02ALCO','[자바] 바나나 참 맛있는데 어떻게 설명할 수가 없네',4500,500,'단','500g','2022-12-01 05:11:12','2022-12-01 05:11:12',0,'Y','img-prod02.png','/images/'),(12,'T02ALCO','우유',1320,10,'개','1kg','2022-12-01 05:12:08','2022-12-01 05:12:08',0,'Y','img-prod03.png','/images/'),(13,'T02ALCO','아이스크림',7800,20,'개','350g','2022-12-01 05:12:43','2022-12-01 05:12:43',0,'Y','img-prod04.png','/images/'),(14,'T01ALCO','무농약 해바라기씨',12000,10,'개','500g','2022-12-01 05:13:46','2022-12-01 05:13:46',0,'Y','img-prod05.png','/images/'),(15,'T01ALCO','맛있겠다 갈비 먹고싶다',11000,10,'개','650g','2022-12-01 05:14:20','2022-12-01 05:14:20',0,'Y','img-prod06.png','/images/'),(16,'T02ALCO','이것도 맛있겠다 닭갈비 나도 좋아하는데',10500,200,'개','650g','2022-12-01 05:15:01','2022-12-01 05:15:01',0,'Y','img-prod07.png','/images/'),(17,'T03ALCO','한우 추리 모둠',32000,20,'개','150g','2022-12-01 05:15:45','2022-12-01 05:15:45',0,'Y','img-prod10.png','/images/'),(18,'T02FRUT','과일',5000,10,'개','50g','2022-12-01 09:35:10','2022-12-01 09:35:10',0,'Y','20221201093530_1a4e2f06-4353-4545-99fb-5cab1daa0745_떡볶이.jpg','C:\\Users\\영롱\\OneDrive\\바탕 화면\\SpringFrameWork\\market\\Kkurly\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kkurly\\/upload/'),(19,'T03MEAT','푸시테스트',5000,4000,'캔','500g','2022-12-01 14:35:43','2022-12-01 14:35:43',0,'Y','20221201143603_3754c28e-5def-4a51-b32e-9b9841c83f41_image01.png','C:\\Users\\영롱\\OneDrive\\바탕 화면\\SpringFrameWork\\project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kkurly\\/upload/'),(20,'T02MEAT','귤',40000,40,'캔','50g','2022-12-01 16:04:32','2022-12-01 16:04:32',0,'Y','20221201160429_c3ec1aca-400e-457f-afdc-de5005433fe6_KKURLY_LOGO2.png','D:\\aws220726\\Kkurly\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kkurly\\/upload/'),(21,'T01MEAT','썩어문드러진 소고기 스테이크',1050,1000000000,'봉','50kg','2022-12-02 12:18:00','2022-12-02 12:18:00',0,'Y','20221202121800_b2060471-962a-410d-bf27-9cf254260143_떡볶이.jpg','C:\\Users\\영롱\\OneDrive\\바탕 화면\\SpringFrameWork\\project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Kkurly\\/upload/');
/*!40000 ALTER TABLE `tb_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prod_images`
--

DROP TABLE IF EXISTS `tb_prod_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_prod_images` (
  `PROD_NO` int NOT NULL,
  `PROD_IMG_NO` int NOT NULL,
  `PROD_IMG_NM` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `INPUT_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USE_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `MAIN_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `IMG_SIZE` int NOT NULL,
  PRIMARY KEY (`PROD_NO`,`PROD_IMG_NO`),
  KEY `fk_TB_PROD_IMAGES_TB_PROD1_idx` (`PROD_NO`),
  CONSTRAINT `fk_TB_PROD_IMAGES_TB_PROD1` FOREIGN KEY (`PROD_NO`) REFERENCES `tb_prod` (`PROD_NO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prod_images`
--

LOCK TABLES `tb_prod_images` WRITE;
/*!40000 ALTER TABLE `tb_prod_images` DISABLE KEYS */;
INSERT INTO `tb_prod_images` VALUES (10,1,'20221201015210_02d28246-c1f4-41cf-92e6-ed4a7ef4f4bd_img-prod01.png','2022-12-01 01:52:10','Y','Y',200),(11,1,'20221201051113_0ea50876-75d5-43c2-a7d5-da50850e64d2_img-prod02.png','2022-12-01 05:11:12','Y','Y',200);
/*!40000 ALTER TABLE `tb_prod_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prod_rv`
--

DROP TABLE IF EXISTS `tb_prod_rv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_prod_rv` (
  `RV_NO` int NOT NULL,
  `PROD_NO` int NOT NULL,
  `USER_NO` int NOT NULL,
  `ORDER_NO` int NOT NULL,
  `RV_CONTENT` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `INPUT_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DT` datetime NOT NULL,
  PRIMARY KEY (`RV_NO`,`PROD_NO`),
  KEY `fk_TB_PROD_RV_TB_PROD1_idx` (`PROD_NO`),
  KEY `fk_TB_PROD_RV_TB_ORDER1_idx` (`ORDER_NO`),
  KEY `fk_TB_PROD_RV_TB_USER1_idx` (`USER_NO`),
  CONSTRAINT `fk_TB_PROD_RV_TB_ORDER1` FOREIGN KEY (`ORDER_NO`) REFERENCES `tb_order` (`ORDER_NO`),
  CONSTRAINT `fk_TB_PROD_RV_TB_PROD1` FOREIGN KEY (`PROD_NO`) REFERENCES `tb_prod` (`PROD_NO`),
  CONSTRAINT `fk_TB_PROD_RV_TB_USER1` FOREIGN KEY (`USER_NO`) REFERENCES `tb_user` (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prod_rv`
--

LOCK TABLES `tb_prod_rv` WRITE;
/*!40000 ALTER TABLE `tb_prod_rv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_prod_rv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_qa`
--

DROP TABLE IF EXISTS `tb_qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_qa` (
  `QA_NO` int NOT NULL,
  `ORDER_NO` int NOT NULL,
  `PROD_NO` int NOT NULL,
  `USER_NO` int NOT NULL,
  `QA_CD` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `QA_CONTENT` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `QA_ANS_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `INPUT_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DT` datetime NOT NULL,
  PRIMARY KEY (`QA_NO`),
  KEY `fk_TB_QA_TB_ORDER1_idx` (`ORDER_NO`),
  KEY `fk_TB_QA_TB_PROD1_idx` (`PROD_NO`),
  KEY `fk_TB_QA_TB_USER1_idx` (`USER_NO`),
  CONSTRAINT `fk_TB_QA_TB_ORDER1` FOREIGN KEY (`ORDER_NO`) REFERENCES `tb_order` (`ORDER_NO`),
  CONSTRAINT `fk_TB_QA_TB_PROD1` FOREIGN KEY (`PROD_NO`) REFERENCES `tb_prod` (`PROD_NO`),
  CONSTRAINT `fk_TB_QA_TB_USER1` FOREIGN KEY (`USER_NO`) REFERENCES `tb_user` (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_qa`
--

LOCK TABLES `tb_qa` WRITE;
/*!40000 ALTER TABLE `tb_qa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_qa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_qa_ans`
--

DROP TABLE IF EXISTS `tb_qa_ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_qa_ans` (
  `QA_ANS_NO` int NOT NULL,
  `QA_NO` int NOT NULL,
  `QA_ANS_CONTENT` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `INPUT_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DT` datetime NOT NULL,
  `QA_CD` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`QA_ANS_NO`,`QA_NO`),
  KEY `fk_TB_QA_ANS_TB_QA1_idx` (`QA_NO`),
  CONSTRAINT `fk_TB_QA_ANS_TB_QA1` FOREIGN KEY (`QA_NO`) REFERENCES `tb_qa` (`QA_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_qa_ans`
--

LOCK TABLES `tb_qa_ans` WRITE;
/*!40000 ALTER TABLE `tb_qa_ans` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_qa_ans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_return`
--

DROP TABLE IF EXISTS `tb_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_return` (
  `ORDER_NO` int NOT NULL,
  `REASON_CD` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RETURN_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `RETURN_WAY` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `RETURN_PRICE` int NOT NULL,
  `RETURN_DT` datetime DEFAULT NULL,
  `INPUT_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ORDER_NO`),
  CONSTRAINT `fk_TB_RETURN_TB_ORDER1` FOREIGN KEY (`ORDER_NO`) REFERENCES `tb_order` (`ORDER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_return`
--

LOCK TABLES `tb_return` WRITE;
/*!40000 ALTER TABLE `tb_return` DISABLE KEYS */;
INSERT INTO `tb_return` VALUES (0,'단순변심','Y','신용카드',36000,'2022-12-01 10:41:53','2022-12-01 10:41:53');
/*!40000 ALTER TABLE `tb_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `USER_NO` int NOT NULL,
  `USER_ID` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_PW` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_NM` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_TEL` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_EMAIL` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USER_BD` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `INPUT_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USE_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `USER_NICK` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT 'NON',
  PRIMARY KEY (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'수정했습니다','1234','update다 이ㅆ','00000000000','1231etest@retest.com',NULL,'2022-11-28 15:01:46','N','r123eNON'),(2,'aa','1234','aa','00000000000','test@test.com',NULL,'2022-11-28 16:34:17','N','NON'),(3,'bb','1234','bb','00000000000','test@test.com',NULL,'2022-11-28 16:45:56','N','NON'),(4,'cc','1234','회원정보의저주','00000000000','test@test.com',NULL,'2022-11-28 16:46:27','N','NON'),(5,'dd','1234','dd','00000000000','test@test.com',NULL,'2022-11-28 16:46:48','N','NON'),(6,'ee','1234','발표끝','01000000000','hong@test.com',NULL,'2022-12-01 09:21:17','N','NON'),(8,'test','1234','테스트','01000000000','hong@test.com',NULL,'2022-12-01 14:27:15','N','NON'),(9,'test2','1234','생일테스트','01000000000','hong@test.com',NULL,'2022-12-01 14:32:41','N','NON'),(10,'test3','1234','생일테스트2','01000000000','hong@test.com',NULL,'2022-12-01 14:34:02','N','NON'),(11,'test4','1234','생일테스트','01000000000','g@test.com',NULL,'2022-12-01 14:36:28','N','NON'),(12,'test5','1234','생일테스트','01000000000','g@test.com',NULL,'2022-12-01 14:40:25','N','NON'),(13,'test6','1234','생일테스트','01000000000','hong@test.com','19900912','2022-12-01 14:41:44','N','NON'),(14,'system','sys123','운영자','01000000000','system@system.com','20021201','2022-12-01 16:20:04','N','NON'),(15,'test7','1234','회원가입정신차려','01012341234','1231etest@retest.com',NULL,'2022-12-01 16:25:53','N','NON'),(16,'hh','1234','샘','01001233219','hh@naver.net',NULL,'2022-12-02 09:30:56','N','NON');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_adr`
--

DROP TABLE IF EXISTS `tb_user_adr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_adr` (
  `USER_NO` int NOT NULL,
  `ADR_NO` int NOT NULL,
  `ADR` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `MAIN_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `USE_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER_NO`,`ADR_NO`),
  KEY `fk_TB_USER_ADR_TB_USER_idx` (`USER_NO`),
  CONSTRAINT `fk_TB_USER_ADR_TB_USER` FOREIGN KEY (`USER_NO`) REFERENCES `tb_user` (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_adr`
--

LOCK TABLES `tb_user_adr` WRITE;
/*!40000 ALTER TABLE `tb_user_adr` DISABLE KEYS */;
INSERT INTO `tb_user_adr` VALUES (6,1,'서울 서초구 강남대로 48-8 11','Y','Y'),(9,2,'서울 동대문구 안암로 20 123456789','Y','Y'),(10,3,'서울 서초구 안골길 4 123546789','Y','Y'),(11,4,'서울 성동구 아차산로 2-1 12345678','Y','Y'),(12,5,'인천 서구 칠천왕로 9 123456','Y','Y'),(13,6,'서울 종로구 경교장길 8 123456','Y','Y'),(14,7,'서울 송파구 올림픽로 240 롯데월드','Y','Y'),(15,8,'null 123456','Y','Y'),(16,9,'서울특별시 서초구 서초대로77길 54 서초더블유타워 13층','Y','Y');
/*!40000 ALTER TABLE `tb_user_adr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_coupon`
--

DROP TABLE IF EXISTS `tb_user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_coupon` (
  `COUPON_NO` int NOT NULL,
  `USER_NO` int NOT NULL,
  `ISSUE_DT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USE_DT` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `USE_YN` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`COUPON_NO`,`USER_NO`),
  KEY `fk_TB_USER_COUPON_TB_USER1_idx` (`USER_NO`),
  CONSTRAINT `fk_TB_USER_COUPON_TB_COUPON1` FOREIGN KEY (`COUPON_NO`) REFERENCES `tb_coupon` (`COUPON_NO`),
  CONSTRAINT `fk_TB_USER_COUPON_TB_USER1` FOREIGN KEY (`USER_NO`) REFERENCES `tb_user` (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_coupon`
--

LOCK TABLES `tb_user_coupon` WRITE;
/*!40000 ALTER TABLE `tb_user_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_like`
--

DROP TABLE IF EXISTS `tb_user_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_like` (
  `USER_NO` int NOT NULL,
  `PROD_NO` int NOT NULL,
  PRIMARY KEY (`USER_NO`,`PROD_NO`),
  KEY `fk_TB_USER_LIKE_TB_USER1_idx` (`USER_NO`),
  KEY `fk_TB_USER_LIKE_TB_PROD1_idx` (`PROD_NO`),
  CONSTRAINT `fk_TB_USER_LIKE_TB_PROD1` FOREIGN KEY (`PROD_NO`) REFERENCES `tb_prod` (`PROD_NO`),
  CONSTRAINT `fk_TB_USER_LIKE_TB_USER1` FOREIGN KEY (`USER_NO`) REFERENCES `tb_user` (`USER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_like`
--

LOCK TABLES `tb_user_like` WRITE;
/*!40000 ALTER TABLE `tb_user_like` DISABLE KEYS */;
INSERT INTO `tb_user_like` VALUES (2,8),(2,10),(4,8),(4,9),(6,7),(6,8);
/*!40000 ALTER TABLE `tb_user_like` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 17:38:14
