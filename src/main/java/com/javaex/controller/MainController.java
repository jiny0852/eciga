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

import com.javaex.service.GoodsService;
import com.javaex.vo.CartVo;
import com.javaex.vo.GoodsVo;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	private GoodsService goodsService;
	
	
	@RequestMapping(value="/main", method= {RequestMethod.GET, RequestMethod.POST})
	public String main( Model model ) {
		
		System.out.println("MainController.main()");
		
		List<GoodsVo> goodsList = goodsService.exeGoodsList();
		
		model.addAttribute("goodsList", goodsList);
		
		System.out.println(goodsList);
		
		return "/main/index";
	}
	
	
	/* goods read */
	@RequestMapping ( value="/read", method={RequestMethod.GET, RequestMethod.POST} )
	public String read ( @RequestParam(value="no") int no, Model model ) {
		
		System.out.println("MainController.read()");
		
		GoodsVo goodsVo = goodsService.exeGetReadOne(no);
		
		System.out.println(goodsVo);
		
		model.addAttribute("goodsVo", goodsVo);		
		
		return "/goods/GoodsInfo";
		//return "/main/read";
	}
	
	@ResponseBody
	@RequestMapping ( value="/insertCart", method={RequestMethod.GET, RequestMethod.POST} )
	public int insertCart ( @ModelAttribute CartVo cartVo, HttpSession session ) {
		System.out.println("MainController.insertCart()");

		UserVo authoUser = (UserVo)session.getAttribute("authUser");
		int uNo = authoUser.getUno();
		
		cartVo.setuNo(uNo);
		System.out.println(cartVo);
			
		int count = goodsService.exeInsertCart(cartVo);
		
		return count;
		
	}
	
	
	/* 카트에 내 장바구니 목록 뿌리기 */
	@RequestMapping ( value="/cart", method={RequestMethod.GET, RequestMethod.POST} )
	public String cart ( HttpSession session, Model model ) {
		
		System.out.println("MainController.cart()");
		
		
		List<CartVo> cartList = 
				goodsService.exeCartList( ((UserVo)session.getAttribute("authUser")).getUno() );
		
		System.out.println(" 유저의 장바구니 list " + cartList);
		
		model.addAttribute("cartList", cartList);
			
		
		return "/goods/GoodsCart";
		
	}
	
	
	/* 주문하기 */
	@RequestMapping ( value="/pay", method={RequestMethod.GET, RequestMethod.POST} )
	public String payment ( HttpSession session, Model model ) {
		
		System.out.println("MainController.payment()");
		
		
		List<CartVo> cartList = 
				goodsService.exeCartList(((UserVo)session.getAttribute("authUser")).getUno());
		
		System.out.println(" 유저의 구매 list " + cartList);
		
		model.addAttribute("cartList", cartList);
			
		
		return "/kart/payment";
		
	}
	
	@RequestMapping ( value="/submit-order", method={RequestMethod.GET, RequestMethod.POST} )
	public String selled ( HttpSession session ) {
		
		System.out.println("MainController.selled()");
		
		
			
		
		return "/main/index";
		
	}
	
	
	
	
	

}
