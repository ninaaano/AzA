<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Iamport</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>


<button onclick="requestPay()">결제하기</button>
<script>
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
        amount : 100,
   q     buyer_tel : '010-1111-1111',
    }, function(rsp) {
        if ( rsp.success ) {



        } else {
			System.out.println("11");
        }

    });
}
  </script>


</body>
</html>