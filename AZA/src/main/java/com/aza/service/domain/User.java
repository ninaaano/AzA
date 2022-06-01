package com.aza.service.domain;

public class User {
	
	private String userId;
	private String role;
	private String userName;
	private String phone;
	private String school;
	private char grade;
	private String birth;
	private String parentPhone;
	private String password;
	private int stopAlertStartTime; // 알림금지 시작시간
	private int stopAlertEndTime; // 알림금지 종료시간
	private char alertState; // 알림상태
	private String firstStudentId; // 첫번째 자녀 - 학부모용
	private int relationCode; // 관계번호 - 학부모용
	private String relationName; // 자녀관계 - 학부모
	
	
	public User() {
			
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getParentPhone() {
		return parentPhone;
	}

	public void setParentPhone(String parentPhone) {
		this.parentPhone = parentPhone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStopAlertStartTime() {
		return stopAlertStartTime;
	}

	public void setStopAlertStartTime(int stopAlertStartTime) {
		this.stopAlertStartTime = stopAlertStartTime;
	}

	public int getStopAlertEndTime() {
		return stopAlertEndTime;
	}

	public void setStopAlertEndTime(int stopAlertEndTime) {
		this.stopAlertEndTime = stopAlertEndTime;
	}

	public char getAlertState() {
		return alertState;
	}

	public void setAlertState(char alertState) {
		this.alertState = alertState;
	}
	

	public String getFirstStudentId() {
		return firstStudentId;
	}

	public void setFirstStudentId(String firstStudentId) {
		this.firstStudentId = firstStudentId;
	}

	public int getRelationCode() {
		return relationCode;
	}

	public void setRelationCode(int relationCode) {
		this.relationCode = relationCode;
	}

	public String getRelationName() {
		return relationName;
	}

	public void setRelationName(String relationName) {
		this.relationName = relationName;
	}

	@Override
	public String toString() {
		return "Users [userId=" + userId + ", role=" + role + ", userName=" + userName + ", phone=" + phone
				+ ", school=" + school + ", grade=" + grade + ", birth=" + birth + ", parentPhone=" + parentPhone
				+ ", password=" + password + ", stopAlertStartTime=" + stopAlertStartTime + ", stopAlertEndTime="
				+ stopAlertEndTime + ", alertState=" + alertState + ", firstStudentId=" + firstStudentId
				+ ", relationCode=" + relationCode + ", relationName=" + relationName + "]";
	}
	
	

}
