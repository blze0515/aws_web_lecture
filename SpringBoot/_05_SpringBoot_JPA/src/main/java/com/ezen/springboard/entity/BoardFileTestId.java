package com.ezen.springboard.entity;

import java.io.Serializable;

import lombok.Data;

@Data
//IdClass는 항상 Serializable을 상속받아 구현
public class BoardFileTestId implements Serializable {
	//IdClass가 참조될 원본 테이블의 키 변수명과 일치
	//형태는 실제로 들어갈 데이터의 형태
	private int boardTest;
	private int boardFileNo;
}
