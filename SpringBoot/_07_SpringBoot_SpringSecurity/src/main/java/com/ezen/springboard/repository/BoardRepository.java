package com.ezen.springboard.repository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ezen.springboard.entity.Board;

@Transactional //@Modifying이 일어난 메소드가 실행된 후 바로 트랜잭션이 일어날 수 있도록
			   //Repository 자체를 @Transactional로 선언
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
	Page<Board> findByBoardTitleContaining(String searchKeyword, Pageable pageable);
	
	//SELECT * FROM T_BOARD_ WHERE BOARD_CONTENT LIKE '%searchKeyword%'
	Page<Board> findByBoardContentContaining(String searchKeyword, Pageable pageable);
	
	//SELECT * FROM T_BOARD_ WHERE BOARD_WRITER LIKE '%searchKeyword%'
	Page<Board> findByBoardWriterContaining(String searchKeyword, Pageable pageable);
	
	//SELECT * FROM T_BOARD_ 
	//	WHERE BOARD_TITLE LIKE '%searchKeyword1%'
	//	OR BOARD_CONTENT LIKE '%searchKeyword2%'
	//	OR BOARD_WRITER LIKE '%searchKeyword3%'
	Page<Board> findByBoardTitleContainingOrBoardContentContainingOrBoardWriterContaining(String searchKeyword1, String searchKeyword2, String searchKeyword3, Pageable pageable);

	@Modifying //데이터의 변경이 일어나는 @Query을 사용할 때는 @Modifying을 붙여준다.
	@Query(value="UPDATE T_BOARD SET BOARD_CNT = BOARD_CNT + 1 WHERE BOARD_NO = :boardNo", nativeQuery=true)
	void updateBoardCnt(@Param("boardNo") int boardNo);
	
	@Modifying
	@Query(value="UPDATE T_BOARD SET BOARD_TITLE = :#{#uBoard.boardTitle} WHERE BOARD_NO = :#{#uBoard.boardNo}", nativeQuery=true)
	void updateBoardTitle(@Param("uBoard") Board uBoard);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
