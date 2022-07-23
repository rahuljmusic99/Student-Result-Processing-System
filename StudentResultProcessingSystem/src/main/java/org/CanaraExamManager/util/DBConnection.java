package org.CanaraExamManager.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection createConnection() {
		
		Connection con = null;
		
		String urlString = "jdbc:mysql://localhost:3306/canaradatabase"; //My SQL URL followed by the database name
		String userNameString = "root"; //MySQL user name
		String passwordString = "Canara@575001"; //MySQL password
		
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver"); //loading the MySQL Driver
				//optional method.
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			//Attempting to connect to MySQL database
			con=DriverManager.getConnection(urlString,userNameString,passwordString);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return con;
		
		
	}
}
