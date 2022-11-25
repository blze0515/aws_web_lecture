package com.ezen.springboard.service.board;

import java.util.List;
import java.util.Map;

import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;

public interface BoardService {
	//게시글 등록
	void insertBoard(BoardVO boardVO);
	
	//게시글 목록 조회
	List<BoardVO> getBoardList(Map<String, String> paramMap, Criteria cri);
	
	//게시글 상세 조회
	BoardVO getBoard(int boardNo);
	
	//조회수 증가
	void updateBoardCnt(int boardNo);
	
	//게시글 수정
	void updateBoard(BoardVO boardVO);
	
	//게시글 삭제
	void deleteBoard(int boardNo);
	
	//게시글 총 개수 조회
	//검색했을 때는 검색된 게시글의 총 개수를 조회
	int getBoardTotalCnt(Map<String, String> paramMap);
	
	
	
	
	
	
	
	
	
	
	
	
}
