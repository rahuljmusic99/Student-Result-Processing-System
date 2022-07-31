<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	ResultSet resultSet = (ResultSet) request.getAttribute("semesterMarks");
%>
<!DOCTYPE html5>
<html>
<head>
    <link rel="stylesheet" href="css/semester.css">
</head>
<body>
    <scetion class="mainsec">

    <scetion class="sec2">
        
        
        
        <div class="div2">
            <h1>
                <span>Canara&nbsp;</span><img class="logo" src="css/images/canlogo.png"><span>&nbsp;College</span>
            </h1>
            <h3>Marks Sheet</h3>
            <h4><span>Programme: </span><span></span></h4>
            <div class="img"><img class="studimg " src=""></div>       <!-- Add image here -->
            <h6><span style="color: white">Name:&nbsp;</span><span style="color: white">  </span></h6>
            <h5><span style="color: white">Date:&nbsp;</span><span style="color: white">  </span></h5>
            <h5><span style="color: white">Reg No :&nbsp;</span><span style="color: white">  </span></h5>
            <table class="table1" border="1" cellspacing="0"  rules="" align="center">
                <tr bgcolor="lightblue">
                    <th colspan="2">Courses</th>
                    <th colspan="4">Marks</th>
                    <th colspan="4">Credit Calculation</th>
                    <th rowspan="2" colspan="0">result</th>
                </tr>
                <tr bgcolor="lightblue">
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
    	 		%>
                <tr>
                    <td rowspan="3"><%=resultSet.getString("course_name")%></td> <!--course name-->   <!-- comment specifies-you have to add value  -->
                    <td rowspan="3"><%=resultSet.getString("course_code")%></td>         <!--code-->
                    <td><%=resultSet.getString("course_type")%></td>                       
                    <td><%=resultSet.getString("max_marks")%></td>                           
                    <td><%=resultSet.getString("min_marks")%></td>                           
                    <td><%=resultSet.getString("obtained_marks")%></td>                             <!-- theory obtained -->                                             
                    <td rowspan="3"><%=resultSet.getString("grade")%></td>                 <!--  grade  -->
                    <td rowspan="3"><%=resultSet.getString("credit")%></td>                 <!--  cr  -->
                    <td rowspan="3"><%=resultSet.getString("grade_point")%></td>                 <!--  gp  -->
                    <td rowspan="3"><%=resultSet.getString("grade_point_weightage")%></td>                 <!--  gpw  -->
                    <td colspan="1" rowspan="3"><%=resultSet.getString("result")%></td>     <!--  result  -->
                </tr>
                  <tr>
                    <td>IA</td>   
                    <td><%=resultSet.getString("max_IA")%></td>
                    <td>-</td>    
                    <td><%=resultSet.getString("IA_marks")%></td>       <!-- IA obtained   -->
                </tr>
                  <tr>
                    <td>Total</td>
                    <td>100</td>
                    <td>35</td>
                    <td><%=resultSet.getString("total_marks")%></td>       <!-- Total obtained   -->
                </tr>
                 <%  }
                 }catch(SQLException e){
                	 e.printStackTrace();
                 }%>
    		
                <tr>
                    <th colspan="2">Grand Total</th>
                    <th></th>
                    <td></td>     <!--Max total   -->   <!-- This should be genarated according to number of subjects   -->
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
        
       
    	
    </scetion> 
 </scetion>
</body>
</html>