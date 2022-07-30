package org.CanaraExamManager.bean;

public class LoginBean {
	
	private String userNameString;
	private String passwordString;
	private String semesterString;
	private String nameString;
	
	
	public String getUserName() {
		return userNameString;
		
	}
	
	public void setUserName(String userNameString) {
		this.userNameString = userNameString;
		
	}
	
	public String getPassword() {
		return passwordString;
	}
	
	public void setPassword(String passwordString) {
		this.passwordString = passwordString;
	}
	
	public String getName() {
		return nameString;
		
	}
	
	public void setName(String nameString) {
		this.nameString = nameString;
	}
	
	public String getSemester() {
		return semesterString;
	
	}
	
	public void setSemester(String semesterString) {
		this.semesterString = semesterString;
	}
}
