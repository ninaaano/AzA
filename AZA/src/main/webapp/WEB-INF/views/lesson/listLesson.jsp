<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>수업 목록 조회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta charset="EUC-KR">


<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
<script defer src="/resources/javascript/alert/alertUI.js"></script>
<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<!-- Load Simple DataTables Stylesheet-->

<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet">
<!-- Load main stylesheet-->



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
<style>
*, body { 
font-family: Pretendard, 'Noto Sans KR';
}
</style>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">   


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
	
/* 	function listLesson(){
		$.ajax({
			url:"lesson/rest/listLesson",
			type:"GET",
			headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json",                                    
	            },
            success: function(JSONData, status){
            	console.log(JSONData);
            	alert(JSONData);
            }
		});
	} */
	
window.addEventListener('DOMContentLoaded',event=>{
	const datatablesSimple = document.getElementById('datatablesSimple');
	if(datatablesSimple){
		$.ajax({
			url:"/lesson/rest/listLesson",
			type:"GET",
			headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
            success:function(result){
            	if(result){
            		var list = result.list;
            		console.log(list)
            		alert(list)
            		
            	}
            }
		});
	}
})

</script>
</head>
<body>
	<h1 align="center">수업 목록</h1>
<form>
<div class="card-body p-4">
	<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
	<div class="dataTable-top">
		<table align="right">
		<c:if test="${user.role eq 'teacher'}">
			<tr>
				<td class="btn01">
					수업추가
				</td>
			</tr>
		</c:if>
				 <tr>
					  <td>
					   <select class="btn btn-outline-primary dropdown-toggle" id="searchCondition" name="searchCondition" >
							<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>수업명</option>
						</select>
					  </td>
								  
					  <td>
				  		 	<input class="dataTable-input" type="text" aria-label="Text input with dropdown button" 
				  			id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요"
				   			value="${! empty search.searchKeyword ? search.searchKeyword : "" }">
					  </td>
					  <td>
					 <button type="button" class="btn btn-outline-primary" type="submit" id="searchHomework">검색</button>
				  </td>
				  <!--  선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
			   	</tr>	
		</table>
	</div>
	
		<div class="dataTable-container">
			<!-- <table border="1" cellspacing = "0" cellpadding = "10px"> -->
			<table id="datatablesSimple" class="dataTable-table">
				<thead>
					<tr>
						<th data-sortable="" style="width: 5%;">number</th>
						
						<th data-sortable="" style="width: 10%;">
						<a href="#" class="dataTable-sorter">수업명</a></th>
						
						<th data-sortable="" style="width: 9%;">
						<a href="#" class="dataTable-sorter">선생님 이름</a></th>
						
						<th data-sortable="" style="width: 10%;">
						<a href="#" class="dataTable-sorter">수업요일</a></th>
						
						<th data-sortable="" style="width: 10%;">
						<a href="#" class="dataTable-sorter">수업시작시간</a></th>
						
						<th data-sortable="" style="width: 10%;">
						<a href="#" class="dataTable-sorter">수업종료시간</a></th>
						
						<th data-sortable="" style="width: 7%;">
						<a href="#" class="dataTable-sorter">수업장소</a></th>
						
						<th data-sortable="" style="width: 10%;">
						<a href="#" class="dataTable-sorter">과목명</a></th>
						
						<th data-sortable="" style="width: 10%;">
						<a href="#" class="dataTable-sorter">수업코드</a></th>
						
						<c:if test="${user.role eq 'student'}">
						    <th data-sortable="" style="width: 5%;">
						    <a href="#" class="dataTable-sorter">proposal</a></th>
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
		</div>
		</div>
	</div>
	</form>
	</body>
</html>