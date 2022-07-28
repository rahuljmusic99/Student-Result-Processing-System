<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	//In case, if User session is not set, redirect to Login page.
	if((request.getSession(false).getAttribute("student")== null) )
	{
%> 
<jsp:forward page="/studentlogin.jsp"></jsp:forward>
<%} %>    

<%request.getAttribute("username");%>
     
<!DOCTYPE html5>
<html>
    <head>
        <title>Student dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/studdashboard.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/tabsgenerator.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
    </head> 
    <body onload="setupTabs()">
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="css/images/education.png" class="edu"></div>
                <div class="space2"><i class="fa fa-angle-left"></i></div>
                <button class="tabs__button" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-bullseye"></i>Result</button>
                <button class="tabs__button" data-for-tab="3"><i class="fa fa-bar-chart"></i>Performance</button>
                <button onclick="logoutConfirm();" class="tabs__button"><i class="fa fa-power-off"></i>Logout</button>
            </div>
        
            
            
            <div class="tabs__content" data-tab="1">
                <h2>Canara College Mangalore</h2><br>
                <img  src="" id="image">
                <h3>About Canara College</h3><br>
                
                <p class="about">
                 Canara College with its noble vision to prepare educationally strong and culturally vibrant students is a prestigious institute for higher learning, well acclaimed to have its deep rooted existence since 1973 with its moral ideals, rich core values and fusion of cultural ethos; pioneered by a great legendary soul, Late Sri Ammembal Subba Rao Pai. It has a glorious history and legacy in the field of imparting value-based, character building education to its aspirants. True to its motto of âEducating for Righteous Lifeâ and philosophy of commitment towards offering quality education at affordable cost, it is located centrally in the coastal educational hub of Mangaluru city. The institution is governed and managed by Canara High School Association, Mangaluru, reaccredited by NAAC and affiliated to Mangalore University.<br><br><br>

                  It offers undergraduate programmes in Commerce (B.Com.), Bachelor of Commerce Professoinal with Coaching for CA and CS, Bachelor of Science [B.Sc. (PCM, PMC and BZC)], Bachelor of Computer Applications (B.C.A.), Bachelor of Business Administration (B.B.A.) and a post graduate programme in Commerce (M.Com.).
                </p> 
            </div>
            
            <div class="tabs__content" data-tab="2">
                <div class="space3">
                <div onclick="callServlet1()" id="div1" class="space4">semester 1</div>
                <div onclick="callServlet2()" id="div2" class="space4">semester 2</div>
                <div onclick="callServlet3()" id="div3" class="space4">semester 3</div>
                <div onclick="callServlet4()" id="div4" class="space4">semester 4</div>
                <div onclick="callServlet5()" id="div5" class="space4">semester 5</div>
                <div onclick="callServlet6()" id="div6" class="space4">semester 6</div>
                </div> 
            </div>
            
            
            <div class="tabs__content" data-tab="3">
            
            
            <form action="ResultServlet" method="get" id="semesterForm">
            	<input name="semester" id="semester" value="1" type="hidden" />
            	<input name="userName" type="hidden" value=<%=request.getSession(false).getAttribute("student") %>>
            </form>
                
             <script type="text/javascript">
             
             	let image = document.getElementById("image");
             	let images = ['css/images/can1.jpg','css/images/can2.jpg','css/images/can3.jpg','css/images/can4.jpg','css/images/can5.jpg','css/images/can6.jpg','css/images/can7.jpg']
             	setInterval(function(){
                 	let random = Math.floor(Math.random()*7);
                 	image.src = images[random];  
             	},2500);
             
             </script>
                
                
            </div>
        </div>
     
    </body>
</html>    