<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/b209e29beb.js"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-bson/1.1.6/bson.min.js" integrity="sha512-8+21h7jMS7dicfP+QFVJxgK/ZVQQ0bdDyK26+3hUokQxfUEwO8llARr7Ak2UYbX9eD6okB6Q5unSO1CDZKWOsw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

 <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<link href="/resources/css/message.css" rel="stylesheet">
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

<!-- Load main stylesheet-->
<link href="/resources/css/styles.css" rel="stylesheet">





<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/message.css" />
<style>
</style>
<script type="text/javascript">
$(function() {
	
	$('#dropdownMenuNotifications').on('click', function() {
		console.log("알림 버튼 눌림");
	
		$.ajax({
			url:"http://localhost:8080/alert/rest/listAlert",
			type:"GET",
			headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json",                                    
                },
            success: function(result) {
            	
            	
                if(result) {
                	console.log(result.list);
                	
            	var listAlertView = "";
                var list = result.list
                	
                	list.map(alert => {
                		
                		let alertCode = alert.alertCode;
                		let alertContent = alert.alertContent;
                		let alertCreateAt = alert.alertCreateAt;
                		let alertReadAt = alert.alertReadAt;
                		
						listAlertView += `<li><a class="dropdown-item unread" href="#!">
						<i	class="material-icons leading-icon">assessment</i>
						<input type="hidden" value="`+alertCode+`"/>
						<div class="dropdown-item-content me-2">
							<div class="dropdown-item-content-text">`+alertContent+`</div>
							<div class="dropdown-item-content-subtext">`+alertCreateAt+`</div>
						</div>
				</a></li>`;
                		
                		
                		
                		
                		
                		
                	})
                	
                	$('li').remove();
                	$("#alertDropDown").append(`<li><h6
        					class="dropdown-header bg-primary text-white fw-500 py-3">알림</h6></li>
        					<li><hr class="dropdown-divider my-0" /></li>`);
                	$("#alertDropDown").append(listAlertView);
                	
                	
                	
                	
                	
                	
                } else {
                	console.log("faile");
                }
           }
		})
	
	
	
	})
	
	
	
	
})
	





</script>



