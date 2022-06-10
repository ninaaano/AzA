<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AZA : LOGIN</title>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			
			$("button.btn.btn-primary").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		

		
	</script>
	
</head>
<body>
	<h1>로그인</h1>
	<form action="/user/login">
	아이디 : <input type="text" name="userId"  id="userId"></input>
	비밀번호 : <input type="text" name="password"  id="password"></input>
	
	<button type="submit">로그인</button>
	<button type="button" class="btn btn-primary">회원가입</button>
	</form>
</body>
</html>