package com.ezen.springboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.springboard.service.user.UserService;
import com.ezen.springboard.vo.UserVO;
import com.fasterxml.jackson.core.JsonProcessingException;

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
	//회원가입 진행
	@PostMapping(value="/join.do", produces="application/text; charset=UTF-8")
	public String join(UserVO userVO, Model model) {
		int joinResult = userService.join(userVO);
		
		if(joinResult == 0) {
			model.addAttribute("joinMsg", "회원가입에 실패하셨습니다. 관리자에게 문의해주세요.");
			return "user/join";
		}
		
		model.addAttribute("joinMsg", "회원가입에 성공했습니다. 로그인해주세요.");
		return "user/login";
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
	
	@PostMapping("/idCheck.do")
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
	
//	@RequestMapping("login.do")
//	public String login(UserVO userVO) {
//		//화면으로 이동
//		if(userVO.getUserId() == null)
//			return "user/login";
//		
//		//로직처리
//	}
	
	//로그인 화면으로 이동
	@GetMapping("/login.do")
	public String loginView() {
		return "user/login";
	}
	
	//로그인 처리
	@PostMapping("/login.do")
	@ResponseBody
	//HttpSession: 현재 WAS에 접속한 유저의 세션정보를 담고있는 객체
	//			   세션에서 사용할 데이터를 담아줄 수 있다.
	public String login(UserVO userVO, HttpSession session) {
		//1. 아이디 체크
		int idCheck = userService.idCheck(userVO.getUserId());
		
		if(idCheck < 1) {
			return "idFail";
		} else {
			UserVO loginUser = userService.login(userVO);
			
			//2. 비밀번호 체크
			if(loginUser == null) {
				return "pwFail";
			}
			
			//3. 로그인 성공
			//세션에 로그인한 유저의 정보를 담아서 관리
			session.setAttribute("loginUser", loginUser);
			return "loginSuccess";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
