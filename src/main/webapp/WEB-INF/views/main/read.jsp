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

        <!-- 메인바디 시작 -->
         <div id="content">

            <div id="sub_contents">

                <!-- 제품 상단 -->
                <div id="item_box" class="clearfix">

                    <div id="item_img_box">
                        <!--  -->
                        <img src="${pageContext.request.contextPath}/assets/img/hybrid30/hybrid_black_small.png">

                    </div>

                    <div id="item_info_box">

                        <form name="itemView" id="itemView" method="post">

                            <div id="itemName">${goodsVo.name}</div>
                            <div id="itemPrice">${goodsVo.price}원</div>
                            <div> <!-- 색깔버튼 -->
                                <div class="imgItemColor">
                                    <div class="itemGrid">
                                        <div><button class="color-circle black"></button></div>
                                        <div><button class="color-circle red"></button></div>
                                        <div><button class="color-circle blue"></button></div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="form-group-count">
                                <label for="itemCount">수량</label>
                                <button type="button"><img src="#">+</button>
                                <span id="itemCount" >1</span>
                                <button type="button"><img src="#">-</button>
                            </div>
                            <div class="form-group-price">
                                <label for="totalPrice">가격</label>
                                <span id="totalPrice">99,000원</span>
                            </div>


                            <button type="submit">장바구니에 담기</button>


                        </form>


                    </div>

                    



                </div>

                <!-- 제품 설명이미지 -->
                <div id="item-read" class="clearfix">
                    <img src="${pageContext.request.contextPath}/assets/img/hybrid30/hybri30_content.jpg">
                    <!-- <img src="#"> -->


                </div>
    
                <!-- 제품 추가설명 -->
                <div id="item-line" class="clearfix">

                    <div class="additional-info">
                        <div class="info-item">
                            <span class="info-title">AS/결제</span>
                            <span class="info-image"><img src="#"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-title">문의</span>
                            <span class="info-image"><img src="#"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-title">배송</span>
                            <span class="info-image"><img src="#"></span>
                        </div>
                        <div class="info-item">
                            <span class="info-title">반품</span>
                            <span class="info-image"><img src="#"></span>
                        </div>
                    </div>
                    
    
    
    
                </div>


            </div>





         </div>
         <!-- 메인바디 끝-->




        <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>


    

    </div>

    
</body>
</html>