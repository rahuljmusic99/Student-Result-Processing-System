package org.CanaraExamManager.controler;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Blob;
//import java.sql.SQLException;

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
		String semesterString = "";
		String programmeName = "";
		String userImageString = "";
		Blob userImage = null;
		
		//creating an object for LoginBean class which setter and getter methods
		LoginBean loginBean = new LoginBean();
		
		//setting user name and password through the loginBean object which can be used in the future.
		loginBean.setUserName(userNameString);
		loginBean.setPassword(passwordString);
		
		//creating object for LoginDao which contains the main logic of the application.
		LoginDao loginDao = new LoginDao();
		
		
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("LoginUser");
		
		if(loginUser == "StudentLogin") {
			//calling authenticate user method.
			String userValidateString = loginDao.authenticateUser(loginBean); 
		
			//If the method returns success string then the user will be rooted to his/her page.
			if(userValidateString.equals("SUCCESS")) {
				
				session.invalidate();
				
				semesterString = loginBean.getSemester();
				programmeName = loginBean.getProgramme();
//				try {
//					imageConverter.base64Converter(loginBean);
//				} catch (SQLException | IOException e) {
//					e.printStackTrace();
//				}
//				userImageString  = loginBean.getUserImageString();
				
				
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("student", userNameString);
				session2.setAttribute("regNo", userNameString);
				session2.setAttribute("studentName", loginBean.getName().trim());
				session2.setAttribute("studentPhone", loginBean.getPhone());
				session2.setAttribute("studentEmail", loginBean.getEmail());
				session2.setAttribute("studentPassword",loginBean.getPassword());
				session2.setAttribute("semester", semesterString);
				session2.setAttribute("programme", programmeName);
				session2.setAttribute("user", "student");
				session2.setAttribute("averageFinalMarks", loginDao.averageFinalMarks());
				session2.setAttribute("averageFirstInternal", loginDao.averageFirstInternal());
				session2.setAttribute("averageSecondInternal", loginDao.averageSecondInternal());
//				session2.setAttribute("userImage", userImageString);
				
				response.sendRedirect("studdashboard.jsp");
			
			}else {
			
				request.setAttribute("errMessage",userValidateString);
				request.getRequestDispatcher("/studentlogin.jsp").forward(request, response);
			}
		
		}
		
		else if(loginUser == "StaffLogin") {
			
			String staffValidateString = loginDao.authenticateStaff(loginBean);
			
			if(staffValidateString.equals("SUCCESS")) {
				
				session.invalidate();
		
				HttpSession session2 = request.getSession();
				session2.setAttribute("staff",userNameString);
//				session2.setAttribute("StaffName", nameString);
				session2.setAttribute("user", "staff");
				session2.setAttribute("staffName", loginBean.getName());
				session2.setAttribute("staffPhone", loginBean.getPhone());
				session2.setAttribute("staffEmail", loginBean.getEmail());
				session2.setAttribute("staffPassword",loginBean.getPassword());
				session2.setAttribute("staffrole", loginBean.getRole());
				session2.setAttribute("staffProgramme", loginBean.getProgramme());
				response.sendRedirect("staffdashboard.jsp");
			}else {
				
				request.setAttribute("errMessage", staffValidateString);
				request.getRequestDispatcher("/stafflogin.jsp").forward(request, response);
			}
		}
		

		else if(loginUser == "AdminLogin") {
			
			String adminValidateString = loginDao.authenticateAdmin(loginBean);
			
			
			
			if(adminValidateString.equals("SUCCESS")) {
				
				session.invalidate();
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("admin",userNameString );
				session2.setAttribute("adminName", loginBean.getName());
				session2.setAttribute("adminPhone", loginBean.getPhone());
				session2.setAttribute("adminEmail", loginBean.getEmail());
				session2.setAttribute("adminPassword",loginBean.getPassword());
				session2.setAttribute("user", "admin");
				response.sendRedirect("admindashboard.jsp");
			}else {
				
				request.setAttribute("errMessage", adminValidateString);
				request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
			}
		}
		
	}

}