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
    padding-top : 10px;
    margin : 50px;
    font-family: Pretendard, 'Noto Sans KR';
    }

</style>


<script type="text/javascript">
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

/* 테스트 
$(function() {
	$("td:nth-child(3)").on("click" , function() {
		alert("hi!");

		var payCode = $(this).attr("payCode");
		alert(payCode);
		
	    var amonut = $("#amount").text().trim();
	    alert("test 금액 => " + amonut);

		$.ajax(
			{
				url: "/payment/rest/getPayment/"+payCode,
				method : "GET",
				dataType : "JSON",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status){
						
						//alert("JSONData : \n"+JSONData);
						//alert("JSONData 이름 : \n"+JSONData.studentName);
						//alert("JSONData 수업명 : \n"+(String)JSONObejct.get("lessonName");
						//alert("JSONData 금액 : \n"+JSONData.amount);
						//
						var name = JSONData.studentName
						var amount = JSONData.amount
						//alert("amount?" + amount);
						
							//payLessonName.getJSONArray("payLessonName");
						//getJSONObject("payLessonName").get("lessonName");
					}
				
			});

	});
});
 */

</script>
</head>
<body>




<h3>PAYMENT LIST <a href="http://127.0.0.1:8080/payment/listPayment"> 1 </a> </h3> 

<form>				
				
				<table>
				<tr>
				
<!-- 				<td>
				  <div class="dropdown">
				  <button class="btn btn-raised-primary dropdown-toggle" id="dropdownMenuButton" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	                    검색 조건
	                    <i class="trailing-icon material-icons dropdown-caret">arrow_drop_down</i>
	              </button>
	                    수정해야함.
             	           <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
                           <li><a class="dropdown-item" href="#!">학생이름</a></li>
                           <li><a class="dropdown-item" href="#!">기간</a></li>
                           <li><a class="dropdown-item" href="#!">수납여부</a></li>
                       </ul>

                   </div>
	               </td> -->
	               
					<td align="right">
						<select name="searchCondition" class="btn btn-raised-primary dropdown-toggle" style="width: 120px">
							<option value="404"> 검색 조건 </option>
							<option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>학생이름</option>
							<option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>기간</option>
							<option value="2"${!empty search.searchCondition&&search.searchCondition==2 ? "selected":"" }>수납여부</option>
					</select> 
					</td>
					<td>

							<input type="date" name="searchStartDate" value="${search.searchStartDate}">
							<input type="date" name="searchEndDate" value="${search.searchEndDate}">
					<td>
					
					<td>
							<input class="dataTable-input" placeholder="검색어를 입력해주세요 :)" type="text" name="searchKeyword" 
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
		
		<th data-sortable="" style="width: 10%;">
		<a href="#" class="dataTable-sorter" align="center">납부하기</a>
		</th>				
		
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
				<td align="center" payCode="${payment.payCode}">
				<button class="btn btn-raised-warning" type="button" id="realPayment" style="width:70%;height:35px;">
						상세보기
			　</button>			
				</td>

				</tr>
	 </c:forEach>
</table>	
       
</form>
</body>
</html>