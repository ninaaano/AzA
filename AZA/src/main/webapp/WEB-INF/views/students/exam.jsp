<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script>
	  <script defer src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<!-- Load Simple DataTables Stylesheet-->

<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet">
<!-- Load main stylesheet-->



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.js"></script>

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




</script>



</head>

<body class="nav-fixed bg-light">
	<!-- Layout content-->
	 <!-- Layout content-->
            <div id="layoutDrawer_content">
                <!-- Main page content-->
                <main>
                <header class="mb-5"> 
                    </header>
                    
                    
                    
                    <div class="container-xl px-5">
                        <div class="row gx-5">
                            <div class="col-lg-8 mb-5">
                                <div class="card card-raised h-100 overflow-hidden">
                                    <div class="card-header bg-white p-0">
                                        <mwc-tab-bar>
                                        	<c:forEach var="subject" items="${subjectList}">
                                            <mwc-tab label="${subject}" icon="" stacked onclick='setMyLineChart("${subject}")'></mwc-tab>
                                        	</c:forEach>
                                        </mwc-tab-bar>
                                    </div>
                                    <div class="card-body pt-4">
                                    	<canvas id="dashboardAreaChart" width="100%" height="40"></canvas>
                                    </div>
                                    <!-- <div class="card-footer bg-transparent p-0">
                                        <div class="list-group list-group-flush">
                                            <div class="list-group-item ripple-gray">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="me-3">Revenue Target</div>
                                                    <div class="d-flex align-items-center">
                                                        <div class="me-2">25%</div>
                                                        <div class="progress me-2" style="width: 8rem; height: 0.25rem"><div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div></div>
                                                        <div class="d-flex align-items-center p-2 text-primary">
                                                            <div class="fst-button">Open Report</div>
                                                            <i class="material-icons icon-sm ms-1">chevron_right</i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="list-group-item ripple-gray">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="me-3">Acquisition Goal</div>
                                                    <div class="d-flex align-items-center">
                                                        <div class="me-2">100%</div>
                                                        <div class="progress me-2" style="width: 8rem; height: 0.25rem"><div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div></div>
                                                        <div class="d-flex align-items-center p-2 text-primary">
                                                            <div class="fst-button">Open Report</div>
                                                            <i class="material-icons icon-sm ms-1">chevron_right</i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-5">
                                <div class="card card-raised bg-primary h-100">
                                    <div class="card-body">
                                        <h2 id="examSubject" class="overline text-white titleFont">과목</h2>
                                        <div id="examDetailList" class="list-group list-group-flush list-group-light">
                                            <div class="list-group-item d-flex justify-content-between px-0">
                                                <div class="caption text-white-50">년도/학기</div>
                                                <div class="caption text-white-50 ms-2">점수</div>
                                            </div>

                                            
                                        </div>
                                    </div>
                                    <div class="card-footer p-0">
                                        <div class="d-flex justify-content-end ripple-white px-3 py-2">
                                            <div class="d-flex align-items-center p-2 text-white">
                                                <div id="studentsExamFormOpenBtn" class="fst-button">더 입력하기 + </div>
                                                <div id="studentsExamFormCloseBtn" class="fst-button hidden">닫기X</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <hr class="my-5" />
                    </div>
                    </div>
                </main>
	<!-- Footer-->
	<footer>
		<%-- <button type="button" id="open-messagePopup" class="btn float btn-lg btn-icon"><i class="material-icons">mail_outline</i></button>
		<jsp:include page="/WEB-INF/views/common/home.jsp" /> --%>
	</footer>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common/charts/chart-defaults.js"></script>
	<script src="/resources/javascript/common/prism.js"></script>
	<script src="/resources/javascript/common/material.js"></script>
	<script src="/resources/javascript/common/scripts.js"></script>
	<!-- Load Chart.js customized defaults-->
        <script src="/resources/javascript/common/charts/chart-defaults.js"></script>
        <!-- Load chart demos for this page-->
        <script src="/resources/javascript/common/charts/demos/exam-demo.js"></script>
	<script type="text/javascript">
</script>
</body>
</html>