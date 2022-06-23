<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
<head>
<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon" />
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet" />
<!-- Roboto and Roboto Mono fonts from Google F	onts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet" />
<!-- Load main stylesheet-->
<link href="/resources/css/styles.css" rel="stylesheet" />


<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">



<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta charset="EUC-KR">
<title>AZA : LOGIN</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
   //============= 회원원가입 화면이동 =============

   $( function() {
      $("button:contains('회원가입')").on("click" , function() {
         self.location = "/user/addUser"
      });
   });
   
   $( function() {
      $("button:contains('아이디 찾기')").on("click" , function() {
         self.location = "/user/findId"
      });
   });
   
   $( function() {
      $("button:contains('비밀번호 재설정')").on("click" , function() {
         self.location = "/user/findPassword"
      });
   });
   


</script>
<style>
* {
	margin: 0px;
}
</style>
</head>
<body class="bg-login">

	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content"
			class="justify-content-center text-center align-items-center">

			<main>
				<div class="container">
					<div
						class="row justify-content-center text-center align-items-center">
						<div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
							<!-- <div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4"> -->
							<div>

								<div class="card-body p-5 mt-6">

									<!-- Auth header with logo image-->
									<div class="text-center">



										<img class="mb-3" src="/resources/img/logo2.png" alt="..."
											style="height: 150px">

										<!-- <div class="subheading-1 mb-5">AZA에 오신걸 환영합니다!</div> -->
									</div>

									<form name="loginForm">
										<div class="mb-4" align="center" id="id_text">
											<mwc-textfield class="w-100" label="ID" outlined>
											<!-- <input type="text" name="userId" id="userId"></input> -->
											<input type="text" name="userId" id="ID" class="form-control"
												style="border: 1px solid #e3e4ed; background-color: transparent;"
												value="" placeholder="아이디"></input> </mwc-textfield>
										</div>
										<div class="mb-4" align="center">
											<mwc-textfield class="w-100" label="password" outlined
												icontrailing="visibility_off" type="password">

											<input type="password" name="password" id="password" class="form-control"
												style="border: 1px solid #e3e4ed; background-color: transparent;"
												value="" placeholder="비밀번호"></input> </mwc-textfield>
										</div>
										<mwc-tab-bar class="nav nav-tabs" role="tablist">

										</mwc-tab-bar>

										<div class="m-3" align="center">

											<button class="btn btn-outline-primary" type="submit"
												onclick="login()">로그인</button>

										</div>

										<div class="mb-1">
											<div class="btn-group" role="group">
												<button class="btn btn-text-primary" type="button">아이디
													찾기</button>
												<button class="btn btn-text-primary" type="button">비밀번호
													재설정</button>
												<button class="btn btn-text-primary" type="button">회원가입</button>
											</div>
										</div>


									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script> -->
	<!-- Load global scripts-->

	<!--   <script type="module" src="/resources/common/material.js"></script>
   <script src="/resources/common/scripts.js"></script>
   
    -->

	<script type="text/javascript">
    
function login()   {
   
   var loginForm = document.loginForm;
   var userId = loginForm.userId.value;
   var password = loginForm.password.value;
   
   if(!userId || !password ){
      alert ("아이디와 비밀번호를 모두 입력해주세요.")
   }else{
      $("form").attr("method" , "POST").attr("action" , "/user/login").submit();
   }
}

    
    </script>

<!-- 	<script type="module" src="/resources/javascript/common/material.js"></script>
	<script type="module" src="/resources/javascript/common/scripts.js"></script> -->
</body>
</html>