<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>manageLessonBook</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href="/resources/css/styles.css" rel="stylesheet">
	<link href="/resources/css/common.css" rel="stylesheet">
	
<script type ="text/javascript">
	function fncAddLessonBook(e) {
		const p = [];
		p.push('hi')
		const select = $(".lessonbook");
		for(let i=0; i<select.length; i++){
			p.push($(select[i]).data('value'))
		}
		console.log(p)
		
		var a = $(e).parent().find(".select").val();
		console.log(a)
		var lessonCode = p[a];
		console.log(lessonCode)
		
		/* var lesson = $(this).data('value');
		console.log */
		$("#lessonbook").attr("method","POST").attr("action","/lesson/rest/addLessonBook?lessonCode="+lessonCode).submit();
		
	}
	$(function(){
		$("button.btn.btn-outline-success").on("click",function(){
			fncAddLessonBook(this);	
		});		
	});
	
/* 	$(function(){
		$("button.ct_btn01:contains('삭제')").on("click",function(){
			alert("삭제");
			self.location="/lesson/deleteLessonBook" 
			
			alert("삭제");
		});
	}); */
/* 	function fncDeleteLessonBook(){
		var isbn = $(this).data("value");
		console.log(isbn);
		
		$("#book").attr("method","POST").attr("action","/lesson/deleteLessonBook?isbn="+isbn).submit();
	}
	$(function(){
		$("button.ct_btn01").on("click",function(){
			fncDeleteLessonBook();
		});
	}); */
	
 	$(function(){
		$("button.btn.btn-outline-primary:contains('삭제')").on("click",function(){
			var isbn = $(this).data("value");
			self.location="/lesson/deleteLessonBook?isbn="+isbn;
		});
	});
	
/*  	function listLessonBook(){
		$.ajax({
			url:"lesson/rest/listLessonBook",
			type:"GET",
			dataType:"json",
			headers:{
				"Accept" : "application/json",
                "Content-Type" : "application/json",
			},
			success: function(JSONData, status){
				alert("OK");
				alert(JSONData)
				
			}
		})
	} */


/* 	window.addEventListener('DOMContentLoaded', event => {
		const bookDataSimple = document.getElementById('bookDataSimple');
		if(bookDataSimple){
			$.ajax({
				url:"/lesson/rest/manageLessonBook",
				type:"GET",
				dataType:"json",
				success:function(result){
					if(result){
						var book = result.list;
						var bookData =[];
						book.map((book,i)=>{
							var temp=[];
							temp.push(book.isbn);
							temp.push(book.booktitle);
							temp.push(book.publisher);
							temp.push(book.bookPrice);
							temp.push(book.author);
							temp.push(book.bookYear);
							temp.push(book.lessonName);
							
							bookData.push(temp);
						})
						console.log(bookData);
						var out = "";
						 out += "<br> ======";
						 out += bookData[0];
						 
						 $("#result").html(out);
					}
				}
			})
		}
	});	 */
</script>

<style>
img {display: block; margin: 0px auto;
	-webkit-perspective: 1;
	image-rendering: -webkit-optimize-contrast;
	transform: translateZ(0);
	backface-visibility: hidden;
}
.form-control{
	right:0;
}

/* .right-items {
  margin-left: auto;
  width: 100px;
  height: 50px;
  text-align: center;
} */
</style>

</head>
<body style="background-color:#f5f5f5">


		<div class="mb-3 mr-5 pr-5">
			<form id="lessonbook">
			<c:if test="${user.role eq 'teacher'}">
				<div class="form-group" style="float:right">
			          <label for="lessonCode">수 업 명</label>
			          <select class="select" aria-label="Disabled select example" style="width:180px">
			           		<!-- <option value=''> 선택</option> -->
					    	<c:set var="i" value="0"/>
					    	<c:forEach var="book" items="${book}">
					    		<c:set var="i" value ="${i+1}"/>
								  <option class="lessonbook" value="${i}" data-value="${book.lessonCode}">${book.lessonName}</option>
							</c:forEach>
						</select>
			         <!-- <div class="col-sm-10">
			           <input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="수업코드">
			         </div> -->
			        	<!-- <div style="float:right"> -->
							<input name = "isbn" type="search" placeholder="isbn 입력" aria-label="Search">
							<button class="btn btn-outline-success" type="button" >검색</button>
						<!-- </div> -->
			   	 </div>
				</c:if>
			</form>
		</div>
