-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 14.63.62.56    Database: reviewus_g01
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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_no` int NOT NULL,
  `board_title` varchar(200) NOT NULL,
  `board_main` varchar(5000) DEFAULT NULL,
  `board_star` int NOT NULL,
  `rprt_cnt` int NOT NULL DEFAULT '0',
  `board_rgd` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `board_catecd` int NOT NULL,
  `board_cate` varchar(10) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `board_addr` varchar(200) DEFAULT NULL,
  `board_cnt` int NOT NULL DEFAULT '0',
  `place_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'test01','mypage용 테스트',4,0,'2022-11-27 23:12:57',1,'1','aa','0',57,NULL),(60,'[공지]','공지 글 입니다!!',0,0,'2022-12-01 21:07:17',0,'NOTICE','bb [관리자]',NULL,18,NULL),(1006,'애프눈티는 굿','전반적으로 다 좋습니다.\r\n\r\n하지만 큰 불만이 있었습니다. 집사람이 엘리베이터에서 넘어져 심하게 다쳤는데 여기는 이런 사고에 대해서 별 책임감을 못 느끼는 모양입니다. 미끄러져 다쳤다고 얘기해도 별 반응도 없길래 약이나 밴드같은 거라도 달라고하니 없다고 하길래 그럼 어떻하냐 했더니 건너편에 편의점 있다고 하고 그만이더군요.\r\n\r\n저는 호텔에서 다친 고객을 걱정하고 어떤식으로든 치료를 위해 최선을 다하고 위로하기 위해 노력할 것을 기대했는데 이건 뭐.........여기가 여인숙이나 모텔도아니고....... 바라는 제가 이상한 모양입니다.\r\n\r\n결론적으로 고객을 케어하는 마음이 전혀 없습니다. 5성급 최고급호텔에서 바닥이 미끄러워 엘리베이터에서 넘어져 다친 고객에게 케어는 커녕 신경도 안쓰는 서비스마인드.\r\n\r\n우리나라 최고급 호텔들의 문제의 상당수는 직원서비스마인드에서 비롯됩니다.\r\n최고의 봉사정신을 가진 분들을 선발하여 육성하고 서비스해야 하는 것 아닌가요?\r\n\r\n아니면 엘리베이터에서 미끄러지지않게 청소라도 잘 해놓던지요.\r\n\r\n1년전 일이지만 다시 생각해도 화가 납니다.',3,0,'2022-12-02 02:30:23',1,'HOTELS','bb','서울특별시 강남구 봉은사로 130',19,'노보텔앰배서더강남 비즈니스센터'),(1007,' 최적의 장소, 친절한 직원','강남의 한복판에 위치합니다. 객식이 깨끗하고 설비가 잘 갖추어져 있습니다. 프론트의 직원들, 레스토랑의 직원분들 모두 매우 친절합니다. 저는 처음으로 방문해서 투숙했는데 체크인할 때에 담당하셨던 여자분이 이것저것 설명하여 주셔서 편안하게 지냈습니다. The square의 조식도 맛있고, 다양한 음식들이 구비되어 있습니다. 체크아웃도 원활하게 진행되었습니다.',5,0,'2022-12-02 02:32:10',1,'HOTELS','aa','서울특별시 강남구 봉은사로 130',7,'노보텔앰배서더강남 비즈니스센터'),(1008,'사려깊고 친절한 직원 분들 덕에 편안함 투숙을 했습니다.','호텔 시설과 서비스 모두 굉장히 좋았지만, 직원 두 분을 특별히 칭찬하고 싶습니다~ 저희의 결혼기념일까지 기억해주시고 편안한 호텔 투숙을 도와주신 남준오, 사공채원 프론트 직원님 감사합니다.\r\n\r\n친절한 말씨와 편안하고 따뜻한 미소로 응대해주셔서 특별한 날이 더욱 특별하게 느껴졌고, 세심하게 저희의 결혼기념일까지 기억해주셔서 감사드렸습니다.\r\n\r\n다음에도 기회가 된다면 또 노보텔 앰배서더 강남 호텔에서 머물고 싶습니다~',5,0,'2022-12-02 02:35:55',1,'HOTELS','admin','서울특별시 강남구 봉은사로 130',4,'노보텔앰배서더강남 비즈니스센터'),(1009,'직원들의 서비스가 너무 훌륭합니다.','도데체 어떻게 이렇게 모든 직원들의 서비스가 친절할수 있습니까?\r\n개인적인 수술로 인해 5박을 예약하고 나중에 1박을 연장하였습니다.\r\n체크인하면서 직원의 매우 친절한 설명도 좋았고\r\n객실에 들어오자마자 고층의 조용한 객실이라 편히 쉴수 있었습니다\r\n.또 웰컴기프트에서 느껴지는 노보텔 강남의 따뜻한 환대를 느낄수 있었습니다.\r\n1박연장할때도 객실이동없이 같은 객실에서 편히 쉴수있도록 배려해주셔서 매우감사했습니다.\r\n무엇보다 룸클리닝에 대해 가장 칭찬해드리고 싶습니다.\r\n보통 5성급에 묵어도 직원들은 친절하나 룸클리닝에서 어느 한부분에서 청소가 좀 덜되어있거나 어느 하루는 어매니티가 보충이 안되있거나 하는데 여기서는 매일매일 새로운 방에 체크인하는 느낌으로 모든것이 완벽하게 청소되어있었습니다.\r\n또 제가 몸을 움직이기 많이 불편했지만 룸청소시간 드리려고 오후 3-4시쯤 늦게나와서 오후5-6시에 들어갔는데 2-3시간 사이에 룸이 매우 깨끗하게 청소되어 있었습니다.\r\n고객이 따로 말하지 않아도 세심하게 시간을 체크하여 룸을 청소해주시다니 룸청소해주시는 직원의 센스가 정말 대단하신것 같습니다.\r\n노보텔 강남에서 너무너무 편하게 지내고 휴식도 잘해서 지금은 몸도 많이 좋아졌습니다. 감사합니다.',5,0,'2022-12-02 02:37:10',1,'HOTELS','dd','서울특별시 강남구 봉은사로 130',3,'노보텔앰배서더 서울강남 주차장'),(1010,'노보텔 강남에서 가족휴가..','가족휴가를 최애 호텔..\r\n노보텔강남에서 보냈네요..\r\n\r\n일정상 수영장이랑 라운지를 이용못해 아쉬웠지만..\r\n즐거운 호캉스였습니다.\r\n\r\n다만. 조식중 직원의 아쉬운 응대가 있었지만.\r\n\r\n언제나 괞찮은 노보텔강남입니다',5,0,'2022-12-02 02:38:32',1,'HOTELS','Dongi','서울특별시 강남구 봉은사로 130',3,'연회장 노보텔앰배서더강남'),(1011,'만족스러운 숙박경험','Accor plus platinum 회원입니다. 체크인 시 프론트 데스크 직원분의 환대에 감사드립니다. Stay Plus로 투숙했고, 오후1~2시 경 도착했는데 지체 없이 체크인 안내 받았습니다. 룸 업그레이드 및 어메니티 제공해주셔서 편리하게 투숙하였습니다. 바쁘신 와중에도 지나갈 때마다 마주친 하우스키핑 직원분들께서도 환하게 인사해주셔서 기억에 남습니다.',5,0,'2022-12-02 02:40:04',1,'HOTELS','jang','서울특별시 강남구 봉은사로 130',5,'노보텔앰배서더강남 비즈니스센터'),(1012,'편안한시간보내다갑니다','오랜만에 느끼는 여유로움을 노보텔앰배서더호텔이 극대화 시켜주네요\r\n편안하게 잘 쉬었다 갑니다\r\n프론트 이해인 직원분의 친절한 도움으로 기분좋은 시작을 할 수 있었어요 다시한번 감사합니다?\r\n룸, 침구, 욕실등 모두 깔끔하고 소홀하게 관리 되지않은 느낌이 너무 좋았어요\r\n또 올게요~~~~!!!!',5,0,'2022-12-02 02:41:32',1,'HOTELS','qwer','서울특별시 강남구 봉은사로 130',4,'노보텔앰배서더강남 비즈니스센터'),(1014,'맛은있지만 서비스는 그닥..','맛은 있었습니다 하지만 서비스는 별로였어요\r\n연탄불고기 생각나서 오랜만에 갔습니다. 직원분을 계속 불러도 못들었는지 저희테이블 봐주시지도 않더라구요ㅠㅠ 추가로 주문하고싶었는데 못하고 그냥 나왔네요... 맛은 알고갔던 곳이라 맛있었는데 조금 기분이 안좋았습니다! 이점만 개선부탁드립니다!! 하지만 맛있어서 재방문 의사는 있습니다,,,',3,0,'2022-12-02 02:47:02',4,'RESTAURANT','silverstar','서울특별시 강남구 테헤란로20길 19',2,'새마을식당 역삼스타타워점'),(1015,'강남교자','강남교자\r\n스타벅스 강남삼성타운점 옆에 있어요\r\n교자와 칼국수 보쌈이 있어요\r\n칼국수는 공기밥도 나와요\r\n맛나네요\r\n육수도 좋고',5,0,'2022-12-02 02:48:32',4,'RESTAURANT','silverstar','서울특별시 서초구 강남대로69길 11',2,'강남교자 강남본점'),(1016,'내부도 깔끔하고 워낙 스타벅스 음료 자체가 맛잇긴 하지만 이 지점도 맛있었다.','영화관 입장 전에 들어서 음료를 샀다.\r\n내부도 깔끔하고 워낙 스타벅스 음료 자체가 맛잇긴 하지만 이 지점도 맛있었다.\r\n이 달의 음료 중 블랙 와플칩 푸라푸치노를 먹었는데 매우 맛잇었다.',3,0,'2022-12-02 02:50:19',2,'DESSERT','silverstar','서울특별시 서초구 서초대로78길 24',6,'스타벅스 강남삼성타운점'),(1017,'김치볶음밥 먹으러 가는 곳','여기거 제일 인기있는 메뉴 김치볶음밥! 을 먹기 위해 자주 방문하는 곳 입니다 포장마차처럼 다양한 음식을 주문해서 먹을 수 있고 김치볶음밥 뿐만이 아닌 다른 음식들도 맛있어서 자주 방문하게 되는것 같아요',5,0,'2022-12-02 02:51:41',3,'BARS&PUBS','silverstar','서울특별시 강남구 강남대로 468',4,'코다차야 강남점'),(1018,'스타벅스','스타벅스 명성답게 맛있는 커피를 즐길 수 있습니다.\r\n지하철 2호선과 신분당선 환승되는 강남역에서 가깝습니다.\r\n테이블도 넉넉하게 있고 직원들도 친절해 좋습니다!',5,0,'2022-12-02 02:53:11',2,'DESSERT','qwer','서울특별시 서초구 서초대로78길 24',3,'스타벅스 강남삼성타운점'),(1019,'강남에 가성비 좋은 술집이에요','강남에 가성비 좋은 술집이에요. 저렴한 가격에 다양한 안주가 있어요. 회부터 오뎅탕 꼬치 등\r\n술 종류도 다양하고 좋아요. 추천합니다.',4,0,'2022-12-02 02:53:54',3,'BARS&PUBS','qwer','서울특별시 강남구 강남대로 468',4,'코다차야 강남점'),(1020,'비빔국수 + 만두의 조합','비빔국수가 조금 매콤한데 만두랑 같이 먹으면 꿀맛입니다. 만두가 크기도 적당하고 국수랑 먹을때 꼭시켜드세요. 여름엔 간단히 콩국수 먹으러 온 사람들이 많아서 웨이팅이 필수입니다.',4,0,'2022-12-02 02:54:32',4,'RESTAURANT','qwer','서울특별시 서초구 강남대로69길 11',1,'강남교자 강남본점'),(1021,'열탄불고기에 김치찌개 최고','열탄불고기가 매력인 고기집이지만 뭐니뭐니해도 김치찌개에 김가루 뿌려먹는 맛이 최고인 집이에요. 된장찌개도 정말 맛있어요',4,0,'2022-12-02 02:55:08',4,'RESTAURANT','qwer','서울특별시 송파구 백제고분로7길 45',1,'새마을식당 잠실신천점'),(1022,'항상 느끼지만 가격이 너무 비쌈..','커피 맛도 나쁘지 않고 디카페인으로 즐길 수 있는 것도 맘에 드는데, 가격이 너무 비싸요. 그만큼의 맛이 있다고 생각은 들지 않아서.. 다만 어느 지점을 가더라도 매장이 넓고 다른 체인 카페보단 조용한 편이라 가끔 방문하고 있어요.',4,0,'2022-12-02 02:56:53',2,'DESSERT','qwer','서울특별시 서초구 강남대로 423',0,'커피빈 강남에스점'),(1023,'리모델링 성공','리모델링 전에는 좀 불편했는 데, 리모델링 후 방문 했는 데 정말 좋았다. 빵 진열도 먹음직 스럽게 되어 있고 셀프오더기계가 있다.',5,0,'2022-12-02 02:57:52',2,'DESSERT','qwer','서울특별시 서초구 강남대로 373',1,'던킨 라이브강남점'),(1024,'내 평생 최악의 서비스','서비스 최악... 매장 가서 앉자마자 알바생이 주문하라고 함. 그래서 메뉴판부터 달라고 했더니 알바생이 인상 확 쓰고 들고 있는 계산표를 테이블에 집어 던지고 미친X 이렇게 중얼거리고 감. 태어나서 음식점 가서 이런 충격적인 일 처음 겪어봄. 매장 바로 나와서 전화해서 점장 바꿔달라니까 전화기를 테이블?위에 집어던지는 소리가 다 들림. 이 와중에 점장은 \"할 말이 없다\"라고 하더군요. 절대 가지 마세요 그냥 돈을 바닥에 버리는 일이 있어도 가지 마세요. 제가 웬만하면 이런 말 안 하는데 절대 가지 마세요. 아는 사람마다 가지 말라고 할 것임.',1,0,'2022-12-02 02:58:46',4,'RESTAURANT','jang','서울특별시 서초구 강남대로69길 11',1,'강남교자 강남본점'),(1025,'이층이라서 자리가 넉넉함','카운터 앞에 공간이 많아요 강남역 5번 출구엣 마오면 가깝구요 강남역에 있는 스타벅스 중에 제일 좋은 듯\r\n이층이라서 자리도 넉넉하고 화장실도 내부에 있어요 그리고 깨끗해요',5,0,'2022-12-02 02:59:33',2,'DESSERT','jang','서울특별시 서초구 서초대로78길 24',3,'스타벅스 강남삼성타운점'),(1026,'원조 월드마켓 포차','가격대비 음식 퀄러티 good. 분위기는 시장의 야단스러운 분위기. 술은 취향대로 선택가능. 프레쉬한 날것인 사시미 먹어도 그 다음날 문제 없는 안전한 포차.',5,0,'2022-12-02 03:00:04',3,'BARS&PUBS','jang','서울특별시 강남구 강남대로 468',1,'코다차야 강남점'),(1027,'자리 없을때가 많아요','강남역에서 누구 기다리기에는 최적의 장소\r\n단 강남의 웬만한 카페가 그렇듯\r\n정말 자리 잡기가 힘듭니다\r\n콘센트도 거의 없구요\r\n직원들은 친절하고 외국어도 잘함',4,0,'2022-12-02 03:01:21',2,'DESSERT','Dongi','서울특별시 서초구 강남대로 455',1,'던킨 강남대로점'),(1028,'몇년만에 들르게 된 그랑아~ 여전히 모던하면서도,','몇년만에 들르게 된 그랑아~\r\n여전히 모던하면서도, 기분 좋은 느낌을 마주했다@.@\r\n밴드를 보고 듣고 있으면. 강남이 아닌 해외 펍에 앉아있는 기분도 들고~ ㅋㅋ\r\n직원분들도 친절하고, 맥주나 음식도 나름 내 입맛엔 잘맞았던거 같다~\r\n기분내고 싶은날은. 그랑아로~ ㅋㅋ',5,0,'2022-12-02 03:02:16',3,'BARS&PUBS','Dongi','서울특별시 강남구 봉은사로 130',1,'그랑아 노보텔앰배서더강남점'),(1029,'맛있어요!!!','새마을식당 7분김치찌개 밥에 김넣어서 비벼 먹으면 너무 맛있어요!!! 연탄불고기 김치말이국수도 추천여!!',5,0,'2022-12-02 03:02:54',4,'RESTAURANT','Dongi','서울특별시 강남구 삼성로104길 23',0,'새마을식당 삼성코엑스점'),(1030,'신논현-강남역 근처 저렴하게 식사할 수 있는 곳','신논현역 가까운 곳에 위치한, 비교적 저렴하게 한 끼 식사를 할 수 있는 곳입니다. 칼국수를 먹어보았는데, 국물 맛이 좀 심심한 편입니다. 양념 고기 고명이 아니었다면 매우 심심한 맛입니다. 하지만 작은 밥공기도 처음부터 제공되고, 마늘 맛 강한 김치도 자주 보충해주시는 등, 부담없이 한 끼 식사하기에 좋습니다. 계산하고 나가기 전에 요구르트 등 후식이 놓여있으니 잊지 말고 드세요.',3,0,'2022-12-02 03:04:42',4,'RESTAURANT','Dongi','서울특별시 서초구 강남대로69길 11',1,'강남교자 강남본점'),(1031,'엄청난 인파속, 자리잡기힘든 매장','평일이든 주말이든 엄청난 인파로 자리잡기가 힘든 매장입니다. 북적북적 시끌시끌 사람들 사는 소리가 들리는 곳이기도 합니다.\r\n강남역의 만남장소로 유명한곳 중에 한곳으로 조용한 대화를 하는것은 불가능하니 참고하시길\r\n강남역 안에서 가장인기있는 매장으로 손꼽히는 곳입니다. 물론 커피맛은 최고입니다.',5,0,'2022-12-02 03:05:35',2,'DESSERT','dd','서울특별시 서초구 강남대로 423',1,'커피빈 강남에스점'),(1032,'여자친구와 특별한날','여자친구랑 기념일이라 그랑아를 갔는데 라이브 밴드가 노래를 너무 잘 하고 신청곡도 다 받아주셔서 좋았어요ㅎㅎ 분위기도 좋고 칵테일도 끝내주네요 여자친구도 너무 좋아하고, 좋은추억 만들었습니다~~',5,0,'2022-12-02 03:06:11',3,'BARS&PUBS','dd','서울특별시 강남구 봉은사로 130',2,'그랑아 노보텔앰배서더강남점'),(1033,'흥미,재미를 더한 서울의 명소','노보텔 강남에 그랑아 바,,정말 잼나고 즐거워요.가끔 가는데 좋아요~~~직원들도 친절하고,,특히 강남에서 찾아보기 힘든 펍!!! 바입니다^^볼거리 먹을거리, 맛있고 시원한 맥주,또한 칵테일까지...추천할 만 합니다!!!!방문할때마다 직원들의 친절함 또한 고맙고 감사합니다^^필리핀 밴드 정말 흥겹습니다..같이간 일행이랑 대화하기는 쬐끔 힘들지만...대화는 쪼끔 조용한 섹션에서 하면 되고!!!흥겨움을 느낄려면...바쪽도 적극 추천입니다!!!ㅋㅋ한번 가 볼만 합니다!!!꼭 한번 가보세요~~~~~~',5,0,'2022-12-02 03:07:21',3,'BARS&PUBS','bb','서울특별시 강남구 봉은사로 130',4,'그랑아 노보텔앰배서더강남점'),(1034,'아침에 일찍 열어서 좋아요','커피빈 강남에스점은 아침에 7시반에 오픈해서 모닝셋트 먹기에 좋습니다. 매장도 넓고 위치도 강남역에서 가까워 지나가는 길에 모닝을 즐기기에 좋은 장소 입니다. 언제나 깨끗하고 커피도 맛나네요.',5,0,'2022-12-02 03:08:12',2,'DESSERT','aa','서울특별시 서초구 강남대로 423',3,'커피빈 강남에스점'),(1035,'공지사항입니다','공지사항입니다!',0,0,'2022-12-02 10:17:56',0,'NOTICE','bb [관리자]',NULL,0,NULL),(1036,'공지사항입니다[20221202]','공지사항입니다[20221202]',0,0,'2022-12-02 10:31:52',0,'NOTICE','bb [관리자]',NULL,4,NULL),(1037,'너무 좋았습니다','너무 좋아요',3,0,'2022-12-02 16:03:21',0,'HOTELS','silverstar','대구광역시 중구 국채보상로 611',0,'노보텔앰배서더 대구 H2O 샴페인바'),(1038,'ss','ssss',0,0,'2022-12-02 16:09:26',0,'NOTICE','bb [관리자]',NULL,0,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `CNO` int NOT NULL,
  `BOARD_NO` int NOT NULL,
  `WRITER` varchar(30) NOT NULL,
  `CONTENT` varchar(300) NOT NULL,
  `REGDATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CNO`),
  KEY `BOARD_NO` (`BOARD_NO`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`BOARD_NO`) REFERENCES `board` (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'aa','mypage용 테스트01','2022-12-02 00:51:39'),(2,1,'aa','mypage용 테스트02','2022-12-02 00:51:46'),(3,1,'aa','mypage용 테스트03','2022-12-02 00:51:51'),(5,999,'가렌','이것봐라 내가 룬테라를 들어올리고 있다!','2022-12-02 00:26:58'),(7,999,'티모','하하하 흐흥하하하하','2022-12-02 00:27:15'),(14,999,'어어어','이이이','2022-12-02 00:48:25'),(17,999,'어어어','이이이','2022-12-02 00:48:25'),(18,999,'어어어','이이이','2022-12-02 00:48:25'),(22,999,'홀리 몰리 마더 파더','젠틀맨','2022-12-02 08:38:28'),(23,999,'아 대박이다','아니 어제는 안되셧잖아요 오늘은 되네요?','2022-12-02 08:39:43'),(24,999,'문도박사','문도! 때린다!','2022-12-02 09:39:52'),(25,60,'0','아 낭머라ㅣㅓㄴㅇㅁ라ㅣ','2022-12-02 10:27:40'),(26,60,'뭐냐구우','내 검과 심장은 데마시아의 것이다!','2022-12-02 10:27:47'),(27,60,'우하하하','우하하하하','2022-12-02 11:54:30'),(28,60,'나는 바보다 ','나는 바보다 크크','2022-12-02 12:09:40'),(29,1006,'오오','그런 일이 있으셨군요.!!!!!!!!!!!!!!!!!!!','2022-12-02 12:46:14'),(30,1028,'아아아','우와 즐거운 시간','2022-12-02 13:57:57'),(31,1007,'','asdf','2022-12-02 16:33:41'),(32,1012,'','aa','2022-12-02 16:41:08');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileupload`
--

DROP TABLE IF EXISTS `fileupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fileupload` (
  `file_no` int NOT NULL,
  `board_no` int NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `ori_file_name` varchar(100) NOT NULL,
  `file_path` varchar(1000) DEFAULT NULL,
  `file_cate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`file_no`,`board_no`),
  KEY `FK_board_TO_fileUpload_1` (`board_no`),
  CONSTRAINT `FK_board_TO_fileUpload_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileupload`
