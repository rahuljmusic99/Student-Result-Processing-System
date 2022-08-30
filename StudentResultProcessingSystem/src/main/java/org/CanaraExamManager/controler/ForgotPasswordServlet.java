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

@WebServlet("/ForgotPassword")
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
		
		if(user == "student") {
			studentStaffDataBean.setEmail(emailString);
			messageString =  forgotPasswordDao.authenticateStudent(studentStaffDataBean);
			
			if(messageString == "SUCCESS" || messageString.equals("SUCCESS")) {
				Random random = new Random();
				otpValue = Integer.parseInt(String.format("%06d", random.nextInt(999999)));
				
				try {
					EmaiUtility.sendEmail(studentStaffDataBean.getEmail(), "CanaraExamManager: OTP To Reset Your Password", 
							"");
				} catch (AddressException e) {

					e.printStackTrace();
				} catch (MessagingException e) {

					e.printStackTrace();
				}
				
				session.setAttribute("otp", otpValue);
				session.setAttribute("userData", user);
				
				response.sendRedirect("");
			}
			
		}else if(user == "staff"){
			studentStaffDataBean.setEmail(emailString);
			messageString =  forgotPasswordDao.authenticateStaff(studentStaffDataBean);
			
			if(messageString == "SUCCESS" || messageString.equals("SUCCESS")) {
				Random random = new Random();
				otpValue = Integer.parseInt(String.format("%06d", random.nextInt(999999)));
				
				try {
					EmaiUtility.sendEmail(studentStaffDataBean.getEmail(), "CanaraExamManager: OTP To Reset Your Password", 
							"");
				} catch (AddressException e) {

					e.printStackTrace();
				} catch (MessagingException e) {

					e.printStackTrace();
				}
				
				session.setAttribute("otp", otpValue);
				session.setAttribute("userData", user);
				
				response.sendRedirect("");
			}
			
		}else if(user == "admin") {
			studentStaffDataBean.setEmail(emailString);
			messageString =  forgotPasswordDao.authenticateAdmin(studentStaffDataBean);
			
			if(messageString == "SUCCESS" || messageString.equals("SUCCESS")) {
				Random random = new Random();
				otpValue = Integer.parseInt(String.format("%06d", random.nextInt(999999)));
				
				try {
					EmaiUtility.sendEmail(studentStaffDataBean.getEmail(), "CanaraExamManager: OTP To Reset Your Password", 
							"");
				} catch (AddressException e) {

					e.printStackTrace();
				} catch (MessagingException e) {

					e.printStackTrace();
				}
				
				session.setAttribute("otp", otpValue);
				session.setAttribute("userData", user);
				
				response.sendRedirect("");
			}
			
		}
		
		
	}

}
