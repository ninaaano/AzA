<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	 <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
        <!-- Roboto and Roboto Mono fonts from Google Fonts-->
     <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet" />
     <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet" />
        <!-- Load main stylesheet-->
     <link href="/resources//css/template.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        .id_ok{color:#6A82FB; display: none;}
        .id_already{color:red; display: none;}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
			
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/login">회원가입</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

	
	<select name = "role" id = "role">
		<option value ="teacher"> 선생님 </option>
		<option value ="student"> 학생 </option>
		<option value ="parents"> 학부모 </option>
      </select>
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요" oninput="checkDuplication()" />
		      <span class="id_ok">사용 가능한 아이디입니다.</span>
		      <span class="id_already">사용중인 아이디 입니다.</span>
		    </div>
		  </div>		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
		    </div>
		  </div>

								<div class="form-group">
									<label for="phone">휴대전화 ('-' 없이 번호만 입력해주세요) </label>
								</div>
		
								<div class="form-row">
									<div class="form-group col-md-8">
										<input type="text" class="form-control" id="phone" name="phone" placeholder="ex)01012345678" required>
										<div id="phoneCheck"></div>
									</div>
		
									<div class="form-group col-md-4">
										<button type="button" class="genric-btn danger radius" onclick="cert();">인증번호 받기</button>
									</div>
		
								</div>
								
								<div class="form-row">
									<div class="form-group col-md-8">
										<input type="text" class="form-control" id="certification"  placeholder="인증번호를 입력해주세요" required>
										<div class="form-group" id="certCheck"></div>	
									</div>
		
									<div class="form-group col-md-4">
										<button type="button" class="genric-btn danger radius" id="sms_AuthBtn" onclick="smsAuthBtn();">확인</button>
									</div>
				
								
								</div>	
																
								<input type="hidden" id="randomVal" value=""/>	                 
                            
                            
         <div class = "student" style = "display:none;" id="student">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="birth" name="birth" placeholder="앞자리 8자리">
		    	<span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">ex) 20001010 </strong>
		      </span>
		    </div>
		  </div>
          
                            
         <div class = "student" style = "display:none;">
		    <label for="school" class="col-sm-offset-1 col-sm-3 control-label">학교</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="school" name="school" placeholder="학교 이름">
		    </div>
		  </div>
         
         <div class = "student" style = "display:none;">
		    <label for="grade" class="col-sm-offset-1 col-sm-3 control-label">학년</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="grade" name="grade" placeholder="숫자만 입력하세요">
		    </div>
		  </div>
         
         <div class = "student" style = "display:none;">
		    <label for="parentsPhone" class="col-sm-offset-1 col-sm-4 control-label">부모님 핸드폰번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="parentsPhone" name="parentsPhone" placeholder="숫자만 입력하세요">
		    </div>
		  </div>
         
         <div class="parents" style = "display:none;">
		    <label for="studentId" class="col-sm-offset-1 col-sm-3 control-label">자녀아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studentId" name="studentId" placeholder="자녀 아이디">
		    </div>
		  </div>

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	

        
		//아이디 체크
		const checkDuplication = _.debounce(async (id) => {
			//var userId = $('#userId').val(); // id값이 userId인 인력란의 값 저장
			var id = $("#userId").val();
			
			
			var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
      		  if (!isID.test(id)) {
					alert("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
					return false;
      		  }			
      		  
			
			$.ajax({
				url:'/user/rest/checkDuplication',
				type:'post',
				data:{id},
				success:function(cnt){ //컨트롤러에서 넘어온 cnt값 받기
					if(cnt == 0) { //0이면 사용가능 아이디
						$('.id_ok').css("display","inline-block");
						$('.id_already').css("display", "none");
						}else{
						$('.id_ok').css("display","none");
						$('.id_already').css("display", "inline-block");
					}
				},
				error:function(){
					alert("에러입니다");
				}
			});
		},1000);
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		

		$(function(){
			$('#password2').blur(function(){
				if($('#password').val() != $('#password2').val()){
					if($('#password2').val() != ''){
						alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
						$('#password2').val('');
						$('#password2').focus();
					}
				}
			})
		});
		
	
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var phone=$("input[name='phone']").val();
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
			
			if(phone == null || phone.length <1){
				alert("핸드폰 인증은 필수입니다.");
				return;
			}
				
			
			
			$("form").attr("method" , "POST").attr("action" , "/user/rest/addUser").submit();
		}
		
		
			$('#role').on('change', function(){
				if($(this).val()=='teacher'){
				$('.student').hide();
				$('.parents').hide();
				} else if ($(this).val()=='student'){
				$('.student').show();
				$('.parents').hide();
				}else{
				$('.student').hide();
				$('.parents').show();

				
				}
			});
	
		
		
		
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> 주민번호 유효성 check 는 이해정도로....
		function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// 유효한 주민번호 형식인 경우만 나이 계산 진행, PortalJuminCheck 함수는 CommonScript.js 의 공통 주민번호 체크 함수임 
			if(!PortalJuminCheck(ssn)) {
				alert("잘못된 주민번호입니다.");
				return false;
			}
		}
	
		function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "23456789";
			for (var i=0; i<8; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}
	

		
		

	</script>
	
	<!--휴대폰 인증 / SMS SENS API -->
<script type="text/javascript">
	function cert() {
		 var random = Math.floor(Math.random() * 1000000)+"";
		 var phone = $("#phone").val();	
		 alert("phone"+phone);
		 $('#randomVal').val(random);
			var obj = {
					"type" : "SMS",
					"contentType" : "COMM",
					"from" : "01032030796",
					"subject" : "본인인증 문자입니다",
					"countryCode" : "82",
					"content" : random,
					"message" : [ {
						"to" : phone,
						"subject" : "인증 문자",
						"content" : "인증번호 [" + random +"]를 입력해주세요."
					} ]
				};
			
			$.ajax({
				type : 'POST',
				url :'/user/rest/sendSMS/' + phone,
				dataType : "json",
				data :  JSON.stringify(obj),				
				contentType: "application/json",
				success : function(data) {
					if(data.statusName == "success"){
						$('#certCheck').text("인증 번호가 전송되었습니다.");
						$('#certCheck').css('color','blue');
						$("#signup_btn").attr("disabled",true);
					}else {
						$('#certCheck').text("입력한 번호를 다시 확인해주세요.");
						$('#certCheck').css('color','red');
						$("#signup_btn").attr("disabled",true);
					}
				}
			});
	}
	
	function smsAuthBtn() {
		
		var userVal = $('#certification').val();
		var certVal = $('#randomVal').val();
	
			if(userVal == certVal){
				$('#certCheck').text("인증이 완료되었습니다.");
				$('#certCheck').css('color','blue');	
				$("#signup_btn").attr("disabled",false);
			}else{
				$('#certCheck').text("인증번호를 다시 확인해주세요");
				$('#certCheck').css('color','red');
				$("#signup_btn").attr("disabled",true);
			}
		
	};
	
</script>
	
</body>

</html>



