package org.CanaraExamManager.controler;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.dao.ForgotPasswordDao;
import org.CanaraExamManager.util.EmaiUtility;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emailString = request.getParameter("userEmail");
		int otpValue = 0;
		HttpSession session = request.getSession();
		StudentStaffDataBean studentStaffDataBean = new StudentStaffDataBean();
		ForgotPasswordDao forgotPasswordDao = new ForgotPasswordDao();
		String messageString = null;
		String user = request.getParameter("userData");
		
		if(user == "student" || user.equals("student")) {
			System.out.println(emailString);
			studentStaffDataBean.setEmail(emailString);
			messageString =  forgotPasswordDao.authenticateStudent(studentStaffDataBean);
			
			if(messageString == "SUCCESS" || messageString.equals("SUCCESS")) {
				Random random = new Random();
				otpValue = Integer.parseInt(String.format("%06d", random.nextInt(999999)));
				
				try {
					EmaiUtility.sendEmail(studentStaffDataBean.getEmail().trim(), "CanaraExamManager: OTP To Reset Your Password", 
							"OTP is:"+otpValue+"");
				} catch (AddressException e) {

					e.printStackTrace();
				} catch (MessagingException e) {

					e.printStackTrace();
				}
				
				session.setAttribute("otp", otpValue);
				session.setAttribute("userMail", studentStaffDataBean.getEmail().trim());
				session.setAttribute("userType", user);
				
				response.sendRedirect("otpverification.jsp");
				
			}else {
				request.setAttribute("errorMessage", messageString);
				request.setAttribute("userType", user);
				request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
			}
			
		}else if(user == "staff" || user.equals("staff")){
			studentStaffDataBean.setEmail(emailString);
			messageString =  forgotPasswordDao.authenticateStaff(studentStaffDataBean);
			
			if(messageString == "SUCCESS" || messageString.equals("SUCCESS")) {
				Random random = new Random();
				otpValue = Integer.parseInt(String.format("%06d", random.nextInt(999999)));
				
				try {
					EmaiUtility.sendEmail(studentStaffDataBean.getEmail(), "CanaraExamManager: OTP To Reset Your Password", 
							"OTP is:"+otpValue+"");
				} catch (AddressException e) {

					e.printStackTrace();
				} catch (MessagingException e) {

					e.printStackTrace();
				}
				
				session.setAttribute("otp", otpValue);
				session.setAttribute("userMail", studentStaffDataBean.getEmail().trim());
				session.setAttribute("userType", user);
				
				response.sendRedirect("otpverification.jsp");
				
			}else {
				
				request.setAttribute("errorMessage", messageString);
				request.setAttribute("userType",user);
				request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
			}
			
		}else if(user == "admin" || user.equals("admin")) {
			studentStaffDataBean.setEmail(emailString);
			messageString =  forgotPasswordDao.authenticateAdmin(studentStaffDataBean);
			
			if(messageString == "SUCCESS" || messageString.equals("SUCCESS")) {
				Random random = new Random();
				otpValue = Integer.parseInt(String.format("%06d", random.nextInt(999999)));
				
				try {
					EmaiUtility.sendEmail(studentStaffDataBean.getEmail(), "CanaraExamManager: OTP To Reset Your Password", 
							"OTP is:"+otpValue+"");
				} catch (AddressException e) {

					e.printStackTrace();
				} catch (MessagingException e) {

					e.printStackTrace();
				}
				
				session.setAttribute("otp", otpValue);
				session.setAttribute("userMail", studentStaffDataBean.getEmail().trim());
				session.setAttribute("userType", user);
				
				response.sendRedirect("otpverification.jsp");
				
			}else {
				request.setAttribute("errorMessage", messageString);
				request.setAttribute("userType",user);
				request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
			}
			
		}
		
		
	}

}