</head>
<header class="nav-fixed bg-light">
	<!-- Top app bar navigation menu-->
	<nav class="top-app-bar navbar navbar-expand navbar-dark bg-dark">
		<div class="container-fluid px-4">
			<!-- Drawer toggle button-->
			<button class="btn btn-lg btn-icon order-1 order-lg-0"
				id="drawerToggle" href="javascript:void(0);">
				<i class="material-icons">menu</i>
			</button>
			<!-- Navbar brand-->
			<a class="navbar-brand me-auto" href="index.html"><div
					class="text-uppercase font-monospace">Material Admin Pro</div></a>
			<!-- Navbar items-->
			<div class="d-flex align-items-center mx-3 me-lg-0">
				<!-- Navbar-->
				<ul class="navbar-nav d-none d-lg-flex">
					<li class="nav-item"><a class="nav-link" href="#">Overview</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://docs.startbootstrap.com/material-admin-pro"
						target="_blank">Documentation</a></li>
				</ul>
				<!-- Navbar buttons-->
				<div class="d-flex">
					<!-- Messages dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuMessages" type="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="material-icons">mail_outline</i>
						</button>
						<ul
							class="dropdown-menu dropdown-menu-end me-3 mt-3 py-0 overflow-hidden"
							aria-labelledby="dropdownMenuMessages">
							<li><h6
									class="dropdown-header bg-primary text-white fw-500 py-3">Messages</h6></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item unread" href="#!">
									<div class="dropdown-item-content">
										<div class="dropdown-item-content-text">
											<div class="text-truncate d-inline-block"
												style="max-width: 18rem">Hi there, I had a question
												about something, is there any way you can help me out?</div>
										</div>
										<div class="dropdown-item-content-subtext">Mar 12, 2021
											&middot; Juan Babin</div>
									</div>
							</a></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item" href="#!">
									<div class="dropdown-item-content">
										<div class="dropdown-item-content-text">
											<div class="text-truncate d-inline-block"
												style="max-width: 18rem">Thanks for the assistance the
												other day, I wanted to follow up with you just to make sure
												everyting is settled.</div>
										</div>
										<div class="dropdown-item-content-subtext">Mar 10, 2021
											&middot; Christine Hendersen</div>
									</div>
							</a></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item" href="#!">
									<div class="dropdown-item-content">
										<div class="dropdown-item-content-text">
											<div class="text-truncate d-inline-block"
												style="max-width: 18rem">Welcome to our group! It's
												good to see new members and I know you will do great!</div>
										</div>
										<div class="dropdown-item-content-subtext">Mar 8, 2021
											&middot; Celia J. Knight</div>
									</div>
							</a></li>
							<li><hr class="dropdown-divider my-0" /></li>
							<li><a class="dropdown-item py-3" href="#!">
									<div class="d-flex align-items-center w-100 justify-content-end text-primary">
										<div class="fst-button small">View all</div>
										<i class="material-icons icon-sm ms-1">chevron_right</i>
									</div>
							</a></li>
						</ul>
					</div>
					<!-- Notifications and alerts dropdown-->
					<div class="dropdown dropdown-notifications d-none d-sm-block">
						<button class="btn btn-lg btn-icon dropdown-toggle me-3"
							id="dropdownMenuNotifications" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="material-icons">notifications</i>
						</button>
						
						<!-- 알림  -->
						
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
							</div> Overview
						</a>
						<!-- Drawer link (Dashboards)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseDashboards"
							aria-expanded="false" aria-controls="collapseDashboards">
							<div class="nav-link-icon">
								<i class="material-icons">dashboard</i>
							</div> Dashboards
							<div class="drawer-collapse-arrow">
								<i class="material-icons">expand_more</i>
							</div>
						</a>
						<!-- Nested drawer nav (Dashboards)-->
						<div class="collapse" id="collapseDashboards"
							aria-labelledby="headingOne" data-bs-parent="#drawerAccordion">
							<nav class="drawer-menu-nested nav">
								<a class="nav-link" href="app-dashboard-default.html">Default</a>
								<a class="nav-link" href="app-dashboard-minimal.html">Minimal</a>
								<a class="nav-link" href="app-dashboard-analytics.html">Analytics</a>
								<a class="nav-link" href="app-dashboard-accounting.html">Accounting</a>
								<a class="nav-link" href="app-dashboard-orders.html">Orders</a>
								<a class="nav-link" href="app-dashboard-projects.html">Projects</a>
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
					<div class="d-flex align-items-center">
						<i class="material-icons text-muted">account_circle</i>
						<div class="ms-3">
							<div class="caption">Logged in as:</div>
							<div class="small fw-500">Start Bootstrap</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
</header>
<body class="nav-fixed bg-light">

	<!-- Layout content-->
	<div id="layoutDrawer_content">
		<!-- Main page content-->
		<main class="mt-12">
			<div class="main">
				<!-- 여기에 jsp 넣기 -->

			</div>
		</main>
	<!-- Footer-->
	<footer>
		<%-- <jsp:include page="/WEB-INF/views/common/home.jsp" /> --%>
	</footer>
	</div>
	  <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sass.js/0.9.2/sass.js"
		integrity="sha512-qN7eI/gyKBObAOLw/VOd8eDV4eR/Mp9gebkx0IqCpV5p7LYz0RCQHJahUwR+UB5W+BaphKRDz3eeqL11mGgIrQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
		integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="/resources/javascript/common/charts/chart-defaults.js"></script> -->
	<script src="/resources/javascript/common/prism.js"></script>
	<!-- <script src="/resources/javascript/common/material.js"></script> -->
	<script src="/resources/javascript/common/scripts.js"></script>
<!-- 	<script src="/resources/javascript/common/charts/demos/dashboard-chart-area-light-demo.js"></script> -->
	<script type="text/javascript">
 	// <![CDATA[  <-- For SVG support
/* /*  	if ('WebSocket' in window) {
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