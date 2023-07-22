<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="row">
		<div class="col">
			<div class="row py-2 px-2" style="background-color: rgb(19, 22, 28);">
				<div class="col">
					<div class="row text-start">
						<div class="col" style="font-family: 'Do Hyeon', sans-serif;">
							<span class="fs-2">어서오개</span> <span class="fs-4">
								business</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-start"
				style="background-color: rgb(29, 33, 42);">
				<div class="col">
					<div class="row">
						<div class="col px-4 py-2 d-grid">
							<div class="py-2 btn text-white" onclick="toggleMenuList(event)">
								<div class="row text-start">
									<div class="col-2 fw-bold fs-5 px-2 text-center">
										<i class="far fa-credit-card"></i>
									</div>
									<div class="col fw-bold fs-5">주문 관리</div>
									<div class="col-1 fw-bold fs-5 text-end updownIcon">
										<i class="fas fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="row visually-hidden menuList">
								<div class="col-2"></div>
								<div class="col">
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/orderManage">주문확인/발송관리</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/purchaseConfirmationList">구매확정 내역</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/cancelOrderManage">취소 관리</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/returnOrderManage">반품 관리</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/exchangeOrderManage">교환 관리</a>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col px-4 py-2 d-grid">
							<div class="py-2 btn text-white" onclick="toggleMenuList(event)">
								<div class="row text-start">
									<div class="col-2 fw-bold fs-5 px-2 text-center">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="col fw-bold fs-5">상품 관리</div>
									<div class="col-1 fw-bold fs-5 text-end updownIcon">
										<i class="fas fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="row visually-hidden menuList">
								<div class="col-2"></div>
								<div class="col">
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/productRegister">상품 등록</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/productList">상품 목록</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/adProductRegister">광고상품 등록</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/adProductList">광고상품 목록</a>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col px-4 py-2 d-grid">
							<div class="py-2 btn text-white" onclick="toggleMenuList(event)">
								<div class="row text-start">
									<div class="col-2 fw-bold fs-5 px-2 text-center">
										<i class="fas fa-money-check-alt"></i>
									</div>
									<div class="col fw-bold fs-5">정산 관리</div>
									<div class="col-1 fw-bold fs-5 text-end updownIcon">
										<i class="fas fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="row visually-hidden menuList">
								<div class="col-2"></div>
								<div class="col">
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/settlementList">정산 내역</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/settlementListDetail">정산 상세 내역</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/accountRegister">정산계좌등록</a>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col px-4 py-2 d-grid">
							<div class="py-2 btn text-white" onclick="toggleMenuList(event)">
								<div class="row text-start">
									<div class="col-2 fw-bold fs-5 px-2 text-center">
										<i class="fas fa-clipboard-list"></i>
									</div>
									<div class="col fw-bold fs-5">문의/리뷰 관리</div>
									<div class="col-1 fw-bold fs-5 text-end updownIcon">
										<i class="fas fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="row visually-hidden menuList">
								<div class="col-2"></div>
								<div class="col">
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/productInquiryList">문의 관리</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="../biz/productReviewList">리뷰 관리</a>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="row">
						<div class="col px-4 py-2 d-grid">
							<div class="py-2 btn text-white" onclick="toggleMenuList(event)">
								<div class="row text-start">
									<div class="col-2 fw-bold fs-5 px-2 text-center">
										<i class="fas fa-chart-line"></i>
									</div>
									<div class="col fw-bold fs-5">통계 및 분석</div>
									<div class="col-1 fw-bold fs-5 text-end updownIcon">
										<i class="fas fa-angle-down"></i>
									</div>
								</div>
							</div>
							<div class="row visually-hidden menuList">
								<div class="col-2"></div>
								<div class="col">
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="./salesPerformance">판매성과</a>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<a class="btn text-decoration-none text-white"
												href="./productPerformance">상품성과</a>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function toggleMenuList(event) {
			const menuTitle = event.currentTarget;
			const menuList = menuTitle.closest('.col').querySelector(
					'.menuList');
			const icon = menuTitle.querySelector('.updownIcon')
			console.log(menuTitle);
			if (!menuList.classList.contains('visually-hidden')) {
				menuList.classList.add('visually-hidden');

				icon.innerHTML = '';

				const i = document.createElement('i');
				i.classList.add('fas', 'fa-angle-down');

				icon.appendChild(i);

			} else {
				menuList.classList.remove('visually-hidden');

				icon.innerHTML = '';

				const i = document.createElement('i');
				i.classList.add('fas', 'fa-angle-up');

				icon.appendChild(i);
			}
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>