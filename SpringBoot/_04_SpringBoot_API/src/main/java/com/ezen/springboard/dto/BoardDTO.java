package com.ezen.springboard.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private Date boardRegdate;
	private int boardCnt;
}
