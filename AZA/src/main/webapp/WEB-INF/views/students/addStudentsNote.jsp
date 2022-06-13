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

    function submitPost() {
		  oEditors.getById["noteContent"].exec("UPDATE_CONTENTS_FIELD", [])
		  //스마트 에디터 값을 텍스트컨텐츠로 전달
		  let content = document.getElementById("noteContent").value
		  let noteTitle = document.getElementById("noteTitle").value
		  // 값을 불러올 땐 document.get으로 받아오기
		  if(content == '' || noteTitle == '') {
		    alert("제목과 내용을 입력해주세요.")
		    oEditors.getById["noteContent"].exec("FOCUS")
		    return
		  } else {
			/* alert(document.getElementById("noteContent").value) */
		    console.log(content)
		    document.noteForm.action='/students/addStudentsNote';
		    document.noteForm.submit();
		    /* $("form").attr("method" , "POST").attr("action" , "/students/addStudentsNote").submit(); */
		  }
		  
		  
	}
	
	$(function() {
		
		$( "button.btn.btn-primary:contains('취소')").on("click" , function() {
			history.go(-1);
		});
	});	
	
	
	</script>
	
	
	

</head>
<body>

	<form name="noteForm" action="addStudentsNote" method="post">
	      <div id="smarteditor">
	      	<input name="noteTitle" id="noteTitle" value="${students.noteTitle}" style="width: 100%" placeholder="제목을 입력해주세요"></input>
	      	<input name="studentId" id="studentId" value="${user.userId}" style="color:#808080; background-color: #ccc;" readonly />
	        <textarea name="noteContent" id="noteContent" value="${students.noteContent}"
	                  rows="30" cols="10" 
	                  placeholder="내용을 입력해주세요"
	                  style="width: 100%"></textarea>
	      </div>
      <input type="button" onclick="submitPost();" value="작성"/>
	      <div id="CalcelBtn">
			  			<!-- <button type="button" class="btn btn-primary">수정</button> -->
			  			<button type="button" class="btn btn-primary">취소</button>
		  </div>
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