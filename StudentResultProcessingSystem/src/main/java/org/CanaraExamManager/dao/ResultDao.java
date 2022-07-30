package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
		
		ResultBean resultDao = new ResultBean();
		String userNameString = resultBean.getUserName();
		String semesterString = resultBean.getSemester();
		
		try {
			con = DBConnection.createConnection();
			
			statement = con.createStatement();
			
			resultSet = statement.executeQuery("SELECT reg_no,first_name,last_name, from student where reg_no = " + userNameString);
			resultSet = statement.executeQuery("SELECT *"
					+ "FROM ((final_marks"
					+ "INNER JOIN course ON final_marks.course_code = course.course_code)"
					+ "INNER JOIN programme ON final_marks.programme_id = programme.programme_id)"
					+ "WHERE final_marks.reg_no = "+userNameString+";");
												
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
	}
}
