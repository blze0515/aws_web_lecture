package com.ezen.springboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ezen.springboard.dto.BoardDTO;

@Mapper
public interface BoardMapper {
	@Select("SELECT * FROM T_BOARD WHERE BOARD_NO = #{boardNo}")
	BoardDTO getBoard(int boardNo);
	
	@Select("SELECT * FROM T_BOARD")
	List<BoardDTO> getBoardList();
}
