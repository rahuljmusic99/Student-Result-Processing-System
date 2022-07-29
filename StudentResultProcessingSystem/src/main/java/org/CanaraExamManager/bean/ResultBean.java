package org.CanaraExamManager.bean;

public class ResultBean {

	private String userNameString;
	private String semesterString;
	
	public String getUserName() {
		return this.userNameString;
		
	}
	
	public void setUserName(String userNameString) {
		this.userNameString = userNameString;
		
	}
	
	public String getSemester() {
		return this.semesterString;
	}
		
	public void setSemester(String semesterString) {
		this.semesterString = semesterString;
	}
	
	
}
