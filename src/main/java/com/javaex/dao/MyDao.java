package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVo;
import com.javaex.vo.PurchaseVo;
import com.javaex.vo.UserVo;

@Repository
public class MyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 회원정보 1개 가져오기 */
	public UserVo selectInfo(int uno) {
		System.out.println("UserInfoDao.selectInfo()");

		UserVo userVo = sqlSession.selectOne("user.selectInfo", uno);

		return userVo;
	}

	/* 회원정보 수정 */
	public int modifyUser(UserVo userVo) {
		System.out.println("UserInfoDao.modifyUser()");

		int count = sqlSession.update("user.update", userVo);

		return count;
	}
	
	public List<PurchaseVo> selectPurchase(int uno) {

		List<PurchaseVo> purchaseList = sqlSession.selectList("my.selectPurchase", uno);
		
		return purchaseList;
	}
	
	public List<BoardVo> selectBoard(int uno) { 
		System.out.println(uno);
		List<BoardVo> boardList = sqlSession.selectList("my.selectBoard", uno);
		
		System.out.println(boardList.toString());
		System.out.println("셀렉후");
		return boardList;
	}
	
    public void update(PurchaseVo purchaseVo) {
        // MyBatis를 이용한 배송 상태 업데이트 쿼리 호출
    	int order_no = purchaseVo.getOrder_no();
    	System.out.println("되누?2");
    	
        sqlSession.update("my.update", order_no);
    	
    }
	
	
}
