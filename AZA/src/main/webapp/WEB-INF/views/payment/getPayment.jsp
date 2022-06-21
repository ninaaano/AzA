<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  날짜 ,금액 포맷 lib-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR"> 
<title>GET PAYMENT</title>


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
    padding-top : 20px;
    margin : 50px;
}
</style>
</head>
<body>

<script>

function requestPay(){
	
	var price = $("td:nth-child(4)").text().trim();
	var lessonName = $("td:nth-child(2)").text().trim();
	var payCode = $("td:nth-child(1)").text().trim();
	
    var IMP = window.IMP;
    IMP.init('imp15771574');
    
    // name, amonut

    // 결제창 호출
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid : payCode, // 주문 번호
		name : lessonName,
		amount : price,
		buyer_tel : '010-1111-2222'
		

    }, function(rsp) {
         console.log(rsp); 
        if (rsp.success) { // 결제 성공 시 
                  var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\n결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			// 넘겨줄 정보..
	    			
/* 	    		$.ajax({
	    			url : "/payment/rest/complete",
	    			type : "POST",
	    			data:JSON.stringify({
  		  				payCode : rsp.imp_uid,

  		  			}),
  		  			headers : {
  		  				"Accept" : "application/json",
  		  				"Content-Type" : "application/json"
  		  			},
  		  			dataType : "json",
		  			success : function(data){
		  			}
	    			
	    		})//ajax */
 	    		let payment = {
						payCode: rsp.merchant_uid,
						impUid: rsp.imp_uid,
						checkPay : 'Y'
						} 

	               			$.ajax({
						url : "/payment/rest/complete",
						type : "post",
						data : payment,
						dataType : "text",
						success : function(result){
							if(result == "y") {
								alert(msg);
 								location.href = "/payment/rest/updatePaymet";  
							}else{
								var msg = '결제에 실패하였습니다.';
						         msg += '에러내용 : ' + rsp.error_msg;
							}
						},

					});	
        
                /*======================================================*/
        } else {
			var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
        }
    
        alert(msg);
    
    })
};


</script>















<h3>GET PAYMENT</h3>

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

					  
				<tr>				
				<td align="center">

				<input type="hidden" id="payCode" value="${payment.payCode}">
				${payment.payCode}
				</td>
				<td align="center"  id="lessonName" value="${payment.payLessonName.getLessonName()}" >${payment.payLessonName.getLessonName()}</td>
				<td align="center" id="studentName" payCode="${payment.payCode}">${payment.studentName}</td>
				
				<td align="center" value="${payment.amount}" id="amount" >
					${payment.amount}
				</td>
				
				<td align="center">${payment.payDueDate }</td>
				
				<td align="center">
					<fmt:parseDate value="${payment.payDay}" var="payday" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${payday}" pattern="yyyy/MM/dd" /> 		
				</td>
				
				<td align="center" value="${payment.checkPay }">${payment.checkPay }</td>
				
				<c:if test="${payment.checkPay eq 'N'.charAt(0) }">
				<td align="center">
				<button class="btn btn-raised-warning" type="button" onclick="requestPay()" id="realPayment" payCode="${payment.payCode}" style="width:70%;height:35px;">결제하기　</button>
				</td>
 				</c:if> 
 				
 				<c:if test="${payment.checkPay eq 'Y'.charAt(0) }">
				<td align="center">
				결제 완료 :)
				</td>
 				</c:if> 	
 							
				</tr>

</table>	



</body>
</html>