package com.ezen.spring.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ezen.spring.vo.BoardVO;

public class BoardRowMapper implements RowMapper<BoardVO> {
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardVO board = new BoardVO();
		
		board.setBoardNo(rs.getInt("BOARD_NO"));
		board.setBoardTitle(rs.getString("BOARD_TITLE"));
		board.setBoardContent(rs.getString("BOARD_CONTENT"));
		board.setBoardWriter(rs.getString("BOARD_WRITER"));
		board.setBoardRegdate(rs.getDate("BOARD_REGDATE"));
		board.setBoardCnt(rs.getInt("BOARD_CNT"));
		
		return board;
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
