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
					<input type="text" class="form-control" placeholder="아이디" id="idInput">
					<input type="password" placeholder="비밀번호" id="passwordInput" class="form-control mt-3">
					<button type="button" id="loginBtn" class="btn btn-primary btn-block mt-3">로그인</button>
					<br>
					<div class="text-center">
						<span id="loginFail" class="text-danger small" style="display:none">id 또는 비밀번호가 잘못 되었습니다.</span>
					</div>
					<br>
					<div class="text-center">
						<h6>계정이 없으신가요?<a href="/user/signup/view">회원가입</a></h6>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script src="/static/js/form.js"></script>
	<script>	
		$(document).ready(function() {
			
			$("#loginBtn").on("click", function() {
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				
				if(!valueCheck($("#idInput"), "아이디")){
					return;
				}
				
				if(!valueCheck($("#passwordInput"), "비밀번호")){
					return;
				}
				
				$.ajax({
					type: "post"
					, url: "/user/signin"
					, data: {"loginId":id, "password":password}
					, success:function(data) {
						if(data.result == "success"){
							location.href="/post/main/view";
						} else {
							$("#loginFail").show();
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
				});
			});
		});
	</script>	
</body>
</html>