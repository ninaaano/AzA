<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  날짜 ,금액 포맷 lib-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR"> 
<title>listPayment</title>


<!--  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<style>
	body {
    padding-top : 50px;
    margin : 50px;
    font-family: Pretendard, 'Noto Sans KR';
    }

</style>


<script type="text/javascript">
$(function myFunction() {
	  document.getElementById("searchDate").style.display = "none";
	  document.getElementById("searchKeyword").style.display = "none";

	});
	
// 검색조건에 따른 검색창 출력
$(function() {
	$('#searchCondition').on('change', function() {	

			if($('option:selected').val() == "1"){
			//기간 검색일 때
			document.getElementById("searchDate").style.display = "";
			  document.getElementById("searchKeyword").style.display = "none";


			}else{
				  document.getElementById("searchDate").style.display = "none";
				  document.getElementById("searchKeyword").style.display = "";

			}
			
	})
});



function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/payment/listPayment").submit();
}

	//검색
		$(function() {
		 	$( "button.btn.btn-raised-light").on("click" , function() {
			  
			fncGetList(1);

			});
		 
		});
	
	
		 $(function() {

			 	$("td:contains('상세보기')").on("click" , function() {
					
					 var payCode = $(this).attr("payCode");
					 alert("payCode ==> "+payCode);
					 
					 
			 		self.location ="/payment/getPayment/"+payCode;

				}); 
			 });				


</script>
</head>
<body>




<h3>PAYMENT LIST</h3> 

<form>				
				
				<table>
				<tr>
	               
					<td align="right">
						<select id="searchCondition" name="searchCondition" class="form-select" aria-label="Default select example" style="width: 130px;font-size=15px;">
							<option selected="" disabled=""> 검색 조건 </option>
							<option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>학생이름</option>
							<option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>기간</option>
							<option value="2"${!empty search.searchCondition&&search.searchCondition==2 ? "selected":"" }>수납여부</option>
						</select> 
					</td>

					<td id="searchDate">
							<input type="date" name="searchStartDate" value="${search.searchStartDate}">
							<input type="date" name="searchEndDate" value="${search.searchEndDate}">
					<td>
					
					<td>
							<input class="dataTable-input" placeholder="검색어를 입력해주세요:)" type="text" name="searchKeyword" id="searchKeyword"
							value="${! empty search.searchKeyword ? search.searchKeyword : "" }" >
					</td>
					
					
					<td align="right" width="70">
					<button class="btn btn-raised-light" type="submit" id="searchPayment">검색</button>
				</td>

				
				</tr>
				<tr> <td height="20"></td> </tr>
				</table>



<table id="datatablesSimple" class="dataTable-table">
	
	
	<thead>
		<tr>
		
		<th data-type="date" data-format="YYYY/MM/DD" data-sortable="" style="width: 7%;">
		<a href="#" class="dataTable-sorter">No</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수업명</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">학생 이름</a>
		</th>
		
		<th data-sortable="" style="width: 12%;">
		<a href="#" class="dataTable-sorter" align="center">수납료</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수납예정일</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수납완료일</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수납여부</a>
		</th>
		

		<c:if test="${user.role eq 'student' || user.role eq 'parent'}">
		<th data-sortable="" style="width: 10%;">
		<a href="#" class="dataTable-sorter" align="center">납부하기</a>
		</th>				
		</c:if>
		
		</tr>
		
	</thead>
	
	<tbody>
	<c:set var="i" value="0" />
	  <c:forEach var="payment" items="${list}">
 	  <c:set var="i" value="${ i+1 }" />
					  
				<tr>				
				<td align="center">
				${ i }
				<input type="hidden" id="payCode" value="${payment.payCode}">
				<input type="hidden" id="studentId" value="${payment.studentId}">
				
				</td>
				<td align="center">${payment.payLessonName.getLessonName()}</td>
				<td align="center">${payment.studentName}</td>
				
				<td align="center" id="amount" >
					${payment.amount}
				</td>
				
				<td align="center">${payment.payDueDate }</td>
				
				<td align="center">
					<fmt:parseDate value="${payment.payDay}" var="payday" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${payday}" pattern="yyyy/MM/dd" /> 		
				</td>
				
				<td align="center">${payment.checkPay }</td>
				
				<c:if test="${user.role eq 'student' || user.role eq 'parent'}">
				<td align="center" payCode="${payment.payCode}">
					<button class="btn btn-raised-warning" type="button" id="realPayment" style="width:70%;height:35px;">
						상세보기
				　</button>			
				</td>
				</c:if>
				
				</tr>
	 </c:forEach>
</table>
<input type="hidden" id="currentPage" name="currentPage" value=""/>
<div align="center">
		<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
				<span class="material-icons">
				arrow_circle_left
				</span>
		</c:if>
		
		
		<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<a href="javascript:fncGetList('${ resultPage.currentPage-1}')">
					<span class="material-icons">
					arrow_circle_left
					</span>				
				</a>
		</c:if>
		
		<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
			<a href="javascript:fncGetList('${ i }');">${ i }</a>
		</c:forEach>
		
		<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				<span class="material-icons">
				arrow_circle_right
				</span>
		</c:if>
		
		<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<a href="javascript:fncGetList('${resultPage.endUnitPage+1}')">
					<span class="material-icons">
					arrow_circle_right
					</span>	
				</a>
		</c:if> 

 </div>     
</form>
</body>
</html>