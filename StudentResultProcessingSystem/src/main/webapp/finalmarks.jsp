<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mysql.cj.util.Base64Decoder"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	ResultSet resultSet = (ResultSet) request.getAttribute("semesterMarks");
	String resultDate = (String)request.getAttribute("resultDate");
	String examMonth = (String)request.getAttribute("examMonth");
	String examYearString = (String)request.getAttribute("examYear");
	String semester = (String)request.getAttribute("semester");
	String studentName = "";
	String regNo = "";
	String programmeName = "";

	int grandTotalObtained = 0;
	int grandTotalMax = 0;
	int grandTotalIA = 0;
	float grandTotalCredit = 0;
	int grandTotalGp = 0;
	int grandTotalGpw = 0;
	float grandTotalCp = 0;
	
	String examMonthString = "";
    switch(examMonth.trim()){    
    case "1":    
		examMonthString = "January";
     break; 
    case "2":    
    	examMonthString = "February";
     break; 
    case "3":    
    	examMonthString = "March";
     break;
    case "4":    
    	examMonthString = "April";
     break;
    case "5":    
    	examMonthString = "May";
     break;
    case "6":    
    	examMonthString = "June";
     break;
    case "7":    
    	examMonthString = "July";
     break;
    case "8":    
    	examMonthString = "August";
     break;
    case "9":    
    	examMonthString = "September";
     break;
    case "10":    
    	examMonthString = "October";
     break;
    case "11":    
    	examMonthString = "November";
     break;
    default:     
    	examMonthString = "December"; 
    }    
	
//	String base64Image = "data:image/png;base64,";
//	base64Image	= base64Image + (String)session.getAttribute("userImage");

	if(resultSet == null){
%>
<jsp:forward page="/home.jsp"></jsp:forward>
<%} %>
    
<!DOCTYPE html5>
<html>
    <head>

    <link rel="stylesheet" href="css/semester.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/dd03fdb332.js" crossorigin="anonymous"></script>
    <script src="js/pdf.js"></script>

    </head>
    <body>
        <a href=""><i class="fa-solid fa-arrow-left"></i></a>
        <button id="btn">Print PDF</button><br>
        <div class="main">
            
            <div class="inner">
             <h1><span style="color: palegoldenrod">CANARA&nbsp;</span><img src="css/images/canlogo.png" class="logo"><span style="color: palegoldenrod">&nbsp;COLLEGE</span></h1>
            <h5>Marks Sheet</h5>
            <h6><span style="color: palegoldenrod">Programme:&nbsp;&nbsp;</span><span><%=request.getAttribute("programmeName")%></span></h6>
<<<<<<< HEAD
            <h6><span style="color: palegoldenrod">Choice Based Credit System <%=semester%> semester degree examimation <%=examMonthString%> <%=examYearString%>&nbsp;&nbsp;</span>
