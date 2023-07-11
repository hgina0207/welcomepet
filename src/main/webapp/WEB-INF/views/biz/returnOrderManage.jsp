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
					<div class="col fs-4 bold text-start">반품관리</div>
				</div>
				<div class="row my-2 mx-2">
					<div class="col"></div>
					<div class="col border-bottom border-4 border-primary">
						<div class="btn" id="newReturnOrderTab"
							onclick="loadNewReturnOrderTab()">반품요청</div>
					</div>
					<div class="col">
						<div class="btn" id="completeReturnOrderTab"
							onclick="loadCompleteReturnOrderTab()">반품완료</div>
					</div>
					<div class="col"></div>
				</div>
				<div class="row my-2 mx-2">
					<div class="col border">
						<div class="row py-2 border-bottom">
							<div class="col fs-5 text-start">목록</div>
						</div>
						<div class="row py-2 border-bottom">
							<div class="col text-start">
								<button class="btn btn-outline-secondary"
									id="returnCompleteButton" onclick="changeOrderStatusTo7()">반품확인</button>
							</div>
						</div>
						<div class="row" id="orderList">
							<div class="col">
								<div class="table-responsive">
									<table class="table text-nowrap">
										<thead>
											<tr>
												<th scope="col"><input class="form-check-input"
													type="checkbox" value="" onclick="toggleCheck()"></th>
												<th scope="col">상품주문번호</th>
												<th scope="col">주문번호</th>
												<th scope="col">구매자명</th>
												<th scope="col">구매자연락처</th>
												<th scope="col">반품사유</th>
												<th scope="col">반품상세사유</th>
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
													<td><button class="btn px-0 py-0"
															data-bs-toggle="modal" data-bs-target="#orderDetailModal"
															onclick='showModal(${order.jsonData})'>${order.orderProductDto.order_product_no }</button></td>
													<td>${order.ordersDto.orders_no }</td>
													<td>${order.customerDto.customer_name }</td>
													<td>${order.customerDto.customer_phone }</td>
													<td>${order.returnExchangeReasonDto.return_exchange_reason_name }</td>
													<td>${order.returnDto.return_reason_detail }</td>
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
	<div class="modal fade" id="orderDetailModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5">주문 상세보기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<div class="row my-2">
						<div class="col border">
							<div class="row py-2 border-bottom">
								<div class="col fw-bold text-start">주문상세정보</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="row border-bottom">
										<div class="col-3 bg-light">상품명</div>
										<div class="col" id="productName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">옵션</div>
										<div class="col" id="productOptionName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">상품주문상태</div>
										<div class="col" id="orderStatus"></div>
										<div class="col-3 bg-light">주문일</div>
										<div class="col" id="orderDate"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">구매자명</div>
										<div class="col" id="customerName"></div>
									</div>
									<div class="row border-bottom">
										<div class="col-3 bg-light">상품가격</div>
										<div class="col" id="productPrice"></div>
										<div class="col-3 bg-light">주문수량</div>
										<div class="col" id="orderQuantity"></div>
									</div>
									<div class="row">
										<div class="col-3 bg-light">총금액</div>
										<div class="col" id="totalPrice"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col border">
							<div class="row py-2 border-bottom">
								<div class="col fw-bold text-start">배송정보</div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">택배사</div>
								<div class="col" id="shippingCompanyName"></div>
								<div class="col-3 bg-light">송장번호</div>
								<div class="col" id="shippingTrackingNo"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">수취인명</div>
								<div class="col" id="receiverName"></div>
								<div class="col-3 bg-light">연락처</div>
								<div class="col" id="receiverPhone"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">배송지</div>
								<div class="col" id="shippingAddress"></div>
							</div>
							<div class="row border-bottom">
								<div class="col-3 bg-light">배송메모</div>
								<div class="col" id="shippingMemo"></div>
							</div>
							<div class="row">
								<div class="col" id="addressMap"
									style="width: 500px; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d62878260103ab0e7c7d176b029a8aa6"></script>

	<script>
		function showModal(orderData){
			
			// 주문정보
	        const productName = document.getElementById("productName");
	        productName.innerText = orderData.productDto.product_name;
			
	        const productOptionName = document.getElementById("productOptionName");
	        if (orderData.productOptionNum != 1) {
	            productOptionName.innerText = orderData.productOptionDto.product_option_name;
	        }else{
	        	productOptionName.innerText ="-";
	        }
	
	        const orderStatus = document.getElementById("orderStatus");
	        orderStatus.innerText = orderData.orderProductStatusDto.order_product_status_name;
	
	        const orderDate = document.getElementById("orderDate");
	        const formattedDate = formatDate(new Date(orderData.ordersDto.orders_date));
	        orderDate.innerText = formattedDate;
	
	        const customerName = document.getElementById("customerName");
	        customerName.innerText = orderData.customerDto.customer_name;
	
	        const productPrice = document.getElementById("productPrice");
	        productPrice.innerText = orderData.orderProductDto.order_product_price;
	
	        const orderQuantity = document.getElementById("orderQuantity");
	        orderQuantity.innerText = orderData.orderProductDto.order_product_quantity;
	
	
	        const totalPrice = document.getElementById("totalPrice");
	        totalPrice.innerText = orderData.orderProductDto.order_product_price * orderData.orderProductDto.order_product_quantity;
	
	
	        // 배송정보
	        if(orderData.shippingNum>=1){
	        	const shippingCompanyName = document.getElementById("shippingCompanyName");
	            shippingCompanyName.innerText = orderData.shippingCompanyDto.shipping_company_name;
	
	            const shippingTrackingNo = document.getElementById("shippingTrackingNo");
	            shippingTrackingNo.innerText = orderData.shippingDto.shipping_tracking_no;
	        }
	        
	
	        const receiverName = document.getElementById("receiverName");
	        receiverName.innerText = orderData.ordersDto.orders_receiver_name;
	
	        const receiverPhone = document.getElementById("receiverPhone");
	        receiverPhone.innerText = orderData.ordersDto.orders_address_phone;
	
	        const shippingAddress = document.getElementById("shippingAddress");
	        shippingAddress.innerText = orderData.ordersDto.orders_address + " " + orderData.ordersDto.orders_detail_address;
	
	        const shippingMemo = document.getElementById("shippingMemo");
	        shippingMemo.innerText = orderData.ordersDto.orders_shipping_message;
	
	        const addressMap = document.getElementById("addressMap");
	        
	        
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	        
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	
	            	const addressData=response.documents[0];
	            	var markerPosition=new kakao.maps.LatLng(addressData.y, addressData.x);
	            	
	            	
	            	var options = {
	                        center: markerPosition,
	                        level: 3
	                    };    
	            	var map = new kakao.maps.Map(addressMap, options);
	            	var marker = new kakao.maps.Marker({
	        		    position: markerPosition
	        		});
	            	marker.setMap(map);
	            }
	        }
	
		
	        xhr.open("post", "https://dapi.kakao.com/v2/local/search/address.json");
	        xhr.setRequestHeader("Authorization", "KakaoAK e4a5b9e6ac9298f7e5a5085408e299b8");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("query="+orderData.ordersDto.orders_address)
	        
	        
	
	        const orderDetailModal = document.getElementById("orderDetailModal");
	        orderDetailModal.style.display='block';
		}
		
		function loadOrderTable(response){
			const orderList=document.getElementById('orderList');
			orderList.innerHTML='';
        	
			const col=document.createElement("div");
			col.classList.add("col");
			orderList.appendChild(col);
			
			const div=document.createElement("div");
			div.classList.add("table-responsive");
			col.appendChild(div);
			
			var table = document.createElement("table");
		    table.classList.add("table", "text-nowrap");

		    var thead = document.createElement("thead");
		    var tbody = document.createElement("tbody");

		    var tableHeaders = ["상품주문번호", "주문번호", "구매자명", "구매자연락처", "반품사유", "반품상세사유", "주문일", "상품번호", "상품명", "주문수량"];
			
		    var headerRow = document.createElement("tr");
			var checkboxTh = document.createElement("th");
		    
		    const headerCheckboxInput = document.createElement("input");
		    headerCheckboxInput.className = "form-check-input";
		    headerCheckboxInput.name = "order_product_no";
		    headerCheckboxInput.type = "checkbox";
		    checkboxTh.appendChild(headerCheckboxInput);
		    
		    headerRow.appendChild(checkboxTh);
			
		    
		    for (tableHeader of tableHeaders) {
		      var th = document.createElement("th");
		      th.textContent = tableHeader;
		      headerRow.appendChild(th);
		    }
		    thead.appendChild(headerRow);
		    
        	for(order of response.orderList){
        		
        		const tr = document.createElement("tr");

        		const checkboxTd = document.createElement("td");
        		const checkboxInput = document.createElement("input");
        		checkboxInput.className = "form-check-input";
        		checkboxInput.name = "order_product_no";
        		checkboxInput.type = "checkbox";
        		checkboxInput.value = order.orderProductDto.order_product_no;
        		checkboxTd.appendChild(checkboxInput);
        		tr.appendChild(checkboxTd);

        		const orderProductNoTd = document.createElement("td");
				const button=document.createElement("button");
        		
        		button.classList.add('btn','px-0','py-0');
        		button.setAttribute('data-bs-toggle','modal');
        		button.setAttribute('data-bs-target','#orderDetailModal');
        		button.addEventListener('click',function(){
        			showModal(order);
        		});
        		button.textContent = order.orderProductDto.order_product_no;
        		orderProductNoTd.appendChild(button);
        		tr.appendChild(orderProductNoTd);

        		const ordersNoTd = document.createElement("td");
        		ordersNoTd.textContent = order.ordersDto.orders_no;
        		tr.appendChild(ordersNoTd);

        		const customerNameTd = document.createElement("td");
        		customerNameTd.textContent = order.customerDto.customer_name;
        		tr.appendChild(customerNameTd);

        		const customerPhoneTd = document.createElement("td");
        		customerPhoneTd.textContent = order.customerDto.customer_phone;
        		tr.appendChild(customerPhoneTd);

        		const returnExchangeReasonNameTd = document.createElement("td");
        		returnExchangeReasonNameTd.textContent = order.returnExchangeReasonDto.return_exchange_reason_name;
        		tr.appendChild(returnExchangeReasonNameTd);

        		const returnReasonDetailTd = document.createElement("td");
        		returnReasonDetailTd.textContent = order.returnDto.return_reason_detail;
        		tr.appendChild(returnReasonDetailTd);
        		
        		const ordersDateTd = document.createElement("td");
        		const formattedDate = new Date(order.ordersDto.orders_date).toLocaleDateString("en-US", { year: "numeric", month: "2-digit", day: "2-digit" });
        		ordersDateTd.textContent = formattedDate;
        		tr.appendChild(ordersDateTd);

        		const productOptionNoTd = document.createElement("td");
        		productOptionNoTd.textContent = order.productOptionDto.product_option_no;
        		tr.appendChild(productOptionNoTd);

        		const productOptionNameTd = document.createElement("td");
        		productOptionNameTd.textContent = order.productOptionDto.product_option_name;
        		tr.appendChild(productOptionNameTd);

        		const orderProductQuantityTd = document.createElement("td");
        		orderProductQuantityTd.textContent = order.orderProductDto.order_product_quantity;
        		tr.appendChild(orderProductQuantityTd);

        		tbody.appendChild(tr);
        		
        		
        	}
        	
        	table.appendChild(thead);
        	table.appendChild(tbody);
        	
        	div.appendChild(table);
        	
		}
		
		
		
		function changeOrderStatusTo7(){
			const orderList=document.getElementById("orderList");
			const checkedOrderList=orderList.querySelectorAll('input[name="order_product_no"]:checked');
			
			var orderProductNoList=[];
			for(var i=0;i<checkedOrderList.length;i++){
				orderProductNoList.push(checkedOrderList[i].value);
			}
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	
	            	loadNewReturnOrderTab();
	            		    
	            }
	        }
	
		
	        xhr.open("post", "./changeOrderStatusTo7");
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.send("orderProductNoList="+orderProductNoList);
		}
		
		function loadNewReturnOrderTab() {
			
			const newReturnOrderTab=document.getElementById("newReturnOrderTab");
			if (!newReturnOrderTab.parentNode.classList.contains('border-bottom',
					'border-4', 'border-primary')) {
				newReturnOrderTab.parentNode.classList.add('border-bottom',
						'border-4', 'border-primary');
			}
			
			const completeReturnOrderTab = document.getElementById("completeReturnOrderTab");
			if (completeReturnOrderTab.parentNode.classList.contains('border-bottom',
					'border-4', 'border-primary')) {
				completeReturnOrderTab.parentNode.classList.remove('border-bottom',
						'border-4', 'border-primary');
			}
			
			
			const returnCompleteButton = document
					.getElementById("returnCompleteButton");
			if (returnCompleteButton.closest('.row').classList
					.contains('visually-hidden')) {
				returnCompleteButton.closest('.row').classList.remove('visually-hidden');
			}
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadOrderTable(response);
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getNewReturnOrder");
	        xhr.send();
			
		}
		
		function loadCompleteReturnOrderTab() {
			
			const newReturnOrderTab=document.getElementById("newReturnOrderTab");
			if (newReturnOrderTab.parentNode.classList.contains('border-bottom',
					'border-4', 'border-primary')) {
				newReturnOrderTab.parentNode.classList.remove('border-bottom',
						'border-4', 'border-primary');
			}
			
			const completeReturnOrderTab = document.getElementById("completeReturnOrderTab");
			if (!completeReturnOrderTab.parentNode.classList.contains('border-bottom',
					'border-4', 'border-primary')) {
				completeReturnOrderTab.parentNode.classList.add('border-bottom',
						'border-4', 'border-primary');
			}
			
			
			const returnCompleteButton = document
					.getElementById("returnCompleteButton");
			if (!returnCompleteButton.closest('.row').classList
					.contains('visually-hidden')) {
				returnCompleteButton.closest('.row').classList.add('visually-hidden');
			}
			
			
			const xhr = new XMLHttpRequest();
			
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	            	const response = JSON.parse(xhr.responseText);
	            	loadOrderTable(response);
	            		    
	            }
	        }
	
		
	        xhr.open("get", "./getCompleteReturnOrder");
	        xhr.send();
			
		}
		
		function formatDate(date) {
			  const year = date.getFullYear();
			  const month = String(date.getMonth() + 1).padStart(2, '0');
			  const day = String(date.getDate()).padStart(2, '0');
			  return year+"."+month+"."+day;
			}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>