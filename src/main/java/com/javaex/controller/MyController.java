package com.javaex.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MyService;
import com.javaex.service.UserService;
import com.javaex.vo.BoardVo;
import com.javaex.vo.PurchaseVo;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller

public class MyController {

	@Autowired
	private MyService myService;
	
//	
	@RequestMapping(value = "/mypage/myorder", method = { RequestMethod.GET, RequestMethod.POST })
	public String purchaseListForm(HttpSession session, Model model) {
		System.out.println("UserInfoController.purchaseListForm()");

		// 로그인한 session 값을 객체로 가져오기
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		// 회원의 세션번호로 구매내역 불러오기
		// 한사람이 여러개를 사면 결과값이 1개 이상이므로
		List<PurchaseVo> purchaseList ;
		
		purchaseList = myService.exeUserPurchase(authUser.getUno());

		model.addAttribute("purchaseList", purchaseList);

		return "mypage/myOrder";
	}
	
	@RequestMapping(value = "/mypage/myservice", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardList(HttpSession session, Model model) {
		System.out.println("UserInfoController.purchaseListForm()");

		// 로그인한 session 값을 객체로 가져오기
		UserVo authUser = (UserVo) session.getAttribute("authUser");

		// 회원의 세션번호로 구매내역 불러오기
		// 한사람이 여러개를 사면 결과값이 1개 이상이므로
		List<BoardVo> boardList ;
		System.out.println("컨트롤전");
		boardList = myService.exeUserBoard(authUser.getUno());

		model.addAttribute("boardList", boardList);
		System.out.println("컨트롤후");
		return "mypage/myService";
	}
	
	
	 @ResponseBody
	 @RequestMapping(value = "/mypage/update", method = {RequestMethod.POST})
	 public String updateDeliveryStatus(@ModelAttribute PurchaseVo purchaseVo) {
	        // 전달된 배송 정보 로그 확
		 System.out.println("배송 상태 업데이트 - 주문번호: " + purchaseVo.getOrder_no()+ ", 상태: " + purchaseVo.getDelivery_status());
	     System.out.println(purchaseVo);
	        // 배송 상태 업데이트 처리
	     boolean isUpdated = myService.exeUpdate(purchaseVo);
	        
	        // 성공 메시지 반환
	     if (isUpdated) {
	         return "배송 상태가 성공적으로 저장되었습니다.";
	     } else {
	         return "배송 상태 저장 중 오류가 발생했습니다.";
	        }
	    }
	 

	
}
