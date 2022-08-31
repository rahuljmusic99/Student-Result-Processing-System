package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;


public class ResetPasswordDao {

	public String resetStudentPassword(StudentStaffDataBean studentStaffDataBean) {
		
		Connection connection = null;
		try {
			PreparedStatement statement = null;
			connection = DBConnection.createConnection();
			statement = connection.prepareStatement("UPDATE student SET password='"+studentStaffDataBean.getPassword().trim()+"' "
					+ "WHERE email = '"+studentStaffDataBean.getEmail().trim()+"'");
			statement.execute();
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
			
		}
		
		return "SUCCESS";
	}
	
	public String resetStaffPassword(StudentStaffDataBean studentStaffDataBean) {
		
		Connection connection = null;
		Statement statement = null;
		
		try {
			PreparedStatement statement2 = null;
			connection = DBConnection.createConnection();
			statement2 = connection.prepareStatement("UPDATE student SET password='"+studentStaffDataBean.getPassword().trim()+"' "
					+ "WHERE email = '"+studentStaffDataBean.getEmail().trim()+"'");
			statement2.execute();
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
			
		}
		
		return "SUCCESS";
	}

	public String resetadminPassword(StudentStaffDataBean studentStaffDataBean) {
		
		Connection connection = null;
		Statement statement = null;
		
		try {
			PreparedStatement statement3 = null;
			connection = DBConnection.createConnection();
			statement3 = connection.prepareStatement("UPDATE student SET password='"+studentStaffDataBean.getPassword().trim()+"' "
					+ "WHERE email = '"+studentStaffDataBean.getEmail().trim()+"'");
			statement3.execute();
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
			
		}
		
		return "SUCCESS";
	}

}
