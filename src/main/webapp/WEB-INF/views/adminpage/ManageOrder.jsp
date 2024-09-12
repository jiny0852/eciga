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
<!-- Axios 라이브러리 포함 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
				<form action="${pageContext.request.contextPath}/admin/order" method="get">
					<div class="form-group_text-right">
						<select class="form-control" name="status">
							<option value="" selected="selected">배송상태</option>
							<option value="0" ${param.status == '0' ? 'selected="selected"' : ''}>준비중</option>
							<option value="1" ${param.status == '1' ? 'selected="selected"' : ''}>배송중</option>
							<option value="2" ${param.status == '2' ? 'selected="selected"' : ''}>배송완료</option>
							<option value="3" ${param.status == '3' ? 'selected="selected"' : ''}>확인요망</option>
						</select> <input type="text" id="search_text" name="keyword" class="form-control" placeholder="검색어" value="${param.keyword}">
						<button type="submit" class="search-btn">검색</button>
					</div>
				</form>
				<table class="userMng">
					<thead>
						<tr>
							<th>주문번호</th>

							<th>결제여부</th>
							<th>결제수단</th>
							<th>구매확정날짜</th>
							<th>주문회원</th>
							<th>배송상태</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pMap.deliveryList}" var="delivery">
							<tr>
								<td>${delivery.orderNo}</td>

								<td><c:choose>
										<c:when test="${delivery.paymentStatus == 0}">결제 완료</c:when>
										<c:when test="${delivery.paymentStatus == 1}">미결제</c:when>
										<c:otherwise>취소</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${delivery.paymentMethod == 0}">카드</c:when>
										<c:when test="${delivery.paymentMethod == 1}">계좌이체</c:when>
										<c:when test="${delivery.paymentMethod == 2}">무통장입금</c:when>
										<c:otherwise>간편결제</c:otherwise>
									</c:choose></td>
								<td>${delivery.purchaseConfirmDate}</td>
								<td>${delivery.userName}</td>
								<td>
									<select class="statusSelect" data-order-no="${delivery.orderNo}">
										<option id="pending" value="0" ${delivery.deliveryStatus == 0 ? 'selected' : ''}>준비중</option>
										<option id="" value="1" ${delivery.deliveryStatus == 1 ? 'selected' : ''}>배송중</option>
										<option value="2" ${delivery.deliveryStatus == 2 ? 'selected' : ''}>배송완료</option>
										<option id="completed" value="3" ${delivery.deliveryStatus == 3 ? 'selected' : ''}>확인요망</option>
									</select> <!-- 확인 버튼 추가 -->
									<button type="button" class="confirmBtn" data-order-no="${delivery.orderNo}">확인</button>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<div id="paging">
					<ul>
						<c:if test="${pMap.prev}">
							<li><a href="${pageContext.request.contextPath}/admin/order?crtpage=${pMap.startPageBtnNo-1}&keyword=${param.keyword}&status=${param.status}">◀</a></li>
						</c:if>

						<c:forEach begin="${pMap.startPageBtnNo}" end="${pMap.endPageBtnNo}" var="page">
							<li class="${pMap.crtPage == page ? 'active' : ''}"><a
								href="${pageContext.request.contextPath}/admin/order?crtpage=${page}&keyword=${param.keyword}&status=${param.status}">${page}</a></li>
						</c:forEach>

						<c:if test="${pMap.next}">
							<li><a href="${pageContext.request.contextPath}/admin/order?crtpage=${pMap.endPageBtnNo+1}&keyword=${param.keyword}&status=${param.status}">▶</a></li>
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
    let orderNo = buttonTag.dataset.orderNo;
    
    // **버튼과 동일한 행(row)에 있는 select 태그를 찾도록 수정**
    let rowElement = buttonTag.closest('td');
    /* let selectTag = rowElement.querySelector('.statusSelect'); */
    
/*     if (!selectTag) {
        console.error('배송 상태 select 요소를 찾을 수 없습니다.');
        return;
    } */
	
    
    let newStatus = rowElement.children[0].value;

    let orderData = {
    	orderNo: orderNo,
        deliveryStatus: newStatus
    };
    
    console.log(orderData);

 // 서버에 배송 상태를 저장하는 요청 전송
    axios({
        method: 'post', // POST 요청으로 변경
        url: '/eciga/admin/updateDeliveryStatus', // 서버의 경로
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
