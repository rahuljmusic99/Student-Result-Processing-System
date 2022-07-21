package org.CanaraExamManager;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class StudentLogin
 */

@WebServlet("/StudentLogin")
public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		String upwd = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher;
		
		
		if(uname == null || uname.equals("")) {
			
			request.setAttribute("status", "InvalidUsername");
			dispatcher = request.getRequestDispatcher("studentlogin.jsp");
			dispatcher.forward(request, response);
			
		}
		if(upwd == null || upwd.equals("")) {
			
			request.setAttribute("status", "InvalidPassword");
			dispatcher = request.getRequestDispatcher("studentlogin.jsp");
			dispatcher.forward(request, response);
		}
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canaradatabase","root","Canara@575001");
			PreparedStatement pStatement = con.prepareStatement("select * from student where reg_no=? and password=?");
			pStatement.setString(1,uname);
			pStatement.setString(2,upwd);
			
			ResultSet resultset = pStatement.executeQuery();

			if(resultset.next()) {
				
				session.setAttribute("name",resultset.getString("uname"));
				dispatcher=request.getRequestDispatcher("studdashboard.html");
			}
			else {
				
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("studentlogin.jsp");
			}
			
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
