package com.ezen.springboard.controller;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.springboard.dto.ResponseDTO;
import com.ezen.springboard.dto.UserDTO;
import com.ezen.springboard.entity.User;
import com.ezen.springboard.service.user.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping("join")
	public ModelAndView joinView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/join.html");
		return mv;
	}
	
	@PostMapping("/join")
	public ResponseEntity<?> join(UserDTO userDTO) {
		ResponseDTO<Map<String, String>> responseDTO = new ResponseDTO<>();
		Map<String, String> returnMap = new HashMap<String, String>();
		try {
			//User user = new User();
			//user.setUserId(userDTO.getUserId());
			//user.setUserPw(userDTO.getUserPw());
			//user.setUserNm(userDTO.getUserNm());
			//user.setUserMail(userDTO.getUserMail());
			//user.setUserId(userDTO.getUserId());
			
			User user = User.builder()
							.userId(userDTO.getUserId())
							.userPw(userDTO.getUserPw())
							.userNm(userDTO.getUserNm())
							.userMail(userDTO.getUserMail())
							.userTel(userDTO.getUserTel())
							.userRegdate(LocalDateTime.now())
							.build();
			
			userService.join(user);
			
			returnMap.put("joinMsg", "joinSuccess");
			
			responseDTO.setItem(returnMap);
			
			return ResponseEntity.ok().body(responseDTO);
		} catch(Exception e) {
			returnMap.put("joinMsg", "joinFail");
			responseDTO.setErrorMessage(e.getMessage());
			responseDTO.setItem(returnMap);
			
			return ResponseEntity.badRequest().body(responseDTO);
		}
	}
	
	@GetMapping("/login")
	public ModelAndView loginView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/login.html");
		return mv;
	}
	
	@PostMapping("/idCheck")
	public ResponseEntity<?> idCheck(UserDTO userDTO) {
		ResponseDTO<Map<String, String>> responseDTO = new ResponseDTO<>();
		Map<String, String> returnMap = new HashMap<String, String>();
		
		try {
			User user = User.builder()
							.userId(userDTO.getUserId())
							.build();
			
			User checkedUser = userService.idCheck(user);
			
			if(checkedUser != null) {
				returnMap.put("msg", "duplicatedId");
			} else {
				returnMap.put("msg", "idOk");
			}
			
			responseDTO.setItem(returnMap);
			
			return ResponseEntity.ok().body(responseDTO);
		} catch(Exception e) {
			responseDTO.setErrorMessage(e.getMessage());
			return ResponseEntity.badRequest().body(responseDTO);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
