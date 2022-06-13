<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>

<div id="wrap">



<form id="join_form" method="post" action="/user/Join?m=end">
    <input type="hidden" id="token_sjoin" name="token_sjoin" value="ER0JbsPMApzwM5F0">
    <input type="hidden" id="encPswd" name="encPswd" value="">
    <input type="hidden" id="encKey" name="encKey" value="">
    <input type="hidden" id="birthday" name="birthday" value="">
    <input type="hidden" id="joinMode" name="joinMode" value="unreal">
    <input type="hidden" id="pbirthday" name="pbirthday" value="">
    <input type="hidden" id="nid_kb2" name="nid_kb2" value="">

    <!-- container -->
    <div id="container" role="main">
        <div id="content">
            <!-- tg-text=title -->
            <h2 class="blind">회원가입</h2>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        <span class="ps_box int_id">
							<input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                           </span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                        <span class="ps_box int_pass_step1" id="pswd1Img">
							<input type="password" id="pswd1" name="pswd1" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20" aria-autocomplete="list">
                            <span class="lbl"><span id="pswd1Span" class="step_txt txt_red">사용불가</span></span>
						</span>
                        <span class="error_next_box" id="pswd1Msg" style="display: block;" aria-live="assertive">필수 정보입니다.</span>

                        <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
							<span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="" aria-live="assertive">필수 정보입니다.</span>
                    </div>
                </div>
                <!-- // 아이디, 비밀번호 입력 -->

                <!-- 이름, 생년월일 입력 -->
                <div class="row_group">

                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
						</span>
                        <span class="error_next_box" id="nameMsg" style="" aria-live="assertive">필수 정보입니다.</span>
                    </div>
                    <!-- lang = ko_KR -->

                    <div class="join_row join_birthday">
                        <h3 class="join_title"><label for="yy">생년월일</label></h3>
                        <div class="bir_wrap">
                            <div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy" placeholder="생년월일" aria-label="생년월일" class="int" maxlength="8">
								</span>
                            </div>
                            
                           
                        </div>
                        <span class="error_next_box" id="birthdayMsg" style="display:none" aria-live="assertive"></span>
                    </div>
                <!-- // 이름, 생년월일 입력 -->

                <!-- 휴대전화 번호, 인증번호 입력 -->
                <div class="join_row join_mobile" id="mobDiv">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                                                           
                    </div>
                    <div class="int_mobile_area">
						<span class="ps_box int_mobile">
							<input type="tel" id="phoneNo" name="phoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
							<label for="phoneNo" class="lbl"></label>
						</span>
                        <a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
                            <span class="">인증번호 받기</span>
                        </a>
                    </div>
                    <div class="ps_box_disable box_right_space" id="authNoBox">
                        <input type="tel" id="authNo" name="authNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="wa_verify" class="int" disabled="" maxlength="4">
                        <label id="wa_verify" for="authNo" class="lbl">
                            <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                            <span class="input_code" id="authNoCode" style="display:none;"></span>
                        </label>
                    </div>

                    <span class="error_next_box" id="phoneNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="authNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="joinMsg" style="display:none" aria-live="assertive"></span>
                </div>
                <!-- // 휴대전화 번호, 인증번호 입력 -->

                <!-- tg-display=>{"보호자 모바일 인증": [], "오류 메시지": []} -->
                <div class="join_minor tab" id="pmobDiv" style="display:none">
                    <ul class="tab_m" role="tablist">
                        <li class="m1" role="presentation"><a href="#" onclick="return false;" class="on" role="tab" aria-selected="true" aria-controls="wa_tab_phone">휴대전화인증</a></li>
                    </ul>
                    <div id="wa_tab_phone" role="tabpanel">
                        <div class="agree_check_wrap">
                            
                            <span class="error_next_box" id="pagreeMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                        <div class="row_group">
                            <div class="join_row">
                                <h3 class="join_title"><label for="pname">보호자 이름</label></h3>
                                <span class="ps_box box_right_space">
                                    <input type="text" id="pname" name="pname" title="보호자 이름" class="int" maxlength="40">
                                </span>
                                <span class="error_next_box" id="pnameMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            </div>
                           
                        </div>
                       
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="pphoneNo">휴대전화</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                    <input type="tel" id="pphoneNo" name="pphoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                                </span>
                                <a href="#" class="btn_verify btn_primary" id="btnPrtsSend" role="button">
                                    <span class="">인증번호 받기</span>
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="pauthNoBox">
                                <input type="tel" id="pauthNo" name="pauthNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="pwa_verify" class="int" disabled="" maxlength="6">
                                <label id="pwa_verify" for="pauthNo" class="lbl">
                                    <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                                    <span class="input_code" id="pauthNoCode" style="display:none;"></span>
                                </label>
                            </div>
                            <span class="error_next_box" id="pphoneNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="pauthNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="pjoinMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                    </div>
                </div>
                <!-- tg-display -->

    

                <div class="btn_area">
                    <button type="button" id="btnJoin" class="btn_type btn_primary"><span>가입하기</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script type="text/JavaScript">

