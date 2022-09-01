package org.CanaraExamManager.controler;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/AuthenticateOTP")
public class AuthenticateOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userEmail = (String)session.getAttribute("userMail");
		String userType = (String)session.getAttribute("userType");
		String userOtpValue = "";
		for(int i=1; i<=6; i++) {
			userOtpValue = userOtpValue + request.getParameter("digit-"+i);		
		}
	
		int otpValue = (int)session.getAttribute("otp");
		if(Integer.parseInt(userOtpValue) == otpValue) {
			session.invalidate();
			HttpSession session2 = request.getSession(); 
			session2.setAttribute("otpStatus", "SUCCESS");
			session2.setAttribute("userType", userType);
			session2.setAttribute("userMail", userEmail);
			response.sendRedirect("resetpassword.jsp");
			
		}else {

			request.setAttribute("errorMessage", "Invalid OTP !");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("otpverification.jsp");
			requestDispatcher.forward(request, response);
		}
		
	}

}
