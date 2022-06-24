<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title> Character Update </title>
<!--  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
    <link href="/resources/css/message.css" rel="stylesheet">
    <!-- Load Favicon-->
    <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <!-- Load Material Icons from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <!-- Load Simple DataTables Stylesheet-->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
    <!-- Roboto and Roboto Mono fonts from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet">
    <!-- Load main stylesheet-->
    <link href="/resources/css/styles.css" rel="stylesheet">
    
        

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/message.css"/>
        
<!--  -->


<style>
	body {
    padding-top : 20px;
    margin : 50px;
}
</style>

<script type="text/javascript">

$(function() {
	$( "button.btn.btn-raised-light:contains('수정하기')" ).on("click" , function() {
		alert("수정 버튼 클릭");
		updateStudentsCharacter();
	});
});

$(function() {
	$( "button.btn.btn-raised-danger:contains('삭제')" ).on("click" , function() {
		alert("삭제....");
		deleteStudentsCharacter();
	});
});

function deleteStudentsCharacter() {

	$("form").attr("method" , "POST").attr("action" , "/students/deleteStudentsCharacter").submit();

}

function updateStudentsCharacter() {

	$("form").attr("method" , "POST").attr("action" , "/students/updateStudentsCharacter").submit();

}

</script>

</head>
<body>


<br/>
<form>
<div align="center" class="character">
<h3>Students Character Update! </h3>
<h3> ${students.studentName}의 특징 </h3>

<input type="hidden" name="characterCode" value="${students.characterCode }">
<input type="hidden" name="studentId" value="${students.studentId }">
<input type="hidden" name="studentName" value="${students.studentName}">

<!-- 폼 변경 -->
			<div class="card card-raised border-top border-4 border-primary h-100"  style="width:600px;">
                                    <div class="card-body p-5">
                                        <div class="overline text-muted mb-4"></div>

                                               <h2>${students.studentName}의 특징 수정 페이지</h2>
        									   <p class="card-text mb-4" style="font-size: 10px;">학생 특징 수정 페이지입니다. :)</p>
                                   
                                        <table class="table table-sm mb-0">
                                            <tbody>
                                                <tr>
                                                    <td><div class="text-muted fst-italic"></div></td>
                                                     <td>
                                                     
                                                     <textarea class="dataTable-input" placeholder="특징을 입력해주세요 :)" 
														type="text" style="width:500px;height:400px;"
														name="characterContent">${students.characterContent}</textarea>
                                                     
                                                     </td>
                                                </tr>
                                        </table>
                                    </div>
                                    
                                    <div class="card-footer bg-transparent position-relative ripple-gray">
											<button class="btn btn-raised-light" type="button">수정하기</button>
											<button class="btn btn-raised-danger" type="button">삭제</button>
                                    </div>  
              </div>
</form>

</body>
</html>