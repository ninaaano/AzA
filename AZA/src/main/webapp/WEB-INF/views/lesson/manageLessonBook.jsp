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

<script type ="text/javascript">
	function fncAddLessonBook(e) {
		const p = [];
		p.push('hi')
		const select = $(".lessonbook");
		for(let i=0; i<select.length; i++){
			p.push($(select[i]).data('value'))
		}
		console.log(p)
		
		var a = $(e).parent().find(".form-select").val();
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
		$("button.ct_btn01:contains('삭제')").on("click",function(){
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


	window.addEventListener('DOMContentLoaded', event => {
		const bookDataSimple = document.getElementById('bookDataSimple');
		/* alert("실행") */
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
	});	
</script>



</head>
<body>


<form id="lessonbook"class="d-flex">	
<c:if test="${user.role eq 'teacher'}">
	책 검색(isbn 입력)
	<div class="form-group">
         <label for="lessonCode" class="col-sm-2 control-label">수업명</label>
           <select class="form-select" aria-label="Disabled select example">
           		<!-- <option value=''> 선택</option> -->
		    	<c:set var="i" value="0"/>	
		    	<c:forEach var="book" items="${book}">
		    		<%-- <c:set var="i" value ="${i+1}"/> --%>
					  <option class="lessonbook" value="${i+1}" data-value="${book.lessonCode}">${book.lessonName}</option>
				</c:forEach>
			</select>
         <!-- <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="수업코드">
         </div> -->
    </div>
	<input name = "isbn" class="form-control me-2" type="search" placeholder="isbn 입력" aria-label="Search">
	<button class="btn btn-outline-success" type="button">검색</button>
	</c:if>
</form>

<form id="book" class="book">
	<div class="row row-cols-1 row-cols-md-3 g-4" id="book" >
			<c:set var="i" value="0"/>
				<c:forEach var="lesson" items="${list}">
					<c:set var="i" value = "${i+1}"/>
				<div class="col">
			    <div class="card h-100">
			      <img src="${lesson.bookImg}" class="card-img-top" style="width:200px; height:200px">
			      <div class="card-body">
			        <h5 class="card-title">교재 정보</h5>
			        <p class="card-text" name="isbn" id="isbn">isbn = ${lesson.isbn}</p>
					<p class="card-text">책제목 = ${lesson.bookTitle}</p>
					<p class="card-text">출판사 = ${lesson.publisher}</p>
					<p class="card-text">가격 = ${lesson.bookPrice}</p>
					<p class="card-text">저자 = ${lesson.author}</p>
					<p class="card-text">발행년도 = ${lesson.bookYear}</p>
					<p class="card-text">수업명 = ${lesson.lessonName}</p>
					<c:if test="${user.role eq 'teacher'}">
						<button type="button" class="ct_btn01" id="ct_btn01" data-value="${lesson.isbn}">삭제</button>
						<%-- <p class="card-text"><button type="button" class="ct_btn01" id="ct_btn01" isbn="${lesson.isbn}">삭제</button></p> --%>
					</c:if>
			      </div>
			    </div>
			  </div>
		</c:forEach>
	</div>
	
	<div id = "bookDataSimple">
	</div>
</form>

<form id = "result">
	
</form>

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