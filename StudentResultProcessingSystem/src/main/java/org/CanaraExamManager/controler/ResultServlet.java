package org.CanaraExamManager.controler;

import org.CanaraExamManager.bean.ResultBean;
import org.CanaraExamManager.dao.ResultDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;


@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String semesterString = (String) request.getParameter("semester");
		String userNameString = (String) request.getParameter("userName");
		String studentNameString = (String) request.getParameter("studentName");
		String programmeNameString = (String) request.getParameter("programmeName");
		
		ResultBean resultBean = new ResultBean();
		resultBean.setUserName(userNameString);
		resultBean.setSemester(semesterString);

		ResultDao resultDao = new ResultDao();
		ResultSet resultSet = resultDao.getResult(resultBean);
		
		if(resultSet!=null) {
			request.setAttribute("semesterMarks", resultSet);
			request.setAttribute("studentName", studentNameString);
			request.setAttribute("registerNo", userNameString);
			request.setAttribute("programmeName",programmeNameString);
			request.getRequestDispatcher("finalmarks.jsp").forward(request, response);	
			
		}else {

			HttpSession session = request.getSession();
			String loginUser = (String) session.getAttribute("UserLogin");
			request.setAttribute("resultError", "No Data Found!" );
			
			if(loginUser == "StudentLogin") {
				request.getRequestDispatcher("studdashboard.jsp").forward(request,response);
				
			}else if(loginUser == "StaffLogin") {
				request.getRequestDispatcher("staffdashboard.jsp").forward(request,response);
				
			}else if(loginUser == "AdminLogin") {
				request.getRequestDispatcher("admindashboard.jsp").forward(request,response);
			}
		}
		
	}
}
