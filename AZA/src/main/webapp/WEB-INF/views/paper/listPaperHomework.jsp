<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수업 과제</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>
<script type="text/javascript">

$(function(){
	$('#lessonNamee').on("click", function(){
		self.location ="/paper/getPaperHomework?homeworkCode="+$(this).attr('homeworkCode');
	})
});


$(function(){
	$("td:nth-child(2)").on("click", function() {
		self.location ="/"
	})
})

</script>


<h3>강의 노트</h3>

	<table class="table table-hover table-striped" border="1" cellspacing = "0" cellpadding = "10px">
		<thead>
			<tr>
				<td class="ct_list_b" width="100">No.</td>
				<td class="ct_list_b" width="100">수업명</td>
				<td class="ct_list_b" width="100">과제 제목</td>
				<td class="ct_list_b" width="100">학생 이름</td>
				<td class="ct_list_b" width="100">등록 날짜</td>
				<td class="ct_list_b" width="100">마감 날짜</td>
				<td class="ct_list_b" width="100">과제 제출</td>

			</tr>
		</thead>
		
		<tbody>
			<c:set var="i" value="0"/>			
			<c:forEach var="paper" items="${list}">			
				<c:set var="i" value="${i+1}" />
				<tr class="ct_list_pop">
					<td align="center">${i}</td>
					<td align="left" id="lessonNamee" homeworkCode="${paper.homeworkCode}">${paper.lessonName.getLessonName()}</td>
					<td align="left" >${paper.homeworkTitle}</td>
					<td align="left">${paper.studentName.getStudentName()}</td>
					<td align="left">${paper.homeworkCreateAt}</td>
					<td align="left">${paper.homeworkDueDate}</td>
					<td align="left">${paper.homeworkCheck}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
       

</body>
</html>