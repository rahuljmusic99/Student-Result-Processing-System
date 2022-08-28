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

@WebServlet("/DeleteDataServlet")
public class DeleteDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dataString = request.getParameter("Data");
		DeleteDataDao deleteDataDao = new DeleteDataDao();
		
		if(dataString!=null || dataString!="") {
			
			switch (dataString) {
			case "student":{ 
				StudentStaffDataBean studentDataBean = new StudentStaffDataBean();
				studentDataBean.setRegNo(request.getParameter("uniqueId"));
				
				String dataValidateString = deleteDataDao.deleteStudentData(studentDataBean) ;
				 
				request.setAttribute("deletionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);

			}case "staff":{
				StudentStaffDataBean staffDataBean = new StudentStaffDataBean();
				staffDataBean.setStaffId(request.getParameter("uniqueId"));
				
				String dataValidateString = deleteDataDao.deleteStaffData(staffDataBean);
				
				request.setAttribute("deletionMessage", dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
			}case "programme":{
				ProgrammeCourseClassBean programmeDataBean = new ProgrammeCourseClassBean();
				programmeDataBean.setProgrammeId(request.getParameter("uniqueId"));
				
				String dataValidateString = deleteDataDao.deleteProgrammeData(programmeDataBean) ;
				 
				request.setAttribute("deletionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
				
			}case "course":{
				ProgrammeCourseClassBean courseDataBean = new ProgrammeCourseClassBean();
				courseDataBean.setCourseCode(request.getParameter("uniqueId"));
				courseDataBean.setCourseName(request.getParameter("courseName"));
				
				String dataValidateString = deleteDataDao.deleteCourseData(courseDataBean) ;
				 
				request.setAttribute("deletionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);

			
			}case "class":{
				ProgrammeCourseClassBean classDataBean = new ProgrammeCourseClassBean();
				classDataBean.setClassId(request.getParameter("uniqueId"));
				
				String dataValidateString = deleteDataDao.deleteClassData(classDataBean) ;
				 
				request.setAttribute("deletionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
				
			}case "finalResult": {
				
				
			}case "firstInternalResult": {
				
				
			}case "secondInternalResult": {
				
				
			}default:{
				
				
			}	
			}
		}
	}
}