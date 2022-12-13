package com.ezen.springboard.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="T_USER")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@DynamicInsert
@Data
public class User {
	@Id
	private String userId;
	
	private String userPw;
	private String userNm;
	private String userMail;
	private String userTel;
	private LocalDateTime userRegdate = LocalDateTime.now();
	@Column
	@ColumnDefault("'ROLE_USER")
	private String userRole;
	
	
	
	
	
	
	
	
	
	
	
	
	
}
