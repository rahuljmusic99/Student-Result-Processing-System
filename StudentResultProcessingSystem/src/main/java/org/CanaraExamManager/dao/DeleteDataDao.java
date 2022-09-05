package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
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
	
	public String deleteFinalResultData(StudentStaffDataBean studentStaffDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		ResultSet resultSet = null;
		Statement statement = null;
		ResultSet resultSet2 = null;
		Statement statement2 = null;
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			statement2 = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM COURSE "
					+ "INNER JOIN final_marks ON course.course_code = final_marks.course_code "
					+ "WHERE course.course_sem = "+studentStaffDataBean.getCurrentSemester()+" "
					+ "AND final_marks.reg_no ="+studentStaffDataBean.getRegNo().trim()+" "
					+ "AND final_marks.programme_id = "+studentStaffDataBean.getProgramme().trim()+"");
			
			resultSet2 = statement2.executeQuery("SELECT * FROM COURSE "
					+ "INNER JOIN final_marks ON course.course_code = final_marks.course_code "
					+ "WHERE course.course_sem = "+studentStaffDataBean.getCurrentSemester()+" "
					+ "AND final_marks.reg_no ="+studentStaffDataBean.getRegNo().trim()+" "
					+ "AND final_marks.programme_id = "+studentStaffDataBean.getProgramme().trim()+"");
			
			if(resultSet2.next() == true) {
				preparedStatement2 = con.prepareStatement("DELETE FROM exam_details WHERE reg_no = "+studentStaffDataBean.getRegNo()+" "
						+ "AND semester = "+studentStaffDataBean.getCurrentSemester()+" AND exam_type = 'Semester'");
				preparedStatement2.execute();
				while(resultSet.next()) {
					preparedStatement = null;
					query = "DELETE FROM final_marks WHERE reg_no = "+resultSet.getString("reg_no")+" "
							+ "AND course_code = '"+resultSet.getString("course_code")+"'";
					preparedStatement = con.prepareStatement(query);
					preparedStatement.execute();
				}
	
			}else {
				return "Result Data Does not Exists !";
			}
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
	
	public String deletefirstInternalData(StudentStaffDataBean studentStaffDataBean) {
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		ResultSet resultSet = null;
		Statement statement = null;
		ResultSet resultSet2 = null;
		Statement statement2 = null;
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			statement2 = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM COURSE "
					+ "INNER JOIN first_internal_marks ON course.course_code = first_internal_marks.course_code "
					+ "WHERE course.course_sem = "+studentStaffDataBean.getCurrentSemester()+" "
					+ "AND first_internal_marks.reg_no ="+studentStaffDataBean.getRegNo().trim()+" "
					+ "AND first_internal_marks.programme_id = "+studentStaffDataBean.getProgramme().trim()+"");
			
			resultSet2 = statement2.executeQuery("SELECT * FROM COURSE "
					+ "INNER JOIN first_internal_marks ON course.course_code = first_internal_marks.course_code "
					+ "WHERE course.course_sem = "+studentStaffDataBean.getCurrentSemester()+" "
					+ "AND first_internal_marks.reg_no ="+studentStaffDataBean.getRegNo().trim()+" "
					+ "AND first_internal_marks.programme_id = "+studentStaffDataBean.getProgramme().trim()+"");
			
			if(resultSet2.next() == true) {
				preparedStatement2 = con.prepareStatement("DELETE FROM exam_details WHERE reg_no = "+studentStaffDataBean.getRegNo()+" "
						+ "AND semester = "+studentStaffDataBean.getCurrentSemester()+" AND exam_type = 'FirstInternal'");
				preparedStatement2.execute();
				while(resultSet.next()) {
					preparedStatement = null;
					query = "DELETE FROM first_internal_marks WHERE reg_no = "+resultSet.getString("reg_no")+" "
							+ "AND course_code = '"+resultSet.getString("course_code")+"'";
					preparedStatement = con.prepareStatement(query);
					preparedStatement.execute();
				}
	
			}else {
				return "Result Data Does not Exists !";
			}
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
	
	public String deleteSecondInternalData(StudentStaffDataBean studentStaffDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		ResultSet resultSet = null;
		Statement statement = null;
		ResultSet resultSet2 = null;
		Statement statement2 = null;
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			statement2 = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM COURSE "
					+ "INNER JOIN second_internal_marks ON course.course_code = second_internal_marks.course_code "
					+ "WHERE course.course_sem = "+studentStaffDataBean.getCurrentSemester()+" "
					+ "AND second_internal_marks.reg_no ="+studentStaffDataBean.getRegNo().trim()+" "
					+ "AND second_internal_marks.programme_id = "+studentStaffDataBean.getProgramme().trim()+"");
			
			resultSet2 = statement2.executeQuery("SELECT * FROM COURSE "
					+ "INNER JOIN second_internal_marks ON course.course_code = second_internal_marks.course_code "
					+ "WHERE course.course_sem = "+studentStaffDataBean.getCurrentSemester()+" "
					+ "AND second_internal_marks.reg_no ="+studentStaffDataBean.getRegNo().trim()+" "
					+ "AND second_internal_marks.programme_id = "+studentStaffDataBean.getProgramme().trim()+"");
			
			if(resultSet2.next() == true) {
				preparedStatement2 = con.prepareStatement("DELETE FROM exam_details WHERE reg_no = "+studentStaffDataBean.getRegNo()+" "
						+ "AND semester = "+studentStaffDataBean.getCurrentSemester()+" AND exam_type = 'SecondInternal'");
				preparedStatement2.execute();
				while(resultSet.next()) {
					preparedStatement = null;
					query = "DELETE FROM second_internal_marks WHERE reg_no = "+resultSet.getString("reg_no")+" "
							+ "AND course_code = '"+resultSet.getString("course_code")+"'";
					preparedStatement = con.prepareStatement(query);
					preparedStatement.execute();
				}
	
			}else {
				return "Result Data Does not Exists !";
			}
		} catch (SQLException e) {
			return e.getLocalizedMessage();
		}
		
		return "DELETESUCCESS";
	}
	
}
