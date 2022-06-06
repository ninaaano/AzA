package com.aza.common;

import org.apache.ibatis.type.MappedTypes;

import lombok.Data;

public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;

	private String searchId;
	private String lessonCode;
	private String searchStartDate;
	private String searchEndDate;
	private String content;
	
	private int endRowNum;
	private int startRowNum;
	
	///Constructor
	public Search() {
	}
	
	///Method
	public String getLessonCode() {
		return lessonCode;
	}
	
	public void setLessonCode(String lessonCode) {
		this.lessonCode = lessonCode;
	}
	
	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSearchStartDate() {
		return searchStartDate;
	}
	
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	
	public String getSearchEndDate() {
		return searchEndDate;
	}
	
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}
	
	public String getSearchId() {
		return searchId;
	}
	
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", pageSize=" + pageSize + ", searchId=" + searchId + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + "]";
	}
}