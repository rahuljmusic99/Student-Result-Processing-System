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
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/popup.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'rel='stylesheet'>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" ></script>
      	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
        
    </head> 
    <body>
    	
    	<form id="deleteDataForm" action="DeleteDataServlet" method="post">
    		<input type="hidden" id="uniqueId" name="uniqueId" value=""/>
    		<input type="hidden" id="Data" name="Data" value=""/>
    	</form>
    	

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="css/images/education.png" class="edu"></div>
                <button class="tabs__button" data-for-tab="7" id="mainprofile"><div class="holder3"></div></button>
                <button class="tabs__button tabs__button--active" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-graduation-cap"></i>Student Details</button>
                <button class="tabs__button" data-for-tab="3"><i class="fa fa-graduation-cap"></i>Staff Details</button>
                <button class="tabs__button" data-for-tab="4"><i class="fa fa-bar-chart"></i>Programme and courses</button>
                <button class="tabs__button" data-for-tab="5"><i class="fa fa-bar-chart"></i>classes</button>
                <button class="tabs__button" data-for-tab="6"><i class="fa fa-bullseye"></i>Student Result</button>
                <button class="tabs__button" onclick="logoutConfirm();" ><i class="fa fa-power-off"></i>Logout</button>
            </div>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->            
<!-- ------------------------------------------------------ TAB 1 DASHBOARD ----- ------------------------------------------------------------------------------- -->
            
            <div class="tabs__content" data-tab="1">
                <div class="protab2">
                   <div class="imgholder"> <img src="css/images/canlogos.png" class="logos"></div>
                    <div class="cardholder">
                    <div class="cards"><span style="color:steelblue;"><p class="head1">TOTAL RESULT PUBLISH</p></span><p class="values">12</p><div class="icon2"><img src="css/images/blackboard.png" class="im"></div></div>
                    <div class="cards"><span style="color:green;"><p class="head1">TOTAL EXAM</p></span><p class="values">12</p><div class="icon2"><img src="css/images/exam.png" class="im"></div></div>
                    <div class="cards"><span style="color:purple;"><p class="head1">TOTAL PROGRAMME</p></span><p class="values">12</p><div class="icon2"><img src="css/images/programme.png" class="im"></div></div>
                    <div class="cards"><span style="color:orange;"><p class="head1">TOTAL COURSE</p></span><p class="values">12</p><div class="icon2"><img src="css/images/course.png" class="im"></div></div>
                    <div class="cards"><span style="color:red;"><p class="head1">TOTAL CLASS</p></span><p class="values">12</p><div class="icon2"><img src="css/images/class.png" class="im"></div></div></div>
                    <div class="cardholder2">
                    <div class="cards2"><span style="color:steelblue;"><p class="head2">STUDENTS</p></span><p class="values2">12</p><div class="icon3"><img src="css/images/graduated.png" class="ims"></div></div>
                    <div class="cards2"><span style="color:steelblue;"><p class="head2">STAFF</p></span><p class="values2">12</p><div class="icon3"><img src="css/images/staffs.png" class="ims"></div></div>
                    </div> 
                </div>  
            </div>
            
            
            

