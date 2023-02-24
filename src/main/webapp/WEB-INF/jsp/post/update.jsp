<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<h1>글 수정</h1>
					<div id="imageBox">
						<input type="file" id="fileInput" value="${post.imagePath}" class="form-control" onchange="loadFile(this)">
						<div id="imageTag">
							<img id="imgBox" src="${post.imagePath}" width="700px">
						</div>
					</div>
					<input type="text" id="title" placeholder="제목, 태그" class="form-control mt-4" value="${post.tag}">
					<textarea rows="5" cols="80" id="contentInput" placeholder="내용" class="form-control my-3">${post.content }</textarea>
					<button type="button" id="updateBtn" class="btn btn-block btn-primary" data-id="${post.id}">등록</button>
				</div>
			</section>
		</div>
	</div>
	
	<script src="/static/js/form.js"></script>
	<script>
		function loadFile(input) {
			var file = input.files[0];
			$("#imgBox").attr("src", URL.createObjectURL(file));
		}
		
		$(document).ready(function() {
			
			$("#updateBtn").on("click", function() {
				let id = $(this).data("id");
				let title = $("#title").val();
				let content = $("#contentInput").val();
				
				if($("#fileInput")[0].files[0] == 0) {
					$("#fileInput")[0].files[0] = $("#fileInput").val();
				}
				
				if(!valueCheck($("#contentInput"), "내용")) {
					return;
				}
				
				var formData = new FormData();
				formData.append("postId", id);
				formData.append("title", title);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/update"
					, data:formData
					, enctype:"multipart/form-data"	// 파일 업로드 필수 항목
					, processData:false	// 파일 업로드 필수 항목
					, contentType:false	// 파일 업로드 필수 항목
					, success:function(data) {
						if(data.result == "success"){
							location.href = "/post/main/view";
						} else {
							alert("게시글 수정 실패");
						}
					}
					, error:function() {
						alert("게시글 수정 에러");
					}
				});
			});
		});
	</script>
</body>
</html>