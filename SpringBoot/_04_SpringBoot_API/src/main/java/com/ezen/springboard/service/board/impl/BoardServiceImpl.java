package com.ezen.springboard.service.board.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springboard.dto.BoardDTO;
import com.ezen.springboard.mapper.BoardMapper;
import com.ezen.springboard.service.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public BoardDTO getBoard(int boardNo) {
		return boardMapper.getBoard(boardNo);
	}
}
