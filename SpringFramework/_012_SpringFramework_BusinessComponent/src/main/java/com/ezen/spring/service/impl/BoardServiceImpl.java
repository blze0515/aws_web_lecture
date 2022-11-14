package com.ezen.spring.service.impl;

import java.util.List;

import com.ezen.spring.service.BoardService;
import com.ezen.spring.vo.BoardVO;

//ServiceImpl: 비즈니스 로직을 구현하는 클래스
//예를 들면 공과금 납부할 때 할인율 계산
//스마트폰의 시리얼번호 자동 생성...
//비즈니스 로직 처리가 완료된 데이터를 DB에 넣기 위해서 DAO객체를 의존성 주입하여 사용
public class BoardServiceImpl implements BoardService {
	@Override
	public void insertBoard(BoardVO boardVO) {
		
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		
	}
	
	@Override
	public BoardVO getBoard(BoardVO boardVO) {
		return null;
	}
	
	@Override
	public List<BoardVO> getBoardList() {
		return null;
	}
}
