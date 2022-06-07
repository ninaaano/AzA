<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AZA : LOGIN</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="/user/login">
	아이디 : <input type="text" name="userId"  id="userId"></input>
	비밀번호 : <input type="text" name="password"  id="password"></input>
	
	<button type="submit">로그인</button>
	</form>
</body>
</html>