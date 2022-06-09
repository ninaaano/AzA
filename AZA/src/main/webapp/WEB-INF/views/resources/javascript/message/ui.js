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
	messagePopup.addClass("show");
}

function getMessageHandler() {
	otherListContainer.removeClass("hidden");
	getMessageContainer.addClass("hidden");
}

function otherListHandler() {	
	getMessageContainer.removeClass("hidden");
	otherListContainer.addClass("hidden");
}

$(document).mouseup(function (e){
	if(messagePopup.has(e.target).length === 0){
		messagePopup.removeClass("show");
	}
});
