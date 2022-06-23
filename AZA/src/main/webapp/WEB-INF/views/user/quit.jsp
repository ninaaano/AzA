<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form>
	<div class="text-center">
		<h1 class="display-5 mb-0">정말 탈퇴하시겠습니까?</h1>
		<div class="subheading-1 mb-5">아이디/비밀번호를 입력해주세요</div>
	</div>

	<div class="mb-4">
		아이디 : <input type="text" name="userId" id="userId" value="${userId}"></input>

	</div>
	<div class="mb-4">

		비밀번호 : <input type="password" name="password" id="password" value="${password}"></input>

	</div>
	<div class="mb-1">
		<div class="btn-group" role="group">
			<button class="btn btn-text-primary" type="button" onclick='deleteUser()'>탈퇴</button>
			<button class="btn btn-text-primary" type="button">취소</button>
		</div>
	</div>
	</form>
	
	

	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">


function deleteUser() {
	
		if($("#password").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}	

	$("form").attr("method" , "POST").attr("action" , "/user/quit").submit();
};

// 수정하고 쓸거임
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
		history.go(-1);
	});
});


</script>
</body>
</html>