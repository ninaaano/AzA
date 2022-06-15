<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>강의노트 연습</title>

	<!-- 네이버 스마트에디터  -->
	<!-- <head> 안에 추가 -->
	<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<!-- 2.10.0 버전엔 js 파일 일부분이 없어 오류 발생 ! -->
	
	<!-- head 안에 추가 -->
	<script>
	
/* 	function save(){
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	    		//스마트 에디터 값을 텍스트컨텐츠로 전달
		var content = document.getElementById("smartEditor").value;
		alert(document.getElementById("txtContent").value); 
	    		// 값을 불러올 땐 document.get으로 받아오기
		return; 
	} */

    function updateBtn() {
		  oEditors.getById["noteContent"].exec("UPDATE_CONTENTS_FIELD", [])
		  //스마트 에디터 값을 텍스트컨텐츠로 전달
		  let noteContent = document.getElementById("noteContent").value
		  let noteTitle = document.getElementById("noteTitle").value
		  let noteCode = document.getElementById("noteCode").value
		  // 값을 불러올 땐 document.get으로 받아오기
		  if(noteContent == '' || noteTitle == '') {
		    alert("제목과 내용을 입력해주세요.")
		    oEditors.getById["noteContent"].exec("FOCUS")
		    return
		  } else {
			/* alert(document.getElementById("noteContent").value) */
		    console.log(noteContent)
/* 		    document.noteForm.action='students/updateStudentsNote';
		    document.noteForm.submit(); */
		    $("form").attr("method" , "POST").attr("action" , "/students/updateStudentsNote").submit();
		  }
		  
		  
	}
	
	function deleteBtn() {
		$("form").attr("method", "POST").attr("action","/students/deleteStudentsNote").submit();
	}
	
	$(function() {
		
		$( "button.btn.btn-primary:contains('뒤로')").on("click" , function() {
			history.go(-1);
		});
	});	
	
	</script>
	
	
	

</head>
<body>

<%-- 	<form name="noteForm" action="updateStudentsNote" method="post">
	      <div id="smarteditor">
	      	<input name="noteTitle" id="noteTitle" value="${students.noteTitle}" style="width: 100%" placeholder="제목을 입력해주세요"></input>
	      	<input name="studentId" id="studentId" value="${students.studentId}" placeholder="학생 이름"></input>
	        <textarea name="noteContent" id="noteContent" value="${students.noteContent}"
	                  rows="30" cols="10" 
	                  placeholder="내용을 입력해주세요"
	                  style="width: 100%"></textarea>

	      </div>
      <input type="button" onclick="updateBtn();" value="확인"/>
      <button id="cancelUpdateBtn" type="button" class="btn btn-primary">취소</button>

    </form> --%>
    
    
    <form>
    	<div id="smarteditor">
    		<span> 제목 : </span>
 		    <input name="noteTitle" id="noteTitle" value="${students.noteTitle}" style="width: 1000px"/><%-- ${students.noteTitle}</input> --%>
	      	<div name="studentId" id="studentId" value="${students.studentId}">${students.studentId}</div>
	      	<input type="hidden" name="noteCode" id="noteCode" value="${students.noteCode }"/>
	        <textarea name="noteContent" id="noteContent" value="${students.noteContent}"
			           rows="30" cols="10" 
			           style="width: 100%" readonly>${students.noteContent}</textarea>
        </div>
              <input type="button" onclick="updateBtn();" value="수정"/>
              <button id="backBtn" type="button" class="btn btn-primary">뒤로</button>
              <input type="button" onclick="deleteBtn();" value="삭제"/>

    </form>
    
    <script>
	    let oEditors = []
	
	    smartEditor = function() {
	      console.log("Naver SmartEditor")
	      nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "noteContent",	//textarea ID 입력
	        sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",	//smartEditor2Skin.html 경로 입력
	        fCreator: "createSEditor2"
	      
	      })
	    }
	
	    $(document).ready(function() {
	      smartEditor()
	    })
	    	    

	 </script>
	
</body>
</html>