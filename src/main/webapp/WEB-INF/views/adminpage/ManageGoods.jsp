<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ECIGA</title>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/icon/favicon_lil.ico">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/addgoods.css" rel="stylesheet" type="text/css">
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
		<!-- content-head -->
		<div class="contents">
			<div id="btnAddgoodsBox">
				<button id="btnAddgoods">제품 추가</button>
			</div>
			<div class="product-container">
				<!-- 상품 이미지 및 상품명 반복 영역 
				<c:forEach var="product" items="${productList}">
					<div class="product-item">
						<img src="${pageContext.request.contextPath}/assets/img/${product.image}" alt="제품 이미지" class="product-image">
						<p>${product.name}</p>
						<button class="edit-btn" data-product-id="${product.id}">
							<img src="${pageContext.request.contextPath}/assets/img/icon/edit.png" alt="수정 아이콘" class="edit-icon"> 수정
						</button>
						
					</div>
				</c:forEach>
				 //상품 이미지 및 상품명 반복 영역 -->
				<c:forEach var="product" items="${goodsList}">
					<div class="product-item">
						<img src="${pageContext.request.contextPath}/upload/${product.imgName}" alt="제품 이미지" class="product-image">
						<!-- <img src="${pageContext.request.contextPath}/assets/img/${product.imgName}" alt="제품 이미지" class="product-image"> -->
						<!-- imgPath로 수정 -->
						<p>${product.name}</p>
						<p>${product.price} 원</p>
						<!-- 상품 설명 추가 -->
						<button class="edit-btn" data-product-id="${product.gno}">
							<img src="${pageContext.request.contextPath}/assets/img/icon/edit.png" alt="수정 아이콘" class="edit-icon"> 수정
						</button>
					</div>
				</c:forEach>
			</div>
			<!-- 제품 등록 모달 -->
			<div id="modal" class="modal">
				<div class="modal-content">
					<h1>상품 등록</h1>
					<form id="addgoods" action="${pageContext.request.contextPath}/admin/addgoods" method="post" enctype="multipart/form-data">
						<div class="mdform-group">
							<label for="image">이미지 추가</label> <input type="file" id="image" name="image" accept="image/*" multiple>
							<div id="image-preview" class="image-preview">
								<!-- 이미지 미리보기 영역 -->
							</div>
						</div>
						<div class="mdform-group">
							<input type="hidden" id="no" name="no">
						</div>
						<div class="mdform-group">
							<label for="price">가격</label> <input type="text" id="price" name="price" placeholder="가격을 입력하세요">
						</div>
						<div class="mdform-group">
							<label for="title">상품명</label> <input type="text" id="title" name="name" placeholder="상품명을 입력하세요">
						</div>
						<div class="mdform-group">
							<label for="description">상품 설명</label>
							<textarea id="description" name="descript" rows="4" placeholder="상품 설명을 입력하세요"></textarea>
						</div>

						<div class="mdbutton-group">
							<button type="submit">등록</button>
							<button type="reset">초기화</button>
						</div>
					</form>


				</div>
			</div>
			<!-- 수정 모달 -->
			<div id="editModal" class="modal">
				<div class="modal-content">
					<h1>상품 수정</h1>
					<form id="editProductForm">
						<div class="mdform-group">
							<label for="editImage">이미지 수정</label> <input type="file" id="editImage" accept="image/*" multiple>
							<div id="editImagePreview" class="image-preview">
								<!-- 이미지 미리보기 영역 -->
							</div>
						</div>
						<div class="mdform-group">
							<label for="editPrice">가격</label> <input type="text" id="editPrice" placeholder="가격을 입력하세요">
						</div>
						<div class="mdform-group">
							<label for="editTitle">상품명</label> <input type="text" id="editTitle" placeholder="상품명을 입력하세요">
						</div>
						<div class="mdform-group">
							<label for="editDescription">상품 설명</label>
							<textarea id="editDescription" rows="4" placeholder="상품 설명을 입력하세요"></textarea>
						</div>
						<div class="mdform-group">
							<p>색상</p>
						</div>
						<div class="filter-section">
							<div class="color-grid">
								<!-- 색깔 버튼들... -->
								<div>
									<button class="color-circle black"></button>
									<p>Black</p>
								</div>
								<div>
									<button class="color-circle white"></button>
									<p>White</p>
								</div>
								<div>
									<button class="color-circle "></button>
									<p>undefined</p>
								</div>
								<div>
									<button class="color-circle "></button>
									<p>undefined</p>
								</div>
								<div>
									<button class="color-circle "></button>
									<p>undefined</p>
								</div>
								<div>
									<button class="color-circle "></button>
									<p>undefined</p>
								</div>
								<div>
									<button class="color-circle "></button>
									<p>undefined</p>
								</div>
							</div>
						</div>
						<div class="mdbutton-group">
							<button type="submit">수정</button>
							<button type="button" id="cancelEdit">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- //footer -->
	</div>
	<!-- //content-head -->
	<script>
        // 제품 추가 버튼과 모달 엘리먼트를 선택
        const btnAddgoods = document.querySelector('#btnAddgoods');
        const modal = document.querySelector('#modal');

        // 제품 추가 버튼 클릭 시 모달 열기
        btnAddgoods.addEventListener('click', function () {
            modal.style.display = 'flex'; // 모달 열기
        });

        // 모달 바깥 부분 클릭 시 모달 닫기
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = 'none'; // 모달 닫기
            }
        };
        const imageInput = document.querySelector('#image');
        const imagePreview = document.querySelector('#image-preview');
        let selectedImages = []; // 이미지 파일을 저장할 배열

        // 이미지가 선택되면 기존 이미지 목록에 추가하여 미리보기 표시
        imageInput.addEventListener('change', function (event) {
            const files = event.target.files;

            // 선택한 파일을 배열에 추가
            selectedImages = [...selectedImages, ...Array.from(files)];

            // 이미지 미리보기 초기화
            imagePreview.innerHTML = '';

            // 선택된 모든 파일에 대해 미리보기 생성
            selectedImages.forEach((file, index) => {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;

                    // 미리보기 이미지 삭제 아이콘 (X 표시)
                    const deleteButton = document.createElement('span');
                    deleteButton.innerHTML = '&times;'; // X 표시
                    deleteButton.classList.add('delete-icon'); // 클래스 추가
                    deleteButton.onclick = function () {
                        // 이미지 삭제
                        selectedImages.splice(index, 1); // 배열에서 이미지 제거
                        renderPreview(); // 미리보기 업데이트
                    };

                    const container = document.createElement('div');
                    container.classList.add('image-container'); // 이미지 컨테이너 클래스 추가
                    container.appendChild(img);
                    container.appendChild(deleteButton);
                    imagePreview.appendChild(container);
                };
                reader.readAsDataURL(file);
            });
        });

        // 미리보기를 업데이트하는 함수
        function renderPreview() {
            imagePreview.innerHTML = '';
            selectedImages.forEach((file, index) => {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;

                    // 이미지 삭제 아이콘 (X 표시)
                    const deleteButton = document.createElement('span');
                    deleteButton.innerHTML = '&times;';
                    deleteButton.classList.add('delete-icon');
                    deleteButton.onclick = function () {
                        selectedImages.splice(index, 1);
                        renderPreview();
                    };

                    const container = document.createElement('div');
                    container.classList.add('image-container');
                    container.appendChild(img);
                    container.appendChild(deleteButton);
                    imagePreview.appendChild(container);
                };
                reader.readAsDataURL(file);
            });
        };

        // 제품 수정 모달 엘리먼트를 선택
        const editModal = document.querySelector('#editModal');
        const editProductForm = document.querySelector('#editProductForm');
        const editImagePreview = document.querySelector('#editImagePreview');
        const editPrice = document.querySelector('#editPrice');
        const editTitle = document.querySelector('#editTitle');
        const editDescription = document.querySelector('#editDescription');
        let selectedEditImages = []; // 수정용 이미지 배열

        // 수정 버튼 클릭 시 수정 모달 열기
        const editButtons = document.querySelectorAll('.edit-btn');
        editButtons.forEach((button, index) => {
            button.addEventListener('click', function () {
                const productId = this.dataset.productId;
                openEditModal(productId); // 제품 ID를 이용하여 수정할 제품 정보 불러오기
            });
        });

        // 수정 모달 창 열기 및 기존 정보 불러오기
        function openEditModal(productId) {
            // 서버에서 제품 정보를 받아옴 (여기서는 예시 데이터로 대체)
            const productData = {
                price: '12000',
                title: '하이브리드 3.0',
                description: '하이브리드 3.0 제품 설명...',
                colors: ['black', 'white'],
                images: [] // 여기에 이미지 데이터를 추가
            };

            // 폼에 데이터 채우기
            editPrice.value = productData.price;
            editTitle.value = productData.title;
            editDescription.value = productData.description;

            // 이미지 미리보기 초기화 및 채우기
            selectedEditImages = productData.images;
            renderEditPreview();

            // 모달 열기
            editModal.style.display = 'flex';
        }

        // 이미지 미리보기 렌더링 (수정용)
        function renderEditPreview() {
            editImagePreview.innerHTML = ''; // 기존 미리보기 초기화
            selectedEditImages.forEach((file, index) => {
                const img = document.createElement('img');
                img.src = URL.createObjectURL(file);

                // 삭제 아이콘 (X 표시)
                const deleteButton = document.createElement('span');
                deleteButton.innerHTML = '&times;';
                deleteButton.classList.add('delete-icon');
                deleteButton.onclick = function () {
                    selectedEditImages.splice(index, 1);
                    renderEditPreview();
                };

                const container = document.createElement('div');
                container.classList.add('image-container');
                container.appendChild(img);
                container.appendChild(deleteButton);
                editImagePreview.appendChild(container);
            });
        }

        // 취소 버튼 클릭 시 수정 모달 닫기
        document.getElementById('cancelEdit').addEventListener('click', function () {
            editModal.style.display = 'none'; // 수정 모달 닫기
        });

    </script>

</body>

</html>