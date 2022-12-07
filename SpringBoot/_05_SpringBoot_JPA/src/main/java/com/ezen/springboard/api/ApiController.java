package com.ezen.springboard.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.springboard.entity.BoardFileTest;
import com.ezen.springboard.entity.BoardTest;
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
	public BoardTest getBoard(int boardNo) {
		return boardService.getBoard(boardNo);
	}
	
	@GetMapping("/boardList")
	public List<BoardTest> getBoardList() {
		return boardService.getBoardList();
	}
	
	@GetMapping("/testApi2")
	public Map<String, Object> testApi2(int boardNo) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("getBoard", boardService.getBoard(boardNo));
		returnMap.put("getBoardList", boardService.getBoardList());
		
		return returnMap;
	}
	
	//GET: 조회
	//POST: 등록
	//PUT: 수정
	//DELETE: 삭제
//	@GetMapping("/restFulApi")
//	public ResponseEntity<?> restFulApi(int boardNo, HttpServletResponse response) {
//		ResponseDTO<BoardTest> responseDTO = new ResponseDTO<BoardTest>();
//		
//		try {
//			responseDTO.setItems(boardService.getBoardList());
//			responseDTO.setItem(boardService.getBoard(boardNo));
//			responseDTO.setStatusCode(response.getStatus());
//			
//			//요청 상태가 ok(200)일 때는 데이터를 리턴
//			return ResponseEntity.ok().body(responseDTO);
//		} catch(Exception e) {
//			responseDTO.setErrorMessage(e.getMessage());
//			responseDTO.setStatusCode(response.getStatus());
//			
//			return ResponseEntity.badRequest().body(responseDTO);
//		}
//	}
	
	@PostMapping("/board")
	public void insertBoard(BoardTest boardTest) {
		boardService.insertBoard(boardTest);
	}
	
	@PutMapping("/board")
	public void updateBoard(BoardTest boardTest) {
		boardService.updateBoard(boardTest);
	}
	
	@DeleteMapping("/board")
	public void deleteBoard(int boardNo) {
		boardService.deleteBoard(boardNo);
	}	
	
	@PostMapping("/boardFile")
	//기본적으로 화면으로 리턴되는 값이나 화면에서 받아오는 데이터들은 DTO를 생성해서 사용하는 게 좋다.
	public void insertBoardFile(BoardFileTest boardFileTest) {
		boardService.insertBoardFile(boardFileTest);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
