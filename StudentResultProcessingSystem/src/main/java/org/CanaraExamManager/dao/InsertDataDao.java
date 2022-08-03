package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;

public class InsertDataDao {
	
	public String insertStudentData() {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		StudentStaffDataBean studentDataBean = new StudentStaffDataBean();
		
		String programmeId = "";
		String classIdString = "";
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT A.programme_id,B.class_id FROM (programme A "
											+ "INNER JOIN class B ON A.programme_id = B.programme_id) "
											+ "WHERE A.programme_name = "+studentDataBean.getProgramme()+" "
											+ "AND B.class_name = "+studentDataBean.getclass()+" "
											+ "AND B.class_year = "+studentDataBean.getYear()+" ");
			if(resultSet!=null) {
				
				while (resultSet.next()) {
					
					
				}
			}
			
			query = "";
			preparedStatement = con.prepareStatement(query);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return null;
	}
}
