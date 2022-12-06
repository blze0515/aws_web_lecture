package com.ezen.springboard.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.springboard.dto.BoardDTO;
import com.ezen.springboard.service.board.BoardService;

@RestController
@RequestMapping("/api")
public class ApiController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/testApi1")
	public Map<String, String> testApi1() {
		Map<String, String> returnMap = new HashMap<String, String>();
		
		returnMap.put("first", "gg");
		returnMap.put("last", "aa");
		
		return returnMap;
	}
	
	@GetMapping("/board")
	public BoardDTO getBoard(int boardNo) {
		return boardService.getBoard(boardNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
