<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>addLessonView</title>
    
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		function fncAddLesson(){
			var lessonName = $("input[name='lessonName']").val();
			var lessonDay = $("input[name='lessonDay']").val();
			var lessonPlace = $("input[name='lessonPlace']").val();
			var fees = $("input[name='fees']").val();
			var subject = $("input[name='subject']").val();
			
			if(lessonName == null || lessonName.length <1){
				alert("수업명은 필수 입력사항입니다..");
				return;
			}
			if(lessonDay == null || lessonDay.length <1){
				alert("수업요일은 필수입력사항입니다..");
				return;
			}
			if(lessonPlace == null || lessonPlace.length <1){
				alert("수업장소는 필수입력사항입니다..");
				return;
			}
			if(fees ==null || fees.length <1){
				alert("수업료는 필수입력사항입니다..");
				return;
			}
			if(subject ==null || subject.length <1){
				alert("강의명은 필수입력사항입니다..");
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
    <div class="container">
        <h1 class="bg-primary text-center">수업등록</h1>
        
        <!-- form start/// -->
    <form class="form-horizontal">
       <div class="form-group">
         <label for="lessonName" class="col-sm-2 control-label">수업명</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonName" name="lessonName" placeholder="수업명">
         </div>
       </div>
       <div class="form-group">
         <label for="lessonDay" class="col-sm-2 control-label">수업요일</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonDay" name="lessonDay" placeholder="수업요일">
         </div>
       </div>
       <div class="form-group">
        <label for="lessonStartTime" class="col-sm-2 control-label">수업시작시간</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="lessonStartTime" name="lessonStartTime" placeholder="수업시작시간">
        </div>
      </div>
      <div class="form-group">
        <label for="lessonEndTime" class="col-sm-2 control-label">수업종료시간</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="lessonEndTime" name="lessonEndTime" placeholder="수업종료시간">
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
            <label for="subject" class="col-sm-2 control-label">강의명</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="subject" name="subject" placeholder="강의명">
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
       
     </form>
    </div>
</body>
</html>