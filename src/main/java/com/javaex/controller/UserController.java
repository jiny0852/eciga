package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	//필드
	@Autowired
	private UserService userService;
	//생성자
	//메소드 gs
	//메소드 일반
	
	/* 회원가입폼 */
	@RequestMapping(value="/user/joinform", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		System.out.println("UserController.joinForm()");
		//여기까진 됨

		return "user/joinForm";
		
	}
	
	/* 회원가입 */
	@RequestMapping(value="/user/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("UserController.join()");
		
		userService.exeJoin(userVo);
		
		return "user/loginForm";
	}
	
	
	/* 로그인폼 */
	@RequestMapping(value="/user/loginform", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm(){
		System.out.println("UserController.loginForm()");
		
		return "user/loginForm";
	}
	
	
	/* 로그인 */
	@RequestMapping(value="/user/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("UserController.login()");
		
		UserVo authUser = userService.exeLogin(userVo);
		
		System.out.println("여기는 컨트롤러------------------");
		System.out.println(authUser);
		
		//로그인(세션영역에 저장)
		session.setAttribute("authUser", authUser);
		if (authUser.getRole() == 0) {
			return "adminpage/ManageGoods";
		} 
		else if (authUser.getRole() == 1) {
			return "redirect:/main";
		} else {
			return "user/loginForm";
		}
		//메인페이지로 리다이렉트
	}
	
	/* 로그아웃 */
	@RequestMapping(value="/user/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		System.out.println("UserController.logout()");
		
		//session.removeAttribute("authUser");
		session.invalidate();
		
		//메인페이지로 리다이렉트
		return "user/loginForm";
	}
	
	/* 아이디체크 */
	@ResponseBody
	@RequestMapping(value="/api/user/idcheck", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean idCheck(@RequestParam(value="id") String id) {
		System.out.println("UserController.idCheck()");
		
		boolean can = userService.exeIdCheck(id);
		return can;
	}
	

}