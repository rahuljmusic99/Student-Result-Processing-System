<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.CanaraExamManager.util.DBConnection" %>
<%@page import="org.CanaraExamManager.dao.LoadDataDao" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>

<% 
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	//In case, if User session is not set, redirect to Login page.
	if((request.getSession(false).getAttribute("admin")== null) )
	{
%> 
<jsp:forward page="/adminlogin.jsp"></jsp:forward>
<%}%>

<%
	LoadDataDao loadData = new LoadDataDao(); 
	ResultSet programmeResultSet = loadData.loadProgrammeData();
	 
%>

    
<!DOCTYPE html5>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/admindashbord.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/dashboard.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/popup.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'rel='stylesheet'>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
      	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
        <script src="https://kit.fontawesome.com/dd03fdb332.js" crossorigin="anonymous"></script>
      	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
        
    </head> 
    <body>

<!-- ------------------------------------------------------Form to Delete Data----------------------------------------------------------------------------------- -->    	
    	<form id="deleteDataForm" action="DeleteDataServlet" method="post">
    		<input type="hidden" id="uniqueId" name="uniqueId" value=""/>
    		<input type="hidden" id="Data" name="Data" value=""/>
    	</form>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
		<div class="tabs">
		    <div class="tabs__sidebar">
		        <div class="space"><div class="space4"><img src="css/images/ad.png" class="edu"></div><p>Canara exam manager</p></div>
		        <button class="tabs__button" data-for-tab="7" id="mainprofile">
                <i class="fa-solid fa-angle-right"></i> 
                 <div class="holder3"><img src="css/images/faculty.png" class="profimg"></div><p><%=request.getSession(false).getAttribute("adminName")%></p></button>
		        <button class="tabs__button tabs__button--active" id="tab1" data-for-tab="1"><i class="fa-solid fa-house-chimney"></i>Dashboard</button>
		        <button class="tabs__button" data-for-tab="2"><i class="fa-solid fa-users-line"></i>Student Details</button>
		        <button class="tabs__button" data-for-tab="3"><i class="fa-solid fa-person-chalkboard"></i>Staff Details</button>
		        <button class="tabs__button" data-for-tab="4"><i class="fa-solid fa-graduation-cap"></i>Programme and courses</button>
		        <button class="tabs__button" data-for-tab="5"><i class="fa-sharp fa-solid fa-landmark"></i>classes</button>
		        <button class="tabs__button" data-for-tab="6"><i class="fa-regular fa-clipboard"></i>Student Result</button>
		        <button class="tabs__button" onclick="logoutConfirm();" ><i class="fa-sharp fa-solid fa-right-from-bracket"></i>Logout</button>
			</div>
		
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->            
<!-- ------------------------------------------------------ TAB 1 DASHBOARD ----- ------------------------------------------------------------------------------- -->
        
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

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->            
<!-- ------------------------------------------------------ TAB 2 STUDENT DETAILS ------------------------------------------------------------------------------- -->          
 
        <div class="tabs__content" data-tab="2" id="studentDetails">
            <div class="protab"> 
                <h4>Student Details Management</h4>
                <div class="inner__protab">
                    
                <div class="inner1">
                    <h6 class="left">Students list</h6>
                    <select class="select5" id="filterProgramme" onchange="changeProgrammeFilter(this.value)">
                    <option value="" disabled selected hidden>Filter By Programme</option>
                    <option value="All">All Programme's</option>
                    
                <%
                	ResultSet FilterProgramme = loadData.loadProgrammeData();
                	if(FilterProgramme != null){
                		while(FilterProgramme.next()){
                			
                %>	
                	<option value="<%=FilterProgramme.getString("programme_id")%>"><%=FilterProgramme.getString("programme_name")%></option>	
                <%		}
                	}
                
                %>    
                    </select>
                <select class="select4" id="classFilters" onchange="changeClassFilter(this.value)">
                <option value="" id="filterByClass" disabled selected hidden>Filter By Class</option>
                <option hidden value="All" id="allTheClasses">All Classes</option>
                <%
                	ResultSet FilterClass = loadData.loadOnlyClassData();
                	if(FilterClass != null){
                		while(FilterClass.next()){
                			
                %>	
                	<option hidden id="<%=FilterClass.getString("programme_id")%>" value="<%=FilterClass.getString("class_name")%><%=FilterClass.getString("class_year")%>"><%=FilterClass.getString("class_name")+" "+FilterClass.getString("class_year")+" year"%></option>	
                <%		}
                	}
                
                %> 
                </select>      
                    <div class="icon4"><i class="fa fa-plus-circle" aria-hidden="true"  id="add2" title="Add programme" onclick="myFunction9()"></i></div>
                    </div>
                <table border="1" class="tb1" cellspacing="0" padding="10" rules="all" id="studentDataTable">
                    <tr id="studentHeading">
                      <th>Programme Name</th>
                        <th>Class</th>
                        <th>Class Year</th>
                        <th>Student Name</th>
                        <th>Register Number</th>
                        <th>View Student Details</th>
                        <th>Action</th>
                    </tr>
                    <%
                    	try{			
                    		
           					ResultSet studentData = loadData.loadStudentData();
           					int i = 1;
           					while(studentData.next()){
           						
                    %>
                    <tr class="filterRow<%=studentData.getString("programme_id")%> filterRow<%=studentData.getString("class_name")%><%=studentData.getString("class_year")%>" >
                        <td  class="td1"><%=studentData.getString("programme_name")%></td>   <!--Programme name-->
                        <td class="td2"><%=studentData.getString("class_name")%></td>   <!--class-->
                        <td class="td2"><%=studentData.getString("class_year")%></td>
                        <td><%=studentData.getString("first_name")+" "+studentData.getString("last_name")%></td>  <!-- register number -->
                        <td><%=studentData.getString("reg_no")%></td>
                        <td class="td2"><button id="viewStudent<%=i%>" class="btn__edit"  onclick="viewStudentDetails<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>View</button></td> <!--Edit course-->
                        <td class="td3"><div id="editStudent<%=i%>" class="circle1" title="Edit Programme" onclick="editStudentDetails<%=i%>()" ><i class="fa fa-pencil" aria-hidden="true"></i></div><div id="deleteStudent" class="circle2" title="Delete Programme" onclick="deleteStudentData('<%=studentData.getString("reg_no")%>','student');"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                    </tr>
                    
                    <script type="text/javascript">
                    //Function to Insert Data into View Student Form
                     document.getElementById("viewStudent<%=i%>");
                     function viewStudentDetails<%=i%>(){
                         document.querySelector('.bg-model7').style.display = 'flex';
                         document.querySelector('.bg-model7').style.position = 'fixed';
                         
                         document.getElementById("sFirstName").value = "<%=studentData.getString("first_name")%>";
                         document.getElementById("sLastName").value = "<%=studentData.getString("last_name")%>";
                         document.getElementById("sGender").value = "<%=studentData.getString("gender")%>";
                         document.getElementById("sDOB").value = "<%=studentData.getString("dob")%>";
                         document.getElementById("sEmail").value = "<%=studentData.getString("email")%>";
                         document.getElementById("sPhone").value = "<%=studentData.getString("phone")%>";
                         document.getElementById("sAddress").value = "<%=studentData.getString("address")%>";
                         document.getElementById("sPincode").value = "<%=studentData.getString("pincode")%>";
                         document.getElementById("sCity").value = "<%=studentData.getString("birth_place")%>";
                         document.getElementById("sDistrict").value = "<%=studentData.getString("birth_district")%>";
                         document.getElementById("sState").value = "<%=studentData.getString("birth_state")%>";
                         document.getElementById("sYOF").value = "<%=studentData.getString("joining_year")%>";
                         document.getElementById("sProgramme").value = "<%=studentData.getString("programme_name")%>";
                         document.getElementById("sClass").value = "<%=studentData.getString("class_name")%>";
                         document.getElementById("sClassYear2").value = "<%=studentData.getString("class_year")%>";
                         document.getElementById("sCurrentSem").value = "<%=studentData.getString("semester")%>";
                         document.getElementById("sRegNo").value = "<%=studentData.getInt("reg_no")%>";
                         document.getElementById("sPassword").value = "<%=studentData.getString("password")%>";
                        
                     }
                    </script>
                    
                    <script  type="text/javascript">
                    //Function to Insert Data into Edit Student Form
                     document.getElementById("viewStudentDiv");
                     document.getElementById("editStudent<%=i%>");
                     function editStudentDetails<%=i%>(){
                    	 
                         document.querySelector('.bg-model8').style.display = 'flex';
                         document.querySelector('.bg-model8').style.position = 'fixed';
                         
                         document.forms['editStudentForm']['stFirstName'].value = "<%=studentData.getString("first_name")%>";
                         document.forms['editStudentForm']['stLastName'].value = "<%=studentData.getString("last_name")%>";
                         
                         $("#stProgramme option[value!='<%=studentData.getString("programme_id")%>']").removeAttr("selected");
                         $("#stProgramme option[value='<%=studentData.getString("programme_id")%>']").attr('selected', 'true');
                      	 
                         document.forms['editStudentForm']['stDOB'].value = "<%=studentData.getString("dob")%>";
                         document.forms['editStudentForm']['stEmail'].value = "<%=studentData.getString("email")%>";
                         document.forms['editStudentForm']['stPhone'].value = "<%=studentData.getString("phone")%>";
                         document.forms['editStudentForm']['stAddress'].value = "<%=studentData.getString("address")%>";
                         document.forms['editStudentForm']['stPincode'].value = "<%=studentData.getString("pincode")%>";
                         document.forms['editStudentForm']['stCity'].value = "<%=studentData.getString("birth_place")%>";
                         document.forms['editStudentForm']['stDistrict'].value = "<%=studentData.getString("birth_district")%>";
                         document.forms['editStudentForm']['stState'].value = "<%=studentData.getString("birth_state")%>";
                         document.forms['editStudentForm']['stYOF'].value = "<%=studentData.getString("joining_year")%>";
                         document.forms['editStudentForm']['sClass'].value = "<%=studentData.getString("class_name")%>";
                         document.forms['editStudentForm']['sClassYear'].value = "<%=studentData.getString("class_year")%>";
                         
                         
                         $("#stGender option[value!='<%=studentData.getString("gender")%>']").removeAttr("selected");
                         $("#stGender option[value='<%=studentData.getString("gender")%>']").attr('selected', 'true');
                         
                         $("#classDropDown2 option[id!='c<%=studentData.getString("class_id")%>']").removeAttr("selected");
                         $("#classDropDown2 option[id='c<%=studentData.getString("class_id")%>']").attr('selected', 'true');
                         $("#classDropDown2 option[value!='<%=studentData.getString("programme_id")%>']").hide();
                         
                         $("#classYearDropDown2 option[value!='c<%=studentData.getString("class_id")%>']").removeAttr("selected");
                         $("#classYearDropDown2 option[value='c<%=studentData.getString("class_id")%>']").attr('selected', 'true');
                         $("#classYearDropDown2 option[value!='c<%=studentData.getString("class_id")%>']").hide();
                         
                         var optionValue = "<%=studentData.getString("semester")%>";
                         var optionText = "<%=studentData.getString("semester")%>";
                         $('#programmeSemDropDown2').append(new Option(optionText, optionValue));
                         $("#programmeSemDropDown2 option[value!='<%=studentData.getString("semester")%>']").removeAttr("selected");
                         $("#programmeSemDropDown2 option[value='<%=studentData.getString("semester")%>']").attr('selected', 'true');
                         $("#programmeSemDropDown2 option[value!='<%=studentData.getString("semester")%>']").hide();
                         
                         document.forms['editStudentForm']['stRegNo'].value = "<%=studentData.getString("reg_no")%>";
                         document.forms['editStudentForm']['stPassword'].value = "<%=studentData.getString("password")%>";
                         document.forms['editStudentForm']['tempRegNo'].value = "<%=studentData.getString("reg_no")%>";
                     }
                    </script>
                    
                    <%
           				i++;
           					}
                    	}catch(SQLException e){
                    		e.printStackTrace();
                    	}
                    
                    %>
                    
                     <script type="text/javascript">
                     //Function to Delete Student Data Along With Result Data
                      document.getElementById("deleteStudent");
                      function deleteStudentData(uniqueId, Data){
              			
              			swal({title: "Warning",
              				 text: "Are you shure you want delete the Student along with results associated with him/her",
              				 icon: "warning",
              				 buttons: {
              					 cancel: "No",
              					 yes: "Yes",
              				 },	 
              			})
              			.then((value) => {	
              				if(value == "yes"){

 	            				document.forms['deleteDataForm']['uniqueId'].value = uniqueId;
 	            				document.forms['deleteDataForm']['Data'].value = Data;
 	            				
 	            				document.getElementById("deleteDataForm").submit();
              				}
              			});
              		}
                     
                      function changeProgrammeFilter(programme){
                    	  
                    	 if(programme == "All"){
                    		 $('#studentDataTable tr').show(); 
                    		 $("#classFilters option").attr("hidden",true);
                    		 $("#ClassFilters option[id='allTheClasses']").attr("hidden",true);
							
                    		 $('#classFilters').append($('<option>', {
                    			    value: 1,
                    			    text: 'Filter By Class',
                    			    selected: true,
                    			    disabled: true,
                    			    hidden: true
                    			}));
                    		 
                    		 $('#filterProgramme').append($('<option>', {
                 			    value: 1,
                 			    text: 'Filter By Programme',
                 			    selected: true,
                 			    disabled: true,
                 			    hidden: true
                 			}));
                    	 }else{
                    		 
                    		 $(".filterRow"+programme).show();
                        	 $('#studentDataTable').find('tr').not(".filterRow"+programme).hide();
                        	 $("#studentHeading").show();

                        	$("#classFilters option[id!="+programme+"]").attr("hidden",true);
                        	$("#classFilters option[id="+programme+"]").removeAttr("hidden");
                        	$("#ClassFilters option[id='allTheClasses']").removeAttr("hidden");
                        	$("#ClassFilters option[id='allTheClasses']").attr("value",programme);
                    	 }
                    	 
                    	  
                      }
                      
                      function changeClassFilter(className){
                     		 
                     		 $(".filterRow"+className).show();
                     		 $('#studentDataTable').find('tr').not(".filterRow"+className).hide();
                         	 $("#studentHeading").show();
                     	 
                      }
                    </script>
                    
                </table>
                </div>
            </div>
        
          
            <div class="bg-model6" id="addStudentDataDiv">
                <div class="model-content6" id="addStudentDataDiv2">
                    <div class="close6" id="close" >+</div>
                    <div class="header6">
                        <h1>Add Student Data</h1></div>
                         
                        <form id="insertStudentDataForm" action="InsertDataServlet" method="post">
                            <input id="studentFirstName" name="sFirstName" type="text" placeholder="First Name" class="merge1" required>
                            <input id="studentLastName" name="sLastName" type="text" placeholder="Last Name" class="merge1" required>
                            <select name="sGender" class="merge2" required>
                            <option value="" disabled selected hidden>Gender</option>
                            <option>Male</option>
                            <option>Female</option>
                            <option>Other</option>
                            </select>
                            <input id="studentDob" name="sdob" type="date" id="sdob" name="sdob" placeholder="Date of Birth" class="merge2" required>
                            <input id="studentEmail" name="sEmail" type="text" placeholder="Email" class="merge1" required>
                            <input id="studentPhone" name="sPhone" type="text" placeholder="Mobile Number" class="merge1" required>
                            <input id="studentAddress" name="sAddress" type="text" placeholder="Address" class="merge1" required>
                            <input id="studentPincode" name="sPincode" type="text" placeholder="Pincode" class="merge1" required>
                            <input id="studentCity" name="sCity" type="text" placeholder="city" class="merge3" required>
                            <input id="studentDistrict" name="sDistrict" type="text" placeholder="District" class="merge3" required>
                            <input id="studentState" name="sState" type="text" placeholder="State" class="merge3" required>
                            <input id="studentYof" name="sYearOfJoining" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Year Of Joining" class="merge2" required>
                            <select name="sProgramme" class="merge3" id="studentProgrammeSelect" onchange = "changeDropDownData(this.value)" required>
                            <option value="" disabled selected hidden>Programme</option>
		<% 
			ResultSet studentProgrammeData = loadData.loadProgrammeData();
			if(studentProgrammeData!= null){
				
				try{
					
					while(studentProgrammeData.next()){
		%>				
						<option value="<%=studentProgrammeData.getString("programme_id")%>" ><%=studentProgrammeData.getString("programme_name")%></option>
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
				</select>
				
                            <select class="merge3" id="classDropDown" name="classDropDown" onchange="changeDropDownData2(this.value)" onclick="changeDropDownData3(this.value)" required>
                            <option value=""  disabled selected hidden>class</option>
		<% 
			ResultSet studentClassData = loadData.loadOnlyClassData();
			if(studentProgrammeData!= null){
				
				try{
					
					while(studentClassData.next()){
		%>				
						<option value="<%=studentClassData.getString("programme_id")%>" id="cl<%=studentClassData.getString("class_id")%>"><%=studentClassData.getString("class_name")%></option>
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
                            </select>
                            
                            <select class="merge3" id="classYearDropDown" name="classYearDropDown"required>
                            <option value=""  disabled selected hidden>Class Year</option>
                    <% 
			ResultSet studentClassData2 = loadData.loadOnlyClassData();
			if(studentClassData2!= null){
				
				try{
					
					while(studentClassData2.next()){
		%>				
						<option value="cl<%=studentClassData2.getString("class_id")%>"><%=studentClassData2.getString("class_year")%></option>
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>        
                            </select>
                            <select name="sSemester" class="merge2" id="programmeSemDropDown" required>
                            <option value="" disabled selected hidden>Current Sem</option>
                            </select>
                            <input id="studentRegNo" name="sRegNo" type="text" placeholder="Register Number" class="merge1" required>
                            <input id="studentPassword" name="sPassword" type="text" placeholder="Password" class="merge1" required>
                            <input type="hidden" name="Data" value="student" required />
                            <input type="hidden" name="sClass" id="sclass" value=""/>
                            <input type="hidden" name="sClassYear" id="sClassYear" value="" required />
                            <input type="submit" id="button6" value="ADD"/>
                    <% 
			ResultSet studentProgrammeSem = loadData.loadProgrammeData();
			if(studentProgrammeSem!= null){
				
				try{
					
					while(studentProgrammeSem.next()){
		%>				
						<input type = "hidden" id="<%=studentProgrammeSem.getString("programme_id")%>" value = "<%=studentProgrammeSem.getString("programme_sem")%>">
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>        
                   <script type="text/javascript">
                   //add student form validation
                    const addStudentForm = document.getElementById("insertStudentDataForm");
                    const sFirstName = document.getElementById("studentFirstName");
                    const sLastName = document.getElementById("studentLastName");
                    const sPhone = document.getElementById("studentPhone");
                    const sDob = document.getElementById("studentDob");
                    const sEmail = document.getElementById("studentEmail");
                    const sAddress = document.getElementById("studentAddress");
                    const sCity = document.getElementById("studentCity");
                    const sPincode = document.getElementById("studentPincode");
                    const sDistrict = document.getElementById("studentDistrict");
                    const sState = document.getElementById("studentState");
                    const sYof = document.getElementById("studentYof");
                    const sRegNo = document.getElementById("studentRegNo");
                    const sPassword = document.getElementById("studentPassword");
                             
				 addStudentForm.addEventListener('submit', (e)=> {

					var onlyCharacters = /^[A-za-z]*$/;
					var onlyDigits = /^\d+$/; 
					var startingCaps = /^[A-Z]\w*/;
					var namePattern = /^[A-Z][a-z]*$/;
					
					var validMinDate = new Date();
					var dd = String(validMinDate.getDate()).padStart(2, '0');
					var mm = String(validMinDate.getMonth() + 1).padStart(2, '0'); //January is 0!
					var yyyy = validMinDate.getFullYear() -17;
					validMinDate = yyyy + '-' + mm + '-' + dd;
					
					var validMaxDate = new Date();
					var dd2 = String(validMaxDate.getDate()).padStart(2, '0');
					var mm2 = String(validMaxDate.getMonth() + 1).padStart(2, '0'); //January is 0!
					var yyyy2 = validMaxDate.getFullYear() -35;
					validMaxDate = yyyy2 + '-' + mm2 + '-' + dd2;
					
					var validMaxYear = new Date();
					var yyyy3 = validMaxYear.getFullYear();
					validMaxYear = yyyy3;
					
					var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
					var mobileNumber = /^[6-9]\d+/; 
					var city = /^[A-Z]{1}[a-z]+([ ]{1}[A-Z]{1}[a-z]+)?([-]{1}[A-Z]{1}[a-z]+)?([ ]{1}[A-Z]*[a-z]+)*?[a-z]$/;
					var pincode = /^[1-9]{1}[0-9]{2}[0-9]{3}$/;
					var address = /^[A-Z0-9]{1}[A-Za-z0-9 \'\.\-\,\;\:\#]*[A-Za-z0-9\.]$/;
					var districtState = /^[A-Za-z]*([ ]{1}[A-Z]{1}[a-z]+)*?[a-z]$/;
					
					var yearOfBirth = parseInt(/^\d{4}/.exec(sDob.value));
					var password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]*$/;
					
					if(onlyCharacters.test(sFirstName.value) == false){//First Name
						swal("Invalid First Name !","First Name can only contain Alphabets","error");
						e.preventDefault(); 
						
					}else if(sFirstName.value.length < 2){
						swal("Invalid First Name !","First Name should have at least 2 Characters","error");
						e.preventDefault(); 
					
					}else if(sFirstName.value.length > 15){
						swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
						e.preventDefault(); 
					
					}else if(startingCaps.test(sFirstName.value) == false){
						swal("Invalid First Name !","Starting Alphabet of the First Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if(namePattern.test(sFirstName.value) == false){
						swal("Invalid First Name !","Only Starting Alphabet of the First Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if(onlyCharacters.test(sLastName.value) == false){//Last Name
						swal("Invalid Last Name !","Last Name can only contain Alphabets","error");
						e.preventDefault(); 
						
					}else if(sLastName.value.length > 15){
						swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
						e.preventDefault(); 
					
					}else if(startingCaps.test(sLastName.value) == false){
						swal("Invalid Last Name !","Starting Alphabet of the Last Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if(namePattern.test(sLastName.value) == false){
						swal("Invalid Last Name !","Only Starting Alphabet of the Last Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if((sDob.value) > validMinDate){//DOB
						swal("Invalid Date of Birth !","Age must be greater than 17 years","error");
						e.preventDefault(); 
						
					}else if((sDob.value) < validMaxDate){
						swal("Invalid Date of Birth !","Age must be less than 35 years","error");
						e.preventDefault(); 
						
					}else if(email.test(sEmail.value) == false){//Email
						swal("Invalid Email !","Please Enter a valid Email address Format","error");
						e.preventDefault();
						
					}else if(sEmail.value.length > 25){
						swal("Invalid Email !","Email Address cannot be more than 25 Characters","error");
						e.preventDefault();
						
					}else if(onlyDigits.test(sPhone.value) == false){//Mobile Number
						swal("Invalid Mobile Number !","Mobile Number can only contain Digits","error");
						e.preventDefault(); 
						
					}else if(mobileNumber.test(sPhone.value) == false){
						swal("Invalid Mobile Number !","Starting Digit of Mobile Number can only begin from range '6-9'","error");
						e.preventDefault(); 
						
					}else if(sPhone.value.length < 10){
						swal("Invalid Mobile Number !","Mobile Number cannot be less than 10 Digits","error");
						e.preventDefault(); 
						
				 	}else if(sPhone.value.length > 10){
						swal("Invalid Mobile Number !","Mobile Number cannot be more than 10 Digits","error");
						e.preventDefault(); 
						
				 	}else if(address.test(sAddress.value) == false){//Address
				 		swal("Invalid Address !","Address can only contain Alphabets, Digits, White Spaces, some Special Characters like ' - , . : ; #  and starting Character can only be a Digit or a Capital Alphabet","error");
						e.preventDefault();
				 		
				 	}else if(sAddress.value.length > 25){
				 		swal("Invalid Address !","Address cannot be more than 25 Characters","error");
						e.preventDefault();
				 		
				 	}else if(sAddress.value.length < 3){
						swal("Invalid Address","Address cannot be less than 3 Characters","error");
						e.preventDefault();
						
					}else if(onlyDigits.test(sPincode.value) == false){//Pinclode
				 		swal("Invalid Pincode !","Pincode can only contain Digits","error");
						e.preventDefault();
				 		
				 	}else if(sPincode.value.length > 6){
				 		swal("Invalid Pincode !","Pincode cannot be more than 6 Digits","error");
						e.preventDefault();
				 		
				 	}else if(sPincode.value.length < 6){
				 		swal("Invalid Pincode !","Pincode cannot be less than 6 Digits","error");
						e.preventDefault();
				 		
				 	}else if(pincode.test(sPincode.value) == false){
				 		swal("Invalid Pincode !","Pincode cannot begin with '0'","error");
						e.preventDefault();	
						
				 	}else if(sCity.value.length < 3){//City
				 		swal("Invalid City !","City cannot contain less than 3 Characters","error");
						e.preventDefault();
				 		
				 	}else if(startingCaps.test(sCity.value) == false){
				 		swal("Invalid City !","Starting Alphabet of the City should be Capitalized","error");
						e.preventDefault();
				 		
				 	}else if(city.test(sCity.value) == false){
				 		swal("Invalid City !","City can only contain Alphabets, a Single Space after each Word and '-' Character  Eg:'Sangli-Miraj and Kupwad'","error");
						e.preventDefault();
				 		
				 	}else if(sCity.value.length > 20){
				 		swal("Invalid City !","City cannot contain more than 20 Characters","error");
						e.preventDefault();
				 		
				 	}else if(districtState.test(sDistrict.value) == false){//District
				 		swal("Invalid District !","District can only contain Alphabets and Single Space after each Word","error");
						e.preventDefault();
				 		
				 	}else if(sDistrict.value.length < 3){
				 		swal("Invalid District !","District cannot contain less than 3 Characters","error");
						e.preventDefault();
				 		
				 	}else if(startingCaps.test(sDistrict.value) == false){
				 		swal("Invalid District !","Starting Alphabet of the District should be capitalized","error");
						e.preventDefault();
				 		
				 	}else if(sDistrict.value.length > 20){
				 		swal("Invalid District !","District cannot contain more than 20 Characters","error");
						e.preventDefault();
						
				 	}else if(districtState.test(sState.value) == false){//State
				 		swal("Invalid State !","State can only contain Alphabets and a Single Space after each Word","error");
						e.preventDefault();
				 		
				 	}else if(sState.value.length < 3){
				 		swal("Invalid District !","District cannot contain less than 3 Characters","error");
						e.preventDefault();
				 		
				 	}else if(startingCaps.test(sState.value) == false){
				 		swal("Invalid State !","Starting Alphabet of the State should be capitalized","error");
						e.preventDefault();
				 		
				 	}else if(sState.value.length > 20){
				 		swal("Invalid State !","State cannot contain more than 20 Characters","error");
						e.preventDefault();
				 	
				 	}else if(sYof.value > validMaxYear){//Year of Joining
				 		swal("Invalid Year of Joining !","Year of Joining cannot be greater than Current Year","error");
						e.preventDefault();
				 		
				 	}else if((parseInt(sYof.value) - yearOfBirth) < 17){
				 		swal("Invalid Year of Joining !","Year of Joining should be greater than 17 years of Year of Birth","error");
						e.preventDefault();
				 		
				 	}else if((parseInt(sYof.value) - yearOfBirth) > 35){
				 		swal("Invalid Year of Joining !","Year of Joining should not be greater then 35 years of Year of Birth","error");
						e.preventDefault();
				 		
				 	}else if(onlyDigits.test(sRegNo.value) == false){//Reg No
				 		swal("Invalid Register Number !","Register Number can contain only Digits","error");
						e.preventDefault();
				 		
				 	}else if(sRegNo.value.length < 9){
				 		swal("Invalid Register Number !","Register Number cannot be less than 9 Characters","error");
						e.preventDefault();
				 		
				 	}else if(sRegNo.value.length > 9){
				 		swal("Invalid Register Number !","Register Number cannot be more than 9 Characters","error");
						e.preventDefault();
				 		
				 	}else if(password.test(sPassword.value) == false){//password
				 		swal("Invalid Password !","Password must contain at least one uppercase letter, one lowercase letter, one number and one special character","error");
						e.preventDefault();
				 		
				 	}else if(sPassword.value.length < 8){
				 		swal("Invalid Password !","Password must contain at leat 8 Characters","error");
						e.preventDefault();
				 		
				 	}else if(sPassword.value.length > 25){
				 		swal("Invalid Password !","Password must not contain more than 25 Characters","error");
						e.preventDefault();
				 		
				 	}
				 });
		                                
                            
                // function to insert and hide dropDown Data in Student Data        		
				window.onload = function removeduplicate(){
					var myclass = {};
					$("select[id='classDropDown'] > option").each(function() {
					    if(myclass[this.text]) {
					        $(this).hide();
					    } else {
					        myclass[this.text] = this.value;
					        $(this).hide();
					    }
					});
						
						var myyear = {};
						$("select[id='classYearDropDown'] > option").each(function() {
						    if(myyear[this.text]) {

						        $(this).hide();
						    } else {
						        myyear[this.text] = this.value;
						        $(this).hide();
						    }
						});
						

					}
                         	
					// function to Enable and Disabe dropDown Data in Student Data
	       				function changeDropDownData(studentProgrammeSelect){        
	       					if(studentProgrammeSelect!=''){
	       						
	       						$("#classDropDown option[value='"+studentProgrammeSelect+"']").show();
	       						$("#classDropDown option[value!='"+studentProgrammeSelect+"']").hide();
	       						document.getElementById("classDropDown").selectedIndex = "0";
	       						document.getElementById("classYearDropDown").selectedIndex = "0";
	       						$("#classYearDropDown option").hide();
	       						document.getElementById("programmeSemDropDown").selectedIndex = "0";
	       						
	       						
	       						var programmeSem = document.getElementById("p"+studentProgrammeSelect).value;
	       						var optionsCount = $('#programmeSemDropDown > option').length -1;
	       						console.log(optionsCount);
	       						console.log(programmeSem);
	       						if(programmeSem > optionsCount){
	       							
	       							for(let i=(optionsCount + 1);i<=(programmeSem);i++){
	       								$('#programmeSemDropDown').append(new Option(i, i));
	       							}
	       						}
	       						
	       						if(programmeSem < optionsCount){
	       							
	       							for(let i=(optionsCount);i>(programmeSem);i--){
	       								$("#programmeSemDropDown option[value='"+i+"']").remove();
	       							}
	       						}
	       						
	       						$("#programmeSemDropDown option").hide();
	       						
	       					}
	       				}
	       				
	       				function changeDropDownData2(studentClassSelect){                    					
	       					if(studentClassSelect!=''){
	       						
	       						var classId = $("#classDropDown option:selected").attr("id");
	       						
	       						$("#classYearDropDown option[value='"+classId+"']").show();
	       						$("#classYearDropDown option[value!='"+classId+"']").hide();
	       						$("#classYearDropDown option[value!='"+classId+"']").removeAttr("selected");
	       						$("#classYearDropDown option[value='"+classId+"']").attr("selected",true);
	       						
	       						$("#programmeSemDropDown option").hide();
	       						
	       						$("#classDropDown option:selected").each(function() {
	    							   var classId = this.text;
	    							   document.forms['insertStudentDataForm']['sClass'].value = classId;
	    							  
	    							}); 
	       						
	       					}
	       				}
	       				
	       				function changeDropDownData3(){                    					
	       						document.getElementById("programmeSemDropDown").selectedIndex = "0"; 
	       						
	       						$("#classYearDropDown option:selected").each(function() {
	       							   var classYear = parseInt($(this).text());
	       							   document.forms['insertStudentDataForm']['sClassYear'].value = classYear;
	       							   var firstSem = (classYear + classYear) -1; 
	       							   var secondSem = firstSem + 1;
	       							   
	       							   $("#programmeSemDropDown option[value='"+firstSem+"']").show();
	       							   $("#programmeSemDropDown option[value!='"+firstSem+"']").hide();
	       							   $("#programmeSemDropDown option[value='"+secondSem+"']").show();
	       							}); 
	       						
	       						$("#classYearDropDown option:selected").each(function() {
	     							   var classYear = this.text;
	     							   document.forms['insertStudentDataForm']['sClassYear'].value = classYear;
	     							  
	     							}); 
	       					
	       				}
                            </script>
                    </form>
                </div>
            </div>
            
            
            <div class="bg-model7">
                <div class="model-content7">
                    <div class="close7" id="close" >+</div>
                    <div class="header7">
                        <h1>Student Details</h1></div>
                        <div id="viewStudentDiv">
                            <input type="text" id="sFirstName" placeholder="First Name" class="merge1" readonly="readonly">
                            <input type="text" id="sLastName" placeholder="Last Name" class="merge1" readonly="readonly">
                            <input class="merge2" id="sGender" readonly="readonly">
                            <input type="text" id="sDOB" placeholder="Date of Birth" class="merge2" readonly="readonly">
                            <input type="text" id="sEmail" placeholder="Email" class="merge1" readonly="readonly">
                            <input type="text" id="sPhone" placeholder="Mobile Number" class="merge1" readonly="readonly">
                            <input type="text" id="sAddress" placeholder="Address" class="merge1" readonly="readonly">
                            <input type="text" id="sPincode" placeholder="Pincode" class="merge1" readonly="readonly">
                            <input type="text" id="sCity" placeholder="city" class="merge3" readonly="readonly">
                            <input type="text" id="sDistrict" placeholder="District" class="merge3" readonly="readonly">
                            <input type="text" id="sState" placeholder="State" class="merge3" readonly="readonly">
                            <input type="text" id="sYOF" placeholder="Year Of Joining" class="merge2" readonly="readonly">
                            <input class="merge3" id="sProgramme" readonly="readonly">
                            <input class="merge3" id="sClass" readonly="readonly">
                            <input class="merge3" id="sClassYear2" readonly="readonly">
                            <input class="merge2" id="sCurrentSem" readonly="readonly">
                            <input type="text" id="sRegNo" placeholder="Register Number" class="merge1" readonly="readonly">
                            <input type="text" id="sPassword" placeholder="Password" class="merge1" readonly="readonly">
                    	</div>
                </div>
            </div>
            
            
            <div class="bg-model8">
                <div class="model-content8">
                    <div class="close8" id="close" >+</div>
                    <div class="header8">
                        <h1>Edit Student Details</h1></div>
                        
                        
                        <form id = "editStudentForm" action="UpdateDataServlet" method="post">
                            <input name="sFirstName" id="stFirstName" type="text" placeholder="First Name" class="merge1" required>
                            <input name="sLastName" id="stLastName"  type="text" placeholder="Last Name" class="merge1" required>
                            <select name="sGender" id="stGender" class="merge2" required>
                            <option value="" disabled hidden>Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                            </select>
                            <input name="sdob" id="stDOB" type="date" placeholder="Date of Birth" class="merge2" required>
                            <input name="sEmail" id="stEmail" type="text" placeholder="Email" class="merge1" required>
                            <input name="sPhone" id="stPhone" type="text" placeholder="Mobile Number" class="merge1" required>
                            <input name="sAddress"  id="stAddress" type="text" placeholder="Address" class="merge1" required>
                            <input name="sPincode" id="stPincode" type="text" placeholder="Pincode" class="merge1"required>
                            <input name="sCity" id="stCity" type="text" placeholder="city" class="merge3" required>
                            <input name="sDistrict"  id="stDistrict" type="text" placeholder="District" class="merge3" required>
                            <input name="sState" id="stState" type="text" placeholder="State" class="merge3" required>
                            <input name="sYearOfJoining" id="stYOF" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Year Of Joining" class="merge2" required>
                            <select name="sProgramme" id="stProgramme" class="merge3" onclick = "changeDropDownData4(this.value)" required>
                            <option value="" disabled selected hidden>Programme</option>
        <% 
			ResultSet studentProgrammeData3 = loadData.loadProgrammeData();
			if(studentProgrammeData3!= null){
				
				try{
					
					while(studentProgrammeData3.next()){
		%>				
						<option value="<%=studentProgrammeData3.getString("programme_id")%>" ><%=studentProgrammeData3.getString("programme_name")%></option>
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
				</select>
				
                            <select class="merge3" id="classDropDown2" name="classDropDown" onchange="changeDropDownData5(this.value)" onclick="changeDropDownData6(this.value)" required>
                            <option value=""  disabled selected hidden>class</option>
		<% 
			ResultSet studentClassData3 = loadData.loadOnlyClassData();
			if(studentProgrammeData3!= null){
				
				try{
					
					while(studentClassData3.next()){
		%>				
						<option value="<%=studentClassData3.getString("programme_id")%>" id="c<%=studentClassData3.getString("class_id")%>"><%=studentClassData3.getString("class_name")%></option>
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
                            </select>
                            
                            <select class="merge3" id="classYearDropDown2" name="classYearDropDown" required>
                            <option value=""  disabled selected hidden>Class Year</option>
                    <% 
			ResultSet studentClassData4 = loadData.loadOnlyClassData();
			if(studentClassData4!= null){
				
				try{
					
					while(studentClassData4.next()){
		%>				
						<option value="c<%=studentClassData4.getString("class_id")%>"><%=studentClassData4.getString("class_year")%></option>
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
                            </select>
                            <select name="sSemester" onclick="removeSemDuplicate()" class="merge2" id="programmeSemDropDown2" required>
                            <option value="" disabled selected hidden>Current Sem</option>
                            </select>
                            
                            
                            <input name="sRegNo" id="stRegNo" type="text" placeholder="Register Number" class="merge1" readonly="readonly" required>
                            <input id="stPassword" type="password" placeholder="Password" class="merge1" readonly="readonly" required>
                            <input type="hidden" name="Data" value="student" required />
                            <input type="hidden" name="sClass" id="stClass" value="" required/>
                            <input type="hidden" name="sClassYear" id="stClassYear" value="" required />
                            <input type="hidden" name="temp" value="" id="tempRegNo"/>
                            <input type="submit" id="button8" value="UPDATE" >
		<% 
			ResultSet studentProgrammeSem2 = loadData.loadProgrammeData();
			if(studentProgrammeSem!= null){
				
				try{
					
					while(studentProgrammeSem2.next()){
		%>				
						<input type = "hidden" id="p<%=studentProgrammeSem2.getString("programme_id")%>" value = "<%=studentProgrammeSem2.getString("programme_sem")%>">
		<%			}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>                            
                            
                            <script type="text/javascript">
                            //edit student validation
                    const editStudentForm = document.getElementById("editStudentForm");
                    const sFirstName2 = document.getElementById("stFirstName");
                    const sLastName2 = document.getElementById("stLastName");
                    const sPhone2 = document.getElementById("stPhone");
                    const sDob2 = document.getElementById("stDOB");
                    const sEmail2 = document.getElementById("stEmail");
                    const sAddress2 = document.getElementById("stAddress");
                    const sCity2 = document.getElementById("stCity");
                    const sPincode2 = document.getElementById("stPincode");
                    const sDistrict2 = document.getElementById("stDistrict");
                    const sState2 = document.getElementById("stState");
                    const sYof2 = document.getElementById("stYOF");
          
                             
                    editStudentForm.addEventListener('submit', (e)=> {

					var onlyCharacters = /^[A-za-z]*$/;
					var onlyDigits = /^\d+$/; 
					var startingCaps = /^[A-Z]\w*/;
					var namePattern = /^[A-Z][a-z]*$/;
					
					var validMinDate = new Date();
					var dd = String(validMinDate.getDate()).padStart(2, '0');
					var mm = String(validMinDate.getMonth() + 1).padStart(2, '0'); //January is 0!
					var yyyy = validMinDate.getFullYear() -17;
					validMinDate = yyyy + '-' + mm + '-' + dd;
					
					var validMaxDate = new Date();
					var dd2 = String(validMaxDate.getDate()).padStart(2, '0');
					var mm2 = String(validMaxDate.getMonth() + 1).padStart(2, '0'); //January is 0!
					var yyyy2 = validMaxDate.getFullYear() -35;
					validMaxDate = yyyy2 + '-' + mm2 + '-' + dd2;
					
					var validMaxYear = new Date();
					var yyyy3 = validMaxYear.getFullYear();
					validMaxYear = yyyy3;
					
					var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
					var mobileNumber = /^[6-9]\d+/; 
					var city = /^[A-Z]{1}[a-z]+([ ]{1}[A-Z]{1}[a-z]+)?([-]{1}[A-Z]{1}[a-z]+)?([ ]{1}[A-Z]*[a-z]+)*?[a-z]$/;
					var pincode = /^[1-9]{1}[0-9]{2}[0-9]{3}$/;
					var address = /^[A-Z0-9]{1}[A-Za-z0-9 \'\.\-\,\;\:\#]*[A-Za-z0-9\.]$/;
					var districtState = /^[A-Za-z]*([ ]{1}[A-Z]{1}[a-z]+)*?[a-z]$/;
					
					var yearOfBirth = parseInt(/^\d{4}/.exec(sDob2.value));
					
					if(onlyCharacters.test(sFirstName2.value) == false){//First Name
						swal("Invalid First Name !","First Name can only contain Alphabets","error");
						e.preventDefault(); 
						
					}else if(sFirstName2.value.length < 2){
						swal("Invalid First Name !","First Name should have at least 2 Characters","error");
						e.preventDefault(); 
					
					}else if(sFirstName2.value.length > 15){
						swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
						e.preventDefault(); 
					
					}else if(startingCaps.test(sFirstName2.value) == false){
						swal("Invalid First Name !","Starting Alphabet of the First Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if(namePattern.test(sFirstName2.value) == false){
						swal("Invalid First Name !","Only Starting Alphabet of the First Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if(onlyCharacters.test(sLastName2.value) == false){//Last Name
						swal("Invalid Last Name !","Last Name can only contain Alphabets","error");
						e.preventDefault(); 
						
					}else if(sLastName2.value.length > 15){
						swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
						e.preventDefault(); 
					
					}else if(startingCaps.test(sLastName2.value) == false){
						swal("Invalid Last Name !","Starting Alphabet of the Last Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if(namePattern.test(sLastName2.value) == false){
						swal("Invalid Last Name !","Only Starting Alphabet of the Last Name should be Capitalized","error");
						e.preventDefault(); 
						
					}else if((sDob2.value) > validMinDate){//DOB
						swal("Invalid Date of Birth !","Age must be greater than 17 years","error");
						e.preventDefault(); 
						
					}else if((sDob2.value) < validMaxDate){
						swal("Invalid Date of Birth !","Age must be less than 35 years","error");
						e.preventDefault(); 
						
					}else if(email.test(sEmail2.value) == false){//Email
						swal("Invalid Email !","Please Enter a valid Email address Format","error");
						e.preventDefault();
						
					}else if(sEmail2.value.length > 25){
						swal("Invalid Email !","Email Address cannot be more than 25 Characters","error");
						e.preventDefault();
						
					}else if(onlyDigits.test(sPhone2.value) == false){//Mobile Number
						swal("Invalid Mobile Number !","Mobile Number can only contain Digits","error");
						e.preventDefault(); 
						
					}else if(mobileNumber.test(sPhone2.value) == false){
						swal("Invalid Mobile Number !","Starting Digit of Mobile Number can only begin from range '6-9'","error");
						e.preventDefault(); 
						
					}else if(sPhone2.value.length < 10){
						swal("Invalid Mobile Number !","Mobile Number cannot be less than 10 Digits","error");
						e.preventDefault(); 
						
				 	}else if(sPhone2.value.length > 10){
						swal("Invalid Mobile Number !","Mobile Number cannot be more than 10 Digits","error");
						e.preventDefault(); 
						
				 	}else if(address.test(sAddress2.value) == false){//Address
				 		swal("Invalid Address !","Address can only contain Alphabets, Digits, White Spaces, some Special Characters like ' - , . : ; #  and starting Character can only be a Digit or a Capital Alphabet","error");
						e.preventDefault();
				 		
				 	}else if(sAddress2.value.length < 3){
						swal("Invalid Address","Address cannot be less than 3 Characters","error");
						e.preventDefault();
						
					}else if(sAddress2.value.length > 25){
				 		swal("Invalid Address !","Address cannot be more than 25 Characters","error");
						e.preventDefault();
				 		
				 	}else if(onlyDigits.test(sPincode2.value) == false){//Pinclode
				 		swal("Invalid Pincode !","Pincode can only contain Digits","error");
						e.preventDefault();
				 		
				 	}else if(sPincode2.value.length > 6){
				 		swal("Invalid Pincode !","Pincode cannot be more than 6 Digits","error");
						e.preventDefault();
				 		
				 	}else if(sPincode2.value.length < 6){
				 		swal("Invalid Pincode !","Pincode cannot be less than 6 Digits","error");
						e.preventDefault();
				 		
				 	}else if(pincode.test(sPincode2.value) == false){
				 		swal("Invalid Pincode !","Pincode cannot begin with '0'","error");
						e.preventDefault();	
						
				 	}else if(sCity2.value.length < 3){//City
				 		swal("Invalid City !","City cannot contain less than 3 Characters","error");
						e.preventDefault();
				 		
				 	}else if(startingCaps.test(sCity2.value) == false){
				 		swal("Invalid City !","Starting Alphabet of the City should be Capitalized","error");
						e.preventDefault();
				 		
				 	}else if(city.test(sCity2.value) == false){
				 		swal("Invalid City !","City can only contain Alphabets, a Single Space after each Word and '-' Character  Eg:'Sangli-Miraj and Kupwad'","error");
						e.preventDefault();
				 		
				 	}else if(sCity2.value.length > 20){
				 		swal("Invalid City !","City cannot contain more than 20 Characters","error");
						e.preventDefault();
				 		
				 	}else if(districtState.test(sDistrict2.value) == false){//District
				 		swal("Invalid District !","District can only contain Alphabets and Single Space after each Word","error");
						e.preventDefault();
				 		
				 	}else if(sDistrict2.value.length < 3){
				 		swal("Invalid District !","District cannot contain less than 3 Characters","error");
						e.preventDefault();
				 		
				 	}else if(startingCaps.test(sDistrict2.value) == false){
				 		swal("Invalid District !","Starting Alphabet of the District should be capitalized","error");
						e.preventDefault();
				 		
				 	}else if(sDistrict2.value.length > 20){
				 		swal("Invalid District !","District cannot contain more than 20 Characters","error");
						e.preventDefault();
						
				 	}else if(districtState.test(sState2.value) == false){//State
				 		swal("Invalid State !","State can only contain Alphabets and a Single Space after each Word","error");
						e.preventDefault();
				 		
				 	}else if(sState2.value.length < 3){
				 		swal("Invalid District !","District cannot contain less than 3 Characters","error");
						e.preventDefault();
				 		
				 	}else if(startingCaps.test(sState2.value) == false){
				 		swal("Invalid State !","Starting Alphabet of the State should be capitalized","error");
						e.preventDefault();
				 		
				 	}else if(sState2.value.length > 20){
				 		swal("Invalid State !","State cannot contain more than 20 Characters","error");
						e.preventDefault();
				 	
				 	}else if(sYof2.value > validMaxYear){//Year of Joining
				 		swal("Invalid Year of Joining !","Year of Joining cannot be greater than Current Year","error");
						e.preventDefault();
				 		
				 	}else if((parseInt(sYof2.value) - yearOfBirth) < 17){
				 		swal("Invalid Year of Joining !","Year of Joining should be greater than 17 years of Year of Birth","error");
						e.preventDefault();
				 		
				 	}else if((parseInt(sYof2.value) - yearOfBirth) > 35){
				 		swal("Invalid Year of Joining !","Year of Joining should not be greater then 35 years of Year of Birth","error");
						e.preventDefault();
				 		
				 	}
				 });
                            
                            function changeDropDownData4(studentProgrammeSelect){        
    	       					if(studentProgrammeSelect!=''){
    	       						
    	       						$("#classDropDown2 option[value='"+studentProgrammeSelect+"']").show();
    	       						$("#classDropDown2 option[value!='"+studentProgrammeSelect+"']").hide();
    	       						document.getElementById("classDropDown2").selectedIndex = "0";
    	       						document.getElementById("classYearDropDown2").selectedIndex = "0";
    	       						$("#classYearDropDown2 option").hide();
    	       						document.getElementById("programmeSemDropDown2").selectedIndex = "0";
    	       						
    	       						
    	       						var programmeSem = document.getElementById("p"+studentProgrammeSelect).value;
    	       						var optionsCount = $('#programmeSemDropDown2 > option').length -1;
    	       						
    	       						if(programmeSem > optionsCount){
    	       							
    	       							for(let i=(optionsCount + 1);i<=(programmeSem);i++){
    	       								$('#programmeSemDropDown2').append(new Option(i, i));
    	       							}
    	       						}
    	       						
    	       						if(programmeSem < optionsCount){
    	       							
    	       							for(let i=(optionsCount);i>(programmeSem);i--){
    	       								$("#programmeSemDropDown2 option[value='"+i+"']").remove();
    	       							}
    	       						}
    	       						
    	       						$("#programmeSemDropDown2 option").hide();
    	       						
    	       					}
    	       				}
    	       				
    	       				function changeDropDownData5(studentClassSelect){                    					
    	       					if(studentClassSelect!=''){
    	       						
    	       						var classId = $("#classDropDown2 option:selected").attr("id");
    	       						
    	       						$("#classYearDropDown2 option[value='"+classId+"']").show();
    	       						$("#classYearDropDown2 option[value!='"+classId+"']").hide();
    	       						$("#classYearDropDown2 option[value!='"+classId+"']").removeAttr("selected");
    	       						$("#classYearDropDown2 option[value='"+classId+"']").attr("selected",true);
    	       						
    	       						$("#programmeSemDropDown2 option").hide();
    	       						
    	       						$("#classDropDown2 option:selected").each(function() {
    	    							   var classId = this.text;
    	    							   document.forms['editStudentForm']['stClass'].value = classId;
    	    							  
    	    							});
    	       						
    	       						var programmeSem = document.getElementById("p"+studentClassSelect).value;
    	       						var optionsCount = $('#programmeSemDropDown2 > option').length -1;
    	       						
    	       						if(programmeSem > optionsCount){
    	       							
    	       							for(let i=(optionsCount + 1);i<=(programmeSem);i++){
    	       								$('#programmeSemDropDown2').append(new Option(i, i));
    	       							}
    	       						}
    	       						
    	       						if(programmeSem < optionsCount){
    	       							
    	       							for(let i=(optionsCount);i>(programmeSem);i--){
    	       								$("#programmeSemDropDown2 option[value='"+i+"']").remove();
    	       							}
    	       						}
    	       						
    	       					}
    	       				}
    	       				
    	       				function changeDropDownData6(){                    					
    	       						document.getElementById("programmeSemDropDown2").selectedIndex = "0"; 
    	       						
    	       						$("#classYearDropDown2 option:selected").each(function() {
    	       							   var classYear = parseInt($(this).text());
    	       							   document.forms['editStudentForm']['stClassYear'].value = classYear;
    	       							   var firstSem = (classYear + classYear) -1; 
    	       							   var secondSem = firstSem + 1;
    	       							   
    	       							   $("#programmeSemDropDown2 option[value='"+firstSem+"']").show();
    	       							   $("#programmeSemDropDown2 option[value!='"+firstSem+"']").hide();
    	       							   $("#programmeSemDropDown2 option[value='"+secondSem+"']").show();
    	       							}); 
    	       						
    	       						$("#classYearDropDown2 option:selected").each(function() {
    	     							   var classYear = this.text;
    	     							   document.forms['editStudentForm']['sClassYear'].value = classYear;
    	     							  
    	     							}); 
    	       					
    	       				}
    	       				
    	       				function removeSemDuplicate(){
	    						$("#programmeSemDropDown2 option").each(function() {
	    							  $(this).siblings('[value="'+ this.value +'"]').remove();
	    							});
    	       					
    	       				}
                            
                            </script>
                    </form>
                </div>
            </div>
         </div>
        
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------ TAB 3 STAFF DETAILS --------------------------------------------------------------------------------- -->
            
            <div class="tabs__content" data-tab="3" id="staffDetails">
                <div class="protab"> 
                    <h4>Staff Details Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Staff list</h6>
                        <select class="select3" id="filterProgrammeStaff" onchange="changeProgrammeFilterStaff(this.value)">
                        <option value="" disabled selected hidden>Filter By Programme</option>
                        <option value="All">All Programme's</option>
                         
	                <%
	                	ResultSet FilterProgrammeClass = loadData.loadProgrammeData();
	                	if(FilterProgrammeClass != null){
	                		while(FilterProgrammeClass.next()){
	                			
	                %>	
	                	<option value="<%=FilterProgrammeClass.getString("programme_id")%>"><%=FilterProgrammeClass.getString("programme_name")%></option>	
	                <%		}
	                	}
	                
	                %>        
                        </select>
                        <div class="icon"><i class="fa fa-plus-circle" id="add3" title="Add programme" onclick="myFunction12()"></i></div></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all" id="staffDataTable">
                        <tr id="staffHeader">
                            <th>Programme Name</th>
                            <th>Staff Name</th>
                            <th>Staff ID</th>
                            <th>Role</th>
                            <th>View Staff Details</th>
                            <th>Action</th>
                        </tr>
                        <%
                        	ResultSet staffDataSet = loadData.loadStaffData();
                        	
                        	if(staffDataSet != null){
                        		
                        		try{
                        			int i = 1;
                        			while(staffDataSet.next()){
                        %>				
                        <tr class="filterRowStaff<%=staffDataSet.getString("programme_id")%>">
                            <td class="td1"><%=staffDataSet.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=staffDataSet.getString("first_name")+" "+staffDataSet.getString("last_name")%></td>   <!--staffName-->
                            <td class="td7"><%=staffDataSet.getString("staff_id")%></td>   <!--staffId-->
                            <td class="td8"><%=staffDataSet.getString("role")%></td>   <!--Role-->
                            <td class="td2"><button class="btn__edit" id="viewStaff<%=i%>" onclick="viewStaffDetails<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>View</button></td> <!--Edit course-->
                            <td class="td3"><div class="circle1" title="Edit Staff" id="editStaff<%=i%>" onclick="editStaffDetails<%=i%>()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div id="deleteStaff" onclick="deleteStaffData('<%=staffDataSet.getString("staff_id")%>','staff','<%=staffDataSet.getString("first_name")+' '+staffDataSet.getString("last_name")%>')" class="circle2" title="Delete Staff"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                        
                        <script type="text/javascript">
                        document.getElementById("viewStaff<%=i%>");
                        function viewStaffDetails<%=i%>(){
                        	
                        	document.querySelector('.bg-model10').style.display = 'flex';
                        	document.querySelector('.bg-model10').style.position = 'fixed';
                        	
                            document.getElementById("staffFirstName").value = "<%=staffDataSet.getString("first_name")%>";
                            document.getElementById("staffLastName").value = "<%=staffDataSet.getString("last_name")%>";
                            document.getElementById("staffGender").value = "<%=staffDataSet.getString("gender")%>";
                            document.getElementById("staffEmail").value = "<%=staffDataSet.getString("email")%>";
                            document.getElementById("StaffPhone").value = "<%=staffDataSet.getString("phone")%>";
                            document.getElementById("staffAddress").value = "<%=staffDataSet.getString("address")%>";
                            document.getElementById("staffProgramme").value = "<%=staffDataSet.getString("programme_name")%>";
                            document.getElementById("staffId").value = "<%=staffDataSet.getString("staff_id")%>";
                            document.getElementById("staffPassword").value = "<%=staffDataSet.getString("password")%>";
                           
                        }
                        
                        document.getElementById("editStaff<%=i%>");
                        document.getElementById("editStudentDiv");
                        function editStaffDetails<%=i%>(){
                       
                      
                        	document.querySelector('.bg-model11').style.display = 'flex';
                        	document.querySelector('.bg-model11').style.position = 'fixed';
                        	
                        	var firstName = "<%=staffDataSet.getString("first_name")%>";
                        	var secondName = "<%=staffDataSet.getString("last_name")%>";
                        	var staffId = "<%=staffDataSet.getString("staff_id")%>";
                        	var staffEmail = "<%=staffDataSet.getString("email")%>";
                        	var staffPhone = "<%=staffDataSet.getString("phone")%>";
                        	var staffAddress = "<%=staffDataSet.getString("address")%>";
                        	
                        	document.forms['editStaffForm']['staffFirstName2'].value = firstName;
                        	document.forms['editStaffForm']['staffLastName2'].value = secondName;
                        	document.forms['editStaffForm']['staffId2'].value = staffId;
                        	document.forms['editStaffForm']['tempStaffId'].value = "<%=staffDataSet.getString("staff_id")%>";
                        	document.forms['editStaffForm']['staffEmail2'].value = staffEmail;
                        	document.forms['editStaffForm']['staffPhone2'].value = staffPhone;
                        	document.forms['editStaffForm']['staffAddress2'].value = staffAddress;
                        	document.forms['editStaffForm']['staffPassword2'].value = "<%=staffDataSet.getString("password")%>";
                        	
                        	$("#staffGender2 option[value!='<%=staffDataSet.getString("gender")%>']").removeAttr("selected");
                        	$("#staffGender2 option[value='<%=staffDataSet.getString("gender")%>']").attr("selected",true);
                        	
                        	$("#staffProgramme2 option[id!='pro<%=staffDataSet.getString("programme_id")%>']").removeAttr("selected");
                        	$("#staffProgramme2 option[id='pro<%=staffDataSet.getString("programme_id")%>']").attr("selected",true);
                        	
                        	var role = "<%=staffDataSet.getString("role")%>";
                        	console.log(role);
                        	
                        	if(role == "Internal Auditor"){
                        		$("#staffRole2 option[id!='internalAudit']").removeAttr("selected");
                            	$("#staffRole2 option[id='internalAudit']").attr("selected",true);
                        	
                        	}else{
                        		$("#staffRole2 option[id!='Facul']").removeAttr("selected");
                            	$("#staffRole2 option[id='Facul']").attr("selected",true);
                        		
                        	}
                        }
                        </script>
                        
						<%		
								i++;	
									}
                        			
                        		}catch(SQLException e){}
                        	}
                        %>
                        <script type="text/javascript">
	                        function changeProgrammeFilterStaff(programme){
	                      	  
		                       	 if(programme == "All"){
		                       		 $('#staffDataTable tr').show(); 
		                           	 
		                    		 $('#filterProgrammeStaff').append($('<option>', {
		                  			    value: 1,
		                  			    text: 'Filter By Programme',
		                  			    selected: true,
		                  			    disabled: true,
		                  			    hidden: true
		                  			}));
		                       	 
		                       	 }else{
		                       		 
		                       		 $(".filterRowStaff"+programme).show();
		                           	 $('#staffDataTable').find('tr').not(".filterRowStaff"+programme).hide();
		                           	 $("#staffHeader").show();
		                       	 }
	                         }
                        </script>
                    </table>
                     <script type="text/javascript">
		                     document.getElementById("deleteStaff");
		                     function deleteStaffData(uniqueId, Data, staffName){
		             			
		             			swal({title: "Warning",
		             				 text: "Are you shure you want delete Staff "+"''"+staffName+"''",
		             				 icon: "warning",
		             				 buttons: {
		             					 cancel: "No",
		             					 yes: "Yes",
		             				 },	 
		             			})
		             			.then((value) => {	
		             				if(value == "yes"){
		
			            				document.forms['deleteDataForm']['uniqueId'].value = uniqueId;
			            				document.forms['deleteDataForm']['Data'].value = Data;
			            				
			            				document.getElementById("deleteDataForm").submit();
		             				}
		             			});
		             		}	 
					 </script>
                    </div>
                </div>
                
                
                <div class="bg-model9">
                    <div class="model-content9">
                        <div class="close9" id="close" >+</div>
                        <div class="header9">
                            <h1>Add Staff Details</h1></div>
                             
                            <form id="insertStaffDataForm" action="InsertDataServlet" method="post">
                                <input id="staffFN" name="firstName" type="text" placeholder="First Name" class="merge4" required>
                                <input id="staffLN" name="lastName" type="text" placeholder="Last Name" class="merge4" required>
                                <select name="gender" class="merge5" required>
                                <option value="" disabled selected hidden>Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                                </select>
                                <input id="staffEm" name="email" type="text" placeholder="Email" class="merge4" required>
                                <input id="staffPh" name="phone" type="text" placeholder="Mobile Number" class="merge4" required>
                                <input id="staffAd" name="address" type="text" placeholder="Address" class="merge5" required>
                                <select name="programmeId" class="merge4" required>
                                <option value="" disabled selected hidden>Programme</option>
							<%
								ResultSet programmeDataSet = loadData.loadProgrammeData();
								
								if(programmeDataSet != null){
									
									try{

										while(programmeDataSet.next()){
							%>	
											<option value="<%=programmeDataSet.getString("programme_id")%>"><%=programmeDataSet.getString("programme_name")%></option>			
							<% 			}
										
									}catch(SQLException e){
										
									}
								}
							%>
                                </select>
                                <select name="staffRole" class="merge4" required >
                                <option value="" disabled selected hidden>Role</option>
                                <option value="Internal Auditor">Internal Auditor</option>
                                <option value="Faculty">Faculty</option>
                                </select>
                                <input id="staffI" name="staffId" type="text" placeholder="Staff ID(Digits only)" class="merge4" required>
                                <input id="staffPass" name="password" type="text" placeholder="Password" class="merge4" required>
                                <input name="Data" type="hidden" value="staff"/>
                                <input type="submit" id="button9" value="ADD" />
                                
                                <script type="text/javascript">
                                	const insertStaffForm = document.getElementById("insertStaffDataForm");
									const staffFirstName = document.getElementById("staffFN");
									const staffLastName = document.getElementById("staffLN");
								 	const staffEmail = document.getElementById("staffEm");
								 	const staffPhone = document.getElementById("staffPh");
								 	const staffAddress = document.getElementById("staffAd");
								 	const staffId = document.getElementById("staffI");
								 	const staffPassword = document.getElementById("staffPass");
									
								 	insertStaffForm.addEventListener('submit', (e)=> {
								 		
								 		var onlyCharacters = /^[A-za-z]*$/;
										var onlyDigits = /^\d+$/; 
										var startingCaps = /^[A-Z]\w*/;
										var namePattern = /^[A-Z][a-z]*$/;										
										var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
										var mobileNumber = /^[6-9]\d+/; 
										var address = /^[A-Z0-9]{1}[A-Za-z0-9 \'\.\-\,\;\:\#]*[A-Za-z0-9\.]$/;
										var sID = /^\d*$/;
										var password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]*$/;
										
										if(onlyCharacters.test(staffFirstName.value) == false){//First Name
											swal("Invalid First Name !","First Name can only contain Alphabets","error");
											e.preventDefault(); 
											
										}else if(staffFirstName.value.length < 2){
											swal("Invalid First Name !","First Name should have at least 2 Characters","error");
											e.preventDefault(); 
										
										}else if(staffFirstName.value.length > 15){
											swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
											e.preventDefault(); 
										
										}else if(startingCaps.test(staffFirstName.value) == false){
											swal("Invalid First Name !","Starting Alphabet of the First Name should be Capitalized","error");
											e.preventDefault(); 
											
										}else if(namePattern.test(staffFirstName.value) == false){
											swal("Invalid First Name !","Only Starting Alphabet of the First Name should be Capitalized","error");
											e.preventDefault(); 
											
										}else if(onlyCharacters.test(staffLastName.value) == false){//Last Name
											swal("Invalid Last Name !","Last Name can only contain Alphabets","error");
											e.preventDefault(); 
											
										}else if(staffLastName.value.length > 15){
											swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
											e.preventDefault(); 
										
										}else if(startingCaps.test(staffLastName.value) == false){
											swal("Invalid Last Name !","Starting Alphabet of the Last Name should be Capitalized","error");
											e.preventDefault(); 
											
										}else if(namePattern.test(staffLastName.value) == false){
											swal("Invalid Last Name !","Only Starting Alphabet of the Last Name should be Capitalized","error");
											e.preventDefault(); 
											
										}else if(email.test(staffEmail.value) == false){//Email
											swal("Invalid Email !","Please Enter a valid Email address Format","error");
											e.preventDefault();
											
										}else if(staffEmail.length > 25){
											swal("Invalid Email !","Email Address cannot be more than 25 Characters","error");
											e.preventDefault();
											
										}else if(onlyDigits.test(staffPhone.value) == false){//Mobile Number
											swal("Invalid Mobile Number !","Mobile Number can only contain Digits","error");
											e.preventDefault(); 
											
										}else if(mobileNumber.test(staffPhone.value) == false){
											swal("Invalid Mobile Number !","Starting Digit of Mobile Number can only begin from range '6-9'","error");
											e.preventDefault(); 
											
										}else if(staffPhone.value.length < 10){
											swal("Invalid Mobile Number !","Mobile Number cannot be less than 10 Digits","error");
											e.preventDefault(); 
											
									 	}else if(staffPhone.value.length > 10){
											swal("Invalid Mobile Number !","Mobile Number cannot be more than 10 Digits","error");
											e.preventDefault(); 
											
									 	}else if(address.test(staffAddress.value) == false){//Address
									 		swal("Invalid Address !","Address can only contain Alphabets, Digits, White Spaces, some Special Characters like ' - , . : ; #  and starting Character can only be a Digit or a Capital Alphabet","error");
											e.preventDefault();
									 		
									 	}else if(staffAddress.value.length > 25){
									 		swal("Invalid Address !","Address cannot be more than 25 Characters","error");
											e.preventDefault();
									 		
									 	}else if(staffAddress.length < 3){
											swal("Invalid Address","Address cannot be less than 3 Characters","error");
											e.preventDefault();
											
										}else if(sID.test(staffId.value) == false){//Staff ID
									 		swal("Invalid Staff ID !","Staff ID can only contain Digits","error");
											e.preventDefault();
									 		
									 	}else if(staffId.value.length < 3){
									 		swal("Invalid Staff ID !","staff ID cannot be less than 3 Characters","error");
											e.preventDefault();
									 		
									 	}else if(staffId.value.length > 3){
									 		swal("Invalid Staff ID !","Staff ID cannot be more than 3 Characters","error");
											e.preventDefault();
									 		
									 	}else if(password.test(staffPassword.value) == false){//password
									 		swal("Invalid Password !","Password must contain at least one uppercase letter, one lowercase letter, one number and one special character","error");
											e.preventDefault();
									 		
									 	}else if(staffPassword.value.length < 8){
									 		swal("Invalid Password !","Password must contain at leat 8 Characters","error");
											e.preventDefault();
									 		
									 	}else if(staffPassword.value.length > 25){
									 		swal("Invalid Password !","Password must not contain more than 25 Characters","error");
											e.preventDefault();
									 		
									 	}
								 	});
								 		
								 	
								</script>
                        </form>
                    </div>
                </div>
                
                
                <div class="bg-model10">
                    <div class="model-content10">
                        <div class="close10" id="close" >+</div>
                        <div class="header10">
                            <h1>Staff Details</h1></div>
                            <form action="" >
                                <input id="staffFirstName" type="text" readonly="readonly" placeholder="First Name" class="merge4">
                                <input id="staffLastName" type="text" readonly="readonly" placeholder="Last Name" class="merge4">
                               	<input id="staffGender" type="text" readonly="readonly" placeholder="Gender" class="merge5">
                                <input id="staffEmail" type="text" readonly="readonly" placeholder="Email" class="merge4">
                                <input id="StaffPhone" type="text" readonly="readonly" placeholder="Mobile Number" class="merge4">
                                <input id="staffAddress" type="text" readonly="readonly" placeholder="Address" class="merge5">
								<input id="staffProgramme" type="text" readonly="readonly" placeholder="Programme" class="merge4"/>
                                <input type="text" placeholder="Role" readonly="readonly" class="merge4">
                                <input id="staffId" type="text" readonly="readonly" placeholder="Staff ID" class="merge4">
                                <input id="staffPassword" type="text" readonly="readonly" placeholder="Password" class="merge4">
                        </form>
                    </div>
                </div>
                
                
                <div class="bg-model11">
                    <div class="model-content11">
                        <div class="close11" id="close" >+</div>
                        <div id="editStudentDiv" class="header11">
                            <h1>Edit Staff Details</h1></div>
                            <form id="editStaffForm" action="UpdateDataServlet" method="post">
                                <input id="staffFirstName2" name="staffFirstName" type="text" placeholder="First Name" class="merge4" required>
                                <input id="staffLastName2" name="staffLastName" type="text" placeholder="Last Name" class="merge4" required>
                                <select id="staffGender2" name="staffGender" class="merge5" required>
                                <option value="" disabled selected hidden>Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                                </select>
                                <input id="staffEmail2" name="staffEmail" type="text" placeholder="Email" class="merge4" required>
                                <input id="staffPhone2" name="StaffPhone" type="text" placeholder="Mobile Number" class="merge4" required>
                                <input id="staffAddress2" name="staffAddress" type="text" placeholder="Address" class="merge5" required>
                                <select id="staffProgramme2" name="staffProgramme" class="merge4">
                                <option value="" disabled selected hidden>Programme name</option>
                    <%
								ResultSet programmeDataSet4 = loadData.loadProgrammeData();
								
								if(programmeDataSet4 != null){
									
									try{

										while(programmeDataSet4.next()){
					%>	
											<option id="pro<%=programmeDataSet4.getString("programme_id")%>" value="<%=programmeDataSet4.getString("programme_id")%>"><%=programmeDataSet4.getString("programme_name")%></option>			
					<% 			}
										
									}catch(SQLException e){
										
									}
								}
					%>            
                                </select>
                                <select id="staffRole2" name="staffRole" class="merge4" required>
                                <option value="" disabled selected hidden>Role</option>
								<option id="internalAudit" value="Internal Auditor">Internal Auditor</option>
                                <option id="Facul" value="Faculty">Faculty</option>
                                </select>
                                <input id="staffId2" name="staffId" type="text" placeholder="Staff ID(Digits only)" class="merge4" required>
                                <input id="staffPassword2" name="staffPassword" type="password" placeholder="Password" class="merge4" readonly="readonly" required>
                                <input type="hidden" name="Data" value="staff"/>
                                <input type="hidden" id="tempStaffId"/ name="tempStaffId">
                                <input type="submit" id="button11" value="UPDATE" />
                                
                                <script type="text/javascript">
                                const editStaffForm = document.getElementById("editStaffForm");
								const staffFirstName2 = document.getElementById("staffFirstName2");
								const staffLastName2 = document.getElementById("staffLastName2");
							 	const staffEmail2 = document.getElementById("staffEmail2");
							 	const staffPhone2 = document.getElementById("staffPhone2");
							 	const staffAddress2 = document.getElementById("staffAddress2");
								
							 	editStaffForm.addEventListener('submit', (e)=> {
							 		
							 		var onlyCharacters = /^[A-za-z]*$/;
									var onlyDigits = /^\d+$/; 
									var startingCaps = /^[A-Z]\w*/;
									var namePattern = /^[A-Z][a-z]*$/;										
									var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
									var mobileNumber = /^[6-9]\d+/; 
									var address = /^[A-Z0-9]{1}[A-Za-z0-9 \'\.\-\,\;\:\#]*[A-Za-z0-9\.]$/;
									var sID = /^\d*$/;
									var password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]*$/;
									
									if(onlyCharacters.test(staffFirstName2.value) == false){//First Name
										swal("Invalid First Name !","First Name can only contain Alphabets","error");
										e.preventDefault(); 
										
									}else if(staffFirstName2.value.length < 2){
										swal("Invalid First Name !","First Name should have at least 2 Characters","error");
										e.preventDefault(); 
									
									}else if(staffFirstName2.value.length > 15){
										swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
										e.preventDefault(); 
									
									}else if(startingCaps.test(staffFirstName2.value) == false){
										swal("Invalid First Name !","Starting Alphabet of the First Name should be Capitalized","error");
										e.preventDefault(); 
										
									}else if(namePattern.test(staffFirstName2.value) == false){
										swal("Invalid First Name !","Only Starting Alphabet of the First Name should be Capitalized","error");
										e.preventDefault(); 
										
									}else if(onlyCharacters.test(staffLastName2.value) == false){//Last Name
										swal("Invalid Last Name !","Last Name can only contain Alphabets","error");
										e.preventDefault(); 
										
									}else if(staffLastName2.value.length > 15){
										swal("Invalid First Name !","First Name cannot be more than 15 Characters","error");
										e.preventDefault(); 
									
									}else if(startingCaps.test(staffLastName2.value) == false){
										swal("Invalid Last Name !","Starting Alphabet of the Last Name should be Capitalized","error");
										e.preventDefault(); 
										
									}else if(namePattern.test(staffLastName2.value) == false){
										swal("Invalid Last Name !","Only Starting Alphabet of the Last Name should be Capitalized","error");
										e.preventDefault(); 
										
									}else if(email.test(staffEmail2.value) == false){//Email
										swal("Invalid Email !","Please Enter a valid Email address Format","error");
										e.preventDefault();
										
									}else if(staffEmail2.length > 25){
										swal("Invalid Email !","Email Address cannot be more than 25 Characters","error");
										e.preventDefault();
										
									}else if(onlyDigits.test(staffPhone2.value) == false){//Mobile Number
										swal("Invalid Mobile Number !","Mobile Number can only contain Digits","error");
										e.preventDefault(); 
										
									}else if(mobileNumber.test(staffPhone2.value) == false){
										swal("Invalid Mobile Number !","Starting Digit of Mobile Number can only begin from range '6-9'","error");
										e.preventDefault(); 
										
									}else if(staffPhone2.value.length < 10){
										swal("Invalid Mobile Number !","Mobile Number cannot be less than 10 Digits","error");
										e.preventDefault(); 
										
								 	}else if(staffPhone2.value.length > 10){
										swal("Invalid Mobile Number !","Mobile Number cannot be more than 10 Digits","error");
										e.preventDefault(); 
										
								 	}else if(address.test(staffAddress2.value) == false){//Address
								 		swal("Invalid Address !","Address can only contain Alphabets, Digits, White Spaces, some Special Characters like ' - , . : ; #  and starting Character can only be a Digit or a Capital Alphabet","error");
										e.preventDefault();
								 		
								 	}else if(staffAddress2.value.length > 25){
								 		swal("Invalid Address !","Address cannot be more than 25 Characters","error");
										e.preventDefault();
								 		
								 	}else if(staffAddress2.length < 3){
										swal("Invalid Address","Address cannot be less than 3 Characters","error");
										e.preventDefault();
										
									}
							 	});
                                </script>
                        </form>
                    </div>
                </div>
            </div>     
            
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->            
<!-- ------------------------------------------------------ TAB 4 PROGRAMME AND COURSES ------------------------------------------------------------------------- -->

            <div class="tabs__content" data-tab="4">
                <div class="protab"> 
                    <h4>Programme Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Programme list</h6>
                        <select class="select3" id="filterProgrammeProgramme" onchange="changeProgrammeFilterPro(this.value)">
                        <option value="" disabled selected hidden>Filter By Programme</option>
                        <option value="All">All Programme's</option>
                        
                <%
                	ResultSet FilterProgrammePro = loadData.loadProgrammeData();
                	if(FilterProgrammePro != null){
                		while(FilterProgrammePro.next()){
                			
                %>	
                	<option value="<%=FilterProgrammePro.getString("programme_id")%>"><%=FilterProgrammePro.getString("programme_name")%></option>	
                <%		}
                	}
                
                %>        
                        </select>
                        <div class="icon"><i class="fa fa-plus-circle" id="add"  title="Add programme" onclick="myFunction1()"></i></div></div>
                   
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all" id="programmeDataTable">
                        <tr class="tb2" id="programmeHeading">
                            <th>Programme Name</th>
                            <th>Semester</th>
                            <th>Courses (subjects)</th>
                            <th>Add Course<br>(subject)</th>
                            <th>Edit Course<br>(subject)</th>
                            <th>Action</th>
                        </tr>
                        
                        <%
                        	try{
                        		if(programmeResultSet!=null){
                        			int j = 0;
                        			int courseCount = 0;
                        			while(programmeResultSet.next()){
                        	
                        				for(int i=1; i<= programmeResultSet.getInt("programme_sem"); i++){
                        					
                        					ResultSet coursesData = loadData.loadCoursedata(programmeResultSet, i);
                        %>
                        <tr class="filterRowPro<%=programmeResultSet.getString("programme_id")%>">
							<td id = "<%=programmeResultSet.getString("programme_name")%>"class="td1"><%=programmeResultSet.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=Integer.toString(i)%></td>   <!--Semester-->
                            
                            
                            <td><%try{
                            	if(coursesData!=null){
                            		
                            		while(coursesData.next()){
                            			out.println(coursesData.getString("course_name"));
                            			out.println("<br/>");
                            			courseCount = courseCount + 1;
                            			
                            		}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                        }%> </td>   <!--Course-->
				

							<td class="td1"><button class="btn__course" id="btn__course<%=i + j%>>" onclick="insertCourseData<%=i + j%>()"><span style="font-size: 16px;">+</span> Course</button></td>  <!--add course-->
                            <td class="td2"><button class="btn__edit" id="courseEdit<%=i + j%>" onclick="editCourse<%=i + j%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Edit</button></td> <!--Edit course-->
                            <td class="td3"><div class="circle1" title="Edit Programme" id="programmeEdit<%=i + j%>" onclick="editProgramme<%=i + j%>()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div id="deleteProgramme" onclick="deleteProgrammeData('<%=programmeResultSet.getString("programme_id")%>','programme','<%=programmeResultSet.getString("programme_name")%>')" class="circle2" title="Delete Programme"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                        
                        
                          
                        <script type="text/javascript">
	                        document.getElementById("btn__course<%=i + j%>");
	                        function insertCourseData<%=i + j%>(){
	                          document.querySelector('.bg-model1').style.display = 'flex';
                              document.querySelector('.bg-model1').style.position = 'fixed';
	                          document.getElementById("programmeNameInCourse").value = "<%=programmeResultSet.getString("programme_name")%>";
	                          document.getElementById("courseSemester").value = "<%=i%>";
	                          document.getElementById("programmeIdInCourse").value = "<%=programmeResultSet.getString("programme_id")%>"
	                        }
	                        
	                        document.getElementById("programmeEdit<%=i + j%>");
	                        function editProgramme<%=i + j%>(){
	                        	
	                        	var programmeId = "<%=programmeResultSet.getString("programme_id")%>";
	                        	var programmeName = "<%=programmeResultSet.getString("programme_name")%>";
	                        	var programmeDuration = "<%=programmeResultSet.getString("programme_duration")%>";
	                        	var programmeSem = "<%=programmeResultSet.getString("programme_sem")%>";
								
	                        	document.querySelector('.bg-model13').style.display = 'flex';
	                            document.querySelector('.bg-model13').style.position = 'fixed';
	                            document.getElementById("programmeIdInProgramme").value = programmeId;
	                            document.getElementById("programmeNameInProgramme").value = programmeName;
	                            document.getElementById("programmeDuration").value = programmeDuration;
	                            document.getElementById("programmeTotalSemesterInProgramme").value = programmeSem;
	                            $("#programmeDuration").attr({
	                                "max" : 10,        // substitute your own
	                                "min" : <%=programmeResultSet.getString("programme_duration")%>          // values (or variables) here
	                             });
	                        } 
	                        
	                        document.getElementById("courseEdit<%=i + j%>");
	                        document.getElementById("editCourseTable");
	                        function editCourse<%=i + j%>(){
								document.getElementById("editCoursediv<%=i + j%>").style.display = 'flex';
								document.getElementById("editCoursediv<%=i + j%>").style.position = 'fixed';
								
	    	            	    }
	    	            	    
                        </script>
                        <%				
                        courseCount = 0;}
                        				j = j + programmeResultSet.getInt("programme_sem");//increment j for index
                        			}
                        		}
                        	}catch(SQLException e){
                        		e.printStackTrace();
                        		
                        	}	
                           
                        %>
                        
                        <script type="text/javascript">
	                        function changeProgrammeFilterPro(programme){
	                      	  
	                       	 if(programme == "All"){
	                       		 $('#programmeDataTable tr').show(); 
	                       		 
	                       		 $('#filterProgrammeProgramme').append($('<option>', {
		                  			    value: 1,
		                  			    text: 'Filter By Programme',
		                  			    selected: true,
		                  			    disabled: true,
		                  			    hidden: true
		                  			}));
	                       	 
	                       	 }else{
	                       		 
	                       		 $(".filterRowPro"+programme).show();
	                           	 $('#programmeDataTable').find('tr').not(".filterRowPro"+programme).hide();
	                           	 $("#programmeHeading").show();
	                       	 }
	                       	 
	                       	  
	                         }
                        </script>
                       
                    </table>
                    <script type="text/javascript">
                         	 document.getElementById("deleteProgramme");
	                         function deleteProgrammeData(uniqueId, Data, programmeName){
	                 			var courseCount = "";
	                        	courseCount = document.forms['checkForCourse']['programme'+uniqueId].value;
	                        	console.log(courseCount);
	                        	if(courseCount== "0"){
	                        		swal({title: "Warning",
		                 				 text: "Are you sure you want delete Programme "+"''"+programmeName+"''"+" ?",
		                 				 icon: "warning",
		                 				 buttons: {
		                 					 cancel: "No",
		                 					 yes: "Yes",
		                 				 },	 
		                 			})
		                 			.then((value) => {	
		                 				if(value == "yes"){

		    	            				document.forms['deleteDataForm']['uniqueId'].value = uniqueId;
		    	            				document.forms['deleteDataForm']['Data'].value = Data;
		    	            				
		    	            				document.getElementById("deleteDataForm").submit();
		                 				}
		                 			});
	                        	}
	                        	else{
	                        		swal({title: "Warning",
		                 				 text: "This Programme Contains Courses...Are you sure you want delete Programme "+"''"+programmeName+"''"+" ?",
		                 				 icon: "warning",
		                 				 buttons: {
		                 					 cancel: "No",
		                 					 yes: "Yes",
		                 				 },	 
		                 			})
		                 			.then((value) => {	
		                 				if(value == "yes"){

		    	            				document.forms['deleteDataForm']['uniqueId'].value = uniqueId;
		    	            				document.forms['deleteDataForm']['Data'].value = Data;
		    	            				
		    	            				document.getElementById("deleteDataForm").submit();
		                 				}
		                 			});
	                        	}
	                 		}
                         
                        </script>
                        
						<form id="checkForCourse" action="DeleteDataServlet" method="post">
                <%
			           	ResultSet programmeForCourseResultSet = loadData.loadProgrammeData();
			         	try{
			         		if(programmeForCourseResultSet!=null){
			         			while(programmeForCourseResultSet.next()){
			         				int courseCount = 0;
			         				for(int i=1; i<= programmeForCourseResultSet.getInt("programme_sem"); i++){
			         					
			         					ResultSet coursesData = loadData.loadCoursedata(programmeForCourseResultSet, i);
			              try{
			                  	if(coursesData!=null){
			                  		
			                  		while(coursesData.next()){
			                  			courseCount = courseCount + 1;
			                 			
			                  		}
			                  	}
			                	
			                 }catch(SQLException e){
			                 	e.printStackTrace();
			                	}	
			             
			           		}
			         				 %>
			             		<input type="hidden" id="programme<%=programmeForCourseResultSet.getString("programme_id")%>" name="<%=programmeForCourseResultSet.getString("programme_id")%>" value="<%=courseCount%>" />
			 						<%                
			         			}
			         		}
			         	}catch(SQLException e){
			         		e.printStackTrace();
         		
    			}%>
						</form>
                    </div>
                </div>
                
              
                <div class="bg-model">
                    <div class="model-content">
                        <div class="close" id="close" onclick="myFuction()2">+</div>
                        <div class="header">
                            <h1>Add Programme Data</h1></div>
                            <form id="programmeForm" action="InsertDataServlet" method="post">
                            	<input type="hidden" value="programme" name="Data" />
                                <input id="pId" type="text" placeholder="Programme Id" name="programmeId" required>
                                <input id="pName" type="text" placeholder="Programme Name" name="programmeName" required>
                                <input id="pDuration" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Duration(In Years)" name="duration" required>
                                <input id="pSem" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Total Semester" name="totalSemester" required>
                                <input type="submit" id="button" value="ADD" />
                                
                                <script type="text/javascript">
                                	const insertProgrammeForm = document.getElementById("programmeForm");
									const programmeId = document.getElementById("pId");
									const programmeName = document.getElementById("pName");
									const programmeDuration = document.getElementById("pDuration");
								 	const programmeSem = document.getElementById("pSem");
				
								 	insertProgrammeForm.addEventListener('submit', (e)=> {
								 		 
								 		var onlyCharactersAndSpaces = /^[a-zA-Z]*[ a-zA-Z]*$/;
								 		var atLeastThreeLetters = /[A-Za-z]{3,}/;
										var onlyDigits = /^\d+$/; 
										var startingCaps = /^[A-Z]\w*/;										
										
										if(onlyDigits.test(programmeId.value) == false){//Programme ID
											swal("Invalid Programme ID !","Prgramme ID can contain only Digits","error");
											e.preventDefault(); 
											
										}else if(programmeId.value.length < 3){
											swal("Invalid Programme ID !","Prgramme ID cannot be less than 3 Digits","error");
											e.preventDefault(); 
											
										}else if(programmeId.value.length > 3){
											swal("Invalid Programme ID !","Prgramme ID cannot be more than 3 Digits","error");
											e.preventDefault(); 
											
										}else if(onlyCharactersAndSpaces.test(programmeName.value) == false){//Programme Name
											swal("Invalid Programme Name !","Programme Name can only contain characters and spaces","error")
											e.preventDefault();	
										
										}else if(atLeastThreeLetters.test(programmeName.value) == false){
											swal("Invalid Programme Name !","Programme Name should contain at least 3 letters","error");	
											e.preventDefault();
											
										}else if(programmeName.value.length < 3){
											swal("Invalid Programme Name !","Prgramme Name cannot be less than 3 Characters","error");
											e.preventDefault(); 
											
										}else if(programmeName.value.length > 35){
											swal("Invalid Programme Name !","Prgramme Name cannot be more than 35 Characters","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeDuration.value) > 6){//Programme Duration
											swal("Invalid Programme Duration !","Prgramme Duration cannot be greater than 6 years","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeDuration.value) < 1){
											swal("Invalid Programme Duration !","Prgramme Duration cannot be less than 1 year","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeSem.value) > parseInt(programmeDuration.value)*2){//Programme Semester
											swal("Invalid Total Semester !","Total Semester cannot be greater than "+(parseInt(programmeDuration.value)*2)+" semester(s)","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeSem.value) < parseInt(programmeDuration.value)*2){
											swal("Invalid Total Semester !","Total Semester cannot be less than "+(parseInt(programmeDuration.value)*2)+" semester(s)","error");
											e.preventDefault(); 
											
										}
								 	});
                            </script>
                        </form>
                    </div>
                </div>
                
                
                <div class="bg-model1">
                    <div class="model-content1">
                        <div class="close1" id="close" >+</div>
                        <div class="header1">
                            <h1>Add Course Data</h1></div>
                            <form id="insertCourseForm" action="InsertDataServlet" method="post">
                            	<input type="hidden" value="course" name="Data" />
                            	<input type="hidden" id = "programmeIdInCourse" name="programmeIdInCourse" value=""/>
                                <input type="text" id="programmeNameInCourse" name="programmeNameInCourse" readonly="readonly" value=""/>
                                
                                <input id="ccCode" type="text" name="courseCode" placeholder="Course Code" required>
                                <input id="ccName" type="text" name="courseName" placeholder="Course Name" required>
                                
                                <input type="text" id="courseSemester" name="courseSemester" readonly="readonly" value=""/>
                                
                                <select name="courseType" required>
                                <option value="" disabled selected hidden>Type</option>
                                <option value="Theory">Theory</option>
                                <option value="Practical">Practical</option>
                                </select>
                                
                                <select name="courseGroup" required>
                                <option value="" disabled selected hidden>Group</option>
                                <option value="Group 1 Core Course" >Group 1 Core Course</option>
                                <option value="Group 2 Elective Course" >Group 2 Elective Course</option>
                                <option value="Group 3 a)Compulsary Foundation" >Group 3 a)Compulsary Foundation</option>
                                <option value="Group 3 b)Elective Foundation" >Group 3 b)Elective Foundation</option>
                                <option value="Group 4" >Group 4</option>
                                </select>
                                
                                <input id="ccMaxMarks" name="maxMarks" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Max marks" required>
                                <input id="ccMinMarks" name="minMarks" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Min Marks" required>
                                <input id="ccMaxIA" name="maxIA" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Max Internal Assesment Marks" required>
                                <input type="submit" id="button1" value="ADD"/>
                                
                                <script type="text/javascript">
									const insertCourseForm = document.getElementById("insertCourseForm");
									const courseCode = document.getElementById("ccCode");
									const courseName = document.getElementById("ccName");
									const courseMaxMarks = document.getElementById("ccMaxMarks");
									const courseMinMarks = document.getElementById("ccMinMarks");
									const courseMaxIA = document.getElementById("ccMaxIA");
									
									insertCourseForm.addEventListener('submit',(e)=>{
										
										var cCode = /^[a-zA-Z]{4,6}[0-9]{3}$/;
										var cName = /^[a-zA-Z]*[\s\#\&\(\)\-\+\.\,\/\\a-zA-Z]*$/;
										
										if(cCode.test(courseCode.value) == false){//course code
											swal("Invalid Course Code !","Course Code must contain 4 characters at the beginning and 3 digtis at the end 'eg:BCACAC231' (NO SPACES ALLOWED!)","error");
											e.preventDefault(); 
											
										}else if(cName.test(courseName.value) == false){//course name
											swal("Invalid Course Name !","Course Name can contain only letters, spaces and some special characters like '. , /\ () & # - +' ","error");
											e.preventDefault();
											
										}else if(courseName.value.length > 64){
											swal("Invalid Course Name !","Course Name cannnot contain more than 64 Characters","error");
											e.preventDefault();
											
										}else if(parseInt(courseMaxMarks.value) > 125){//max marks
											swal("Invalid Max Marks !","Max Marks cannot be greater than 125 ","error");
											e.preventDefault();
											
										}else if(parseInt(courseMaxMarks.value) < 25){
											swal("Invalid Max Marks !","Max Marks cannot be less than 25 ","error");
											e.preventDefault();
											
										}else if(parseInt(courseMinMarks.value) > parseInt(courseMaxMarks.value)){//min marks
											swal("Invalid Min Marks !","Min Marks cannot be greater than Max Marks ","error");
											e.preventDefault();
											
										}else if(parseInt(courseMaxIA.value) > parseInt(courseMinMarks.value)){//max IA
											swal("Invalid Max Internal Assessment Marks !","Internal Assessment Marks cannot be greater than Min Marks ","error");
											e.preventDefault();
											
										}
									});
                                	
                                </script>
                          </form>
                    </div>
                </div>  
                    
 
                        <%
                        	try{
                        		
                        		ResultSet programmeResultSet2 = loadData.loadProgrammeData();
                        		if(programmeResultSet2!=null){
                        			int j = 0;
                        			int courseCount = 0;
                        			while(programmeResultSet2.next()){
                        	
                        				for(int i=1; i<= programmeResultSet2.getInt("programme_sem"); i++){
                        					
                        					ResultSet coursesData = loadData.loadCoursedata(programmeResultSet2, i);
                        %>
                    
                    <div class="bg-model12" id="editCoursediv<%=i + j%>">
                    <div class="model-content12">
                        <div class="closeCourse<%=i + j%>" id="editCourse">+
                        	<script type="text/javascript">
								document.querySelector('.closeCourse<%=i + j%>').addEventListener('click', function(){
			                	document.getElementById('editCoursediv<%=i + j%>').style.display = 'none';
			            		})
        					</script>
                        </div>
                        <div class="header12">
                            <h1>Edit Course Data</h1></div>
                            <table class="tb4">
                            	<tr>
                                    <th class="tdCourse">Programme<br>Name</th>
                                    <th class="tdCourse" >Course<br> code</th>
                                    <th class="tdCourse" >Course<br> name</th>
                                    <th class="tdCourse">Course<br> Type</th>
                                    <th class="tdCourse">Course<br> Group</th>
                                    <th class="tdCourse">Course<br> Sem</th>
                                    <th class="tdCourse">MAx<br> Marks</th>
                                    <th class="tdCourse">Min<br> Marks</th>
                                    <th class="tdCourse">Max<br>IA</th>
                                    <th class="tdCourse">Delete<br>Course</th>
                                    <th class="tdCourse">Update<br>Course</th>
                                    </tr>		
                            </table>
                            
                        <%try{
                            	if(coursesData!=null){
                            		
                            		while(coursesData.next()){
                            			courseCount = courseCount + 1;
                        %>	
                                
                            <form id="editCourseForm<%=courseCount%><%=i + j%>" action="" method="post">
                                <table id="editCourseTable<%=i + j%>" border="1" class="tb4">
                            		<tr class="input-in">
                            			<td class="tdCo"><input class="inputprog" id="" value="<%=programmeResultSet2.getString("programme_name")%>" readonly="readonly"/></td>
                            			<td class="tdCourse"><input class="inputCourseCode" id="courseCo<%=courseCount%><%=i + j%>"  name="uniqueId" value="<%=coursesData.getString("course_code")%>" onchange="disableButton<%=courseCount%><%=i + j%>()" required/></td>
                            			<td class="tdCourse"><input class="input" id="courseN<%=courseCount%><%=i + j%>" name="courseName" value="<%=coursesData.getString("course_name")%>" onchange="disableButton<%=courseCount%><%=i + j%>()" required/></td>
                            			<%if(coursesData.getString("course_type").equals("Theory")){
                            			%>
                            				<td class="tdCourse"><select class="input" onchange="disableButton<%=courseCount%><%=i + j%>()" name="courseType" required>
                            					<option value="" disabled hidden>course Type</option>
                            					<option selected>Theory</option>
                            					<option>Practical</option>
                            				</select>
                            			</td>
                            			<%}else{%>
                            				<td class="tdCourse"><select class="input" onchange="disableButton<%=courseCount%><%=i + j%>()" name='courseType' required>
                            					<option value="" disabled hidden>course Type</option>
                            					<option>Theory</option>
                            					<option Selected>Practical</option>
                            				</select>
                            			</td>
                            			<%}%>
                            			
                            			<%switch(coursesData.getString("course_group")){
                            			case "Group 1 Core Course":
                            			%>
                            				<td class="tdCourse"><select class="input" onchange="disableButton<%=courseCount%><%=i + j%>()" name='courseGroup' required>
                            					<option value="" disabled hidden>course Group</option>
                            					<option selected>Group 1 Core Course</option>
				                                <option >Group 2 Elective Course</option>
				                                <option >Group 3 a)Compulsary Foundation</option>
				                                <option >Group 3 b)Elective Foundation</option>
				                                <option >Group 4</option>
                            				</select>
                            			</td>
                            			<%break;	
                            			case "Group 2 Elective Course":
                                			%>
                                				<td class="tdCourse"><select class="input" onchange="disableButton<%=courseCount%><%=i + j%>()" name='courseGroup' required>
                                					<option value="" disabled hidden>course Group</option>
                                					<option >Group 1 Core Course</option>
    				                                <option selected>Group 2 Elective Course</option>
    				                                <option >Group 3 a)Compulsary Foundation</option>
    				                                <option >Group 3 b)Elective Foundation</option>
    				                                <option >Group 4</option>
                                				</select>
                                			</td>
                                			<%break;
	                           			case "Group 3 a)Compulsary Foundation":
	                               			%>
	                               				<td class="tdCourse"><select class="input" onchange="disableButton<%=courseCount%><%=i + j%>()" name='courseGroup' required>
	                               					<option value="" disabled hidden>course Group</option>
	                               					<option >Group 1 Core Course</option>
	   				                                <option >Group 2 Elective Course</option>
	   				                                <option selected >Group 3 a)Compulsary Foundation</option>
	   				                                <option >Group 3 b)Elective Foundation</option>
	   				                                <option >Group 4</option>
	                               				</select>
	                               			</td>
	                               			<%break;
                               			case "Group 3 b)Elective Foundation":
	                               			%>
	                               				<td class="tdCourse"><select class="input" onchange="disableButton<%=courseCount%><%=i + j%>()" name='courseGroup' required>
	                               					<option value="" disabled hidden>course Group</option>
	                               					<option >Group 1 Core Course</option>
	   				                                <option >Group 2 Elective Course</option>
	   				                                <option >Group 3 a)Compulsary Foundation</option>
	   				                                <option selected >Group 3 b)Elective Foundation</option>
	   				                                <option >Group 4</option>
	                               				</select>
	                               			</td>
	                               			<%break;
                            			default:
                            				%>
                            				<td class="tdCourse"><select class="input" onchange="disableButton<%=courseCount%><%=i + j%>()" name='courseGroup' required>
	                               					<option value="" disabled hidden>course Group</option>
	                               					<option >Group 1 Core Course</option>
	   				                                <option >Group 2 Elective Course</option>
	   				                                <option >Group 3 a)Compulsary Foundation</option>
	   				                                <option >Group 3 b)Elective Foundation</option>
	   				                                <option selected >Group 4</option>
	                               				</select>
	                               			</td>
                            			<%} %>
                            			    
                                            <td class="tdCourse"><input class="inputDigits" name="courseSem" id="courseSe<%=courseCount%><%=i + j%>" value="<%=coursesData.getString("course_sem")%>" onchange="disableButton<%=courseCount%><%=i + j%>()" required/></td>
                       						<td class="tdCourse"><input class="inputDigits" name="courseMaxMarks" id="courseMaxM<%=courseCount%><%=i + j%>" value="<%=coursesData.getString("max_marks")%>" onchange="disableButton<%=courseCount%><%=i + j%>()" required/></td>
                            				<td class="tdCourse"><input class="inputDigits" name="courseMinMarks" id="courseMinM<%=courseCount%><%=i + j%>" value="<%=coursesData.getString("min_marks")%>" onchange="disableButton<%=courseCount%><%=i + j%>()" required/></td>
                            				<td class="tdCourse"><input class="inputDigits" name="courseMaxIA" id="courseMaxI<%=courseCount%><%=i + j%>" value="<%=coursesData.getString("max_IA")%>"/></td>
                                            <td><input type="submit" class="btnDelete" id="btnDeleteC<%=courseCount%><%=i + j%>" value="DELETE" onclick="setAction(this.value,'<%=courseCount%><%=i + j%>');"></td> 
                                            <td><input type="submit" class="btnUpdate" value="UPDATE" onclick="setAction(this.value,'<%=courseCount%><%=i + j%>');"></td> 
                            				
                            			<script type="text/javascript">
                            				function setAction(typeAction,courseCount){
                            					
                            					if(typeAction == "DELETE"){
                            						$("#editCourseForm"+courseCount).attr("action","DeleteDataServlet");
                       
                            						
                            					}else if(typeAction == "UPDATE"){
                            						$("#editCourseForm"+courseCount).attr("action","UpdateDataServlet");
                            						
                            					}
                            					
                            				}
                            				
                            				function disableButton<%=courseCount%><%=i + j%>(){
                            					document.getElementById("btnDeleteC<%=courseCount%><%=i + j%>").disabled = true;
                            					
                            				}
                            				
                            				
        									const editCourseForm<%=courseCount%><%=i + j%> = document.getElementById("editCourseForm<%=courseCount%><%=i + j%>");
        									const courseCode<%=courseCount%><%=i + j%> = document.getElementById("courseCo<%=courseCount%><%=i + j%>");
        									const courseName<%=courseCount%><%=i + j%> = document.getElementById("courseN<%=courseCount%><%=i + j%>");
        									const courseMaxMarks<%=courseCount%><%=i + j%> = document.getElementById("courseMaxM<%=courseCount%><%=i + j%>");
        									const courseMinMarks<%=courseCount%><%=i + j%> = document.getElementById("courseMinM<%=courseCount%><%=i + j%>");
        									const courseMaxIA<%=courseCount%><%=i + j%> = document.getElementById("courseMaxI<%=courseCount%><%=i + j%>");
        									
        									editCourseForm<%=courseCount%><%=i + j%>.addEventListener('submit',(e)=>{
        										
        										var cCode = /^[a-zA-Z]{4,6}[0-9]{3}$/;
        										var cName = /^[a-zA-Z]*[\s\#\&\(\)\-\+\.\,\/\\a-zA-Z]*$/;
        										
        										if(cCode.test(courseCode<%=courseCount%><%=i + j%>.value) == false){//course code
        											swal("Invalid Course Code !","Course Code must contain 4 characters at the beginning and 3 digtis at the end 'eg:BCACAC231' (NO SPACES ALLOWED!)","error");
        											e.preventDefault(); 
        											
        										}else if(cName.test(courseName<%=courseCount%><%=i + j%>.value) == false){//course name
        											swal("Invalid Course Name !","Course Name can contain only letters, spaces and some special characters like '. , /\ () & # - +' ","error");
        											e.preventDefault();
        											
        										}else if(courseName<%=courseCount%><%=i + j%>.value.length > 64){
        											swal("Invalid Course Name !","Course Name cannnot contain more than 64 Characters","error");
        											e.preventDefault();
        											
        										}else if(parseInt(courseMaxMarks<%=courseCount%><%=i + j%>.value) > 125){//max marks
        											swal("Invalid Max Marks !","Max Marks cannot be greater than 125 ","error");
        											e.preventDefault();
        											
        										}else if(parseInt(courseMaxMarks<%=courseCount%><%=i + j%>.value) < 25){
        											swal("Invalid Max Marks !","Max Marks cannot be less than 25 ","error");
        											e.preventDefault();
        											
        										}else if(parseInt(courseMinMarks<%=courseCount%><%=i + j%>.value) > parseInt(courseMaxMarks<%=courseCount%><%=i + j%>.value)){//min marks
        											swal("Invalid Min Marks !","Min Marks cannot be greater than Max Marks ","error");
        											e.preventDefault();
        											
        										}else if(parseInt(courseMaxIA<%=courseCount%><%=i + j%>.value) > parseInt(courseMinMarks<%=courseCount%><%=i + j%>.value)){//max IA
        											swal("Invalid Max Internal Assessment Marks !","Internal Assessment Marks cannot be greater than Min Marks ","error");
        											e.preventDefault();
        											
        										}
        									});
                            				
                            			</script>
                            			
                            		</tr>    
                            	</table>
                            	<input name="Data" type="hidden" value="course"/>
                            	<input name="tempCode" type="hidden" value="<%=coursesData.getString("course_code")%>" />
                        	</form> 	
                            <%	 	}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%> 
                      
                    </div>
                </div>
                <%				
                	courseCount = 0;}
                				j = j + programmeResultSet2.getInt("programme_sem");//increment j for index
                			}
                		}
                	}catch(SQLException e){
                		e.printStackTrace();
                		
                	}	
                   
                %>               
                
                <div class="bg-model13">
                    <div class="model-content13">
                        <div class="close13" id="close">+</div>
                        <div class="header13">
                            <h1>Edit Programme Data</h1></div>
                            <form id="editProgrammeForm" action="UpdateDataServlet" method="post" >
                                <input name="programmeId" id="programmeIdInProgramme" type="text" placeholder="Programme Id" readonly="readonly" required>
                                <input name="programmeName" id="programmeNameInProgramme" type="text" placeholder="Programme Name" required>
                                <input name="duration" id="programmeDuration" min="" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Duration(In Years)" required>
                                <input name="totalSemester" id="programmeTotalSemesterInProgramme" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Total Semester" required>
                               	<input name="Data" type="hidden" value="programme"/>
                                <input type="submit" id="button13" value="UPDATE" />
                                
                                <script type="text/javascript">
                                	const editProgrammeForm = document.getElementById("editProgrammeForm");
									const programmeName2 = document.getElementById("programmeNameInProgramme");
									const programmeDuration2 = document.getElementById("programmeDuration");
								 	const programmeSem2 = document.getElementById("programmeTotalSemesterInProgramme");
				
								 	editProgrammeForm.addEventListener('submit', (e)=> {
								 		 
								 		var onlyCharactersAndSpaces = /^[a-zA-Z]*[ a-zA-Z]*$/;
								 		var atLeastThreeLetters = /[A-Za-z]{3,}/;
										var onlyDigits = /^\d+$/; 
										var startingCaps = /^[A-Z]\w*/;										
										
										if(onlyCharactersAndSpaces.test(programmeName2.value) == false){//Programme Name
											swal("Invalid Programme Name !","Programme Name can only contain characters and spaces","error")
											e.preventDefault();
										
										}else if(atLeastThreeLetters.test(programmeName2.value) == false){
											swal("Invalid Programme Name !","Programme Name should contain at least 3 letters","error");	
											e.preventDefault();
											
										}else if(programmeName2.value.length < 3){
											swal("Invalid Programme Name !","Prgramme Name cannot be less than 3 Characters","error");
											e.preventDefault(); 
											
										}else if(programmeName2.value.length > 35){
											swal("Invalid Programme Name !","Prgramme Name cannot be more than 35 Characters","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeDuration2.value) > 6){//Programme Duration
											swal("Invalid Programme Duration !","Prgramme Duration cannot be greater than 6 years","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeDuration2.value) < 1){
											swal("Invalid Programme Duration !","Prgramme Duration cannot be less than 1 year","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeSem2.value) > parseInt(programmeDuration2.value)*2){//Programme Semester
											swal("Invalid Total Semester !","Total Semester cannot be greater than "+(parseInt(programmeDuration2.value)*2)+" semester(s)","error");
											e.preventDefault(); 
											
										}else if(parseInt(programmeSem2.value) < parseInt(programmeDuration2.value)*2){
											swal("Invalid Total Semester !","Total Semester cannot be less than "+(parseInt(programmeDuration2.value)*2)+" semester(s)","error");
											e.preventDefault(); 
											
										}
								 	});
                            </script>
                        </form>
                    </div>
                </div>
            </div>
                 
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->                 
<!-- ------------------------------------------------------ TAB 5 CLASSES  -------------------------------------------------------------------------------------- -->
                    
            <div class="tabs__content" data-tab="5">
               <div class="protab"> 
                   <h4>Class Management</h4>
                   <div class="inner__protab">
                       
                   <div class="inner1">
                       <h6 class="left">Class list</h6>
                       <select class="select3" id="filterProgrammeClass" onchange="changeProgrammeFilterClass(this.value)">
                       <option value="" disabled selected hidden>Filter By Programme</option>
                       <option value="All">All Programme's</option>
               <%
                	ResultSet FilterProgrammeclass = loadData.loadProgrammeData();
                	if(FilterProgrammeclass != null){
                		while(FilterProgrammeclass.next()){
                			
                %>	
                	<option value="<%=FilterProgrammeclass.getString("programme_id")%>"><%=FilterProgrammeclass.getString("programme_name")%></option>	
                <%		}
                	}
                
                %>        
                       </select>
                       <div class="icon"><i class="fa fa-plus-circle" id="add1" title="Add programme" onclick="myFunction8()"></i></div></div>
                   <table border="1" class="tb1" cellspacing="0" padding="10" rules="all" id="classDataTable">
                       <tr id="classHeader">
                           <th>Programme Name</th>
                           <th>Class Name</th>
                           <th>Class Year</th>
                           <th>Action</th>
                       </tr>
                       
                       <%
                       	try{
                       		
                       		ResultSet classesData = loadData.loadOnlyClassData();
                       		int ci=1;
   	    					while(classesData.next()){
   	    			%>		
   	    	
                       <tr class="filterRowClass<%=classesData.getString("programme_id")%>">
                           <td class="td1"><%=classesData.getString("programme_name")%></td>   <!--Programme name-->
                           <td class="td2"><%=classesData.getString("class_name")%></td>   <!--Semseter-->
                           <td class="td5"><%=classesData.getString("class_year")%></td>
                           <td class="td3"><div class="circle1" title="Edit Class" id="editClass<%=ci%>" onclick="updateClassData<%=ci%>()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div id="deleteClass" class="circle2" title="Delete Class" onclick="deleteClass('<%=classesData.getString("class_id")%>','class','<%=classesData.getString("class_name")+" "+classesData.getString("class_year")+" year"%>')"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                       </tr>	
                       
                       <script type="text/javascript">
	                       document.getElementById("editClass<%=ci%>");
	                       function updateClassData<%=ci%>(){
	                    	 document.querySelector('.bg-model14').style.display = 'flex';
	                    	 document.querySelector('.bg-model14').style.position = 'fixed';
	                    	 
	                    	 $("#proNameInClass option[id!='cla<%=classesData.getString("programme_id")%>']").removeAttr("selected");
	                    	 $("#proNameInClass option[id='cla<%=classesData.getString("programme_id")%>']").attr("selected",true);
	                    	 
	                    	 var classId = "<%=classesData.getString("class_id")%>";
	                    	 var className = "<%=classesData.getString("class_name")%>";
	                    	 var classYear = "<%=classesData.getString("class_year")%>";
	                    	 
	                         document.getElementById("cIdInClass").value = classId;
	                         document.getElementById("cNameInClass").value = className;
	                         document.getElementById("cYearInClass").value = classYear;
	                       }
                       </script>		

                       <% 	
   	    					ci++;}
                       	}catch(SQLException e){
                       		e.printStackTrace();
                       		
                       	}
                           
                    %>
                    	<script type="text/javascript">
	                        function changeProgrammeFilterClass(programme){
	                      	  
	                       	 if(programme == "All"){
	                       		 $('#classDataTable tr').show(); 
	                       		 
	                       		 $('#filterProgrammeClass').append($('<option>', {
		                  			    value: 1,
		                  			    text: 'Filter By Programme',
		                  			    selected: true,
		                  			    disabled: true,
		                  			    hidden: true
		                  			}));
	                       	 
	                       	 }else{
	                       		 
	                       		 $(".filterRowClass"+programme).show();
	                           	 $('#classDataTable').find('tr').not(".filterRowClass"+programme).hide();
	                           	 $("#classHeader").show();
	                       	 }
	                       	 
	                       	  
	                         }
                        </script>
                   </table>
                    <script type="text/javascript">
                    	document.getElementById("deleteClass");
                    	function deleteClass(uniqueId,Data,className){

                     			swal({title: "Warning",
   	             				 text: "Are you shure you want delete Class "+"''"+className+"''",
   	             				 icon: "warning",
   	             				 buttons: {
   	             					 cancel: "No",
   	             					 yes: "Yes",
   	             				 },	 
   	             			})
   	             			.then((value) => {	
   	             				if(value == "yes"){
   	
   		            				document.forms['deleteDataForm']['uniqueId'].value = uniqueId;
   		            				document.forms['deleteDataForm']['Data'].value = Data;
   		            				
   		            				document.getElementById("deleteDataForm").submit();
   	             				}
   	             			});
                    		
                    	}
                    </script>
                   </div>
               </div>
               
                
                <div class="bg-model5">
                   <div class="model-content5">
                       <div class="close5" id="close" >+</div>
                       <div class="header5">
                           <h1>Add Class Data</h1></div>
                           <form id="insertClassForm" action="InsertDataServlet" method="post">
                           	   <input type="hidden" name="Data" value="class"/>
                               <select name="programmeNameInClass" onchange="addProgrammeSem(this.value)" required>
                               <option value="" disabled selected hidden>Select Programme</option>
                               <%
                               	try{
                               		ResultSet programmeName = loadData.loadProgrammeData();
                               		while(programmeName.next()){
                               			
                               %>		
                                           <option value="<%=programmeName.getString("programme_name")%>"><%=programmeName.getString("programme_name")%></option>	
                               <%	
                               	
                               		}
                               	}catch(SQLException e){
                               		e.printStackTrace();
                               	}
                               %>
                               </select>
                               <input id="cID" name="classId" type="text" placeholder="Class ID" required>
                               <input id="cName" name="className" type="text" placeholder="Class Name" required>
                               <input id="cYear" name="classYear" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Class Year (in digits)" required>
                               <input type="submit" id="button5" value="ADD"/>
                               <%
                               	try{
                               		ResultSet programmeName = loadData.loadProgrammeData();
                               		while(programmeName.next()){
                               			
                               %>		
                                           <input type="hidden" id="programme<%=programmeName.getString("programme_name")%>" value="<%=programmeName.getString("programme_duration")%>"/>	
                               <%	
                               	
                               		}
                               	}catch(SQLException e){
                               		e.printStackTrace();
                               	}
                               %>
                               
                               <script type="text/javascript">
                               		var duration = 0;
									function addProgrammeSem(pName){
										duration = document.getElementById("programme"+pName).value;
									}
									
									const insertClassForm = document.getElementById("insertClassForm");
									const classId = document.getElementById("cID");
									const className = document.getElementById("cName");
									const classYear = document.getElementById("cYear");
						
									insertClassForm.addEventListener('submit', (e)=>{
										
										var onlyCharactersAndSpaces = /^[a-zA-Z]*[ a-zA-Z]*$/;
								 		var atLeastThreeLetters = /[A-Za-z]{3,}/;
										var onlyDigits = /^\d+$/; 
										
										if(onlyDigits.test(classId.value) == false){//Class Id
											swal("Invalid Class ID !","Class ID can contain only Digits","error");
											e.preventDefault();
											
										}else if(classId.value.length > 3){
											swal("Invalid Class ID !","Class ID cannot be more than 3 Digits","error");
											e.preventDefault();
											
										}else if(classId.value.length < 3){
											swal("Invalid Class ID !","Class ID cannot be less than 3 Digits","error");
											e.preventDefault();
											
										}else if(onlyCharactersAndSpaces.test(className.value) == false){//Class Name
											swal("Invalid Class Name !","Class Name can only contain letters and spaces","error");
											e.preventDefault();
											
										}else if(atLeastThreeLetters.test(className.value) == false){
											swal("Invalid Class Name !","Class Name must contain at least 3 letters","error");
											e.preventDefault();
											
										}else if(className.value.length > 10){
											swal("Invalid Class Name !","Class Name cannot contain more than 10 characters","error");
											e.preventDefault();
											
										}else if(parseInt(classYear.value) > duration){//Class Year
											swal("Invalid Class Year !","Class Year cannot be greater than "+duration+" year(s)","error");
											e.preventDefault();
											
										}else if(parseInt(classYear.value) < 1){
											swal("Invalid Class Year !","Class Year cannot be less than 1 year","error");
											e.preventDefault();
											
										}
									});
							   </script>
                       </form>
                   </div>
               </div>
               
                       
               <div class="bg-model14">
                   <div class="model-content14">
                       <div class="close14" id="close" >+</div>
                       <div class="header14">
                           <h1>Edit Class Data</h1></div>
                           <form id="updateClassForm" action="UpdateDataServlet" method="post">
                               <select name="progNameInClass" id="proNameInClass" onchange="addProgrammeSem2(this.value)" required >
                               <option value="" disabled selected hidden>Select Programme</option>
               <%
               		ResultSet updateClassResultSet = loadData.loadProgrammeData();
               		if(updateClassResultSet!=null){
               			while(updateClassResultSet.next()){
               %>				
               					<option id="cla<%=updateClassResultSet.getString("programme_id")%>" value="<%=updateClassResultSet.getString("programme_name")%>"><%=updateClassResultSet.getString("programme_name")%></option>
               <% 		}
               			
               		}
               
               %>
                               </select>
                               <input id="cIdInClass" name="classId" type="text" placeholder="Class ID" required readonly="readonly">
                               <input id="cNameInClass" name="className" type="text" placeholder="Class Name" required>
                               <input id="cYearInClass" name="classYear" type="number" pattern="0+\.[0-9]*[1-9][0-9]*$" placeholder="Class Year (in digits)" required>
                               <input name="Data" value="class" type="hidden"/>
                               <input type="submit" id="button15"  value="UPDATE" />
                               
                                <%
                               	try{
                               		ResultSet programmeName20 = loadData.loadProgrammeData();
                               		if(programmeName20!=null){
                               		while(programmeName20.next()){
                               			
                               %>		
                                           <input type="hidden" id="prg<%=programmeName20.getString("programme_name")%>" value="<%=programmeName20.getString("programme_duration")%>"/>	
                               <%	
                               	
                               		}
                               		}
                               	}catch(SQLException e){
                               		e.printStackTrace();
                               	}
                               %>
                               
                               <script type="text/javascript">
                               		var duration2 = 0;
									function addProgrammeSem2(pName){
										duration2 = document.getElementById("prg"+pName).value;
									}
									
									const updateClassForm = document.getElementById("updateClassForm");
									const classId2 = document.getElementById("cIdInClass");
									const className2 = document.getElementById("cNameInClass");
									const classYear2 = document.getElementById("cYearInClass");
						
									updateClassForm.addEventListener('submit', (e)=>{
										
										addProgrammeSem2(document.getElementById("proNameInClass").value);
										
										var onlyCharactersAndSpaces = /^[a-zA-Z]*[ a-zA-Z]*$/;
								 		var atLeastThreeLetters = /[A-Za-z]{3,}/;
										var onlyDigits = /^\d+$/; 
										
										if(onlyDigits.test(classId2.value) == false){//Class Id
											swal("Invalid Class ID !","Class ID can contain only Digits","error");
											e.preventDefault();
											
										}else if(classId2.value.length > 3){
											swal("Invalid Class ID !","Class ID cannot be more than 3 Digits","error");
											e.preventDefault();
											
										}else if(classId2.value.length < 3){
											swal("Invalid Class ID !","Class ID cannot be less than 3 Digits","error");
											e.preventDefault();
											
										}else if(onlyCharactersAndSpaces.test(className2.value) == false){//Class Name
											swal("Invalid Class Name !","Class Name can only contain letters and spaces","error");
											e.preventDefault();
											
										}else if(atLeastThreeLetters.test(className2.value) == false){
											swal("Invalid Class Name !","Class Name must contain at least 3 letters","error");
											e.preventDefault();
											
										}else if(className2.value.length > 10){
											swal("Invalid Class Name !","Class Name cannot contain more than 10 characters","error");
											e.preventDefault();
											
										}else if(parseInt(classYear2.value) > duration2){//Class Year
											swal("Invalid Class Year !","Class Year cannot be greater than "+duration2+" year(s)","error");
											e.preventDefault();
											
										}else if(parseInt(classYear2.value) < 1){
											swal("Invalid Class Year !","Class Year cannot be less than 1 year","error");
											e.preventDefault();
											
										}
									});
							   </script>
                       </form>
                   </div>
               </div>
           </div>
                    
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->     
<!-- ------------------------------------------------------ TAB 6 STUDENT RESULTS ------------------------------------------------------------------------------- -->
            
            <div class="tabs__content" data-tab="6">
            <div class="protab"> 
            <h4>Student Result Management</h4>
            <div class="inner__protab">
            <div class="inner1"><h6 class="left">Student Result</h6>
            <select class="select2" id="classFilters2" onchange="changeClassFilter2(this.value)">
            <option value="" disabled selected hidden>Filter By Class</option>
            <option hidden value="All" id="allTheClasses2">All Classes</option>
       		<%
            	ResultSet FilterClass2 = loadData.loadOnlyClassData();
            	if(FilterClass2 != null){
            		while(FilterClass2.next()){
            			
            %>	
            	<option hidden id="<%=FilterClass2.getString("programme_id")%>" value="<%=FilterClass2.getString("class_name")%><%=FilterClass2.getString("class_year")%>"><%=FilterClass2.getString("class_name")+" "+FilterClass2.getString("class_year")+" year"%></option>	
            <%		}
            	}
            
            %>      
            </select>
            <select class="select2" id="filterProgramme2" onchange="changeProgrammeFilter2(this.value)">
            <option value="" disabled selected hidden>Filter By Programme</option>
            <option value="All">All Programme's</option>      
    		<%
            	ResultSet FilterProgramme2 = loadData.loadProgrammeData();
            	if(FilterProgramme2 != null){
            		while(FilterProgramme2.next()){
            			
            %>	
            	<option value="<%=FilterProgramme2.getString("programme_id")%>"><%=FilterProgramme2.getString("programme_name")%></option>	
            <%		}
            	}
            
            %>  	
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
			<form action="DeleteDataServlet" method="post" id=deleteResultForm>
						<input type="hidden" name="Data" value="finalResult"/>
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="">
            	         <input name="programmeId" type="hidden" value=""/>
			</form>
			 
            <table border="1" class="tb1" cellspacing="0" padding="10" rules="all" id="resultDataTable">
            <tr id="resultHeader">
                <th>Programme</th>
                <th>Class</th>
                <th>Class Year</th>
                <th>Student Name</th>
                <th>Register Number</th>
                <th>Add Result</th>
                <th>View Result</th>
                <th>Action</th>
            </tr>   
            <%
            
            	try{
            		
					ResultSet studentData = loadData.loadResulData();	
            		
					if(studentData!=null){
						int i = 1;
                		while(studentData.next()){
                			
            %>	       
           <tr class="filterRow<%=studentData.getString("programme_id")%> filterRow<%=studentData.getString("class_name")%><%=studentData.getString("class_year")%>">
              <td class="td1"><%=studentData.getString("programme_name")%></td>   <!--Programme -->
              <td class="td2"><%=studentData.getString("class_name")%></td>   <!--class-->
              <td class="td2"><%=studentData.getString("class_year")%></td>
              <td><%=studentData.getString("first_name") +" "+ studentData.getString("last_name")%></td>   <!--Student Name-->
              <td><%=studentData.getString("reg_no")%></td>   <!--Register number-->
              <td class="td1"><button class="btn__course" id="btn__course<%=i%>" onclick="addResult<%=i%>()"><span style="font-size: 16px;">+</span> Add</button></td>  <!--Add Result-->
              <td class="td2"><button class="btn__edit" id="btn-edit<%=i%>" onclick="viewResult<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Result</button></td> <!--View Result-->
              <td class="td3"><div class="circle2" title="Delete Result" id="btn-deleteR<%=i%>" onclick="deleteResult<%=i%>()"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
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
	            		  document.querySelector('.bg-model15').style.display = 'flex';
	            		  document.querySelector('.bg-model15').style.position = 'fixed';
	            		  
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
			            	    	var div = document.createElement('div');
			            	    	div.setAttribute('class','pop-div');
			            	    	var div2 = document.createElement('div');
			            	    	div2.setAttribute('class','pop-inner2');
			            	    	div2.setAttribute('id','div'+i);
			            	    	div2.setAttribute('onclick','addResultTable'+i+"('<%=studentData.getString("programme_id")%>','<%=studentData.getString("first_name")+" "%><%=studentData.getString("last_name")%>','<%=studentData.getString("reg_no")%>','<%=studentData.getString("programme_name")%>','<%=studentData.getString("class_name")+" "%><%=studentData.getString("class_year")+" "%>year',"+(i)+")");
			            	    	div2.textContent = "Semester "+i;	
			            	    	
			            	    	div.appendChild(div2);
			            	    	td.appendChild(div);
			            	    	tr.appendChild(td);
			            	    	table.appendChild(tr);
			            	    	
			            	    }
	            		}
	            	document.getElementById("btn-deleteR<%=i%>");
	            	function deleteResult<%=i%>(){
	            	    document.querySelector('.bg-model4').style.display = 'flex';
                        document.querySelector('.bg-model4').style.position = 'fixed';
	            	    document.forms['deleteResultForm']['userName'].value = "<%=studentData.getString("reg_no")%>";
	            	    document.forms['deleteResultForm']['programmeId'].value = "<%=studentData.getString("programme_id")%>";
	            	
	            	    
	            	    table = document.getElementById('deleteResultTable');
	            	    
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
		            	    	div2.setAttribute('class','pop-inner2');
		            	    	div2.setAttribute('id','div'+i);
		            	    	div2.setAttribute('onclick','callDeleteServlet'+i+'()');
		            	    	div2.textContent = "Semester "+(rowCount + i);	
		            	    	
		            	    	div.appendChild(div2);
		            	    	td.appendChild(div);
		            	    	tr.appendChild(td);
		            	    	table.appendChild(tr);
		            	  
		            	    }
	            	    }
	            	    
	            	    
	            	    if(rowCount > <%=studentData.getInt("semester")%>){
	            	    	var createRow =  rowCount - <%=studentData.getInt("semester")%>;
	            	    	for(let i= 1;i <= createRow; i++){
	            	    		table.deleteRow(-1);
	            	    	}
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
            function changeProgrammeFilter2(programme){
           	 if(programme == "All"){
           		 $('#resultDataTable tr').show(); 
           		 $("#classFilters2 option").attr("hidden",true);
           		 $("#classFilters2 option[id='allTheClasses2']").attr("hidden",true);
					
           		 $('#classFilters2').append($('<option>', {
           			    value: 1,
           			    text: 'Filter By Class',
           			    selected: true,
           			    disabled: true,
           			    hidden: true
           			}));
           		 
           		 $('#filterProgramme2').append($('<option>', {
        			    value: 1,
        			    text: 'Filter By Programme',
        			    selected: true,
        			    disabled: true,
        			    hidden: true
        			}));
           	 }else{
           		 
           		 $(".filterRow"+programme).show();
               	 $('#resultDataTable').find('tr').not(".filterRow"+programme).hide();
               	 $("#resultHeader").show();

               	$("#classFilters2 option[id!="+programme+"]").attr("hidden",true);
               	$("#classFilters2 option[id="+programme+"]").removeAttr("hidden");
               	$("#classFilters2 option[id='allTheClasses2']").removeAttr("hidden");
               	$("#classFilters2 option[id='allTheClasses2']").attr("value",programme);
           	 }
           	 
           	  
             }
             
             function changeClassFilter2(className){
            		 
            		 $(".filterRow"+className).show();
            		 $('#resultDataTable').find('tr').not(".filterRow"+className).hide();
                	 $("#resultHeader").show();
            	 
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
                     <h1>Edit Student Results</h1></div>
                       <form action="">
                           <table border="1" class="tb3">
                             <tr>
                               <th>Semester</th>
                             </tr>    
                           </table> 
                       </form>
                   </div>
               </div>
                
                
               <div class="bg-model4">
                   <div class="model-content4">
                       <div class="close4" id="close" >+</div>
                       <div class="header4">
                           <h1>Delete Student Results</h1></div>
                           <form action="">
                               <table border="1" class="tb3" id="deleteResultTable">
                                   <tr>
                                   <th>Semester</th>
                                   </tr>
                                   
                                   
                               </table>
                       </form>
                   </div>
               </div> 
                
                
                <div class="bg-model15">
                    <div class="model-content15">
                        <div class="close15" id="close" >+</div>
                        <div class="header15">
                            <h1>Add Student Result</h1></div>
                            <form action="">
                            	<table border="1" class="tb3">
                            		<tr>
                                    <th>Semester</th>
                                    </tr>
                            	</table>
                                <table border="1" class="tb3" id="addResultTable">
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
    
                <div class="bg-model16" id="prog<%=programmeResultSet20.getString("programme_id")%><%=i%>">
                	<input type="hidden" id="resultSName<%=i + j%>" value="" />
                    <div class="model-content16">
                        <div class="close-result<%=i + j%>" id="close16">+</div>
							<script>
						        document.querySelector('.close-result<%=i + j%>').addEventListener('click', function(){
						        document.getElementById("prog<%=programmeResultSet20.getString("programme_id")%><%=i%>").style.display = 'none';
						            
						        });
					        </script>
                        <div class="header16">
                            <h1>Add Student Result</h1></div>
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
                            	<input type="hidden" name="Data" value="finalResult"/>
                            	<input type="hidden" id="regNo" name="regNo" value=""/>
                            	<input type="hidden" id="programmeID" name="programmeId" value=""/>
                            	<input type="hidden" id="semesterr" name="semester" value=""/>
                                <table id="obTable<%=programmeResultSet20.getString("programme_id")%><%=i%>"  border="1" class="tb9">
                                    <tr>
                                    <th class="tdCourse" >Course name</th>
                                    <th class="tdCourse" >Course code</th>
                                    <th class="tdCourse">Course Type</th>
                                    <th class="tdCourse">Obtained Marks</th>
                                    <th class="tdCourse">Internal Assessment Marks</th>
                                    <th class="tdCourse">Credit</th>
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
                                        <td class="ob__marks" id="obtained<%=courseCount%>"><input name="obtained<%=courseCount%>" type="number" min="0" max="<%=coursesData20.getString("max_marks")%>" value=""  readonly></td>
                                        <td class="ob__marks" id="ia<%=courseCount%>"><input name="ia<%=courseCount%>" type="number" min="0" max="<%=coursesData20.getString("max_IA")%>"value=""  readonly></td>
                                        <td class="ob__marks" id="credit<%=courseCount%>"><input name="credit<%=courseCount%>" type="number" min="0" max="5" value=""  readonly></td>
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
                                            <button type="submit" id="button16">ADD</button> 
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
											$(this).find("#ia"+courseCount+" input").removeAttr("readonly");
											$(this).find("#credit"+courseCount+" input").removeAttr("readonly");
											
											$(this).find("#obtained"+courseCount+" input").attr("required",true);
											$(this).find("#ia"+courseCount+" input").attr("required",true);
											$(this).find("#credit"+courseCount+" input").attr("required",true);
										});
										courseCountAdd++;
										document.getElementById("noOfCourseAdd<%=i + j%>").value=courseCountAdd;
                        		}else{
                        			$("#obTable<%=programmeResultSet20.getString("programme_id")%><%=i%> tr").each(function(){
										$(this).find("#obtained"+courseCount+" input").attr("readonly",true);
										$(this).find("#ia"+courseCount+" input").attr("readonly",true);
										$(this).find("#credit"+courseCount+" input").attr("readonly",true);
										
										$(this).find("#obtained"+courseCount+" input").val("");
										$(this).find("#ia"+courseCount+" input").val("");
										$(this).find("#credit"+courseCount+" input").val("");
										
										
										$(this).find("#obtained"+courseCount+" input").removeAttr("required");
										$(this).find("#ia"+courseCount+" input").removeAttr("required");
										$(this).find("#credit"+courseCount+" input").removeAttr("required");
										
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
                			  document.querySelector('.bg-model15').style.display = 'none';
                			  document.getElementById('prog'+progID).style.display = 'flex';
                			  document.getElementById('prog'+progID).style.position = 'fixed';
                			
                		}
                <%
                  }
                %>
                </script>
                
                
                
                
                <div class="bg-model17">
                    <div class="model-content17">
                        <div class="close17" id="close" >+</div>
                        <div class="header17">
                            <h1>Edit Student Result</h1></div>
                             <div class="title__next">
                                 <table>
                                     <tr>
                                     <th>Student Name</th>
                                     <th>Reg-no</th>
                                     <th>Programme</th>
                                     <th>Class</th>
                                     </tr>
                                     
                                     <tr>
                                        <td class="td10"><input></td>
                                        <td class="td10"><input></td>
                                        <td class="td10"><input></td>
                                        <td class="td10"><input></td>
                                     </tr>
                                 </table>
                             </div>
                        
                            <form >
                                <table  border="1" class="tb9">
                                    <tr>
                            
                                    
                                    <th class="tdCourse" >Course name</th>
                                    <th class="tdCourse" >Course code</th>
                                    <th class="tdCourse">Course Type</th>
                                    <th class="tdCourse">Obtained Marks</th>
                                    <th class="tdCourse">Internal Assessment Marks</th>
                                    <th class="tdCourse">Credit</th>
                                    
                                    </tr>
									
                            		<tr>
                                        <td class="course__name"><input readonly></td>
                                        <td><input readonly></td>
                                        <td><input readonly></td>
                                        <td class="ob__marks"><input type="number"></td>
                                        <td class="ob__marks"><input type="number"></td>
                                        <td class="ob__marks"><input type="number"></td>
                                    </tr>
                                    
                                    
                
                                    <table class="td11">
                                        <tr>
                                            <td class="td10"><select >
                                            <option value="" disabled selected hidden>Exam Month</option>
                                            <option>Bca</option>
                                            
                                            </select></td>
                                            <td class="td10"><input type="number"></td>
                                            <td class="td10"><input type="date"></td>
                                        </tr>
                                     
                                    </table>
                                            <button id="button17">UPDATE</button> 
                                </table>
                        </form>
                        
                    </div>
                </div>        
        </div>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->     
<!-- ------------------------------------------------------ TAB 7 Profile --------------------------------------------------------------------------------------- -->       
     
          <div class="tabs__content" data-tab="7">
            <div class="protab1">
                <div class="inner__protab1">
                    <div class="inner2"><h6 class="left">Profile</h6></div>
                    
                    <div class="holder">
                    <div class="holder2">
                    <img src="css/images/faculty.png" class="innerimg">
                    </div>
                    <p class="name"><%=request.getSession(false).getAttribute("adminName")%></p>
                    </div>
                    <div class="inputs">
                        <label>Name</label>
                        <input value="<%=request.getSession(false).getAttribute("adminName")%>" class="int" type="text" readonly>
                        <label>Phone</label>
                        <input value="<%=request.getSession(false).getAttribute("adminPhone")%>" class="int" readonly>
                        <label>Email</label>
                        <input value="<%=request.getSession(false).getAttribute("adminEmail")%>" class="int" type="email" readonly>
                        <label>Password</label>
                        <div class="i"><i class="fa-solid fa-eye-slash" id="show-password" onclick="toggle()"></i></div>
                        <input id="password" value="<%=request.getSession(false).getAttribute("adminPassword")%>" class="int" type="password" readonly>
                        
                    </div>
     
                </div>
             </div>
          </div>  
                
     </div>
                
 <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->     
 <!-- ------------------------------------------------------ Call To View Student Results ------------------------------------------------------------------------ -->           
                
		<%
                 
                 	int maxSem = 1;
					ResultSet programmeMaxSem = loadData.loadMaxSemester();
                 	try{
            		
					if(programmeMaxSem!=null){
                		while(programmeMaxSem.next()){
						maxSem = programmeMaxSem.getInt("programme_sem");
						
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
		
		
				<%
                 
                 	int maxSem2 = 1;
					ResultSet programmeMaxSem2 = loadData.loadMaxSemester();
                 	try{
            		
					if(programmeMaxSem2!=null){
                		while(programmeMaxSem2.next()){
						maxSem2 = programmeMaxSem2.getInt("programme_sem");
						
                		}
					}
                 	}catch(SQLException e){
                 		e.printStackTrace();
                 	}
                 		for(int i = 1 ;i <= maxSem2; i++){
				%>         
                  
                  <script type="text/javascript">
                           	
                   		    
                           	function callDeleteServlet<%=i%>(){
                   				
                           		swal({title: "Warning",
                     				 text: "Are you shure you want to delete the Student Semester Result of semester : '<%=i%>'",
                     				 icon: "warning",
                     				 buttons: {
                     					 cancel: "No",
                     					 yes: "Yes",
                     				 },	 
                     			})
                     			.then((value) => {	
                     				if(value == "yes"){

        	            				document.forms['deleteResultForm']['semester'].value = "<%=i%>";
        	            				 document.getElementById("deleteResultForm").submit();
        	            	
                     				}
                     			});
                   				
                   			}
			</script>
                  
		<%} %>
           
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->    
                        
        <script type="text/javascript">
            let image = document.getElementById("image");
            let images = ['css/images/can1.jpg','css/images/can2.jpg','css/images/can3.jpg','css/images/can4.jpg','css/images/can5.jpg','css/images/can6.jpg','css/images/can7.jpg']
            setInterval(function(){
                let random = Math.floor(Math.random()*7);
                image.src = images[random];
                   
            },2500);
        </script>
                
         <script>
             document.querySelector('.close').addEventListener('click', function(){
                 document.querySelector('.bg-model').style.display = 'none';
              });
         </script>
         
         <script>
             document.querySelector('.close1').addEventListener('click', function(){
                 document.querySelector('.bg-model1').style.display = 'none';
             });
         </script>
         
         <script>
             document.querySelector('.close2').addEventListener('click', function(){
                 document.querySelector('.bg-model2').style.display = 'none';
             })
         </script>
         
         <script>
             document.querySelector('.close3').addEventListener('click', function(){
                 document.querySelector('.bg-model3').style.display = 'none';
             })
         </script>
         
         <script>
             document.querySelector('.close4').addEventListener('click', function(){
                 document.querySelector('.bg-model4').style.display = 'none';
             })
         
         </script>
         
         <script>
             document.querySelector('.close5').addEventListener('click', function(){
                document.querySelector('.bg-model5').style.display = 'none';
            })
         </script>
         
         <script>
            document.querySelector('.close6').addEventListener('click', function(){
               document.querySelector('.bg-model6').style.display = 'none';
           })
        </script>
                
        <script>
            document.querySelector('.close7').addEventListener('click', function(){
                document.querySelector('.bg-model7').style.display = 'none';
            })
        </script>
        
        <script>
            document.querySelector('.close8').addEventListener('click', function(){
                document.querySelector('.bg-model8').style.display = 'none';
            })
        </script>
                
        <script>
             document.querySelector('.close9').addEventListener('click', function(){
             document.querySelector('.bg-model9').style.display = 'none';
            })
        </script>
                
        <script>
              document.querySelector('.close10').addEventListener('click', function(){
              document.querySelector('.bg-model10').style.display = 'none';
            })
        </script>
                
        <script>
               document.querySelector('.close11').addEventListener('click', function(){
                document.querySelector('.bg-model11').style.display = 'none';
            })

        </script>
        
        <script>
            document.querySelector('.close13').addEventListener('click', function(){
                document.querySelector('.bg-model13').style.display = 'none';
               
            })
        </script>
                        
        <script>
            document.querySelector('.close14').addEventListener('click', function(){
                document.querySelector('.bg-model14').style.display = 'none';
               
            })
        </script>
            
          <script>
            
        document.querySelector('.close15').addEventListener('click', function(){
            document.querySelector('.bg-model15').style.display = 'none';
            
        });
        </script>
            
            
            <script>
            document.querySelector('.close17').addEventListener('click', function(){
                document.querySelector('.bg-model17').style.display = 'none';
            })
        </script>
            
            
            

    </body>
</html>
    
    
