package com.ezen.springboard.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor//기본생성장
@AllArgsConstructor//모든 매개변수를 받는 생성자
@Builder//객체 생성
public class BoardDTO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	//자바스크립트, 자바단까지는 String으로 처리 후 DB에서 Date형식으로 변환해준다.
	//자바 -> 자바스크립트, 자바스크립트 -> 자바로 넘길 때 Date형식 처리가 매우 불편하다.
	private String boardRegdate;
	private int boardCnt;
	private String searchCondition;
	private String searchKeyword;
}