<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->            
<!-- ------------------------------------------------------ TAB 2 STUDENT DETAILS ------------------------------------------------------------------------------- -->            
            <div class="tabs__content" data-tab="2" id="studentDetails">
                <div class="protab"> 
                    
                    
                    <button class="refresh" id="ref" onclick="myFunction()">Refresh page</button>
                    <h4>Student Details Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Students list</h6>
                        <select class="select3"><option value="" disabled selected hidden>Programme</option></select>
                        <div class="icon"><i class="fa fa-plus-circle" aria-hidden="true"  id="add2" title="Add programme" onclick="myFunction9()"></i></div>
                        </div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
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
                        <tr>
                            <td  class="td1"><%=studentData.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=studentData.getString("class_name")%></td>   <!--class-->
                            <td class="td2"><%=studentData.getString("class_year")%></td>
                            <td><%=studentData.getString("first_name")+" "+studentData.getString("last_name")%></td>  <!-- register number -->
                            <td><%=studentData.getString("reg_no")%></td>
                            <td class="td2"><button id="viewStudent<%=i%>" class="btn__edit"  onclick="viewStudentDetails<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>View</button></td> <!--Edit course-->
                            <td class="td3"><div id="editStudent<%=i%>" class="circle1" title="Edit Programme" onclick="editStudentDetails<%=i%>()" ><i class="fa fa-pencil" aria-hidden="true"></i></div><div id="deleteStudent" class="circle2" title="Delete Programme" onclick="deleteStudentData('<%=studentData.getString("reg_no")%>','student');"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                        
                        <script type="text/javascript">
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
                        
                        <script>
                        	document.getElementById("viewStudentDiv");
	                        document.getElementById("editStudent<%=i%>");
	                        function editStudentDetails<%=i%>(){
	                            document.querySelector('.bg-model8').style.display = 'flex';
	                            document.querySelector('.bg-model8').style.position = 'fixed';
	                            
	                            document.forms['editStudentForm']['sFirstName'].value = "<%=studentData.getString("first_name")%>";
	                            document.forms['editStudentForm']['sLastName'].value = "<%=studentData.getString("last_name")%>";
	                            
	                            if(<%=studentData.getString("gender").toLowerCase() == "male"%>){
	                            	document.forms['editStudentForm']['sGender'].options[1].selected=true;
	                            }
	                            
	                            if(<%=studentData.getString("gender").toLowerCase() == "female"%>){
	                            	document.forms['editStudentForm']['sGender'].options[2].selected=true;
	                            }
	                            
	                            if(<%=studentData.getString("gender").toLowerCase() == "other"%>){
	                            	document.forms['editStudentForm']['sGender'].options[3].selected=true;
	                            }
	                      
	                            document.forms['editStudentForm']['sDOB'].value = "<%=studentData.getString("dob")%>";
	                            document.forms['editStudentForm']['sEmail'].value = "<%=studentData.getString("email")%>";
	                            document.forms['editStudentForm']['sPhone'].value = "<%=studentData.getString("phone")%>";
	                            document.forms['editStudentForm']['sAddress'].value = "<%=studentData.getString("address")%>";
	                            document.forms['editStudentForm']['sPincode'].value = "<%=studentData.getString("pincode")%>";
	                            document.forms['editStudentForm']['sCity'].value = "<%=studentData.getString("birth_place")%>";
	                            document.forms['editStudentForm']['sDistrict'].value = "<%=studentData.getString("birth_district")%>";
	                            document.forms['editStudentForm']['sState'].value = "<%=studentData.getString("birth_state")%>";
	                            document.forms['editStudentForm']['sYOF'].value = "<%=studentData.getString("joining_year")%>";
	                           
	                       
	                           
	                           
	                            document.forms['editStudentForm']['sRegNo'].value = "<%=studentData.getString("reg_no")%>";
	                            document.forms['editStudentForm']['sPassword'].value = "<%=studentData.getString("password")%>";
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
                         
                        </script>
                        
                    </table>
                    </div>
                </div>
            
             
                
                <div class="bg-model6">
                    <div class="model-content6">
                        <div class="close6" id="close" >+</div>
                        <div class="header6">
                            <h1>Add Student Data</h1></div>

                             <img class="student" src="css/images/studenticon.svg">
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
                                <input id="studentYof" name="sYearOfJoining" type="text" placeholder="Year Of Joining" class="merge2" required>
                                <select name="sProgramme" class="merge3" id="studentProgrammeSelect" name="studentProgrammeSelect" onchange = "changeDropDownData(this.value)" required>
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
								
                                <select class="merge3" id="classDropDown" name="classDropDown" onchange="changeDropDownData2(this.value)" required>
                                <option value=""  disabled selected hidden>class</option>
						<% 
							ResultSet studentClassData = loadData.loadClassData();
							if(studentProgrammeData!= null){
								
								try{
									
									while(studentClassData.next()){
						%>				
										<option value="<%=studentClassData.getString("programme_id")%>" id="<%=studentClassData.getString("class_name")%>"><%=studentClassData.getString("class_name")%></option>
						<%			}
								}catch(SQLException e){
									e.printStackTrace();
								}
							}
						%>
                                </select>
                                
                                <select class="merge3" id="classYearDropDown" name="classYearDropDown" onchange="changeDropDownData3(this.value)" required>
                                <option value=""  disabled selected hidden>Class Year</option>
                        <% 
							ResultSet studentClassData2 = loadData.loadClassData();
							if(studentClassData2!= null){
								
								try{
									
									while(studentClassData2.next()){
						%>				
										<option value="<%=studentClassData2.getString("class_name")%>"><%=studentClassData2.getString("class_year")%></option>
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
                                
                                
                                <script>
                                //add student form validation
                                 const addStudentForm = document.getElementById("insertStudentDataForm");
                                 const sFirstName = document.getElementById("studentFirstName");
                                 const sLastName = document.getElementById("studentLastName");
                                 const sPhone = document.getElementById("studentPhone");
                                 const sDob = document.getElementById("studentDob");
                                 const sEmail = document.getElementById("studentEmail");
                                 const sAddress = document.getElementById("studentAddress");
                                 
								 addStudentForm.addEventListener('submit', (e)=> {
									
									e.preventDefault(); 
									
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
									var dd = String(validMaxDate.getDate()).padStart(2, '0');
									var mm = String(validMaxDate.getMonth() + 1).padStart(2, '0'); //January is 0!
									var yyyy = validMaxDate.getFullYear() -35;
									validMaxDate = yyyy + '-' + mm + '-' + dd;
									
									var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
									var mobileNumber = /^[6-9]\d+/; 
									
								
									if(onlyCharacters.test(sFirstName.value) == false){//First Name
										swal("Invalid First Name !","First Name can only contain Alphabets","error");
										e.preventDefault(); 
										
									}else if(sFirstName.value.length < 2){
										swal("Invalid First Name !","First Name should have at least 2 Characters","error");
										e.preventDefault(); 
									
									}else if(sFirstName.value.length > 64){
										swal("Invalid First Name !","First Name cannot be more than 64 Characters","error");
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
										
									}else if(sLastName.value.length > 64){
										swal("Invalid First Name !","First Name cannot be more than 64 Characters","error");
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
										
									}else if(sEmail.length > 255){
										swal("Invalid Email !","Email Address cannot be more than 255 Characters","error");
										e.preventDefault();
										
									}else if(sAddress.length < 3){
										swal("Invalid Address","Address cannot be less than 3 Characters","error");
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
										
								 	}
								 });
						                                
                                
                    	  		// function to enable and disable dropDown in Student Data        		
								window.onload = function removeduplicate(){
									var myclass = {};
									$("select[id='classDropDown'] > option").each(function () {
									    if(myclass[this.text]) {
									        $(this).remove();
									        $(this).hide();
									    } else {
									        myclass[this.text] = this.value;
									        $(this).hide();
									    }
									});
										
										var myyear = {};
										$("select[id='classYearDropDown'] > option").each(function () {
										    if(myyear[this.text]) {
			
										        $(this).hide();
										    } else {
										        myyear[this.text] = this.value;
										        $(this).hide();
										    }
										});
										
										var mysem = {};
										$("select[id='programmeSemDropDown'] > option").each(function () {
										    if(mysem[this.text]) {
										        $(this).remove();
										        $(this).hide();
										    } else {
										        mysem[this.text] = this.value;
										        $(this).hide();
										    }
										});
									}
                             		
                    				function changeDropDownData(studentProgrammeSelect){        
                    					if(studentProgrammeSelect!=''){
                    						
                    						$("#classDropDown option[value='"+studentProgrammeSelect+"']").show();
                    						$("#classDropDown option[value!='"+studentProgrammeSelect+"']").hide();
                    						document.getElementById("classDropDown").selectedIndex = "0";
                    						document.getElementById("classYearDropDown").selectedIndex = "0";
                    						$("#classYearDropDown option").hide();
                    						document.getElementById("programmeSemDropDown").selectedIndex = "0";
                    						
                    						
                    						var programmeSem = document.getElementById(studentProgrammeSelect).value;
                    						var optionsCount = $('#programmeSemDropDown > option').length -1;
                    						
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
                    						document.getElementById("classYearDropDown").selectedIndex = "0";
                    						document.getElementById("programmeSemDropDown").selectedIndex = "0";
                    						$("#programmeSemDropDown option").hide();
                    						
                    						$("#classDropDown option:selected").each(function() {
                 							   var classId = this.text;
                 							   document.forms['insertStudentDataForm']['sClass'].value = classId;
                 							  
                 							}); 
                    					}
                    				}
                    				
                    				function changeDropDownData3(studentClassYear){                    					
                    					if(studentClassYear!=''){
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
                             <img class="student" src="css/images/studenticon.svg">
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
                             <img class="student" src="css/images/studenticon.svg">
                            <form id = "editStudentForm" action="" >
                                <input id="sFirstName" type="text" placeholder="First Name" class="merge1">
                                <input id="sLastName"  type="text" placeholder="Last Name" class="merge1">
                                <select id="sGender" class="merge2">
                                <option value="" disabled hidden>Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                                </select>
                                <input id="sDOB" type="text" placeholder="Date of Birth" class="merge2">
                                <input id="sEmail" type="text" placeholder="Email" class="merge1">
                                <input id="sPhone" type="text" placeholder="Mobile Number" class="merge1">
                                <input id="sAddress" type="text" placeholder="Address" class="merge1">
                                <input id="sPincode" type="text" placeholder="Pincode" class="merge1">
                                <input id="sCity" type="text" placeholder="city" class="merge3">
                                <input id="sDistrict" type="text" placeholder="District" class="merge3">
                                <input id="sState" type="text" placeholder="State" class="merge3">
                                <input id="sYOF" type="text" placeholder="Year Of Joining" class="merge2">
                                <select id="sProgramme" class="merge3">
                                <option value="" disabled  hidden>Programme</option>
                                <option></option>
                                </select>
                                <select id="sClass" class="merge3">
                                <option value="" disabled hidden>class</option>
                                <option></option>
                                </select>
                                <select id="sClassYear" class="merge3">
                                <option value="" disabled hidden>Class Year</option>
                                <option></option>
                                </select>
                                <select id="sCurrentSem" class="merge2">
                                <option value="" disabled hidden>Current Sem</option>
                                </select>
                                
                                
                                <input id="sRegNo" type="text" placeholder="Register Number" class="merge1">
                                <input id="sPassword" type="text" placeholder="Password" class="merge1">
                                <button id="button8" >UPDATE</button>
                        </form>
                    </div>
                </div>
                </div>
            




<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------ TAB 3 STAFF DETAILS --------------------------------------------------------------------------------- -->
            
            <div class="tabs__content" data-tab="3">
                <div class="protab"> 
                    
                    
                    <button class="refresh" id="ref" onclick="myFunction()">Refresh page</button>
                    <h4>Staff Details Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Staff list</h6>
                        <div class="icon1"><i class="fa fa-plus-circle" id="add3" title="Add programme" onclick="myFunction12()"></i></div></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
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
                        <tr>
                            <td class="td1"><%=staffDataSet.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=staffDataSet.getString("first_name")+" "+staffDataSet.getString("last_name")%></td>   <!--staffName-->
                            <td class="td7"><%=staffDataSet.getString("staff_id")%></td>   <!--staffId-->
                            <td class="td8"></td>   <!--Role-->
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
                        	
                        	
                        	document.forms['editStaffForm']['staffFirstName'].value = "<%=staffDataSet.getString("first_name")%>";
                        	document.forms['editStaffForm']['staffLastName'].value = "<%=staffDataSet.getString("last_name")%>";
                        	document.forms['editStaffForm']['staffId'].value = "<%=staffDataSet.getString("staff_id")%>";
                        	document.forms['editStaffForm']['staffEmail'].value = "<%=staffDataSet.getString("email")%>";
                        	document.forms['editStaffForm']['staffPhone'].value = "<%=staffDataSet.getString("phone")%>";
                        	document.forms['editStaffForm']['staffAddress'].value = "<%=staffDataSet.getString("address")%>";
                        	document.forms['editStaffForm']['staffPassword'].value = "<%=staffDataSet.getString("password")%>";
                        }
                        </script>
                        
						<%		
								i++;	
									}
                        			
                        		}catch(SQLException e){}
                        	}
                        %>
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
                             <img class="student" src="css/images/studenticon.svg">
                            <form id="insertStaffForm" action="InsertDataServlet" method="post">
                                <input name="firstName" type="text" placeholder="First Name" class="merge4">
                                <input name="lastName" type="text" placeholder="Last Name" class="merge4">
                                <select name="gender" class="merge5">
                                <option value="" disabled selected hidden>Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                                </select>
                                <input name="email" type="text" placeholder="Email" class="merge4">
                                <input name="phone" type="text" placeholder="Mobile Number" class="merge4">
                                <input name="address" type="text" placeholder="Address" class="merge5">
                                <select name="programmeId" class="merge4">
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
                                <select name="" class="merge4">
                                <option value="" disabled selected hidden>Role</option>
                                </select>
                                <input name="staffId" type="text" placeholder="Staff ID(Digits only)" class="merge4">
                                <input name="password" type="text" placeholder="Password" class="merge4">
                                <input name="Data" type="hidden" value="staff"/>
                                <button id="button9" onclick="insertStaff()" >Add</button>
                        </form>
                    </div>
                </div>
                
                <div class="bg-model10">
                    <div class="model-content10">
                        <div class="close10" id="close" >+</div>
                        <div class="header10">
                            <h1>Staff Details</h1></div>
                             <img class="student" src="css/images/studenticon.svg">
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
                             <img class="student" src="css/images/studenticon.svg">
                            <form id="editStaffForm" action="" method="post">
                                <input id="staffFirstName" name="staffFirstName" type="text" placeholder="First Name" class="merge4">
                                <input id="staffLastName" name="staffLastName" type="text" placeholder="Last Name" class="merge4">
                                <select id="staffGender" name="staffGender" class="merge5">
                                <option value="" disabled selected hidden>Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                                </select>
                                <input id="staffEmail" name="staffEmail" type="text" placeholder="Email" class="merge4">
                                <input id="staffPhone" name="StaffPhone" type="text" placeholder="Mobile Number" class="merge4">
                                <input id="staffAddress" name="staffAddress" type="text" placeholder="Address" class="merge5">
                                <select id="staffProgramme" name="staffProgramme" class="merge4">
                                <option value="" disabled selected hidden>Programme name</option>
                                </select>
                                <select id="" name="" class="merge4">
                                <option value="" disabled selected hidden>Role</option>
                                </select>
                                <input id="staffId" name="staffId" type="text" placeholder="Staff ID(Digits only)" class="merge4">
                                <input id="staffPassword" name="staffPassword" type="text" placeholder="Password" class="merge4">
                                <button id="button11" >Update</button>
                        </form>
                    </div>
                </div>
            </div>
            
            
            
            
            
            
            
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->            
<!-- ------------------------------------------------------ TAB 4 PROGRAMME AND COURSES ------------------------------------------------------------------------- -->

            <div class="tabs__content" data-tab="4">
                <div class="protab"> 
                    <button class="refresh" id="refProgramme" onclick="refreshProgramme();">Refresh page</button>
                    <h4>Programme Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Programme list</h6>
                        <select class="select3"><option value="" disabled selected hidden>Programme</option></select>
                        <div class="icon"><i class="fa fa-plus-circle" id="add"  title="Add programme" onclick="myFunction1()"></i></div></div>
                   
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr class="tb2">
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
                        <tr>
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
                              document.querySelector('.bg-model1').style.position = 'fixed';document.querySelector('.bg-model').style.position = 'fixed';
	                          document.getElementById("programmeNameInCourse").value = "<%=programmeResultSet.getString("programme_name")%>";
	                          document.getElementById("courseSemester").value = "<%=i%>";
	                          document.getElementById("programmeIdInCourse").value = "<%=programmeResultSet.getString("programme_id")%>"
	                        }
	                        
	                        document.getElementById("programmeEdit<%=i + j%>");
	                        function editProgramme<%=i + j%>(){
	                            document.querySelector('.bg-model13').style.display = 'flex';
	                            document.querySelector('.bg-model13').style.position = 'fixed';
	                            document.getElementById("programmeIdInProgramme").value = "<%=programmeResultSet.getString("programme_id")%>";
	                            document.getElementById("programmeNameInProgramme").value = "<%=programmeResultSet.getString("programme_name")%>";
	                            document.getElementById("programmeDuration").value = "<%=programmeResultSet.getString("programme_duration")%>";
	                            document.getElementById("programmeTotalSemesterInProgramme").value = "<%=programmeResultSet.getString("programme_sem")%>";
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
                                <input type="text" placeholder="Programme Id" name="programmeId">
                                <input type="text" placeholder="Programme Name" name="programmeName">
                                <input type="text" placeholder="Duration(In Years)" name="duration">
                                <input type="text" placeholder="Total Semester" name="totalSemester">
                                <button id="button" onclick="insertProgramme();" >ADD</button>
                            
                        </form>
                    </div>
                </div>
                
                <div class="bg-model1">
                    <div class="model-content1">
                        <div class="close1" id="close" >+</div>
                        <div class="header1">
                            <h1>Add Course Data</h1></div>
                            <form id="courseForm" action="InsertDataServlet" method="post">
                            	<input type="hidden" value="course" name="Data" />
                            	<input type="hidden" id = "programmeIdInCourse" name="programmeIdInCourse" value=""/>
                                <input type="text" id="programmeNameInCourse" name="programmeNameInCourse" readonly="readonly" value=""/>
                                <input type="text" name="courseCode" placeholder="Course Code">
                                <input type="text" name="courseName" placeholder="Course Name">
                                <input type="text" id="courseSemester" name="courseSemester" readonly="readonly" value=""/>
                                <input type="hidden" id ="courseType" name="courseType"  value=""/>
                                <input type="hidden" id="courseGroup" name="courseGroup" value=""/>
                                
                                <select id="courseTypeD" name="courseTypeD">
                                <option value="" disabled selected hidden>Type</option>
                                <option >Theory</option>
                                <option >Practical</option>
                                </select>
                                
                                <select id="courseGroupD" name="courseGroupD">
                                <option value="" disabled selected hidden>Group</option>
                                <option >Group 1 Core Course</option>
                                <option >Group 2 Elective Course</option>
                                <option >Group 3 a)Compulsary Foundation</option>
                                <option >Group 3 b)Elective Foundation</option>
                                <option >Group 4</option>
                                
                                </select>
                                <input name="maxMarks" type="text" placeholder="Max marks">
                                <input name="minMarks" type="text" placeholder="Min Marks">
                                <input name="maxIA" type="text" placeholder="Max Internal Assesment Marks">
                                <button id="button1" onclick="insertCourse();">ADD</button>
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
                            <form id="editCourseForm<%=i + j%>" action="" method="post">
                                <table id="editCourseTable<%=i + j%>" border="1" class="tb4">
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
							<%try{
                            	if(coursesData!=null){
                            		
                            		while(coursesData.next()){
                            			courseCount = courseCount + 1;
                            %>			
                            		<tr class="input-in">
                            			<td class="tdCo"><input class="inputprog" id="" value="<%=programmeResultSet2.getString("programme_name")%>"/></td>
                            			<td class="tdCourse"><input class="inputCourseCode" id="" value="<%=coursesData.getString("course_code")%>"/></td>
                            			<td class="tdCourse"><input class="input" id="" value="<%=coursesData.getString("course_name")%>"/></td>
                            			<%if(coursesData.getString("course_type").equals("Theory")){
                            			%>
                            				<td class="tdCourse"><select class="input">
                            					<option value="" disabled hidden>course Type</option>
                            					<option selected>Theory</option>
                            					<option>Practical</option>
                            				</select>
                            			</td>
                            			<%}else{%>
                            				<td class="tdCourse"><select class="input">
                            					<option value="" disabled hidden>course Type</option>
                            					<option>Theory</option>
                            					<option Selected>Practical</option>
                            				</select>
                            			</td>
                            			<%}%>
                            			
                            			<%switch(coursesData.getString("course_group")){
                            			case "Group 1 Core Course":
                            			%>
                            				<td class="tdCourse"><select class="input">
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
                                				<td class="tdCourse"><select class="input">
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
	                               				<td class="tdCourse"><select class="input">
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
	                               				<td class="tdCourse"><select class="input">
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
                            				<td class="tdCourse"><select class="input">
	                               					<option value="" disabled hidden>course Group</option>
	                               					<option >Group 1 Core Course</option>
	   				                                <option >Group 2 Elective Course</option>
	   				                                <option >Group 3 a)Compulsary Foundation</option>
	   				                                <option >Group 3 b)Elective Foundation</option>
	   				                                <option selected >Group 4</option>
	                               				</select>
	                               			</td>
                            			<%} %>
                            			    
                                            <td class="tdCourse"><input class="inputDigits" id="" value=""/></td>
                       						<td class="tdCourse"><input class="inputDigits" id="" value="<%=coursesData.getString("max_marks")%>"/></td>
                            				<td class="tdCourse"><input class="inputDigits" id="" value="<%=coursesData.getString("min_marks")%>"/></td>
                            				<td class="tdCourse"><input class="inputDigits" id="" value="<%=coursesData.getString("max_IA")%>"/></td>
                                            <td><button class="btnDelete" id="button12">Delete</button></td> 
                                            <td><button class="btnUpdate" id="button14">Update</button></td> 
                            				
                            			<script type="text/javascript">
                            				function deleteCourse<%=courseCount%>(){
                            					document.forms['deleteForm']['courseCode'].value = "<%=coursesData.getString("course_code")%>";
                            					document.forms['deleteForm']['courseName'].value = "<%=coursesData.getString("course_name")%>";
                            					
                            					
                            				}
                            				
                            				
                            			</script>
                            			
                            		</tr>    
                            			
                            <%	 	}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%> 
                                </table>
                        </form> 
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
                            <form action="">

                                <input id="programmeIdInProgramme" type="text" placeholder="Programme Id">
                                <input id="programmeNameInProgramme" type="text" placeholder="Programme Name">
                                <input id="programmeDuration" type="text" placeholder="Duration(In Years)">
                                <input id="programmeTotalSemesterInProgramme" type="text" placeholder="Total Semester">
                                <button id="button13" >UPDATE</button>
                        </form>
                    </div>
                </div>
            </div>
                 
                 
                 
                 
                 
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->                 
<!-- ------------------------------------------------------ TAB 5 CLASSES  -------------------------------------------------------------------------------------- -->
                    
             <div class="tabs__content" data-tab="5">
                <div class="protab"> 
                    <button class="refresh" id="ref" onclick="myFunction()">Refresh page</button>
                    <h4>Class Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Class list</h6>
                        <select class="select3"><option value="" disabled selected hidden>Programme</option></select>
                        <div class="icon"><i class="fa fa-plus-circle" id="add1" title="Add programme" onclick="myFunction8()"></i></div></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
                            <th>Programme Name</th>
                            <th>Class Name</th>
                            <th>Class Year</th>
                            <th>Action</th>
                        </tr>
                        
                        <%
                        	try{
                        		
                        		ResultSet classesData = loadData.loadClassData();
    	    					while(classesData.next()){
    	    			%>		
    	    	
                        <tr>
                            <td class="td1"><%=classesData.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=classesData.getString("class_name")%></td>   <!--Semseter-->
                            <td class="td5"><%=classesData.getString("class_year")%></td>
                            <td class="td3"><div class="circle1" title="Edit Class" id="edit5" onclick="myFunction17()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div id="deleteClass" class="circle2" title="Delete Class" onclick="deleteClass('<%=classesData.getString("class_id")%>','class','<%=classesData.getString("class_name")+" "+classesData.getString("class_year")+" year"%>')"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>			

                        <% 	
    	    					}
                        	}catch(SQLException e){
                        		e.printStackTrace();
                        		
                        	}
	                           
	                    %>
                     
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
                            <form id="classForm" action="InsertDataServlet" method="post">
                            	<input type="hidden" name="Data" value="class"/>
                                <input type="hidden" id="programmeNameInClass" name="programmeNameInClass"/>
                                <select id="programmeNameInClassD">
                                <option value="" disabled selected hidden>Select Programme</option>
                                <%
                                	try{
                                		ResultSet programmeName = loadData.loadProgrammeData();
                                		while(programmeName.next()){
                                			
                                %>		
                                            <option><%=programmeName.getString("programme_name")%></option>	
                                <%	
                                	
                                		}
                                	}catch(SQLException e){
                                		e.printStackTrace();
                                	}
                                %>
                                </select>
                                <input name="classId" type="text" placeholder="Class ID">
                                <input name="className" type="text" placeholder="Class Name">
                                <input name="classYear" type="text" placeholder="Class Year (in digits)">
                                <button id="button5" onclick="insertClass();" >ADD</button>
                        </form>
                    </div>
                </div>
                        
                <div class="bg-model14">
                    <div class="model-content14">
                        <div class="close14" id="close" >+</div>
                        <div class="header14">
                            <h1>Edit Class Data</h1></div>
                            <form action="">
                                <select >
                                <option value="" disabled selected hidden>Select Programme</option>
                                <option>Bca</option>
                                <option>Bcom</option>
                                <option>BBA</option>
                                </select>
                                <input type="text" placeholder="Course Code">
                                <input type="text" placeholder="Course Name">
                                <input type="text" placeholder="Year (in digits)">
                                <button id="button15" >UPDATE</button>
                        </form>
                    </div>
                </div>
            </div>
                    
               
               
               
               
                    
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->     
<!-- ------------------------------------------------------ TAB 6 STUDENT RESULTS ------------------------------------------------------------------------------- -->
            
            <div class="tabs__content" data-tab="6">
            <div class="protab"> 
            <button class="refresh" id="ref" onclick="">Refresh page</button>
            <h4>Student Result Management</h4>
            <div class="inner__protab">
            <div class="inner1"><h6 class="left">Student Result</h6>
            <select class="select2">
            <option value="" disabled selected hidden>Class</option>
            <option>  </option>
            </select>
            <select class="select2"><option value="" disabled selected hidden>Programme</option>
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
            <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
            <tr>
                <th>Programme</th>
                <th>Class</th>
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
           <tr>
              <td class="td1"><%=studentData.getString("programme_name")%></td>   <!--Programme -->
              <td class="td2"><%=studentData.getString("class_name")%></td>   <!--class-->
              <td><%=studentData.getString("first_name") +" "+ studentData.getString("last_name")%></td>   <!--Student Name-->
              <td><%=studentData.getString("reg_no")%></td>   <!--Register number-->
              <td class="td1"><button class="btn__course" id="btn__course<%=i%>" onclick="myFunction4()"><span style="font-size: 16px;">+</span> Add</button></td>  <!--Add Result-->
              <td class="td2"><button class="btn__edit" id="btn-edit<%=i%>" onclick="viewResult<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Result</button></td> <!--View Result-->
              <td class="td3"><div class="circle1" title="Edit Result" id="circle1" onclick="myFunction6()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Result" id="circle2" onclick="myFunction7()"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
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
            	</script>
			<% 		
				i = i + 1;
                	}	
                }	
               	}catch(SQLException e){}
            
            %>   
              
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
                            <h1>Delete Student Results</h1></div>
                            <form action="">
                                <table border="1" class="tb3">
                                    <tr>
                                    <th>Semester</th>
                                    </tr>
                                    
                                    <tr class="pop-row">
                                        <td><div class="pop-div"><div class="pop-inner2">Semester1</div></div></td>
                                    </tr>  
                                    
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
                    <img src="" class="innerimg">
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
                        <div class="i"><i class="fa fa-grav"></i></div>
                        <input value="<%=request.getSession(false).getAttribute("adminPassword")%>" class="int" type="password" readonly>
                        <button class="cp">Change Password</button>
                    </div>
     
                </div>
             </div>
          </div>  
                
     </div>
                
 <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->            
                
     
				<%
                   
                   	int maxSem = 1;
                   	try{
	                   
	                    Connection con = DBConnection.createConnection();;
	 					Statement statement = con.createStatement();
	 					ResultSet programmeSem = statement.executeQuery(""
	 						+"SELECT programme_sem from programme "
	 						+"WHERE programme_sem = (SELECT MAX(programme_sem)FROM programme)LIMIT 1");	
	             		
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
                
                     

    </body>
</html>
    
    
