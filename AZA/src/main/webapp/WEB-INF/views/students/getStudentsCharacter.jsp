<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Students Character😋 </title>
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
    
        
        
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
	$( "button.btn.btn-raised-danger:contains('삭제')" ).on("click" , function() {
		alert("삭제....😥😥😥😥😥😥😥😥");
		deleteStudentsCharacter();
	});
});

$(function() {
	$( "button.btn.btn-raised-primary:contains('수정')" ).on("click" , function() {
		alert("수정 화면으로 이동 🙃🙃");
		updateStudentsCharacter();
	});
});

function deleteStudentsCharacter() {

	$("form").attr("method" , "POST").attr("action" , "/students/deleteStudentsCharacter").submit();

}

function updateStudentsCharacter() {

	$("form").attr("method" , "GET").attr("action" , "/students/updateStudentsCharacter").submit();

}

</script>

</head>
<body>

 <h3>Students Character ! </h3>
<br/>
<%--
<div align="center" class="character">
<h3>👻 ${students.studentName}의 특징 👻</h3>

<input name="characterCode" value="${students.characterCode }">
<input name="studentId" value="${students.studentId }">
<input name="studentName" value="${studentName }">

<input name="characterContent" value="${students.characterContent}" 
style="width:600px;height:500px;">
<br/>
<br/>

	<button class="btn btn-raised-primary" type="button">수정</button>
	<button class="btn btn-raised-danger" type="button">삭제</button>
	<button class="btn btn-raised-light" type="button">확인</button>

</div> --%>


<!--  -->
<form>

			<div class="card card-raised border-top border-4 border-primary h-100"  align="center">
                                    <div class="card-body p-5">
                                        <div class="overline text-muted mb-4"></div>
                                        <h1>👻 ${students.studentName}의 특징 👻</h1>
                                        <p class="card-text mb-4" name="characterCode">character Code : ${students.characterCode }</p>
                                        <p class="card-text mb-4" name="studentId">studentId : ${students.studentId }</p>
                                        <table class="table table-sm mb-0">
                                            <tbody>
                                                <tr>
                                                    <td><div class="text-muted fst-italic" name="characterContent">${students.characterContent}</div></td>
<!--                                                     <td>Roger Henn</td>
                                                    <td class="text-end"><div class="text-muted">-$5,400.00</div></td> -->
                                                </tr>
                                        </table>
                                    </div>
                                    <div class="card-footer bg-transparent position-relative ripple-gray">
<!--                                         <a class="d-flex align-items-center justify-content-end text-decoration-none stretched-link text-primary" href="#!">
                                            <div class="fst-button">View More</div>
                                            <i class="material-icons icon-sm ms-1">chevron_right</i> -->
                                      <!--   </a> -->
                                      		<button class="btn btn-raised-primary" type="button">수정</button>
											<button class="btn btn-raised-danger" type="button">삭제</button>
											<button class="btn btn-raised-light" type="button">확인</button>
                                    </div>  
              </div>


<!--  -->

</form>

</body>
</html>