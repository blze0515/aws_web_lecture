package com.ezen.springboard.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ezen.springboard.entity.CustomUserDetails;
import com.ezen.springboard.entity.User;
import com.ezen.springboard.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if(userRepository.findById(username).isEmpty()) {
			return null;
		} else {
			User user = userRepository.findById(username).get();
			
			return CustomUserDetails.builder()
									.user(user)
									.build();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
