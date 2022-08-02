package org.CanaraExamManager.dao;

import org.CanaraExamManager.util.DBConnection;

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
			resultSet = statement.executeQuery("SELECT * FROM programme");
												
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		
		return resultSet;
	}
}
