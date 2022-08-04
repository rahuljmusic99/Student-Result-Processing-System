package org.CanaraExamManager.controler;

import org.CanaraExamManager.bean.*;
import org.CanaraExamManager.dao.InsertDataDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InsertDataServlet")
public class InsertDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dataString = request.getParameter("Data");
		InsertDataDao insertDataDao = new InsertDataDao();
		
		if(dataString!=null || dataString!="") {
			
			switch (dataString) {
			case "student": {
				
				StudentStaffDataBean studentDataBean = new StudentStaffDataBean();
				
				 studentDataBean.setfirstName(request.getParameter(""));//1
				 studentDataBean.setLastName(request.getParameter(""));//2
				 studentDataBean.setGender(request.getParameter(""));//3
				 studentDataBean.setDOB(request.getParameter(""));//4
				 studentDataBean.setEmail(request.getParameter(""));//5
				 studentDataBean.setPhone(request.getParameter(""));//6
				 studentDataBean.setAddress(request.getParameter(""));//7
				 studentDataBean.setPinCode(request.getParameter(""));//8
				 studentDataBean.setCity(request.getParameter(""));//9
				 studentDataBean.setDistrict(request.getParameter(""));//10
				 studentDataBean.setState(request.getParameter(""));//11
				 studentDataBean.setYear(request.getParameter(""));//12
				 studentDataBean.setProgramme(request.getParameter(""));//13
				 studentDataBean.setClass(request.getParameter(""));//14
				 studentDataBean.setCurrentSemester(request.getParameter(""));//15
				 studentDataBean.setRegNo(request.getParameter(""));//16
				 studentDataBean.setPassword(request.getParameter(""));//17
				 studentDataBean.setBloodGroup(request.getParameter(""));//18
				 
				 String dataValidateString = insertDataDao.insertStudentData(studentDataBean) ;
				 
				 request.setAttribute("insertionMessage",dataValidateString);
				 request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response); 
				
				 
			}case "staff": {
				
				StudentStaffDataBean staffDataBean = new StudentStaffDataBean();
				
				staffDataBean.setfirstName(request.getParameter(""));//1
				staffDataBean.setLastName(request.getParameter(""));//2
				staffDataBean.setGender(request.getParameter(""));//3
				staffDataBean.setDOB(request.getParameter(""));//4
				staffDataBean.setEmail(request.getParameter(""));//5
				staffDataBean.setPhone(request.getParameter(""));//6
				staffDataBean.setAddress(request.getParameter(""));//7
				staffDataBean.setBloodGroup(request.getParameter(""));//8
				staffDataBean.setPassword(request.getParameter(""));//9
				
				String dataValidateString = insertDataDao.insertStaffData(staffDataBean) ;
				 
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
			}case "programme": {
				
				ProgrammeCourseClassBean programmeBean = new ProgrammeCourseClassBean();
				
				programmeBean.setProgrammeId(request.getParameter("programmeId"));//1
				programmeBean.setProgrammeName(request.getParameter("programmeName"));//2
				programmeBean.setProgrammeDuration(request.getParameter("duration"));//3;
				programmeBean.setSemester(request.getParameter("totalSemester"));//4
				
				String dataValidateString = insertDataDao.insertProgrammeData(programmeBean);
				
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
			}case "course": {
				
				ProgrammeCourseClassBean courseDataBean = new ProgrammeCourseClassBean();
				
				courseDataBean.setProgrammeName(request.getParameter(""));//1
				courseDataBean.setCourseCode(request.getParameter(""));//2
				courseDataBean.setCourseName(request.getParameter(""));//3
				courseDataBean.setCourseType(request.getParameter(""));//4
				courseDataBean.setCourseGroup(request.getParameter(""));//5
				courseDataBean.setSemester(request.getParameter(""));//6
				courseDataBean.setMaxMarks(request.getParameter(""));//7
				courseDataBean.setMinMarks(request.getParameter(""));//8
				courseDataBean.setMaxIA(request.getParameter(""));//9
				
				String dataValidateString = insertDataDao.insertCourseData(courseDataBean);
				 
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
				
			}case "class": {
				
				ProgrammeCourseClassBean classDataBean = new ProgrammeCourseClassBean();
				
				classDataBean.setClassId(request.getParameter(""));
				classDataBean.setClassName(request.getParameter(""));
				classDataBean.setProgrammeName(request.getParameter(""));
				classDataBean.setClassYear(request.getParameter(""));
				
				
				String dataValidateString = insertDataDao.insertProgrammeData(classDataBean);
				 
				request.setAttribute("insertionMessage",dataValidateString);
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

