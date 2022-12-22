package com.ezen.springboard.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.ezen.springboard.entity.Board;
import com.ezen.springboard.entity.BoardFile;

public interface BoardService {
	Board getBoard(int boardNo);
	
	List<Board> getBoardList(Board board);
	
	void insertBoard(Board board, List<BoardFile> uploadFileList);
	
	Board updateBoard(Board board, List<BoardFile> uFileList);
	
	void deleteBoard(int boardNo);
	
	void updateBoardCnt(int boardNo);
	
	List<BoardFile> getBoardFileList(int boardNo);
	
	Page<Board> getPageBoardList(Board board, Pageable pageable);
	
	void saveBoardList(List<Map<String, Object>> changeRowsList);
}
