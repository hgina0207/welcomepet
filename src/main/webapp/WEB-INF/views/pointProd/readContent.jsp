<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readContent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<div class="row fixed-top bg-white">
			<div class="col-12 border-bottom py-2" style="height: 60px;">
				<div class="row">
					<div class="col-2">
						<button onclick="history.back()" class="btn btn-black">
							<i class="btn bi bi-chevron-left p-0"></i>
						</button>
					</div>
					<div class="col-8 mt-2 text-center fw-bold 16px">게시판</div>
					<div class="col-2 dropdown pt-2 ps-4">
						<i class="bi bi-three-dots-vertical" type="button"
							data-bs-toggle="dropdown" aria-expanded="false"></i>
						<ul class="dropdown-menu">
							<c:choose>
								<c:when
									test="${!empty customerUser && customerUser.customer_no == data.customerDto.customer_no}">
									<li><a class="dropdown-item"
										href="./update?board_no=${data.boardDto.board_no}"
										class="text-decoration-none text-black">수정</a></li>
									<li><a class="dropdown-item"
										href="./deleteProcess?board_no=${data.boardDto.board_no}"
										class="text-decoration-none text-black">삭제</a></li>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${empty customerUser}">
											<li><a class="dropdown-item" href="../customer/login"
												class="text-decoration-none text-black">신고</a></li>
										</c:when>
										<c:otherwise>
											<li><a class="dropdown-item" href="../board/report"
												class="text-decoration-none text-black">신고</a></li>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-1">
			<div class="col-12"></div>
		</div>
		<div class="row my-5">
			<div class="col-12">
				<div class="row pt-3">
					<div class="col">
						<div class="row">
							<div class="col">${data.categoryDto.board_category_name}</div>
						</div>
						<div class="row">
							<div class="col fw-semibold fs-4 mb-1">${data.boardDto.board_title}</div>
						</div>

						<div class="row">
							<div class="col fw-semibold">
								${data.customerDto.customer_nickname}</div>
						</div>
						<div class="row">
							<div class="col text-secondary">
								<span class="me-3"> <fmt:formatDate
										value="${data.boardDto.board_reg_date}" pattern="yyyy.MM.dd" /></span>
								<span> 조회수 ${data.boardDto.board_read_count} </span>
							</div>
						</div>
						<div class="row">
							<div class="col mt-3 border-bottom"></div>
						</div>
						<div class="row">
							<div class="col mt-2">
								<c:forEach items="${data.imageDtoList}" var="imageDto">
									<img src="/uploadFiles/${imageDto.board_image_link}"
										class="w-50">
								</c:forEach>
							</div>
						</div>
						<div class="row">
							<div class="col mt-3">${data.boardDto.board_content}</div>
						</div>
						<form action="./insertLikeProcess" method="post">
							<input type="hidden" value="${data.boardDto.board_no}"
								name="board_no">
							<div class="row">
								<div class="col-4"></div>
								<div class="col-4 mt-3 text-center">
									<button type="submit" class="btn btn-outline-danger">
										<i class="bi bi-hand-thumbs-up">${countLikeByBoardNo}</i>
									</button>
								</div>
								<div class="col-4"></div>
							</div>
						</form>
						<div class="row">
							<div class="col-12 mt-3 border-top"></div>
						</div>
						<!-- 댓글 여러개 보이게 하기 -->
						<div class="row">
							<div class="col-12 fw-bold fs-5 mt-3">댓글
								${countCommentByBoardNo}</div>
						</div>
						<div class="row">
							<div class="col-12 mt-3">
								<c:forEach items="${commentList}" var="comment">
									<div class="row">
										<div class="col-12 fw-semibold">
											${comment.customerDto.customer_nickname }</div>
									</div>
									<div class="row">
										<div class="col-12" style="overflow-wrap: break-word;">
											${comment.commentDto.board_comment_content }
											<div class="row">
												<div class="col-12 mb-3">
													<fmt:formatDate
														value="${comment.commentDto.board_comment_reg_date}"
														pattern="yyyy.MM.dd" />
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="row fixed-bottom bg-white">
							<div class="col-12 border-top">
								<form action="./insertComment" method="post">
									<div class="row">
										<div class="col-10 ps-4 pt-1">
											<textarea class="form-control-plaintext"
												name="board_comment_content" placeholder="댓글을 남겨보세요"
												style="height: 40px;"></textarea>
											<input type="hidden" name="board_no"
												value="${data.boardDto.board_no}">
										</div>
										<div class="col-2">
											<c:choose>
												<c:when test="${empty customerUser}">
													<a href="../customer/login"><i
														class="btn bi bi-arrow-up-circle-fill"
														style="font-size: 1.6em;"></i></a>
												</c:when>
												<c:otherwise>
													<button class="btn bi bi-arrow-up-circle-fill"
														type="submit" style="font-size: 1.6em;"></button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</form>
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