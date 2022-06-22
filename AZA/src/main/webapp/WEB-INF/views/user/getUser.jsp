<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script defer src="https://kit.fontawesome.com/57ea3feb1d.js" crossorigin="anonymous"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
<script defer src="/resources/javascript/alert/alertUI.js"></script>
<script defer src="/resources/javascript/common/indexUI.js"></script>

<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<!-- Load Simple DataTables Stylesheet-->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet">
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
	

<style>
*, body { 
font-family: Pretendard, 'Noto Sans KR';
}
</style>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/index_UI.css" rel="stylesheet">

<script type="text/javascript">

function deleteAlert(alertCode) {
	$.ajax({
		url:"http://localhost:8080/alert/rest/deleteAlert/"+alertCode,
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("deleteAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(!alertReadAt) {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">읽음</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger" onclick="return deleteAlert(`+alertCode+`)">delete</span>
						<p class="text-danger">삭제</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}              		
            	})
            	
            	$('.alertLi').remove();
	        	$("#alertDropDown").html("");
	        	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">알림</h6></li>
						<li><hr class="dropdown-divider my-0" /></li>`);
	        	$("#alertDropDown").append(listAlertView);
	        	$("#alertDropDown").addClass("show").attr("data-bs-popper", "static");

            } else {
            	console.log("faile");
            }
       }
	})
	
	
	
	
}



function listAlert() {
	$.ajax({
		url:"http://localhost:8080/alert/rest/listAlert",
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("listAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(!alertReadAt) {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">읽음</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger" onclick="return deleteAlert(`+alertCode+`)">delete</span>
						<p class="text-danger">삭제</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}              		
            	})
            	
            	$('.alertLi').remove();
            	$("#alertDropDown").html("");
            	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">알림</h6></li>
    					<li><hr class="dropdown-divider my-0" /></li>`);
            	$("#alertDropDown").append(listAlertView);

            } else {
            	console.log("faile");
            }
       }
	})
	
}

function readAlert(alertCode) {
	$.ajax({
		url:"http://localhost:8080/alert/rest/readAlert/"+alertCode,
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
            	
            	console.log("readAlert");
            	
        	var listAlertView = "";
            var list = result.list
            	
            	list.map(alert => {
            		
            		let alertCode = alert.alertCode;
            		let alertContent = alert.alertContent;
            		let alertCreateAt = alert.alertCreateAt;
            		let alertReadAt = alert.alertReadAt;
            		
            		if(alertReadAt == "") {
            			listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3" onclick="return readAlert(`+alertCode+`)">
            			<div>
            			<span class="material-icons text-primary">done</span>
            			<p class="text-primary">읽음</p>
            			</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;
            			
            		} else {
						listAlertView += `<li class="alertLi d-flex justify-content-between pt-3 px-3">
						<div>
						<span class="material-icons text-danger">delete</span>
						<p class="text-danger">삭제</p>
						</div>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
						</li><li><hr class="dropdown-divider my-0" /></li>`;               		
            		}
            		
            		
            		
            	})
            	
            	$('.alertLi').remove();
            	$("#alertDropDown").html("");
            	$("#alertDropDown").append(`<li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">알림</h6></li>
    					<li><hr class="dropdown-divider my-0" /></li>`);
            	$("#alertDropDown").append(listAlertView);
            	$("#alertDropDown").addClass("show").attr("data-bs-popper", "static");
            	
            } else {
            	console.log("faile");
            }
       }
	})
}



$(function() {

	// Alert
	 $('#dropdownMenuNotifications').on('click', function() {
		console.log("알림 버튼 눌림");
		listAlert();

	})
	
	
	
	// Message
	$("#open-messagePopup").on("click", function() {
		console.log("메시지 버튼 눌림");
		
        $.ajax({
            url: "http://localhost:8080/message/rest/listMessage",
            type: "GET",
            headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json",                                    
                },
            success: function(result) {
                if(result) {
                	console.log(result);
                	
                	sessionStorage.setItem('userId', result[0].userId);
                	
                	result.shift();
                	
                	console.log(result);
                	
                	var listOtherView = "";
                	
                	result.map((other,i) => {
               			
                		let studentId = other.studentId ? other.studentId : other.firstStudentId;
                		let studentName = other.studentId ? other.studentName : "학생이룸";
                		let relationName = other.relationName ? other.relationName : "";
                		let userId = other.userId ? other.userId : studentId;
                		let userName = studentName + " " + relationName;
                		//console.log(i, studentId);
                		
                		listOtherView += `<ul id='getOtherMessage' class='list-unstyled mb-0' onclick="getOtherMessage('`+userId+`','`+userName+`')">
                		<li class='p-2 border-bottom' data-id=`+userId+`>
                            	<a class="d-flex justify-content-between">
                                    <div class="d-flex flex-row">
                                        <div class="pt-1">
                                            <p class="fw-bold mb-0">`+studentName+" "+relationName+`</p>
                                            <p class="small text-muted">최근메시지</p>
                                        </div>
                                    </div>
                            	</a>
                        	</li>
                    	</ul>`;
                	});
                	
                	$('#getOtherMessage').remove();
                	$('#listOther').append(listOtherView);

                } else {
                    console.log("실패");
                }
            } 
        })
		
	})

})
	

