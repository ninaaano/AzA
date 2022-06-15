<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강의 노트</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>
<script type="text/javascript">

/* $(function(){
	$('#noteTitlee').on("click", function(){
		self.location ="/students/getStudentsNote?noteCode="+$(this).attr('noteCode');
	})
}); */

$(function(){
	$("td:nth-child(2)").on("click", function() {
		self.location ="/students/getStudentsNote?noteCode="+$(this).attr('noteCode');
	})
})


$(function() {	
	$( "button.btn.btn-primary:contains('작성')").on("click" , function() {
		self.location = "/students/addStudentsNote";
	});
});	

</script>


<h3>강의 노트</h3>

	<table class="table table-hover table-striped" border="1" cellspacing = "0" cellpadding = "10px">
		<thead>
			<tr>
				<td class="ct_list_b" width="100">No.</td>
				<td class="ct_list_b" width="100">제목</td>
				<td class="ct_list_b" width="100">작성 날짜</td>

			</tr>
		</thead>
		
		<tbody>
			<c:set var="i" value="0"/>			
			<c:forEach var="students" items="${list}">			
				<c:set var="i" value="${i+1}" />
				<tr class="ct_list_pop">
					<td align="center">${i}</td>
					<td align="left" id="noteTitlee" noteCode="${students.noteCode }">${students.noteTitle}</td>
					<td align="left">${students.noteCreateAt}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- <input type="button" onclick="addBtn();" value="작성"/> -->
	<button id="addBtn" type="button" class="btn btn-primary">작성</button>
	
	
       

</body>
</html>