package org.CanaraExamManager.controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.dao.DeleteDataDao;
import org.CanaraExamManager.dao.InsertDataDao;


public class DeleteDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dataString = request.getParameter("Data");
		DeleteDataDao deleteDataDao = new DeleteDataDao();
		
		if(dataString!=null || dataString!="") {
			
			switch (dataString) {
			case "student":{ 
				StudentStaffDataBean studentDataBean = new StudentStaffDataBean();
				studentDataBean.setfirstName(request.getParameter(""));//1
				studentDataBean.setLastName(request.getParameter(""));//2
				studentDataBean.setRegNo(request.getParameter(""));
				
				String dataValidateString = deleteDataDao.deleteStudentData(studentDataBean) ;
				 
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);

			}case "staff":{
				StudentStaffDataBean staffDataBean = new StudentStaffDataBean();
				staffDataBean.setfirstName(request.getParameter(""));
				staffDataBean.setLastName(request.getParameter(""));//2
				staffDataBean.setStaffId(dataString);
				
			}case "programme":{
				ProgrammeCourseClassBean programmeDataBean = new ProgrammeCourseClassBean();
				programmeDataBean.setProgrammeName("");
				programmeDataBean.setProgrammeId("");
				
				
			}case "course":{
				ProgrammeCourseClassBean courseDataBean = new ProgrammeCourseClassBean();
				courseDataBean.setCourseCode("");
				courseDataBean.setCourseName("");
				courseDataBean.setProgrammeId("");
			
			}case "class":{
				ProgrammeCourseClassBean classDataBean = new ProgrammeCourseClassBean();
				classDataBean.setClassName("");
				classDataBean.setClassId("");
				classDataBean.setClassYear("");
				
			}case "finalResult": {
				
				
			}case "firstInternalResult": {
				
				
			}case "secondInternalResult": {
				
				
			}default:{
				
				
			}	
			}
		}
	}
}