var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    $("#send").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
        $("#gold_sleep").addClass("hidden");
        $("#gold_basic").removeClass("hidden");
    }
    else {
        $("#conversation").hide();
        $("#gold_basic").addClass("hidden");
        $("#gold_sleep").removeClass("hidden");
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
	
			var div = `<div class="message">
		            		<p class="text">${message.body}</p>
		          		</div>`;
            showMessage(div); //서버에 메시지 전달 후 리턴받는 메시지
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
    let message = $("#msg").val();
    var div = `<div class="message text-only">
					<div class="response">
	  					<p class="text">${message}</p>
		            </div>
				</div>`;
    showMessage(div);

    stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); //서버에 보낼 메시지
	$("#msg").val("");
}

function showMessage(messageContent) {
    $("#messages-chat").append(messageContent);
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { 
		sendMessage(); 
		$("#msg").val("");
	});
	$("#msg").on("keyup", function(e) {
		if(e.keyCode == '13') {
			sendMessage(); 
			$("#msg").val("");
		}
	});
});


