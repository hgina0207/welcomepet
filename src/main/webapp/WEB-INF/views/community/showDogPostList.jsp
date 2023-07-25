<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showDogPostList.jsp</title>
<%------ bootstrap ------%>
<%-- viewport --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- link --%>
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%------ bootstrap ------%>

<%-- font link --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<%-- font link --%>

<style type="text/css">
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'SUITE-Regular' !important;
}
/* 
body{
	font-family: 'Gothic A1', sans-serif !important;
} */

.thum{
	height:55px;
	width:55px;
}


#title1{
    font-size:0.9em;
     font-weight:800;
/*     letter-spacing:-0.3px; */
    
    white-space: nowrap; /* 텍스트가 한 줄에서 줄 바꿈하지 않도록 설정 */
    overflow: hidden; /* 내용이 영역을 벗어날 때 숨기기 */
    text-overflow: ellipsis; /* '...'으로 표시 */
    max-width: 200px; /* 최대 텍스트 길이 지정 (원하는 길이로 조정) */
}

#title2{
    font-size:0.9em;
    font-weight:600;
/* 	line-height: 21px; */
}

 #else{
    font-size: 0.7em;
    font-weight:600;
    color: #BABABA;
}

</style>
</head>
<body>
<%-- mobileStyle text-overflow: ellipsis;--%>
  <jsp:include page="../common/topNaviCommu.jsp"></jsp:include>
<%-- ----------- --%>  

<div class="container body">
	
	<%-- 배너이미지 --%>
	<div class="row mb-1">
		<div class="col p-0">
			<%--<img class="img-fluid" src="/welcomepet/resources/board/img/banner.jpg">--%>
		</div>
	</div>

	<%-- 베스트 3 --%>
	<div class="row mt-1 mb-1"> 
		<div class="col">
			<div class="row">
			<c:forEach items="${bestList}" var="bestList">
				<div class="col-12 border-bottom py-2">
					<div class="row">
						<div class="col" onclick="location.href='./showDogPost?show_dog_post_no=${bestList.showDogPostDto.show_dog_post_no}'">
						  <div class="row">
						   <%-- HOT 뱃지 --%>
						   <div class="col-auto d-flex align-items-center pe-0">
						   	<span class="badge rounded-pill text-bg-danger">HOT</span>    
						   </div>
						   <%-- 제목 --%>
						   <div id="title1" class="col-auto d-flex align-items-center ps-1 pe-0">
							  <span class="me-1 text-truncate">
							   ${bestList.showDogPostDto.show_dog_post_title}
							  </span>
						   </div>						   
						   <%-- 이미지 유무 --%>
						   <div class="col d-flex align-items-center ps-1">
						 	<c:if test="${bestList.checkImg > 0}">
							   	  <span style="color:#828282">
							   	  <i class="bi bi-image"></i>
							   	  </span>
					   	    </c:if>
						   </div>	   
						  </div>		
						</div>
					</div>					
				</div>			
			</c:forEach>
			</div>
		</div>
	</div>
	<%-- 여기까지 베스트 3 --%>
	
	<%-- 글 리스트 --%>
	<div class="row mb-4"> 
		<div class="col">
			<div class="row">
			<c:forEach items="${list}" var="map">
				<div class="col-12 border-bottom py-2">
					<div class="row">
						<div class="col" onclick="location.href='./showDogPost?show_dog_post_no=${map.showDogPostDto.show_dog_post_no}'">
						  <%-- 제목 --%>
						  <div class="row mt-1">
						   <div id="title2" class="col-12">
							  <span class="text-break">
							   ${map.showDogPostDto.show_dog_post_title}
							  </span>						  
						   </div>
						  </div>						  						  
						  <%-- 닉네임/날짜/조회수 --%>
						  <div id="else" class="row">
							<div class="col">
								<span class="me-2">
								 ${map.customerDto.customer_nickname}
								</span>
							
								<span class="me-2">
								 <fmt:formatDate value="${map.showDogPostDto.show_dog_post_reg_date}" pattern="yy.MM.dd"/>
								</span>
								
								<span>
								 조회수 ${map.showDogPostDto.show_dog_post_view_count}
								</span>
							</div>
						  </div>					
						</div>						
						<%-- 섬네일 --%>
						<div class="col-2 p-0 embed-responsive embed-responsive-1by1 d-flex justify-content-end">
						 <c:if test="${map.checkImg > 0}">
					   	  <img class="thum h-80 embed-responsive-item rounded" style="object-fit: cover;" alt="X" src="/uploadFiles/WelcomePet_community/${map.postImageDtoList[0].show_dog_post_images_link}" />
						 </c:if>						 
						</div>
						
						<%-- 댓글 수 뱃지 --%>
						<div class="col-2">
						<div class="badge d-flex align-items-center justify-content-center" 
							 style="height:55px; background-color: #F0F0F0;">
						 
						 <c:choose>
							  <c:when test="${map.countComment eq 0}">
							   <div class="row">
							    <div class="col">
	
  	 						    <div class="row mt-1">
							     <div class="col" style="color:#454545;">0</div>
							    </div>
							   
							    <div class="row mt-1">
							     <div class="col" style="color:#9c9c9c; font-size:0.9em">댓글</div>
							    </div>
							   
							    </div>
							   </div>
							  </c:when>	
							  
							  <c:otherwise>
							  <div class="row">
							   <div class="col">
							   
							   <div class="row">
							    <div class="col" style="color:#454545;">${map.countComment}</div>
							   </div>
							   <div class="row mt-1">
							    <div class="col" style="color:#9c9c9c; font-size:0.9em">댓글</div>
							   </div>

							   </div>
							  </div>
							  </c:otherwise>
						  </c:choose>		
						</div>
						</div>
						<%-- -------- --%>
							 
					</div>					
				</div>			
			</c:forEach>
			</div>
		</div>
	</div>
	
</div>



<%-- 새글쓰기 버튼 --%>
<div class="row fixed-bottom mb-5 pb-4" style="height:54">
	<div class="col">
	</div>
	<div class="col-3 d-flex justify-content-center align-items-center">
	 	<a class="btn btn-lg shadow rounded-circle d-flex justify-content-center align-items-center" href="./showDogUpload" 
	 	   style="color:white; height:52px; background-color:#fd7e14">
	 	<i class="bi bi-pencil-square" style="color: white;"></i></a>
	</div>
</div>

<%-- mobileStyle --%>
  <jsp:include page="../common/bottomTabStyle.jsp"></jsp:include>
<%-- ----------- --%>  
</body>
</html>