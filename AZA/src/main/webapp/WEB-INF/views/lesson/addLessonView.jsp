<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>addLessonView</title>
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
         <label for="lessonDay" class="col-sm-2 control-label">수업스케쥴</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonDay" name="lessonDay" placeholder="수업스케쥴">
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
        <div class="form-group">
            <label for="lessonPlace" class="col-sm-2 control-label">수업장소</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonPlace" name="lessonPlace" placeholder="수업장소">
        </div>
        <div class="form-group">
            <label for="fees" class="col-sm-2 control-label">수업료</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="fees" name="fees" placeholder="수업료">
        </div>
        <div class="form-group">
            <label for="lessonContent" class="col-sm-2 control-label">수업커리큘럼</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonContent" name="lessonContent" placeholder="커리큘럼">
        </div>

       <div class="form-group">
         <div class="col-sm-offset-4  col-sm-4 text-center">
           <button type="button" class="btn btn-primary" >등&nbsp;록</button>
           <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
         </div>
       </div>
       
     </form>
    </div>
</body>
</html>