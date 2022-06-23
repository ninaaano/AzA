<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>
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
	font-size: 15px;
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



</head>
<body>
<form method="post" class="form-signin" action="find_id" name="findform">

	  <div class="modal-dialog" role="document">
	    <div class="modal-content rounded-5 shadow">
	      <div class="modal-header p-5 pb-4 border-bottom-0">
	        <!-- <h5 class="modal-title">Modal title</h5> -->
	        <h2 class="fw-bold mb-0">아이디 찾기</h2>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>

	      <div class="modal-body p-5 pt-0">
	        <form class="">
	          <div class="form-floating mb-3">
	            <input type="userName" class="form-control rounded-4" id="floatingInput" placeholder="이름">
	            <label for="name">이름</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input type="phone" class="form-control rounded-4" id="floatingPassword" placeholder="핸드폰번호">
	            <label for="phone">핸드폰번호</label>
	          </div>
	   
		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
			<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button">취소</button>
		</div>
	          <hr class="my-4">
	       
	        </form>
	      </div>
	    </div>
	  </div>



		<!-- 이름과 전화번호가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.userName.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0 }">
		<label>찾으시는 아이디는 '${id}' 입니다.</label>
		<div class="form-label-group">
					<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button">비밀번호 재설정</button>
					<button class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button">로그인 화면으로</button>
			</div>
		</c:if>



	</form>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	$( function() {
		$("button:contains('비밀번호 재설정')").on("click" , function() {
			self.location = "/user/findPassword"
		});
	});
	
	$( function() {
		$("button:contains('로그인 화면으로')").on("click" , function() {
			self.location = "/user/login"
		});
	});
	
	$( function() {
		$("button:contains('취소')").on("click" , function() {
			self.location = "http://127.0.0.1:8080/"
		});
	});

		

	
	</script>
</body>
</html>