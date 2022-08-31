package org.CanaraExamManager.controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/ResetPassword")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userType = (String)session.getAttribute("userType");
		String email = (String)session.getAttribute("userMail");
		String password = request.getParameter("");
		
		if(email != null ||  password !=null) {
			
			if(userType == "student" || userType.equals("student")) {
				
				
			}else if(userType == "staff" || userType.equals("staff")) {
				
				
			}else if(userType == "admin" || userType.equals("admin")) {
				
				
			}
			
		}else {
			
			
		}
		
	}

}
