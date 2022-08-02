package org.CanaraExamManager.controler;

import org.CanaraExamManager.dao.LoadDataDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Blob;
//import java.sql.SQLException;
import java.sql.ResultSet;

import org.CanaraExamManager.bean.LoginBean;
import org.CanaraExamManager.util.ImageConverter;
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
		String nameString = "";
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
		ImageConverter imageConverter = new ImageConverter();
		LoadDataDao loadDataDao = new LoadDataDao();
		
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
				nameString = loginBean.getName();
//				try {
//					imageConverter.base64Converter(loginBean);
//				} catch (SQLException | IOException e) {
//					e.printStackTrace();
//				}
//				userImageString  = loginBean.getUserImageString();

				
				HttpSession session2 = request.getSession();
				session2.setAttribute("student", userNameString);
				session2.setAttribute("regNo", userNameString);
				session2.setAttribute("studentName", nameString);
				session2.setAttribute("semester", semesterString);
				session2.setAttribute("programme", programmeName);
				session2.setAttribute("user", "student");
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
				session2.setAttribute("StaffName", nameString);
				session2.setAttribute("user", "staff");
				response.sendRedirect("staffdashboard.jsp");
			}else {
				
				request.setAttribute("errMessage", staffValidateString);
				request.getRequestDispatcher("/stafflogin.jsp").forward(request, response);
			}
		}
		

		else if(loginUser == "AdminLogin") {
			
			String adminValidateString = loginDao.authenticateAdmin(loginBean);
			
			ResultSet resultSet = loadDataDao.loadProgrammeData();
			
			if(adminValidateString.equals("SUCCESS")) {
				
				session.invalidate();
				
				HttpSession session2 = request.getSession();
				session2.setAttribute("admin",userNameString );
				session2.setAttribute("StaffName", nameString);
				session2.setAttribute("user", "admin");
				session2.setAttribute("ProgrammeData", resultSet);
				response.sendRedirect("admindashboard.jsp");
			}else {
				
				request.setAttribute("errMessage", adminValidateString);
				request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
			}
		}
		
	}

}
