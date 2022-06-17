<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>manageLessonBook</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type ="text/javascript">
	function fncAddLessonBook() {
		/* var lessonCode = $("input[name='lessonCode']").val();
		if(lessonCode != "${lesson.lessonCode}"){
			alert("수업코드가 일치하지 않습니다.");
			return;
		} */
		$("form").attr("method","GET").attr("action","/lesson/rest/addLessonBook").submit();
	}
	$(function(){
		$("button.btn.btn-outline-success").on("click",function(){
			fncAddLessonBook();	
		});		
	});
	
	function listLessonBook(){
		$.ajax({
			url:"http://localhost:8080/lesson/rest/listLessonBook",
			type:"GET",
			headers:{
				"Accept" : "application/json",
                "Content-Type" : "application/json",
			},
			success: function(result){
				alert("OK");
				console.log(result);
				var list = result.list
				console.log(list);
				console.log("-------");
				
			}
		})
	}
</script>

</head>
<body>
<form class="d-flex" action="{% url 'api_book_search' %}" method="GET">	책 검색(isbn 입력)
	<div class="form-group">
         <label for="lessonCode" class="col-sm-2 control-label">수업코드</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="수업코드">
         </div>
    </div>
	<input name = "isbn" class="form-control me-2" type="search" placeholder="isbn 입력" aria-label="Search">
	<button class="btn btn-outline-success" type="button">검색</button>
</form>
<!-- search -->
	<div class="card" style="width: 18rem;">
	  <img src="data:image/jpeg;base64,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" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">교재 정보</h5>
	    <p class="card-text">hello</p>
	    <p class="card-text">${lesson.isbn}</p>
	    <p class="card-text">${lesson.bookTitle}</p>
	    <p class="card-text">${lesson.publisher}</p>
	    <p class="card-text">${lesson.bookPrice}</p>
	    <p class="card-text">${lesson.author}</p>
	    <p class="card-text">${lesson.bookYear}</p>
	    <p class="card-text">${lesson.bookImg}</p>
	    <p class="card-text">${lesson.bookCode}</p>
	    <p class="card-text">hello</p>
	  </div>
	</div>

	<table border="1" cellspacing = "0" cellpadding = "10px">
	

		<thead>
			<tr>
				<td class="ct_list_b" width="100">책 제목</td>
				
				<td class="ct_list_b" width="100">저자</td>
				
				<th class="ct_list_b" width="100">출판사</th>
				
				<th class="ct_list_b" width="150">발행년도</th>
				
				<th class="ct_list_b" width="150">책가격</th>
				
				<th class="ct_list_b" width="150">수업명</th>
			</tr>
		</thead>
		
		<tbody>
			<c:set var="i" value="0"/>			
			<c:forEach var="lesson" items="${list}">			
				<c:set var="i" value="${i+1}" />
				<tr class="ct_list_pop">
					<td align="center">${i}</td>
					
					<td align="left">${lesson.isbn}</td>
					
					<td align="left">${lesson.bookTitle}</td>
					
					<td align="left">${lesson.publisher}</td>
					
					<td align="left">${lesson.bookPrice}</td>
					
					<td align="left">${lesson.author}</td>
					
					<td align="left">${lesson.bookYear}</td>
					
					<td align="left">${lesson.bookImg}</td>
					
					<td align="left">${lesson.bookCode}</td>
					
					<c:if test="${param.menu eq 'student'}">
				    	<td class="left">hello</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>