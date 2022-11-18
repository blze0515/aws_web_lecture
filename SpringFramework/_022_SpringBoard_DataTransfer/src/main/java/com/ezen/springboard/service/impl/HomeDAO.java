package com.ezen.springboard.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springboard.vo.NameVO;

@Repository
public class HomeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertName(NameVO nameVO) {
		mybatis.insert("HomeDAO.insertName", nameVO);
	}
	
	public List<NameVO> getNameList() {
		return mybatis.selectList("HomeDAO.getNameList");
	}
	
	public NameVO getName(int nameNo) {
		return mybatis.selectOne("HomeDAO.getName", nameNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
