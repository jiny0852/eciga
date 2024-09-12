<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.javaex.vo.UserVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
    <link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">
    <style>
        #content {
            width: 50%;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }

        form {
            display: inline-block;
            text-align: left;
            width: 100%;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 16px;
        }

        input[readonly] {
            background-color: #e9e9e9;
        }

        #saveBtn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #saveBtn:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>

    <div id="wrap">
        <div id="header" class="clearfix">
            <h1 class="header-inner">
                <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/assets/img/icon/logo.png" alt="Logo"></a>
            </h1>

            <!-- 로그인했을때 -->
            <c:if test="${sessionScope.authUser != null}">
                <ul>
                    <li><span id="welcome">${sessionScope.authUser.name} 님 안녕하세요^^</span></li>
                    <li><a href="#" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_cart.png" alt="Cart"></a></li>
                    <li><a href="#" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_customer.png" alt="Customer"></a></li>
                    <li><a href="${pageContext.request.contextPath}/user/myPage" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_mypage.png" alt="My Page"></a></li>
                </ul>
            </c:if>

            <!-- 로그인 안했을때 -->
            <c:if test="${sessionScope.authUser == null}">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/login.jsp" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_cart_c.png" alt="Cart"></a></li>
                    <li><a href="${pageContext.request.contextPath}/login.jsp" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_customer_c.png" alt="Customer"></a></li>
                    <li><a href="${pageContext.request.contextPath}/login.jsp" class="btn_s"><img src="${pageContext.request.contextPath}/assets/img/icon/btn_gnb_mypage_c.png" alt="My Page"></a></li>
                </ul>
            </c:if>
        </div>

        <div id="nav">
            <h1>회원정보 수정</h1>
            <ul class="clearfix">
                <li><a href="${pageContext.request.contextPath}/user/myorders">나의 주문</a></li>
                <li><a href="${pageContext.request.contextPath}/user/myaccount">나의 정보</a></li>
                <li><a href="${pageContext.request.contextPath}/user/myinquiries">나의 문의</a></li>
            </ul>
        </div>

        <div id="content">
            <div id="user">
                <div id="modifyForm">
                    <form action="${pageContext.request.contextPath}/user/modify" method="post" id="updateForm">

                        <!-- 아이디 (ID) -->
                        <div class="form-group">
                            <label class="form-text" for="input-uid">아이디</label>
                            <span class="text-large bold">${sessionScope.authUser.uid}</span>
                        </div>

                        <!-- 비밀번호 (Password) -->
                        <div class="form-group">
                            <label class="form-text" for="input-pass">패스워드</label>
                            <input type="password" id="input-pass" name="password" placeholder="새 비밀번호 입력">
                        </div>

                        <!-- 이름 (Name) -->
                        <div class="form-group">
                            <label class="form-text" for="input-name">이름</label>
                            <span class="text-large bold">${sessionScope.authUser.name}</span>
                        </div>

                        <!-- 전화번호 (Phone Number) -->
                        <div class="form-group">
                            <label class="form-text" for="input-phone">전화번호</label>
                            <span class="text-large bold">${sessionScope.authUser.hp}</span>
                        </div>

                        <!-- 생년월일 (Birth Date) -->
                        <div class="form-group">
                            <label class="form-text" for="input-birth">생년월일</label>
                            <span class="text-large bold">${sessionScope.authUser.birth}</span>
                        </div>

                        <!-- 주소 (Address) -->
                        <div class="form-group">
                            <label class="form-text" for="input-address">주소</label>
                            <span class="text-large bold">${sessionScope.authUser.address}</span>
                        </div>

                        <!-- 저장 버튼 (Save Button) -->
                        <div class="button-area">
                            <button type="submit" id="btn-submit">회원정보수정</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

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

</body>

</html>
