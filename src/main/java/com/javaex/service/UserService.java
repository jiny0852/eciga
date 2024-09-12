package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	// 모든 유저 정보 가져오기
	/*
	 * public List<UserVo> getUserList() { return userDao.getUserList(); }
	 */
	// 회원 목록 조회 (페이징 + 검색)
	public Map<String, Object> getUserList(int crtPage, String keyword, String status) {
        int listCnt = 10;  // 한 페이지에 10명씩 출력
        crtPage = (crtPage > 0) ? crtPage : 1;  // 현재 페이지 계산
        int startRowNo = (crtPage - 1) * listCnt;

        // 검색 및 페이징 처리
        Map<String, Object> limitMap = new HashMap<>();
        limitMap.put("startRowNo", startRowNo);
        limitMap.put("listCnt", listCnt);
        limitMap.put("keyword", keyword);
        limitMap.put("status", status);

        List<UserVo> userList = userDao.selectUserList(limitMap);
        int totalCnt = userDao.getTotalUserCount(keyword, status);

        // 페이징 처리
        int pageBtnCount = 5;
        int endPageBtnNo = (int) Math.ceil(crtPage / (double) pageBtnCount) * pageBtnCount;
        int startPageBtnNo = endPageBtnNo - (pageBtnCount - 1);
        boolean next = (listCnt * endPageBtnNo < totalCnt);
        boolean prev = (startPageBtnNo != 1);

        // 결과 맵에 데이터 저장
        Map<String, Object> pMap = new HashMap<>();
        pMap.put("userList", userList);
        pMap.put("prev", prev);
        pMap.put("next", next);
        pMap.put("startPageBtnNo", startPageBtnNo);
        pMap.put("endPageBtnNo", endPageBtnNo);
        pMap.put("crtPage", crtPage);

        return pMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//형님
	////////////////
	//현오
	
	
	/* 회원가입 */
	public int exeJoin(UserVo userVo) {
		System.out.println("UserService.exeJoin()");
		
		int count = userDao.insertUser(userVo);
		return count;
	}
	
	/* 로그인 */
	public UserVo exeLogin(UserVo userVo) {
		System.out.println("UserService.exeJoin()");
		
		UserVo authUser = userDao.selectUser(userVo);
		return authUser;
		
	}
	
	/* 아이디체크 */
	public boolean exeIdCheck(String id) {
		System.out.println("UserService.exeIdCheck()");
		
		int count = userDao.selecUserById(id);
		
		if(count >= 1) {
			return false;
			
		}else {
			return true;
			
		}
		
		
	}
	
	
	
	
	
	
	

}
