package com.ezen.springboard.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.NameVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	//@GetMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//viewResolver를 타고 /WEB-INF/views/home.jsp
		return "home";
	}
	
	@PostMapping("/")
	public String ezen(Model model) {
		//Model객체는 Request영역에서 데이터를 저장할 수 있는 객체
		//model.addAttribute() == request.setAttribute()
		model.addAttribute("serverTime", "111111");
		return "home";
	}
	
	//화면단(JSP)에서 전달되는 파라미터 받기
	//1. @RequestParam 어노테이션을 이용하여 변수에 직접 할당
	@GetMapping("test.do")
	public String testGet(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName) {
		System.out.println(firstName + " " + lastName);
		
		return "home";
	}
	
	@PostMapping("test.do")
	public String testPost(@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName) {
		System.out.println(firstName + " " + lastName);
		
		return "home";
	}
	
	//2. @RequestParam을 이용하여 Map에 할당
	@GetMapping("test2.do")
	public String test2Get(@RequestParam Map<String, Object> paramMap) {
		System.out.println(paramMap.get("firstName") 
				+ " " + paramMap.get("lastName"));
		
		System.out.println(paramMap.get("job") 
				+ " " + paramMap.get("age"));
		
		return "home";
	}
	
	//3. Command객체를 이용하여 파라미터 받기
	//Command객체는 메소드의 파라미터로 선언된 객체
	//public void test(UserVO user) => UserVO user = new UserVO();
	//파라미터로 넘어오는 데이터의 키값과 command객체의 멤버변수의 이름이 같으면
	//그 멤버변수에 데이터의 값이 입력된다.
	@PostMapping("test3.do")
	public String test3Post(NameVO nameVO) {
		System.out.println(nameVO.getFirstName() + " " + nameVO.getLastName()
		+ " " + nameVO.getJob() + " " + nameVO.getAge());
		
		return "home";
	}
	
	//백단에서 화면단으로 데이터 전송
	//1. Model객체를 이용
	//model: 키는 String, 값은 Object로 되어있어서 
	//		 어떠한 형태의 값이던지 전송가능
	@GetMapping("/hello.do")
	public String hello(Model model, HttpServletRequest request,
			HttpSession session) {
		//1. Model객체 사용
//		model.addAttribute("hello", "12345");
//		List<Integer> mapList = new ArrayList<Integer>();
//		
//		for(int i = 0; i < 10; i++) {
//			mapList.add(i);
//		}
//		
//		model.addAttribute("list", mapList);
		
		//2. HttpServletRequest 객체 사용
		//   HttpServletRequest와 Model의 영역이 같다.
//		request.setAttribute("hello", "67890");
//		
//		List<Integer> mapList = new ArrayList<Integer>();
//		
//		for(int i = 10; i < 20; i++) {
//			mapList.add(i);
//		}
//		
//		request.setAttribute("list", mapList);
		
		//3. HttpSession 객체 사용
		//   HttpSession > HttpServletRequest
		//   HttpSession은 session 끊길 때까지 유지
		//   로그인한 유저의 정보를 담아주거나 현재 연결돼있는 세션의 정보를 담아줄 때 사용
		session.setAttribute("hello", "246810");
		
		return "home";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
