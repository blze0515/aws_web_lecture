package com.ezen.springboard.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezen.springboard.entity.BoardTest;

public interface BoardTestRepository extends JpaRepository<BoardTest, Integer> {
	//JPA 규칙 메소드
	//find, read, query, count, get
	//엔티티의 변수명으로 조건을 달아줘야함
	//boardNo으로 List<BoardFileTest> 검색하려면
	//findbyBoardTestBoardNo(int boardNo);
	//	=>SELECT * FROM T_BOARD_FILE_TEST WHERE BOARD_NO = :boardNo
	//findbyBoardTest(BoardTest boardTest);
	//AND, OR 두 컬럼사이에 And Or를 붙여준다.
	//boardTitle, boardContent로 검색할 때
	//findbyBoardTitleAnd(Or)BoardContent(BoardTest boardTest)
	// => SELECT * FROM T_BOARD_TEST 
	//		WHERE BOARD_TITLE = :boardTitle AND BOARD_CONTNET = :boardContent
	//Containing == like '%keyword%'
	//SELECT * FROM T_BOARD_TEST WHERE BOARD_TITLE LIKE '%searchKeyword%'
	List<BoardTest> findByBoardTitleContaining(String searchKeyword);
	
	//SELECT * FROM T_BOARD_TEST WHERE BOARD_CONTENT LIKE '%searchKeyword%'
	List<BoardTest> findByBoardContentContaining(String searchKeyword);
	
	//SELECT * FROM T_BOARD_TEST WHERE BOARD_WRITER LIKE '%searchKeyword%'
	List<BoardTest> findByBoardWriterContaining(String searchKeyword);
	
	//SELECT * FROM T_BOARD_TEST 
	//	WHERE BOARD_TITLE LIKE '%searchKeyword1%'
	//	OR BOARD_CONTENT LIKE '%searchKeyword2%'
	//	OR BOARD_WRITER LIKE '%searchKeyword3%'
	List<BoardTest> findByBoardTitleContainingOrBoardContentContainingOrBoardWriterContaining(String searchKeyword1, String searchKeyword2, String searchKeyword3);
	
	
	
	
	
	
	
	
	
	
	
}
