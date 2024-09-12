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
                            <th>주문번호</th>
                            <th>배송상태</th>
                            <th>결재일</th>
                            <th>수취인</th>
                            <th>배송지</th>
                            <th>제품</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:if test="${purchaseList == NULL}">
    					<!-- Display message or redirect to an empty list page -->
   							 <tr>
        						<td colspan="6">No purchases found.</td>
    						</tr>
						</c:if>
						<c:if test="${purchaseList != NULL}">                    
	                        <!-- Assuming 'purchaseList' is the attribute name containing a list of PurchaseVo objects -->
    	                    <c:forEach var="purchase" items="${purchaseList}">
        	                	<tr>
            	                	<td><c:out value="${purchase.order_no}"/></td>
                    	            <td><c:choose>
										<c:when test="${purchase.delivery_status == 0}">준비중</c:when>
										<c:when test="${purchase.delivery_status == 1}">배송중</c:when>
										<c:when test="${purchase.delivery_status == 2}">배송완료</c:when>
										<c:when test="${purchase.delivery_status == 3}">확인요망</c:when>
										</c:choose>
										<button type="button" class="confirmBtn" data-order-no="${delivery.orderNo}">확인</button>
									</td>
            	                    <td><c:choose>
                	             		<c:when test="${purchase.payment_status == 0}">결제 완료</c:when>
                    	          		<c:when test="${purchase.payment_status == 1}">미결제</c:when>
                        	      		<c:otherwise>취소</c:otherwise>
                           			</c:choose></td>
                         		       <td><c:out value="${purchase.user_name}"/></td>
                            	    	<td><c:out value="${purchase.address}"/></td>
                                		<td><c:out value="${purchase.goods_name}"/></td>
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
<script>
// DOM 로드 완료 시 실행되는 이벤트 등록
document.addEventListener('DOMContentLoaded', function() {
    console.log("DOM tree 완료");

    // 확인 버튼 클릭 이벤트 등록
    let confirmButtons = document.querySelectorAll('.confirmBtn');
    confirmButtons.forEach(function(button) {
        button.addEventListener('click', saveDeliveryStatus);
    });
});

// 배송 상태 저장 메소드
function saveDeliveryStatus(event) {
	console.log("클릭했음");
	
    let buttonTag = event.target;
    let orderNo = buttonTag.dataset.orderno;
    
 
    
	
    let orderData = {
    	order_no: orderNo,
    	delivery_status: 3
    };
    
    console.log(orderData);

    axios({
        method: 'post', // POST 요청으로 변경
        url: '/eciga/mypage/update', // 서버의 경로
        headers: {
            'Content-Type': 'application/json'  // 요청이 JSON임을 명시
        },
        params: orderData, // 데이터를 JSON 문자열로 변환하여 전송
        responseType: 'json'
    })
    .then(function(response) {
        alert("배송 상태가 성공적으로 저장되었습니다.");
    })
    .catch(function(error) {
        console.error(error);
        alert("배송 상태 저장 중 오류가 발생했습니다.");
    });
}
</script>

	<!-- //content-head -->
</body>

</html>

