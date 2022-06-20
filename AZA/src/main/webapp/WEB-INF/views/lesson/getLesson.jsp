<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>수업상세내용</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<!-- Load Material Icons from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />


<script type="text/javascript">
		$(function(){
			$("td.ct_btn01:contains('수정')").on("click",function(){
				self.location="/lesson/updateLessonView?lessonCode=${lesson.lessonCode}"
			});
		});	
		
		function fncdeleteLesson(){
			var lessonCode = $("input[name='lessonCode']").val();
			if(lessonCode != "${lesson.lessonCode}"){
				alert("수업코드가 일치하지 않습니다..");
				return;
			}
			$("form").attr("method","GET").attr("action","/lesson/deleteLesson").submit();
		}
		
		$(function(){
			$("button.ct_btn02").on("click",function(){
				fncdeleteLesson();
			});
		});
		
</script><script type="text/javascript">

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
<body class="nav-fixed">
<!-- <nav class="top-app-bar navbar navbar-expand navbar-dark bg-dark">
            <div class="container-fluid px-4">
                Drawer toggle button
                <button class="btn btn-lg btn-icon order-1 order-lg-0" id="drawerToggle" href="javascript:void(0);"><i class="material-icons">menu</i></button>
                Navbar brand
                <a class="navbar-brand me-auto" href="index.html"><div class="text-uppercase font-monospace">Material Admin Pro</div></a>
                Navbar items
                <div class="d-flex align-items-center mx-3 me-lg-0">
                    Navbar
                    <ul class="navbar-nav d-none d-lg-flex">
                        <li class="nav-item"><a class="nav-link" href="index.html">Overview</a></li>
                        <li class="nav-item"><a class="nav-link" href="https://docs.startbootstrap.com/material-admin-pro" target="_blank">Documentation</a></li>
                    </ul>
                    Navbar buttons
                    <div class="d-flex">
                        Messages dropdown
                        <div class="dropdown dropdown-notifications d-none d-sm-block">
                            <button class="btn btn-lg btn-icon dropdown-toggle me-3" id="dropdownMenuMessages" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">mail_outline</i></button>
                            <ul class="dropdown-menu dropdown-menu-end me-3 mt-3 py-0 overflow-hidden" aria-labelledby="dropdownMenuMessages">
                                <li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">Messages</h6></li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item unread" href="#!">
                                        <div class="dropdown-item-content">
                                            <div class="dropdown-item-content-text"><div class="text-truncate d-inline-block" style="max-width: 18rem">Hi there, I had a question about something, is there any way you can help me out?</div></div>
                                            <div class="dropdown-item-content-subtext">Mar 12, 2021 &middot; Juan Babin</div>
                                        </div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <div class="dropdown-item-content">
                                            <div class="dropdown-item-content-text"><div class="text-truncate d-inline-block" style="max-width: 18rem">Thanks for the assistance the other day, I wanted to follow up with you just to make sure everyting is settled.</div></div>
                                            <div class="dropdown-item-content-subtext">Mar 10, 2021 &middot; Christine Hendersen</div>
                                        </div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <div class="dropdown-item-content">
                                            <div class="dropdown-item-content-text"><div class="text-truncate d-inline-block" style="max-width: 18rem">Welcome to our group! It's good to see new members and I know you will do great!</div></div>
                                            <div class="dropdown-item-content-subtext">Mar 8, 2021 &middot; Celia J. Knight</div>
                                        </div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item py-3" href="#!">
                                        <div class="d-flex align-items-center w-100 justify-content-end text-primary">
                                            <div class="fst-button small">View all</div>
                                            <i class="material-icons icon-sm ms-1">chevron_right</i>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        Notifications and alerts dropdown
                        <div class="dropdown dropdown-notifications d-none d-sm-block">
                            <button class="btn btn-lg btn-icon dropdown-toggle me-3" id="dropdownMenuNotifications" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">notifications</i></button>
                            <ul class="dropdown-menu dropdown-menu-end me-3 mt-3 py-0 overflow-hidden" aria-labelledby="dropdownMenuNotifications">
                                <li><h6 class="dropdown-header bg-primary text-white fw-500 py-3">Alerts</h6></li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item unread" href="#!">
                                        <i class="material-icons leading-icon">assessment</i>
                                        <div class="dropdown-item-content me-2">
                                            <div class="dropdown-item-content-text">Your March performance report is ready to view.</div>
                                            <div class="dropdown-item-content-subtext">Mar 12, 2021 &middot; Performance</div>
                                        </div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <i class="material-icons leading-icon">check_circle</i>
                                        <div class="dropdown-item-content me-2">
                                            <div class="dropdown-item-content-text">Tracking codes successfully updated.</div>
                                            <div class="dropdown-item-content-subtext">Mar 12, 2021 &middot; Coverage</div>
                                        </div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <i class="material-icons leading-icon">warning</i>
                                        <div class="dropdown-item-content me-2">
                                            <div class="dropdown-item-content-text">Tracking codes have changed and require manual action.</div>
                                            <div class="dropdown-item-content-subtext">Mar 8, 2021 &middot; Coverage</div>
                                        </div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider my-0" /></li>
                                <li>
                                    <a class="dropdown-item py-3" href="#!">
                                        <div class="d-flex align-items-center w-100 justify-content-end text-primary">
                                            <div class="fst-button small">View all</div>
                                            <i class="material-icons icon-sm ms-1">chevron_right</i>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        User profile dropdown
                        <div class="dropdown">
                            <button class="btn btn-lg btn-icon dropdown-toggle" id="dropdownMenuProfile" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">person</i></button>
                            <ul class="dropdown-menu dropdown-menu-end mt-3" aria-labelledby="dropdownMenuProfile">
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <i class="material-icons leading-icon">person</i>
                                        <div class="me-3">Profile</div>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <i class="material-icons leading-icon">settings</i>
                                        <div class="me-3">Settings</div>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <i class="material-icons leading-icon">help</i>
                                        <div class="me-3">Help</div>
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider" /></li>
                                <li>
                                    <a class="dropdown-item" href="#!">
                                        <i class="material-icons leading-icon">logout</i>
                                        <div class="me-3">Logout</div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav> -->
		<div class="d-flex mt-10 mb-4 align-items-center">
		        <img class="me-4" src="assets/img/icons/ripples.svg" alt="..." style="height: 48px" />	
		        <h1 class="page-header mb-0">수업상세정보</h1>
		</div>
		<div class="card-body p-4">
		<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
		<div class="dataTable-top">
		
		<div class="dataTable-container">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">수업명</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">${lesson.lessonName}
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">수업요일</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonDay}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">수업시작시간</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonStartTime} / ${lesson.lessonEndTime}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">수업장소</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonPlace}</td>
			</tr>
		
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">수업시작일</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonCreateAt}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">강의명</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.subject}</td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">수업코드</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonCode}</td>
			</tr>
			
		<%-- 		<tr>
				<td width="104" class="ct_write">수납일</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.fees}</td>
			</tr> --%>
			
				<tr>
				<td width="104" class="ct_write">수업료</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.fees}</td>
			</tr>
			
				<tr>
				<td width="104" class="ct_write">커리큘럼</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonContent}</td>
			</tr>
		
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>
		</div>
				</div></div>
		</div>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<c:choose>
								<c:when test="${user.role eq 'teacher'}">
									<tr>
										<td class="ct_btn01">수정 &nbsp;&nbsp;</td>
										</tr>
										<!-- Modal -->
										<form>
										 <div class="modal fade" id="myModal" role="dialog"> 
										 <div class="modal-dialog">
										
										 <!-- Modal content-->
										<div class="modal-content">
										 <div class="modal-header">
										 <h4 class="modal-title" align="center">수업코드를 입력해주세요</h4> 
										 </div>
										 <div class="modal-body" align="center">
													<div class="form-group">
											         <label for="lessonCode" class="col-sm-2 control-label">수업코드</label>
											         <div class="col-sm-10">
											           <input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="수업코드">
											         </div>
											       </div>
										</div>
										 <div class="modal-footer">
										 <button type="button" class="ct_btn02" id="ct_btn02">삭제</button>
												  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
										</div>
										</div>
										</div>
										</form>
										
										<br/><br/>
										&nbsp;&nbsp;<button type="button" data-toggle="modal" data-target="#myModal">삭제</button>
										
								</c:when>					
								<c:otherwise>
									이전						
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		


<!-- Load Bootstrap JS bundle-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- Load global scripts-->
        <script type="module" src="js/material.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Load Prism plugin scripts-->
        <script src="/js/prism.js"></script>
</body>
</html>