function checkDuplication(){
         
		idFlag = false;
         $.ajax({
            url:'/user/json/checkDuplication',
            type:'post',
            data:{id:$('#userId').val()},
            success:function(cnt){ 
               if(cnt == 0) { 
                  $('.id_ok').css("display","inline-block");
                  $('.id_already').css("display", "none");
                  if (event == "first") {
                      showSuccessMsg(oMsg, "멋진 아이디네요!");
                  } else {
                      hideMsg(oMsg);
                  }
                  idFlag = true;
               }else{
                  $('.id_ok').css("display","none");
                  $('.id_already').css("display", "inline-block");
                  showErrorMsg(oMsg, "이미 사용중인 아이디입니다.");
                  setFocusToInputObject(oInput);
               }
            },
            error:function(){
               alert("에러입니다");
            }
         });
         return true;
      };
      
      function checkPswd1() {
          if(pwFlag) return true;

          var id = $("#id").val();
          var pw = $("#pswd1").val();
          var oImg = $("#pswd1Img");
          var oSpan = $("#pswd1Span");
          var oMsg = $("#pswd1Msg");
          var oInput = $("#pswd1");

          if (pw == "") {
              showErrorMsg(oMsg,"필수 정보입니다.");
              setFocusToInputObject(oInput);
              return false;
          }
          if (isValidPasswd(pw) != true) {
              showPasswd1ImgByStep(oImg, oSpan, 1);
              showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
              setFocusToInputObject(oInput);
              return false;
          }

          pwFlag = false;
          $.ajax({
              type:"GET",
              url: "/user2/joinAjax?m=checkPswd&id=" + escape(encodeURIComponent(id)) + "&pw=" + escape(encodeURIComponent(pw)) ,
              success : function(data) {
                  var result = data.substr(4);
                  if (result == 1) {
                      showPasswd1ImgByStep(oImg, oSpan, 1);
                      showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                      setFocusToInputObject(oInput);
                      return false;
                  } else if (result == 2) {
                      showPasswd1ImgByStep(oImg, oSpan, 2);
                      showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
                      setFocusToInputObject(oInput);
                  } else if (result == 3) {
                      showPasswd1ImgByStep(oImg, oSpan, 3);
                      oMsg.hide();
                  } else if (result == 4) {
                      showPasswd1ImgByStep(oImg, oSpan, 4);
                      oMsg.hide();
                  } else {
                      showPasswd1ImgByStep(oImg, oSpan, 0);
                      oMsg.hide();
                  }
                  pwFlag = true;
                  createRsaKey();
              }
          });
          return true;
      }

      function checkPswd2() {
          var pswd1 = $("#pswd1");
          var pswd2 = $("#pswd2");
          var oMsg = $("#pswd2Msg");
          var oImg = $("#pswd2Img");
          var oBlind = $("#pswd2Blind");
          var oInput = $("#pswd2");

          if (pswd2.val() == "") {
              showPasswd2ImgByDiff(oImg, false);
              showErrorMsg(oMsg,"필수 정보입니다.");
              oBlind.html("설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.");
              setFocusToInputObject(oInput);
              return false;
          }
          if (pswd1.val() != pswd2.val()) {
              showPasswd2ImgByDiff(oImg, false);
              showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
              oBlind.html("설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.");
              setFocusToInputObject(oInput);
              return false;
          } else {
              showPasswd2ImgByDiff(oImg, true);
              oBlind.html("일치합니다");
              hideMsg(oMsg);
              return true;
          }

          return true;
      }
      
      function checkBirthday() {
          var birthday;
          var yy = $("#yy").val();
          var mm = $("#mm option:selected").val();
          var dd = $("#dd").val();
          var oMsg = $("#birthdayMsg");
          var lang = "ko_KR";

          var oyy = $("#yy");
          var omm = $("#mm");
          var odd = $("#dd");

          if (yy == "" && mm == "" && dd == "") {
              showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
              setFocusToInputObject(oyy);
              return false;
          }

          if (mm.length == 1) {
              mm = "0" + mm;
          }
          if (dd.length == 1) {
              dd = "0" + dd;
          }

          if(yy == "") {
              showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
              setFocusToInputObject(oyy);
              return false;
          }
          if(yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1) {
              showErrorMsg(oMsg,"태어난 년도 4자리를 정확하게 입력하세요.");
              setFocusToInputObject(oyy);
              return false;
          }
          if(mm == "") {
              showErrorMsg(oMsg,"태어난 월을 선택하세요.");
              setFocusToInputObject(omm);
              return false;
          }
          if(dd == "") {
              showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
              setFocusToInputObject(odd);
              return false;
          }
          if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
              showErrorMsg(oMsg,"태어난 일(날짜) 2자리를 정확하게 입력하세요.");
              setFocusToInputObject(odd);
              return false;
          }

          birthday = yy + mm + dd;
          if (!isValidDate(birthday)) {
              showErrorMsg(oMsg,"생년월일을 다시 확인해주세요.");
              setFocusToInputObject(oyy);
              return false;
          }
          $("#birthday").val(birthday);

          var age = calcAge(birthday);
          if (age < 0) {
              showErrorMsg(oMsg,"미래에서 오셨군요. ^^");
              setFocusToInputObject(oyy);
              return false;
          } else if (age >= 100) {
              showErrorMsg(oMsg,"정말이세요?");
              setFocusToInputObject(oyy);
              return false;
          } else if (age < 14) {
              showErrorMsg(oMsg,"만 14세 미만의 어린이는 보호자 동의가 필요합니다.");
              if(lang == "ko_KR") {
                  if ($("#joinMode").val() == "unreal") {
                      showJuniverMobileTab();
                  }
                  return true;
              } else {
                  hideJuniverTab();
                  return false;
              }
          } else {
              hideMsg(oMsg);
              hideJuniverTab();
              return true;
          }
          return true;
      }
      
      function checkPhoneNo() {
          var phoneNo = $("#phoneNo").val();
          var oMsg = $("#phoneNoMsg");
          var oInput = $("#phoneNo");

          if (phoneNo == "") {
              showErrorMsg(oMsg,"필수 정보입니다.");
              setFocusToInputObject(oInput);
              return false;
          }

          hideMsg(oMsg);
          return true;
      }

      function sendSmsButton() {
          
          var phoneNo = $("#phoneNo").val();
          var key = $("#token_sjoin").val();
          var oMsg = $("#phoneNoMsg");
          var lang = "ko_KR";
          var id = $("#id").val();

          phoneNo = phoneNo.replace(/ /gi, "").replace(/-/gi, "");
          $("#phoneNo").val(phoneNo);
          authFlag = false;

          $("#authNoMsg").hide();
          if(!isCellPhone(phoneNo)) {
              showErrorMsg(oMsg,"형식에 맞지 않는 번호입니다.");
              return false;
          }
          $.ajax({
              type:"GET",
              url: "" + "&mobno=" + phoneNo  + "&key=" + key + "&id=" + id,
              success : function(data) {
                  var result = data.substr(4);
                  if (result == "S") {
                      showSuccessMsg(oMsg,"인증번호를 발송했습니다.(유효시간 30분)<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>이미 가입된 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.");
                      $("#authNo").attr("disabled", false);
                      var oBox = $("#authNoBox");
                      var oCode = $("#authNoCode");
                      showAuthDefaultBox(oBox, oCode);
                  } else {
                      showErrorMsg(oMsg,"전화번호를 다시 확인해주세요.");
                  }
              }
          });
          return false;
      }

      function checkAuthNo() {
          var authNo = $("#authNo").val();
          var oMsg = $("#authNoMsg");
          var oBox = $("#authNoBox");
          var oCode = $("#authNoCode");
          var oInput = $("#authNo");

          if (authNo == "") {
              showErrorMsg(oMsg,"인증이 필요합니다.");
              setFocusToInputObject(oInput);
              return false;
          }

          if(authFlag) {
              showSuccessMsg(oMsg,"인증이 성공했습니다.");
              showAuthSuccessBox(oBox, oCode, "일치");
              $("#phoneNoMsg").hide();
              return true;
          } else {
              checkAuthnoByAjax();
          }
          return true;
      }

      function checkAuthnoByAjax() {
          var authNo = $("#authNo").val();
          var key = $("#token_sjoin").val();
          var oMsg = $("#authNoMsg");
          var oBox = $("#authNoBox");
          var oCode = $("#authNoCode");
          var oInput = $("#authNo");

          $.ajax({
              type:"GET",
              url: "/user2/joinAjax?m=checkAuthno&authno=" + authNo + "&key=" + key ,
              success : function(data) {
                  var result = data.substr(4);
                  if (result == "S") {
                      showSuccessMsg(oMsg,"인증이 성공했습니다.");
                      showAuthSuccessBox(oBox, oCode, "일치");
                      $("#phoneNoMsg").hide();
                      authFlag = true;
                  } else if (result == "Cnt") {
                      showErrorMsg(oMsg,"인증을 다시 진행해주세요.");
                      showAuthErrorBox(oBox, oCode, "불일치");
                      setFocusToInputObject(oInput);
                  } else {
                      showErrorMsg(oMsg,"인증번호를 다시 확인해주세요.");
                      showAuthErrorBox(oBox, oCode, "불일치");
                      setFocusToInputObject(oInput);
                  }
              }
          });
          return true;
      }
      
      $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
      
    


</script>


</div>
</body>
</html>