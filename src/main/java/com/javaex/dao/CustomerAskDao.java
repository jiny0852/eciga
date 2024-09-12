package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CustomerAskVo;

@Repository
public class CustomerAskDao {

    @Autowired
    private SqlSession sqlSession;

 // 문의 리스트 출력
    public List<CustomerAskVo> selectInquiryList(Map<String, Object> paramMap) {
        return sqlSession.selectList("customerAsk.selectInquiryList", paramMap);
    }

    // 총 문의 수
    public int getTotalCount(Map<String, Object> paramMap) {
        return sqlSession.selectOne("customerAsk.getTotalCount", paramMap);
    }

    // 문의 상세 조회
    public CustomerAskVo selectInquiryDetail(int inquiryNo) {
        return sqlSession.selectOne("customerAsk.selectInquiryDetail", inquiryNo);
    }
    
    // 문의 답변 업데이트
    public int updateInquiryAnswer(CustomerAskVo inquiry) {
        return sqlSession.update("customerAsk.updateInquiryAnswer", inquiry);
    }
    
    // 문의 답변 내용 확인
    public CustomerAskVo selectInquiryByNo(int inquiryNo) {
        return sqlSession.selectOne("customerAsk.selectInquiryByNo", inquiryNo);
    }
    
}