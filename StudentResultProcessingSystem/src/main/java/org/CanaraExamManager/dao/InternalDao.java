package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.CanaraExamManager.bean.ResultBean;
import org.CanaraExamManager.util.DBConnection;

import jakarta.servlet.http.HttpSession;

public class InternalDao {
		
	public ResultSet getFirstInternal(ResultBean resultBean) {
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		Statement statement2 = null;
		
		String examMonthString = "";
		String examYearString = "";
		String resultDateString = "";
	
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
			
			statement2 = con.createStatement();
			resultSet2 = statement2.executeQuery("SELECT * FROM exam_details where reg_no ="+userNameString+" and semester ="+semesterString+""
					+ "and exam_type = 'FirstInternal'");
			
			while(resultSet2.next()) {
				examMonthString = resultSet2.getString("exam_month");
				examYearString = resultSet2.getString("exam_year");
				resultDateString = resultSet2.getString("result_date");
			}
			
			resultBean.setExamMonth(examMonthString);
			resultBean.setExamYear(examYearString);
			resultBean.setResultDate(resultDateString);
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
	}
	
public ResultSet getSecondInternal(ResultBean resultBean) {
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
		Statement statement2 = null;
		
		String examMonthString = "";
		String examYearString = "";
		String resultDateString = "";
	
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
			
			statement2 = con.createStatement();
			resultSet2 = statement2.executeQuery("SELECT * FROM exam_details where reg_no ="+userNameString+" and semester ="+semesterString+""
					+ "and exam_type = 'FirstInternal'");
			
			while(resultSet2.next()) {
				examMonthString = resultSet2.getString("exam_month");
				examYearString = resultSet2.getString("exam_year");
				resultDateString = resultSet2.getString("result_date");
			}
			
			resultBean.setUserName(examMonthString);
			resultBean.setProgrammeId(examYearString);
			resultBean.setSemester(resultDateString);
												
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return resultSet;
	}

}
