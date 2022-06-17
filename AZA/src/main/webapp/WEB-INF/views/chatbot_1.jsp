<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hello WebSocket</title>
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/main.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js" integrity="sha512-ksHM9XpigYGeRdXZfI4GddPsUjmLj6zd1MCNXL4fsfDwp1G+u6hC73uwDjlpjdX4tbEtj/N1AWkLo6WjDwQkyA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    

    <script src="../js//main.js" charset="UTF-8"></script>
</head>
<style>
body {
    background-color: #f5f5f5;
}

#main-content {
    max-width: 940px;
    padding: 2em 3em;
    margin: 0 auto 20px;
    background-color: #fff;
    border: 1px solid #e5e5e5;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}
</style>
<body>
<script type="text/javascript">
	var stompClient = null;
	
	function setConnected(connected) {
	    $("#connect").prop("disabled", connected);
	    $("#disconnect").prop("disabled", !connected);
	    $("#send").prop("disabled", !connected);
	    if (connected) {
	        $("#conversation").show();
	    }
	    else {
	        $("#conversation").hide();
	    }
	    $("#msg").html("");
	}
	
	function connect() {
	    var socket = new SockJS('/ws');
	    stompClient = Stomp.over(socket);
	    stompClient.connect({}, function (frame) {
	        setConnected(true);
	        console.log('Connected: ' + frame);
	        stompClient.subscribe('/topic/public', function (message) {
	            showMessage("send message: " + message.body); 
	        });
	    });
	}
	
	function disconnect() {
	    if (stompClient !== null) {
	        stompClient.disconnect();
	    }
	    setConnected(false);
	    console.log("Disconnected");
	}
	
	function sendMessage() {
	    let message = $("#msg").val()
	    showMessage("send message: " + message);
	
	    stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); 
	}
	
	function showMessage(message) {
	    $("#communicate").append("<tr><td>" + message + "</td></tr>");
	}
	
	$(function () {
	    $("form").on('submit', function (e) {
	        e.preventDefault();
	    });
	    $( "#connect" ).click(function() { connect(); });
	    $( "#disconnect" ).click(function() { disconnect(); });
	    $( "#send" ).click(function() { sendMessage(); });
	});l
</script>
<noscript><h2 stye="color: #ff0000">Seems your browser doesn't support Javascript! Websocket relies on Javascript being
    enabled. Please enable
    Javascript and reload this page!</h2></noscript>
    
<div id="main-content" class="container">
    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect">websocket connect:</label>
                    <button id="connect" class="btn btn-default" type="submit">connect</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">cancel
                    </button>
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="msg">phone</label>
                    <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요....">
                </div>
                <button id="send" class="btn btn-default" disabled type="submit">send</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>message</th>
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

<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/main.js"></script>
</head>
<body>

</body>
</html> -->