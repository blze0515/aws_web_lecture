package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.vo.BoardVO;

public interface BoardService {
	//CRUD(Create Read Update Delete) 기능의 메소드 구현
	//글 등록
	void insertBoard(BoardVO boardVO);
	
	//글 수정
	void updateBoard(BoardVO boardVO);
	
	//글 삭제
	void deleteBoard(BoardVO boardVO);
	
	//글 상세 조회
	BoardVO getBoard(BoardVO boardVO);
	
	//글 목록 조회
	List<BoardVO> getBoardList(BoardVO boardVO);
}
