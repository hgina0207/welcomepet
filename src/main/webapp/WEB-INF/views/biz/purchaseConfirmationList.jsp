<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/bizTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-3"><jsp:include
					page="../common/bizLeftNavi.jsp"></jsp:include></div>
			<div class="col-9 my-3">
				<div class="row my-2 mx-2">
					<div class="col fs-4 bold text-start">구매확정내역</div>
				</div>
				
				<div class="row my-2 mx-2">
					<div class="col border">
						<div class="row py-2 border-bottom">
							<div class="col fs-5 text-start">목록</div>
						</div>
						<div class="row" id="orderList">
							<div class="col">
								<div class="table-responsive">
									<table class="table text-nowrap">
										<thead>
											<tr>
												<th scope="col"><input class="form-check-input"
													type="checkbox" value="" onclick="toggleCheck(event)"></th>
												<th scope="col">상품주문번호</th>
												<th scope="col">주문번호</th>
												<th scope="col">구매자명</th>
												<th scope="col">구매자연락처</th>
												<th scope="col">수취인명</th>
												<th scope="col">수취인연락처</th>
												<th scope="col">배송지</th>
												<th scope="col">배송메세지</th>
												<th scope="col">주문일</th>
												<th scope="col">상품번호</th>
												<th scope="col">상품명</th>
												<th scope="col">주문수량</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orderList }" var="order">
												<tr>
													<td><input class="form-check-input"
														name="order_product_no" type="checkbox"
														value="${order.orderProductDto.order_product_no }"></td>
													<td>${order.orderProductDto.order_product_no }</td>
													<td>${order.ordersDto.orders_no }</td>
													<td>${order.customerDto.customer_name }</td>
													<td>${order.customerDto.customer_phone }</td>
													<td>${order.ordersDto.orders_receiver_name }</td>
													<td>${order.ordersDto.orders_address_phone }</td>
													<td>${order.ordersDto.orders_address }&nbsp;${order.orders_detail_address }</td>
													<td>${order.ordersDto.orders_shipping_message }</td>
													<td><fmt:formatDate
															value="${order.ordersDto.orders_date }"
															pattern="yyyy.MM.dd" /></td>
													<td>${order.productOptionDto.product_option_no}</td>
													<td>${order.productOptionDto.product_option_name}</td>
													<td>${order.orderProductDto.order_product_quantity }</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>