package org.CanaraExamManager.bean;

import org.apache.tomcat.jakartaee.commons.io.output.StringBuilderWriter;

public class ResultBean {

	private String userNameString = "";
	private String semesterString = "";
	private String[] courseCodeString;
	private String programmeId = "";
	private String examMonthString = "";
	private String examYearString = "";
	private String resultDateString = "";
	private int[] maxMarks;
	private int[] minMarks;
	private int[]obtainedMarks;
	private int[]credit;
	private int[]internalAs;
	private int[]maxIA;
	
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

	public void setArraySize(int size) {
		this.obtainedMarks = new int[size];
		this.credit = new int[size];
		this.internalAs = new int[size];
		this.maxMarks = new int[size];
		this.minMarks = new int[size];
		this.courseCodeString = new String[size];
		this.maxIA = new int[size];
	}
	
	public int getArraySize() {
		return this.obtainedMarks.length;
	}
	
	public int getObtainedMarks(int size) {
		return this.obtainedMarks[size];
	}
	
	public void setObtainedMarks(int marks, int index) {
		this.obtainedMarks[index] = marks;
	}
	
	public int getCredit(int size) {
		return this.credit[size];
	}
	
	public void setCredit(int marks, int index) {
		this.credit[index] = marks;
	}
	
	public int getMaxMarks(int size) {
		return this.maxMarks[size];
	}
	
	public void setMaxMarks(int marks, int index) {
		this.maxMarks[index] = marks;
	}
	
	public int getMinMarks(int size) {
		return this.minMarks[size];
	}
	
	public void setMinMarks(int marks, int index) {
		this.minMarks[index] = marks;
	}
	
	public int getIAMarks(int size) {
		return this.internalAs[size];
	}
	
	public void setIAMarks(int marks, int index) {
		this.internalAs[index] = marks;
	}
	
	public int getMaxIA(int size) {
		return this.maxIA[size];
	}
	
	public void setMaxIA(int marks, int index) {
		this.maxIA[index] = marks;
	}
	
	public String getCourseCode(int size) {
		return this.courseCodeString[size];
	}
	
	public void setCourseCode(String courseCodeString,int index) {
		this.courseCodeString[index] = courseCodeString;
	}
	
	public String getProgrammeId() {
		return this.programmeId;
	}
	
	public void setProgrammeId(String programmeId) {
		this.programmeId = programmeId;
	}
	
	public String getExamMonth() {
		return this.examMonthString;
	}
	
	public void setExamMonth(String examMonthString) {
		this.examMonthString = examMonthString;
	}
	
	public String getExamYear() {
		return this.examYearString;
	}
	
	public void setExamYear(String examYearString) {
		this.examYearString = examYearString;
	}
	
	public String getResultDate() {
		return this.resultDateString;
	}
	
	public void setResultDate(String resultDateString) {
		this.resultDateString = resultDateString;
	}
}
