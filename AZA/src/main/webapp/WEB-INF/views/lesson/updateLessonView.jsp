<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>수업 수정</title>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

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
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"	rel="stylesheet">
	
	<link href="/resources/css/styles.css" rel="stylesheet">
	<link href="/resources/css/common.css" rel="stylesheet">

<script type="text/javascript">
	function fncUpdateLesson(){
		$(".checkbox[name='lessonDay']:checked").length
		var lessonDay ="";
		$(":checkbox[name='lessonDay']:checked").each(function(i,e){
			if(lessonDay ==""){
				lessonDay=e.value;
			}else{
				lessonDay +="^"+e.value;
			}
		});
		
		if($("input:checkbox[id='lessonDay']").is(":checked")==false){
			alert("수업요일을 선택하셔야 합니다.")
			return;
		}
		$("form").attr("method","POST").attr("action","/lesson/udpateLesson").submit();
	}
	
	$(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncUpdateLesson();
		});
	});	
	
	$(function() {
		$("a[href='#']").on("click" , function() {
			$("form")[0].reset();
		});
	});
</script>

</head>
<body>

<form class="form-horizontal">
		<div class="border border-top-0 p-3 p-sm-10 bg-light">
			<div class="px-10 mx-10">
			<div class="col flex-shrink-0 mb-5 mb-md-0" style="margin: 10px 0px 10px 0px">
		        <h1 class="display-4 mb-0">수 업 수 정</h1>
		        <div class="text-muted">Update Lesson</div>
	    	</div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary"  style="width:120px;">강의명</p>
	            <input class="form-control" type="text" placeholder="강의명을 입력하세요" aria-label="Example text with button addon" 
	             id="lessonName" name="lessonName" value="${lesson.lessonName }" aria-describedby="button-addon1" style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 요일</p>&nbsp;&nbsp;
		        월&nbsp;<input type="checkbox"  id="lessonDay" name="lessonDay" value="월"/>&nbsp;&nbsp;
		        화&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="화"/>&nbsp;&nbsp;
		        수&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="수"/>&nbsp;&nbsp;
		        목&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="목"/>&nbsp;&nbsp;
		        금&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="금"/>&nbsp;&nbsp;
		        토&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="토"/>&nbsp;&nbsp;
		        일&nbsp;<input type="checkbox"  id="lessonDay" name="lessonDay" value="일"/>&nbsp;&nbsp;
		        <input type="hidden" id="hiddenValue" name="hiddenValue" value=""/>
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 시작 시간</p>
	            <input class="form-control" type="time" aria-label="Example text with button addon" 
	            id="lessonStartTime" name="lessonStartTime" value="${lesson.lessonStartTime}" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 종료 시간</p>
	            <input class="form-control" type="time" aria-label="Example text with button addon" 
	            id="lessonEndTime" name="lessonEndTime" value="${lesson.lessonEndTime}"aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 장소</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" 
	            id="lessonPlace" name="lessonPlace" aria-describedby="button-addon1" value="${lesson.lessonPlace }" style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업료</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon"
	            id="fees" value="${lesson.fees }"name="fees" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        	        
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업시작일</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" 
	            id="lessonCreateAt" value="${lesson.lessonCreateAt}"name="lessonCreateAt" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">과목명</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" 
	            id="subject" value="${lesson.subject}" name="subject" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업코드</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" 
	            id="lessonCode" value="${lesson.lessonCode}" name="lessonCode" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업료</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" 
	            id="fees" name="fees" value="${lesson.fees}"aria-describedby="button-addon1"style="height:36.5px;">
	        </div>   
	        <div class="mb-0">
	            <p class="btn btn-outline-primary" style="width:120px; margin:0px 0px 15px 0px;" >커리큘럼</p>
	            <textarea class="form-control" name="lessonContent" value="${lesson.lessonContent}"  id="lessonContent" rows="12">${lesson.lessonContent}</textarea>
	        </div>
	        </div>
	    </div>
	       
	       <div class="form-group" aligin="cetner">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">수&nbsp;정 </button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
	 	 </div>		
	</form>		
</body>
</html>