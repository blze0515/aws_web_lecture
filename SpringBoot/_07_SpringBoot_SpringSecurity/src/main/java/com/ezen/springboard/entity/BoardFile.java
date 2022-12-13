package com.ezen.springboard.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="T_BOARD_FILE")
@Data
@IdClass(BoardFileId.class)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardFile {
	@Id
	@ManyToOne
	@JoinColumn(name="BOARD_NO")
	private Board board;
	@Id
	private int boardFileNo;
	private String boardFileNm;
	private String boardOriginFileNm;
	private String boardFilePath;
	private LocalDateTime boardFileRegdate = LocalDateTime.now();
	private String boardFileCate;
	@Transient
	private String boardFileStatus;
	@Transient
	private String newFileNm;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
