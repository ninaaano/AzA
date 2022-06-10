<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 날짜 포맷 lib-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>listPayment</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>
<script type="text/javascript">

function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/payment/listPayment").submit();
}

	//검색
		$(function() {
		 //<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
		 $( '#searchPayment' ).on("click" , function() {

			alert("hi!");
			fncGetList(1);

			});
		 
		});

/* 테스트 */
$(function() {
	$('#payName').on("click" , function() {
		alert("hi!");
		$.ajax(
			{
				url: "/payment/rest/getPayment",
				method : "GET",
				dataType : "JSON",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status){
						
						alert("JSONData : \n"+JSONData);
						alert("JSONData 이름 : \n"+JSONData.studentName);
						
						var displayValue = "<h3>" +"학생 이름: "+JSONData.studentName+"<br/>";
						$("h3").remove();
						$( "#"+payName+"" ).html(displayValue);
						
						
					}
				
			});

	});
});

//iamport
function requestPay(){

    var IMP = window.IMP;
    IMP.init('imp15771574');
    // 결제창 호출
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(), // 주문 번호
        name : '상품명',
        //amount : this.order.amount,
        amount : 1000,
        buyer_tel : '010-1111-1111',
    }, function(rsp) {
        if ( rsp.success ) {



        } else {
			System.out.println("11");
        }

    });
}
</script>


<h3>PAYMENT LIST</h3>

<form>				
				
				<table>
				<tr>
					<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width: 80px">
							<option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>학생이름</option>
							<option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>기간</option>
							<option value="2"${!empty search.searchCondition&&search.searchCondition==2 ? "selected":"" }>수납여부</option>
						
					</select> 

						<input 	type="text" name="searchKeyword" 
								value="${! empty search.searchKeyword ? search.searchKeyword : "" }" 
						 class="ct_input_g"	style="width:200px; height:20px" > 
						 </td>

					<td align="right" width="70">
					<button type="submit" id="searchPayment">검색</button>
				</td>
				
				</tr>
				</table>
				
				<table border="1" cellspacing = "0" cellpadding = "10px">

			  	<tr>
			  			<td>No</td>
			  			<td>수업명</td>
			  			<td>학생 이름</td>
			  			<td>수납료</td>
			  			<td>수납예정일</td>
			  			<td>수납완료일</td>
			  			<td>수납여부</td>
			  			<td>납부하기</td>
			  	</tr>
		  			  <c:set var="i" value="0" />
 	 				  <c:forEach var="payment" items="${list}">
					  <c:set var="i" value="${ i+1 }" />
			  	 <tr>
							<td align="center">${ i } </td>
		
							<td align="center" >${payment.payLessonName.getLessonName()}</td>
							<td align="center" id="payName">${payment.studentName} </td>
							<td align="center">${payment.amount} </td>
							<td align="center">${payment.payDueDate} </td>
							<td>
							
 							<fmt:parseDate value="${payment.payDay}" var="payday" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${payDay}" pattern="yyyy/MM/dd" /> 
							${payday}
							</td>
							<td align="center">${payment.checkPay} </td>
							
							<td align="center"><button onclick="requestPay()">결제하기</button></td>				 
					
				 </tr>
				  </c:forEach>

				</table>
				
<!--  -->			
       
</form>
</body>
</html>