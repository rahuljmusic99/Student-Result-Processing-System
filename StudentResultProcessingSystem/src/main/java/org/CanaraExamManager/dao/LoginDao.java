package org.CanaraExamManager.dao;

import java.sql.Connection;

import org.CanaraExamManager.bean.LoginBean;

import org.CanaraExamManager.util.DBConnection;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpSession;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	
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
		String semesterString = "";
		String nameString = "";
		
		try {
			//Fetch database connection object
			con = DBConnection.createConnection();
			//Statement is used to write queries.
			statement = con.createStatement();
			
			resultset = statement.executeQuery("select reg_no,password,status,semester,first_name,last_name from student");
			
			while(resultset.next()) {
				
				userNameDBString = resultset.getString("reg_no");
				passwordDBString = resultset.getString("password");
				statusString = resultset.getString("status");
				semesterString = resultset.getString("semester");
				String firstString = resultset.getString("first_name");
				String secondString = resultset.getString("last_name");
				
				nameString = firstString +" "+ secondString;
				
				loginBean.setSemester(semesterString);
				loginBean.setName(nameString);
				
				statusString.toLowerCase();
				
				if(userNameString.equals(userNameDBString) && passwordString.equals(passwordDBString) && statusString.equals("true") ) {
					
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
			
			resultset = statement.executeQuery("select admin_id,password from admin");
			
			while(resultset.next()) {
				
				userNameDBString = resultset.getString("admin_id");
				passwordDBString = resultset.getString("password");
				
				if(userNameString.equals(userNameDBString) && passwordString.equals(passwordDBString) ) {
					
					return "SUCCESS";//Return SUCCESS if the user credentials match the user credentials in the database
				}
				
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "Invalid User Credentials";
	}
}
