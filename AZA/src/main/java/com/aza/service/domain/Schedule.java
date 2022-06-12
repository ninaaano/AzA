package com.aza.service.domain;

public class Schedule {

	private int scheduleCode;
    private String scheduleStartDate;
    private String scheduleStartTime;
    private String scheduleEndTime;
    private String scheduleEndDate;
    private String scheduleContent;
    private String teacherId;
    private String scheduleTitle;

    public String getScheduleStartDate() {
        return scheduleStartDate;
    }

    public void setScheduleStartDate(String scheduleStartDate) {
        this.scheduleStartDate = scheduleStartDate;
    }

    public int getScheduleCode() {
        return scheduleCode;
    }

    public void setScheduleCode(int scheduleCode) {
        this.scheduleCode = scheduleCode;
    }

    public String getScheduleStartTime() {
        return scheduleStartTime;
    }

    public void setScheduleStartTime(String scheduleStartTime) {
        this.scheduleStartTime = scheduleStartTime;
    }

    public String getScheduleEndTime() {
        return scheduleEndTime;
    }

    public void setScheduleEndTime(String scheduleEndTime) {
        this.scheduleEndTime = scheduleEndTime;
    }

    public String getScheduleEndDate() {
        return scheduleEndDate;
    }

    public void setScheduleEndDate(String scheduleEndDate) {
        this.scheduleEndDate = scheduleEndDate;
    }

    public String getScheduleContent() {
        return scheduleContent;
    }

    public void setScheduleContent(String scheduleContent) {
        this.scheduleContent = scheduleContent;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	@Override
	public String toString() {
		return "Schedule [scheduleCode=" + scheduleCode + ", scheduleStartDate=" + scheduleStartDate
				+ ", scheduleStartTime=" + scheduleStartTime + ", scheduleEndTime=" + scheduleEndTime
				+ ", scheduleEndDate=" + scheduleEndDate + ", scheduleContent=" + scheduleContent + ", teacherId="
				+ teacherId + ", scheduleTitle=" + scheduleTitle + "]";
	}
    

}