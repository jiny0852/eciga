<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ECIGA</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/icon/favicon_lil.ico">
<link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">


</head>
<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp" />

		<div id="nav">
			<h1>관리자페이지</h1>
			<ul class="clearfix">
				<li><a href="${pageContext.request.contextPath}/admin/goods">제품 등록/관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/user">회원관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/order">배송관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/customer">1:1 고객문의</a></li>
			</ul>
		</div>

		<div id="board">
			<div id="list">
				<form action="${pageContext.request.contextPath}/admin/user" method="get">
					<div class="form-group_text-right">
						<select class="form-control" name="status">
							<option value="" selected="selected">회원상태</option>
							<option value="1">활성</option>
							<option value="2">휴면</option>
							<option value="3">탈퇴 요청</option>
							<option value="0">탈퇴</option>
						</select> <input type="text" id="search_text" name="keyword" class="form-control" placeholder="검색어">
						<button type="submit" class="search-btn">검색</button>
					</div>
				</form>
				<table class="userMng">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th>생년월일</th>
							<th>주소</th>
							<th>비밀번호</th>
							<th>상태</th>
							<th>권한</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pMap.userList}" var="user">
							<tr>
								<td>${user.uno}</td>
								<td>${user.name}</td>
								<td>${user.uid}</td>
								<td>${user.hp}</td>
								<td>${user.ssn}</td>
								<td>${user.address}</td>
								<td>****</td>
								<!-- 비밀번호는 숨김 처리 -->
								<td><c:choose>
										<c:when test="${user.status == 1}">활성</c:when>
										<c:when test="${user.status == 2}">휴면</c:when>
										<c:when test="${user.status == 3}">탈퇴 요청</c:when>
										<c:when test="${user.status == 0}">탈퇴</c:when>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${user.role == 0}">관리자</c:when>
										<c:otherwise>일반회원</c:otherwise>
									</c:choose></td>
								<td><a href="#">[수정]</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<div id="paging">
					<ul>
						<c:if test="${pMap.prev}">
							<li>
								<a href="${pageContext.request.contextPath}/admin/user?crtpage=${pMap.startPageBtnNo-1}&keyword=${param.keyword}&status=${param.status}">◀</a>
							</li>
						</c:if>

						<c:forEach begin="${pMap.startPageBtnNo}" end="${pMap.endPageBtnNo}" var="page">
							<li class="${pMap.crtPage == page ? 'active' : ''}">
								<a href="${pageContext.request.contextPath}/admin/user?crtpage=${page}&keyword=${param.keyword}&status=${param.status}">${page}</a>
							</li>
						</c:forEach>

						<c:if test="${pMap.next}">
							<li>
								<a href="${pageContext.request.contextPath}/admin/user?crtpage=${pMap.endPageBtnNo+1}&keyword=${param.keyword}&status=${param.status}">▶</a>
							</li>
						</c:if>
					</ul>
				</div>
				<!-- <a id="btn_write" href="">글쓰기</a> -->
			</div>
			<!-- //list -->
		</div>
		<!-- //board -->
		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- //footer -->
	</div>
	<!-- //content-head -->
</body>
</html>