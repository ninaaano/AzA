<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>addLessonView</title>
    
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
    
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		function fncAddLesson(){
			var lessonName = $("input[name='lessonName']").val();
			var lessonPlace = $("input[name='lessonPlace']").val();
			var fees = $("input[name='fees']").val();
			var subject = $("input[name='subject']").val();
			
			var start_time = $("#lessonStartTime").val();
			var end_time = $("#lessonEndTime").val();
			
			if(lessonName == null || lessonName.length <1){
				alert("강의명은 입력해야 합니다.");
				return;
			}
			if(lessonPlace == null || lessonPlace.length <1){
				alert("수업장소는 입력해야 합니다.");
				return;
			}
			if(fees ==null || fees.length <1){
				alert("수업료는 입력해야 합니다.");
				return;
			}
			if(subject ==null || subject.length <1){
				alert("수업명은 입력해야합니다.");
				return;
			}
			$("form").attr("method","POST").attr("action","/lesson/addLesson").submit();
		}
		
		$(function(){
			$("button.btn.btn-primary").on("click",function(){
				fncAddLesson();
			});
		});
		
		$(function(){
			$("a[href='#']").on("click",function(){
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
		        <h1 class="display-4 mb-0">수 업 추 가</h1>
		        <div class="text-muted">Add Lesson</div>
	    	</div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary"  style="width:120px;">강의명</p>
	            <input class="form-control" type="text" placeholder="강의명을 입력하세요" aria-label="Example text with button addon" 
	             id="lessonName" name="lessonName" aria-describedby="button-addon1" style="height:36.5px;">
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
	            id="lessonStartTime" name="lessonStartTime" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 종료 시간</p>
	            <input class="form-control" type="time" aria-label="Example text with button addon" 
	            id="lessonEndTime" name="lessonEndTime" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 장소</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" 
	            id="lessonPlace" name="lessonPlace" aria-describedby="button-addon1" placeholder="수업장소을 입력하세요"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업료</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" placeholder="수업료를 입력하세요"
	            id="fees" name="fees" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업명</p>
	            <input class="form-control" type="text" placeholder="수업을 입력하세요" aria-label="Example text with button addon" 
	            id="subject" name="subject" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>       
	        	        
	        <div class="mb-0">
	            <p class="btn btn-outline-primary" style="width:120px; margin:0px 0px 15px 0px;" >커리큘럼</p>
	            <textarea class="form-control"  id="lessonContent" name="lessonContent" placeholder="수업 커리큘럽 입력하세요" rows="12"></textarea>
	        </div>
	        </div>
	    </div>
		
	       <div class="form-group" align="center">
		         <div class="col-sm-offset-4  col-sm-4 text-center">
		           <button type="button" class="btn btn-primary" >저&nbsp;장</button>&nbsp;&nbsp;&nbsp;
		           <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		         </div>
	       </div>		
	</form>	


<!-- 
    <div class="container">
        <h1 class="text-center">수업추가</h1>
        form start///
    <form class="form-horizontal">
       <div class="form-group">
         <label for="lessonName" class="col-sm-2 control-label">강의명</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonName" name="lessonName" placeholder="강의명">
         </div>
         <span class="error_next_box" id="idMsg" style="color:red" aria-live="assertive">필수 정보입니다.</span>
       </div>
       
       <div class="form-group">
         <label for="lessonDay" class="col-sm-2 control-label">수업요일</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonDay" name="lessonDay" placeholder="수업요일">
           <input type="checkbox"  id="lessonDay" name="lessonDay" value="일"/>일
           <input type="checkbox"  id="lessonDay" name="lessonDay" value="월"/>월
           <input type="checkbox" id="lessonDay" name="lessonDay" value="화"/>화
           <input type="checkbox" id="lessonDay" name="lessonDay" value="수"/>수
           <input type="checkbox" id="lessonDay" name="lessonDay" value="목"/>목
           <input type="checkbox" id="lessonDay" name="lessonDay" value="금"/>금
           <input type="checkbox" id="lessonDay" name="lessonDay" value="토"/>토
           <input type="hidden" id="hiddenValue" name="hiddenValue" value=""/>
         </div>
       </div>
       <div class="form-group">
        <label for="lessonStartTime" class="col-sm-2 control-label">수업시작시간</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="lessonStartTime" name="lessonStartTime" placeholder="수업시작시간">
          <input type="time" class="form-control" id="lessonStartTime" name="lessonStartTime" placeholder="수업시작시간">
        </div>
      </div>
      <div class="form-group">
        <label for="lessonEndTime" class="col-sm-2 control-label">수업종료시간</label>
        <div class="col-sm-10">
          <input type="time" class="form-control" id="lessonEndTime" name="lessonEndTime" placeholder="수업종료시간">
        </div>
       </div>
        <div class="form-group">
            <label for="lessonPlace" class="col-sm-2 control-label">수업장소</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonPlace" name="lessonPlace" placeholder="수업장소">
        </div>
        </div>
        <div class="form-group">
            <label for="fees" class="col-sm-2 control-label">수업료</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="fees" name="fees" placeholder="수업료">
        	</div>
        </div>
        <div class="form-group">
            <label for="subject" class="col-sm-2 control-label">수업명</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="subject" name="subject" placeholder="수업명">
        </div>
        </div>
        <div class="form-group">
            <label for="lessonContent" class="col-sm-2 control-label">커리큘럼</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonContent" name="lessonContent" placeholder="커리큘럼">
        </div>
        </div>

       <div class="form-group">
	         <div class="col-sm-offset-4  col-sm-4 text-center">
	           <button type="button" class="btn btn-primary" >저&nbsp;장</button>
	           <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
	         </div>
       </div>
       
     </form> -->
</body>
</html>