package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.DeliveryDao;
import com.javaex.vo.DeliveryVo;

@Service
public class DeliveryService {

	@Autowired
	private DeliveryDao deliveryDao;

	public Map<String, Object> getDeliveryList(int crtPage, String keyword, String status) {
		int listCnt = 10;  // 한 페이지에 보여줄 리스트 개수
		crtPage = (crtPage > 0) ? crtPage : 1;
		int startRowNo = (crtPage - 1) * listCnt;

		Map<String, Object> limitMap = new HashMap<>();
		limitMap.put("startRowNo", startRowNo);
		limitMap.put("listCnt", listCnt);
		limitMap.put("keyword", keyword);
		limitMap.put("status", status);

		List<DeliveryVo> deliveryList = deliveryDao.selectDeliveryList(limitMap);
		int totalCnt = deliveryDao.getTotalDeliveryCount(keyword, status);

		// 페이징 처리
		int pageBtnCount = 5;
		int endPageBtnNo = (int) Math.ceil(crtPage / (double) pageBtnCount) * pageBtnCount;
		int startPageBtnNo = endPageBtnNo - (pageBtnCount - 1);
		boolean next = (listCnt * endPageBtnNo < totalCnt);
		boolean prev = (startPageBtnNo != 1);

		Map<String, Object> pMap = new HashMap<>();
		pMap.put("deliveryList", deliveryList);
		pMap.put("prev", prev);
		pMap.put("next", next);
		pMap.put("startPageBtnNo", startPageBtnNo);
		pMap.put("endPageBtnNo", endPageBtnNo);
		pMap.put("crtPage", crtPage);

		return pMap;
	}
	// 배송 상태 업데이트 서비스 메소드
    public boolean updateDeliveryStatus(DeliveryVo deliveryVo) {
        try {
            // DAO를 통해 배송 상태 업데이트
            deliveryDao.updateDeliveryStatus(deliveryVo);
            return true;  // 성공하면 true 반환
        } catch (Exception e) {
            e.printStackTrace();
            return false;  // 실패하면 false 반환
        }
    }
}
