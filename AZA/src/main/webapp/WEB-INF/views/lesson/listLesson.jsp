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
		$("button.btn.btn-text-primary").on("click",function(){
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
	
window.addEventListener('DOMContentLoaded', event => {
	const lessonDataSimple = document.getElementById('lessonDataSimple');
	
	if(lessonDataSimple){
		$.ajax({
			url:"/lesson/rest/listLesson",
			type:"GET",
			dataType:"json",
            success:function(result){
            	if(result){
            		var lesson = result.list;
            		console.log(lesson)
            		var lessonData = [];
            		
            		lesson.map((lesson, i) =>{            			
            			var temp = [];
            			temp.push(i+1);
            			temp.push(lesson.lessonName);
            			temp.push(lesson.teacherName.userName);
            			temp.push(lesson.lessonDay);
            			temp.push(lesson.lessonStartTime);
            			temp.push(lesson.lessonEndTime);
            			temp.push(lesson.lessonPlace);
            			temp.push(lesson.subject);            			
            			temp.push(lesson.lessonCode);
            			
            			lessonData.push(temp);
            		})
            		
            		var data ={
            			"headings" : [
	            			"No",
	            			"수업명",
	            			"선생님 이름",
	            			"수업 요일",
	            			"수업시작시간",
	            			"수업종료시간",
	            			"수업장소",
	            			"과목명",
	            			"수업코드",
            			],
            			"data" : lessonData,
            		}
            		
            		var getLesson = function(data, type, row){
            			var lessonCode = row.lastElementChild.textContent
            			return `<a href="/lesson/getLesson?lessonCode=`+lessonCode+`">`+data+`</a>`;
            		}
            		
            		new simpleDatatables.DataTable(lessonDataSimple,{
            			data,
            			columns:[
            				{
            					select: 1,
            					render: getLesson
            				},
            			],
            			columnDefs:[
            				{
            	                targets: [0],
            	                orderData: [0, 1],
            	            },
            	            {
            	                targets: [1],
            	                orderData: [0, 1],
            	            },
            	            {
            	                targets: [2],
            	                orderData: [0, 1],
            	            },
            	            {
            	                targets: [3],
            	                orderData: [0, 1],
            	            },
            	            {
            	                targets: [4],
            	                orderData: [0, 1],
            	            },
            	            {
            	                targets: [5],
            	                orderData: [0, 1],
            	            },                        
            	            {
            	                targets: [6],
            	                orderData: [0, 1],
            	            },
            	            {
            	                targets: [7],
            	                orderData: [0, 1],
            	            },
            	            {
            	                targets: [8],
            	                orderData: [0, 1],
            	            },
            			],            			
            		});
            	}
            }
		})
	}
});

</script>
</head>

<body class="nav-fixed bg-light">
	
      <div id="layoutDrawer_content">
                <!-- Main page content-->
                <main>
                <header class="mb-5"> 
                    </header>
                    <div class="container-xl px-5">
                        <div class="card card-raised mb-5">
                            <div class="card-header bg-transparent px-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="me-4">
                                        <h2 class="display-6 mb-0">수업 목록</h2>
                                        <div class="card-text">lesson List</div>
                                    </div>
<!--                                     <div class="d-flex gap-2">
                                        <button class="btn btn-lg btn-text-primary btn-icon mdc-ripple-upgraded" type="button"><i class="material-icons">download</i></button>
                                        <button class="btn btn-lg btn-text-primary btn-icon mdc-ripple-upgraded" type="button"><i class="material-icons">print</i></button>
                                    </div> -->
                                </div>
                            </div>
                            <br/>
<%--                             	<c:if test="${user.role eq 'teacher'}">
									<tr>
										<td class="btn01">
											수업추가
										</td>
									</tr>
								</c:if> --%>
							<c:if test="${user.role eq 'teacher'}">
	                            <div align="right" style="margin-right: 30px">
		      						<button id="btn btn-text-primary" type="button" class="btn btn-text-primary">수업 등록</button>
		      					</div>
                            </c:if>
		                    <div class="card-body p-4">		
		                        <!-- Simple DataTables example-->
		                        <table id="lessonDataSimple">
						
								</table>				
		                    </div>
                                
                        </div>
                        <hr class="my-5" />
                    </div>
                </main>
	<!-- Footer-->
	<footer>
		<%-- <button type="button" id="open-messagePopup" class="btn float btn-lg btn-icon"><i class="material-icons">mail_outline</i></button>
		<jsp:include page="/WEB-INF/views/common/home.jsp" /> --%>
	</footer>
	</div>

    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js"
		crossorigin="anonymous"></script>
	<script src="/resources/javascript/common/prism.js"></script>
	<script src="/resources/javascript/common/material.js"></script>
	<script src="/resources/javascript/common/scripts.js"></script>
	<script src="/resources/javascript/common/datatables/datatables-simple-demo2.js"></script>
</body>


<%-- <body>
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
			 <table id="lessonDataSimple">
						
			</table>
		</div>
	</div>
	</form>
	</body> --%>
</html>