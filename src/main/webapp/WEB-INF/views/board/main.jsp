<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>                                                                                                                                                                                  
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>메인</title>
<script >


	let mySessionId = null;
	
	function getSessionId(){
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..
				 console.log(response);
				 console.log(xhr.responseText);
				if(response.result == "success") {
					
					mySessionId = response.customerNo; 

				}
			}
		}
		
		//get
		xhr.open("get", "../customer/getMyId", false); // 딱 여기만 쓰세요...false 동기식 호출..! 권장되지 않음
		xhr.send();		
	}	

	function getSaleList() {
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				 console.log(response);
				document.getElementById("topSaleBox").innerHTML = "";

			for(data of response.topSaleProductList) {
				
				const col1 = document.createElement("div");
				col1.classList.add("col-4", "embed-responsive", "embed-responsive-4by3", "ps-2");
				
				
				
				const rowImg = document.createElement("div");
				rowImg.classList.add("row");
				col1.appendChild(rowImg);
				
				const colImg =	document.createElement("div");
				colImg.classList.add("col");
				colImg.style.position = "relative";
				rowImg.appendChild(colImg);
				
				const discountLabel = document.createElement("label");
				discountLabel.classList.add("discount-label");
				discountLabel.textContent = data.productInfo.product_discount_rate + "%"; // 할인율 정보
				discountLabel.style.position = "absolute"; // 절대 위치 설정
				discountLabel.style.top = "0"; // 상단 위치
				discountLabel.style.left = "10px"; // 왼쪽 위치
				discountLabel.style.backgroundColor = "red"; // 배경색 설정
				discountLabel.style.color = "white"; // 글자색 설정
				discountLabel.style.padding = "2px"; // 내부 여백 설정
				discountLabel.style.border = "red"; // 테두리 설정
				discountLabel.style.borderRadius = "4px"; // 테두리 둥글기 설정
				colImg.appendChild(discountLabel);
				
				const heartBox = document.createElement("a");
				heartBox.classList.add("text-danger", "bi", "bi-heart");
				heartBox.id = "heartBox" + data.productInfo.product_no ;
				heartBox.setAttribute("onclick", "toggleWish("+ data.productInfo.product_no +")");
				heartBox.style.position = "absolute"; // 절대 위치 설정
				heartBox.style.bottom = "0"; // 하단 위치
				heartBox.style.right = "10px"; // 오른쪽 위치
				heartBox.setAttribute("role", "button");
				colImg.appendChild(heartBox);
				
				const img = document.createElement("img");
				img.src = "/uploadFiles/WelcomePet/" + data.productInfo.product_thumbnail; // 이미지 URL 또는 경로 설정
				img.alt = "제품 이미지";
				img.classList.add("embed-responsive-item", "product-thum");
				colImg.appendChild(img);
				
				const rowName = document.createElement("div");
				rowName.classList.add("row")
				rowName.setAttribute("onclick","showProductDetail("+ data.productInfo.product_no +")");
				col1.appendChild(rowName);
				
				
				const colName = document.createElement("div");
				colName.classList.add("col", "fsmid");
				colName.innerText = data.productInfo.product_name;
				rowName.appendChild(colName);
				
				const rowPrice = document.createElement("div");
				rowPrice.classList.add("row");
				col1.appendChild(rowPrice);
				
				const colPrice = document.createElement("div");
				colPrice.classList.add("col", "fw-bold");
				colPrice.innerText = data.productInfo.product_price - data.salePrice +"원";
				rowPrice.appendChild(colPrice);	
				
				document.getElementById("topSaleBox").appendChild(col1);
				
				  refreshMyHeart(data.productInfo.product_no);
				}
			}
		}
		xhr.open("get", "./topSalePrdouct");
		xhr.send();	
	}
	function toggleWish(productNo) {
		
		if(mySessionId == null){
			if(confirm("로그인을 하셔야 이용하실 수 있습니다. 로그인 하시겠습니까?")){
				location.href = "../customer/login";
			}
			
			return;
		}
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 작업..

				refreshMyHeart(productNo);
			}
		}
		
		//get
		xhr.open("get", "./toggleWish?product_no=" + productNo);
		xhr.send();	
		
		}
	
	function refreshMyHeart(productNo){
		
		if(mySessionId == null) return;
		
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				const response = JSON.parse(xhr.responseText);
				// js 렌더링... 작업..
				const heartBox = document.getElementById("heartBox" + productNo);
				
				if(response.isWished){
					heartBox.classList.remove("bi-heart");
					heartBox.classList.add("bi-heart-fill");
				}else{
					heartBox.classList.remove("bi-heart-fill");
					heartBox.classList.add("bi-heart");
				}
			}
		}
		
		//get
		xhr.open("get", "./isWished?product_no=" + productNo);
		xhr.send();
		
	}			
	
	window.addEventListener("DOMContentLoaded", function(){
	    //사실상 시작 시점...
	     getSessionId();
		getSaleList();
	    
	});


