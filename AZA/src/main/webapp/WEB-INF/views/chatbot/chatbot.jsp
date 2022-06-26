<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>chatbot</title>
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>

    <script src="/resources/javascript/chatbot/app.js" charset="UTF-8"></script>
    
    
<!--     <script type="text/javascript">
    	$(function(){
    		$("#connect").bind("click",function(){
    			if($("#connect").val()==0){
    				$("#connect").val(1);
    			}
    			else{
    				$("#connect").val(0);
    			}
    			var isHide=$("#connect").val();
    			if(isHide==1){
    				$("#test").show();
    			}
    			else{
    				$("#test").hide();
    			}
    		});
    	});
    </script> -->
    
</head>
<body>
<noscript><h2 style="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
<div id="main-content" class="container">
    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect">금쪽이랑 대화하기:</label>
                    <button id="connect" class="btn btn-default" type="submit" value="0">대화버튼</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">대화종료
                    </button>
                </div>
            </form>
        </div>
        
		        <div class="col-md-6">
		            <form class="form-inline">
		                <div class="form-group">
		                    <label for="msg">메시지 입력</label>
		                    <input type="text" id="msg" class="form-control" placeholder="메시지를 입력해주세요">
		                </div>
		                <button id="send" class="btn btn-default" disabled type="submit">보내기</button>
		            </form>
		        </div>
    </div>
    
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>대화목록</th>
                </tr>
                </thead>
                <tbody id="communicate">
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>