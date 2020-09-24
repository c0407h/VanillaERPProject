<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vanilla ERP - Login</title>
<!-- Favicon -->
<link rel="shortcut icon" href="resources/favicon/favicon.ico">
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/main.css" />
<!-- Login CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/login.css" />
<!-- Popup CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<!--  jQuery -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!--  Popup -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<!--  Util -->
<script type="text/javascript" src="resources/script/common/util.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#loginBtn").on("click", function() {
		if(checkEmpty("#email")) {
			makeAlert(1, "로그인 안내", "이메일을 입력해 주세요.", true, function() {
				$("#email").focus();
			});
		} else if(checkEmpty("#psrd")) {
			makeAlert(1, "로그인 안내", "비밀번호를 입력해 주세요.", true, function() {
				$("#psrd").focus();
			});
		} else {
			var params = $("#dataForm").serialize();
			
			$.ajax({
				type : "post",
				url : "loginAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						location.href = "sample";
					} else if(result.res == "FAILED") {
						makeAlert(1, "로그인 실패", "아이디나 비밀번호가 틀렸습니다.", true, null);
					} else {
						makeAlert(1, "로그인 경고", "로그인 체크 중 문제가 발생하였습니다.", true, null);
					}
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseText);
					console.log("error : " + error);
				}
			});
		}
	});
	
	$(".login_input_area").on("keypress", "input", function(event) {
		if(event.keyCode == 13) {
			$("#loginBtn").click();
			return false;
		}
	});
});
</script>
</head>
<body>
<div class="login_wrap">
	<div class="logo_wrap">
		<div class="logo_table">
			<div class="logo">anilla ERP</div>
		</div>
	</div>
	<div class="login_form_wrap">
		<form action="#" id="dataForm">
			<div class="login_input_area">
				<div class="login_input_img_email"></div>
				<div class="login_input_txt"><input type="text" id="email" name="email" placeholder="Insert your e-mail" /></div>
			</div>
			<div class="login_input_area">
				<div class="login_input_img_psrd"></div>
				<div class="login_input_txt"><input type="password" id="psrd" name="psrd" placeholder="Insert your password" /></div>
			</div>
		</form>
		<div class="login_btn_area">
			<input type="button" value="로그인" id="loginBtn" />
		</div>
	</div>
</div>
</body>
</html>