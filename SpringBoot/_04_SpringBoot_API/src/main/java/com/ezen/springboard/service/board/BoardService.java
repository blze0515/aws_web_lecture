package com.ezen.springboard.service.board;

import java.util.List;

import com.ezen.springboard.dto.BoardDTO;

public interface BoardService {
	BoardDTO getBoard(int boardNo);
	
	List<BoardDTO> getBoardList();
	
	void insertBoard(BoardDTO boardDTO);
	
	void updateBoard(BoardDTO boardDTO);
	
	void deleteBoard(int boardNo);
}
