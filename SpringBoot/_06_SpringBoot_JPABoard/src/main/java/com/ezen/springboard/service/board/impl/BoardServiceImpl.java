package com.ezen.springboard.service.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springboard.entity.BoardFileTest;
import com.ezen.springboard.entity.BoardTest;
import com.ezen.springboard.mapper.BoardMapper;
import com.ezen.springboard.repository.BoardFileTestRepository;
import com.ezen.springboard.repository.BoardTestRepository;
import com.ezen.springboard.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardTestRepository boardTestRepository;
	
	@Autowired
	private BoardFileTestRepository boardFileTestRepository;

	@Override
	public BoardTest getBoard(int boardNo) {
		//return boardMapper.getBoard(boardNo);
		return boardTestRepository.findById(boardNo).get();
	}

	@Override
	public List<BoardTest> getBoardList(BoardTest boardTest) {
		// TODO Auto-generated method stub
		//return boardMapper.getBoardList();
		if(boardTest.getSearchCondition().equals("ALL")) {
			return boardTestRepository.findByBoardTitleContainingOrBoardContentContainingOrBoardWriterContaining
					(boardTest.getSearchKeyword(), 
					 boardTest.getSearchKeyword(), 
					 boardTest.getSearchKeyword());
		} else if(boardTest.getSearchCondition().equals("TITLE")) {
			return boardTestRepository.findByBoardTitleContaining(boardTest.getSearchKeyword());
		} else if(boardTest.getSearchCondition().equals("CONTENT")) {
			return boardTestRepository.findByBoardContentContaining(boardTest.getSearchKeyword());
		} else {
			return boardTestRepository.findByBoardWriterContaining(boardTest.getSearchKeyword());
		}
		
	}

	@Override
	public void insertBoard(BoardTest boardTest) {
		//boardMapper.insertBoard(boardTest);
		boardTestRepository.save(boardTest);
	}

	@Override
	public void updateBoard(BoardTest boardTest) {
		// TODO Auto-generated method stub
		//boardMapper.updateBoard(boardTest);
		boardTestRepository.save(boardTest);
	}

	@Override
	public void deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		//boardMapper.deleteBoard(boardNo);
		boardTestRepository.deleteById(boardNo);
	}

	@Override
	public void insertBoardFile(BoardFileTest boardFileTest) {
		// TODO Auto-generated method stub
		//boardNo 지정
		BoardTest boardTest = new BoardTest();
		boardTest.setBoardNo(1);
		boardFileTest.setBoardTest(boardTest);
		
		//boardFileNo 지정
		int boardFileNo = boardFileTestRepository.getMaxFileNo(boardTest.getBoardNo());
		boardFileTest.setBoardFileNo(boardFileNo);
		
		boardFileTestRepository.save(boardFileTest);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
