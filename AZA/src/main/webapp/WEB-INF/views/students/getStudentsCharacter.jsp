<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Students Character </title>
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

$(function () {
	$('#characterCode').on('change', function() {
		var characterCode = $('option:selected').val().trim();
/* 		alert("선택된 characterCode => "+characterCode); */
		
		$.ajax(
				{url : "/students/rest/getStudentsCharacter/"+characterCode ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},success : function(JSONData , status) {
						/* alert("선택된 cName => "+JSONData.studentName); */
						//text값 변경
						$('#studentName').text(JSONData.studentName+"의 특징");						
						/* $('#studentId').text(JSONData.studentId); */						
						$('#characterContent').text(JSONData.characterContent);
						/* $('#characterCode2').text(JSONData.characterCode);
						$('#characterCode2').val(JSONData.characterCode); */
						
						// value값 변경
						$('input[name=characterCode]').val(JSONData.characterCode);
						$('input[name=studentId]]').val(JSONData.studentId);
						$('input[name=studentName]').val(JSONData.studentName);
						$('input[name=characterContent]').val(JSONData.characterCode);
						
						
					}
	
				}		
		
		)
		
		
		
	})
	
	
});


$(function() {
	$( "button.btn.btn-raised-danger:contains('삭제')" ).on("click" , function() {
		deleteStudentsCharacter();
	});
});

$(function() {
	$( "button.btn.btn-raised-primary:contains('수정')" ).on("click" , function() {
		updateStudentsCharacter();
	});
});

function deleteStudentsCharacter() {

	$("form").attr("method" , "POST").attr("action" , "/students/deleteStudentsCharacter").submit();

}

function updateStudentsCharacter() {

	$("form").attr("method" , "POST").attr("action" , "/students/updateStudentsCharacterView").submit();

}



</script>

</head>
<body>
<form>

<br/>



<div align="center" class="character">
 <h3> 학생 특징 조회</h3>
<input type="hidden" name="characterCode" value="${students.characterCode }">
<input type="hidden" name="studentId" value="${students.studentId }">
<input type="hidden" name="studentName" value="${students.studentName }">
<input type="hidden" name="characterContent"  value="${students.characterContent }">


			<select id="characterCode" name="characterCode" class="form-select form-select-lg" aria-label="Large select example" style="width:600px;">
						<option align="center" selected="" disabled="" > 학생 선택 </option>
				<c:forEach var="students" items="${list}">  
						<option align="center" value="${students.characterCode }">${students.studentName}	
				 </c:forEach>
			</select>
			
<br/>
<br/>

			<div class="card card-raised border-top border-4 border-primary h-100"  style="width:600px;">
                                    <div class="card-body p-5">
                                        <div class="overline text-muted mb-4"></div>
                                        <h1 id="studentName"> ${students.studentName}의 특징 </h1>
                                        <%-- <p class="card-text mb-4" id="characterCode2">character Code : ${students.characterCode }</p>
                                        <p class="card-text mb-4" id="studentId">studentId : ${students.studentId }</p> --%>
                                        <table class="table table-sm mb-0">
                                            <tbody>
                                                <tr>
                                                    <td><div class="text-muted fst-italic"></div></td>
                                                     <td id="characterContent">${students.characterContent}</td>
                                                   <!-- <td class="text-end"><div class="text-muted">-$5,400.00</div></td> -->
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
											<!-- <button class="btn btn-raised-light" type="button">확인</button> -->
                                    </div>  
              </div>


<!--  --> 
</div>
</form>

</body>
</html>