<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ECIGA</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/icon/favicon_lil.ico">
<link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/addgoods.css" rel="stylesheet" type="text/css">

</head>

<body>



	<div id="wrap">
	
	
	
		<c:import url="/WEB-INF/views/include/header.jsp" />

		<div id="nav">
			<h1>장바구니</h1>
		</div>



		<!-- content-head -->
		<div class="cart-layout">

			<c:forEach items="${requestScope.cartList}" var="cartVo">


				<div class="cart-item">
					<!-- <img src="${pageContext.request.contextPath}/assets/img/hybrid30cce/hybrid30cce_khaki.jpeg" alt="제품 이미지" class="product-image"> -->
					<img src="${pageContext.request.contextPath}/upload/${cartVo.imgName}" alt="제품 이미지" class="product-image">
					<div class="item-details">
						<p class="product-name">${cartVo.name}</p>

						<!-- 
						<p class="product-color">색상: 샌드 베이지</p>
						<div class="quantity-selector">
							<button class="quantity-btn">-</button>
							<span class="quantity-value">1</span>
							<button class="quantity-btn">+</button>
						</div>
						-->

					</div>
					<div class="price-box">
						<!-- 기본 금액을 서버에서 받아서 사용 -->

						<p class="product-price">
							<fmt:formatNumber value="" type="number" />${cartVo.price}*${cartVo.count}원</p>
					</div>
				</div>




			</c:forEach>






			<div class="order-summary">
				<div class="order-box">
					<p>
						주문금액: <span class="order-price"><fmt:formatNumber value="${goodsPrice}" type="number" />원</span>
					</p>
					<p class="total-price">
						총 주문금액(VAT 포함): <span class="total-price-value"><fmt:formatNumber value="${goodsPrice}" type="number" />원</span>
					</p>
					<button class="order-btn"><a href="${pageContext.request.contextPath}/pay">구매하기</a></button>
				</div>
			</div>






		</div>




		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		
		
		
		
	</div>

	<script>
	
	
	
	
	
	
        let quantity = 1;
        const quantityValue = document.querySelector('.quantity-value');
        const productPriceElement = document.querySelector('.product-price');
        const orderPriceElement = document.querySelector('.order-price');
        const totalPriceElement = document.querySelector('.total-price-value');
        const basePrice = parseInt('${goodsPrice}', 10); // 서버에서 전달된 기본 가격을 JavaScript에서 사용

        document.querySelectorAll('.quantity-btn').forEach(button => {
            button.addEventListener('click', function () {
                if (this.textContent === '+') {
                    quantity++;
                } else if (this.textContent === '-' && quantity > 1) {
                    quantity--;
                }
                quantityValue.textContent = quantity;

                const totalPrice = basePrice * quantity;

                // 가격을 포맷해서 출력
                productPriceElement.textContent = totalPrice.toLocaleString() + '원';
                orderPriceElement.textContent = totalPrice.toLocaleString() + '원';
                totalPriceElement.textContent = totalPrice.toLocaleString() + '원';
            });
        });
        
        
        
        
        
    </script>
    
    
    
    
    
    
</body>
</html>
