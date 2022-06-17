<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Aza : main</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script defer src="https://kit.fontawesome.com/57ea3feb1d.js" crossorigin="anonymous"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
<script defer src="/resources/javascript/alert/alertUI.js"></script>

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
				 url: "http://localhost:8080/lesson/rest/checkLessonCode/"+lessonCode,
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



</head>

<body class="nav-fixed bg-light">
<div class="nav-fixed bg-light">
	<!-- Top app bar navigation menu-->
	<nav class="top-app-bar navbar navbar-expand navbar-dark bg-dark">
		<div class="container-fluid px-4">
			<!-- Drawer toggle button-->
			<button class="btn btn-lg btn-icon order-1 order-lg-0"
				id="drawerToggle" href="javascript:void(0);">
				<i class="material-icons">menu</i>
			</button>
			<!-- Navbar brand-->
			<a class="navbar-brand me-auto" href="/index">
			<div class="text-uppercase">AZA : 학생관리프로그램</div></a>
			<!-- Navbar items-->
			<div class="d-flex align-items-center mx-3 me-lg-0">
				<!-- Navbar buttons-->
				<div class="d-flex">
					<!-- Messages dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuMessages" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons">mail_outline</i>
						</button>
					</div>				
					<!-- Notifications and alerts dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuNotifications" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="material-icons">notifications</i>
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
							<i class="material-icons">person</i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end mt-3"
							aria-labelledby="dropdownMenuProfile">
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">person</i>
									<div class="me-3">Profile</div>
							</a></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">settings</i>
									<div class="me-3">Settings</div>
							</a></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">help</i>
									<div class="me-3">Help</div>
							</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!"> <i
									class="material-icons leading-icon">logout</i>
									<div class="me-3">Logout</div>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Layout wrapper-->
	<div id="layoutDrawer">
		<!-- Layout navigation-->
		<div id="layoutDrawer_nav">
			<!-- Drawer navigation-->
			<nav class="drawer accordion drawer-light bg-white"
				id="drawerAccordion">
				<div class="drawer-menu">
					<div class="nav">
						<!-- Drawer section heading (Account)-->
						<div class="drawer-menu-heading d-sm-none">Account</div>
						<!-- Drawer link (Notifications)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons">notifications</i>
							</div> Notifications
						</a>
						<!-- Drawer link (Messages)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons">mail</i>
							</div> Messages
						</a>
						<!-- Divider-->
						<div class="drawer-menu-divider d-sm-none"></div>
						<!-- Drawer section heading (Interface)-->
						<div class="drawer-menu-heading">Interface</div>
						<!-- Drawer link (Overview)-->
						<a class="nav-link" href="index.html">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> 수업관리
						</a>
						<a class="nav-link" href="/students/listStudentsRecord">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> 전체학생목록
						</a>
						<a class="nav-link" href="/students/listStudentsRecord">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> 학생관리
						</a>
						<a class="nav-link" href="/students/listStudentsRecord">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> 클라우드
						</a>
						<a class="nav-link" href="/students/listStudentsRecord">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> 수납
						</a>
						<a class="nav-link" href="/students/listStudentsRecord">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> Q&A
						</a>
						<a class="nav-link" href="/students/listStudentsRecord">
							<div class="nav-link-icon">
								<i class="material-icons">language</i>
							</div> 교재
						</a>

						<!-- Drawer link (Dashboards)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseDashboards"
							aria-expanded="false" aria-controls="collapseDashboards">
							<div class="nav-link-icon">
								<i class="material-icons">dashboard</i>
							</div> 자녀관리
							<div class="drawer-collapse-arrow">
								<i class="material-icons">expand_more</i>
							</div>
						</a>
						<!-- Nested drawer nav (Dashboards)-->
						<div class="collapse" id="collapseDashboards"
							aria-labelledby="headingOne" data-bs-parent="#drawerAccordion">
							<nav class="drawer-menu-nested nav">
								<a class="nav-link" href="app-dashboard-default.html">수업목록</a>
								<a class="nav-link" href="/students/listStudentsAttendance">출석</a>
								<a class="nav-link" href="app-dashboard-analytics.html">성적</a>
								<a class="nav-link" href="app-dashboard-accounting.html">쪽지시험</a>
								<a class="nav-link" href="app-dashboard-orders.html">교재</a>
								<a class="nav-link" href="app-dashboard-projects.html">홈</a>
							</nav>
						</div>
						<!-- Drawer link (Layouts)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
							aria-expanded="false" aria-controls="collapseLayouts">
							<div class="nav-link-icon">
								<i class="material-icons">view_compact</i>
							</div> Layouts
							<div class="drawer-collapse-arrow">
								<i class="material-icons">expand_more</i>
							</div>
						</a>
						<!-- Nested drawer nav (Layouts)-->
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#drawerAccordion">
							<nav class="drawer-menu-nested nav">
								<a class="nav-link" href="layout-dark.html">Dark Theme</a> <a
									class="nav-link" href="layout-light.html">Light Theme</a> <a
									class="nav-link" href="layout-static.html">Static
									Navigation</a>
							</nav>
						</div>
						<!-- Drawer link (Pages)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapsePages"
							aria-expanded="false" aria-controls="collapsePages">
							<div class="nav-link-icon">
								<i class="material-icons">layers</i>
							</div> Pages
							<div class="drawer-collapse-arrow">
								<i class="material-icons">expand_more</i>
							</div>
						</a>
						<!-- Nested drawer nav (Pages)-->
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#drawerAccordion">
							<nav class="drawer-menu-nested nav accordion"
								id="drawerAccordionPages">
								<!-- Drawer link (Pages -> Account)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAccount" aria-expanded="false"
									aria-controls="pagesCollapseAccount"> Account
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Account)-->
								<div class="collapse" id="pagesCollapseAccount"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="app-account-billing.html">Billing</a>
										<a class="nav-link" href="app-account-notifications.html">Notifications</a>
										<a class="nav-link" href="app-account-profile.html">Profile</a>
										<a class="nav-link" href="app-account-security.html">Security</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Authentication)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth"
									aria-expanded="false" aria-controls="pagesCollapseAuth">
									Authentication
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Authentication)-->
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="app-auth-login-basic.html">Login
											1</a> <a class="nav-link" href="app-auth-login-styled-1.html">Login
											2</a> <a class="nav-link" href="app-auth-login-styled-2.html">Login
											3</a> <a class="nav-link" href="app-auth-register-basic.html">Register</a>
										<a class="nav-link" href="app-auth-password-basic.html">Forgot
											Password</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Blank Pages)-->
								<a class="nav-link" href="app-blank-page.html">Blank Page</a>
								<!-- Drawer link (Pages -> Error)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse" data-bs-target="#pagesCollapseError"
									aria-expanded="false" aria-controls="pagesCollapseError">
									Error
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Error)-->
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="app-error-400.html">400 Error
											Page</a> <a class="nav-link" href="app-error-401.html">401
											Error Page</a> <a class="nav-link" href="app-error-403.html">403
											Error Page</a> <a class="nav-link" href="app-error-404.html">404
											Error Page</a> <a class="nav-link" href="app-error-429.html">429
											Error Page</a> <a class="nav-link" href="app-error-500.html">500
											Error Page</a> <a class="nav-link" href="app-error-503.html">503
											Error Page</a> <a class="nav-link" href="app-error-504.html">504
											Error Page</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Pricing)-->
								<a class="nav-link" href="app-invoice.html">Invoice</a>
								<!-- Drawer link (Pages -> Knowledgebase)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseKnowledgebase"
									aria-expanded="false"
									aria-controls="pagesCollapseKnowledgebase"> Knowledgebase
									<div class="drawer-collapse-arrow">
										<i class="material-icons">expand_more</i>
									</div>
								</a>
								<!-- Nested drawer nav (Pages -> Knowledgebase)-->
								<div class="collapse" id="pagesCollapseKnowledgebase"
									aria-labelledby="headingOne"
									data-bs-parent="#drawerAccordionPages">
									<nav class="drawer-menu-nested nav">
										<a class="nav-link" href="#">Home</a>
										<a class="nav-link" href="#">Categories</a>
										<a class="nav-link" href="#">Article</a>
									</nav>
								</div>
								<!-- Drawer link (Pages -> Pricing)-->
								<a class="nav-link" href="#">Pricing</a>
							</nav>
						</div>
						<!-- Divider-->
						<div class="drawer-menu-divider"></div>
				<!-- Drawer footer        -->
				<div class="drawer-footer border-top">
					<div class="d-flex justify-content-center">
					<!-- 수업 추가 버튼 -->
						<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#addStudentsRecord">수업 추가<i class="trailing-icon material-icons">launch</i></button>
					</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