<br>		
<div class="mx-5 px-5">
	<div class="mx-5 px-5">
		<form id="book" class="book">
			<div class="row row-cols-1 row-cols-md-4 mt-5 g-4" id="book">
					<c:set var="i" value="0"/>
						<c:forEach var="lesson" items="${list}">
							<c:set var="i" value="${i+1}"/>
						<div class="col">
					    <div class="card h-100" align="center" >
					    	 <div class="embed-responsive embed-responsive-4by3">
					    	 <!-- class="card-img-top" style="width:240px; height:240px;" -->
					      	<img src="${lesson.bookImg}" class="card-img-top embed-responsive-item">
					      </div>
					      <div class="card-body">
					        <h5 class="card-title">교재 정보</h5>
					        <div class="input-group">
					            <p class="btn btn-outline-primary" style="font-size:15px; border:0;">isbn : 
				                <input type="text" name="isbn" id="isbn" value="${lesson.isbn}" aria-label="Example text with button addon" 
					              style="font-size:15px; background-color:white;border:0;"aria-describedby="button-addon1" readOnly="true"></p>
					        </div>
					        <div class="input-group">	
					            <p class="btn btn-outline-primary" style="font-size:15px; border:0;">책제목 : 
				                <input type="text" value="${lesson.bookTitle}" aria-label="Example text with button addon" 
					              style="font-size:15px; background-color:white;border:0; width:300px"aria-describedby="button-addon1" readOnly="true"></p>
					        </div>
					        <div class="input-group">
					            <p class="btn btn-outline-primary" style="font-size:15px; border:0;">출판사 : 
				                <input type="text" value="${lesson.publisher}" aria-label="Example text with button addon" 
					              style="font-size:15px; background-color:white;border:0;" aria-describedby="button-addon1" readOnly="true"></p>
					        </div> 
					        <div class="input-group">
					            <p class="btn btn-outline-primary" style="font-size:15px; border:0;">가격 : 
				                <input type="text" value="${lesson.bookPrice}" aria-label="Example text with button addon" 
					              style="font-size:15px; background-color:white;border:0;" aria-describedby="button-addon1" readOnly="true"></p>
					        </div>
					        <div class="input-group">
					            <p class="btn btn-outline-primary" style="font-size:15px; border:0;">저자 : 
				                <input type="text" value="${lesson.author}" aria-label="Example text with button addon" 
					              style="font-size:15px; background-color:white;border:0;" aria-describedby="button-addon1" readOnly="true"></p>
					        </div> 
					        <div class="input-group">
					            <p class="btn btn-outline-primary" style="font-size:15px; border:0;">발행년도 : 
				                <input  type="text" value="${lesson.bookYear}" aria-label="Example text with button addon" 
					              style="font-size:15px; background-color:white;border:0;" aria-describedby="button-addon1" readOnly="true"></p>
					        </div>
					        <div class="input-group">
					            <p class="btn btn-outline-primary" style="font-size:15px; border:0;">수업명 : 
				                <input type="text" value="${lesson.lessonName}" aria-label="Example text with button addon" 
					              style="font-size:15px; background-color:white;border:0;" aria-describedby="button-addon1" readOnly="true"></p>
					        </div>
					        <c:if test="${user.role eq 'teacher'}">
								<button type="button" class="btn btn-outline-primary" id="ct_btn01" data-value="${lesson.isbn}">삭제</button>
								<%-- <p class="card-text"><button type="button" class="ct_btn01" id="ct_btn01" isbn="${lesson.isbn}">삭제</button></p> --%>
							</c:if>
					        
					        <%-- <p class="card-text" name="isbn" id="isbn">isbn = ${lesson.isbn}</p>
							<p class="card-text">책제목 = ${lesson.bookTitle}</p>
							<p class="card-text">출판사 = ${lesson.publisher}</p>
							<p class="card-text">가격 = ${lesson.bookPrice}</p>
							<p class="card-text">저자 = ${lesson.author}</p>
							<p class="card-text">발행년도 = ${lesson.bookYear}</p>
							<p class="card-text">수업명 = ${lesson.lessonName}</p>
							<c:if test="${user.role eq 'teacher'}">
								<button type="button" class="ct_btn01" id="ct_btn01" data-value="${lesson.isbn}">삭제</button>
							</c:if> --%>
					      </div>
					    </div>
					  </div>
				</c:forEach>
			</div>
			
			<!-- <div id = "bookDataSimple">
			</div> -->
		</form>
	</div>
</div>
<!-- <form id = "result">
	
</form> -->

<%-- <c:set var="i" value="0"/>
	<c:forEach var="lesson" items="${list}">
		<c:set var="i" value = "${i+1}"/>
			<div class="d-flex justify-content-center border border-top-0 p-3 p-sm-10 bg-light">
               <div class="w-100" style="max-width: 21.875rem">
                <div class="card card-raised">
                  <a class="ripple-gray" href="#!"><img class="card-img-top" src="${lesson.bookImg}" alt="..."></a>
                     <div class="card-body">
                      <h2 class="card-title">Our Changing Planet</h2>
                         <h3 class="card-subtitle mb-3">by Start Bootstrap</h3>
	                   	  	<p class="card-text">${lesson.isbn}</p>
						    <p class="card-text">${lesson.bookTitle}</p>
						    <p class="card-text">${lesson.publisher}</p>
						    <p class="card-text">${lesson.bookPrice}</p>
						    <p class="card-text">${lesson.author}</p>
						    <p class="card-text">${lesson.bookYear}</p>
						    <p class="card-text">${lesson.bookCode}</p>
                     </div>
                           
                           
                        <div class="card-actions">
                            <div class="card-action-buttons">
                                     <button class="btn btn-text-primary" type="button">Read</button>
                             <button class="btn btn-text-primary" type="button">Bookmark</button>
                       </div>
                         <div class="card-action-icons">
                             <button class="btn btn-text-dark btn-icon btn-lg" type="button"><i class="material-icons">favorite</i></button>
                                <button class="btn btn-text-dark btn-icon btn-lg" type="button"><i class="material-icons">share</i></button>
			            </div>
			        	</div>
			             </div>
			           </div>
			        </div>
        </c:forEach> --%>


<!-- search -->
<%-- 			<c:set var="i" value="0"/>			
				<c:forEach var="lesson" items="${list}">			
				<c:set var="i" value = "${i+1}"/>
					<div class="card" style="width: 18rem;">
					  <img src="${lesson.bookImg}" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">교재 정보</h5>
					    <p class="card-text">${lesson.isbn}</p>
					    <p class="card-text">${lesson.bookTitle}</p>
					    <p class="card-text">${lesson.publisher}</p>
					    <p class="card-text">${lesson.bookPrice}</p>
					    <p class="card-text">${lesson.author}</p>
					    <p class="card-text">${lesson.bookYear}</p>
					    <p class="card-text">${lesson.bookCode}</p>
					    <p class="card-text"><button type="button" class="ct_btn01" id="ct_btn01" data-Value="${lesson.isbn}">삭제</button></p>
					  </div>
					</div>
			</c:forEach> --%>
	</body>
</html>