<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BackOffice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
        crossorigin="anonymous">
    <style>
        .sidebar {
            height: 100vh;
            background-color: #f8f9fa;
            padding-top: 20px;
        }

        /* 링크 스타일 제거 */
        a {
            color: inherit;
            text-decoration: none;
        }

        .
    </style>
</head>

<body>
    <div class="container">
        <%@ include file="../common/adminHead.jsp" %>
            <div class="row">
                <%@ include file="../common/adminTab.jsp" %>

                    <div class="col-9">
                        <div class="container mt-5">
					        <h2 class="mt-4 mb-4">biz 입점 승인 관리</h2>
					            <div class="row bg-light font-weight-bold py-2 rounded-top border">
					                <div class="col-2">사업자등록증</div>
					                <div class="col">사업자등록번호</div>
					                <div class="col">판매자 전달사항</div>
					                <div class="col">관리자 메모</div>
					                <div class="col-2"></div>
					            </div>
					            <form action="./bizApproval" method="post">
					            	<div class="row border py-2">
						            
						                <div class="col-2 d-flex justify-content-center align-items-center">
						                    <img src="http://via.placeholder.com/200x200" class="img-thumbnail" id="biz_approval_request_document" data-bs-toggle="modal" data-bs-target="#businessLicenseModal">
						                </div>
						                <div class="col d-flex align-items-center">010-12-15478</div>
						                <div class="col">
						                    <textarea class="form-control" style="height: 140px;" name="biz_approval_message"></textarea>
						                </div>
						                <div class="col">
						                    <textarea class="form-control" style="height: 140px;" name="biz_approval_emp_memo"></textarea>
						                </div>
						                <div class="col-2 d-flex align-items-center justify-content-center">
						                    <div class="btn-group-vertical">
						                        <button name="buttonType" value="accept" class="btn btn-success mb-2">승인</button>
						                        <button name="buttonType" value="reject" class="btn btn-danger">거절</button>
						                    </div>
						                </div>
						           
					           		</div>
					            </form>
					    </div>
                    </div>
            </div>
    </div>
    <div class="modal fade" id="businessLicenseModal" tabindex="-1" aria-labelledby="businessLicenseModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="businessLicenseModalLabel">사업자 등록증</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img src="http://via.placeholder.com/200x200" alt="">
            </div>
        </div>
    </div>
</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>