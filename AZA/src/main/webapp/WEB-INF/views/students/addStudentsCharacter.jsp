<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>addCharacter</title>


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
	$( "button.btn.btn-raised-info:contains('등록')" ).on("click" , function() {
		alert("등록");
		addStudentsCharacter();
	});
});

$(function() {
	$( '#studentName' ).on("click" , function() {
		
		var name = $('#studentName').text();
		var id = $('#studentId').text();
		alert(name);
		selflocation = "/students/addStudentsCharacterView"+id
	});
});

function addStudentsCharacter() {
	var characterContent = $("textarea[name='characterContent']").val();
	var studentId = $("input[name='studentId']").val();
	
	if(characterContent == null || characterContent.length < 1){
		
		alert("특징은 필수 입력 항목입니다.");
		return;
	}
	$("form").attr("method" , "POST").attr("action" , "/students/addStudentsCharacter").submit();

}
</script>

</head>
<body>
Hello World!
<form>

<!-- 학생 list -->
<div id="studentsList" align="right">
	<table border='1'>
		<tbody>

							  
						<tr>
						<td>No</td>
						<td>ID</td>
						<td>NAME</td>
						</tr>
							  
						<tr>
				<c:set var="i" value="0" />
				<c:forEach var="students" items="${list}">
		 	    <c:set var="i" value="${ i+1 }" />				
						<td align="center">
						${ i }
						</td>
						
						<td align="center" id="studentId">${students.studentId}</td>
						<td align="center" id="studentName">${students.studentName}</td>
				 </c:forEach>
						</tr>
			
		</tbody>
	</table>
</div>
<br/>


<div>
	<input name="studentId" value="${students.studentId}">	
	<input name="studentName" value="${students.studentName}">

	<textarea class="dataTable-input" placeholder="학생의 특징을 작성해주세요 :)" 
	type="text" style="width:600px;height:500px;"
	name="characterContent" value="${students.characterContent}"></textarea>
	
	<br/>
	
	<button class="btn btn-raised-info" type="button">등록</button>
	<button class="btn btn-raised-danger" type="button">취소</button>
</div>
<br/>

</form>

</body>
</html>