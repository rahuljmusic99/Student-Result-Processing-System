//package org.CanaraExamManager.dao;
//
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//
//import org.CanaraExamManager.bean.ResultBean;
//import org.CanaraExamManager.util.DBConnection;
//
//public class ResultDao {
//	
//	public ResultSet getResult(ResultBean resultBean) {
//		
//		Connection con = null;
//		Statement statement = null;
//		ResultSet resultSet = null;
//		
//		String userNameString = resultBean.getUserName();
//		
//		try {
//			
//			con = DBConnection.createConnection();
//			
//			statement = con.createStatement();
//			
//			resultSet = statement.executeQuery("select ");
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//			
//		}
//		
//		return resultSet;
//	}
//}
