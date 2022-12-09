package com.ezen.springboard.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezen.springboard.entity.User;

public interface UserRepository extends JpaRepository<User, String>{

}
