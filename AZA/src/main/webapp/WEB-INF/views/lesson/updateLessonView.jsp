<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>수업 수정</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
	function fncUpdateLesson(){
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
	<div class="container">
		<div class="page-header text-center">
			<h3 class="text-info">수업 수정</h3>
			<h5 class="text-muted">수업을 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
		</div>
	<form class="form-horizontal" accept-charset="euc-kr">
	<input type="hidden" name="lessonName" value="${lesson.lessonName}" />
	  <div class="form-group">
	    <label for="lessonName" class="col-sm-offset-1 col-sm-3 control-label">강의명</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonName" name="lessonName" placeholder="강의명" value="${lesson.lessonName}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonDay" class="col-sm-offset-1 col-sm-3 control-label">수업스케쥴</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonDay" name="lessonDay" placeholder="수업스케쥴" value="${lesson.lessonDay}">	    
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonStartTime" class="col-sm-offset-1 col-sm-3 control-label">수업 시작시간</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonStartTime" name="lessonStartTime" placeholder="수업시작시간" value="${lesson.lessonStartTime}">	    
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonEndTime" class="col-sm-offset-1 col-sm-3 control-label">수업 종료시간</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonEndTime" name="lessonEndTime" placeholder="수업종료시간" value="${lesson.lessonStartTime}">	    
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonPlace" class="col-sm-offset-1 col-sm-3 control-label">수업 장소</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonPlace" name="lessonPlace" placeholder="수업장소" value="${lesson.lessonPlace}">	    
	     </div>
	  </div>	  
	  <div class="form-group">
	    <label for="lessonCreateAt" class="col-sm-offset-1 col-sm-3 control-label">수업 시작일</label>
	    <div class="col-sm-5">
	    <div align="left">${lesson.lessonCreateAt}</div>  
	     </div>
	  </div>	
	  <div class="form-group">
	    <label for="subject" class="col-sm-offset-1 col-sm-3 control-label">과목명</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="subject" name="subject" placeholder="과목명" value="${lesson.subject}">	    
	     </div>
	  </div>	
	  <div class="form-group">
	    <label for="lessonCode" class="col-sm-offset-1 col-sm-3 control-label">수업코드</label>
	    <div class="col-sm-5">
	     	<input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="수업코드" value="${lesson.lessonCode}" readonly/>
	     </div>
	  </div>	  
	  <div class="form-group">
	    <label for="fees" class="col-sm-offset-1 col-sm-3 control-label">수업료</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="fees" name="fees" placeholder="수업료" value="${lesson.fees}">	    
	     </div>
	  </div>	
	  <div class="form-group">
	    <label for="lessonContent" class="col-sm-offset-1 col-sm-3 control-label">커리큘럼</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonContent" name="lessonContent" placeholder="커리큘럼" value="${lesson.lessonContent}">	    
	     </div>
	  </div>
	  
	  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
	  </div>
		  
	</form>
	
	</div>
	
</body>
</html>