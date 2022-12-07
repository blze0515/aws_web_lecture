package com.ezen.springboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezen.springboard.entity.BoardTest;

@Mapper
public interface BoardMapper {
	@Select("SELECT * FROM T_BOARD WHERE BOARD_NO = #{boardNo}")
	BoardTest getBoard(int boardNo);
	
	@Select("SELECT * FROM T_BOARD")
	List<BoardTest> getBoardList();
	
	@Insert("INSERT INTO T_BOARD ("
			+ "BOARD_NO,"
			+ "BOARD_TITLE,"
			+ "BOARD_CONTENT,"
			+ "BOARD_WRITER,"
			+ "BOARD_REGDATE,"
			+ "BOARD_CNT"
			+ ") VALUES ("
			+ "(SELECT IFNULL(MAX(A.BOARD_NO), 0) + 1 FROM T_BOARD A),"
			+ "#{boardTitle},"
			+ "#{boardContent},"
			+ "#{boardWriter},"
			+ "NOW(),"
			+ "0)")
	void insertBoard(BoardTest boardTest);
	
	@Update("UPDATE T_BOARD "
			+ "SET BOARD_TITLE = #{boardTitle},"
			+ "	   BOARD_CONTENT= #{boardContent}"
			+ "WHERE BOARD_NO = #{boardNo}")	
	void updateBoard(BoardTest boardTest);
	
	@Delete("DELETE FROM T_BOARD "
			+ "WHERE BOARD_NO = #{boardNo}")	
	void deleteBoard(int boardNo);
	
	
	
	
	
	
	
	
	
	
	
	
}
