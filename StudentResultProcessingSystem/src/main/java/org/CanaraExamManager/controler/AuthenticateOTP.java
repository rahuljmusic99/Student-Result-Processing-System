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
		
		int userOtpValue = Integer.parseInt(request.getParameter(""));
		int otpValue = (int)session.getAttribute("otp");
		
		if(userOtpValue == otpValue) {
			session.setAttribute("otpStatus", "SUCCESS");
			response.sendRedirect("");
			
		}else {

			request.setAttribute("errorMessage", "Wrog OTP");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
			requestDispatcher.forward(request, response);
		}
		
	}

}
