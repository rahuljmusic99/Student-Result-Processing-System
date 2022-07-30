package org.CanaraExamManager.controler;

import org.CanaraExamManager.bean.ResultBean;
import org.CanaraExamManager.dao.ResultDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String semesterString = (String) request.getParameter("semester");
		String userNameString = (String) request.getParameter("userName");
		
		ResultBean resultBean = new ResultBean();
		resultBean.setUserName(userNameString);
		resultBean.setSemester(semesterString);        
		
		ResultDao resultDao = new ResultDao();
		ResultSet resultSet = resultDao.getResult(resultBean);
		
		if(resultSet==null) {
			request.setAttribute("semesterMarks", "empty");
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
		}else {
			request.setAttribute("semesterMarks", resultSet);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		
	}
}
