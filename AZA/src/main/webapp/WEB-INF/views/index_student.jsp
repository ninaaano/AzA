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
<script defer src="/resources/javascript/common/indexUI.js"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
<script defer src="/resources/javascript/alert/alertUI.js"></script>
<script defer src="/resources/javascript/students/teacherHome.js"></script>

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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
<style>
*, body { 
font-family: Pretendard, 'Noto Sans KR';
}
</style>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/attendance.css" rel="stylesheet">
<script type="text/javascript">
</script>
</head>

<body class="nav-fixed bg-light">
<div class="nav-fixed bg-light">
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
									<!-- class="material-icons leading-icon" >logout</i> -->	<!-- 2022/06/18 MJ파트 충돌 주석처리했음 -->

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
						<div class="drawer-menu-heading d-sm-none titleFont text-primary fs-4">Account</div>
						<!-- Drawer link (Notifications)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons text-primary text-primary">notifications</i>
							</div> Notifications
						</a>
						<!-- Drawer link (Messages)-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i class="material-icons text-primary text-primary">mail</i>
							</div> Messages
						</a>
						<!-- Divider-->
						<div class="drawer-menu-divider d-sm-none"></div>
						<!-- Drawer section heading (Interface)-->
						<div class="drawer-menu-heading text-primary fw-bold titleFont fs-4">MENU</div>
						<!-- Drawer link (Overview)-->
						<a class="nav-link left_nav" href="#" data-url='/student/lesson'>
							<div class="nav-link-icon">
								<i class="material-icons text-primary">language</i>
							</div> 수업관리
						</a>
						<a class="nav-link left_nav" href="#"  data-url='/paper/listPaperHomework'>
							<div class="nav-link-icon">
								<i class="material-icons text-primary" href="#">language</i>
							</div> 과제
						</a>
						<a class="nav-link left_nav" href="#" data-url='/students/manageStudentsExam'>
							<div class="nav-link-icon">
								<i class="material-icons text-primary">language</i>
							</div> 성적
						</a>
						<a class="nav-link left_nav" href="#" data-url='/students/listStudentsNote'>
							<div class="nav-link-icon">
								<i class="material-icons text-primary">language</i>
							</div> 강의노트
						</a>
						<a class="nav-link left_nav" href="#" data-url='/payment/listPayment'>
							<div class="nav-link-icon">
								<i class="material-icons text-primary">language</i>
							</div> 수납
						</a>
						<a class="nav-link left_nav" href="#" data-url='/lesson/1'>
							<div class="nav-link-icon">

								<i class="material-icons text-primary">language</i>
							</div> Q&A
						</a>
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
	<header class="main-header" style="height:0px;">
				<!-- page header -->
					<div class="row justify-content-center gx-5">
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
							          <div class="form-group row">
							          	<div class="col-8">
								            <label for="lessonCode" class="col-form-label">수업 코드:</label>
								            <input type="text" class="form-control" id="recipient-name" name="lessonCode" required/>
										</div>
										<div class="col-4">
								            <label for="lessonStartDate" class="col-form-label">수업 시작일:</label>
								            <input type="date" class="form-control" id="lessonStartDate" name="lessonStartDate" required>
							            </div>
							          </div>
							          <div class="form-group row">
							          	<div class="col-8">
								            <label for="fees" class="col-form-label">수업료:</label>
								            <input type="text" class="form-control" id="fees" name="fees" placeholder="숫자만 입력하세요:D" required/>
							          	</div>
							          	<div class="col-4">
								            <label for="payDueDate" class="col-form-label">수업료 납입일:</label>
								            <select class="form-select" id="payDueDate" name="payDueDate" required>
		      									<option selected disabled value="">매월</option>
		      									<option value="1">1일</option>
		      									<option value="2">2일</option>
		      									<option value="3">3일</option>
		      									<option value="4">4일</option>
		      									<option value="5">5일</option>
		      									<option value="6">6일</option>
		      									<option value="7">7일</option>
		      									<option value="8">8일</option>
		      									<option value="9">9일</option>
		      									<option value="10">10일</option>
		      									<option value="11">11일</option>
		      									<option value="12">12일</option>
		      									<option value="13">13일</option>
		      									<option value="14">14일</option>
		      									<option value="15">15일</option>
		      									<option value="16">16일</option>
		      									<option value="17">17일</option>
		      									<option value="18">18일</option>
		      									<option value="19">19일</option>
		      									<option value="20">20일</option>
		      									<option value="21">21일</option>
		      									<option value="22">22일</option>
		      									<option value="23">23일</option>
		      									<option value="24">24일</option>
		      									<option value="25">25일</option>
		      									<option value="26">26일</option>
		      									<option value="27">27일</option>
		      									<option value="28">28일</option>
		      									<option value="29">29일</option>
		      									<option value="30">30일</option>
		      									<option value="31">31일</option>
	    									</select>
    									</div>
							          </div>
							          
							          <p class="valCount text-primary hidden justify-content-end align-items-center">
							          <i class="bi bi-emoji-expressionless p-1"></i>숫자만 입력하세요<i class="bi bi-emoji-expressionless p-1"></i>
							          </p>
							          <p class="lessonCheck text-primary hidden justify-content-end align-items-center">
							          <i class="bi bi-emoji-neutral p-1"></i>잘못된 수업코드입니다<i class="bi bi-emoji-neutral p-1"></i>
							          </p>
							          <div class="d-flex justify-content-end">
						              	<button class="btn btn-text-primary " type="submit" id="addStudentsRecordBtn">등록</button>
						              </div>
						        </form>
					            </div>
					        </div>
					    </div>
					</div>
				</header>
		<!-- Main page content-->
		<main class="mt-12">
			<header class="main-header">
				<!-- page header -->
				<div class="row justify-content-center gx-5">
                      <div class="row justify-content-end col-md-8 col-lg-6">
                          <div class="pt-6 pb-2 mt-3 col-6 col-sm-3">
                             
							
						    </div>
                      
                      </div>
                  </div>
			</header>
			<!-- /////////////////////////////////////////////////////////////////////////////// -->
					<iframe id="mainFrame" src="/home" style="display:block; width:100vw; height: 100vh; z-index:9999;" allowfullscreen></iframe>
			<!-- /////////////////////////////////////////////////////////////////////////////// -->
			

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
                                    <input id="messageSearchKeyword" type="text" class="form-control" placeholder="선생님 이름으로 검색" aria-label="Username" aria-describedby="basic-addon1">
                                  </div>
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