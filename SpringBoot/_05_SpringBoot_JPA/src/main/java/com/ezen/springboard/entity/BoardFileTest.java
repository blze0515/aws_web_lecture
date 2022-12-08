package com.ezen.springboard.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="T_BOARD_FILE_TEST")
@Data
//다중 pk 매핑방식 2가지
//1. Id클래스 사용
//2. Embeded Id 사용
@IdClass(BoardFileTestId.class)
public class BoardFileTest {
	@Id
	//foreign관계 매핑: 관계를 지정하는 엔티티 기준
	//				  관계 생성될 엔티티를 객체로 가지고 있어야 한다.
	//@OneToOne: 일대일
	//@ManyToOne: 다대일
	//@OneToMany: 일대다
	@ManyToOne
	//@JoinColumn: foreign key로 가져올 컬럼을 지정
	@JoinColumn(name="BOARD_NO")
	private BoardTest boardTest;
	//private int boardNo;
	//private int boardNo;
	
	@Id
	private int boardFileNo;
	
	private String fileNm;
	private String originFileNm;
	private String filePath;
	private LocalDateTime fileRegdate = LocalDateTime.now();
	
	
	
	
	
	
	
	
	
	
	
}
