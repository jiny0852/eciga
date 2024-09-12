package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BoardDao;

import com.javaex.vo.BoardVo;


@Service
public class ServiceService {

	@Autowired
	private BoardDao boardDao;
	
	/* 회원가입 */
	public List<BoardVo> exeShowService(int uno) {
		System.out.println("MyService.exeShowService()");

		List<BoardVo> boardList = boardDao.selectBoard(uno);
		System.out.println(uno);
		
		return boardList;

	}
	
	
	
}