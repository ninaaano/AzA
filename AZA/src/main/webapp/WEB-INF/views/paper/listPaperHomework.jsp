<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  날짜 ,금액 포맷 lib-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수업 과제</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- <script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script> -->
<!-- <script defer src="/resources/javascript/message/asserts/ui.js"></script> -->
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
<!--  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>과제</title>       
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
    <link href="/resources/css/message.css" rel="stylesheet">
    Load Favicon
    <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    Load Material Icons from Google Fonts
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    Load Simple DataTables Stylesheet
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
    Roboto and Roboto Mono fonts from Google Fonts
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet">
    Load main stylesheet
    <link href="/resources/css/styles.css" rel="stylesheet">
    
        
        
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/message.css"/>
        


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>   -->     	


		
</head>

<body>



<script type="text/javascript">

/* $(function(){
	$('#lessonNamee').on("click", function(){
		self.location ="/paper/getPaperHomework?homeworkCode="+$(this).attr('homeworkCode');
	})
}); */


/* $(function(){
	$("td:nth-child(2)").on("click", function() {
		self.location ="/paper/getPaperHomework?homeworkCode"+$(this).attr('homeworkCode');
	})
}) */

function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/paper/listPaperHomework").submit();
}
	//검색
$(function() {
	 $( "button.btn.btn-outline-primary:contains('검색')").on("click" , function() {
		  
		fncGetList(1);
		});
});
	
$(function() {	
	$( "button.btn.btn-outline-primary:contains('과제 등록')").on("click" , function() {
		self.location = "/paper/addPaperHomework";
	});
});


</script>

	<div class="col flex-shrink-0 mb-5 mb-md-0" style="margin: 20px 20px 20px 20px">
        <h1 class="display-4 mb-0">과 제 목 록</h1>
        <div class="text-muted">Homework List</div>
    </div>
    
<form>	
		<div class="card-body p-4" style="margin: 20px 20px 20px 20px">
            <!-- Simple DataTables example-->
            <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
            	<div class="dataTable-top">
<!--             		<div class="dataTable-dropdown">
            			<label>
            				<select class="dataTable-selector">
            				<option value="5">5</option>
            				<option value="10" selected="">10</option>
            				</select> "entries per page"
           				</label>
        			</div> -->
<!-- 	       			<div class="dataTable-search">
	       				<input class="dataTable-input" placeholder="Search..." type="text">
	      			</div> -->
	      			<!-- //////////////////////////////////////////////////// -->
	      			<div>
	      				<button id="addBtn" type="button" class="btn btn-outline-primary">과제 등록</button>
	      			</div>
	      			<table align="right">
					    <tr>
							  <td>
							    <select class="btn btn-outline-primary dropdown-toggle" id="searchCondition" name="searchCondition" >
									<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>수업명</option>
									<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>학생 이름</option>
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
							  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
							  <input type="hidden" id="currentPage" name="currentPage" value=""/>
							  
				    	</tr>	
					</table>
	      			<!-- //////////////////////////////////////////////////// -->
      			</div>
      			<div class="dataTable-container">
	      			<table id="datatablesSimple" class="dataTable-table">
		                <thead>
		                    <tr>
		                    	
		                    	<th data-sortable="" style="width: 5%;">
		                    		<a href="#" class="dataTable-sorter">No.</a>
	                    		</th>
	                    		<th data-sortable="" style="width: 16%;">
	                    			<a href="#" class="dataTable-sorter">수업명</a>
	                   			</th>
	                   			<th data-sortable="" style="width: 15%;">
	                   				<a href="#" class="dataTable-sorter">과제 제목</a>
	                  			</th>
	                  			<th data-sortable="" style="width: 15%;">
	                  				<a href="#" class="dataTable-sorter">학생 이름</a>
	                 			</th>
	                 			<th data-sortable="" style="width: 20%;">
	                 				<a href="#" class="dataTable-sorter">등록 날짜</a>
	                			</th>
	                			<th data-sortable="" style="width: 14%;">
	                 				<a href="#" class="dataTable-sorter">마감 날짜</a>
	                			</th>
	                			<th data-sortable="" style="width: 10%;">
	                 				<a href="#" class="dataTable-sorter">과제 제출</a>
	                			</th>
	               			</tr>
		                </thead>
		                
	                	<tbody>
            				<c:set var="i" value="0"/>			
								<c:forEach var="paper" items="${list}">			
								<c:set var="i" value="${i+1}" />
								<tr>
									<td >${i}</td>
									<td id="lessonNamee" homeworkCode="${paper.homeworkCode}">${paper.lessonName.getLessonName()}</td>
									<td >${paper.homeworkTitle}</td>
									<td >${paper.studentName.getStudentName()}</td>
									<td >${paper.homeworkCreateAt}</td>
									<td >
										<fmt:parseDate value="${paper.homeworkDueDate}" var="homeworkDueDate" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${homeworkDueDate}" pattern="yyyy/MM/dd" />
									</td>
		                			<td><span class="badge bg-primary">${paper.homeworkCheck}</span></td>				
								</tr>
							</c:forEach>
               			</tbody>
	              	</table>
              	</div>
              	<!-- <div class="dataTable-bottom">
              		<div class="dataTable-info">Showing 1 to 5 of 100 entries</div>
	              		<nav class="dataTable-pagination">
	              		<ul class="dataTable-pagination-list">
		              		<li class="active">
		              			<a href="#" data-page="1">1</a>
		              		</li>
		              		<li class="">
		              			<a href="#" data-page="2">2</a>
		             		</li>
		             		<li class="">
		             			<a href="#" data-page="3">3</a>
		             		</li>
            				<li class="ellipsis">
            					<a href="#">…</a>
           					</li>
           					<li class="">
           						<a href="#" data-page="20">20</a>
          					</li>
          					<li class="pager">
          						<a href="#" data-page="2">›</a>
          					</li>
          				</ul>
         			</nav>
         		</div> -->
         	</div>
        </div>
</form>	        


</body>
</html>