<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%session.setAttribute("LoginUser", "StudentLogin"); %> 
   
<% 
	if((request.getSession(false).getAttribute("student")!=null) )
	{
%> 
<jsp:forward page="/staffdashboard.jsp"></jsp:forward>
<%} %> 

<!DOCTYPE html5>
<html>
    <head>
        <title>SRPS</title>
        <link rel="stylesheet" href="css/studentlogin.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
     </head>
    <body>
        <section class="header"> 
            <div class="maindiv2">
                <a href="home.jsp"><div class="divback"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;&nbsp;<span style="color: blue;font-size: 24px"></span>Back</div></a>
               <h1>Login as <span style="color: blue">Student</span></h1> 
                
                
                <form name="studentLoginForm" action="LoginServlet" method="post" class="login1" onsubmit="return validate();">
                    <label class="lable">Reg.no<br></label>
                    <i class="fa fa-user-o"></i>
                    <input name="username" class="field1" type="text" placeholder="Register number"><br><br>
                    <label class="lable">password<br></label>
                    <i class="fa fa-lock" aria-hidden="true"></i>
                    <input name="password" class="field2" type="password" placeholder="password"><br><br>
                    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
         										: request.getAttribute("errMessage")%></span><br/>
                    <input type="submit" value="Login" class="btn"/>
                </form>
                </div>   
            <section class="header2">
                <div class="title"><p><b>Canara exam manager</b></p></div>
                <div class="leftdiv"><img class="edu" src="css/images/education.png" ></div>
           </section>
            </section>   
            
    		
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script type="text/javascript">

            	
            	function validate(){
            		
            		var username = document.studentLoginForm.username.value; 
	                var password = document.studentLoginForm.password.value;
	           
	                
	                if(username == null || username == ""){
            			swal("Sorry","please enter username","warning");
            			return false;
            		}
            		else if(password == null || password == ""){
            			swal("Sorry","please enter password","warning");
            			return false;
            		}
            		
            	}
            	
            
            </script>  
    </body>
</html>