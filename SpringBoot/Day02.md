# 1. Thymeleaf
1. HTML에서 JSTL을 대체하여 사용할 목적으로 만들어진 렌더링 기술.
2. HTML은 브라우저(클라이언트 사이드)에서 동작하여 DB에서 가져온 데이터를 표출할 수 없는데
   Thymeleaf가 서버 사이드에서 동작하여 HTML에 데이터를 표출할 수 있게 됨.

# 2. VO와 DTO
1. VO(Value Object): 값을 가지고 있는 객체, VO 의미상으로는 set을 할 수 없는 readonly 객체.
2. DTO(Data Transfer Object): 데이터를 전송해주는 객체. 의미상 Data를 받아오기도 하고 Data set해서 넘겨줄 수도 있다.
                              DTO > VO
3. 원래 DTO랑 VO 둘 다 사용을 해야하지만 거의 VO나 DTO 하나만 채택해서 사용
   실사용에서는 VO == DTO