package com.ezen.springboard.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springboard.vo.BoardFileVO;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertBoard(BoardVO boardVO, List<BoardFileVO> fileList) {
		mybatis.insert("BoardDAO.insertBoard", boardVO);
		
		if(fileList.size() > 0) {
			//게시글 번호를 담아주는 작업
			for(BoardFileVO boardFile : fileList) {
				boardFile.setBoardNo(boardVO.getBoardNo());
				
				//List를 매퍼로 보내는 방식1: 하나씩 꺼내서 매퍼의 쿼리 호출
				//mybatis.insert("BoardDAO.insertBoardFile", boardFile);			
			}
			//List를 매퍼로 보내는 방식2: 리스트를 보내서 매퍼의 쿼리 호출
			//mybatis의 foreach구문을 사용하여 처리
			mybatis.insert("BoardDAO.insertBoardFileList", fileList);
		}
	}
	
	public List<BoardVO> getBoardList(Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		pMap.put("boardSearch", paramMap);
		
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		pMap.put("cri", cri);
		
		return mybatis.selectList("BoardDAO.getBoardList", pMap);
	}
	
	
	
	public BoardVO getBoard(int boardNo) {
		return mybatis.selectOne("BoardDAO.getBoard", boardNo);
	}
	
	public void updateBoardCnt(int boardNo) {
		mybatis.update("BoardDAO.updateBoardCnt", boardNo);
	}
	
	public void updateBoard(BoardVO boardVO, List<BoardFileVO> uFileList) {
		mybatis.update("BoardDAO.updateBoard", boardVO);
		
		if(uFileList.size() > 0) {
			for(int i = 0; i < uFileList.size(); i++) {
				if(uFileList.get(i).getBoardFileStatus().equals("U")) {
					mybatis.update("BoardDAO.updateBoardFile", uFileList.get(i));
				} else if(uFileList.get(i).getBoardFileStatus().equals("D")) {
					mybatis.delete("BoardDAO.deleteBoardFile", uFileList.get(i));
				} else if(uFileList.get(i).getBoardFileStatus().equals("I")) {
					mybatis.insert("BoardDAO.insertBoardFile", uFileList.get(i));
				}
			}
		}
	}
	
	public void deleteBoard(int boardNo) {
		mybatis.delete("BoardDAO.deleteBoard", boardNo);
	}
	
	public int getBoardTotalCnt(Map<String, String> paramMap) {
		return mybatis.selectOne("BoardDAO.getBoardTotalCnt", paramMap);
	}
	
	public List<BoardFileVO> getBoardFileList(int boardNo) {
		return mybatis.selectList("BoardDAO.getBoardFileList", boardNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
