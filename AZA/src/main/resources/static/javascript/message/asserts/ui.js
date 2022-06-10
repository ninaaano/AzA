const messagePopupBtn = $("#open-messagePopup");
const messagePopup =  $("#messagePopup");
const otherListBtn = $("#otherListBtn");
const getMessageBtn = $("#getMessageBtn");
const otherListContainer = $("#otherListContainer");
const getMessageContainer = $("#getMessageContainer");

messagePopupBtn.on("click", popupHandler);
otherListBtn.on("click", getMessageHandler);
getMessageBtn.on("click", otherListHandler);

function popupHandler() {
	messagePopup.removeClass("hidden");
	messagePopup.addClass("show");
	connect();
}

function getMessageHandler() {
	otherListContainer.removeClass("hidden");
	getMessageContainer.addClass("hidden");
}

function otherListHandler() {	
	getMessageContainer.removeClass("hidden");
	otherListContainer.addClass("hidden");
}

function getOtherMessage(otherId) {	
	console.log(otherId);
	otherListHandler();
	getMessage(sessionStorage.userId , otherId);
}

$(document).mouseup(function (e){
	if(messagePopup.has(e.target).length === 0){
		messagePopup.removeClass("show");
		messagePopup.addClass("hidden");
		disconnect();
	}
});

var stompClient =""

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#greetings").html("");
}

function connect() {
    var socket = new SockJS('/gs-guide-websocket');
    console.log(socket);
    stompClient = Stomp.over(socket);
    console.log("connect");
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/getMessage', function (messages) {
            var list = JSON.parse(messages.body);
            let userId = sessionStorage.userId;          
            $('.messageList').remove();
            list.map(message => {
				showMessages(userId,message);
			});
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("연결 끝 : Disconnected");
}

function sendName() {
	console.log(stompClient);
	console.log("/app/hello",  JSON.stringify({'name': $("#name").val()}));
    stompClient.send("/app/hello", {}, JSON.stringify({'name': $("#name").val()}));
}

// getMessage
function getMessage(userId,otherId) {
	console.log(stompClient);
	console.log("/app/getMessage/userId/otherId");
	stompClient.send(`/app/getMessage/${userId}/${otherId}`,{}, JSON.stringify({'userId':userId, 'otherId': otherId }));
}

function addMessage() {
	console.log(stompClient);
	console.log("/app/addMessage");
	stompClient.send("/app/addMessage", {}, JSON.stringify({'senderId': sessionStorage.userId,
															'receiverId': $("#otherName").val(),
															'messageContent': $("#messageContent").val(),
															'messageCreateAt': new Date(),	
	
	}));
}




function showGreeting(message) {
    $("#greetings").append("<tr><td>" + message + "</td></tr>");
}

function showMessages(userId, message) {
	let msgHtml = '';
	
	if (userId == message.senderId) {
		msgHtml = `<ul class='messageList'>
		<div class="pt-1 pb-1 d-flex flex-row justify-content-end">
        <div class="messageContent" name="${message._id}">
            <div>
	            <p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">${message.messageContent}</p>
	            <button class="deleteBtn" class="btn btn-outline-danger" onclick="return deleteBtnHandler(this)" data-id="${message._id}"><i class="fa-solid fa-trash"></i></button>
            </div>
                <p class="small me-3 mb-1 rounded-3 text-muted d-flex justify-content-end">${message.messageCreateAt}</p>
        </div>
        </div></ul>`;
	} else {
		msgHtml = `<ul><div class="pt-1 pb-1 d-flex flex-row justify-content-start">
        <span class="messageContent" name="${message._id}">
        <p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">${message.messageContent}</p>
        <p class="small text-muted mb-1">${message.messageCreateAt}</p>
        </span>
        </div></ul>`;
	}	
    $("#messages").html(msgHtml);
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendName(); });
});
