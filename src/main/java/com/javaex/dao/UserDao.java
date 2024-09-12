package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	// 모든 유저 정보 가져오기
	/*
	 * public List<UserVo> getUserList() { return
	 * sqlSession.selectList("user.getUserList"); }
	 */
	// 회원 목록 조회 (페이징 + 검색)
	public List<UserVo> selectUserList(Map<String, Object> map) {
		return sqlSession.selectList("user.selectUserList", map);
	}

	// 전체 회원 수 조회
	public int getTotalUserCount(String keyword, String status) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("keyword", keyword);
		paramMap.put("status", status);
		return sqlSession.selectOne("user.getTotalUserCount", paramMap);
	}
	
	
	//형님
	//////////////////////////////
	//현오
	
	
	
	/* 회원가입 */
	public int insertUser(UserVo userVo) {
		System.out.println("UserDao.insertUser()");
		
		int count = sqlSession.insert("user.insert", userVo);
		return count;
	}
	
	/* 로그인 */
	public UserVo selectUser(UserVo userVo) {
		System.out.println("UserDao.selectUser()");
		
		UserVo authUser = sqlSession.selectOne("user.selectByIdPw", userVo);
		return authUser;
	}
	
	//id로 데이터가져오기-id사용여부 체크할때 사용
	public int selecUserById(String id) {
		System.out.println("UserDao.selecUserById()");
		
		int count = sqlSession.selectOne("user.selectById", id );
		return count;
	}
	
	
	
	
	

}
