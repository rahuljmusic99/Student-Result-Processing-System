package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.CanaraExamManager.bean.ResultBean;
import org.CanaraExamManager.util.DBConnection;

public class ResultDao {
	
	public ResultSet getResult(ResultBean resultBean) {
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String userNameString = resultBean.getUserName();
		String semesterString = resultBean.getSemester();
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM (((final_marks "
											+ "INNER JOIN course ON final_marks.course_code = course.course_code)"
											+ "INNER JOIN programme ON final_marks.programme_id = programme.programme_id)"
											+ "INNER JOIN exam_details ON final_marks.reg_no = exam_details.reg_no) "
											+ "WHERE final_marks.reg_no = "+userNameString+" "
											+ "AND course.course_sem = "+semesterString+" AND exam_details.semester = "+semesterString+" "
											+ "AND exam_details.exam_type ='Semester'");
												
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
	}
}
