package com.ezen.spring.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//DAO의 각 메소드마다 공통적으로 사용될 기능들 정의
//getConnection, close 등 
public class JDBCUtil {
	public static Connection getConnection() {
		try {
			//사용할 DBMS의 Driver 로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//DriverManager 객체를 이용해서 Connection을 가져와서 리턴
			//getConnection메소드의 매개변수로 DB의 url, username, password를 넘겨준다.
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/studydb?serverTimezone=UTC", "study", "!ezen1234");
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	//2개의 close 메소드
	//ResultSet없는 메소드(insertBoard, updateBaord, deleteBoard)
	//ResultSet있는 메소드(getBoard, getBoardList)
	
	//ResultSet없는 메소드(insertBoard, updateBaord, deleteBoard)의 close
	public static void close(PreparedStatement stmt, Connection conn) {
		if(stmt != null) {
			try {
				if(!stmt.isClosed()) {
					stmt.close();
				}
			} catch(Exception e) {
				System.out.println(e.getMessage());
			} finally {
				stmt = null;
			}
		}
		
		if(conn != null) {
			try {
				if(!conn.isClosed()) {
					conn.close();
				}
			} catch(Exception e) {
				System.out.println(e.getMessage());
			} finally {
				conn = null;
			}
		}
	}
	
	//ResultSet있는 메소드(getBoard, getBoardList)의 close
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		if(rs != null) {
			try {
				if(!rs.isClosed()) {
					rs.close();
				}
			} catch(Exception e) {
				System.out.println(e.getMessage());
			} finally {
				rs = null;
			}
		}
		
		if(stmt != null) {
			try {
				if(!stmt.isClosed()) {
					stmt.close();
				}
			} catch(Exception e) {
				System.out.println(e.getMessage());
			} finally {
				stmt = null;
			}
		}
		
		if(conn != null) {
			try {
				if(!conn.isClosed()) {
					conn.close();
				}
			} catch(Exception e) {
				System.out.println(e.getMessage());
			} finally {
				conn = null;
			}
		}
	}
}