--

LOCK TABLES `fileupload` WRITE;
/*!40000 ALTER TABLE `fileupload` DISABLE KEYS */;
INSERT INTO `fileupload` VALUES (1,1006,'20221202023023_3974b1b2-eb0f-4c1a-9152-19ba9369c44f_caption (1).jpg','caption (1).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1007,'20221202023210_6de69aea-bb5e-42e4-abf8-843a2871abc9_novotel-ambassador-seoul (1).jpg','novotel-ambassador-seoul (1).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1008,'20221202023556_b889d0ec-f49b-411d-9e06-ead1e95edfbc_novotel-ambassador-seoul (4).jpg','novotel-ambassador-seoul (4).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1015,'20221202024833_69ad18cd-a247-4d2e-b143-749c1575c592_photo0jpg.jpg','photo0jpg.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1018,'20221202025312_30a82eee-ab1b-4bff-a399-142c5050b40f_caption (5).jpg','caption (5).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1023,'20221202025752_b056b10d-c538-4eeb-a861-b91bf5ea06c6_1565138526956-largejpg.jpg','1565138526956-largejpg.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1025,'20221202025934_7dbe3fb9-bbbb-432d-8197-57a357f40c66_photo0jpg (1).jpg','photo0jpg (1).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1027,'20221202030121_4c51f7ae-309b-4ee9-922e-f58972d15b64_caption (6).jpg','caption (6).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1031,'20221202030536_6c0b5a21-427a-484e-9b24-32a1851377dc_photo0jpg (2).jpg','photo0jpg (2).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(1,1033,'20221202030721_faed3de9-109b-4c3d-8537-5b77f8f7f0b9_photo0jpg (3).jpg','photo0jpg (3).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(2,1006,'20221202023023_af2a3c33-2e29-4155-88f8-7760fc9e05b8_caption.jpg','caption.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(2,1007,'20221202023210_2becea9d-fdd6-4c4a-8f49-c77b485441b7_novotel-ambassador-seoul (2).jpg','novotel-ambassador-seoul (2).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(2,1008,'20221202023556_b8edf786-2277-4d2a-b04e-5984eac9b81a_novotel-ambassador-seoul.jpg','novotel-ambassador-seoul.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(2,1015,'20221202024833_a28ec5af-2673-420f-a0de-ea32bc60e034_photo1jpg.jpg','photo1jpg.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(2,1025,'20221202025934_c325745b-9671-4d33-b46b-bd941278c2d2_photo1jpg (1).jpg','photo1jpg (1).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(2,1033,'20221202030721_127640f6-f093-4ff9-ba65-ee00e66a08f1_photo1jpg (2).jpg','photo1jpg (2).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(3,1007,'20221202023210_407cd93e-0173-4c1f-b879-0b3dc2e544c2_novotel-ambassador-seoul.jpg','novotel-ambassador-seoul.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(3,1015,'20221202024833_e2e89ca6-bfa2-455e-8b28-305d69700fcd_photo2jpg.jpg','photo2jpg.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(3,1033,'20221202030721_942a1c19-8d67-49d9-ae7f-b9d2feee598e_photo2jpg (1).jpg','photo2jpg (1).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(4,1015,'20221202024833_53dd99a6-7e16-4835-b9e5-2965d8f9c52d_photo3jpg.jpg','photo3jpg.jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img'),(4,1033,'20221202030721_dcf3d56a-1ad7-47f1-80dc-ae7de101b191_photo3jpg (1).jpg','photo3jpg (1).jpg','C:\\MiniProject\\AWS_Project01\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\_999_ReviewUs\\/upload/','img');
/*!40000 ALTER TABLE `fileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likelist`
--

DROP TABLE IF EXISTS `likelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likelist` (
  `user_id` varchar(20) NOT NULL,
  `board_no` int NOT NULL,
  PRIMARY KEY (`user_id`,`board_no`),
  KEY `FK_board_TO_likeList_1` (`board_no`),
  CONSTRAINT `FK_board_TO_likeList_1` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_User_TO_likeList_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likelist`
--

LOCK TABLES `likelist` WRITE;
/*!40000 ALTER TABLE `likelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `likelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_ID` varchar(20) NOT NULL,
  `USER_PWD` varchar(40) NOT NULL,
  `USER_NM` varchar(40) NOT NULL,
  `USER_EMAIL` varchar(40) NOT NULL,
  `USER_RGD` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RPRT_CNT` int NOT NULL DEFAULT '0',
  `USER_ROLE` varchar(10) NOT NULL DEFAULT 'NORMAL',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aa','1234','김인겸1','aa@naver.com','2022-11-25 22:20:19',0,'Stopped'),('aaaa','1111','aaaa','aaaa@aaaa.com','2022-12-02 12:26:06',0,'NORMAL'),('admin','1111','관리자','admin','2022-12-02 10:03:32',0,'NORMAL'),('bb','1234','김도원','aaaa11@daum.com','2022-11-30 16:47:51',0,'admin'),('Cokemania','!d123456789','BOB','BOB@google.com','2022-12-02 09:36:47',0,'Stopped'),('dd','1234','김도원','aaaa11@daum.com','2022-11-30 09:55:59',0,'Stopped'),('dddddd','!ddddd12345','Wow','wow@kakao.com','2022-12-02 15:58:54',0,'NORMAL'),('Dongi','!dongi1234','Dongi','dongi101096396@naver.com','2022-11-30 20:23:35',0,'Stopped'),('fallout','!b123456789','SAM','SAM@naver.com','2022-12-02 09:36:13',0,'NORMAL'),('jang','!ezen1234','장찬영','jnag@naver.com','2022-11-30 14:49:03',0,'NORMAL'),('macadamia99','!hhh123456789','lily','lily99B@daum.net','2022-12-02 09:37:20',0,'Stopped'),('peanut3323','!jkjlk126789','chris','chris553@daum.net','2022-12-02 09:38:42',0,'NORMAL'),('qwer','!q123456789','qwer','qwer@qwer','2022-11-30 14:10:49',0,'NORMAL'),('silverstar','!asdf12345','은별','silverstar@kakao.com','2022-11-25 17:29:48',0,'NORMAL'),('traveler9666','!baba65344','kim','kim59787@daum.net','2022-12-02 09:40:10',0,'Stopped');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 17:38:44