</script>
<style type="text/css">
.carousel-inner {
	height: 12em;
}

.product-thum {
	height: 109px;
}
.fLlDaL {
    background-color: rgb(244, 247, 250);
    padding: 3rem 1.6rem 12rem;
}
.fsmid {
	font-size: 0.8em;
}

</style>
</head>
<body>



	<div class="container">
		<jsp:include page="../common/topMainNavi.jsp"></jsp:include>

		<div class="row mt-2 border_bottom text-center fw-bold fs-6">
			<div class="col-3">홈</div>
			<div class="col-3">베스트</div>
			<div class="col-3">특가존</div>
			<div class="col-3">스윕기능</div>
		</div>
		<div class="row mt-3">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="true">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/uploadFiles/WelcomePet/image/MainBanner1.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/uploadFiles/WelcomePet/image/MainBanner2.jpg"
							class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/uploadFiles/WelcomePet/image/MainBanner3.jpg"
							class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="row mt-2 border-top text-center"></div>
		<div class="row mt-3">
			<div class="col-1"></div>
			<div class="col-2">사료</div>
			<div class="col-2">간식</div>
			<div class="col-2">용품</div>
			<div class="col-2">건강</div>
			<div class="col">스타일</div>
		</div>
		<div class="row mt-3 text-center">
		<div class="col-1"></div>
		<div class="col">
			<div class="row ">
			<div class="col-3">
				<a class="btn btn-outline-secondary btn-sm" role="button"
					style="border-radius: 60px;" href="./categoryProduct?main_category_no=1&sub_category_no=1">
					퍼피
				</a>
			</div> 
						<div class="col-3">
				<a class="btn btn-outline-secondary btn-sm" role="button"
					style="border-radius: 60px;" href="./categoryProduct?main_category_no=1&sub_category_no=2">
					어덜트
				</a>
			</div> 
						<div class="col-3">
				<a class="btn btn-outline-secondary btn-sm" role="button"
					style="border-radius: 60px;" href="./categoryProduct?main_category_no=1&sub_category_no=3">
					시니어
				</a>
			</div> 
			<div class="col-3">
				<a class="btn btn-outline-secondary btn-sm" role="button"
					style="border-radius: 60px;" href="./categoryProduct?main_category_no=1&sub_category_no=1">
					퍼피
				</a>
			</div> 
			<div class="col-3">
				<a class="btn btn-outline-secondary btn-sm" role="button"
					style="border-radius: 60px;" href="./categoryProduct?main_category_no=1&sub_category_no=1">
					퍼피
				</a>
			</div> 
			</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		<div class="row mt-3 border-top"> </div>
		<div class="row mt-2">
		<div class="col">
		<div class="row " > 
		<div class="col fs-4 fw-bold"> 핫딜 상품 <i class="bi bi-fire text-danger"></i></div>
		<div class="row mt-2" id="topSaleBox">
		
				</div>
		</div>
		</div>

		</div>
				<div class="row mt-3 border-top"> </div>
		<div class="row mt-2">
		<div class="col">
		<div class="row " > 
		<div class="col fs-4 fw-bold"> 브랜드 샵 </div>
		<div class="row mt-2" >
					<c:forEach items="${topSaleProduct}" var="map">
				<div
					class="col-4 mt-3  embed-responsive embed-responsive-4by3"
					onclick="location.href='./productDetail?product_no=${map.productInfo.product_no}'">
					<div class="row">
					<div class="col">
						<img
							src="/uploadFiles/WelcomePet/${map.productInfo.product_thumbnail}"
							class="embed-responsive-item product-thum" alt="..."> </div>
					</div>
					<div class="row"> 
					<div class="col-1"></div>
					<div class="col fw-bold">${map.productInfo.product_name}</div> 
					</div> 
					<div class="row"> 
					<div class="col"><del>${map.productInfo.product_price}원</del></div> 
					</div> 
					<div class="row"> 
					<div class="col-3 text-danger fw-bold">
					${map.productInfo.product_discount_rate}%
					</div>
					<div class="col fw-bold">
					${map.productInfo.product_price - map.salePrice}원</div> 
					</div> 
				</div>
			</c:forEach></div>
		</div>
		</div>

		</div>
	<jsp:include page="../common/serviceNavi.jsp"></jsp:include>
	<jsp:include page="../common/bottomNavi.jsp"></jsp:include>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
