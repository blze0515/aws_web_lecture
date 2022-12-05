package com.ezen.springboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder//생성자 함수 호출 안하고 객체를 만듬
public class TestDTO {
	private int testNo;
	private String testTitle;
}
