<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	if(request.getParameter("userType") == null && request.getAttribute("userType") == null){
%> 
<jsp:forward page="/home.jsp"></jsp:forward>
<%} 
	String userType = "";
	if(request.getAttribute("userType") != null){
		userType = (String)request.getAttribute("userType");
	}
	
	String userTypeParameter = "";
	if(request.getParameter("userType") != null){
		userTypeParameter = (String)request.getParameter("userType");
	}
%> 
<!DOCTYPE html5>
<html>
    <head>
        <link rel="stylesheet" href="css/forgot.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <section class="header">
            <div class="fpdiv">
                <h3>Canara Exam Manager</h3>
                <div class="cd">
                    <div class="cd1">
                       <img src="css/images/frogotpassword.png">
                    </div>
                    <div class="cd2">
                        <div class="cd3">
                        <p>Forgot Your</p>
                        <p>Password ?</p>
                        <form action="ForgotPasswordServlet" method="post" id='forgotPasswordForm'>
                        <input placeholder="Email" type="text" id="emailInput" name="userEmail"><br/>
                        <span style="color:red;font-size:12pt;margin:6rem;"><%=(request.getAttribute("errorMessage") == null) ? ""
         										: "Invalid Email !"%></span><br/>
         				<input type="hidden" name="userData" value="<%=request.getParameter("userType") == null ? userType :request.getParameter("userType")%>"/>
                        <button class="resetbtn" type="submit">Reset Password</button>
                        <a id="userLocation">Back To Login</a>
                        <input type="hidden" id="errorMessage" value="<%=(request.getAttribute("errorMessage") == null) ? ""
         										:request.getAttribute("errorMessage")%>"/>
         										
         				<input type="hidden" id="loc" value="<%=userType%>"/>
         				<input type="hidden" id="loc2" value="<%=userTypeParameter%>"/>
                        <script type="text/javascript">
                        	const forgotPasswordForm =  document.getElementById("forgotPasswordForm");
                        	const userEmail = document.getElementById("emailInput");
                        	forgotPasswordForm.addEventListener('submit',(e)=>{
                        		
                        		var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                        		
            	                if(userEmail.value == null || userEmail.value == ""){
            	                	Swal.fire(
            	                			  'Sorry',
            	                			  'Please Enter Email Address',
            	                			  'error'
            	                			)
            	        			e.preventDefault();
            	                	
            	        		}else if(email.test(userEmail.value) == false){
                        			Swal.fire(
          	                			  'Invalid Email !',
          	                			  'Please Enter a valid Email address Format',
          	                			  'error'
          	                			)
          	        				e.preventDefault();
                        			
                        		}
                        	});
                        	
                        	window.onload = function(){
                        		
                        		var errorMessage = document.getElementById("errorMessage").value;
                        		var userType = document.getElementById("loc").value;
                        		var userTypeParameter = document.getElementById("loc2").value;
                        		
                        		if(errorMessage != ""){
                        			Swal.fire(
          	                			  'Invalid Email !',
          	                			   errorMessage,
          	                			  'error'
          	                			);
                        		}
                        		
                        		if(userTypeParameter !== ""){
                        			if(userTypeParameter == "student"){
                        				document.getElementById("userLocation").setAttribute("href","studentlogin.jsp");
                        			
                        			}else if(userTypeParameter == "staff"){
                        				document.getElementById("userLocation").setAttribute("href","stafflogin.jsp");
                        			
                        			}else if(userTypeParameter == "admin"){
                        				document.getElementById("userLocation").setAttribute("href","adminlogin.jsp");
                        			
                        			}
                        			
                        		}else if(userType !== ""){
                        			if(userType == "student"){
                        				document.getElementById("userLocation").setAttribute("href","studentlogin.jsp");
                        			
                        			}else if(userType == "staff"){
                        				document.getElementById("userLocation").setAttribute("href","stafflogin.jsp");
                        			
                        			}else if(userType == "admin"){
                        				document.getElementById("userLocation").setAttribute("href","adminlogin.jsp");
                        			
                        			}
                        		}
                        	}
                        </script>
                      	
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
