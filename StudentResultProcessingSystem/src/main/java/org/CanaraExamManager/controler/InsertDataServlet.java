package org.CanaraExamManager.controler;

import org.CanaraExamManager.bean.*;
import org.CanaraExamManager.dao.InsertDataDao;
import org.CanaraExamManager.util.DateFormatConvertor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

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
				
				 studentDataBean.setfirstName(request.getParameter("sFirstName"));//1
				 studentDataBean.setLastName(request.getParameter("sLastName"));//2
				 studentDataBean.setGender(request.getParameter("sGender"));//3				 
				 studentDataBean.setDOB(request.getParameter("sdob"));//4
				 studentDataBean.setEmail(request.getParameter("sEmail"));//5
				 studentDataBean.setPhone(request.getParameter("sPhone"));//6
				 studentDataBean.setAddress(request.getParameter("sAddress"));//7
				 studentDataBean.setPinCode(request.getParameter("sPincode"));//8
				 studentDataBean.setCity(request.getParameter("sCity"));//9
				 studentDataBean.setDistrict(request.getParameter("sDistrict"));//10
				 studentDataBean.setState(request.getParameter("sState"));//11
				 studentDataBean.setYear(request.getParameter("sYearOfJoining"));//12
				 studentDataBean.setProgramme(request.getParameter("sProgramme"));//13
				 studentDataBean.setClass(request.getParameter("sClass"));//14
				 studentDataBean.setCurrentSemester(request.getParameter("sSemester"));//15
				 studentDataBean.setRegNo(request.getParameter("sRegNo"));//16
				 studentDataBean.setPassword(request.getParameter("sPassword"));//17
				 studentDataBean.setClassYear(request.getParameter("sClassYear"));//18
	 
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
				staffDataBean.setPassword(request.getParameter(""));//9
				
				String dataValidateString = insertDataDao.insertStaffData(staffDataBean) ;
				 
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
			}case "programme": {
				
				ProgrammeCourseClassBean programmeBean = new ProgrammeCourseClassBean();
				
				programmeBean.setProgrammeId(request.getParameter("programmeId").trim());//1
				programmeBean.setProgrammeName(request.getParameter("programmeName").trim());//2
				programmeBean.setProgrammeDuration(request.getParameter("duration").trim());//3;
				programmeBean.setSemester(request.getParameter("totalSemester").trim());//4
				
				String dataValidateString = insertDataDao.insertProgrammeData(programmeBean);
				
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
			}case "course": {
				
				ProgrammeCourseClassBean courseDataBean = new ProgrammeCourseClassBean();
				
				courseDataBean.setProgrammeId(request.getParameter("programmeIdInCourse").trim());
				courseDataBean.setCourseCode(request.getParameter("courseCode").trim());//2
				courseDataBean.setCourseName(request.getParameter("courseName").trim());//3
				courseDataBean.setCourseType(request.getParameter("courseType").trim());//4
				courseDataBean.setCourseGroup(request.getParameter("courseGroup").trim());//5
				courseDataBean.setSemester(request.getParameter("courseSemester").trim());//6
				courseDataBean.setMaxMarks(request.getParameter("maxMarks").trim());//7
				courseDataBean.setMinMarks(request.getParameter("minMarks").trim());//8
				courseDataBean.setMaxIA(request.getParameter("maxIA").trim());//9
		
				String dataValidateString = insertDataDao.insertCourseData(courseDataBean);
				 
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
				
			}case "class": {
				
				ProgrammeCourseClassBean classDataBean = new ProgrammeCourseClassBean();
				
				classDataBean.setClassId(request.getParameter("classId").trim());
				classDataBean.setClassName(request.getParameter("className").trim());
				classDataBean.setProgrammeName(request.getParameter("programmeNameInClass").trim());
				classDataBean.setClassYear(request.getParameter("classYear").trim());
				
				String dataValidateString = insertDataDao.insertClassData(classDataBean);
				 
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

