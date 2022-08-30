package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;


public class ForgotPasswordDao {
	
	public String authenticateStudent(StudentStaffDataBean studentDataBean) {
		
		Connection connection = null;
		ResultSet resultSet = null;
		Statement statement = null;
		connection = DBConnection.createConnection();
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM student WHERE email = '"+studentDataBean.getEmail().trim()+"'");
			
			if(resultSet.next() == false) {
				return "No Such User Found with Email '"+studentDataBean.getEmail().trim()+"'";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "SUCCESS";
	}
	
	public String authenticateStaff(StudentStaffDataBean staffDataBean) {
		
		Connection connection = null;
		ResultSet resultSet = null;
		Statement statement = null;
		connection = DBConnection.createConnection();
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM staff WHERE email = '"+staffDataBean.getEmail().trim()+"'");
			
			if(resultSet.next() == false) {
				return "No Such User Found with Email '"+staffDataBean.getEmail().trim()+"'";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "SUCCESS";
	}
	
	public String authenticateAdmin(StudentStaffDataBean adminDataBean) {
		
		Connection connection = null;
		ResultSet resultSet = null;
		Statement statement = null;
		connection = DBConnection.createConnection();
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM admin WHERE email = '"+adminDataBean.getEmail().trim()+"'");
			
			if(resultSet.next() == false) {
				return "No Such Admin Found with Email '"+adminDataBean.getEmail().trim()+"'";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "SUCCESS";
	}
}
