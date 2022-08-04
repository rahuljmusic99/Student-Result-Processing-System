<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html5>
<html>
    <head>
        <title>CanaraExamManager</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
     </head>
    <body>
        <section class="header">
            <div class="maindiv">
               <h1>Select Login User</h1> 
                <div class="row">
                <div class="column" id="column1" onclick="myFunction1()"><img src="css/images/student.png"><br><b>Student</b></div>
                <div class="column" id="column2" onclick="myFunction2()"><img src="css/images/staff.png">&nbsp;<br><b>Staff</b></div>
                <div class="column" id="column3" onclick="myFunction3()"><img src="css/images/admin1.png">&nbsp;<br><b>Admin</b></div>
                </div>
                </div>
            
            <script>
                document.getElementById("column1");
                function myFunction1(){
                    window.location.href="studentlogin.jsp";
                }
            </script>
            
            <script>
                document.getElementById("column2");
                function myFunction2(){
                    window.location.href="stafflogin.jsp";
                }
            </script>
            
            <script>
                document.getElementById("column3");
                function myFunction3(){
                    window.location.href="adminlogin.jsp";
                }
            </script>
            
            <section class="header2">
                <div class="title"><p><b>Canara exam manager</b></p></div>
                <div class="leftdiv"><img class="edu" src="css/images/education.png" ></div>
           </section>
        </section>
    </body>
</html>