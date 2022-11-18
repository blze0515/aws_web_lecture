package com.ezen.springboard.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springboard.service.HomeService;
import com.ezen.springboard.vo.NameVO;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private HomeDAO homeDAO;
	
	@Override
	public void insertName(NameVO nameVO) {
		homeDAO.insertName(nameVO);
	}
	
	@Override
	public List<NameVO> getNameList() {
		return homeDAO.getNameList();
	}
	
	@Override
	public NameVO getName(int nameNo) {
		return homeDAO.getName(nameNo);
	}
	
	@Override
	public void deleteName(int nameNo) {
		homeDAO.deleteName(nameNo);
	}
	
	public void updateName(Map<String, Object> paramMap) {
		homeDAO.updateName(paramMap);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
