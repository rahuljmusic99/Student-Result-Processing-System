<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.CanaraExamManager.util.DBConnection" %>
<%@page import="org.CanaraExamManager.dao.LoadDataDao" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
    
<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	//In case, if User session is not set, redirect to Login page.
	if((request.getSession(false).getAttribute("staff")== null) )
	{
%> 
<jsp:forward page="/stafflogin.jsp"></jsp:forward>
<%} %>   

<%request.getAttribute("username");%>

<%
String programmeId = "";
String staffRole = "";
if((request.getSession(false).getAttribute("staff")!= null) )
{
	programmeId = (String)session.getAttribute("staffProgramme");	
	staffRole = (String)session.getAttribute("staffrole");

}

	LoadDataDao loadData = new LoadDataDao(); 
	ResultSet programmeResultSet = loadData.loadProgrammeData();
	 
%>

<!DOCTYPE html5>
<html>
    <head>
        <title>Staff Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/staffdashboard.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/dashboard.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://kit.fontawesome.com/dd03fdb332.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
      	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
    
    </head> 
    <body>
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><div class="space4"><img src="css/images/sf.png" class="edu"></div><p>Canara exam manager</p></div>
                <button class="tabs__button" data-for-tab="4" id="mainprofile">
                <div class="holder3"><img src="css/images/seenu.jpg" class="profimg"></div>
                <p>NAME</p>
                </button>
                <button class="tabs__button tabs__button--active" id="tab1" data-for-tab="1"><i class="fa-solid fa-house-chimney"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa-sharp fa-solid fa-landmark"></i>Classes</button>
                <button class="tabs__button" data-for-tab="3" ><i class="fa-regular fa-clipboard"></i>Student Result</button>
                <button onclick="logoutConfirm();" class="tabs__button"><i class="fa-sharp fa-solid fa-right-from-bracket"></i>Logout</button>
            </div>
    
            
            
            <div class="tabs__content" data-tab="1">
                <div class="imgholder"> <img src="css/images/canlogos.png" class="logos"></div>
                    <img  src="" id="image">
                    <div class="about">
                    <h3 class="about__title">About</h3><br>
                    <p class="about__p">
                    Canara College with its noble vision to prepare educationally strong and culturally vibrant students is a prestigious institute for higher learning, well acclaimed to have its deep rooted existence since 1973 with its moral ideals, rich core values and fusion of cultural ethos; pioneered by a great legendary soul, Late Sri Ammembal Subba Rao Pai. It has a glorious history and legacy in the field of imparting value-based, character building education to its aspirants. True to its motto of “Educating for Righteous Life” and philosophy of commitment towards offering quality education at affordable cost, it is located centrally in the coastal educational hub of Mangaluru city. The institution is governed and managed by Canara High School Association, Mangaluru, reaccredited by NAAC and affiliated to Mangalore University.<br><br><br>

                    It offers undergraduate programmes in Commerce (B.Com.), Bachelor of Commerce Professoinal with Coaching for CA and CS, Bachelor of Science [B.Sc. (PCM, PMC and BZC)], Bachelor of Computer Applications (B.C.A.), Bachelor of Business Administration (B.B.A.) and a post graduate programme in Commerce (M.Com.).
                    </p>
                    </div>
                    
                
                    <footer>
                      <div class="foot">
                        <img src="css/images/canlogo.png" class="footlogo">
                        <div class="footpart1">
                        <h1 class="heads1">CANARA COLLEGE</h1>
                        <p class="pr2">Address:</p>
                        <p class="pr1">Mahatma Gandhi-Road Kodialbail, Mangalore-575003, Dakshina Kannada District, Karnataka</p>
                        <p class="pr1">Phone: 0824-2492366</p>
                        <p class="pr1">E-mail: <u>cnrcollege@yahoo.com</u></p>
                        <div class="web"><a href="https://www.canaracollege.com/" target="_blank"><div class="gb"><i class="fa-solid fa-globe"></i></div></a><a href="https://www.facebook.com/canaracollegemangaluru/" target="_blank"><div class="fc"><i class="fa-brands fa-facebook"></i></div></a><a href="https://www.instagram.com/canara.college_official/?hl=en" target="_blank">
                        <div class="ig"><i class="fa-brands fa-instagram"></i></div></a><a href="https://www.youtube.com/channel/UCtXf_eLGN1nT1dDo1-wk5yg" target="_blank"><div class="yt"><i class="fa-brands fa-youtube"></i></div></a></div>
                        </div>
                          
                        <div class="footpart2">
                        <h1 class="heads2">Developed By :</h1>
                        <div class="names">
                        <li class="pr1"><a href="https://github.com/rahuljmusic99" target="_blank"><i class="fa-brands fa-github"></i>Rahul. J</a></li>
                        <li class="pr1"><a href="https://github.com/seenuvasan2051" target="_blank"><i class="fa-brands fa-github"></i>Seenu Vasan</a></li>
                        <li class="pr1"><a href="https://github.com/Deeraj212" target="_blank"><i class="fa-brands fa-github"></i>Deeraj. S</a></li>
                        </div>
                        <h1 class="heads2">Under The Guidance of :</h1>
                        <div class="names">
                        <li class="pr1">Rakshitha. R</li>
                        
                        </div>
                        </div>
                      </div>
                </footer>
              
            </div>
            
            
            
            
            <div class="tabs__content" data-tab="2">
                 <div class="protab"> 
                    <h4>Class Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Class list</h6>
                        </div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
                            <th>Programme Name</th>
                            <th>Class Name</th>
                            <th>Class Year</th>
                        </tr>
                        <%
            
            			try{
            		
							ResultSet classData = loadData.loasStaffClasses(programmeId);	
            		
							if(classData!=null){
                				while(classData.next()){
                			
            			%>	  
                        <tr>
                            <td class="td1"><%=classData.getString("programme_name")%></td>   
                            <td class="td2"><%=classData.getString("class_name")%></td>   
                            <td class="td5"><%=classData.getString("class_year")%></td>
                        </tr>
                        <% 		
			                	}	
			                }	
			               	}catch(SQLException e){}
            
            			%>   
                    </table>
                    </div>
                </div>
                </div>   
           
            
            
            <div class="tabs__content" data-tab="3">
            <div class="protab"> 
            <h4>Student Result Management</h4>
            <div class="inner__protab">
            <div class="inner1"><h6 class="left">Student Result</h6>
            <select class="select2">
            <option value="" disabled selected hidden>Class</option>
            <option>  </option>
            </select>
            </div>
            
            
            
            
            <form action="ResultServlet" method="post" id="semesterForm">
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="">
            	         <input name="studentName" type="hidden" value=""/>
            	         <input name="programmeName" type="hidden" value=""/>
			</form>
			<form action="InternalServlet" method="post" id=internalForm>
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="">
            	         <input name="studentName" type="hidden" value=""/>
            	         <input name="programmeName" type="hidden" value=""/>
			</form>   
            <table id="showStudentTable" border="1" class="tb1" cellspacing="0" padding="10" rules="all">
            <tr>
                <th>Programme</th>
                <th>Class</th>
                <th>Student Name</th>
                <th>Register Number</th>
                <th id="addTitle">Add Result</th>
                <th>View Result</th>
                <th id="actionTitle">Action</th>
            </tr>   
            <%
            
            	try{
            		
					ResultSet studentData = loadData.loadStaffClasses(programmeId);	
            		
					if(studentData!=null){
						int i = 1;
                		while(studentData.next()){
                			
            %>	       
           <tr>
              <td class="td1"><%=studentData.getString("programme_name")%></td>   <!--Programme -->
              <td class="td2"><%=studentData.getString("class_name")%></td>   <!--class-->
              <td><%=studentData.getString("first_name") +" "+ studentData.getString("last_name")%></td>   <!--Student Name-->
              <td><%=studentData.getString("reg_no")%></td>   <!--Register number-->
              <td class="td1 addclass"><button class="btn__course" id="btn__course<%=i%>" onclick="addResult<%=i%>()"><span style="font-size: 16px;">+</span> Add</button></td>  <!--Add Result-->
              <td class="td2"><button class="btn__edit" id="btn-edit<%=i%>" onclick="viewResult<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Result</button></td> <!--View Result-->
              <td class="td3 actionclass"><div class="circle2" title="Delete Result" id="circle2" onclick="myFunction7()"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
            </tr>
            
            
			<script type="text/javascript">
            		
			
	            	document.getElementById("btn-edit<%=i%>");
	            	function viewResult<%=i%>(){
	            	    document.querySelector('.bg-model2').style.display = 'flex';
                        document.querySelector('.bg-model2').style.position = 'fixed';
	            	    document.forms['semesterForm']['userName'].value = "<%=studentData.getString("reg_no")%>";
	            	    document.forms['internalForm']['userName'].value = "<%=studentData.getString("reg_no")%>";
	            	    document.forms['semesterForm']['studentName'].value = "<%=studentData.getString("first_name") +" "+studentData.getString("last_name")%>";
	            	    document.forms['internalForm']['studentName'].value = "<%=studentData.getString("first_name") +" "+studentData.getString("last_name")%>";
	            	    document.forms['semesterForm']['programmeName'].value = "<%=studentData.getString("programme_name")%>";
	            	    document.forms['internalForm']['programmeName'].value = "<%=studentData.getString("programme_name")%>";
	            	    
	            	    table = document.getElementById('viewResultTable');
	            	    
	            	    var rowCount = table.rows.length -1;
	            	    
	            	    if(rowCount < <%=studentData.getInt("semester")%>){
	            	    	var createRow =  <%=studentData.getInt("semester")%> - rowCount;
	            	    	for(let i= 1;i <= createRow; i++){
		            	    	
		            	    	var tr = document.createElement('tr');
		            	    	tr.setAttribute('class','pop-row');
		            	    	var td = document.createElement('td');
		            	    	var div = document.createElement('div');
		            	    	div.setAttribute('class','pop-div');
		            	    	var div2 = document.createElement('div');
		            	    	div2.setAttribute('class','pop-inner');
		            	    	div2.setAttribute('id','div'+i);
		            	    	div2.setAttribute('onclick','callResultServlet'+i+'()');
		            	    	div2.textContent = "Semester "+(rowCount + i);	
		            	    	
		            	    	div.appendChild(div2);
		            	    	td.appendChild(div);
		            	    	tr.appendChild(td);
		            	    	table.appendChild(tr);
		            	    	
		            	    	var tdI = document.createElement('td');
		            	    	var divI = document.createElement('div');
		            	    	divI.setAttribute('class','pop-div');
		            	    	var divI2 = document.createElement('div');
		            	    	divI2.setAttribute('class','pop-inner');
		            	    	divI2.setAttribute('id','div'+i);
		            	    	divI2.setAttribute('onclick','callInternalServlet'+i+'()');
		            	    	divI2.textContent = "Semester "+(rowCount + i);
		            	    	
		            	    	divI.appendChild(divI2);
		            	    	tdI.appendChild(divI);
		            	    	tr.appendChild(tdI);	
		            	  
		            	    }
	            	    }
	            	    
	            	    
	            	    if(rowCount > <%=studentData.getInt("semester")%>){
	            	    	var createRow =  rowCount - <%=studentData.getInt("semester")%>;
	            	    	for(let i= 1;i <= createRow; i++){
	            	    		table.deleteRow(-1);
	            	    	}
	            	    }
	            	}
	            	
	            	document.getElementById("btn__course<%=i%>");
	            	function addResult<%=i%>(){
	            		  document.querySelector('.bg-model7').style.display = 'flex';
	            		  document.querySelector('.bg-model7').style.position = 'fixed';
	            		  
	            		  table = document.getElementById('addResultTable');
		            	    
		            	    var rowCount = table.rows.length;
		            	    for(let i=1; i<=rowCount;i++){
		            	    table.deleteRow(-1);
		            	    }
		            	    	var createRow =  <%=studentData.getInt("semester")%> ;
		            	    	for(let i= 1;i <= createRow; i++){
			            	    	
			            	    	var tr = document.createElement('tr');
			            	    	tr.setAttribute('class','pop-row');
			            	    	var td = document.createElement('td');
			            	    	var td2 = document.createElement('td');
			            	    	var div = document.createElement('div');
			            	    	var divII = document.createElement('div');
			            	    	div.setAttribute('class','pop-div');
			            	    	divII.setAttribute('class', 'pop-div')
			            	    	var div2 = document.createElement('div');
			            	    	var div3 = document.createElement('div');
			            	    	div2.setAttribute('class','pop-inner');
			            	    	div2.setAttribute('id','div'+i);
			            	    	div2.setAttribute('onclick','addResultTable'+i+"('<%=studentData.getString("programme_id")%>','<%=studentData.getString("first_name")+" "%><%=studentData.getString("last_name")%>','<%=studentData.getString("reg_no")%>','<%=studentData.getString("programme_name")%>','<%=studentData.getString("class_name")+" "%><%=studentData.getString("class_year")+" "%>year',"+(i)+")");
			            	    	div2.textContent = "First Internal (Semester "+i+")";	
			            	    	
			            	    	div3.setAttribute('class','pop-inner');
			            	    	div3.setAttribute('id','div'+i);
			            	    	div3.setAttribute('onclick','addResultTableSe'+i+"('<%=studentData.getString("programme_id")%>','<%=studentData.getString("first_name")+" "%><%=studentData.getString("last_name")%>','<%=studentData.getString("reg_no")%>','<%=studentData.getString("programme_name")%>','<%=studentData.getString("class_name")+" "%><%=studentData.getString("class_year")+" "%>year',"+(i)+")");
			            	    	div3.textContent = "Second Internal (Semester "+i+")";
			            	    	
			            	    	div.appendChild(div2);
			            	    	divII.appendChild(div3);
			            	    	td.appendChild(div);
			            	    	td2.appendChild(divII);
			            	    	tr.appendChild(td);
			            	    	tr.appendChild(td2);
			            	    	table.appendChild(tr);
			            	    	
			            	    }
	            		}
            	</script>
			<% 		
				i = i + 1;
                	}	
                }	
               	}catch(SQLException e){}
            
            %>   
            <script type="text/javascript">
            	window.onload = function(){
            		var staffRole = "<%=staffRole%>";
            		if(staffRole == "Faculty"){
            			$("#showStudentTable tr").each(function(){
								$(this).find(".addclass").hide();
								$(this).find(".actionclass").hide();
								$(this).find("#addTitle").hide();
								$(this).find("#actionTitle").hide();
								
							});
            		}
            	}
            </script>
              
            </table>
            </div>
            </div>
                <div class="bg-model2">
                <div class="model-content2">
                <div class="close2" id="close" >+</div>
                <div class="header2">
                <h1>View Student Result </h1></div>
                    
                <form action="">
                <table border="1" class="tb3" id="viewResultTable">
                  <tr>
                     <th>Semester</th>
                     <th>Internals</th>
                  </tr>  
                </table>
                </form>
                </div>
                </div>
                
                <div class="bg-model3">
                    <div class="model-content3">
                    <div class="close3" id="close" >+</div>
                    <div class="header3">
                      <h1>Edit Internal Results</h1></div>
                        <form action="">
                            <table border="1" class="tb3">
                              <tr>
                                <th>Internals</th>
                              </tr>
                                
                               <tr class="pop-row">
                                   <td><div class="pop-div"><div class="pop-inner2">Semester </div></div></td>
                                </tr> 
                                    
                            </table> 
                        </form>
                    </div>
                </div>
                 
                <div class="bg-model4">
                    <div class="model-content4">
                        <div class="close4" id="close" >+</div>
                        <div class="header4">
                            <h1>Delete Internal Results</h1></div>
                            <form action="">
                                <table border="1" class="tb3">
                                    <tr>
                                    <th>Internals</th>
                                    </tr>
                                    
                                    <tr class="pop-row">
                                        <td><div class="pop-div"><div class="pop-inner">Semester1 (internal1)</div></div></td>
                                        <td><div class="pop-div"><div class="pop-inner">Semester1 (internal2)</div></div></td>
                                    </tr>  
                                    
                                </table>
                        </form>
                    </div>
                </div>
                
                <div class="bg-model7">
                    <div class="model-content7">
                        <div class="close7" id="close" >+</div>
                        <div class="header7">
                            <h1>Add Internal marks</h1></div>
                            <form action="">
                                <table id=""border="1" class="tb3">
                                    <tr>
                                    <th colspan="" class="pushLeft">First Internal</th>
                                    <th colspan="2" class="pushRight">Second Internal</th>
                                    </tr>
                                 </table> 
                                 <table id="addResultTable">  
                                </table>
                            
                            
                        </form>
                    </div>
                </div>
                
                
                
                <%
                  	try{
                  		
                  		ResultSet programmeResultSet20 = loadData.loadProgrammeData();
                  		if(programmeResultSet20!=null){
                  			int j = 0;
                  			int courseCount = 0;
                  			while(programmeResultSet20.next()){
                  	
                  				for(int i=1; i<= programmeResultSet20.getInt("programme_sem"); i++){
                  					
                  					ResultSet coursesData20 = loadData.loadCoursedata(programmeResultSet20, i);
				%>    
                <div class="bg-model5" id="prog<%=programmeResultSet20.getString("programme_id")%><%=i%>">
                    <div class="model-content5">
                    <input type="hidden" id="resultSName<%=i + j%>" value="" />
                        <div class="close-result<%=i + j%>" id="close16" >+</div>
                        <script>
						        document.querySelector('.close-result<%=i + j%>').addEventListener('click', function(){
						        document.getElementById("prog<%=programmeResultSet20.getString("programme_id")%><%=i%>").style.display = 'none';
						            
						        });
					    </script>
                        <div class="header5">
                            <h1>Add Student 1st Internal Result</h1></div>
                             <div class="title__next" id="title<%=programmeResultSet20.getString("programme_id")%><%=i%>">
                                 <table id="resultTab<%=programmeResultSet20.getString("programme_id")%><%=i%>">
                                     <tr>
                                     <th>Student Name</th>
                                     <th>Reg-no</th>
                                     <th>Programme</th>
                                     <th>Class</th>
                                     <th>Semester</th>
                                     </tr>
                                     
                                     <tr>
                                         <td class="td10" id="studentNamee<%=i + j%>"><input id="studentName<%=i + j%>" readonly="readonly" value=""></td>
                                        <td class="td10" id="regNoo<%=i + j%>"><input id="resultSRegNo<%=i + j%>"name="regNo"readonly="readonly" value=""></td>
                                        <td class="td10" id="programmee<%=i + j%>"><input id="resultSProgramme<%=i + j%>"readonly="readonly" value=""></td>
                                        <td class="td10" id="classNamee<%=i + j%>"><input id="resultSClass<%=i + j%>"readonly="readonly" value=""></td>
                                        <td class="td10" id="semesterr<%=i + j%>"><input id="resultSName<%=i + j%>"name="semester"readonly="readonly" value=""></td>
                                     </tr>
                                 </table>
                        		<script type="text/javascript">
                                 	function insertIntoStudentRes<%=programmeResultSet20.getString("programme_id")%><%=i%>(programmeID,studentName,regNo,programme,className,semester){
   										$("#resultTab<%=programmeResultSet20.getString("programme_id")%><%=i%> tr").each(function(){
   											$(this).find("#studentNamee<%=i + j%> input").val(studentName);
   											$(this).find("#regNoo<%=i + j%> input").val(regNo);
   											$(this).find("#programmee<%=i + j%> input").val(programme);
   											$(this).find("#classNamee<%=i + j%> input").val(className);
   											$(this).find("#semesterr<%=i + j%> input").val(semester);
   											
   										});
   										document.forms['form<%=programmeResultSet20.getString("programme_id")%><%=i%>']['regNo'].value=regNo;
   										document.forms['form<%=programmeResultSet20.getString("programme_id")%><%=i%>']['programmeID'].value=programmeID;
   										document.forms['form<%=programmeResultSet20.getString("programme_id")%><%=i%>']['semesterr'].value=semester;
                                 	}
                                 </script>
                        		
                             </div>
                        
                            <form id="form<%=programmeResultSet20.getString("programme_id")%><%=i%>" action="InsertDataServlet" method="post" >
                            	<input type="hidden" name="Data" value="firstInternal"/>
                            	<input type="hidden" id="regNo" name="regNo" value=""/>
                            	<input type="hidden" id="programmeID" name="programmeId" value=""/>
                            	<input type="hidden" id="semesterr" name="semester" value=""/>
                                <table id="obTable<%=programmeResultSet20.getString("programme_id")%><%=i%>"border="1" class="tb9">
                                    <tr>
                            
                                    
                                    <th class="tdCourse" >Course name</th>
                                    <th class="tdCourse" >Course code</th>
                                    <th class="tdCourse">Course Type</th>
                                    <th class="tdCourse">Max Marks</th>
                                    <th class="tdCourse">Min Marks</th>
                                    <th class="tdCourse">Obtained Marks</th>
                                    <th class="tdCourse">Select</th>
                                    
                                    </tr>
									 <%try{
                            			if(coursesData20!=null){
                            		
                            			while(coursesData20.next()){
                            				courseCount = courseCount + 1;
                        	 		 %>	  
                            		<tr>
                                        <td class="course__name"><input readonly value="<%=coursesData20.getString("course_name")%>" required></td>
                                        <td><input name="courseCode<%=courseCount%>" value="<%=coursesData20.getString("course_code")%>" readonly></td>
                                        <td><input value="<%=coursesData20.getString("course_type")%>" readonly></td>
                                        <td class="ob__marks" id="maxMarks<%=courseCount%>"><input name="max<%=courseCount%>" type="number" min="0" max="100" value="" readonly></td>
                                        <td class="ob__marks" id="minMarks<%=courseCount%>"><input name="min<%=courseCount%>" type="number" min="0" max="100" value="" readonly></td>
                                        <td class="ob__marks" id="obtained<%=courseCount%>"><input name="obtained<%=courseCount%>" type="number" min="0" max="<%=coursesData20.getString("max_marks")%>" value=""  readonly></td>
                                        <td class="ob__marks"><input name="" id="checkBox<%=i + j%><%=courseCount%>" type="checkbox" onclick="enableRowAdd<%=i + j%>('obTable<%=programmeResultSet20.getString("programme_id")%><%=i%>','<%=courseCount%>')"/></td>
                                    </tr>
                                    
                                    		 <%  	}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%>
                
                                    <table class="td11">
                                        <tr>
                                           <td class="td10"><select id="examMonthAdd<%=i + j%>" name="examMonth" required>
                                            <option value="" disabled selected hidden>Exam Month</option>
                                            <option value="01">January</option>
                                            <option value="02">February</option>
                                            <option value="03">March</option>
                                            <option value="04">April</option>
                                            <option value="05" >May</option>
                                            <option value="06" >June</option>
                                            <option value="07" >July</option>
                                            <option value="08" >August</option>
                                            <option value="09" >September</option>
                                            <option value="10" >October</option>
                                            <option value="11" >November</option>
                                            <option value="12" >December</option>
                                            </select></td>
                                            <td class="td10"><input id="examYearAdd<%=i + j%>" name="examYear" type="number" required pattern="0+\.[0-9]*[1-9][0-9]*$"></td>
                                            <td class="td10"><input id="resultDateAdd<%=i + j%>" name="resultDate" type="date" required></td>
                                        </tr>
                                     
                                    </table>
                                            <button id="button5">ADD</button> 
                                </table>
                             <%
                             	ResultSet coursesData30 = loadData.loadCoursedata(programmeResultSet20, i);
                             %> 
                             
                              <%try{
                            			if(coursesData30!=null){
                            				courseCount = 0;
                            			while(coursesData30.next()){
                            				courseCount = courseCount + 1;
                        	  %>	
                        	  <input type="hidden" id="resultmaxMarks<%=courseCount%>" name="maxMarks<%=courseCount%>" value="<%=coursesData30.getString("max_marks")%>"/>
                        	  <input type="hidden" id="resultminMarks<%=courseCount%>" name="minMarks<%=courseCount%>" value="<%=coursesData30.getString("min_marks")%>"/>
                        	  <input type="hidden" id="resultmaxIA<%=courseCount%>" name="maxIA<%=courseCount%>" value="<%=coursesData30.getString("max_IA")%>">
                        	  		 <%  	}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%>
                            <input type="hidden" id="noOfCourseAdd<%=i + j%>" name="numberOfCourses" value="0"/>
                             <input type="hidden" name="ttCourse" value="<%=courseCount%>"/>
                         <script type="text/javascript">
                         	var courseCountAdd = 0;
                        	function enableRowAdd<%=i + j%>(tableId,courseCount){
                        	
                        		if(document.getElementById("checkBox<%=i + j%>"+courseCount).checked){
                        			$("#obTable<%=programmeResultSet20.getString("programme_id")%><%=i%> tr").each(function(){
											$(this).find("#obtained"+courseCount+" input").removeAttr("readonly");
											$(this).find("#maxMarks"+courseCount+" input").removeAttr("readonly");
											$(this).find("#minMarks"+courseCount+" input").removeAttr("readonly");
											
											$(this).find("#obtained"+courseCount+" input").attr("required",true);
											$(this).find("#maxMarks"+courseCount+" input").attr("required",true);
											$(this).find("#minMarks"+courseCount+" input").attr("required",true);
										});
										courseCountAdd++;
										document.getElementById("noOfCourseAdd<%=i + j%>").value=courseCountAdd;
                        		}else{
                        			$("#obTable<%=programmeResultSet20.getString("programme_id")%><%=i%> tr").each(function(){
										$(this).find("#obtained"+courseCount+" input").attr("readonly",true);
										$(this).find("#maxMarks"+courseCount+" input").attr("readonly",true);
										$(this).find("#minMarks"+courseCount+" input").attr("readonly",true);
										
										$(this).find("#obtained"+courseCount+" input").val("");
										$(this).find("#maxMarks"+courseCount+" input").val("");
										$(this).find("#minMarks"+courseCount+" input").val("");
										
										
										$(this).find("#obtained"+courseCount+" input").removeAttr("required");
										$(this).find("#maxMarks"+courseCount+" input").removeAttr("required");
										$(this).find("#minMarks"+courseCount+" input").removeAttr("required");
										
									});
                        			courseCountAdd--;
									document.getElementById("noOfCourseAdd<%=i + j%>").value=courseCountAdd;
                        		}
                        		console.log(courseCountAdd);
                        	}
                         
                        	const addResultForm<%=i + j%> = document.getElementById("form<%=programmeResultSet20.getString("programme_id")%><%=i%>");
                        	const examMonthAdd<%=i + j%> = document.getElementById("examMonthAdd<%=i + j%>");
                        	const examYearAdd<%=i + j%> = document.getElementById("examYearAdd<%=i + j%>");
                        	const resultDateAdd<%=i + j%> = document.getElementById("resultDateAdd<%=i + j%>");
                        	const noOfCoursesAdd<%=i +j%> = document.getElementById("noOfCourseAdd<%=i + j%>");
                        	addResultForm<%=i + j%>.addEventListener('submit', (e)=>{
                        		
                        		var currentDate = new Date();
                        		var currentYear = currentDate.getFullYear();
                        		var selectedDate = new Date(resultDateAdd<%=i + j%>.value);
                        		var selectedYear = selectedDate.getFullYear();
                        		var selectedMonth = String(selectedDate.getMonth() + 1).padStart(2, '0');
                        		console.log(selectedMonth);
                        		var dd = String(currentDate.getDate()).padStart(2, '0');
            					var mm = String(currentDate.getMonth() + 1).padStart(2, '0'); //January is 0!
            					var yyyy = currentDate.getFullYear();
            					var validMinDate = yyyy + '-' + mm + '-' + dd;
                        	
                        		
                        		if(parseInt(examYearAdd<%=i + j%>.value) > parseInt(currentYear)){
                        			swal("Invalid Exam Year !","Exam Year cannot be greater than current year","error");
                        			e.preventDefault();
                        			
                        		}else if(resultDateAdd<%=i + j%>.value > validMinDate){
                        			swal("Invalid Result Publish Date !","Result Publish Date cannot be greater than current date","error");
                        			e.preventDefault();
                        			
                        		}else if(parseInt(examYearAdd<%=i + j%>.value) > parseInt(selectedYear)){
                        			swal("Invalid Exam Year !","Exam Year cannot be greater than Result Publish Year","error");
                        			e.preventDefault();
                        			
                        		}else if(parseInt(examMonthAdd<%=i + j%>.value) > parseInt(selectedMonth) && parseInt(examYearAdd<%=i + j%>.value) == parseInt(selectedYear)){
                        			swal("Invalid Exam Month !","Exam Month cannot be greater than Result Publish Month","error");
                        			e.preventDefault();
                        			
                        		}else if(parseInt(noOfCoursesAdd<%=i + j%>.value) <= 0 ){
                        			swal("Invalid Result Data !","Please Enter at least one Course Marks","error");
                        			e.preventDefault();
                        			
                        		}
                        	});
                        </script>  
                        </form>
                        
                    </div>
                </div>
                <%				
                				courseCount = 0;}
                				j = j + programmeResultSet20.getInt("programme_sem");//increment j for index
                			}
                		}
                	}catch(SQLException e){
                		e.printStackTrace();
                		
                	}	
                   
                %>  
                
                <script>
                <%
                  for(int i=1; i<=8;i++){
                
                %>	
                		
                		function addResultTable<%=i%>(programmeID,studentName,regNo,programme,className,semester){
                			  var progID = programmeID + semester;
                			  var funcName = "insertIntoStudentRes"+progID;
                			  console.log(funcName);
                			  window[funcName](programmeID,studentName,regNo,programme,className,semester);
                			  document.querySelector('.bg-model5').style.display = 'none';
                			  document.getElementById('prog'+progID).style.display = 'flex';
                			  document.getElementById('prog'+progID).style.position = 'fixed';
                			
                		}
                		
                <%
                  }
                %>
                </script>
                
                
                
                
                
                
     <!-- Second Internal marks --> 
     
     
     
     
               
                 <%
                  	try{
                  		
                  		ResultSet programmeResultSet30 = loadData.loadProgrammeData();
                  		if(programmeResultSet30!=null){
                  			int j = 0;
                  			int courseCount = 0;
                  			while(programmeResultSet30.next()){
                  	
                  				for(int i=1; i<= programmeResultSet30.getInt("programme_sem"); i++){
                  					
                  					ResultSet coursesData20 = loadData.loadCoursedata(programmeResultSet30, i);
				%>    
               
                <div class="bg-model6 secondinternal" id="prog2<%=programmeResultSet30.getString("programme_id")%><%=i%>">
                    <div class="model-content6">
                    <input type="hidden" id="resultSName2<%=i + j%>" value="" />
                        <div class="close-result2<%=i + j%>" id="close16" >+</div>
                        <script>
						        document.querySelector('.close-result2<%=i + j%>').addEventListener('click', function(){
						        document.getElementById("prog2<%=programmeResultSet30.getString("programme_id")%><%=i%>").style.display = 'none';
						            
						        });
					    </script>
                        <div class="header6">
                            <h1>Add Student 2nd Internal Result</h1></div>
                             <div class="title__next" id="title2<%=programmeResultSet30.getString("programme_id")%><%=i%>">
                                 <table id="resultTab2<%=programmeResultSet30.getString("programme_id")%><%=i%>">
                                     <tr>
                                     <th>Student Name</th>
                                     <th>Reg-no</th>
                                     <th>Programme</th>
                                     <th>Class</th>
                                     <th>Semester</th>
                                     </tr>
                                     
                                     <tr>
                                        <td class="td10" id="studentNamee2<%=i + j%>"><input id="studentName2<%=i + j%>" readonly="readonly" value=""></td>
                                        <td class="td10" id="regNoo2<%=i + j%>"><input id="resultSRegNo2<%=i + j%>"name="regNo"readonly="readonly" value=""></td>
                                        <td class="td10" id="programmee2<%=i + j%>"><input id="resultSProgramme2<%=i + j%>"readonly="readonly" value=""></td>
                                        <td class="td10" id="classNamee2<%=i + j%>"><input id="resultSClass2<%=i + j%>"readonly="readonly" value=""></td>
                                        <td class="td10" id="semesterr2<%=i + j%>"><input id="resultSName2<%=i + j%>"name="semester"readonly="readonly" value=""></td>
                                     </tr>
                                 </table>
                        		<script type="text/javascript">
                                 	function insertIntoStudentRes2<%=programmeResultSet30.getString("programme_id")%><%=i%>(programmeID,studentName,regNo,programme,className,semester){
   										$("#resultTab2<%=programmeResultSet30.getString("programme_id")%><%=i%> tr").each(function(){
   											$(this).find("#studentNamee2<%=i + j%> input").val(studentName);
   											$(this).find("#regNoo2<%=i + j%> input").val(regNo);
   											$(this).find("#programmee2<%=i + j%> input").val(programme);
   											$(this).find("#classNamee2<%=i + j%> input").val(className);
   											$(this).find("#semesterr2<%=i + j%> input").val(semester);
   											
   										});
   										document.forms['form2<%=programmeResultSet30.getString("programme_id")%><%=i%>']['regNo2'].value=regNo;
   										document.forms['form2<%=programmeResultSet30.getString("programme_id")%><%=i%>']['programmeID2'].value=programmeID;
   										document.forms['form2<%=programmeResultSet30.getString("programme_id")%><%=i%>']['semesterr2'].value=semester;
                                 	}
                                 </script>
                        
                             </div>
                        
                            <form id="form2<%=programmeResultSet30.getString("programme_id")%><%=i%>" action="InsertDataServlet" method="post" >
                            	<input type="hidden" name="Data" value="secondInternal"/>
                            	<input type="hidden" id="regNo2" name="regNo" value=""/>
                            	<input type="hidden" id="programmeID2" name="programmeId" value=""/>
                            	<input type="hidden" id="semesterr2" name="semester" value=""/>
                                <table id="obTable2<%=programmeResultSet30.getString("programme_id")%><%=i%>"border="1" class="tb9">
                                    <tr>

                                    <th class="tdCourse" >Course name</th>
                                    <th class="tdCourse" >Course code</th>
                                    <th class="tdCourse">Course Type</th>
                                    <th class="tdCourse">Max Marks</th>
                                    <th class="tdCourse">Min Marks</th>
                                    <th class="tdCourse">Obtained Marks</th>
                                    <th class="tdCourse">Select</th>
                                    
                                    </tr>
									
                            		 <%try{
                            			if(coursesData20!=null){
                            		
                            			while(coursesData20.next()){
                            				courseCount = courseCount + 1;
                        	 		 %>	  
                            		<tr>
                                        <td class="course__name"><input readonly value="<%=coursesData20.getString("course_name")%>" required></td>
                                        <td><input name="courseCode<%=courseCount%>" value="<%=coursesData20.getString("course_code")%>" readonly></td>
                                        <td><input value="<%=coursesData20.getString("course_type")%>" readonly></td>
                                        <td class="ob__marks" id="maxMarks2<%=courseCount%>"><input name="max<%=courseCount%>" type="number" min="0" max="100" value="" readonly></td>
                                        <td class="ob__marks" id="minMarks2<%=courseCount%>"><input name="min<%=courseCount%>" type="number" min="0" max="100" value="" readonly></td>
                                        <td class="ob__marks" id="obtained2<%=courseCount%>"><input name="obtained<%=courseCount%>" type="number" min="0" max="<%=coursesData20.getString("max_marks")%>" value=""  readonly></td>
                                        <td class="ob__marks"><input name="" id="checkBox2<%=i + j%><%=courseCount%>" type="checkbox" onclick="enableRowAdd2<%=i + j%>('obTable2<%=programmeResultSet30.getString("programme_id")%><%=i%>','<%=courseCount%>')"/></td>
                                    </tr>
                                    
                                    		 <%  	}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%>
                
                                    <table class="td11">
                                        <tr>
                                           <td class="td10"><select id="examMonthAdd2<%=i + j%>" name="examMonth" required>
                                            <option value="" disabled selected hidden>Exam Month</option>
                                            <option value="01">January</option>
                                            <option value="02">February</option>
                                            <option value="03">March</option>
                                            <option value="04">April</option>
                                            <option value="05" >May</option>
                                            <option value="06" >June</option>
                                            <option value="07" >July</option>
                                            <option value="08" >August</option>
                                            <option value="09" >September</option>
                                            <option value="10" >October</option>
                                            <option value="11" >November</option>
                                            <option value="12" >December</option>
                                            </select></td>
                                            <td class="td10"><input id="examYearAdd2<%=i + j%>" name="examYear" type="number" required pattern="0+\.[0-9]*[1-9][0-9]*$"></td>
                                            <td class="td10"><input id="resultDateAdd2<%=i + j%>" name="resultDate" type="date" required></td>
                                        </tr>
                                     
                                    </table>
                                            <button id="button6">ADD</button> 
                                </table>
                              <% 
                                ResultSet coursesData30 = loadData.loadCoursedata(programmeResultSet30, i);
                             %> 
                             
                              <%try{
                            			if(coursesData30!=null){
                            				courseCount = 0;
                            			while(coursesData30.next()){
                            				courseCount = courseCount + 1;
                        	  %>	
                        	  <input type="hidden" id="resultmaxMarks2<%=courseCount%>" name="maxMarks<%=courseCount%>" value="<%=coursesData30.getString("max_marks")%>"/>
                        	  <input type="hidden" id="resultminMarks2<%=courseCount%>" name="minMarks<%=courseCount%>" value="<%=coursesData30.getString("min_marks")%>"/>
                        	  <input type="hidden" id="resultmaxIA2<%=courseCount%>" name="maxIA<%=courseCount%>" value="<%=coursesData30.getString("max_IA")%>">
                        	  		 <%  	}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%>
                            <input type="hidden" id="noOfCourseAdd2<%=i + j%>" name="numberOfCourses" value="0"/>
                             <input type="hidden" name="ttCourse" value="<%=courseCount%>"/>
                         <script type="text/javascript">
                         	var courseCountAdd2 = 0;
                        	function enableRowAdd2<%=i + j%>(tableId,courseCount){
                        	
                        		if(document.getElementById("checkBox2<%=i + j%>"+courseCount).checked){
                        			$("#obTable2<%=programmeResultSet30.getString("programme_id")%><%=i%> tr").each(function(){
											$(this).find("#obtained2"+courseCount+" input").removeAttr("readonly");
											$(this).find("#maxMarks2"+courseCount+" input").removeAttr("readonly");
											$(this).find("#minMarks2"+courseCount+" input").removeAttr("readonly");
											
											$(this).find("#obtained2"+courseCount+" input").attr("required",true);
											$(this).find("#maxMarks2"+courseCount+" input").attr("required",true);
											$(this).find("#minMarks2"+courseCount+" input").attr("required",true);
										});
										courseCountAdd2++;
										document.getElementById("noOfCourseAdd2<%=i + j%>").value=courseCountAdd2;
                        		}else{
                        			$("#obTable2<%=programmeResultSet30.getString("programme_id")%><%=i%> tr").each(function(){
										$(this).find("#obtained2"+courseCount+" input").attr("readonly",true);
										$(this).find("#maxMarks2"+courseCount+" input").attr("readonly",true);
										$(this).find("#minMarks2"+courseCount+" input").attr("readonly",true);
										
										$(this).find("#obtained2"+courseCount+" input").val("");
										$(this).find("#maxMarks2"+courseCount+" input").val("");
										$(this).find("#minMarks2"+courseCount+" input").val("");
										
										
										$(this).find("#obtained2"+courseCount+" input").removeAttr("required");
										$(this).find("#maxMarks2"+courseCount+" input").removeAttr("required");
										$(this).find("#minMarks2"+courseCount+" input").removeAttr("required");
										
									});
                        			courseCountAdd2--;
									document.getElementById("noOfCourseAdd2<%=i + j%>").value=courseCountAdd2;
                        		}
                        
                        	}
                         
                        	const addResultForm2<%=i + j%> = document.getElementById("form2<%=programmeResultSet30.getString("programme_id")%><%=i%>");
                        	const examMonthAdd2<%=i + j%> = document.getElementById("examMonthAdd2<%=i + j%>");
                        	const examYearAdd2<%=i + j%> = document.getElementById("examYearAdd2<%=i + j%>");
                        	const resultDateAdd2<%=i + j%> = document.getElementById("resultDateAdd2<%=i + j%>");
                        	const noOfCoursesAdd2<%=i +j%> = document.getElementById("noOfCourseAdd2<%=i + j%>");
                        	addResultForm2<%=i + j%>.addEventListener('submit', (e)=>{
                        		
                        		var currentDate = new Date();
                        		var currentYear = currentDate.getFullYear();
                        		var selectedDate = new Date(resultDateAdd2<%=i + j%>.value);
                        		var selectedYear = selectedDate.getFullYear();
                        		var selectedMonth = String(selectedDate.getMonth() + 1).padStart(2, '0');
                        		console.log(selectedMonth);
                        		var dd = String(currentDate.getDate()).padStart(2, '0');
            					var mm = String(currentDate.getMonth() + 1).padStart(2, '0'); //January is 0!
            					var yyyy = currentDate.getFullYear();
            					var validMinDate = yyyy + '-' + mm + '-' + dd;
                        	
                        		
                        		if(parseInt(examYearAdd2<%=i + j%>.value) > parseInt(currentYear)){
                        			swal("Invalid Exam Year !","Exam Year cannot be greater than current year","error");
                        			e.preventDefault();
                        			
                        		}else if(resultDateAdd2<%=i + j%>.value > validMinDate){
                        			swal("Invalid Result Publish Date !","Result Publish Date cannot be greater than current date","error");
                        			e.preventDefault();
                        			
                        		}else if(parseInt(examYearAdd2<%=i + j%>.value) > parseInt(selectedYear)){
                        			swal("Invalid Exam Year !","Exam Year cannot be greater than Result Publish Year","error");
                        			e.preventDefault();
                        			
                        		}else if(parseInt(examMonthAdd2<%=i + j%>.value) > parseInt(selectedMonth) && parseInt(examYearAdd2<%=i + j%>.value) == parseInt(selectedYear)){
                        			swal("Invalid Exam Month !","Exam Month cannot be greater than Result Publish Month","error");
                        			e.preventDefault();
                        			
                        		}else if(parseInt(noOfCoursesAdd2<%=i + j%>.value) <= 0 ){
                        			swal("Invalid Result Data !","Please Enter at least one Course Marks","error");
                        			e.preventDefault();
                        			
                        		}
                        	});
                        </script>  
                        </form>
                        
                    </div>
                </div>
				  <%				
                				courseCount = 0;}
                				j = j + programmeResultSet30.getInt("programme_sem");//increment j for index
                			}
                		}
                	}catch(SQLException e){
                		e.printStackTrace();
                		
                	}	
                   
                %>  
                
                
                                <script>
                <%
                  for(int i=1; i<=8;i++){
                
                %>	
                		
                		function addResultTableSe<%=i%>(programmeID,studentName,regNo,programme,className,semester){
                			  var progID = programmeID + semester;
                			  var funcName = "insertIntoStudentRes2"+progID;
                			  console.log(funcName);
                			  window[funcName](programmeID,studentName,regNo,programme,className,semester);
                			  document.querySelector('.bg-model6').style.display = 'none';
                			  document.getElementById('prog2'+progID).style.display = 'flex';
                			  document.getElementById('prog2'+progID).style.position = 'fixed';
                			
                		}
                		
                <%
                  }
                %>
                </script>
                
                
                
           </div> 
<!-----------------------------------------------------------Profile----------------------------------------------------------------------------->                         
                          
            <div class="tabs__content" data-tab="4">
            <div class="protab1">
                <div class="inner__protab1">
                    <div class="inner2"><h6 class="left">Profile</h6></div>
                    
                    <div class="holder">
                    <div class="holder2">
                    <img src="" class="innerimg">
                    </div>
                    <p class="name"><%=request.getSession(false).getAttribute("staffName")%></p>
                    </div>
                    <div class="inputs">
                        <label>Name</label>
                        <input class="int" type="text" value="<%=request.getSession(false).getAttribute("staffName")%>" readonly>
                        <label>Phone</label>
                        <input class="int" value="<%=request.getSession(false).getAttribute("staffPhone")%>" readonly>
                        <label>Email</label>
                        <input class="int" type="email" value="<%=request.getSession(false).getAttribute("staffEmail")%>" readonly>
                        <label>Password</label>
                        <div class="i"><i class="fa-solid fa-eye-slash" id="show-password" onclick="toggle()"></i></div>
                        <input class="int" id="password" type="password" value="<%=request.getSession(false).getAttribute("staffPassword")%>" readonly>
                        <button class="cp">Change Password</button>
                    </div>
     
                </div>
             </div>
          </div>
        </div>
                
        
     	<%
                   
                   	int maxSem = 1;
                   	try{
	                   
	                    
	 					ResultSet programmeSem = loadData.loadMaxSemester();
	 				
	             		
	 					if(programmeSem!=null){
	                 		while(programmeSem.next()){
								maxSem = programmeSem.getInt("programme_sem");
								
	                 		}
	 					}
                   	}catch(SQLException e){
                   		e.printStackTrace();
                   	}
                   		for(int i = 1 ;i <= maxSem; i++){
				%>         
                    
                    <script type="text/javascript">
	                            	document.getElementById("div<%=i%>");
	                    		    
	                            	function callResultServlet<%=i%>(){
	                    						
	                    				document.forms['semesterForm']['semester'].value = "<%=i%>";
	                    			    document.getElementById("semesterForm").submit();
	                    				
	                    				
	                    			}
					</script>
					
					<script type="text/javascript">
	                            	document.getElementById("div<%=i%>");
	                    		    
	                            	function callInternalServlet<%=i%>(){
	                    						
	                    				document.forms['internalForm']['semester'].value = "<%=i%>";
	                    			    document.getElementById("internalForm").submit();
	                    				
	                    				
	                    			}
					</script>
                    
				<%} %>
        
        
         <form action="ResultServlet" method="get" id="semesterForm">
            	<input name="semester" id="semester" value="1" type="hidden" />
            	<input name="userName" type="hidden" value=<%=request.getSession(false).getAttribute("staff")%>>
         </form>
        
        <script type="text/javascript">
            let image = document.getElementById("image");
            let images = ['css/images/can1.jpg','css/images/can2.jpg','css/images/can3.jpg','css/images/can4.jpg','css/images/can5.jpg','css/images/can6.jpg','css/images/can7.jpg']
            setInterval(function(){
                let random = Math.floor(Math.random()*7);
                image.src = images[random];
            },2500);
        </script> 
        
        <script>
            document.getElementById("btn-edit1");
            function myFunction5(){
                document.querySelector('.bg-model2').style.display = 'flex';
                document.querySelector('.bg-model2').style.position = 'fixed'
            }
        
        </script>
        
        <script>
            document.querySelector('.close2').addEventListener('click', function(){
                document.querySelector('.bg-model2').style.display = 'none';
            })
        
        
        </script>
        
        <script>
            document.getElementById("circle1");
            function myFunction6(){
                document.querySelector('.bg-model3').style.display = 'flex';
                document.querySelector('.bg-model3').style.position = 'fixed'
            }
        
        </script>
        
        <script>
            document.querySelector('.close3').addEventListener('click', function(){
                document.querySelector('.bg-model3').style.display = 'none';
            })
        
        
        </script>
        
        
        <script>
            document.getElementById("circle2");
            function myFunction7(){
                document.querySelector('.bg-model4').style.display = 'flex';
                document.querySelector('.bg-model4').style.position = 'fixed'
            }
        
        </script>
        
        <script>
            document.querySelector('.close4').addEventListener('click', function(){
                document.querySelector('.bg-model4').style.display = 'none';
            })
        </script>
                    
                    
                <script>
            document.getElementById("btn__course2");
            function myFunction22(){
                document.querySelector('.bg-model7').style.display = 'flex';
                document.querySelector('.bg-model7').style.display = 'fixed';
                
            }
        
        </script>
        
        <script>
            document.querySelector('.close7').addEventListener('click', function(){
                document.querySelector('.bg-model7').style.display = 'none';
            })
        </script>
        
        
        
        
        <script>
            document.getElementById("pop1");
            function myFunction23(){
                document.querySelector('.bg-model5').style.display = 'flex';
                document.querySelector('.bg-model5').style.display = 'fixed';
                
            }
        
        </script>
        
        <script>
            document.getElementById("pop2");
            function myFunction24(){
                document.querySelector('.bg-model6').style.display = 'flex';
                document.querySelector('.bg-model6').style.display = 'fixed';
                
            }
        
        </script>

    </body>
</html>