</script>
<script type="text/javascript">

function resetForm() {
	document.addStudentsRecordForm.reset();
	$('.lessonCheck').removeClass('show');
	$('.valCheck').removeClass('show');	
}

$(function() {
	// addStudentsRecord
	$('#addStudentsRecordBtn').on("click", function() {

		var valFlag = false;
		const lessonCode = document.addStudentsRecordForm.lessonCode.value;
		const lessonStartDate = document.addStudentsRecordForm.lessonStartDate.value;
		const fees = document.addStudentsRecordForm.fees.value;
		const payDueDate = document.addStudentsRecordForm.payDueDate.value;
		
		// 유효성 check
		if(lessonCode.length < 8 || lessonCode == null || lessonStartDate.length < 1 || lessonStartDate.length == null || fees.length < 1 || fees == null || payDueDate < 1 || payDueDate == null) {
			$('.valCheck').addClass('show');
		} else {
			$.ajax({
				 url: "/lesson/rest/checkLessonCode/"+lessonCode,
		            type: "GET",
		            headers : {
		                    "Accept" : "application/json",
		                    "Content-Type" : "application/json",                                    
		                },
		            success: function(result) {
		                if(result) {
		                	console.log(result);
		                	
		                	if(result == true) {
		                		valFlag = true;
		                	}
		                	
		                	if(!valFlag) {
		                		$('.lessonCheck').addClass('show');
		                		return;
		                	}
		                	
		                	console.log(valFlag);
		                	
		                	if(valFlag) {
		            			document.addStudentsRecordForm.action = "/students/addStudentsRecord";
		            			document.addStudentsRecordForm.method = "POST";
		            			document.addStudentsRecordForm.submit();		
		            		}
		                } else {
		                	console.log("lesson/rest/checkLessonCode :: error || null");			                	
		                	$('.lessonCheck').addClass('show');
		                }
		            }
			})
		}
		
    	

	})
})

$(function() {

	// Alert
	 $('#dropdownMenuNotifications').on('click', function() {
		console.log("알림 버튼 눌림");
		listAlert();

	})

	// Message
	$("#open-messagePopup").on("click", function() {
console.log("메시지 버튼 눌림");
		
        $.ajax({
            url: "/message/rest/listMessage",
            type: "GET",
            headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json",                                    
                },
            success: function(result) {
                if(result) {
                	console.log(result);
                	sessionStorage.clear();
                	sessionStorage.setItem('userId', result[0].userId);
                	
                	result.shift();
                	
                	console.log("message/listmessage : "+result);
                	
                	var listOtherView = "";
                	
                	result.map((other,i) => {
                		var userId = other.userId;
                		var userName = other.relationName ? other.firstStudentName + "  " + other.relationName : other.userName;
                		
            
                		listOtherView += `<ul id='getOtherMessage' class='list-unstyled mb-0' onclick="getOtherMessage('`+userId+`','`+userName+`')">
                		<li class='p-2 border-bottom' data-id=`+userId+`>
                            	<a class="d-flex justify-content-between">
                                    <div class="d-flex flex-row">
                                        <div class="pt-1">
                                            <p class="fw-bold mb-0">`+userName+`</p>
                                            <p class="small text-muted">최근메시지</p>
                                        </div>
                                    </div>
                            	</a>
                        	</li>
                    	</ul>`;
                	});
                	
                	$('#getOtherMessage').remove();
                	$('#listOther').append(listOtherView);

                } else {
                    console.log("실패");
                }
            } 
        })
	})
	


})	
</script>



<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript">
		
	// 수업추가 참고하기
		//============= 회원정보수정 Event  처리 =============	
	
	
		 $( function() {
				$("button:contains('회원정보수정')").on("click" , function() {
					self.location="/user/updateUser?userId=${user.userId}"
				});
			});

	//학생 아이디 유효성 검사
			const checkStudent = _.debounce(async (id) => {
		    	
		    	var id = $("#firstStudentId").val();
		    	
		    	$.ajax({
		    		url:'/user/rest/checkStudent',
		    		type : "post",
		    		data:{id},
		    		success : function(cnt) {
		    			if(cnt == 1) {
		    				$('#certCheck2').text("확인이 완료되었습니다.");
		    				$('#certCheck2').css('color','blue');	
		    				
		    			}
		    			else {
		    				$('#certCheck2').text("확인되지 않은 정보입니다.");
		    				$('#certCheck2').css('color','red');
		    				
		    			}
		    		}
		    	});
		    },2000);
			
		// 자녀 추가 이벤트
		$(function(){
			$("input[name=addStudentBtn]").click(function(){
				if ($(this).val()=="자녀추가"){
					$("#addStudentInput").show();
				}
		});
		
	});
		
		// 탈퇴
		
		function quit(){
			location.href = "/user/quit";
		}
		
		function getStudentInfo(studentId){
			console.log("치ㅑ차");
			
			
			$.ajax({
				url : "/user/rest/getUser/"+studentId,
				type : "GET",
				headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json",                                    
	        	},
	        	success : function(result) {
	        		if(result) {
	        			console.log(result);
	        			
	        			
	        		} else {
	        			console.log("정보 없음");
	        		}
	        	}
			})
			
			
		}
		

	</script>
	

