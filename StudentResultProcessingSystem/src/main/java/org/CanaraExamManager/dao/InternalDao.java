package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.CanaraExamManager.bean.ResultBean;
import org.CanaraExamManager.util.DBConnection;

public class InternalDao {
		
	public ResultSet getFirstInternal(ResultBean resultBean) {
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String userNameString = resultBean.getUserName();
		String semesterString = resultBean.getSemester();
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM ((first_internal_marks "
					+ "INNER JOIN course ON first_internal_marks.course_code = course.course_code)"
					+ "INNER JOIN programme ON first_internal_marks.programme_id = programme.programme_id) "
					+ "WHERE first_internal_marks.reg_no = "+userNameString+" "
					+ "AND course.course_sem = "+semesterString+"");
												
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
	}
	
public ResultSet getSecondInternal(ResultBean resultBean) {
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		String userNameString = resultBean.getUserName();
		String semesterString = resultBean.getSemester();
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM ((second_internal_marks "
					+ "INNER JOIN course ON second_internal_marks.course_code = course.course_code)"
					+ "INNER JOIN programme ON second_internal_marks.programme_id = programme.programme_id) "
					+ "WHERE second_internal_marks.reg_no = "+userNameString+" "
					+ "AND course.course_sem = "+semesterString+"");
												
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
	}

}
