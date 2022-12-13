package com.ezen.springboard.service.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
		/*
		 * if(board.getSearchKeyword() != null && !board.getSearchKeyword().equals(""))
		 * { if(board.getSearchCondition().equals("ALL")) { return boardRepository.
		 * findByBoardTitleContainingOrBoardContentContainingOrBoardWriterContaining
		 * (board.getSearchKeyword(), board.getSearchKeyword(),
		 * board.getSearchKeyword()); } else
		 * if(board.getSearchCondition().equals("TITLE")) { return
		 * boardRepository.findByBoardTitleContaining(board.getSearchKeyword()); } else
		 * if(board.getSearchCondition().equals("CONTENT")) { return
		 * boardRepository.findByBoardContentContaining(board.getSearchKeyword()); }
		 * else if(board.getSearchCondition().equals("WRITER")){ return
		 * boardRepository.findByBoardWriterContaining(board.getSearchKeyword()); } else
		 * { return boardRepository.findAll(); } } else {
		 */
		return boardRepository.findAll();
		//}
		
	}

	@Override
	public void insertBoard(Board board, List<BoardFile> uploadFileList) {
		//boardMapper.insertBoard(board);
		boardRepository.save(board);
		boardRepository.flush();
		
		for(BoardFile boardFile : uploadFileList) {
			boardFile.setBoard(board);
			
			int boardFileNo = boardFileRepository.getMaxFileNo(board.getBoardNo());
			boardFile.setBoardFileNo(boardFileNo);
			
			boardFileRepository.save(boardFile);
		}
	}

	@Override
	public Board updateBoard(Board board, List<BoardFile> uFileList) {
		// TODO Auto-generated method stub
		//boardMapper.updateBoard(board);
		boardRepository.save(board);
		
		if(uFileList.size() > 0) {
			for(int i = 0; i < uFileList.size(); i++) {
				if(uFileList.get(i).getBoardFileStatus().equals("U")) {
					boardFileRepository.save(uFileList.get(i));
				} else if(uFileList.get(i).getBoardFileStatus().equals("D")) {
					boardFileRepository.delete(uFileList.get(i));
				} else if(uFileList.get(i).getBoardFileStatus().equals("I")) {
					//추가한 파일들은 boardNo은 가지고 있지만 boardFileNo가 없는 상태라
					//boardFileNo를 추가
					int boardFileNo = boardFileRepository.getMaxFileNo(
							uFileList.get(i).getBoard().getBoardNo());
					
					uFileList.get(i).setBoardFileNo(boardFileNo);
					
					boardFileRepository.save(uFileList.get(i));
				}
			}
		}
		
		boardRepository.flush();
		
		return board;
	}

	@Override
	public void deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		//boardMapper.deleteBoard(boardNo);
		boardRepository.deleteById(boardNo);
	}

	@Override
	public void updateBoardCnt(int boardNo) {
		// TODO Auto-generated method stub
		boardRepository.updateBoardCnt(boardNo);
	}

	@Override
	public List<BoardFile> getBoardFileList(int boardNo) {
		Board board = Board.builder()
						   .boardNo(boardNo)
						   .build();
		
		return boardFileRepository.findByBoard(board);
	}
	
	@Override
	public Page<Board> getPageBoardList(Board board, Pageable pageable) {
		// TODO Auto-generated method stub
		//return boardMapper.getBoardList();	
		if(board.getSearchKeyword() != null && !board.getSearchKeyword().equals("")) {
			if(board.getSearchCondition().equals("ALL")) {
				return boardRepository.findByBoardTitleContainingOrBoardContentContainingOrBoardWriterContaining
						(board.getSearchKeyword(), 
						 board.getSearchKeyword(), 
						 board.getSearchKeyword(),
						 pageable);
			} else if(board.getSearchCondition().equals("TITLE")) {
				return boardRepository.findByBoardTitleContaining(board.getSearchKeyword(), pageable);
			} else if(board.getSearchCondition().equals("CONTENT")) {
				return boardRepository.findByBoardContentContaining(board.getSearchKeyword(), pageable);
			} else if(board.getSearchCondition().equals("WRITER")){
				return boardRepository.findByBoardWriterContaining(board.getSearchKeyword(), pageable);
			} else {
				return boardRepository.findAll(pageable);
			}
		} else {
			return boardRepository.findAll(pageable);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
