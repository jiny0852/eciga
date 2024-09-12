package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.AdminService;
import com.javaex.service.CustomerAskService;
import com.javaex.service.DeliveryService;
import com.javaex.service.UserService;
import com.javaex.vo.CustomerAskVo;
import com.javaex.vo.DeliveryVo;
import com.javaex.vo.GoodsVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

   @Autowired
   private AdminService adminService;
   @Autowired
   private UserService userService;
   @Autowired
   private DeliveryService deliveryService;
   @Autowired
   private CustomerAskService customerAskService;

   /* 고객문의 */
   @RequestMapping(value = "/customer", method = { RequestMethod.GET, RequestMethod.POST })
   public String manageCustomer(@RequestParam(value = "crtpage", required = false, defaultValue = "1") int crtPage,
         @RequestParam(value = "status", required = false, defaultValue = "") String status,
         @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
         @RequestParam(value = "startDate", required = false) String startDate,
         @RequestParam(value = "endDate", required = false) String endDate, Model model) {

      Map<String, Object> pMap = customerAskService.getInquiryList(crtPage, keyword, status, startDate, endDate);
      
      
      model.addAttribute("pMap", pMap);
      model.addAttribute("keyword", keyword);
      model.addAttribute("status", status);
      model.addAttribute("startDate", startDate);
      model.addAttribute("endDate", endDate);
      
      System.out.println("고객문의 내용: " + pMap);
      
      return "adminpage/ManageCustomer";
   }

   // 문의 상세 페이지
    @RequestMapping(value = "/customer/detail", method = RequestMethod.GET)
    public String customerAskDetail(@RequestParam("inquiryNo") int inquiryNo, Model model) {
        CustomerAskVo inquiry = customerAskService.getInquiryDetail(inquiryNo);  // 문의 상세 조회
        
        
        model.addAttribute("inquiry", inquiry);  // JSP로 데이터 전달
        
        return "adminpage/ManageCustomerAsk";  // JSP 파일로 이동
    }

    // 문의 답변 등록 처리
    @ResponseBody
    @RequestMapping(value = "/customer/answer", method = RequestMethod.POST)
    public boolean answerInquiry(@ModelAttribute CustomerAskVo customerAskVo) {
        System.out.println(customerAskVo);
        // 서버로 넘어온 문의 정보 로그 출력
        System.out.println("서버로 보낼 정보: " + customerAskVo);
        
        boolean isUpdated = customerAskService.updateInquiryAnswer(customerAskVo);
        
        return isUpdated ;
        
    }
    

   /* 상품 목록 페이지 */
   @RequestMapping(value = "/goods", method = { RequestMethod.GET, RequestMethod.POST })
   public String showGoods(Model model) {
      System.out.println("AdminController.showGoods()");

      // 서비스 호출하여 상품 목록 가져오기
      List<GoodsVo> goodsList = adminService.getAllGoods();
      model.addAttribute("goodsList", goodsList);

      System.out.println("서비스가 보낸 상품 목록: " + goodsList);
      return "adminpage/ManageGoods";
   }

   // 상품 추가 처리
   @RequestMapping(value = "/addgoods", method = { RequestMethod.GET, RequestMethod.POST })
   public String addGoods(@RequestParam("image") MultipartFile image, GoodsVo goodsVo) {
      // 이미지를 포함한 상품 추가 로직을 서비스에 위임
      adminService.addGoodsWithImage(goodsVo, image);

      return "redirect:/admin/goods";
   }

   // 회원 관리 페이지
   /*
    * @RequestMapping(value = "/user", method = {RequestMethod.GET,
    * RequestMethod.POST}) public String manageUser(Model model) {
    * System.out.println("AdminController.manageUser()");
    * 
    * // 서비스 호출하여 유저 목록 가져오기 List<UserVo> userList = userService.getUserList();
    * model.addAttribute("userboardList", userList);
    * 
    * return "/adminpage/ManageUser"; }
    */
   // 회원 관리 페이지 (페이징 및 검색)
   @RequestMapping(value = "/user", method = { RequestMethod.GET, RequestMethod.POST })
   public String manageUser(@RequestParam(value = "crtpage", required = false, defaultValue = "1") int crtPage,
         @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
         @RequestParam(value = "status", required = false, defaultValue = "") String status, Model model) {

      System.out.println("회원관리 페이지 - keyword: " + keyword + ", status: " + status); // 디버그
      Map<String, Object> pMap = userService.getUserList(crtPage, keyword, status);
//      System.out.println("userList size: " + ((List<UserVo>) pMap.get("userList")).size()); // 데이터 크기 확인

      model.addAttribute("pMap", pMap);
      model.addAttribute("keyword", keyword); // JSP에서 사용하기 위해 keyword 넘김
      model.addAttribute("status", status); // JSP에서 사용하기 위해 status 넘김
      return "adminpage/ManageUser";
   }

   /* 배송 관리 리스트 (페이징 및 검색) */
   @RequestMapping(value = "/order", method = { RequestMethod.GET, RequestMethod.POST })
   public String manageOrder(@RequestParam(value = "crtpage", required = false, defaultValue = "1") int crtPage,
         @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
         @RequestParam(value = "status", required = false, defaultValue = "") String status, Model model) {

      System.out.println("배송 관리 페이지 - 검색어: " + keyword + ", 상태: " + status);

      Map<String, Object> pMap = deliveryService.getDeliveryList(crtPage, keyword, status);

      model.addAttribute("pMap", pMap);
      model.addAttribute("keyword", keyword); // 검색어 유지
      model.addAttribute("status", status); // 상태 유지
      return "adminpage/ManageOrder";
   }

   // **배송 상태 업데이트 메소드 추가**
   @ResponseBody
   @RequestMapping(value = "/updateDeliveryStatus", method = RequestMethod.POST)
   public String updateDeliveryStatus(@ModelAttribute DeliveryVo deliveryVo) {
      // 전달된 배송 정보 로그 확인
      System.out.println("배송 상태 업데이트 - 주문번호: " + deliveryVo.getOrderNo() + ", 상태: " + deliveryVo.getDeliveryStatus());
      System.out.println(deliveryVo);
      // 배송 상태 업데이트 처리
      boolean isUpdated = deliveryService.updateDeliveryStatus(deliveryVo);

      // 성공 메시지 반환
      if (isUpdated) {
         return "배송 상태가 성공적으로 저장되었습니다.";
      } else {
         return "배송 상태 저장 중 오류가 발생했습니다.";
      }
   }
/* 이것은 깃허브 연동이 되는지 확인하는것*/
}