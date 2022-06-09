package com.aza.service.domain;

public class Message {

	private String receiverId;
	private String senderId;
	private String messageContent;
	private String messageCreateAt;
	private String messageReadAt;
	
	
	
	public Message() {
	}


	public Message(String receiverId, String senderId, String messageContent, String messageCreateAt) {
		super();
		this.receiverId = receiverId;
		this.senderId = senderId;
		this.messageContent = messageContent;
		this.messageCreateAt = messageCreateAt;
	}
	
	
	
	
	public Message(String receiverId, String senderId, String messageContent, String messageCreateAt,
			String messageReadAt) {
		super();
		this.receiverId = receiverId;
		this.senderId = senderId;
		this.messageContent = messageContent;
		this.messageCreateAt = messageCreateAt;
		this.messageReadAt = messageReadAt;
	}


	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getMessageCreateAt() {
		return messageCreateAt;
	}
	public void setMessageCreateAt(String messageCreateAt) {
		this.messageCreateAt = messageCreateAt;
	}
	public String getMessageReadAt() {
		return messageReadAt;
	}
	public void setMessageReadAt(String messageReadAt) {
		this.messageReadAt = messageReadAt;
	}
	
	@Override
	public String toString() {
		return "Message [receiverId=" + receiverId + ", senderId=" + senderId + ", messageContent=" + messageContent
				+ ", messageCreateAt=" + messageCreateAt + ", messageReadAt=" + messageReadAt + "]";
	}

	
	
}
