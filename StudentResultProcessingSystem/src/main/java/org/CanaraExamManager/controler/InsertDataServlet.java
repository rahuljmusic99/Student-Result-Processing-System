package org.CanaraExamManager.controler;

import org.CanaraExamManager.bean.*;
import org.CanaraExamManager.dao.InsertDataDao;
import org.CanaraExamManager.util.EmaiUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.Console;
import java.io.IOException;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

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
				 String mailValidateString = "";
				 
				 if(dataValidateString == "SUCCESS") {
					 
					String toAddressString = studentDataBean.getEmail();
					String subjectString = "Invitation to join CanaraExamPortal";
					String messageString = "<div style=\"background-color:black;color:white;padding:4rem;margin:1rem;\">\r\n"
							+ "<div style=\"background-color: black;width: 100%;height: 100%;\"><img src=\"https://lh3.googleusercontent.com/C7R0Hy-Nq-5qll7kg-PO5evyTybIddUipmiHK2QGqsa2eJgpnweY3FXOJBgLrLOTmjibHchSnTHmk9OPL4ql3ajoRPIlPE8rFklPuJsxVNcGBm75haBGc75jH7GXvs3Mmsq_gZXOew=w2400\" style=\"width:100%;height:100%;\"></div>\r\n"
							+ "<h3 style=\"color:#e591c3;font-size: 25px;\">Dear "+studentDataBean.getfirstName().trim()+" "+studentDataBean.getLastName().trim()+"</h3><br/>\r\n"
							+ "<p style=\"font-size: 20px;font-family:sans-serif\">Welcome to <span style=\"color:skyblue\">CanaraExamPortal</span>, a website created by WEB-CENTRIC for CANARACOLLEGE</p><br/>\r\n"
							+ "<p style=\"font-size: 18px;font-family:sans-serif\">The key intent for this initiative is to support students of CANARACOLLEGE to improve their academic performance, \"\r\n"
							+ "providing students with a user friendly interface to view semester and internal results.  Students can also analyse their\"\r\n"
							+ "academic performance through intensive graphical charts and metrics, which will help you to with your academic performance.</p><br/>\r\n"
							+ "<p style=\"color:#e591c3;font-size: 27px;text-align: center;font-weight: 800\">2 Easy Steps To Get Started</p>\r\n"
							+ "<p style=\"text-align: center;font-size: 16px\">1. Click on the button below to sign in using the following credentials</p>\r\n"
							+ "<p style=\"text-align: center;font-size: 20px;\">Username:<span>"+studentDataBean.getRegNo().trim()+"</span></p>\r\n"
							+ "<p style=\"text-align: center;font-size: 20px;\">Password:<span>"+studentDataBean.getPassword()+"</span></p><br>\r\n"
							+ "<p style=\"text-align: center;font-size: 16px;\">2. Once you're on the platform, you can change your password</p><br>\r\n"
							+ "<div style=\"display: flex;justify-content: center;align-items: center;\"><button style=\"color:white;background-color:orangered;font-size:3vh;padding:1rem;font-weight:700;border-radius:8px;\">Get Started</button></div>\r\n"
							+ "</div>";
					
					
					try {
						mailValidateString = EmaiUtility.sendEmail(toAddressString,subjectString,messageString);
					} catch (AddressException e) {
						e.printStackTrace();
					} catch (MessagingException e) { 
						e.printStackTrace();
					}	
				
					if(mailValidateString == "SUCCESS") {	
						request.setAttribute("insertionMessage", "SUCCESS" );
						request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response); 
					
					 }else {
						 request.setAttribute("insertionMessage","Inserted Data successfully" + " but Mail not sent! Please check the Email Id");
						 request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
					 }
				 }else {
					 
					 request.setAttribute("insertionMessage",dataValidateString);
					 request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				 }
				
				
				  
			}case "staff": {
				
				StudentStaffDataBean staffDataBean = new StudentStaffDataBean();
				
				staffDataBean.setfirstName(request.getParameter("firstName"));//1
				staffDataBean.setLastName(request.getParameter("lastName"));//2
				staffDataBean.setGender(request.getParameter("gender"));//3/
				staffDataBean.setEmail(request.getParameter("email"));//4
				staffDataBean.setPhone(request.getParameter("phone"));//5
				staffDataBean.setAddress(request.getParameter("address"));//6
				staffDataBean.setStaffId(request.getParameter("staffId"));//7
				staffDataBean.setPassword(request.getParameter("password"));//8
				staffDataBean.setProgramme(request.getParameter("programmeId"));//9
				staffDataBean.setRole(request.getParameter("staffRole"));
				
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
				int courseCount = Integer.parseInt(request.getParameter("numberOfCourses"));
				System.out.println(courseCount);
				if(courseCount >= 1) {
					ResultBean resultBean = new ResultBean();
					resultBean.setArraySize(courseCount);
					resultBean.setUserName((String)request.getParameter("regNo"));
					resultBean.setProgrammeId((String)request.getParameter("programmeId"));
					resultBean.setSemester((String)request.getParameter("semester"));
					resultBean.setExamMonth((String)request.getParameter("examMonth"));
					resultBean.setExamYear(request.getParameter("examYear"));
					resultBean.setResultDate(request.getParameter("resultDate"));
					int ttCourse = Integer.parseInt(request.getParameter("ttCourse"));
					int indexCount = 0;
					System.out.println(ttCourse);
					for(int i = 1;i<=ttCourse;i++) {
						
						System.out.println(request.getParameter("obtained"+i));
						if(request.getParameter("obtained"+i) != "" || !request.getParameter("obtained"+i).equals("")){
							resultBean.setObtainedMarks(Integer.parseInt(request.getParameter("obtained"+i)), indexCount);	
							resultBean.setIAMarks(Integer.parseInt(request.getParameter("ia"+i)), indexCount);
							resultBean.setCredit(Integer.parseInt(request.getParameter("credit"+i)), indexCount);
							resultBean.setMaxMarks(Integer.parseInt(request.getParameter("maxMarks"+i)), indexCount);
							resultBean.setMinMarks(Integer.parseInt(request.getParameter("minMarks"+i)), indexCount);
							resultBean.setCourseCode(request.getParameter("courseCode"+i), indexCount);
							resultBean.setMaxIA(Integer.parseInt(request.getParameter("maxIA"+i)), indexCount);
							indexCount++;
						}

						
					}
					String dataValidateString = insertDataDao.insertFinalMarks(resultBean);
					 
					request.setAttribute("insertionMessage",dataValidateString);
					request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				}
				
				
			}case "firstInternal": {
				int courseCount = Integer.parseInt(request.getParameter("numberOfCourses"));
				System.out.println(courseCount);
				if(courseCount >= 1) {
					ResultBean resultBean = new ResultBean();
					resultBean.setArraySize(courseCount);
					resultBean.setUserName((String)request.getParameter("regNo"));
					resultBean.setProgrammeId((String)request.getParameter("programmeId"));
					resultBean.setSemester((String)request.getParameter("semester"));
					resultBean.setExamMonth((String)request.getParameter("examMonth"));
					resultBean.setExamYear(request.getParameter("examYear"));
					resultBean.setResultDate(request.getParameter("resultDate"));
					int ttCourse = Integer.parseInt(request.getParameter("ttCourse"));
					int indexCount = 0;
					System.out.println(ttCourse);
					for(int i = 1;i<=ttCourse;i++) {
						
						System.out.println(request.getParameter("obtained"+i));
						if(request.getParameter("obtained"+i) != "" || !request.getParameter("obtained"+i).equals("")){
							resultBean.setObtainedMarks(Integer.parseInt(request.getParameter("obtained"+i)), indexCount);	
							resultBean.setMaxMarks(Integer.parseInt(request.getParameter("max"+i)), indexCount);
							resultBean.setMinMarks(Integer.parseInt(request.getParameter("min"+i)), indexCount);
							resultBean.setCourseCode(request.getParameter("courseCode"+i), indexCount);
							System.out.println(request.getParameter("courseCode"+i));
							indexCount++;
						}

						
					}
					String dataValidateString = insertDataDao.insertFirstInternal(resultBean);
					 
					request.setAttribute("insertionMessage",dataValidateString);
					request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				}
				
				
			}case "secondInternal": {
				int courseCount = Integer.parseInt(request.getParameter("numberOfCourses"));
				System.out.println(courseCount);
				if(courseCount >= 1) {
					ResultBean resultBean = new ResultBean();
					resultBean.setArraySize(courseCount);
					resultBean.setUserName((String)request.getParameter("regNo"));
					resultBean.setProgrammeId((String)request.getParameter("programmeId"));
					resultBean.setSemester((String)request.getParameter("semester"));
					resultBean.setExamMonth((String)request.getParameter("examMonth"));
					resultBean.setExamYear(request.getParameter("examYear"));
					resultBean.setResultDate(request.getParameter("resultDate"));
					int ttCourse = Integer.parseInt(request.getParameter("ttCourse"));
					int indexCount = 0;
					System.out.println(ttCourse);
					for(int i = 1;i<=ttCourse;i++) {
						
						System.out.println(request.getParameter("obtained"+i));
						if(request.getParameter("obtained"+i) != "" || !request.getParameter("obtained"+i).equals("")){
							resultBean.setObtainedMarks(Integer.parseInt(request.getParameter("obtained"+i)), indexCount);	
							resultBean.setMaxMarks(Integer.parseInt(request.getParameter("max"+i)), indexCount);
							resultBean.setMinMarks(Integer.parseInt(request.getParameter("min"+i)), indexCount);
							resultBean.setCourseCode(request.getParameter("courseCode"+i), indexCount);
							System.out.println(request.getParameter("courseCode"+i));
							indexCount++;
						}

						
					}
					String dataValidateString = insertDataDao.insertSecondInternal(resultBean);
					 
					request.setAttribute("insertionMessage",dataValidateString);
					request.getRequestDispatcher("messageConfirmer.jsp").forward(request, response);
				}
				
				
			}default:{
				response.sendRedirect("home.jsp");
				
			}
			
			}
			
		}
		
	}

}

