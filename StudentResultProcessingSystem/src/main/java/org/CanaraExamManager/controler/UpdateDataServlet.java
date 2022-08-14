package org.CanaraExamManager.controler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.dao.UpdateDataDao;

@WebServlet("/UpdateDataServlet")
public class UpdateDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dataString = request.getParameter("Data");
		UpdateDataDao updateDataDao = new UpdateDataDao();
		
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
				
				 String dataValidateString = updateDataDao.updateStudentData(studentDataBean) ;
				 
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
				
				String dataValidateString = updateDataDao.updateStaffData(staffDataBean) ;
				 
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
			}case "programme": {
				
				ProgrammeCourseClassBean programmeBean = new ProgrammeCourseClassBean();
				
				programmeBean.setProgrammeId(request.getParameter("programmeId").trim());//1
				programmeBean.setProgrammeName(request.getParameter("programmeName").trim());//2
				programmeBean.setProgrammeDuration(request.getParameter("duration").trim());//3;
				programmeBean.setSemester(request.getParameter("totalSemester").trim());//4
				
				String dataValidateString = updateDataDao.updateProgrammeData(programmeBean);
				
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
		
				String dataValidateString = updateDataDao.updateCourseData(courseDataBean);
				 
				request.setAttribute("insertionMessage",dataValidateString);
				request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				
				
			}case "class": {
				
				ProgrammeCourseClassBean classDataBean = new ProgrammeCourseClassBean();
				
				classDataBean.setClassId(request.getParameter("classId").trim());
				classDataBean.setClassName(request.getParameter("className").trim());
				classDataBean.setProgrammeName(request.getParameter("programmeNameInClass").trim());
				classDataBean.setClassYear(request.getParameter("classYear").trim());
				
				String dataValidateString = updateDataDao.updateClassData(classDataBean);
				 
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


