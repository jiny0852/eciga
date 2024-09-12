<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="header" class="clearfix">
	<h1 class="header-inner">
		<a href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/assets/img/icon/logo.png"></a>
	</h1>

	<c:if test="${sessionScope.authUser != null}">
		<ul>
			<li><span id="welcome">${sessionScope.authUser.name}고객 님 안녕하세요^^</span></li>
			<li><a href="${pageContext.request.contextPath}/user/logout" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/logout_1.png" alt="log-out" title="로그아웃"></a></li>
			<li><a href="${pageContext.request.contextPath}/cart" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_cart.png" alt="cart" title="장바구니"></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myservice" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_customer.png" alt="qna" title="문의사항"></a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myorder" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_mypage.png" alt="mypage" title="마이페이지"></a></li>
		</ul>
	</c:if>
	
	<c:if test="${sessionScope.authUser == null}">
		<ul>
			<li><a href="${pageContext.request.contextPath}/user/loginform"" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_cart.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/user/loginform" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_customer.png"></a></li>
			<li><a href="${pageContext.request.contextPath}/user/loginform" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_mypage.png"></a></li>
		</ul>
	</c:if>
</div>
