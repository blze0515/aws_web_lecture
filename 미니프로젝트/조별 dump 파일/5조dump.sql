-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 14.63.62.56    Database: ezen3
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
-- Table structure for table `al_cmnt_like`
--

DROP TABLE IF EXISTS `al_cmnt_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_cmnt_like` (
  `CMNT_CODE` int NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`CMNT_CODE`,`USER_ID`),
  CONSTRAINT `fk_AL_CMNT_LIKE_AL_COMMUNITY1` FOREIGN KEY (`CMNT_CODE`) REFERENCES `al_community` (`CMNT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_cmnt_like`
--

LOCK TABLES `al_cmnt_like` WRITE;
/*!40000 ALTER TABLE `al_cmnt_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `al_cmnt_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `al_community`
--

DROP TABLE IF EXISTS `al_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_community` (
  `CMNT_CODE` int NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `USER_NICKNAME` varchar(30) NOT NULL,
  `CMNT_TITLE` varchar(100) NOT NULL,
  `CMNT_CONTENTS` varchar(3000) NOT NULL,
  `CMNT_ORI_IMG` varchar(300) DEFAULT NULL,
  `CMNT_NOW_IMG` varchar(300) DEFAULT NULL,
  `CMNT_REGDATE` datetime NOT NULL,
  `CMNT_MODFDATE` datetime NOT NULL,
  `CMNT_DEL_YN` char(1) NOT NULL DEFAULT 'N',
  `CMNT_CNT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CMNT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_community`
--

LOCK TABLES `al_community` WRITE;
/*!40000 ALTER TABLE `al_community` DISABLE KEYS */;
INSERT INTO `al_community` VALUES (1,'zxcqwe123','말썽쟁이','게임처럼 공부하는 git 던전','입문자를 위해 준비한\r\n[개발 도구] 강의입니다.\r\n개발을 시작하기 전에 개발을 할 때 반드시 해야하는 협업도구를 다루는 법을 배울 수 있습니다. 처음부터 끝까지 듣는 것 보다는 내가 모르는 개념이나 필요한 부분만 골라 들으시면 좋겠습니다\r\n이런 분들께 추천해요\r\ngit을 제대로 배우고, 실무에서 잘 쓰고 싶은 분\r\ngit을 쓸 줄 안다고 생각했는데, 협업할 때의 이용이 어려운 분\r\n머지할 때 컨플릭트가 왜 발생하는지 모르는 분\r\n가볍고 재미있게 들을 수 있는 git 입문 강의를 찾는 분','lctr0901.png','20221201203322_4b5ffdee-78b9-4e5b-ad30-5f49bda89d48_lctr0901.png','2022-12-01 20:33:21','2022-12-01 20:33:21','N',23),(2,'hyeji1004','혜징징','고기천쌤 고기 취향이 어떻게 되는지 아시는 분?','저는 돼지고기가조은데여\r\n알수가없네요',NULL,NULL,'2022-12-01 20:33:44','2022-12-01 20:33:44','N',17),(3,'zxc123qwe','막둥이','풀스택 프로그래머로 살아가기','너무나 힘들어요',NULL,NULL,'2022-12-01 20:36:25','2022-12-01 20:36:25','N',10),(4,'zxc123qwe','막둥이','다들 무슨 공부하시나요','언제 공부해서 취업하지...',NULL,NULL,'2022-12-01 20:37:57','2022-12-01 20:37:57','N',9),(5,'zxcqwe123','말썽쟁이','고기천 강사님 자바 수업 교재 품절이던데.. ','고기천 강사님이 만드신 자바 교재는 품절되서 다른 거 사려하는데.. 수업듣는데 지장없겠죠? 강사님 수업시간에 책 많이 보시나요 ?\r\n예제 문제는 따로 피피티로 올려주신다고 듣긴했는데..',NULL,NULL,'2022-12-01 20:42:41','2022-12-01 20:42:41','N',10),(6,'zxc321qwe','어무니','어떻게 해야 개발자로 성공이 가능할까요...','개발자는 개발시간을 단축하는 자가 성공합니다.\r\n\r\n남들이 6개월 걸리는 일을 1개월에 끝내는 자는\r\n\r\n성공율이 6배 더 유리합니다.\r\n\r\n1주일에 끝내는 자는 24배 더 유리합니다.\r\n\r\n1일에 끝내는 자는 168배 더 유리합니다.\r\n\r\n1시간에 끝내는 자는 4032배 더 유리합니다.',NULL,NULL,'2022-12-01 23:47:49','2022-12-01 23:47:49','N',9),(7,'zxcqwe321','아부지','개발자로 성공하는 방법','현재 한국 소프트웨어 분야에서, 그중에서도 SI 분야에서 취직을 하려면 자바, 그중에서도 자바 스프링이라는 프레임워크를 배우는 것이 중요해요. 왜 그럴까요? 왜냐하면 한국 SI 분야는 국가가 발주하는 전자정부와 관련된 프로젝트가 많거든요. 그 전자전부 프로젝트가 자바 스프링이라는 프레임워크로 되어 있어요. 정부가 제시하는  프로토콜과 발을 맞추려고 기업 프로젝트도 자바 스프링을 도입하는 경우가 많구요. 그래서 자바 스프링의 핵심 아키텍쳐를 수정하고 오류를 보수할 줄 알면 우대받아요. 이건 상대적인 비교에요. 우대 받는다고 해서 바로 억대연봉이 되는 것은 아니구요. 상대적으로 취업이 더 잘되고 연봉이 좀 더 높습니다.',NULL,NULL,'2022-12-01 23:50:41','2022-12-01 23:50:41','N',10),(8,'hyeji1004','혜징징','DB 설계한거 봐주세요','이번 미니 프로젝트 ERD 첨부합니다..!\r\n\r\n프로젝트 하는 것도 복잡하고..\r\n\r\n처음 맡아보는 조장이라 솔직히 부담도 많이 됐어요 ㅠㅠ\r\n\r\n이것저것 다 넣고 싶었지만 기간이 너무 짧아서 아쉽기도 한데..\r\n\r\n그래도 함께 노력해서 결과가 나오니 기분이 너무 좋네요!!\r\n\r\n다들 너무너무 고생하셨어요 ㅎㅎ\r\n\r\n신나라 김수진 이래중 짱!!!\r\n\r\n부족한 조장 돌봐주느라 고생 많으셨어요 ㅠㅠㅠㅠ\r\n\r\n우리 기천쌤!! 선생님도 항상 너무너무 감사드려요!!!\r\n\r\n수료할 때까지 모두 힘내서 성공취업 합시다!!! 화이팅!!','TABLE.png','20221202010943_a7b9d4b8-8baa-456c-9faf-91a39ef88671_TABLE.png','2022-12-02 01:09:43','2022-12-02 02:14:41','N',13),(9,'ezen1201','감자','비전공자도 개발자 쌉가능?','어 가능',NULL,NULL,'2022-12-02 01:50:17','2022-12-02 01:50:54','N',7),(10,'ezen1201','감자','개발자 공부 너무 어려워요 ㅠㅠㅠ','어 나두',NULL,NULL,'2022-12-02 01:51:31','2022-12-02 01:51:31','N',9),(11,'HJ','혜지','TEST11','TEST11 본문',NULL,NULL,'2022-12-02 08:51:52','2022-12-02 08:51:52','N',1),(12,'hyeji1004','혜징징','안녕하세요!!','파일 테스트입니다.','Logo_AcLearn_최종(2).png','20221202133413_435bdddd-7e10-44a5-bac1-26db714cc6a0_Logo_AcLearn_최종(2).png','2022-12-02 13:34:12','2022-12-02 13:34:12','N',5);
/*!40000 ALTER TABLE `al_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `al_lctr`
--

DROP TABLE IF EXISTS `al_lctr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_lctr` (
  `LCTR_CODE` int NOT NULL,
  `LCTR_TITLE` varchar(100) NOT NULL,
  `LCTR_DETAILS` varchar(3000) NOT NULL,
  `LCTR_CNT` int NOT NULL DEFAULT '0',
  `LCTR_LIKE` int NOT NULL DEFAULT '0',
  `LCTR_VIDEO_LINK` varchar(1000) DEFAULT NULL,
  `LCTR_ORI_IMG_1` varchar(300) DEFAULT NULL,
  `LCTR_NOW_IMG_1` varchar(300) DEFAULT NULL,
  `LCTR_ORI_IMG_2` varchar(300) DEFAULT NULL,
  `LCTR_NOW_IMG_2` varchar(300) DEFAULT NULL,
  `LCTR_USE_YN` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`LCTR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_lctr`
--

LOCK TABLES `al_lctr` WRITE;
/*!40000 ALTER TABLE `al_lctr` DISABLE KEYS */;
INSERT INTO `al_lctr` VALUES (1,'개발하는 정대리 스위프트 기초 문법','비전공자로 프로그래밍을 시작했기에 누구보다 비전공자분들의 고충을 잘 헤아리고 있습니다.\n누구나 쉽게 이해할 수 있도록 이 강의에서는 개발 관련 전문 용어를 사용하지 않습니다.\n초심자여도 걱정 마세요! 이해를 바탕으로 스스로 개발을 해나갈 수 있도록 여러분을 도와드리겠습니다.\n이 강의는 초등학생도 쉽게 이해할 수 있는 강의를 목표로 제작되었습니다.',36,4,'9meMArDr-1E','lctr0101.png',NULL,'lctr0102.png',NULL,'Y'),(2,'[리뉴얼] 렛츠기릿 자바스크립트','자바스크립트는 컴퓨터에 명령할 때 사용하는 언어 중 하나입니다. \n과거에는 웹 사이트를 만드는 데에만 국한되었다면, 현재는 웹 앱, Desktop 프로그램을 만드는 데에도 활용되고 있습니다. \n뿐만 아니라 인스타그램과 페이스북 등의 앱 일부를 만드는 데에도 활용되고 있죠. \n본 강의에서는 자바스크립트를 활용해 프로그래밍 사고력을 기르는 연습을 합니다.\n웹 게임인 구구단을 시작으로 끝말잇기, 숫자 야구, 반응 속도 테스트, 틱택토, 로또 추첨기, 가위바위보, 카드 짝맞추기 게임, 텍스트 RPG, 지뢰 찾기, 2048게임, 두더지 잡기까지 함께 만들어 봅시다.',58,4,'ft8liaWP8F0','lctr0201.png',NULL,'lctr0202.jpg',NULL,'Y'),(3,'생활코딩 - 자바스크립트(JavaScript) 기본','생활코딩의 자바스크립트 언어 기본 강좌 입니다. 자바스크립트 (Javascript) 는 웹브라우저 위에서 동작하는 언어입니다. 웹 프로그래밍을 하려 하신다면 자바스크립트는 필수라고 할수 있죠. 과거의 자바스크립트는 웹브라우저 사에서 약간의 움직임을 주는 선에서 사용되어 왔지만 현재는 구글맵 같은 대규모 프로그램부터 서버측 제어까지 전방위에서 사용되어지는 언어입니다. 본 자바스크립트 강좌는 자바스크립트 언어의 기본문법과 사용법, 함수, 객체 등의 개념들을 학습하여 다른 자바스크립트 라이브러리를 잘 활용할 수 있도록 기초를 쌓는 과정입니다.',28,2,'PZIPsKgWJiw','lctr0301.png',NULL,'lctr0302.gif',NULL,'Y'),(4,'생애최초 웹프레임워크 Ruby on Rails','웹 프레임워크의 개념에 대해서 배우고, MVC 디자인패턴에 대해 학습합니다.\nRuby 언어 기반의 웹 프레임워크 Ruby on Rails를 이용하여 CRUD 게시판을 제작합니다.\n그리고 Rails만의 특별한 기능인 Scaffolding을 사용하여 빠르게 CRUD 서비스를 완성해봅니다.\n정말 기초적인 내용만을 아셔도 충분합니다.\n기초를 벗어난 부분은 이론 설명을 첨부할 예정입니다.\nRuby on Rails, MVC 패턴, 웹 프레임워크의 정의와 동작 방법을 배웁니다.',13,2,'PSvPyIcGdlM','lctr0401.jpg',NULL,'lctr0402.jpg',NULL,'Y'),(5,'따라하며 배우는 노드, 리액트 시리즈','이 강의에서는 리액트와 노드를 이용하고 Google API를 이용해서 \n챗봇 어플리케이션을 만들어봅니다.\nGoogle에서 제공하는 API  Dialogflow를 이용하는 법을 집중적으로 배우게 됩니다.\n이 과정 가운데 Dialogflow 뿐만 아니라 Google에서 제공하는 많은 API를 어떻게 사용해야 하는지 기본 방법도 배울 수 있습니다.\n리액트와 노드의 인기는 해가 지나갈수록 점점 높아지고 있기 때문에 \n배워 두신다면 자신의 커리어 향상에 많은 도움을 줄 수 있습니다.\nQ. 노드, 리액트를 배우면 어떤 일을 할 수 있나요?\n웹 개발자, 서버 개발자, 프론트엔드 개발자로서 일을 할 수 있습니다.',6,3,'f6WhpTNtcmE','lctr0501.png',NULL,'lctr0502.png',NULL,'Y'),(6,'[데브원영] 아파치 카프카 for beginners','포춘 100대 기업 80개 이상의 회사에서 사용하고 있는 아파치 카프카는 빅데이터 시대의 서비스를 지탱하는 훌륭한 오픈소스로 자리잡았습니다. 분산 스트리밍 플랫폼으로 운영되는 아파치 카프카는 빅데이터 플랫폼뿐만 아니라 MSA(Microservice Architecture) 구조의 백엔드 아키텍처에서도 중요한 역할을 하고 있습니다.',5,1,'lEOV4upTJ68','lctr0601.png',NULL,'lctr0602.jpg',NULL,'Y'),(7,'클라우드 서비스 AWS','클라우드 서비스인 AWS(Amazon Web Services)의 기본적인 사용법을 다루고 있는 수업입니다. 이 수업에서는 아래와 같은 내용을 배웁니다.\n어떤 서비스가 있는지를 파악하는 방법을 살펴보고, 윈도우 컴퓨터를 임대하기 위해서 필요한 서비스인 EC2를 살펴봅니다.\n회원가입 방법 & 요금을 확인하는 방법\n아마존 웹 서비스는 아이디/비밀번호와 함께 일회용 비밀번호(OTP)를 사용하도록 권장하고 있습니다. 이렇게 두가지 인증방법을 사용하는 것을 Multi-factor Authentication(MFA)라고 합니다. 이것을 통해서 계정을 안전하게 지키는 방법을 살펴봅니다.',4,1,'YmHgw4RY-74','lctr0701.png',NULL,'lctr0702.png',NULL,'Y'),(8,'CSS 기본부터 활용까지','본 CSS 기본부터 활용까지 강좌는 생활코딩 이고잉님의 CSS 강좌 입니다.HTML의 기본적인 이해가 있다는 전제하에 CSS 기본부터 최근 기술들까지 차근차근 이해하기 쉽게 설명해 줍니다. 기본 개념후에 바로 작은 예제들을 통해 잘 이해할 수 있도록 도와줍니다.\nCSS 는  HTML 문서를 꾸며주는 언어입니다. 단순하게 색만 입히는 것이 아니라 위치, 모양, 속성 등을 통해 시각적으로 이해하기 쉽고 아름다운 정보를 만들어 주는 중요한 언어입니다.',7,2,'ONcmkf07EuI','lctr0801.jpg',NULL,'lctr0802.gif',NULL,'Y'),(9,'JPA & Spring Data JPA 기초','개발을 시작하기 전에 개발을 할 때 반드시 해야하는 협업도구를 다루는 법을 배울 수 있습니다. 처음부터 끝까지 듣는 것 보다는 내가 모르는 개념이나 필요한 부분만 골라 들으시면 좋겠습니다\n이런 분들께 추천해요\ngit을 제대로 배우고, 실무에서 잘 쓰고 싶은 분\ngit을 쓸 줄 안다고 생각했는데, 협업할 때의 이용이 어려운 분\n머지할 때 컨플릭트가 왜 발생하는지 모르는 분\n가볍고 재미있게 들을 수 있는 git 입문 강의를 찾는 분',6,1,'Zwq2McbFOn4','lctr0901.png',NULL,'lctr0902.png',NULL,'Y'),(10,'생활코딩 - 정규표현식','생활코딩의 콘텐츠를 원저작자의 협의를 통해 수강이 편하도록 옮긴 강좌입니다. 생활코딩 http://opentutorials.org 에 감사의 뜻을 전합니다. ',5,2,'V_ePeBaQzSc','lctr1001.png',NULL,'lctr1002.png',NULL,'Y');
/*!40000 ALTER TABLE `al_lctr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `al_lctr_like`
--

DROP TABLE IF EXISTS `al_lctr_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_lctr_like` (
  `LCTR_CODE` int NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  PRIMARY KEY (`LCTR_CODE`,`USER_ID`),
  CONSTRAINT `fk_AL_LCTR_LIKE_AL_LCTR1` FOREIGN KEY (`LCTR_CODE`) REFERENCES `al_lctr` (`LCTR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_lctr_like`
--

LOCK TABLES `al_lctr_like` WRITE;
/*!40000 ALTER TABLE `al_lctr_like` DISABLE KEYS */;
INSERT INTO `al_lctr_like` VALUES (1,'ezen1201'),(1,'hyeji1004'),(1,'tnwls1234'),(1,'zxcqwe123'),(2,'ezen1201'),(2,'hyeji1004'),(2,'tnwls1234'),(2,'zxcqwe123'),(3,'ezen1201'),(3,'tnwls1234'),(4,'ezen1201'),(4,'hyeji1004'),(5,'ezen1201'),(5,'hyeji1004'),(5,'zxcqwe123'),(6,'ezen1201'),(7,'ezen1201'),(8,'ezen1201'),(8,'hyeji1004'),(9,'ezen1201'),(10,'ezen1201'),(10,'hyeji1004');
/*!40000 ALTER TABLE `al_lctr_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `al_reply`
--

DROP TABLE IF EXISTS `al_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_reply` (
  `RP_CODE` int NOT NULL,
  `CMNT_CODE` int NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `USER_NICKNAME` varchar(30) NOT NULL,
  `RP_CONTENTS` varchar(1000) NOT NULL,
  `RP_REGDATE` datetime NOT NULL,
  `RP_MODFDATE` datetime NOT NULL,
  `RP_DEL_YN` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`RP_CODE`,`CMNT_CODE`),
  KEY `fk_AL_REPLY_AL_COMMUNITY1_idx` (`CMNT_CODE`),
  CONSTRAINT `fk_AL_REPLY_AL_COMMUNITY1` FOREIGN KEY (`CMNT_CODE`) REFERENCES `al_community` (`CMNT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_reply`
--

LOCK TABLES `al_reply` WRITE;
/*!40000 ALTER TABLE `al_reply` DISABLE KEYS */;
INSERT INTO `al_reply` VALUES (1,1,'hyeji1004','혜징징','오 좋은 강의 추천 감사합니다!!\r\n한번 들어볼게요~~!','2022-12-01 20:34:13','2022-12-01 20:34:13','N'),(2,4,'zxcqwe123','말썽쟁이','리엑트를 배우고 싶어요...','2022-12-01 20:40:53','2022-12-01 20:40:53','N'),(3,2,'zxc321qwe','어무니','돼지고기 짱짱!','2022-12-01 23:48:25','2022-12-01 23:48:25','N'),(4,5,'zxc321qwe','어무니','다른 책 추천해드릴까요?!','2022-12-01 23:48:51','2022-12-01 23:48:51','N'),(5,1,'zxcqwe321','아부지','우와 너무 재미있어보여요!! 추천 감사합니다!','2022-12-01 23:51:08','2022-12-01 23:51:08','N'),(6,3,'zxcqwe321','아부지','처음부터 천천히 도전해보세요. 좋은 결과가 나올거예요!! 화이팅!\r\n','2022-12-01 23:51:37','2022-12-01 23:51:37','N'),(7,6,'zxcqwe321','아부지','좋은 글 감사합니다! ','2022-12-01 23:52:01','2022-12-01 23:52:01','N'),(8,7,'zxc123qwe','막둥이','잘 읽고 갑니다!!','2022-12-01 23:53:05','2022-12-01 23:53:05','N'),(9,6,'zxcqwe123','말썽쟁이','끝까지 화이팅!!','2022-12-01 23:54:14','2022-12-01 23:54:14','N'),(10,5,'ezen1201','감자','책 안 봄~~ 교재 없어도 가능~~~','2022-12-02 01:54:24','2022-12-02 01:54:24','N'),(11,7,'ezen1201','감자','감자합니다~!','2022-12-02 01:54:54','2022-12-02 01:54:54','N'),(12,3,'ezen1201','감자','저두요,,,,','2022-12-02 01:55:10','2022-12-02 01:55:10','N'),(13,7,'hyeji1004','혜징징','약간 랩하는거같애요. 그 누구냐.. 기억이안나네.. 스윙스?','2022-12-02 01:56:31','2022-12-02 01:56:31','N'),(14,10,'hyeji1004','혜징징','그래도 참아야해요.\r\n악으로 깡으로 버텨요\r\n악 런~','2022-12-02 01:57:18','2022-12-02 01:57:18','N'),(15,1,'ezen1201','감자','dndhk','2022-12-02 14:41:34','2022-12-02 14:41:34','N'),(16,1,'ezen1201','감자','dndhk','2022-12-02 14:41:34','2022-12-02 14:41:34','N');
/*!40000 ALTER TABLE `al_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `al_review`
--

DROP TABLE IF EXISTS `al_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_review` (
  `RE_CODE` int NOT NULL,
  `LCTR_CODE` int NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `USER_NICKNAME` varchar(30) NOT NULL,
  `RE_SCORE` float NOT NULL,
  `RE_CONTENTS` varchar(1000) NOT NULL,
  `RE_REGDATE` datetime NOT NULL,
  `RE_MODFDATE` datetime NOT NULL,
  `RE_DEL_YN` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`RE_CODE`,`LCTR_CODE`),
  KEY `fk_AL_REVIEW_AL_LCTR_idx` (`LCTR_CODE`),
  CONSTRAINT `fk_AL_REVIEW_AL_LCTR` FOREIGN KEY (`LCTR_CODE`) REFERENCES `al_lctr` (`LCTR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_review`
--

LOCK TABLES `al_review` WRITE;
/*!40000 ALTER TABLE `al_review` DISABLE KEYS */;
INSERT INTO `al_review` VALUES (1,1,'ezen1201','감자',5,'비전공자로서 너무 좋은 강의였습니다~!!!','2022-12-02 01:56:07','2022-12-02 01:56:07','Y'),(2,2,'ezen1201','감자',5,'자바스크립트 어려워 했는데 감자합니다~!','2022-12-02 01:57:00','2022-12-02 01:57:00','Y'),(3,9,'ezen1201','감자',5,'비전공자한테 추추추추천!!!','2022-12-02 01:57:20','2022-12-02 01:57:20','Y'),(4,10,'ezen1201','감자',5,'생코 진짜 강추 너무 쉽게 잘 알려줍니다','2022-12-02 01:58:03','2022-12-02 01:58:03','Y'),(5,8,'ezen1201','감자',5,'개인적으로 css 어려운데 강의 너무 좋았습니다~~~~~~~~~~~~~~~~~~~~~~~~~','2022-12-02 01:58:22','2022-12-02 01:58:22','Y'),(6,5,'ezen1201','감자',3,'노드 처음 배우는데 어렵네요 ㅠㅠ','2022-12-02 01:59:33','2022-12-02 01:59:33','Y'),(7,7,'hyeji1004','혜징징',5,'아마존 웹 서비스 주변에서 돈 계속 나가고 있단 소리 들어서 무서웠는데 잘 보고 갑니다~~ 덕분에 용기가 생겼어요~~~~','2022-12-02 01:59:39','2022-12-02 01:59:39','Y'),(8,10,'hyeji1004','혜징징',4,'특수문자가 많으면 좀 어지러워요. 그래서 제가 정규식을 잘 못하나봐요. ㅠ 그래도 강의 보고 어느정도 이해는 되네요 감사합니다!','2022-12-02 02:00:39','2022-12-02 02:00:39','Y'),(9,2,'hyeji1004','혜징징',5,'자바스크립트로 저렇게 다양한 게임을 만들 수 있다니 신기하네요 책도 구매하려구요  좋은 강의 감사합니다!','2022-12-02 02:02:09','2022-12-02 02:02:09','Y'),(10,5,'zxcqwe123','말썽쟁이',5,'설명 너무 잘해주셔서 이해하기 편했습니다!!','2022-12-02 02:03:20','2022-12-02 02:03:20','Y'),(11,8,'hyeji1004','혜징징',5,'CSS는 해도해도 헷갈리네요 \r\n이왕 강의하시는거. 푸터 밑에 고정하는것도 알려주세요. ','2022-12-02 02:04:14','2022-12-02 02:04:14','Y'),(12,3,'tnwls1234','dlwps11',5,'좋아여 ㅎㅎㅎ','2022-12-02 17:19:04','2022-12-02 17:19:04','Y');
/*!40000 ALTER TABLE `al_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `al_user`
--

DROP TABLE IF EXISTS `al_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_user` (
  `USER_ID` varchar(30) NOT NULL,
  `USER_PW` varchar(30) NOT NULL,
  `USER_NAME` varchar(30) NOT NULL,
  `USER_NICKNAME` varchar(30) NOT NULL,
  `USER_BIRTH` varchar(8) NOT NULL,
  `USER_REGDATE` datetime NOT NULL,
  `USER_MODFDATE` datetime NOT NULL,
  `USER_USE_YN` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_user`
--

LOCK TABLES `al_user` WRITE;
/*!40000 ALTER TABLE `al_user` DISABLE KEYS */;
INSERT INTO `al_user` VALUES ('ezen1201','!ezen1234','김코딩','감자','20221201','2022-12-01 20:31:43','2022-12-01 20:31:43','N'),('ezen1202','!ezen1234','최코딩','코딩','19990909','2022-12-02 14:43:21','2022-12-02 14:43:21','Y'),('hyeji1004','!ezen1234','안혜지','혜징징','19970103','2022-12-01 20:29:58','2022-12-01 20:29:58','Y'),('tnwls1234','!ezen1234','이젠','dlwps11','19991231','2022-12-01 20:31:15','2022-12-01 20:31:15','Y'),('zxc123qwe','zxcasdQWE!23','신짱아','막둥이','20200101','2022-12-01 20:34:55','2022-12-01 20:34:55','Y'),('zxc321qwe','zxcasdQWE!23','봉미선','어무니','19850101','2022-12-01 23:42:25','2022-12-01 23:42:25','Y'),('zxcqwe123','zxcasdQWE!23','신짱구','말썽쟁이','20000101','2022-12-01 20:30:59','2022-12-01 20:30:59','Y'),('zxcqwe321','zxcasdQWE!23','신형만','아부지','19800101','2022-12-01 23:41:05','2022-12-01 23:41:05','Y');
/*!40000 ALTER TABLE `al_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `al_user_lctr`
--

DROP TABLE IF EXISTS `al_user_lctr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `al_user_lctr` (
  `USER_ID` varchar(30) NOT NULL,
  `LCTR_CODE` int NOT NULL,
  PRIMARY KEY (`USER_ID`,`LCTR_CODE`),
  KEY `fk_AL_USER_LCTR_AL_LCTR1_idx` (`LCTR_CODE`),
  CONSTRAINT `fk_AL_USER_LCTR_AL_LCTR1` FOREIGN KEY (`LCTR_CODE`) REFERENCES `al_lctr` (`LCTR_CODE`),
  CONSTRAINT `fk_AL_USER_LCTR_AL_USER1` FOREIGN KEY (`USER_ID`) REFERENCES `al_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `al_user_lctr`
--

LOCK TABLES `al_user_lctr` WRITE;
/*!40000 ALTER TABLE `al_user_lctr` DISABLE KEYS */;
INSERT INTO `al_user_lctr` VALUES ('hyeji1004',1),('zxcqwe123',1),('ezen1201',2),('hyeji1004',2),('tnwls1234',2),('tnwls1234',3),('zxcqwe123',5),('ezen1201',6),('hyeji1004',7),('ezen1201',8);
/*!40000 ALTER TABLE `al_user_lctr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 17:38:03
