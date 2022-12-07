package com.ezen.springboard.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ezen.springboard.entity.BoardTest;

public interface BoardTestRepository extends JpaRepository<BoardTest, Integer> {

}
