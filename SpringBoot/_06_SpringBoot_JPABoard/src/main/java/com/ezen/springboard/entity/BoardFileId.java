package com.ezen.springboard.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class BoardFileId implements Serializable {
	private int board;
	private int boardFileNo;
}
