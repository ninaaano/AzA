<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
// 수정해야함...............
        $('#sendPhoneNumber').click(function(){
            let phoneNumber = $('#inputPhoneNumber').val();
            Swal.fire('인증번호 발송 완료!')


            $.ajax({
                type: "GET",
                url: "//sendSMS",
                data: {
                    "phone" : phone
                },
                success: function(res){
                    $('#checkBtn').click(function(){
                        if($.trim(res) ==$('#inputCertifiedNumber').val()){
                            Swal.fire(
                                '인증성공!',
                                '휴대폰 인증이 정상적으로 완료되었습니다.',
                                'success'
                            )

                            $.ajax({
                                type: "GET",
                                url: "/update/phone",
                                data: {
                                    "phone" : $('#inputPhoneNumber').val()
                                }
                            })
                            document.location.href="/home";
                        }else{
                            Swal.fire({
                                icon: 'error',
                                title: '인증오류',
                                text: '인증번호가 올바르지 않습니다!',
                                footer: '<a href="/home">다음에 인증하기</a>'
                            })
                        }
                    })


                }
            })
        });
</script>
</body>
</html>