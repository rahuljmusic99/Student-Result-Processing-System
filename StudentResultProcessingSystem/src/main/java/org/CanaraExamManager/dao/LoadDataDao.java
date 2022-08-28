package org.CanaraExamManager.dao;

import org.CanaraExamManager.util.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoadDataDao {
		
	public ResultSet loadProgrammeData() {
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM programme ORDER BY programme_name ASC");
												
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return resultSet;
	}
	
	public ResultSet loadStudentData() {
		
		ResultSet resultSet = null;
		
		try {
			
			Connection con = DBConnection.createConnection();;
				Statement statement = con.createStatement();
				resultSet = statement.executeQuery(""
					+"SELECT * FROM ((student "
					+"INNER JOIN programme ON student.programme_id = programme.programme_id)"
					+"INNER JOIN class ON student.class_id = class.class_id)"
					+"ORDER BY programme.programme_name ASC, class.class_year ASC, class.class_name ASC");
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
			
			return resultSet;
	}
	
	public ResultSet loadStaffData() {
		
		ResultSet resultSet = null;
		
		try {

			Connection con = DBConnection.createConnection();;
				Statement statement = con.createStatement();
				resultSet = statement.executeQuery(""
					+"SELECT * FROM (staff "
					+"INNER JOIN programme ON staff.programme_id = programme.programme_id)"
					+"ORDER BY programme.programme_name ASC");
			 
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	
	public ResultSet loadCoursedata(ResultSet programmeResultSet,int i) {
		ResultSet resultSet = null;
		
		try {
			Connection con = DBConnection.createConnection();;
			Statement statement = con.createStatement();
			resultSet = statement.executeQuery(""
				+"SELECT * FROM course where course_sem = "+Integer.toString(i)+" "
				+"AND programme_id = "+programmeResultSet.getString("programme_id")+"");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultSet;
	}
	

	
	public ResultSet loadOnlyClassData() {
		ResultSet resultSet = null;
		
		try {
			Connection con = DBConnection.createConnection();;
			Statement statement = con.createStatement();
			resultSet = statement.executeQuery(""
				+"SELECT * FROM (class " 
				+"INNER JOIN programme ON class.programme_id = programme.programme_id)"
				+"ORDER BY programme.programme_name ASC");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultSet;
	}
	
	public ResultSet loadResulData() {
		ResultSet resultSet = null;
		
		try {
			Connection con = DBConnection.createConnection();;
			Statement statement = con.createStatement();
			resultSet = statement.executeQuery(""
					+"SELECT * FROM ((student " 
					+"INNER JOIN programme ON student.programme_id = programme.programme_id) "
					+"INNER JOIN class ON student.class_id = class.class_id)"
					+"ORDER BY programme.programme_name ASC, class.class_year ASC, class.class_name ASC");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultSet;
	}
}
