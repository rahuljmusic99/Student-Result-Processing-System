<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%session.setAttribute("LoginUser", "StaffLogin"); %>    

<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if((request.getSession(false).getAttribute("staff")!=null) )
	{
%> 
<jsp:forward page="/staffdashboard.jsp"></jsp:forward>
<%} %> 
    
<!DOCTYPE html5>
<html>
    <head>
        <title>SRPS</title>
        <link rel="stylesheet" href="css/stafflogin.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
    	<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
     </head>
    <body>
    		
        <section class="header"> 
            <div class="maindiv2">
                <a href="home.jsp"><div class="divback"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;&nbsp;<span style="color: blue;font-size: 24px">Back</span></div></a>
               <h1>Login as <span style="color: blue">Staff</span></h1> 
                
                
                <form name="staffLoginForm" action="LoginServlet" method="post" class="login1" onsubmit="return validate();">
                    <i class="fa-solid fa-user"></i>
                    <input name="username" class="field1" type="text" placeholder="Staff ID"><br><br>
                    <i class="fa-solid fa-eye-slash" id="show-password" onclick="toggle()"></i>
                    <input id="password" name="password" class="field2" type="password" placeholder="password"><br><br>
                    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
         										: request.getAttribute("errMessage")%></span><br/>
                    <input type="submit" value="Log In" class="btn"/>
                </form>
                </div>   
            <section class="header2">
                <div class="title"><p><b>Canara Exam Manager</b></p></div>
                <div class="leftdiv"><img class="edu" src="css/images/sf.png" ></div>
           </section>
            </section>   
            
            
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script type="text/javascript">
            function validate(){
            	
        		var username = document.staffLoginForm.username.value; 
                var password = document.staffLoginForm.password.value;
           
                
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