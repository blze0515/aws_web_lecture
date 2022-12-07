package com.ezen.springboard.service.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springboard.entity.BoardTest;
import com.ezen.springboard.mapper.BoardMapper;
import com.ezen.springboard.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public BoardTest getBoard(int boardNo) {
		return boardMapper.getBoard(boardNo);
	}

	@Override
	public List<BoardTest> getBoardList() {
		// TODO Auto-generated method stub
		return boardMapper.getBoardList();
	}

	@Override
	public void insertBoard(BoardTest boardTest) {
		boardMapper.insertBoard(boardTest);		
	}

	@Override
	public void updateBoard(BoardTest boardTest) {
		// TODO Auto-generated method stub
		boardMapper.updateBoard(boardTest);
	}

	@Override
	public void deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		boardMapper.deleteBoard(boardNo);
	}
}
