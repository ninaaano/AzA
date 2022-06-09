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
	console.log("눌림");
}

function getMessageHandler() {
	//console.log(e.target.dataset.id)
	otherListContainer.removeClass("hidden");
	getMessageContainer.addClass("hidden");
}

function otherListHandler() {	
	//console.log(et.dataset.id);
	getMessageContainer.removeClass("hidden");
	otherListContainer.addClass("hidden");
}

function getOtherMessage(id) {	
	otherListHandler();

	
}

$(document).mouseup(function (e){
	if(messagePopup.has(e.target).length === 0){
		messagePopup.removeClass("show");
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
	console.log("connect11");
	
    var socket = new SockJS('/gs-guide-websocket');
    console.log(socket);
    stompClient = Stomp.over(socket);
    console.log("connect");
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/greetings', function (greeting) {
            showGreeting(JSON.parse(greeting.body).content);
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

function sendName() {
	console.log(stompClient);
	console.log("/app/hello",  JSON.stringify({'name': $("#name").val()}));
    stompClient.send("/app/hello", {}, JSON.stringify({'name': $("#name").val()}));
}

function showGreeting(message) {
    $("#greetings").append("<tr><td>" + message + "</td></tr>");
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendName(); });
});
