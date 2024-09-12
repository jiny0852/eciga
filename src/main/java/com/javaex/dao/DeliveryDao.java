package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.DeliveryVo;

@Repository
public class DeliveryDao {

	@Autowired
	private SqlSession sqlSession;

	// 배송 목록 조회 (페이징 및 검색)
	public List<DeliveryVo> selectDeliveryList(Map<String, Object> map) {
		return sqlSession.selectList("delivery.selectDeliveryList", map);
	}

	// 배송 전체 데이터 개수 조회
	public int getTotalDeliveryCount(String keyword, String status) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("keyword", keyword);
		paramMap.put("status", status);
		return sqlSession.selectOne("delivery.getTotalDeliveryCount", paramMap);
	}
	
	// 배송 상태 업데이트 DAO 메소드
    public void updateDeliveryStatus(DeliveryVo deliveryVo) {
        // MyBatis를 이용한 배송 상태 업데이트 쿼리 호출
        sqlSession.update("delivery.updateDeliveryStatus", deliveryVo);
    }
}
