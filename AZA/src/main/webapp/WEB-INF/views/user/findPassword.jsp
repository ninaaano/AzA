<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

body {
	background-color: white;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.card-signin .card-title {
	margin-bottom: 2rem;
	font-weight: 300;
	font-size: 1.5rem;
}

.card-signin .card-body {
	padding: 2rem;
}

.form-signin {
	width: 100%;
}

.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}

.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}

.form-label-group input {
	height: auto;
	border-radius: 2rem;
}

.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: inline_block;
	width: 100%;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
	color: transparent;
}

.form-label-group input:-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-moz-placeholder {
	color: transparent;
}

.form-label-group input::placeholder {
	color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}

.form-label-group input:not(:placeholder-shown) ~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 12px;
	color: #777;
}
</style>
<!-- Load Favicon-->
        <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet" />
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet" />
<!-- Load main stylesheet-->
<link href="/resources/css/template.css" rel="stylesheet" />


<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form method="post" class="form-signin" action="find_password" name="findform">


		<div class="form-label-group col-md-4">
			<input type="text" id="userId" name="userId" class="form-control" />
			<label for="userId">아이디</label>
		</div>

			<div class="form-label-group col-md-4">
			<input type="text" id="phone" name="phone" class="form-control" /> 
			<label for="phone">핸드폰번호</label>
			<div id="phoneCheck"></div>
		</div>

		<div class="form-label-group">
			<button type="button"
				class="btn btn-lg btn-secondary btn-block text-uppercase"
				onclick="cert();">인증번호 받기</button>
		</div>



		<div class="form-row">
			<div class="form-label-group col-md-4">
				<input type="text" class="form-control" id="certification"
					placeholder="인증번호를 입력해주세요" required>
				<div class="form-group" id="certCheck"></div>
			</div>
			<div class="form-group col-md-4">
				<button type="button"
					class="btn btn-lg btn-secondary btn-block text-uppercase"
					id="sms_AuthBtn" onclick="smsAuthBtn();">확인</button>
			</div>
		</div>


		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
			<button class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="button">취소</button>
		</div>

		<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.userId.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치 -->
		<c:if test="${check == 0 }">
		<div>
			<label>비밀번호를 변경해주세요.</label>
		</div>
		<div class="form-label-group">
		<input type="hidden" id="userId" name="updateid" value="${updateid}">
		
			<input type="text" id="password" name="password" class="form-control"/>
			<label for="password">password</label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="confirmpassword" name="confirmpwd" class="form-control"/>
			<label for="confirmpassword">confirm password</label>
		</div>
		
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="update_password" onclick="updatePassword()">
			</div>
		</c:if>

	</form>
	
	<script type="text/javascript">
		function updatePassword(){
			if(document.findform.password.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.password.focus();
			} else if(document.findform.password.value != document.findform.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findform.confirmpwd.focus();
			} else {
				document.findform.action="update_password";
				document.findform.submit();
				 alert("비밀번호가 변경되었습니다. 로그인 화면으로 이동합니다.");
				 self.close();
				 self.location = "http://127.0.0.1:8080/"
			}
			
		}
		
		$( function() {
			$("button:contains('취소')").on("click" , function() {
				self.location = "http://127.0.0.1:8080/"
			});
		});
		
		
		<!--휴대폰 인증 / SMS SENS API -->

		function cert() {
			 var phone = $("#phone").val();	
				$.ajax({
					type : 'POST',
					url :'/user/rest/sendSMS/' + phone,
					dataType : "json",
									
					contentType: "application/json",
					success : function(data) {
						if(data.result  == "success"){
							$('#certCheck').text("인증 번호가 전송되었습니다.");
							$('#certCheck').css('color','blue');
							$("#sms_AuthBtn").attr("disabled",true);
						}else {
							$('#certCheck').text("입력한 번호를 다시 확인해주세요.");
							$('#certCheck').css('color','red');
							$("#sms_AuthBtn").attr("disabled",true);
						}
					}
				});
		}
		
		function smsAuthBtn() {
					$('#certCheck').text("인증이 완료되었습니다.");
					$('#certCheck').css('color','blue');	
					$("#sms_AuthBtn").attr("disabled",false);
				
			
		};
		
	</script>
</body>
</html>