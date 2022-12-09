package com.ezen.springboard.service.board.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springboard.entity.Board;
import com.ezen.springboard.entity.BoardFile;
import com.ezen.springboard.mapper.BoardMapper;
import com.ezen.springboard.repository.BoardFileRepository;
import com.ezen.springboard.repository.BoardRepository;
import com.ezen.springboard.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private BoardFileRepository boardFileRepository;

	@Override
	public Board getBoard(int boardNo) {
		//return boardMapper.getBoard(boardNo);
		return boardRepository.findById(boardNo).get();
	}

	@Override
	public List<Board> getBoardList(Board board) {
		// TODO Auto-generated method stub
		//return boardMapper.getBoardList();
		if(board.getSearchKeyword() != null && !board.getSearchKeyword().equals("")) {
			if(board.getSearchCondition().equals("ALL")) {
				return boardRepository.findByBoardTitleContainingOrBoardContentContainingOrBoardWriterContaining
						(board.getSearchKeyword(), 
						 board.getSearchKeyword(), 
						 board.getSearchKeyword());
			} else if(board.getSearchCondition().equals("TITLE")) {
				return boardRepository.findByBoardTitleContaining(board.getSearchKeyword());
			} else if(board.getSearchCondition().equals("CONTENT")) {
				return boardRepository.findByBoardContentContaining(board.getSearchKeyword());
			} else if(board.getSearchCondition().equals("WRITER")){
				return boardRepository.findByBoardWriterContaining(board.getSearchKeyword());
			} else {
				return boardRepository.findAll();
			}
		} else {
			return boardRepository.findAll();
		}
		
	}

	@Override
	public void insertBoard(Board board) {
		//boardMapper.insertBoard(board);
		boardRepository.save(board);
	}

	@Override
	public Board updateBoard(Board board) {
		// TODO Auto-generated method stub
		//boardMapper.updateBoard(board);
		boardRepository.save(board);
		boardRepository.flush();
		
		System.out.println(board.toString());
		return board;
	}

	@Override
	public void deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		//boardMapper.deleteBoard(boardNo);
		boardRepository.deleteById(boardNo);
	}

	@Override
	public void insertBoardFile(BoardFile boardFile) {
		// TODO Auto-generated method stub
		//boardNo 지정
		Board board = new Board();
		board.setBoardNo(1);
		boardFile.setBoard(board);
		
		//boardFileNo 지정
		int boardFileNo = boardFileRepository.getMaxFileNo(board.getBoardNo());
		boardFile.setBoardFileNo(boardFileNo);
		
		boardFileRepository.save(boardFile);
	}

	@Override
	public void updateBoardCnt(int boardNo) {
		// TODO Auto-generated method stub
		boardRepository.updateBoardCnt(boardNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
