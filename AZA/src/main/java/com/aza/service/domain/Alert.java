package com.aza.service.domain;

public class Alert {
	
	// field
	private int alertCode;
	private String receiverId;
	private String alertContent;
	private String alertCreateAt;
	private String alertReadAt;
	private String lessonCode;
	
	
	// ctor
	public Alert() {}


	// method :: Getter & Setter
	public int getAlertCode() {
		return alertCode;
	}


	public void setAlertCode(int alertCode) {
		this.alertCode = alertCode;
	}


	public String getReceiverId() {
		return receiverId;
	}


	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}


	public String getAlertContent() {
		return alertContent;
	}


	public void setAlertContent(String alertContent) {
		
		switch(alertContent) {		
		case "출석" :
			this.alertContent = " 학생 출석했습니다💚";
			break;				
		case "도망" :
			this.alertContent = " 학생 도망갔어요😥";
			break;
		case "조퇴" :
			this.alertContent = " 학생 조퇴했습니다🏃‍♀️";
			break;		
		default :
			this.alertContent = alertContent;
			break;
		}

	}


	public String getAlertCreateAt() {
		return alertCreateAt;
	}


	public void setAlertCreateAt(String alertCreateAt) {
		this.alertCreateAt = alertCreateAt;
	}


	public String getAlertReadAt() {
		return alertReadAt;
	}


	public void setAlertReadAt(String alertReadAt) {
		this.alertReadAt = alertReadAt;
	}


	public String getLessonCode() {
		return lessonCode;
	}


	public void setLessonCode(String lessonCode) {
		this.lessonCode = lessonCode;
	}


	@Override
	public String toString() {
		return "Alert [alertCode=" + alertCode + ", receiverId=" + receiverId + ", alertContent=" + alertContent
				+ ", alertCreateAt=" + alertCreateAt + ", alertReadAt=" + alertReadAt + ", lessonCode=" + lessonCode
				+ "]";
	}

}
