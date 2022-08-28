package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;

public class DeleteDataDao {
	
	public String deleteStudentData(StudentStaffDataBean studentDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM student WHERE reg_no ="+studentDataBean.getRegNo().trim()+"";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
	
	public String deleteStaffData(StudentStaffDataBean staffDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM staff WHERE staff_id ="+staffDataBean.getStaffId().trim()+"";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
	
	public String deleteProgrammeData(ProgrammeCourseClassBean programmeDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM programme WHERE programme_id = "+programmeDataBean.getProgrammeId().trim()+" ";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return "Unbale to Delete Programme '"+"Programme ID: "+programmeDataBean.getProgrammeId().trim()+"' because it contains Classes";
		}
		
		return "DELETESUCCESS";
	}
	
	public String deleteCourseData(ProgrammeCourseClassBean courseDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM course WHERE course_code ='"+courseDataBean.getCourseCode()+"' "
					+"AND course_name = '"+courseDataBean.getCourseName()+"'";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return "Unable to Delete Course "+courseDataBean.getCourseName().trim()+" 'Course Code: "+courseDataBean.getCourseCode().trim()+"' Because it contains Result Data";
		}
		
		return "DELETESUCCESS";
	}
	
	public String deleteClassData(ProgrammeCourseClassBean classBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM class WHERE class_id ="+classBean.getClassId().trim()+"";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return "Unbale to Delete Class '"+"Class ID: "+classBean.getClassId().trim()+"' because it contains Students";
		}
		
		return "DELETESUCCESS";
	}
	
	public String deleteFinalResultData() {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM final_marks WHERE reg_no = ";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
	
	public String deletefirstInternalData() {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM first_internal_marks WHERE reg_no = ";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
	
	public String deleteSecondInternalData() {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;

		try {
			query = "DELETE FROM second_internal_marks WHERE reg_no = ";
			
			con = DBConnection.createConnection();
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.execute();
			
			
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
}
