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
		ResultSet resultSet2 = null;
		Statement statement2 = null;
		String resultDate = "";
		String examMonth = "";
		String examYearString = "";
		
		String userNameString = resultBean.getUserName();
		String semesterString = resultBean.getSemester();
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			statement2 = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM (((final_marks "
											+ "INNER JOIN course ON final_marks.course_code = course.course_code)"
											+ "INNER JOIN programme ON final_marks.programme_id = programme.programme_id)"
											+ "INNER JOIN exam_details ON final_marks.reg_no = exam_details.reg_no) "
											+ "WHERE final_marks.reg_no = "+userNameString+" "
											+ "AND course.course_sem = "+semesterString+" AND exam_details.semester = "+semesterString+" "
											+ "AND exam_details.exam_type ='Semester'");
			
			resultSet2 = statement2.executeQuery("SELECT * from exam_details where reg_no = "+userNameString+" and semester = "+semesterString+" "
					+ "and exam_type = 'Semester'");
			while(resultSet2.next()) {
				resultDate = resultSet2.getString("result_date");
				examMonth = resultSet2.getString("exam_month");
				examYearString = resultSet2.getString("exam_year");
			}
			
			resultBean.setResultDate(resultDate);
			resultBean.setExamMonth(examMonth);
			resultBean.setExamYear(examYearString);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
	}
}
