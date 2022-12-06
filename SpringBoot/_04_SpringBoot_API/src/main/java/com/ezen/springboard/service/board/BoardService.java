package com.ezen.springboard.service.board;

import java.util.List;

import com.ezen.springboard.dto.BoardDTO;

public interface BoardService {
	BoardDTO getBoard(int boardNo);
	
	List<BoardDTO> getBoardList();
}