</head>
<body>
<!-- ---------- 개인정보 수정 -------------->
<!-- Top app bar navigation menu-->

	<nav class="top-app-bar navbar navbar-expand navbar-dark bg-white">
		<div class="container-fluid px-4">
			<!-- Drawer toggle button-->
			<button class="btn btn-lg btn-icon order-1 order-lg-0"
				id="drawerToggle" href="javascript:void(0);">
				<i class="material-icons text-primary">menu</i>
			</button>
			<!-- Navbar brand-->
			<a class="navbar-brand me-auto" href="/index" data-url=''>
			<img class="px-0 mx-0" alt="" src="/resources/img/logo.png" style="height:45px;">
			</a>
			<!-- Navbar items-->
			<div class="d-flex align-items-center mx-3 me-lg-0">
				<!-- Navbar buttons-->
				<div class="d-flex">
					<!-- Messages dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuMessages" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons text-primary">mail_outline</i>
						</button>
					</div>				
					<!-- Notifications and alerts dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuNotifications" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="material-icons text-primary position-relative">notifications</i> 
							<span id="alertCntBadge" class="position-absolute translate-middle badge rounded-pill bg-danger align-middle text-center" style="top:30%; left:63%; font-size:0.5rem;"></span>
						</button>
						<ul id="alertDropDown"
							class="dropdown-menu dropdown-menu-end me-3 mt-3 py-0 overflow-hidden"
							aria-labelledby="dropdownMenuNotifications">
						</ul>
					</div>
					
					
					<!-- User profile dropdown-->
					<div class="dropdown">
						<button class="btn btn-lg btn-icon dropdown-toggle"
							id="dropdownMenuProfile" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons text-primary">person</i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end mt-3"
							aria-labelledby="dropdownMenuProfile">
							<li><a class="dropdown-item" href="/user/getUser?userId="${userId} data-url='/user/getUser'> <i
									class="material-icons leading-icon text-primary">person</i>
									<div class="me-3">Profile</div>
							</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="/user/logout" > <i
									class="material-icons leading-icon text-primary">logout</i>
									<div class="me-3">Logout</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">회원정보조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>비밀번호</strong></div>
			<div class="col-xs-8 col-md-4"></div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.phone ? user.phone : ''}	</div>
		</div>
		
		<hr/>
		
		<c:if test="${user.role eq 'student'}">
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>학교</strong></div>
			<div class="col-xs-8 col-md-4">${user.school}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>학년</strong></div>
			<div class="col-xs-8 col-md-4">${user.grade}</div>
		</div>
		
		</c:if>
		
		
		<c:if test="${user.role eq 'parent'}">


			<input type="button" name="addStudentBtn" class="btn btn-primary" value="자녀추가" onclick='addStudentBtn()' />
			
			
			<div></div>
			<form action="/user/addRelation" method="POST" enctype="multipart/form-data">		
			<div id="addStudentInput" style="display :none">
			
			<input type="hidden" name="userId" value="${user.userId}">
			
			
			<input type="text" id="firstStudentId" name="firstStudentId" placeholder="자녀 아이디" oninput="checkStudent()" />
			<div class="form-group" id="certCheck2"></div>
			<input type="text" id="relationName" name="relationName" placeholder="학생과의 관계" />
			<input type="submit" value="등록" />
			<input type="reset" value="취소" />
			</div>
			</form>

			<hr/>
			
			<c:forEach var="studentsInfo" items="${studentsInfo}" varStatus="status">
  		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 아이디</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.userId}</div>
		</div>
  
  
  
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 이름</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.userName}</div>
		</div>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 학교</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.school}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>자녀 학년</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.grade}</div>
		</div>
	
	<c:forEach var="students" items="${students}">
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>학생과의 관계</strong></div>
			<div class="col-xs-8 col-md-4">${students.relationName}</div>
		</div>
	</c:forEach>	
		
	
		 </c:forEach>
		</c:if>
		

		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">회원정보수정</button>
	  			<button type="button" class="btn btn-primary" onclick="quit()">탈퇴</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	        
<!-- Footer-->
	<footer>
		<button type="button" id="open-messagePopup" class="btn float btn-lg btn-icon"><i class="material-icons">mail_outline</i></button>
	</footer>

	  <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

	<script src="/resources/javascript/students/studentsUI.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="/resources/javascript/common/charts/chart-defaults.js"></script> -->
	<script src="/resources/javascript/common/prism.js"></script>
	<script src="/resources/javascript/common/material.js"></script>
	<script src="/resources/javascript/common/scripts.js"></script>
	<script src="https://kit.fontawesome.com/57ea3feb1d.js" crossorigin="anonymous"></script>
<!-- 	<script src="/resources/javascript/common/charts/demos/dashboard-chart-area-light-demo.js"></script> -->
	<script type="text/javascript">
	</script>
</body>
</html>