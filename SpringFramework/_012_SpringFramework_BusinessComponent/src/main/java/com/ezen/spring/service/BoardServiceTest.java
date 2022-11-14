package com.ezen.spring.service;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.ezen.spring.vo.BoardVO;

public class BoardServiceTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1. 스프링 컨테이너 구동
		AbstractApplicationContext applicationContext = 
				new GenericXmlApplicationContext("root-context.xml");
		
		//2. BoardServiceImpl 객체를 Lookup
		BoardService boardService = 
				(BoardService)applicationContext.getBean("boardService");
		
		//3. 글 등록 테스트
		BoardVO boardVO = new BoardVO();
		boardVO.setBoardTitle("제목");
		boardVO.setBoardContent("글 등록 테스트");
		boardVO.setBoardWriter("관리자");
		
		boardService.insertBoard(boardVO);
		
		//4. 글 목록 조회 테스트
		List<BoardVO> boardList = boardService.getBoardList();
		for(int i = 0; i < boardList.size(); i++) {
			System.out.println(boardList.get(i).toString());
		}
		
		//5. 스프링 컨테이너 종료
		applicationContext.close();
	}

}
