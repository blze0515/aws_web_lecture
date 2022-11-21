package com.ezen.springboard.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.springboard.service.user.UserService;
import com.ezen.springboard.vo.UserVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/user")
//@RestController = @Controller + @ResponseBody
public class UserController {
	@Autowired
	private UserService userService;
	
	//get방식은 해당 화면으로 이동
	@GetMapping("/join.do")
	public String joinView() {
		return "user/join";
	}
	
	//post방식은 해당 로직 처리
	@PostMapping("/join.do")
	public void join(UserVO userVO) {
		
	}
	
	/*
	 * @PostMapping(value = "/test.do", produces="application/text; charset=UTF-8;")
	 * 
	 * @ResponseBody //@ResponseBody: 기존에는 return되는 jsp를 찾아서 response body를 //
	 * HTML(화면자체를 만들어서)로 만들어서 리턴 // @ResponseBody가 선언된 메소드는 리턴 값 자체가 // response
	 * body가 됨.(Html로 구조를 만들지 않음) // 문자열을 리턴하면 요청을 호출한 곳에 문자열을 보내준다. public String
	 * test(UserVO userVO) throws JsonProcessingException {
	 * System.out.println(userVO.getUserId());
	 * 
	 * //json형태의 문자열을 만들어서 리턴한다. //요청에 대한 응답으로 갈 데이터를 json형태로 변경 -> json문자열로 변경
	 * ObjectMapper mapper = new ObjectMapper();
	 * 
	 * //데이터가 담길 Map 선언 Map<String, Object> jsonMap = new HashMap<String, Object>();
	 * 
	 * jsonMap.put("test", 123); jsonMap.put("firstName", "기천");
	 * jsonMap.put("lastName", "고");
	 * 
	 * UserVO user = new UserVO(); user.setUserId("aaa"); user.setUserPw("1234");
	 * user.setUserNm("bbb");
	 * 
	 * jsonMap.put("user", user);
	 * 
	 * //리턴해줄 json문자열 //writerWithDefaultPrettyPrinter(): Map을 예쁜 형태의 json모양으로 변경해줌
	 * //writerValueAsString(): json모양으로 변경된 객체를 문자열로 변경 String json =
	 * mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonMap);
	 * 
	 * return json; }
	 */
	
	@GetMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(UserVO userVO) throws JsonProcessingException {
//		ObjectMapper mapper = new ObjectMapper();
//		
//		Map<String, String> resultMap = new HashMap<String, String>();
//		
//		int idCnt = userService.idCheck(userVO.getUserId());
//		
//		if(idCnt > 0) {
//			resultMap.put("msg", "duplicatedId");
//		} else {
//			resultMap.put("msg", "idOk");
//		}
//		
//		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultMap);
//		
//		return json;
		
		//간단한 데이터를 리턴하는 ajax메소드에서는 굳이 json형태로 만들어서 리턴할 필요가 없다.
		String returnStr = "";
		
		int idCnt = userService.idCheck(userVO.getUserId());
		
		if(idCnt > 0) {
			returnStr = "duplicatedId";
		} else {
			returnStr = "idOk";
		}
		
		return returnStr;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
