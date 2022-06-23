<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>마이페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> -->
<link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<!-- Load Material Icons from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/template.css"/>
<style>

*, body {
padding-top : 40px;
  margin: 0;
  font-family: Pretendard, 'Noto Sans KR';
  font-size: var(--bs-body-font-size);
  font-weight: var(--bs-body-font-weight);
  line-height: var(--bs-body-line-height);
  color: var(--bs-body-color);
  text-align: var(--bs-body-text-align);
  background-color: var(--bs-body-bg);
  -webkit-text-size-adjust: 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.form-horizontal{

padding-bottom : 40px;
padding-left : 100px;
padding-right : 40px;
padding-top : 40px;
 margin-left : 300px;
  margin-left : 300px;
  margin-right : 300px;

}
</style>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<script type="text/javascript">
		
	// 수업추가 참고하기
		//============= 회원정보수정 Event  처리 =============	
		 $( function() {
				$("button:contains('회원정보수정')").on("click" , function() {
					self.location="/user/updateUser?userId=${user.userId}"
				});
			});
	
	//학생 아이디 유효성 검사
			const checkStudent = _.debounce(async (id) => {
		    	
		    	var id = $("#firstStudentId").val();
		    	
		    	$.ajax({
		    		url:'/user/rest/checkStudent',
		    		type : "post",
		    		data:{id},
		    		success : function(cnt) {
		    			if(cnt == 1) {
		    				$('#certCheck2').text("확인이 완료되었습니다.");
		    				$('#certCheck2').css('color','blue');	
		    				
		    			}
		    			else {
		    				$('#certCheck2').text("확인되지 않은 정보입니다.");
		    				$('#certCheck2').css('color','red');
		    				
		    			}
		    		}
		    	});
		    },2000);
			
		// 자녀 추가 이벤트
		$(function(){
			$("input[name=addStudentBtn]").click(function(){
				if ($(this).val()=="자녀추가"){
					$("#addStudentInput").show();
				}
		});
		
	});
		
// 탈퇴
		
		function quit(){
			location.href = "/user/quit";
		}
		

	</script>
	

</head>
<body class="nav-fixed bg-light drawer-toggled">
<!-- ---------- 개인정보 수정 -------------->
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container-xl px-5">

	
	
	<form class="form-horizontal">
		<div class="page-header">
	       <h3 class=" text-info">회원정보조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>비밀번호</strong></div>
			<div class="col-xs-8 col-md-4"></div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.phone ? user.phone : ''}	</div>
		</div>
		
		
		
		<c:if test="${user.role eq 'student'}">
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>학교</strong></div>
			<div class="col-xs-8 col-md-4">${user.school}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>학년</strong></div>
			<div class="col-xs-8 col-md-4">${user.grade}</div>
		</div>
		
		</c:if>
		
		
		<c:if test="${user.role eq 'parent'}">

			<input type="button" name="addStudentBtn" class="btn btn-primary" value="자녀추가" onclick='addStudentBtn()' />
			
			
			<div></div>
			<form action="/user/addRelation" method="POST" enctype="multipart/form-data">		
			<div id="addStudentInput" style="display :none">
			
			<input type="hidden" name="userId" value="${user.userId}">
				
			
			<input type="text" id="firstStudentId" name="firstStudentId" placeholder="자녀 아이디" oninput="checkStudent()" />
			<div class="form-group" id="certCheck2"></div>
			<input type="text" id="relationName" name="relationName" placeholder="학생과의 관계" />
			<input type="submit" value="등록" />
			<input type="button" value="취소" />
			</div>
			</form>

			
			
			<c:forEach var="studentsInfo" items="${studentsInfo}" varStatus="status">
  		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 아이디</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.userId}</div>
		</div>
  
  
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 이름</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.userName}</div>
		</div>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 학교</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.school}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 학년</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.grade}</div>
		</div>
	
	<c:forEach var="user" items="${list}">
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>학생과의 관계</strong></div>
			<div class="col-xs-8 col-md-4">${user.relationName}</div>
		</div>
	</c:forEach>	
		
	
		 </c:forEach>
		</c:if>
		
		

		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">회원정보수정</button>
	  			<button type="button" class="btn btn-primary" onclick="quit()">탈퇴</button>
	  			
	  		</div>
		</div>
		
		<br/>
		</div>
 
 	</form>       
</body>
</html>