package org.CanaraExamManager.bean;

public class LoginBean {
	
	private String userNameString;
	private String passwordString;
	
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
}
