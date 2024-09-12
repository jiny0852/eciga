<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이식아</title>
    <link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">
</head>

<body>

 	<div id="wrap">
        <div id="header" class="clearfix">
            <h1 class="header-inner">
                 <a href="#"><img src="${pageContext.request.contextPath}/assets/img/icon/logo.png" alt="Logo"></a>
            </h1>

            <!-- 로그인했을때 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />>

        <!-- Navigation -->
        <div id="nav">
            <h1>1:1 문의 페이지</h1>
            <ul class="clearfix">
                <li><a href="${pageContext.request.contextPath}/servicepage/servicelist">문의 게시판</a></li>
                <li><a href="${pageContext.request.contextPath}/servicepage/addservice">1:1 문의</a></li>
            </ul>
        </div>
        <!-- //Navigation -->

        <!-- Content -->
        <div id="container" class="clearfix">
            <div id="content">
                <!-- Customer Inquiry Display -->
                <div id="guestbook">
                    <table id="guestAdd">
                        <colgroup>
                            <col style="width: 70px;">
                            <col>
                            <col style="width: 70px;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td colspan="3">${board.title}</td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td colspan="3">${board.content}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //Customer Inquiry Display -->

                <!-- Answer Section -->
                <c:if test="${board.answer != null}">
                    <div id="answer">
                        <h3>관리자의 답변</h3>
                        <div class="answer-content">
                            <p>${inquiry.answer}</p>
                            <p><strong>답변일:</strong> ${inquiry.answer_date}</p>
                        </div>
                    </div>
                </c:if>
                <!-- //Answer Section -->
            </div>
            <!-- //Content -->
        </div>
        <!-- //Container -->

        <!-- Footer -->
        <div id="footer">
            <div id="footer_l">
                <p>서울시 서초구 강남대로 405 통영빌딩 8층</p>
                <p>상호명: (주)ElecCigaMarket 대표자: 황일영</p>
                <p>사업자 등록번호: 506-79-45687</p>
                <p>Copyright ⓒ 2024 하이미디어 All rights reserved</p>
            </div>
            <div id="footer_r">
                <p>주문 취소/교환 불가합니다^^</p>
                <p>게시판 문의(전화 상담은 운영하지 않습니다)</p>
                <p>평일 12:00~16:00</p>
                <p>1588-7585</p>
            </div>
        </div>
        <!-- //Footer -->
    </div>
    <!-- //Wrap -->

</body>

</html>
