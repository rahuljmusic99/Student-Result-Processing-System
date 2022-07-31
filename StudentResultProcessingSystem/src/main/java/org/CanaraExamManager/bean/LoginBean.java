package org.CanaraExamManager.bean;

import java.sql.Blob;

public class LoginBean {
	
	private String userNameString;
	private String passwordString;
	private String semesterString;
	private String nameString;
	private String programmeName;
//	private Blob userImage;
//	private String userImageString;
	
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
	
	public String getProgramme() {
		return programmeName;
		
	}
	
	public void setProgramme(String programmeName) {
		
		this.programmeName = programmeName;
	}
	
//	public Blob getUserImage() {
//		return userImage;
//	}
//	
//	public void setUserImage(Blob userImage) {
//		this.userImage = userImage;
//	}
//	
//	public String getUserImageString() {
//		return userImageString;
//	}
//	
//	public void setUserImageString(String userImageString) {
//		this.userImageString = userImageString;
//	}
}
