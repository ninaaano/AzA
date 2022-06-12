<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
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


        </script>









<body>
  		<br><br><br><br>
        <h2>메인페이지</h2>
        <h3 class="">임시 채팅 모달 -> get만 진행</h3>
        <button class="open-messagePopup" id="open-messagePopup" >Chat</button>
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
            <footer class="footer" align="right">
            <h1>
           <!--  <link href="https://cdn-icons-png.flaticon.com/512/2353/2353678.png" rel="icon"  type="image/x-icon"> -->
            chatbot
            
            <%-- <jsp:forward page="chatbot/chatbot.jsp"> --%>
            </h1>
            <button onclick="location=windows.open('/chatbot/chatbot.jsp')">chatbot</button>
            </footer>
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
</body>
</html>