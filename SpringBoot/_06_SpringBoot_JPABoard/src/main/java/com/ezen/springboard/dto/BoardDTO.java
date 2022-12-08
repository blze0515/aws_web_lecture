package com.ezen.springboard.dto;

import java.time.LocalDateTime;

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
	private LocalDateTime boardRegdate;
	private int boardCnt;
	private String searchCondition;
	private String searchKeyword;
}
