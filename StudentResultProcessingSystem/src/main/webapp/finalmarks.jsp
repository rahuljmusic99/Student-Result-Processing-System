<%@page import="com.mysql.cj.util.Base64Decoder"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	ResultSet resultSet = (ResultSet) request.getAttribute("semesterMarks");
	
	int grandTotalObtained = 0;
	int grandTotalMax = 0;
	int grandTotalIA = 0;

//	String base64Image = "data:image/png;base64,";
//	base64Image	= base64Image + (String)session.getAttribute("userImage");
%>
<!DOCTYPE html5>

<html>
    <head>
    <link rel="stylesheet" href="css/semester.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="pdf.js"></script>
    </head>
    <body>
        <button id="btn">Print PDF</button><br>
        <div class="main">
            
            <div class="inner">
             <h1><span style="color: palegoldenrod">CANARA&nbsp;</span><img src="css/images/canlogo.png" class="logo"><span style="color: palegoldenrod">&nbsp;COLLEGE</span></h1>
            <h5>Marks Sheet</h5>
            <h6><span style="color: palegoldenrod">Programme:&nbsp;&nbsp;</span><span><%=session.getAttribute("programme")%></span></h6>
             <div class="img"><img src="" class="studimg"></div>
             <div class="right"><h3><br><br><span >Date:&nbsp;</span><span>12-10-2000</span></h3><h4><span>Reg No:&nbsp;</span><span><%=session.getAttribute("student")%></span></h4></div>
             <h2><span style="color: white;">Name:&nbsp;</span><span><%=session.getAttribute("studentName")%></span></h2>
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
    	 		%>
                <tr>
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
                  <tr>
                    <td>IA</td>   
                    <td><%=resultSet.getString("max_IA")%></td>
                    <td>-</td>    
                    <td><%=resultSet.getString("IA_marks")%></td>       <!-- IA obtained   -->
                </tr>
                  <tr>
                    <td>Total</td>
                    <td><%=resultSet.getInt("max_marks")+resultSet.getInt("max_IA")%></td>
                    <td><%=(int)Math.ceil((resultSet.getInt("max_marks")+resultSet.getInt("max_IA")) * 35 / 100)%></td>
                    <td><%=resultSet.getString("total_marks")%></td>       <!-- Total obtained   -->
                </tr>
                 <%  }
                 }catch(SQLException e){
                	 e.printStackTrace();
                 }%>
    		
                <tr>
                    <th colspan="2">Grand Total</th>
                    <th></th>
                    <td><%=grandTotalMax + grandTotalIA%></td>     <!--Max total   -->   <!-- This should be genarated according to number of subjects   -->
                    <td></td>     
                    <td></td>     <!-- total obtained   -->
                    <td></td>
                    <td></td>     <!-- cr total  -->
                    <td></td>     <!-- gp total   -->
                    <td></td>     <!-- gpw total   -->
                    <td></td>
                </tr>
                <tr >
                    <td colspan="11" class="avg">&nbsp;Semester Grade Point Average:</td> <!-- try to add sgpa value after : inside the tag   -->
                
                </tr> 
                
    	
            </table>
        </div>
    </body>

</html>


