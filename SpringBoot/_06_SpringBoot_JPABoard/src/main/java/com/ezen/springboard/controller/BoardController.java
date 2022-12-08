package com.ezen.springboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.springboard.dto.BoardDTO;
import com.ezen.springboard.dto.ResponseDTO;
import com.ezen.springboard.entity.Board;
import com.ezen.springboard.service.board.BoardService;

@RestController
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public ModelAndView getBoardList(BoardDTO boardDTO) {
		Board board = Board.builder()
						   .boardTitle(boardDTO.getBoardTitle())
						   .boardContent(boardDTO.getBoardContent())
						   .boardWriter(boardDTO.getBoardWriter())
						   .searchCondition(boardDTO.getSearchCondition())
						   .searchKeyword(boardDTO.getSearchKeyword())
						   .build();
		
		List<Board> boardList = boardService.getBoardList(board);
		
		List<BoardDTO> getBoardList = new ArrayList<BoardDTO>();
		
		for(int i = 0; i < boardList.size(); i++) {
			BoardDTO returnBoard = BoardDTO.builder()
										   .boardNo(boardList.get(i).getBoardNo())
										   .boardTitle(boardList.get(i).getBoardTitle())
										   .boardContent(boardList.get(i).getBoardContent())
										   .boardWriter(boardList.get(i).getBoardWriter())
										   .boardRegdate(boardList.get(i).getBoardRegdate())
										   .boardCnt(boardList.get(i).getBoardCnt())
										   .build();
			getBoardList.add(returnBoard);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/getBoardList.html");
		mv.addObject("getBoardList", getBoardList);
		
		return mv;
	}
	
	@GetMapping("/board/{boardNo}")
	public ModelAndView getBoard(@PathVariable int boardNo) {
		Board board = boardService.getBoard(boardNo);
		
		System.out.println(board.toString());
		
		BoardDTO boardDTO = BoardDTO.builder()
									.boardNo(board.getBoardNo())
									.boardTitle(board.getBoardTitle())
									.boardContent(board.getBoardContent())
									.boardWriter(board.getBoardWriter())
									.boardRegdate(board.getBoardRegdate())
									.boardCnt(board.getBoardCnt())
									.build();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/getBoard.html");
		mv.addObject("getBoard", boardDTO);
		//mv.addObject("boardNo", boardNo);
		
		return mv;
	}
	
	@Transactional //쿼리가 실행된 후 바로 트랜잭션을 호출
	@PutMapping("/board")
	public ResponseEntity<?> updateBoard(BoardDTO boardDTO, 
			HttpServletResponse response) throws IOException {
		ResponseDTO<BoardDTO> responseDTO = new ResponseDTO<>();
		try {
			Board board = Board.builder()
							   .boardNo(boardDTO.getBoardNo())
							   .boardTitle(boardDTO.getBoardTitle())
							   .boardContent(boardDTO.getBoardContent())
							   .boardWriter(boardDTO.getBoardWriter())
							   .build();
			
			boardService.updateBoard(board);
			
			//board = boardService.getBoard(boardDTO.getBoardNo());
			
			BoardDTO returnBoard = BoardDTO.builder()
										   .boardNo(board.getBoardNo())
										   .boardTitle(board.getBoardTitle())
										   .boardContent(board.getBoardContent())
										   .boardWriter(board.getBoardWriter())
										   .boardRegdate(board.getBoardRegdate())
										   .boardCnt(board.getBoardCnt())
										   .build();
			
			responseDTO.setItem(returnBoard);
			
			return ResponseEntity.ok().body(responseDTO);			
		} catch(Exception e) {
			responseDTO.setErrorMessage(e.getMessage());
			
			return ResponseEntity.badRequest().body(responseDTO);	
		}
		//response.sendRedirect("/board/board/" + boardDTO.getBoardNo());
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
