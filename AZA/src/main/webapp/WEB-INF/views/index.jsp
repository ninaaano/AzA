<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Aza : main</title>       
<<<<<<< HEAD
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script defer src="http://localhost:3000/socket.io/socket.io.js"></script>
        <script defer src="/resources/javascript/message/client.js"></script>
        <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
        <script type="text/javascript">

            $(function() {   
                               
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
                        		//console.log(i, studentId);
                        		
                        		listOtherView += `<ul id='getOtherMessage' class='list-unstyled mb-0' onclick="getOtherMessage('`+userId+`')">                                    <li class='p-2 border-bottom' data-id=`+userId+`>
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
                        	
                        	$('ul').remove();
                        	$('#listOther').append(listOtherView);

                        } else {
                            console.log("실패");
                        }
                    } 
                })
            }); 


=======
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/resources/javascript/message/test.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
<!--     <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="/resources/css/message.css" rel="stylesheet">
    <!-- <script src="/webjars/jquery/jquery.min.js"></script> -->
        
        
        
        <script type="text/javascript">

          $(function() {   
                               
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
                        		//console.log(i, studentId);
                        		
                        		listOtherView += `<ul id='getOtherMessage' class='list-unstyled mb-0' onclick="getOtherMessage('`+userId+`')">                                    <li class='p-2 border-bottom' data-id=`+userId+`>
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
                        	
                        	$('ul').remove();
                        	$('#listOther').append(listOtherView);

                        } else {
                            console.log("실패");
                        }
                    } 
                })
            }); 
>>>>>>> refs/heads/HM


        </script>



        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/message.css"/>
        <style>
            body { margin: 0; padding-bottom: 3rem; font-family: 'Varela Round', sans-serif; }
            
            /* #msgForm { background: rgba(0, 0, 0, 0.15); padding: 0.25rem; position: fixed; bottom: 0; left: 0; right: 0; display: flex; height: 3rem; box-sizing: border-box; backdrop-filter: blur(10px); } */
            #input { border: none; padding: 0 1rem; flex-grow: 1; border-radius: 2rem; margin: 0.25rem; }
            #input:focus { outline: none; }
            /* #msgForm > button { background: #333; border: none; padding: 0 1rem; margin: 0.25rem; border-radius: 3px; outline: none; color: #fff; } */
            
            #messages { list-style-type: none; margin: 0; padding: 0; }
            #messages > div { padding: 0.5rem 1rem; }
            /* #messages > div:nth-child(odd) { background: #efefef; } */
            </style>
</head>
<body>
    <div class="main">
        <h2>메인페이지</h2>
        <h3 class="">임시 채팅 모달 -> get만 진행</h3>
        <button class="open-messagePopup" id="open-messagePopup" >Chat</button>
        
<<<<<<< HEAD
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

                            


                          
                            
                            <div id="listOther" class="card-body scroll" style="position: relative; height: 400px">
                               <!-- <ul class="list-unstyled mb-0">
                                    <li class="p-2 border-bottom">
                                        <a href="#!" class="d-flex justify-content-between">
                                            <div class="d-flex flex-row">
                                                <div class="pt-1">
                                                    <p class="fw-bold mb-0">상대방이름</p>
                                                    <p class="small text-muted">최근메시지</p>
                                                </div>
                                            </div>
                                            <div class="pt-1">
                                                <p class="small text-muted mb-1">시간</p>
                                                <span class="badge bg-danger rounded-pill float-end">몇개</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>  -->
                                 
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <form id="">
                                <div class="d-flex justify-content-around"> 
                                </div>     
                            </form>
                        </div>
                    </div>
                </div>
                </div>

                <!-- message -->
=======
        <h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
<div id="main-content" class="container">
    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect">WebSocket connection:</label>
                    <button id="connect" class="btn btn-default" type="submit">Connect</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">Disconnect
                    </button>
                </div>
            </form>
        </div>
         <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="name">What is your name?</label>
                    <input type="text" id="name" class="form-control" placeholder="Your name here...">
                </div>
                <button id="send" class="btn btn-default" type="submit">Send</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>Greetings</th>
                </tr>
                </thead>
                <tbody id="greetings">
                </tbody>
            </table>
        </div>
    </div>
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

                            


                          
                            
                            <div id="listOther" class="card-body scroll" style="position: relative; height: 400px">
                               <ul class="list-unstyled mb-0">
                                    <li class="p-2 border-bottom">
                                        <a href="#!" class="d-flex justify-content-between">
                                            <div class="d-flex flex-row">
                                                <div class="pt-1">
                                                    <p class="fw-bold mb-0">상대방이름</p>
                                                    <p class="small text-muted">최근메시지</p>
                                                </div>
                                            </div>
                                            <div class="pt-1">
                                                <p class="small text-muted mb-1">시간</p>
                                                <span class="badge bg-danger rounded-pill float-end">몇개</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul> 
                                 
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <form id="">
                                <div class="d-flex justify-content-around"> 
                                </div>     
                            </form>
                        </div>
                    </div>
                </div>
                </div>

               <!--  message -->
>>>>>>> refs/heads/HM
                <div id="getMessageContainer" class="container py-5 hidden">          
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-6">         
                        <div class="card" id="chat2">
                            <div class="card-header d-flex justify-content-between align-items-center p-3">
                                <div>
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
                                <input type="text" id="input" name="messageContent"  class="form-control form-control-lg" placeholder="메시지 입력">
                                <button class="btn btn-outline-primary"><i class="fas fa-paper-plane"></i></button>   
                            </div>     
                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </div>
    </div>
           










<script src="/resources/javascript/message/asserts/ui.js"></script>
</body>
</html>