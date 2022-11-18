package com.ezen.springboard.service;

import java.util.List;
import java.util.Map;

import com.ezen.springboard.vo.NameVO;

public interface HomeService {
	void insertName(NameVO nameVO);
	
	List<NameVO> getNameList();
	
	NameVO getName(int nameNo);
	
	void deleteName(int nameNo);
	
	void updateName(Map<String, Object> paramMap);
}
