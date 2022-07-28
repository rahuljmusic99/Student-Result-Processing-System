package org.CanaraExamManager.controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.CanaraExamManager.bean.LoginBean;
import org.CanaraExamManager.dao.LoginDao;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginServlet() // default constructor
    {
    }
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userNameString = request.getParameter("username");
		String passwordString = request.getParameter("password");
		
		//creating an object for LoginBean class which setter and getter methods
		LoginBean loginBean = new LoginBean();
		
		//setting user name and password through the loginBean object which can be used in the future.
		loginBean.setUserName(userNameString);
		loginBean.setPassword(passwordString);
		
		//creating object for LoginDao which contains the main logic of the application.
		LoginDao loginDao = new LoginDao();
		
		HttpSession session = request.getSession();
		String sessionString = (String) session.getAttribute("LoginUser");
		
		if(sessionString == "StudentLogin") {
			//calling authenticate user method.
			String userValidateString = loginDao.authenticateUser(loginBean); 
		
			//If the method returns success string then the user will be rooted to his/her page.
			if(userValidateString.equals("SUCCESS")) {
				
				session.invalidate();
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("student",userNameString );
				response.sendRedirect("studdashboard.jsp");
			
			}else {
			
				request.setAttribute("errMessage",userValidateString);
				request.getRequestDispatcher("/studentlogin.jsp").forward(request, response);
			}
		
		}
		
		else if(sessionString == "StaffLogin") {
			
			String staffValidateString = loginDao.authenticateStaff(loginBean);
			
			if(staffValidateString.equals("SUCCESS")) {
				
				session.invalidate();
		
				HttpSession session2 = request.getSession();
				session2.setAttribute("staff",userNameString );
				
				response.sendRedirect("staffdashboard.jsp");
			}else {
				
				request.setAttribute("errMessage", staffValidateString);
				request.getRequestDispatcher("/stafflogin.jsp").forward(request, response);
			}
		}
		

		else if(sessionString == "AdminLogin") {
			
			String adminValidateString = loginDao.authenticateAdmin(loginBean);
			
			if(adminValidateString.equals("SUCCESS")) {
				
				session.invalidate();
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("admin",userNameString );
				
				response.sendRedirect("admindashboard.jsp");
			}else {
				
				request.setAttribute("errMessage", adminValidateString);
				request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
			}
		}
		
	}

}
