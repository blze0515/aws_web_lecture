package com.ezen.springboard.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezen.springboard.entity.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {
	//JPA 규칙 메소드
	//find, read, query, count, get
	//엔티티의 변수명으로 조건을 달아줘야함
	//boardNo으로 List<BoardFile> 검색하려면
	//findbyBoardBoardNo(int boardNo);
	//	=>SELECT * FROM T_BOARD_FILE_ WHERE BOARD_NO = :boardNo
	//findbyBoard(Board board);
	//AND, OR 두 컬럼사이에 And Or를 붙여준다.
	//boardTitle, boardContent로 검색할 때
	//findbyBoardTitleAnd(Or)BoardContent(Board board)
	// => SELECT * FROM T_BOARD_ 
	//		WHERE BOARD_TITLE = :boardTitle AND BOARD_CONTNET = :boardContent
	//Containing == like '%keyword%'
	//SELECT * FROM T_BOARD_ WHERE BOARD_TITLE LIKE '%searchKeyword%'
	List<Board> findByBoardTitleContaining(String searchKeyword);
	
	//SELECT * FROM T_BOARD_ WHERE BOARD_CONTENT LIKE '%searchKeyword%'
	List<Board> findByBoardContentContaining(String searchKeyword);
	
	//SELECT * FROM T_BOARD_ WHERE BOARD_WRITER LIKE '%searchKeyword%'
	List<Board> findByBoardWriterContaining(String searchKeyword);
	
	//SELECT * FROM T_BOARD_ 
	//	WHERE BOARD_TITLE LIKE '%searchKeyword1%'
	//	OR BOARD_CONTENT LIKE '%searchKeyword2%'
	//	OR BOARD_WRITER LIKE '%searchKeyword3%'
	List<Board> findByBoardTitleContainingOrBoardContentContainingOrBoardWriterContaining(String searchKeyword1, String searchKeyword2, String searchKeyword3);

	
	
	
	
	
	
	
	
	
}
