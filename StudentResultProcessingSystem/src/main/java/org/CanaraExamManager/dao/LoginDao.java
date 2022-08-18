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
					loginBean.setSemester(semesterString);
					
					this.marksArray = new float[Integer.parseInt(semesterString)];
					
					for(int i = 1; i <= Integer.parseInt(semesterString) ; i++){
						
						float grandTotalMaxMarks = 0;
						float grandTotalMarks = 0;
						
						ResultSet marksResultSet = null;
						marksResultSet = statement.executeQuery("SELECT * FROM (course "
								+ "LEFT JOIN final_marks ON course.course_code = final_marks.course_code) "
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
			
			resultset = statement.executeQuery("select staff_id,password,staff_status from staff");
			
			while(resultset.next()) {
				
				userNameDBString = resultset.getString("staff_id");
				passwordDBString = resultset.getString("password");
				staffStatusString = resultset.getString("staff_status");
				staffStatusString.toLowerCase();
				
				if(userNameString.equals(userNameDBString) && passwordString.equals(passwordDBString) && staffStatusString.equals("true")) {
					
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
