package org.CanaraExamManager.controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.dao.ResetPasswordDao;

@WebServlet("/ResetPassword")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ResetPasswordDao resetPasswordDao = new ResetPasswordDao();
		StudentStaffDataBean studentStaffDataBean = new StudentStaffDataBean();
		
		String userType = (String)session.getAttribute("userType");
		String email = (String)session.getAttribute("userMail");
		String password = request.getParameter("newPassword");
		String messageString = "";
		
		studentStaffDataBean.setEmail(email);
		studentStaffDataBean.setPassword(password);
		
		if(email != null ||  password !=null) {
			
			if(userType == "student" || userType.equals("student")) {
				 messageString =  resetPasswordDao.resetStudentPassword(studentStaffDataBean);
					session.invalidate();
					request.setAttribute("passwordStatus", messageString);
					request.setAttribute("userType", "student");
					request.getRequestDispatcher("resetpassword.jsp").forward(request, response);;

			}else if(userType == "staff" || userType.equals("staff")) {
				 messageString =  resetPasswordDao.resetStaffPassword(studentStaffDataBean);
					session.invalidate();
					request.setAttribute("passwordStatus", messageString);
					request.setAttribute("userType", "staff");
					request.getRequestDispatcher("resetpassword.jsp").forward(request, response);;
				
			}else if(userType == "admin" || userType.equals("admin")) {
				 messageString =  resetPasswordDao.resetadminPassword(studentStaffDataBean);
					session.invalidate();
					request.setAttribute("passwordStatus", messageString);
					request.setAttribute("userType", "admin");
					request.getRequestDispatcher("resetpassword.jsp").forward(request, response);;
				
			}	
		}
		
	}

}
