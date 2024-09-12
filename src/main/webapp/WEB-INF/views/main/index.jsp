<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">


<head>

<meta charset="UTF-8">
<title>ECIGA</title>



<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/gallery.css" rel="stylesheet">
<!-- 서버  통신 연결용 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


</head>



<body>




	<div id="wrap">





		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>








		<div id="container" class="clearfix">

			<div class="top_area clearfix"></div>

			<!-- 메인바디 시작 -->
			<div id="content">

				<!-- 메인 상단 -->
				<div id="content-head" class="clearfix">

					<div id="main-header">

						<div id="main-header-left">

							<h1>ECiga OnlineMall</h1>

							<h2>이식아만의 다양한 제품을 만나보세요!</h2>

						</div>

						<div id="main-header-right">
							<img src="${pageContext.request.contextPath}/assets/img/icon/img_mall_top.png">

						</div>





					</div>

				</div>
				<!-- //content-head 메인 상단 -->

				<div id="gallery-txt" class="clearfix">
					<h1>디바이스</h1>
				</div>

				<div id="gallery" class="clearfix">


					<div id="list">


						<!-- 제품 리스트 출력 -->
						<c:forEach items="${requestScope.goodsList}" var="goods">

							<ul id="viewArea">


								<li>
									<div class="view">
										<div class="itemimg">
											<a href="${pageContext.request.contextPath}/read?no=${goods.gno}"> 
											<img src="${pageContext.request.contextPath}/upload/${goods.imgName}">
											<!-- <img src="${pageContext.request.contextPath}/assets/img/${goods.imgName}"> -->
											
											
											</a>

										</div>
										
										
										<div class="itemName">${goods.name}</div>
										<div class="itemPrice">${goods.price}원</div>
									</div>

								</li>



							</ul>



						</c:forEach>






					</div>


				</div>




			</div>
			<!-- //메인바디 -->


		</div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>






	</div>


</body>
</html>