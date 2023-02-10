<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naromgram</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
   	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
<div id="wrap">
	<section class="contents d-flex justify-content-center">
		<div class="join d-flex justify-content-center mt-4">
			<div class="join-box my-4">
				<h1 class="text-center mb-5">Naromgram</h1>
				<div class="text-secondary text-center">찾으시려는 계정의 아이디와 이메일을 <br>입력해 주세요.</div>
				<br>
				<input type="text" placeholder="아이디" id="idInput" class="form-control" >
				<input type="text" placeholder="이메일" id="emailInput" class="form-control mt-3">
				<div class="text-center">
					<span id="searchFail" class="text-danger small" style="display:none">일치하는 id, 이메일이 없습니다.</span>
				</div>
				<button type="button" id="searchBtn" class="btn btn-primary btn-block mt-3">비밀번호 찾기</button>
			</div>
		</div>
	</section>
</div>
	
	<script>
		$(document).ready(function() {
			$("#searchBtn").on("click", function() {
				let id = $("#idInput").val();
				let email = $("#emailInput").val();
				
				$.ajax({
					type: "post"
					, url: "/user/passwordsearch"
					, data: {"loginId":id, "email":email}
					, success:function(data) {
						if(data.result == "success"){
							location.href = "/user/passwordchange/view";
						} else {
							$("#searchFail").show();
						}
					}
					, error:function(){
						alert("비밀번호 찾기 오류");
					}
				});
			});
		});
	</script>
</body>
</html>