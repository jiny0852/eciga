package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CustomerAskDao;
import com.javaex.vo.CustomerAskVo;

@Service
public class CustomerAskService {

    @Autowired
    private CustomerAskDao customerAskDao;
    
    /* 1:1 고객 문의 게시판 리스트 */
	/*
	 * public Map<String, Object> getInquiryList(int crtPage, String keyword, String
	 * status, String startDate, String endDate) { //한페이지에 10개씩 리스트 출력 int listCnt =
	 * 30; //시작 줄 번호 int startRowNo = (crtPage - 1) * listCnt;
	 * 
	 * Map<String, Object> paramMap = new HashMap<>(); paramMap.put("startRowNo",
	 * startRowNo); paramMap.put("listCnt", listCnt); paramMap.put("keyword",
	 * keyword.isEmpty() ? "" : "%" + keyword + "%"); paramMap.put("status",
	 * status.isEmpty() ? null : status); paramMap.put("startDate", startDate);
	 * paramMap.put("endDate", endDate);
	 * 
	 * List<CustomerAskVo> inquiryList = customerAskDao.selectInquiryList(paramMap);
	 * int totalCnt = customerAskDao.getTotalCount(paramMap);
	 * 
	 * int pageBtnCount = 5; int endPageBtnNo = (int) Math.ceil(crtPage / (double)
	 * pageBtnCount) * pageBtnCount; int startPageBtnNo = endPageBtnNo -
	 * (pageBtnCount - 1); boolean next = (listCnt * endPageBtnNo < totalCnt);
	 * boolean prev = (startPageBtnNo != 1);
	 * 
	 * Map<String, Object> pMap = new HashMap<>(); pMap.put("inquiryList",
	 * inquiryList); pMap.put("prev", prev); pMap.put("next", next);
	 * pMap.put("startPageBtnNo", startPageBtnNo); pMap.put("endPageBtnNo",
	 * endPageBtnNo); pMap.put("crtPage", crtPage);
	 * 
	 * 
	 * 
	 * return pMap; }
	 */
    public Map<String, Object> getInquiryList(int crtPage, String keyword, String status, String startDate, String endDate) {
        int listCnt = 10;
        int startRowNo = (crtPage - 1) * listCnt;

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("startRowNo", startRowNo);
        paramMap.put("listCnt", listCnt);
        paramMap.put("keyword", keyword.isEmpty() ? "" : "%" + keyword + "%");
        paramMap.put("status", status.isEmpty() ? null : status);
        paramMap.put("startDate", (startDate == null || startDate.isEmpty()) ? null : startDate); // null 처리
        paramMap.put("endDate", (endDate == null || endDate.isEmpty()) ? null : endDate); // null 처리

        List<CustomerAskVo> inquiryList = customerAskDao.selectInquiryList(paramMap);
        int totalCnt = customerAskDao.getTotalCount(paramMap);

        int pageBtnCount = 5;
        int endPageBtnNo = (int) Math.ceil(crtPage / (double) pageBtnCount) * pageBtnCount;
        int startPageBtnNo = endPageBtnNo - (pageBtnCount - 1);
        boolean next = (listCnt * endPageBtnNo < totalCnt);
        boolean prev = (startPageBtnNo != 1);

        Map<String, Object> pMap = new HashMap<>();
        pMap.put("inquiryList", inquiryList);
        pMap.put("prev", prev);
        pMap.put("next", next);
        pMap.put("startPageBtnNo", startPageBtnNo);
        pMap.put("endPageBtnNo", endPageBtnNo);
        pMap.put("crtPage", crtPage);

        return pMap;
    }

    
 // 문의 상세 조회
    public CustomerAskVo getInquiryDetail(int inquiryNo) {
        return customerAskDao.selectInquiryDetail(inquiryNo);
    }
    
 // 특정 문의 번호로 답변 내용 조회
    public CustomerAskVo getInquiryByNo(int inquiryNo) {
        return customerAskDao.selectInquiryByNo(inquiryNo);
    }


    // 문의 답변 업데이트
    public boolean updateInquiryAnswer(CustomerAskVo customerAskVo) {
        int updatedRows = customerAskDao.updateInquiryAnswer(customerAskVo);
        
        // 업데이트된 행이 1 이상일 경우 성공 처리
        return updatedRows > 0;
    }

    
    
}