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
					<div class="text-secondary text-center">변경할 비밀번호를<br>입력해 주세요.</div>
					<br>
					<input type="password" placeholder="변경할 비밀번호" id="passwordInput" class="form-control mt-3">
					<input type="password" placeholder="변경할 비밀번호 확인" id="passwordConfirmInput" class="form-control mt-3">
					<br>
					<button type="button" id="changeBtn" class="btn btn-primary btn-block mt-3" data-id="${userId}">비밀번호 변경</button>
					<button type="button" id="cancelBtn" class="btn btn-danger btn-block mt-2">취소</button>
				</div>
			</div>
		</section>
	</div>
	
	<script src="/static/js/form.js"></script>
	<script>
		$(document).ready(function() {
			$("#cancelBtn").on("click", function() {
				location.href="/user/passwordchange";
			});
			
			$("#changeBtn").on("click", function() {
				let id = $(this).data("id");
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				
				if(!valueCheck($("#passwordInput"), "패스워드")){
					return;
				}
				if(!valueCheck($("#passwordConfirmInput"), "패스워드확인")){
					return;
				}
				
				if(password != passwordConfirm){
					alert("비밀번호와 비밀번호확인이 일치하지 않습니다.");
					passwordConfirm.val("");
					passwordConfirm.focus();
					return;
				}
				
				$.ajax({
					type: "post"
					, url: "/user/passwordchange"
					, data: {"id":id, "password":password}
					, success: function(data){
						if(data.result == "success"){
							alert("변경이 완료되었습니다.");
							location.href="/user/passwordchange";
						} else {
							alert("비밀번호 변경에 실패하였습니다.");
						}
					}
					, error: function() {
						alert("비밀번호 변경 에러");
					}
				});
			});
		});
	</script>
</body>
</html>