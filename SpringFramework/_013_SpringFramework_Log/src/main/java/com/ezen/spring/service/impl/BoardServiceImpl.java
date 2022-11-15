package com.ezen.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.spring.common.LogAdvice;
import com.ezen.spring.service.BoardService;
import com.ezen.spring.vo.BoardVO;

//ServiceImpl: 비즈니스 로직을 구현하는 클래스
//예를 들면 공과금 납부할 때 할인율 계산
//스마트폰의 시리얼번호 자동 생성...
//비즈니스 로직 처리가 완료된 데이터를 DB에 넣기 위해서 DAO객체를 의존성 주입하여 사용
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	//의존성 주입할 DAO 객체
	@Autowired
	BoardDAO boardDAO;
	private LogAdvice log;
	
	public BoardServiceImpl() {
		log = new LogAdvice();
	}
	
	//기본 게시판이라 따로 처리해줘야될 비즈니스 로직이 없어서
	//바로 DAO의 메소드를 호출하여 DB 조작
	@Override
	public void insertBoard(BoardVO boardVO) {
		log.printLog();
		boardDAO.insertBoard(boardVO);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		log.printLog();
		boardDAO.updateBoard(boardVO);
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		log.printLog();
		boardDAO.deleteBoard(boardVO);
	}
	
	@Override
	public BoardVO getBoard(BoardVO boardVO) {
		log.printLog();
		return boardDAO.getBoard(boardVO);
	}
	
	@Override
	public List<BoardVO> getBoardList() {
		log.printLog();
		return boardDAO.getBoardList();
	}
}
