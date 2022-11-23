package com.ezen.springboard.service.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springboard.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBoard(BoardVO boardVO) {
		mybatis.insert("BoardDAO.insertBoard", boardVO);
	}
	
	public List<BoardVO> getBoardList() {
		return mybatis.selectList("BoardDAO.getBoardList");
	}
	
	
	
	public BoardVO getBoard(int boardNo) {
		return mybatis.selectOne("BoardDAO.getBoard", boardNo);
	}
	
	public void updateBoardCnt(int boardNo) {
		mybatis.update("BoardDAO.updateBoardCnt", boardNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
