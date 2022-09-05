package org.CanaraExamManager.dao;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.util.DBConnection;

import java.io.ObjectInputStream.GetField;
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
	
	public ResultSet loadMaxSemester() {
		ResultSet programmeSem = null;
		try {
			Connection con = DBConnection.createConnection();;
			Statement statement = con.createStatement();
			programmeSem = statement.executeQuery(""
				+"SELECT programme_sem from programme "
				+"WHERE programme_sem = (SELECT MAX(programme_sem)FROM programme)LIMIT 1");	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return programmeSem;
		
	}
	
	public ResultSet loadStaffClasses(String programmeId){
		ResultSet resultSet = null;
		try {
			Connection con = DBConnection.createConnection();;
			Statement statement = con.createStatement();
			resultSet = statement.executeQuery(""
				+"SELECT * FROM ((student "
				+"INNER JOIN programme ON student.programme_id = programme.programme_id) "
				+"INNER JOIN class ON student.class_id = class.class_id) "
				+"WHERE programme.programme_id = '"+programmeId.trim()+"' "
				+"ORDER BY programme.programme_name ASC, class.class_year ASC, class.class_name ASC");	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultSet;
	}
	
	public ResultSet loasStaffClasses(String programmeId){
		ResultSet resultSet = null;
		try {
			Connection con = DBConnection.createConnection();;
			Statement statement = con.createStatement();
			resultSet = statement.executeQuery(""
				+"SELECT A.programme_name,A.programme_id,B.programme_id,B.class_name,B.class_year FROM (programme A "
				+ "INNER JOIN class B ON A.programme_id = B.programme_id) "
				+ "WHERE A.programme_id = '"+programmeId.trim()+"' ORDER BY A.programme_id ASC");	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultSet;
	}
}
