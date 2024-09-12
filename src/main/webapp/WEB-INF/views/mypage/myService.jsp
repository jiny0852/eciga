<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이식아</title>
    <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>

    <div id="wrap">
        <div id="header" class="clearfix">
            <h1 class="header-inner">
                 <a href="#"><img src="${pageContext.request.contextPath}/assets/img/icon/logo.png" alt="Logo"></a>
            </h1>

            <!-- 로그인했을때 -->
			<c:import url="/WEB-INF/views/include/header.jsp" />>
 
        <div id="nav">
            <h1>회원정보 수정</h1>
            <ul class="clearfix">
                <li><a href="${pageContext.request.contextPath}/user/myorders">나의 주문</a></li>
                <li><a href="${pageContext.request.contextPath}/user/myaccount">나의 정보</a></li>
                <li><a href="${pageContext.request.contextPath}/user/myservices">나의 문의</a></li>
            </ul>
        </div>

        <div id="board">
            <div id="list">
                <table class="userMng">
                    <thead>
                        <tr>
                            <th>게시글번호</th>
                            <th>문의제목</th>
                            <th>답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:if test="${boardList == NULL}">
							<!-- Display message or redirect to an empty list page -->
							<tr>
								<td colspan="6">No boards found.</td>
							</tr>
						</c:if>
						<c:if test="${boardList != NULL}">
							<c:forEach var="board" items="${boardList}">
								<tr style="cursor: pointer;" onClick="window.location.href='${pageContext.request.contextPath}/board/details?inquiry_no=${board.inquiry_no}'">
									<td><c:out value="${board.inquiry_no}"/></td>
									<td><c:out value="${board.title}"/></td>
									<td><c:out value="${board.status}"/></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
                </table>

<!--                 <div id="paging"> -->
<!--                     <ul> -->
<!--                         <li><a href="">◀</a></li> -->
<!--                         <li><a href="">1</a></li> -->
<!--                         <li><a href="">2</a></li> -->
<!--                         <li><a href="">3</a></li> -->
<!--                         <li><a href="">4</a></li> -->
<!--                         <li class="active"><a href="">5</a></li> -->
<!--                         <li><a href="">6</a></li> -->
<!--                         <li><a href="">7</a></li> -->
<!--                         <li><a href="">8</a></li> -->
<!--                         <li><a href="">9</a></li> -->
<!--                         <li><a href="">10</a></li> -->
<!--                         <li><a href="">▶</a></li> -->
<!--                     </ul> -->


<!--                     <div class="clear"></div> -->
                </div>
                <!-- <a id="btn_write" href="">글쓰기</a> -->
            </div>
            <!-- //list -->
        </div>
        <!-- //board -->
        <!-- footer -->
        <div id="footer">
            <div id="footer_l">
                <p>서울시 서초구 강남대로 405 통영빌딩 8층</p>
                <p>상호명:(주)ElecCigaMarket 대표자 : 황일영</p>
                <p>사업자 등록번호 : 506 - 79 - 45687</p>
                <p>Copyright ⓒ 2024 하이미디어 All right reserved</p>
            </div>
            <div id="footer_r">
                <p>주문 취소/교환 불가합니다^^</p>
                <p>게시판문의(전화상담은 운영하지 않습니다)</p>
                <p>평일 12:00~16:00</p>
                <p>1588-7585</p>
            </div>
        </div>
        <!-- //footer -->
    </div>
    <!-- //content-head -->
</body>

	<!-- //content-head -->

</html>

