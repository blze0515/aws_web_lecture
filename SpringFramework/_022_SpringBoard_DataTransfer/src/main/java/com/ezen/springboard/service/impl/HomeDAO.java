package com.ezen.springboard.service.impl;

import java.util.List;
import java.util.Map;

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
	
	public void deleteName(int nameNo) {
		//파라미터가 두개 이상 필요할 때는
		//Map이나 VO 담은 후에 쿼리로 전달
		mybatis.delete("HomeDAO.deleteName", nameNo);
	}
	
	public void updateName(Map<String, Object> paramMap) {
		mybatis.update("HomeDAO.updateName", paramMap);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
