package com.ezen.springboard.vo;

import java.sql.Date;

public class BoardFileVO {
	private int boardNo;
	private int boardFileNo;
	//실제로 서버에 업로드될 파일의 이름
	//yyyyMMddhhmmss_파일명.확장자
	//동일한 파일명의 파일을 업로드하면 나중에 업로드된 파일로
	//덮어써지기 때문에 동일한 파일명의 파일을 분리하기 위해 설정
	private String boardFileNm;
	//파일명.확장자 -> 화면에 기존 파일명으로 표출하기 위한 컬럼
	private String boardOriginFileNm;
	//실제 운영되는 사이트들은 WEB서버와 WAS가 분리되어있다.
	//파일업로드는 거의 대부분 WAS에서 처리
	//WAS의 파일업로드 경로를 모를 경우 파일을 찾지 못하는 경우도 발생할 수 있다.
	private String boardFilePath;
	private Date boardFileRegdate;
	//미리보기 기능을 만들 때 이미지는 그 파일자체를 보여주고
	//이미지가 아닌 파일들은 문서모양의 아이콘을 띄우려고 만든 컬럼
	private String boardFileCate;
	private String boardFileStatus;
	private String newFileNm;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardFileNo() {
		return boardFileNo;
	}
	public void setBoardFileNo(int boardFileNo) {
		this.boardFileNo = boardFileNo;
	}
	public String getBoardFileNm() {
		return boardFileNm;
	}
	public void setBoardFileNm(String boardFileNm) {
		this.boardFileNm = boardFileNm;
	}
	public String getBoardOriginFileNm() {
		return boardOriginFileNm;
	}
	public void setBoardOriginFileNm(String boardOriginFileNm) {
		this.boardOriginFileNm = boardOriginFileNm;
	}
	public String getBoardFilePath() {
		return boardFilePath;
	}
	public void setBoardFilePath(String boardFilePath) {
		this.boardFilePath = boardFilePath;
	}
	public Date getBoardFileRegdate() {
		return boardFileRegdate;
	}
	public void setBoardFileRegdate(Date boardFileRegdate) {
		this.boardFileRegdate = boardFileRegdate;
	}
	public String getBoardFileCate() {
		return boardFileCate;
	}
	public void setBoardFileCate(String boardFileCate) {
		this.boardFileCate = boardFileCate;
	}
	public String getBoardFileStatus() {
		return boardFileStatus;
	}
	public void setBoardFileStatus(String boardFileStatus) {
		this.boardFileStatus = boardFileStatus;
	}
	public String getNewFileNm() {
		return newFileNm;
	}
	public void setNewFileNm(String newFileNm) {
		this.newFileNm = newFileNm;
	}
	
	@Override
	public String toString() {
		return "BoardFileVO [boardNo=" + boardNo + ", boardFileNo=" + boardFileNo + ", boardFileNm=" + boardFileNm
				+ ", boardOriginFileNm=" + boardOriginFileNm + ", boardFilePath=" + boardFilePath
				+ ", boardFileRegdate=" + boardFileRegdate + ", boardFileCate=" + boardFileCate + ", boardFileStatus="
				+ boardFileStatus + ", newFileNm=" + newFileNm + "]";
	}
}
