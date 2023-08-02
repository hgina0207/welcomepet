<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</head>
<body>

	<div class="container align-items-center justify-content-center">

		<div class="row  mt-3 align-items-center">
			<div class="col-1 d-flex ">
				<a class="btn bi bi-arrow-left" role="button" href="./address?customer_no=${sessionUser.customer_no}">
				</a>
			</div>
			<div class="col fw-bold" style="text-align: center;">배송지 추가</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-3 border-bottom "></div>
		<form action="./addAddressProcess" method="post">
		<input type="hidden" name="customer_no" value="${sessionUser.customer_no }">
		<input type="hidden" name="customer_address_default" value=0 >
		<div class="row"> 
			<div class="col-2"> </div>
			  <div class="col">
			<div class="row mt-3">
				<div class="col px-0 ">
					<input class="form-control" type="text" name="customer_address_name"
						placeholder="배송지명">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col px-0 ">
					<input class="form-control" type="text" name="customer_address_receiver"
						placeholder="받으시는 분">
				</div>
			</div>
					<div class="row mt-3">
						
						<div class="col px-0 ">
							<input type="text" class="form-control" id="sample6_postcode"
								placeholder="우편번호">
						</div>
						<div class="col-3 pe-0 ">
							<input type="button" class="btn text-secondary"
								onclick="sample6_execDaumPostcode()"
								style="border: 1px solid #ced4da; height: 100%; font-size: 0.8em;"
								value="우편번호 찾기">
						</div>
						<div class="col-1"></div>


					</div>
					<div class="row mt-2">
						
						<div class="col px-0 ">
							<input type="text" class="form-control" id="sample6_address" name="customer_address_main"
								placeholder="주소"> <span id="guide"
								style="color: #999; display: none"></span>
						</div>
						<div class="col-1"></div>

					</div>
					<div class="row mt-2">
					
						<div class="col px-0 ">
							<input type="text" class="form-control" name="customer_address_detail"
								id="sample6_detailAddress" placeholder="상세주소">
						</div>
						<div class="col-1"></div>

					</div>
					<div class="row mt-1 text-secondary" style="font-size: 0.9em;">
					
						<div class="col px-0 ">
							<input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
						</div>
						<div class="col-1"></div>

					</div>			
			<div class="row">
				<div class="col px-0 mt-3 ">
					<input class="form-control" type="text" name="customer_address_phone"
						placeholder="연락처">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-3"></div>
				<div class="col text-center">
					<button class="btn" style="border: 1px solid #ced4da; height: 100%; font-size: 0.8em;">추가하기</button>
				</div>
				<div class="col-3"></div>
			</div>
			</div>
			<div class="col-2"></div>
			</div>
		</form>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>