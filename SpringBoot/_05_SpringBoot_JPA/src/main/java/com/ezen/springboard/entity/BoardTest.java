package com.ezen.springboard.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

//Entity: 엔티티 객체로 지정(자동으로 테이블 생성됨)
@Entity
//Table: 테이블 명칭등 테이블 관련 설정
@Table(name="T_BOARD_TEST")
//SequenceGenerator: 시퀀스를 만들어주는 어노테이션
//name: 시퀀스 제네레이터의 명칭 지정
//sequenceName: 실제 DB에 생성될 시퀀스의 명칭 지정
//initialValue: 시퀀스의 시작 값 지정
//allocationSize: 시퀀스가 몇 씩 증가할지 지정
@SequenceGenerator(
		name="BoardTestSeqGenerator",
		sequenceName="T_BOARD_TEST_SEQ",
		initialValue=1,
		allocationSize=1
)
@Data
public class BoardTest {
	//컬럼들 정의
	//Id: 해당 컬럼을 PK로 지정
	@Id
	//키 값 생성 전략
	//@GeneratedValue: @GeneratedValue 어노테이션을 선언하지 않으면 키 값을 직접 할당
	//GenerationType의 속성
	//AUTO: 기본값, 데이터베이스에서 알아서 키 값 할당.
	//IDENTITY: AUTO_INCREMENT를 사용하여 키 값 할당.
	//SEQUENCE: 시퀀스를 생성하여 키 값을 할당. SEQUENCE 속성은 항상 SequenceGenerator와 함께 사용
	//TABLE: 키로 할당될 값들을 별도의 테이블을 만들어서 관리하는 방식.
	@GeneratedValue(
			strategy=GenerationType.SEQUENCE,
			generator="BoardTestSeqGenerator"
	)
	private int boardNo;
	
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	//default value 설정
	private LocalDateTime boardRegdate = LocalDateTime.now();
	//@Column: 컬럼에 대한 설정
	//name: 어느 컬럼과 매핑될 것인지
	//nullable: null 값 허용 여부
	//unique: UK 지정여부
	@Column(
			name="BOARD_CNT",
			nullable=false
	)
	private int boardCnt = 0;
	
	//엔티티에 컬럼으로 생성되지 않아도 될 변수
	@Transient
	private String boardFileStatus;
	
	@Transient
	private String searchCondition;
	
	@Transient
	private String searchKeyword;
	
	
	
	
	
	
	
	
	
	
	
}
