<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>성적은 REST이다.</title>
<!--  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
    <script defer src="/resources/javascript/students/manageStudentsExam.js"></script>
    <link href="/resources/css/message.css" rel="stylesheet">
    <!-- Load Favicon-->
    <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <!-- Load Material Icons from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <!-- Load Simple DataTables Stylesheet-->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
    <!-- Roboto and Roboto Mono fonts from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet">
    <!-- Load main stylesheet-->
    <link href="/resources/css/styles.css" rel="stylesheet">
    
        
        
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/message.css"/>
        
<!--  -->

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style>
	body {
    padding-top : 10px;
    margin : 100px;
    font-family: Pretendard, 'Noto Sans KR';
    }

</style>
</head>


<body>

<h1> Rest 싫어요 :( </h1>

<input type="hidden" value="${user.userId }" name="studentId">

	<div class="border border-top-0 p-3 p-sm-5 bg-light">
	    <span class="text-nowrap p-3 border rounded bg-white" style="width: 10rem">I&nbsp;&nbsp;&nbsp;D : ${user.userId }</span>
	    <span class="text-nowrap p-3 border rounded bg-white" style="width: 10rem">이 름 : ${user.userName } &nbsp;</span>
	</div>

	
	<div class="border border-top-0 p-3 p-sm-10">
	    <div class="mb-4">
	        <select class="form-select form-select-lg " aria-label="Large select example"  style="width: 10rem" id="exam">
	        	<option selected="" disabled="">과목 선택</option>
	        <c:forEach var="students" items="${list}">
	            
	            <option value="${students.examScore}" examCode = "${students.examCode }">${students.examSubject}</option>
			</c:forEach>

	        </select>
	    </div>
	</div>

<!-- 성적 입력 시작 -->
<form id="studentsExam">
<div class="border border-top-0 p-3 p-sm-5 row">

<!-- 년도 입력 -->

 

    <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="number" placeholder="2022" style="width:90px;" name="examYear">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">년도</font>
           		</font>
           	</label>
        </div>

    </div>

 <!-- 학기 입력 -->   
     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="number" placeholder="1" style="width:90px;" name="examSemester">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">학기</font>
           		</font>
           	</label>
        </div>
    </div>   

<!-- 분기 입력 -->    
     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="number" placeholder="1" style="width:90px;" name="examTerm">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">분기</font>
           		</font>
           	</label>
        </div>
    </div> 

<!-- 과목 입력 -->

     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="text" placeholder="수학" style="width:90px;" name="examSubject">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">과목</font>
           		</font>
           	</label>
        </div>
    </div> 

<!-- 점수 입력 -->
     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control" type="number" placeholder="100" style="width:90px;" name="examScore">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">점수</font>
           		</font>
           	</label>
        </div>
    </div> 
 <button class="btn btn-raised-success btn-sm col-sm-1 mb-4" type="button">등록</button>

</div>

</form>

<!--  성적 입력 끝-->

				 
<div class="card mb-5" align="center">
      <div class="card-header bg-white px-4"><div class="fs-5 my-1">${user.userName }의 성적</div></div>
      <div class="card-body p-4">
     	 <canvas id="myLineChart" width="883" height="265" style="display: block; box-sizing: border-box; width: 706.797px; height: 212px;"></canvas>
      </div>
  </div>

<script type="text/javascript">
</script>


</body>
</html>