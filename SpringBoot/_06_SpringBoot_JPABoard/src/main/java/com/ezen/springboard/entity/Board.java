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

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="T_BOARD")
@Data
@SequenceGenerator(
		name="BoardSequenceGenerator",
		sequenceName="T_BOARD_SEQ",
		initialValue=1,
		allocationSize=1
)
@NoArgsConstructor//기본생성장
@AllArgsConstructor//모든 매개변수를 받는 생성자
@Builder//객체 생성
@DynamicInsert //insert 구문이 생성될 때 null값인 컬럼은 배제하고 구문생성
@DynamicUpdate //update 변경되지 않은 값들을 제외하고 구문 생성
public class Board {
	@Id
	@GeneratedValue(
			strategy=GenerationType.SEQUENCE,
			generator="BoardSequenceGenerator"
	)
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	//@Column(updatable = false)
	private String boardWriter;
	//@Column(updatable = false)
	private LocalDateTime boardRegdate = LocalDateTime.now();
	private int boardCnt = 0;
	@Transient
	private String searchCondition;
	@Transient
	private String searchKeyword;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
