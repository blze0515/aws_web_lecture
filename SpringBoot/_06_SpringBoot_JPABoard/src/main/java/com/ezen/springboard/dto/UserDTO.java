package com.ezen.springboard.dto;

import java.time.LocalDateTime;

import javax.persistence.Column;

import org.hibernate.annotations.ColumnDefault;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDTO {
	private String userId;
	private String userPw;
	private String userNm;
	private String userMail;
	private String userTel;
	private String userRegDate;
	private String userRole;
}
