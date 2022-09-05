<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html5>
<html>
	<head>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<meta charset="UTF-8">
		<title>Insert title here</title>
<%
	String insertionMessage = "" ;
	insertionMessage = (String) request.getAttribute("insertionMessage");
	
	System.out.println(insertionMessage);
	
	String deletionMessage = "" ;
	deletionMessage = (String) request.getAttribute("deletionMessage");
	
	String updateMessage = "";
	updateMessage = (String) request.getAttribute("updateMessage");
	
	String user = "";
	user = (String) session.getAttribute("user");
	
	String url = "";
	if(user == "admin"){
		url = "admindashboard.jsp";
	}else if(user == "staff"){
		url = "staffdashboard.jsp";
	}
	
if(insertionMessage != null){ 
	if(insertionMessage == "SUCCESS"){
%>		
	<script type="text/javascript">
	
		window.onload=function changeBackground() {
		   document.body.style.background = 'blue';
		   successMessage();
		}
	
	</script>	
	
	<script type="text/javascript">
		function successMessage(){
			
			swal({title: "Success",
				 text: "Inserted Data Successfully",
				 icon: "success",
				 buttons: {
					 ok: "OK",
				 },	 
			})
			.then((value) => {	
				if(value == "ok"){
					document.location.href="<%=url%>";
				}else{
					document.location.href="<%=url%>";
				}
			});
		}
	</script>
<% 

	}else{
%>	
	<script type="text/javascript">
	
		window.onload=function changeBackground() {
		   document.body.style.background = 'red';
		   errorMessage();
		}
	
	</script>	
	
	<script type="text/javascript">
		function errorMessage(){
			
			swal({title: "Sorry",
				 text: "<%=insertionMessage%>",
				 icon: "error",
				 buttons: {
					 ok: "OK",
				 },	 
			})
			.then((value) => {	
				if(value == "ok"){
					document.location.href="<%=url%>";
				}else{
					document.location.href="<%=url%>";
				}
			});
		}
	</script>
	
<%		
	}
}else if(deletionMessage != null){
	if(deletionMessage == "DELETESUCCESS"){
%>		
	<script type="text/javascript">
	
		window.onload=function changeBackground() {
		   document.body.style.background = 'blue';
		   successMessage();
		}
	
	</script>	
	
	<script type="text/javascript">
		function successMessage(){
			
			swal({title: "Success",
				 text: "Deleted Data Successfully",
				 icon: "success",
				 buttons: {
					 ok: "OK",
				 },	 
			})
			.then((value) => {	
				if(value == "ok"){
					document.location.href="<%=url%>";
				}else{
					document.location.href="<%=url%>";
				}
			});
		}
	</script>
<% 

	}else{
%>	
	<script type="text/javascript">
	
		window.onload=function changeBackground() {
		   document.body.style.background = 'red';
		   errorMessage();
		}
	
	</script>	
	
	<script type="text/javascript">
		function errorMessage(){
			
			swal({title: "Sorry",
				 text: "<%=deletionMessage%>",
				 icon: "error",
				 buttons: {
					 ok: "OK",
				 },	 
			})
			.then((value) => {	
				if(value == "ok"){
					document.location.href="<%=url%>";
				}else{
					document.location.href="<%=url%>";
				}
			});
		}
	</script>
	
<%		
	}
}else if(updateMessage != null){
	if(updateMessage == "SUCCESSUPDATE"){
%>		
	<script type="text/javascript">
	
		window.onload=function changeBackground() {
		   document.body.style.background = 'blue';
		   successMessage();
		}
	
	</script>	
	
	<script type="text/javascript">
		function successMessage(){
			
			swal({title: "Success",
				 text: "Updated Data Successfully",
				 icon: "success",
				 buttons: {
					 ok: "OK",
				 },	 
			})
			.then((value) => {	
				if(value == "ok"){
					document.location.href="<%=url%>";
				}else{
					document.location.href="<%=url%>";
				}
			});
		}
	</script>
<% 

	}else{
%>	
	<script type="text/javascript">
	
		window.onload=function changeBackground() {
		   document.body.style.background = 'red';
		   errorMessage();
		}
	
	</script>	
	
	<script type="text/javascript">
		function errorMessage(){
			
			swal({title: "Sorry",
				 text: "<%=updateMessage%>",
				 icon: "error",
				 buttons: {
					 ok: "OK",
				 },	 
			})
			.then((value) => {	
				if(value == "ok"){
					document.location.href="<%=url%>";
				}else{
					document.location.href="<%=url%>";
				}
			});
		}
	</script>
	
<%		
	}
}	
	
%>
	</head>
	
<body>

</body>
</html>