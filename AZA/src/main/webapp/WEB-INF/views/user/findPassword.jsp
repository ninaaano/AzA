<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>



<head>
   
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Reset Password - Material Admin Pro</title>
        <!-- Load Favicon-->
        <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
        <!-- Load Material Icons from Google Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
        <!-- Roboto and Roboto Mono fonts from Google Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet">
        <!-- Load main stylesheet-->
<link href="/resources/css/template.css" rel="stylesheet" />
<link href="/resources/css/common.css" rel="stylesheet" />
<link href="/resources/css/main.css" rel="stylesheet" />    
 
 <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />

<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet" />
<!-- Load main stylesheet-->
<link href="/resources/css/template.css" rel="stylesheet" />


<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">

    


<meta charset="UTF-8">
<title>FIND PASSWORD</title>
<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

*, body {
   font-family: Pretendard, 'Noto Sans KR';

  
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


.form-signin .btn {
	font-size: 100%;
	
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
	font-size: 15px;
	color: #777;
}

</style>


</head>

		<body class="bg-primary">
        <!-- Layout wrapper-->
        <div id="layoutAuthentication">
            <!-- Layout content-->
            <div id="layoutAuthentication_content">
                <!-- Main page content-->
                <main>
                    <!-- Main content container-->
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
                                <div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4">
                                    <div class="card-body p-5">
                                        <!-- Auth header with logo image-->
                                        <div class="text-center">
                                           <img class="mb-3" src="/resources/img/logo2.png" alt="..."
                                 style="height: 100px">
                                            <h1 class="display-5 mb-4">비밀번호 재설정</h1>
                                        </div>
                                        <!-- Reset password submission form-->
<form method="post" class="form-signin" action="find_password" name="findform">
                                        

                                           
<div class="row mb-4">
    <label for="userId" class="col-sm-4 col-form-label">아이디</label>
    <div class="col-auto">
      <input type="text" class="form-control" id="userId" name="userId">
    </div>
  </div>
  

  

  <div class="input-group mb-4">
  <input type="text" class="form-control" placeholder="ex)01012345678" aria-label="phone" id="phone" name="phone" aria-describedby="button-addon2" required>
  <button class="btn btn-outline-secondary" type="button" id="phoneBtn" onclick="cert();" disabled="disabled">인증번호 받기</button>
  <div id="phoneCheck"></div>
</div>

<div class="input-group mb-3">
  <input type="text" class="form-control" id="certification" name="auth" placeholder="인증번호를 입력하세요" aria-label="auth" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="button" id="sms_AuthBtn" onclick="smsAuthBtn();">인증번호 입력</button>
</div>
<div id="certCheck"></div>




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
                                    </div>
                                </div>
                                <!-- Auth card message-->
                                <div class="text-center mb-5"><a class="small fw-500 text-decoration-none link-white" href="/user/addUser">가입된 정보가 없으신가용? 회원가입하세요!</a></div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <!-- Layout footer-->
            <div id="layoutAuthentication_footer">
                <!-- Auth footer-->
             
            </div>
        </div>
        <!-- Load Bootstrap JS bundle-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- Load global scripts-->
 

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
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
		
		   // 핸드폰 유효성 체크   
		   $("#phone").on("keyup",()=>{
		      const phonNum = $("#phone").val();
		      const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		      if (regPhone.test(phonNum) === true) {
		         $("#phoneBtn").removeAttr("disabled");
		      } else {
		         $("#phoneBtn").attr("disabled","disabled");
		      }
		   })
		   
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
	 <script type="module" src="/resources/javascript/common/material.js"></script>
         <script type="module" src="/resources/javascript/common/scripts.js"></script>
</body>
</html>