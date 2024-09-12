<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ECIGA</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/icon/favicon_lil.ico">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
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
            <form action="${pageContext.request.contextPath}/admin/customer" method="get">
               <div class="period-filter">
                  <span class="period-label">기간조회</span>

                  <!-- 입력된 값이 없을 때 기본값을 null로 처리 -->
                  <input type="date" name="startDate" class="date-input" value="${startDate != null ? startDate : ''}"> 
                  <input type="date" name="endDate"  class="date-input" value="${endDate != null ? endDate : ''}"> 
                  <select class="form-control" name="status">
                     <option value="" ${status == '' ? 'selected' : ''}>처리상태</option>
                     <option value="답변대기" ${status == '답변대기' ? 'selected' : ''}>답변대기</option>
                     <option value="처리완료" ${status == '처리완료' ? 'selected' : ''}>처리완료</option>
                  </select> <input type="text" id="search_text" name="keyword" class="form-control" placeholder="검색어" value="${keyword}">
                  <button type="submit" class="search-btn">조회하기</button>
               </div>
            </form>

            <!-- 문의 목록 테이블 -->
            <table class="userMng">
               <thead>
                  <tr>
                     <th>문의번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>등록일</th>
                     <th>처리상태</th>
                     <th>답변일</th>
                     <th>관리</th>
                  </tr>
               </thead>
               <tbody>
               <tbody>
                  <c:forEach items="${pMap.inquiryList}" var="inquiry">
                     <tr>
                        <td>${inquiry.inquiryNo}</td>
                        <!-- 문의 번호를 링크에 전달하여 상세 페이지로 이동 -->
                        <td><a href="${pageContext.request.contextPath}/admin/customer/detail?inquiryNo=${inquiry.inquiryNo}">${inquiry.title}</a></td>
                        <td>${inquiry.userName}</td>
                        <td>${inquiry.regDate}</td>
                        <td>${inquiry.status}</td>
                        <td>${inquiry.answerDate != null ? inquiry.answerDate : '미답변'}</td>
                        <td><a href="#">수정</a></td>
                     </tr>
                  </c:forEach>
               </tbody>

               </tbody>

            </table>

            <div id="paging">
               <ul>
                  <c:if test="${pMap.prev}">
                     <li><a
                        href="${pageContext.request.contextPath}/admin/customer?crtpage=${pMap.startPageBtnNo-1}&keyword=${param.keyword}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}">◀</a></li>
                  </c:if>

                  <c:forEach begin="${pMap.startPageBtnNo}" end="${pMap.endPageBtnNo}" var="page">
                     <li class="${pMap.crtPage == page ? 'active' : ''}"><a
                        href="${pageContext.request.contextPath}/admin/customer?crtpage=${page}&keyword=${param.keyword}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}">${page}</a>
                     </li>
                  </c:forEach>

                  <c:if test="${pMap.next}">
                     <li><a
                        href="${pageContext.request.contextPath}/admin/customer?crtpage=${pMap.endPageBtnNo+1}&keyword=${param.keyword}&status=${param.status}&startDate=${param.startDate}&endDate=${param.endDate}">▶</a></li>
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