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
		
		ResultBean resultDao = new ResultBean();
		String userNameString = resultBean.getUserName();
		String semesterString = resultBean.getSemester();
		
		try {
			con = DBConnection.createConnection();
			
			statement = con.createStatement();
			
			resultSet = statement.executeQuery("SELECT * FROM final_marks INNER JOIN course ON final_marks.reg_no = student.reg_no WHERE final_marks.reg_no = ? AND final_marks.sem  ");
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return resultSet;
	}
}
