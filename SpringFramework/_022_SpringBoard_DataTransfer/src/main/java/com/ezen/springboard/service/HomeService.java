package com.ezen.springboard.service;

import java.util.List;

import com.ezen.springboard.vo.NameVO;

public interface HomeService {
	void insertName(NameVO nameVO);
	
	List<NameVO> getNameList();
}
