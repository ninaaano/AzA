<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수업 목록 조회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta charset="EUC-KR">
<script type="text/javascript">
	/* function fncGetUserList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/lesson/listLesson?menu=${param.menu}").submit();
	} */
	$(function(){		
		$("td:nth-child(n+1)").on("click",function(){
			/* var lessonCode = $(this).data("value"); */
			self.location="/lesson/getLesson?lessonCode="+$(this).attr('lessonCode');
		})
	})
	
	$(function(){
		$("td.btn01:contains('수업추가')").on("click",function(){
			self.location = "/lesson/addLessonView"
		});
	});
</script>

</head>
<body>
	<h1>수업 목록</h1>
	<table>
		<tr>
		<td class="btn01">
			수업추가
		</td>
		</tr>
	</table>
	
	<table border="1" cellspacing = "0" cellpadding = "10px">
		<thead>
			<tr>
				<td class="ct_list_b" width="100">number</td>
				
				<td class="ct_list_b" width="100">수업명</td>
				
				<th class="ct_list_b" width="100">선생님 이름</th>
				
				<th class="ct_list_b" width="150">수업요일</th>
				
				<th class="ct_list_b" width="150">수업시작시간</th>
				
				<th class="ct_list_b" width="150">수업종료시간</th>
				
				<th class="ct_list_b" width="150">수업장소</th>
				
				<th class="ct_list_b" width="150">과목명</th>
				
				<th class="ct_list_b" width="150">수업코드</th>
				
				<c:if test="${user.role eq 'student'}">
				    <th class="ct_list_b" width="150">proposal</th>
				</c:if>
			</tr>
		</thead>
		
		<tbody>
			<c:set var="i" value="0"/>			
			<c:forEach var="lesson" items="${list}">			
				<c:set var="i" value="${i+1}" />
				<tr class="ct_list_pop">
					<td align="center" lessonCode="${lesson.lessonCode}">${i}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.lessonName}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.teacherName.getUserName()}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.lessonDay}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.lessonStartTime}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.lessonEndTime}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.lessonPlace}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.subject}</td>
					
					<td align="left" lessonCode="${lesson.lessonCode}">${lesson.lessonCode}</td>
					
					<c:if test="${user.role eq 'student'}">
				    	<td class="left">hello</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</html>