</div>
	<!-- Layout content-->
	<div id="layoutDrawer_content">
	
		<!-- Main page content-->
		<main class="mt-12">
			<header class="main-header">
				<!-- page header -->
				<div class="row justify-content-center gx-5">
                      <div class="col-md-8 col-lg-6">
                          <div class="text-center py-10">
                              <!-- Example brand image (inline SVG image)-->
                              
                          </div>
                      </div>
                  </div>
				<!-- 수업 추가 Modal-->
				<div class="modal fade" id="addStudentsRecord" tabindex="-1" aria-labelledby="addStudentsRecordLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="addStudentsRecordLabel">수업 코드 등록</h5>
				                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" onclick="resetForm()"></button>
				            </div>
				            <div class="modal-body">
				             <c:url var="add_record" value="/students/listStudentsRecord"/>
					            <form name="addStudentsRecordForm" action="${add_record}">
						          <div class="form-group">
						            <label for="lessonCode" class="col-form-label">수업 코드:</label>
						            <input type="text" class="form-control" id="recipient-name" name="lessonCode"/>
						          </div>
						          <div class="form-group">
						            <label for="lessonStartDate" class="col-form-label">수업 등록일:</label>
						            <input type="text" class="form-control" id="lessonStartDate" name="lessonStartDate"/>
						          </div>
						          <div class="form-group">
						            <label for="fees" class="col-form-label">수업료:</label>
						            <input type="text" class="form-control" id="fees" name="fees"/>
						          </div>
						          <div class="form-group">
						            <label for="payDueDate" class="col-form-label">수업료 납입일:</label>
						            <input type="text" class="form-control" id="payDueDate" name="payDueDate"/>
						          </div>
						          <p class="lessonCheck text-danger hidden">잘못된 수업코드입니다(ToT)/></p>
						          <p class="valCheck text-danger hidden">바른 정보를 입력해주세요(⊙x⊙;)</p>
						          <div class="d-flex justify-content-end">
					              	<button class="btn btn-text-primary " type="submit" id="addStudentsRecordBtn">등록</button>
					              </div>
					        </form>
				            </div>
				        </div>
				    </div>
				</div>
			</header>
			<div class="container-xl px-5">
			
			
			<iframe id="mainFrame"></iframe>
			
			
			</div>
		    <div class="messagePopup hidden" id="messagePopup">
            <section style="background-color: #eee;">
                
                <!-- list -->
                <div id="otherListContainer" class="container py-5">          
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-6">         
                        <div class="card" id="chat2">
                            <div class="card-header d-flex justify-content-between align-items-center p-3">
                                <div>
                                    <h5 class="mb-0">상대목록</h5>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text" id="basic-addon1">@</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                  </div>
                                <button id="getMessageBtn" type="button" class="btn btn-primary btn-sm" data-mdb-ripple-color="dark">임시 getMessageContainer</button>
                            </div>

                            <div id="listOther" class="card-body scroll" style="height: 500px;">

                                 
                            </div>
                        </div>
                    </div>
                </div>
                </div>

               <!--  message -->
                <div id="getMessageContainer" class="container py-5 hidden">          
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-6">         
                        <div class="card py-10" id="chat2">
                            <div class="card-header d-flex justify-content-between align-items-center p-3">
                                <div id="otherInfo">
                                    <h5 class="mb-0">otherName</h5>
                                    <h6 class="mb-0">otherDetail</h6>
                                </div>
                                <button id="otherListBtn" type="button" class="btn btn-primary btn-sm" data-mdb-ripple-color="dark">목록</button>
                            </div>
                            
                            <div id="messages" class="card-body scroll" style="position: relative; height: 400px">
                                
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                        
                            <form id="msgForm">
                                <div class="d-flex justify-content-around">
                                <input type="text" id="messageContent"  class="form-control form-control-lg" placeholder="메시지 입력">
                                <button id="sendBtn" class="btn btn-primary"><i class="fas fa-paper-plane"></i></button>   
                            </div>     
                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </div>
		</main>
	<!-- Footer-->
	<footer>
		<button type="button" id="open-messagePopup" class="btn float btn-lg btn-icon"><i class="material-icons">mail_outline</i></button>
		<%-- <jsp:include page="/WEB-INF/views/common/home.jsp" /> --%>
	</footer>
	</div>
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
 	// <![CDATA[  <-- For SVG support
/*   	if ('WebSocket' in window) {
		(function () {
			function refreshCSS() {
				var sheets = [].slice.call(document.getElementsByTagName("link"));
				var head = document.getElementsByTagName("head")[0];
				for (var i = 0; i < sheets.length; ++i) {
					var elem = sheets[i];
					var parent = elem.parentElement || head;
					parent.removeChild(elem);
					var rel = elem.rel;
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
					}
					parent.appendChild(elem);
				}
			}
			var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
			var address = protocol + window.location.host + window.location.pathname + '/ws';
			var socket = new WebSocket(address);
			socket.onmessage = function (msg) {
				if (msg.data == 'reload') window.location.reload();
				else if (msg.data == 'refreshcss') refreshCSS();
			};
			if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
				console.log('Live reload enabled.');
				sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
			}
		})();
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}   */
	// ]]>
</script>
</body>
</html>