=======
>>>>>>> 5958d1dcf3027051232a01965e79a3f8b346b40d
             <div class="img"><img src="" class="studimg"></div>
             <div class="right"><h3><br><br><span >Date:&nbsp;</span><span><%=resultDate%></span></h3><h4><span>Reg No:&nbsp;</span><span><%=request.getAttribute("registerNo")%></span></h4></div>
             <h2><span style="color: white;">Name:&nbsp;</span><span><%=(String) request.getAttribute("studentName")%></span></h2>
            </div>
            <table class="table1" border="1" cellspacing="0"  rules="" align="center">
                <tr bgcolor="#7dace4">
                    <th colspan="2">Courses</th>
                    <th colspan="4">Marks</th>
                    <th colspan="4">Credit Calculation</th>
                    <th rowspan="2" colspan="0">result</th>
                </tr>
                <tr bgcolor="#7dace4">
                    <th>Name</th>  
                    <th>Code</th>
                    <th></th>
                    <th>Max</th>
                    <th>Min</th>
                    <th>Obtained</th>
                    <th>Grade</th>
                    <th>CR</th>
                    <th>GP</th>
                    <th>GPW</th>  
                </tr>
                <%
                try{
                	while(resultSet.next()){
                		
						grandTotalMax = grandTotalMax + resultSet.getInt("max_marks");
						grandTotalIA = grandTotalIA + resultSet.getInt("max_IA");
						grandTotalObtained = grandTotalObtained + resultSet.getInt("total_marks");
						grandTotalCredit = grandTotalCredit + resultSet.getInt("credit");
						grandTotalGp = grandTotalGp + resultSet.getInt("grade_point");
						grandTotalGpw = grandTotalGpw + resultSet.getInt("grade_point_weightage");
						grandTotalCp = grandTotalCp + (resultSet.getInt("credit") * resultSet.getInt("grade_point"));

    	 		%>
                <tr bgcolor="whitesmoke">
                    <td rowspan="3"><%=resultSet.getString("course_name").toUpperCase()%></td> <!--course name-->   <!-- comment specifies-you have to add value  -->
                    <td rowspan="3"><%=resultSet.getString("course_code")%></td>         <!--code-->
                    <td><%=resultSet.getString("course_type")%></td>                       
                    <td><%=resultSet.getString("max_marks")%></td>                           
                    <td><%=resultSet.getString("min_marks")%></td>                           
                    <td><%=resultSet.getString("obtained_marks")%></td>                             <!-- theory obtained -->                                             
                    <td rowspan="3"><%=resultSet.getString("grade")%></td>                 <!--  grade  -->
                    <td rowspan="3"><%=resultSet.getString("credit")%></td>                 <!--  cr  -->
                    <td rowspan="3"><%=resultSet.getString("grade_point")%></td>                 <!--  gp  -->
                    <td rowspan="3"><%=resultSet.getString("grade_point_weightage")%></td>                 <!--  gpw  -->
                    <td colspan="1" rowspan="3"><%=resultSet.getString("result").toUpperCase()%></td>     <!--  result  -->
                </tr>
                  <tr bgcolor="whitesmoke">
                    <td>IA</td>   
                    <td><%=resultSet.getString("max_IA")%></td>
                    <td>-</td>    
                    <td><%=resultSet.getString("IA_marks")%></td>       <!-- IA obtained   -->
                </tr >
                  <tr bgcolor="whitesmoke">
                    <td>Total</td>
                    <td><%=resultSet.getInt("max_marks")+resultSet.getInt("max_IA")%></td>
                    <td><%=(int)Math.ceil((resultSet.getInt("max_marks")+resultSet.getInt("max_IA")) * 35 / 100)%></td>
                    <td><%=resultSet.getString("total_marks")%></td>       <!-- Total obtained   -->
                </tr>
                 <% 	
                 	}
                 }catch(SQLException e){
                	 e.printStackTrace();
                 }%>
                 
                 <%if(grandTotalObtained == 0){
                    
            			String loginUser = (String) session.getAttribute("user");
            			
            			
            			if(loginUser == "student") {
            			%>
  
            				<script type="text/javascript"> 
            				
		            		window.onload = function(){
		            			swal({title: "Sorry",
		               				 text: "No Result Data Found!",
		               				 icon: "warning",
		               				 buttons: {
		               					 ok: "OK",
		               				 },	 
		               			})
		               			.then((value) => {	
		               				if(value == "ok"){
		               					document.location.href="studdashboard.jsp";
		               				}
		               			});
		            		}
            					
            				</script>
            			
            			<%}else if(loginUser == "staff") { %>	
            				
            				<script type="text/javascript"> 
            				window.onload = function(){
		            			swal({title: "Sorry",
		               				 text: "No Result Data Found!",
		               				 icon: "warning",
		               				 buttons: {
		               					 ok: "OK",
		               				 },	 
		               			})
		               			.then((value) => {	
		               				if(value == "ok"){
		               					document.location.href="staffdashboard.jsp";
		               				}
		               			});
		            		}
            					
            				</script>
            					
            			<%}else if(loginUser == "admin") { %>
            			
            				<script type="text/javascript"> 
            				window.onload = function(){
		            			swal({title: "Sorry",
		               				 text: "No Result Data Found!",
		               				 icon: "warning",
		               				 buttons: {
		               					 ok: "OK",
		               				 },	 
		               			})
		               			.then((value) => {	
		               				if(value == "ok"){
		               					document.location.href="admindashboard.jsp";
		               				}
		               			});
		            		}
            					
            				</script>
            				
            			<% }
                    } %>
                    
                <tr bgcolor="whitesmoke">
                    <th colspan="2">Grand Total</th>
                    <th></th>
                    <td><%=grandTotalMax + grandTotalIA%></td>     <!--Max total   -->   <!-- This should be genarated according to number of subjects   -->
                    <td></td>     
                    <td><%=grandTotalObtained%></td>     <!-- total obtained   -->
                    <td></td>
                    <td><%=(int)grandTotalCredit%></td>     <!-- cr total  -->
                    <td><%=(int)grandTotalGp%></td>     <!-- gp total   -->
                    <td><%=grandTotalGpw%></td>     <!-- gpw total   -->
                    <td></td>
                </tr>
                <%DecimalFormat df = new DecimalFormat();
                  df.setMaximumFractionDigits(2);
                %>
                <tr bgcolor="whitesmoke">
                    <td colspan="11" class="avg">&nbsp;Semester Grade Point Average: <%=df.format(grandTotalCp/grandTotalCredit)%></td> <!-- try to add sgpa value after : inside the tag   -->
                
                </tr> 
                
    	
            </table>
        </div>
    </body>

</html>


