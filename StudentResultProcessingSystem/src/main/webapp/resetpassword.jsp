<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getSession(false).getAttribute("otpStatus")==null && request.getAttribute("passwordStatus")==null){
%>	
<jsp:forward page="/home.jsp"></jsp:forward>			
<% }
	
	String message = "";
	String userType = "";
	if(request.getAttribute("passwordStatus") != null && request.getAttribute("userType") != null){
		message = (String)request.getAttribute("passwordStatus");
		userType = (String)request.getAttribute("userType");
	}
	
	String userTypeSession = "";
	if(request.getSession(false).getAttribute("userType") != null){
		userTypeSession = (String)session.getAttribute("userType");
	}
%>
<!DOCTYPE html5>
<html>
    <head>
        <link rel="stylesheet" href="css/passwordconfirm.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <section class="header">
            <div class="fpdiv">
                <h3>Canara Exam Manager</h3>
                <div class="cd">
                    <div class="cd1">
                       <img src="css/images/changepassword.png">
                    </div>
                    <div class="cd2">
                        <div class="cd3">
                        <p>Reset Password</p>
                        <label>New Password</label>
                        <form id="resetPasswordForm" action="ResetPassword" method="post">
                        <input id="newPassword" type=password>
                        <label>Confirm Password</label>
                        <input name="newPassword" id="confirmPassword" type=password >
                        <button class="resetbtn" type="submit">Reset Password</button>
                        <script type="text/javascript">
                        	const resetPasswordForm = document.getElementById("resetPasswordForm");
                        	const newPassword = document.getElementById("newPassword");
                        	const confirmPassword = document.getElementById("confirmPassword");
                        	
                        	resetPasswordForm.addEventListener('submit', (e)=>{
                        		
                        		var password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]*$/;
                        		
                        		if(password.test(newPassword.value) == false){
                        			Swal.fire(
          	                			  'Invalid Password !',
          	                			  'Password must contain at least one uppercase letter, one lowercase letter, one number and one special character',
          	                			  'error'
          	                			);
          	        				e.preventDefault();	
                        			
                        		}else if(newPassword.value.length < 8){
                        			Swal.fire(
            	                			  'Invalid Password !',
            	                			  'Password must contain at least 8 Characters',
            	                			  'error'
            	                			);
            	        			e.preventDefault();	
                        			
                        		}else if(newPassword.value.length > 25){
                        			Swal.fire(
          	                			  'Invalid Password !',
          	                			  'Password must contain at least 25 Characters',
          	                			  'error'
          	                			);
          	        				e.preventDefault();	
                        			
                        		}else if(newPassword.value !== confirmPassword.value){
                       				Swal.fire(
           	                			  'Passwords Do Not Match !',
           	                			  'The password you entered in Confirm Password does not match New Password',
           	                			  'error'
           	                			);
           	        				e.preventDefault();	
                        			
                        		}
                        	});
                        </script>
                        </form>
                        <a id="userLocation">Back To Login</a>
                        <input id="messageInput" type="hidden" value="<%=message%>"/>
                        <input id="loc" type="hidden" value="<%=userType%>"/>
                        <input id="loc2" type="hidden" value="<%=userTypeSession%>"/>
                        <script type="text/javascript">
                        	window.onload = function(){
                        		var message = document.getElementById("messageInput").value;
                            	var userType = document.getElementById("loc").value;
                            	var userTypeSession = document.getElementById("loc2").value;
                            	
                            	if(message !== "" && userType !== ""){
                            		
                            		if(message == "SUCCESS"){
                            			Swal.fire({
                            				  icon: 'success',
                            				  title: 'Success',
                            				  text:'You Password has been Updated Successfully',
                            				  confirmButtonText: 'OK',
                            				}).then((result) => {
                            				  if (result.isConfirmed) {
                            					  if(userType == "student"){
                            						  document.getElementById("userLocation").setAttribute("href","studentlogin.jsp");
                            						  window.location = "studentlogin.jsp";
                            					  }else if(userType == "staff"){
                            						  document.getElementById("userLocation").setAttribute("href","stafflogin.jsp");
                            						  window.location = "stafflogin.jsp";
                            					  }else if(userType == "admin"){
                            						  window.location = "stafflogin.jsp";
                            					  }
                            					
                            				  }else{
                            					  if(userType == "student"){
                            						  document.getElementById("userLocation").setAttribute("href","studentlogin.jsp");
                            						  window.location = "studentlogin.jsp";
                            					  }else if(userType == "staff"){
                            						  document.getElementById("userLocation").setAttribute("href","stafflogin.jsp");
                            						  window.location = "stafflogin.jsp";
                            					  }else if(userType == "admin"){
                            						  document.getElementById("userLocation").setAttribute("href","adminlogin.jsp");
                            						  window.location = "stafflogin.jsp";
                            					  }
                            				  }
                            				});
                            			
                            		}else{
                            			Swal.fire('Sorry',message,'error');
                            		}
                            		
                        		}
                            	if(userTypeSession !== ""){
                        			if(userTypeSession == "student"){
              						  document.getElementById("userLocation").setAttribute("href","studentlogin.jsp");
              					  }else if(userTypeSession == "staff"){
              						document.getElementById("userLocation").setAttribute("href","stafflogin.jsp");
              					  }else if(userTypeSession == "admin"){
              						document.getElementById("userLocation").setAttribute("href","adminlogin.jsp"); 
                        		  }
                        		
                        		}
                        	}
                        	
                        </script>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
