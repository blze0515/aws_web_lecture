package com.ezen.springboard.dto;

import java.time.LocalDateTime;

import javax.persistence.Id;
import javax.persistence.Transient;

import com.ezen.springboard.entity.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardFileDTO {
	private int boardNo;
	private int boardFileNo;
	private String boardFileNm;
	private String boardOriginFileNm;
	private String boardFilePath;
	private String boardFileRegdate;
	private String boardFileCate;
	private String boardFileStatus;
	private String newFileNm;
	
	
	
	
	
	
}
