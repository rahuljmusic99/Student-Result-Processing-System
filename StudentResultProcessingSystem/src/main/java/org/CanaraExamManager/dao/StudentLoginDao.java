package org.CanaraExamManager.dao;

import java.sql.Connection;

import org.CanaraExamManager.bean.LoginBean;

import org.CanaraExamManager.util.DBConnection;


import java.sql.Statement;
import java.sql.ResultSet;

public class StudentLoginDao {
	
	public String authenticateUser(LoginBean loginBean) {
		
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
			
			resultset = statement.executeQuery("select reg_no,password from student");
			
			while(resultset.next()) {
				
				userNameDBString = resultset.getString("reg_no");
				passwordDBString = resultset.getString("password");
				
				if(userNameString.equals(userNameDBString) && passwordString.equals(passwordDBString) ) {
					
					return "SUCCESS";//Return SUCCESS if the user credentials match the user credentials in the database
				}
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "Invalid User Credentials";
	}

	
}
