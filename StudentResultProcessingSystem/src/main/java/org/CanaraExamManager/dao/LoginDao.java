package org.CanaraExamManager.dao;

import java.sql.Blob;
import java.sql.Connection;

import org.CanaraExamManager.bean.LoginBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;


import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	
	float[] marksArray ;
	float[] firstInternal;
	float[] secondInternal;
	
	public String authenticateUser(LoginBean loginBean) {
		
		//Assign user entered values to temporary variables.
		String userNameString = loginBean.getUserName();
		String passwordString = loginBean.getPassword();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultset = null;
		
		String userNameDBString = "";
		String passwordDBString = "";
		String statusString = "";

		
		try {
			//Fetch database connection object
			con = DBConnection.createConnection();
			//Statement is used to write queries.
			statement = con.createStatement();
			
			resultset = statement.executeQuery(""
			+ "select A.reg_no,A.class_id,A.email,A.phone,A.password,A.status,A.semester,A.first_name,A.last_name,A.programme_id,B.programme_id,B.programme_name,C.class_id,C.class_name FROM ((student A "
			+ "INNER JOIN programme B ON A.programme_id = B.programme_id) "
			+ "INNER JOIN class C ON A.class_id = C.class_id) "
			+ "WHERE A.reg_no = "+userNameString+"");
			
			while(resultset.next()) {
				
				userNameDBString = resultset.getString("reg_no");
				passwordDBString = resultset.getString("password");
				statusString = resultset.getString("status");				
				statusString.toLowerCase();
				String programmeIdString = resultset.getString("programme_id");
				String semesterString = resultset.getString("semester");
				
				if(userNameString.equals(userNameDBString) && passwordString.equals(passwordDBString) && statusString.equals("true") ) {
					
					loginBean.setName(resultset.getString("first_name")+" "+resultset.getString("last_name"));
					loginBean.setEmail(resultset.getString("email"));
					loginBean.setPhone(resultset.getString("phone"));
					loginBean.setPassword(resultset.getString("password"));
					loginBean.setProgramme(resultset.getString("programme_name"));
					loginBean.setSemester(semesterString);
					
					this.marksArray = new float[Integer.parseInt(semesterString)];
					this.firstInternal = new float[Integer.parseInt(semesterString)];
					this.secondInternal = new float[Integer.parseInt(semesterString)];
					
					for(int i = 1; i <= Integer.parseInt(semesterString) ; i++){
						
						float grandTotalMaxMarks = 0;
						float grandTotalMarks = 0;
						
						float grandTotalMaxMarks2 = 0;
						float grandTotalMarks2 = 0;
						
						float grandTotalMaxMarks3 = 0;
						float grandTotalMarks3 = 0;
						
						ResultSet marksResultSet = null;
						marksResultSet = statement.executeQuery("SELECT * FROM (course "
								+ "INNER JOIN final_marks ON course.course_code = final_marks.course_code) "
								+ "WHERE course.programme_id = "+programmeIdString+" "
								+ "AND course.course_sem = "+i+" "
								+ "AND final_marks.reg_no = "+userNameDBString+"");
						
						while (marksResultSet.next()) {
							
							grandTotalMaxMarks = grandTotalMaxMarks + (marksResultSet.getFloat("max_marks") + marksResultSet.getFloat("max_IA"));
							grandTotalMarks =  grandTotalMarks + (marksResultSet.getFloat("total_marks"));
							
						}
						
						float averageMarks = (grandTotalMarks*100)/grandTotalMaxMarks;
						
						if(Float.isNaN(averageMarks)) {
							this.marksArray[i-1] = 0;
							
						}else {
							this.marksArray[i-1] = averageMarks;
						}
						
						
						ResultSet firstInternalResultSet = null;
						firstInternalResultSet = statement.executeQuery("SELECT A.course_code,A.course_sem,A.programme_id,B.course_code,"
								+ "B.obtained_marks,B.max_marks,B.reg_no FROM (course A "
								+ "INNER JOIN first_internal_marks B ON A.course_code = B.course_code) "
								+ "WHERE A.programme_id = "+programmeIdString+" "
								+ "AND A.course_sem = "+i+" "
								+ "AND B.reg_no = "+userNameDBString+"");
						
						while (firstInternalResultSet.next()) {
							
							grandTotalMaxMarks2 = grandTotalMaxMarks2 + (firstInternalResultSet.getFloat("max_marks"));
							grandTotalMarks2 =  grandTotalMarks2 + (firstInternalResultSet.getFloat("obtained_marks"));
							
						}
						
						float averageMarks2 = (grandTotalMarks2*100)/grandTotalMaxMarks2;
						
						if(Float.isNaN(averageMarks2)) {
							this.firstInternal[i-1] = 0;
							
						}else {
							this.firstInternal[i-1] = averageMarks2;
						}
						
						
						ResultSet secondInternalResultSet = null;
						secondInternalResultSet = statement.executeQuery("SELECT A.course_code,A.course_sem,A.programme_id,B.course_code,"
								+ "B.obtained_marks,B.max_marks,B.reg_no FROM (course A "
								+ "INNER JOIN second_internal_marks B ON A.course_code = B.course_code) "
								+ "WHERE A.programme_id = "+programmeIdString+" "
								+ "AND A.course_sem = "+i+" "
								+ "AND B.reg_no = "+userNameDBString+"");
						
						while (secondInternalResultSet.next()) {
							
							grandTotalMaxMarks3 = grandTotalMaxMarks3 + (secondInternalResultSet.getFloat("max_marks"));
							grandTotalMarks3 =  grandTotalMarks3 + (secondInternalResultSet.getFloat("obtained_marks"));
							
						}
						
						float averageMarks3 = (grandTotalMarks3*100)/grandTotalMaxMarks3;
						
						if(Float.isNaN(averageMarks3)) {
							this.secondInternal[i-1] = 0;
							
						}else {
							this.secondInternal[i-1] = averageMarks3;
						}
					}
					
					
//					
//					for(int i = 0; i< marksArray.length;i++) {
//						System.out.println(marksArray[i]);
//					}
//					
					return "SUCCESS";//Return SUCCESS if the user credentials match the user credentials in the database
				}else if(statusString.equals("false")) {
					
					return "Permission Denied!";
				}
				
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "Invalid User Credentials";
	}
	
//  Method to return averageFinalMarks array	
	public float[] averageFinalMarks() {
		
		return this.marksArray;
	}
	
	public float[] averageFirstInternal() {
		
		return this.firstInternal;
	}
	
	public float[] averageSecondInternal() {
		
		return this.secondInternal;
	}
	
	
	
	

	public String authenticateStaff(LoginBean loginBean) {
		
		//Assign user entered values to temporary variables.
		String userNameString = loginBean.getUserName();
		String passwordString = loginBean.getPassword();
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultset = null;
		
		String userNameDBString = "";
		String passwordDBString = "";
		String staffStatusString = "";
		
		try {
			//Fetch database connection object
			con = DBConnection.createConnection();
			//Statement is used to write queries.
			statement = con.createStatement();
			
			resultset = statement.executeQuery("select staff_id,password,staff_status,first_name,last_name,phone,email from staff");
			
			while(resultset.next()) {
				
				userNameDBString = resultset.getString("staff_id");
				passwordDBString = resultset.getString("password");
				staffStatusString = resultset.getString("staff_status");
				staffStatusString.toLowerCase();
				
				if(userNameString.equals(userNameDBString) && passwordString.equals(passwordDBString) && staffStatusString.equals("true")) {
					loginBean.setName(resultset.getString("first_name")+" "+resultset.getString("last_name"));
					loginBean.setPhone(resultset.getString("phone"));
					loginBean.setEmail(resultset.getString("email"));
					loginBean.setPassword(resultset.getString("password"));
					return "SUCCESS";//Return SUCCESS if the user credentials match the user credentials in the database
				}else if(staffStatusString.equals("false")) {
					
					return "Permission Denied!";
				}
				
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "Invalid User Credentials";
	}
	
	public String authenticateAdmin(LoginBean loginBean) {
		
		//Assign user entered values to temporary variables.
		String userNameString = loginBean.getUserName();
		String passwordString = loginBean.getPassword();
		
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultset = null;
		
		String userNameDBString = "";
		String passwordDBString = "";
		
		try {
			//Fetch database connection object
			con = DBConnection.createConnection();
			//Statement is used to write queries.
			statement = con.createStatement();
			
			resultset = statement.executeQuery("select admin_id,first_name,last_name,phone,email,password from admin");
			
			
			while(resultset.next()) {
				
				userNameDBString = resultset.getString("admin_id");
				passwordDBString = resultset.getString("password");
				
				if(userNameString.equals(userNameDBString) && passwordString.equals(passwordDBString) ) {
					
					loginBean.setName(resultset.getString("first_name")+" "+resultset.getString("last_name"));
					loginBean.setPhone(resultset.getString("phone"));
					loginBean.setEmail(resultset.getString("email"));
					loginBean.setPassword(resultset.getString("password"));
					return "SUCCESS";//Return SUCCESS if the user credentials match the user credentials in the database
				}
				
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "Invalid User Credentials";
	}
	
	
}
