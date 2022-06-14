<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>


<html>
<head>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/message.css" />



<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta charset="EUC-KR">
<title>AZA : LOGIN</title>
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">




<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//============= 회원원가입 화면이동 =============
	$(function() {

		$("button").on("click", function() {
			self.location = "/user/addUser"
		});
	});
</script>

</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">

			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
							<div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4">
								<div class="card-body p-5">
									<!-- Auth header with logo image-->
									<div class="text-center">
									

										<h1 class="display-5 mb-0">Login</h1>
										<div class="subheading-1 mb-5">AZA에 오신걸 환영합니다!</div>
									</div>
									<form action="/user/login">
										<div class="mb-4">
											<mwc-textfield class="w-100" label="userId" outlined>
											아이디 : <input type="text" name="userId" id="userId"></input> </mwc-textfield>

										</div>
										<div class="mb-4">
											<mwc-textfield class="w-100" label="Password" outlined
												icontrailing="visibility_off" type="password">
											비밀번호 : <input type="text" name="password" id="password"></input>

											</mwc-textfield>
										</div>
										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small fw-500 text-decoration-none"
												href="app-auth-password-basic.html">비밀번호를 잊어버리셨나요?</a>
										</div>

										<button type="submit">로그인</button>
										<button type="button" >회원가입</button>

									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<!-- Load global scripts-->
	<script type="module" src="js/material.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>