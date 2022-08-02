package org.CanaraExamManager.controler;

import org.CanaraExamManager.bean.*;
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
				 studentDataBean.setBloodGroup(request.getParameter(""));
				 
				 
				
			}case "staff": {
				
				
			}case "programme": {
				
				
			}case "course": {
				
				
			}case "class": {
				
				
			}case "finalResult": {
				
				
			}case "firstInternalResult": {
				
				
			}case "secondInternalResult": {
				
				
			}default:{
				
				
			}
			
			}
			
		}
		
	}

}

