<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naromgram</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    
   	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<div class="d-flex">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<section id="content" class="mt-3">
				<div>
					<c:forEach var="post" items="${posts}">
						<div id="mainContent" class="border ml-5">
							<div class="d-flex align-items-end pl-2 pt-1" id="postHead">
								<div class="small">
									<h4>${post.loginId}</h4>
								</div>
								<div class="small text-secondary ml-2 mb-2">
									<fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd hh:mm" />
								</div>
							</div>			
							<div>
								<img src="${post.imagePath}" width="650px">
							</div>
							<div class="d-flex align-items-center ml-1">
								<c:choose>
									<c:when test="${post.like eq false}">
										<i class="bi bi-heart" id="heartInput${post.id}" data-like="${post.id}" style="font-size:20px; color: red;"></i>
									</c:when>
									<c:otherwise>
										<i class="bi bi-heart-fill" id="heartCancel${post.id}" data-like="${post.id}" style="font-size:20px; color: red;"></i>
									</c:otherwise>
								</c:choose>
								<span class="text-center ml-2">좋아요 ${post.likeCount}개</span>
							</div>
							<div class="ml-2 mt-1">
								<h4>${post.tag}</h4>
								<span style="word_wrap:break-word;  word-break: break-all;">${post.content}</span>
							</div>
							<div class="mt-2">
								<h6 id="commentHead">댓글</h6>
								<div class="input-group mb-3">
								  	<input type="text" class="form-control" id="commentInput${post.id}" placeholder="댓글을 입력하세요">
							    	<button type="button" class="input-group-text comment-btn" data-id="${post.id}" >등록</button>
								</div>
							</div>
							<c:forEach var="comment" items="${post.commentList}">				
								<div class="d-flex align-items-start ml-2 mt-1">
									<h6>${comment.loginId}</h6>&nbsp;
									<span>${comment.content}</span>
								</div>
							</c:forEach>
						</div>
						<br>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>

	<script src="/static/js/form.js"></script>
	<script>
		$(document).ready(function() {
			
			$(".bi-heart-fill").on("click", function() {
				let postId = $(this).data("like");
				
				$.ajax({
					type:"get"
					, url:"/post/unlike"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success"){
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
					}
					, error:function() {
						alert("좋아요 취소 에러");
					}
				});
			});
			
			$(".bi-heart").on("click", function() {
				let postId = $(this).data("like");
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success"){
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					}
					, error:function() {
						alert("좋아요 에러");
					}
				});
			});
			
			$(".comment-btn").on("click", function() {
				let postId = $(this).data("id");
				
				// 버튼의 이전 태그를 객체화
				let comment = $(this).prev().val();
				
				// let comment = $("#commentInput" + postId).val();
				
				
				if(!valueCheck($("#commentInput" + postId), "댓글")){
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "content":comment}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 등록 실패");
						}
					}
					, error:function() {
						alert("댓글 등록 에러");
					}
				});
			});
		});
	</script>
</body>
</html>