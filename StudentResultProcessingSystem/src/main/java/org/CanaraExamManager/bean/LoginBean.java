package org.CanaraExamManager.bean;

import java.sql.Blob;

import org.apache.catalina.startup.Tomcat.ExistingStandardWrapper;

import com.mysql.cj.PingTarget;

public class LoginBean {
	
	private String userNameString;
	private String passwordString;
	private String semesterString;
	private String nameString;
	private String programmeName;
	private String className;
	private String phone;
	private String email;
	private String staffRole;
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
	
	public String getClassName() {
		return className;
	}
	
	public void setClassName(String className) {
		this.className = className;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void setRole(String staffRole) {
		this.staffRole = staffRole;
	}
	
	public String getRole() {
		return this.staffRole;
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
