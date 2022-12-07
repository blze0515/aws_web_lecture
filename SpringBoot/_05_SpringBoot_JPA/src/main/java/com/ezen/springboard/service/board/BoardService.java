package com.ezen.springboard.service.board;

import java.util.List;

import com.ezen.springboard.entity.BoardTest;

public interface BoardService {
	BoardTest getBoard(int boardNo);
	
	List<BoardTest> getBoardList();
	
	void insertBoard(BoardTest boardTest);
	
	void updateBoard(BoardTest boardTest);
	
	void deleteBoard(int boardNo);
}
