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
<link href="${pageContext.request.contextPath}/assets/css/payment.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/goods.css" rel="stylesheet">
<!-- 서버  통신 연결용 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/assets/css/styles.css">

</head>

<body>




	<div id="wrap">


		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>





		<div class="clearfix container">
			<form action="/submit-order" method="post">
				<main id="payment">
					<section class="order-form">

						<div class="order_section">
							<h2>주문/배송정보</h2>
							<ul>
								<li><label for="name">이름:</label> <input type="text" id="name" name="name" required></li>
								<li><label for="phone">전화번호:</label> <input type="tel" id="phone" name="phone" required></li>
								<li><label for="a_email">이메일:</label> <!--<input type="email" id="email" name="email" required>-->
									<div class="input_email">
										<div class="email_box">
											<div>
												<input type="text" name="a_email" id="a_email" class="form-control" placeholder="이메일을 입력해주세요." value="">
											</div>
											<div class="gol_s">@</div>
											<div>
												<input type="text" name="b_email" id="b_email" class="form-control" ReadOnly="true" />
											</div>
										</div>
										<div class="email_select">
											<select name="emailCheck" id="emailCheck" onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)" class="form-control">
												<option value="">선택</option>
												<option value="etc">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
											</select>
										</div>
									</div> <input type="hidden" name="m_id" id="m_id" required></li>
								<li><label for="address">주소:</label>
									<div class="address">
										<ul>
											<li class="address_postcode"><input type="text" id="postcode" placeholder="우편번호">
												<button type="button" onclick="execDaumPostcode()">우편번호 찾기</button></li>
											<li><input type="text" id="address" placeholder="주소"></li>
											<li class="address_detail"><input type="text" id="detailAddress" placeholder="상세주소"> <input type="text" id="extraAddress"
												placeholder="참고항목"></li>
										</ul>

									</div></li>
							</ul>
						</div>

						<div class="payment_section">
							<h2>결제방식</h2>
							<ul>
								<li>신용/체크카드<input type="radio" id="creditCard" name="paymentWay" value="01" required checked> <label for="creditCard"><span
										class="radio_btn"></span></label></li>
								<li>무통장입금<input type="radio" id="payBank" required name="paymentWay" value="02"> <label for="payBank"><span class="radio_btn"></span></label>
								</li>
							</ul>
						</div>
					</section>

					<section class="order-summary">
						<div>
							<h2>주문 요약</h2>

							<!--<label for="item">상품 선택:</label>-->

							<ul id="viewArea">
							
								<c:forEach items="${requestScope.cartList}" var="cartVo">
								
									<li>

									<div class="viewTop">
										<a href="javascript:void(0);" class="del_view"><i class="xi-close"></i></a>
									</div>
									
									
									<div class="view">
										<div class="itemimg">
											<img src="${pageContext.request.contextPath}/upload/${cartVo.imgName}" alt="하이브리드 3.0 카고컨테이너 에디션">
										</div>
										<div class="view_txt">
											<div class="">${cartVo.name}</div>
										</div>
										<div class="view_price">${cartVo.price}</div>
									</div>
									<div class="view_cnt">
										<div>수량</div>
										<div>${cartVo.count}</div>
									</div>
								</li>
								
								
								</c:forEach>
							
								
							</ul>
                        
                        
                        
                        

						</div>
						<div class="btn_area">
							<div class="total_order">
								<div class="summary-item">
									<span>상품명:</span> <span>상품 1</span>
								</div>
								<div class="summary-item">
									<span>수량:</span> <span>1</span>
								</div>
								<div class="summary-item">
									<span>총 가격:</span> <span>20,000원</span>
								</div>
							</div>
							<button type="submit">주문하기</button>
						</div>
						
						
						
						
						
						
					</section>

				</main>
			</form>
		</div>
		
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		
		
		

	</div>



	






	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

    const del_btn = document.querySelectorAll('.del_view');
    const order_list = document.querySelectorAll('#viewArea li');
    del_btn.forEach((btn, index) => {
        btn.addEventListener('click', () => {
            if(confirm("현재 주문내역에서 삭제하고 \n장바구니에 추가하시겠습니까?")){
                order_list[index].remove();
            }else {

            }

        })
    });

    function SetEmailTail(emailValue) {
        var email = document.all("a_email")    // 사용자 입력
        var emailTail = document.all("b_email") // Select box

        if ( emailValue == "notSelected" )
            return;
        else if ( emailValue == "etc" ) {
            emailTail.readOnly = false;
            emailTail.value = "";
            emailTail.focus();
        } else {
            emailTail.readOnly = true;
            emailTail.value = emailValue;
        }
    }
    function validateForm() { //form에 온서브밋이 있을경우 없으면 버튼 아이디 클릭해서 이용하시길 - onsubmit="return validateForm()"
        var mail1 = $('#a_email').val();
        var mail2 = $('#b_email').val();
        var real_mail = mail1 +'@' + mail2;
        $("#m_id").val(real_mail);
        return false;
    }

    /*document.addEventListener('DOMContentLoaded', () => {
        const viewArea = document.getElementById('viewArea');
        const viewMoreBtn = document.getElementById('viewMore');

        viewMoreBtn.addEventListener('click', () => {
            // 높이를 auto로 설정하여 내용에 맞게 확장
            viewArea.style.height = 'auto';

            // 높이를 다시 체크하여 버튼의 표시 여부 결정
            setTimeout(() => {
                if (viewArea.scrollHeight > 350) {
                    viewMoreBtn.style.display = 'block';
                } else {
                    viewMoreBtn.style.display = 'none';
                }
            }, 0); // 레이아웃이 업데이트된 후 높이를 다시 체크하기 위해 0ms 딜레이 추가
        });

        // 페이지 로드 시 초기 상태 설정
        if (viewArea.scrollHeight > 350) {
            viewMoreBtn.style.display = 'block';
        } else {
            viewMoreBtn.style.display = 'none';
        }
    });*/
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;

                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
	<!--<script>
    // 수량 조절 기능을 위한 간단한 스크립트
    document.getElementById('increment').addEventListener('click', function () {
        var qtyInput = document.getElementById('quantity');
        qtyInput.value = parseInt(qtyInput.value) + 1;
    });

    document.getElementById('decrement').addEventListener('click', function () {
        var qtyInput = document.getElementById('quantity');
        if (parseInt(qtyInput.value) > 1) {
            qtyInput.value = parseInt(qtyInput.value) - 1;
        }
    });
</script>-->


</body>
</html>
