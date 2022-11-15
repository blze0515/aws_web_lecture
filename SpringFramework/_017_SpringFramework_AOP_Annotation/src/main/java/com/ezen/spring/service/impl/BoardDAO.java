package com.ezen.spring.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ezen.spring.common.JDBCUtil;
import com.ezen.spring.vo.BoardVO;

//DAO: DB에 접근하여 쿼리를 수행하는 클래스
//DAO는 @Repository 어노테이션을 이용하여 객체 자동 생성
//@Controller, @Service, @Repository는 @Component을 상속
//각각 Controller, ServiceImpl, DAO클래스에 특화된 기능들을 Component보다 더 제공
@Repository
public class BoardDAO {
	//JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//SQL 쿼리
	private final String BOARD_INSERT = "INSERT INTO BOARD VALUES((SELECT IFNULL(MAX(A.BOARD_NO), 0) + 1 FROM BOARD A), ?, ?, ?, now(), 0)";
	private final String BOARD_UPDATE = "UPDATE BOARD SET BOARD_TITLE = ?, BOARD_CONTENT = ?, BOARD_WRITER = ? WHERE BOARD_NO = ?";
	private final String BOARD_DELETE = "DELETE FROM BOARD WHERE BOARD_NO = ?";
	private final String BOARD_GET = "SELECT * FROM BOARD WHERE BOARD_NO = ?";
	private final String BOARD_LIST = "SELECT * FROM BOARD ORDER BY BOARD_NO DESC";
	
	//CRUD 기능 구현
	//글 등록
	public void insertBoard(BoardVO boardVO) {
		System.out.println("JDBC로 insertBoard 기능구현");
		try {
			//DB 커넥션 가져오기
			conn = JDBCUtil.getConnection();
			
			//실행될 쿼리문 설정
			stmt = conn.prepareStatement(BOARD_INSERT);
			
			//쿼리문에 포함된 인자값 설정
			stmt.setString(1, boardVO.getBoardTitle());
			stmt.setString(2, boardVO.getBoardContent());
			stmt.setString(3, boardVO.getBoardWriter());
			
			//쿼리문 실행
			stmt.executeUpdate();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	//글 수정
	public void updateBoard(BoardVO boardVO) {
		System.out.println("JDBC로 updateBoard 기능구현");
		try {
			conn = JDBCUtil.getConnection();
			
			stmt = conn.prepareStatement(BOARD_UPDATE);
			
			stmt.setString(1, boardVO.getBoardTitle());
			stmt.setString(2, boardVO.getBoardContent());
			stmt.setString(3, boardVO.getBoardWriter());
			stmt.setInt(4, boardVO.getBoardNo());
			
			stmt.executeUpdate();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	//글 삭제
	public void deleteBoard(BoardVO boardVO) {
		System.out.println("JDBC로 deleteBoard 기능구현");
		try {
			conn = JDBCUtil.getConnection();
			
			stmt = conn.prepareStatement(BOARD_DELETE);
			
			stmt.setInt(1, boardVO.getBoardNo());
			
			stmt.executeUpdate();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	//글 상세 조회
	public BoardVO getBoard(BoardVO boardVO) {
		System.out.println("JDBC로 getBoard 기능구현");
		//조회해온 resultset 담을 BoardVO 객체 선언
		BoardVO board = new BoardVO();
		
		try {
			conn = JDBCUtil.getConnection();
			
			stmt = conn.prepareStatement(BOARD_GET);
			
			stmt.setInt(1, boardVO.getBoardNo());
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				//위에서 선언한 BoardVO객체에 조회 결과 세팅
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setBoardWriter(rs.getString("BOARD_WRITER"));
				board.setBoardRegdate(rs.getDate("BOARD_REGDATE"));
				board.setBoardCnt(rs.getInt("BOARD_CNT"));
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return board;
	}
	
	//글 목록 조회
	public List<BoardVO> getBoardList() {
		System.out.println("JDBC로 getBoardList 기능구현");
		
		//글 목록을 담아줄 List 선언
		List<BoardVO> boardList = new ArrayList<BoardVO>();	
		try {
			conn = JDBCUtil.getConnection();
			
			stmt = conn.prepareStatement(BOARD_LIST);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				//rs에서 BoardVO객체에 하나씩 담아서 List에 추가
				BoardVO board = new BoardVO();
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setBoardWriter(rs.getString("BOARD_WRITER"));
				board.setBoardRegdate(rs.getDate("BOARD_REGDATE"));
				board.setBoardCnt(rs.getInt("BOARD_CNT"));
				
				boardList.add(board);
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return boardList;
	}
}
