package com.ezen.springboard.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
//security의 filterchain을 구현하기 위한 어노테이션
@EnableWebSecurity
public class SecurityConfiguration {
	//필터 체인 구현(HttpSecurity 객체 사용)
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		//권한에 따른 요청주소 매핑
		http.authorizeHttpRequests().antMatchers("/").permitAll();
		
		return http.build();
	}
}
