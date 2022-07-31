package org.CanaraExamManager.controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

import org.CanaraExamManager.bean.ResultBean;
import org.CanaraExamManager.dao.InternalDao;


@WebServlet("/InternalServlet")
public class InternalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String semesterString = (String) request.getParameter("semester");
		String userNameString = (String) request.getParameter("userName");
		
		ResultBean resultBean = new ResultBean();
		resultBean.setUserName(userNameString);
		resultBean.setSemester(semesterString);      
		
		InternalDao internalDao = new InternalDao();
		ResultSet resultSet = internalDao.getFirstInternal(resultBean);
		ResultSet resultSet2 = internalDao.getSecondInternal(resultBean);
		
		if(resultSet==null) {
			request.setAttribute("internalMarks", "empty");
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
		}else {
			request.setAttribute("firstInternal", resultSet);
			request.setAttribute("secondInternal", resultSet2);
			request.getRequestDispatcher("internalmarks.jsp").forward(request, response);
		}
	}

}
