<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getSession(false).getAttribute("otpStatus")==null){
%>	
<jsp:forward page="/home.jsp"></jsp:forward>			
<% }

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
                        <input id="confirmPassword" type=password >
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
                        <a onclick="">Back To Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
