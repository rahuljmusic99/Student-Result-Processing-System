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
					document.location.href="admindashboard.jsp";
				}else{
					document.location.href="admindashboard.jsp";
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
					document.location.href="admindashboard.jsp";
				}else{
					document.location.href="admindashboard.jsp";
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
					document.location.href="admindashboard.jsp";
				}else{
					document.location.href="admindashboard.jsp";
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
					document.location.href="admindashboard.jsp";
				}else{
					document.location.href="admindashboard.jsp";
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