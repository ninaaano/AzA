<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>manageLessonBook</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type ="text/javascript">
	function fncAddLessonBook(){
		$("form").attr("method","GET").attr("action","/lesson/rest/addLessonBook").submit();
	}
</script>
</head>
<body>
<form class="d-flex" action="{% url 'api_book_search' %}" method="GET">	책 검색(isbn 입력)
	<input name="q" class="form-control me-2" type="search" placeholder="isbn 입력" aria-label="Search">
	<button class="btn btn-outline-success" type="submit">검색</button>
</form>

	<table border="1" cellspacing = "0" cellpadding = "10px">
		<thead>
			<tr>
				<td class="ct_list_b" width="100">number</td>
				
				<td class="ct_list_b" width="100">수업명</td>
				
				<th class="ct_list_b" width="100">선생님 이름</th>
				
				<th class="ct_list_b" width="150">수업요일</th>
				
				<th class="ct_list_b" width="150">수업시작시간</th>
				
				<th class="ct_list_b" width="150">수업종료시간</th>
				
				<th class="ct_list_b" width="150">수업장소</th>
				
				<th class="ct_list_b" width="150">과목명</th>
				
				<th class="ct_list_b" width="150">수업코드</th>
				
				<c:if test="${param.menu eq 'student'}">
				    <th class="ct_list_b" width="150">proposal</th>
				</c:if>
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