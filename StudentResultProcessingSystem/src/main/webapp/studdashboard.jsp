<%@page import="org.apache.tomcat.websocket.BackgroundProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	//In case, if User session is not set, redirect to Login page.
	if((request.getSession(false).getAttribute("student")== null) )
	{
%> 
<jsp:forward page="/studentlogin.jsp"></jsp:forward>
<%} 
	
	float[] averageFinalMarks = (float[]) session.getAttribute("averageFinalMarks");
	float[] averageFirstInternal = (float[]) session.getAttribute("averageFirstInternal");
	float[] averageSecondInternal = (float[]) session.getAttribute("averageSecondInternal");
	
	String[] bgColor = new String[8];
	bgColor[0] = "#ff8080";
	bgColor[1] = "#EE82EE";
	bgColor[2] = "#ffff00";
	bgColor[3] = "#4dffd2";
	bgColor[4] = "#ffd24d";
	bgColor[5] = "#ff4dd2";
	bgColor[6] = "#4d79ff";
	bgColor[7] = "#ff794d";
	
	String[] borderColor = new String[8];
	borderColor[0] = "#ff6666";
	borderColor[1] = "#eb6ceb";
	borderColor[2] = "#e6e600";
	borderColor[3] = "#33ffcc";
	borderColor[4] = "#ffcc33";
	borderColor[5] = "#ff33cc";
	borderColor[6] = "#3366ff";
	borderColor[7] = "#ff6633";
%>
     
<!DOCTYPE html5>
<html>
    <head>
        <title>Student dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/studdashboard.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/dashboard.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/pdf.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
        <script src="https://kit.fontawesome.com/dd03fdb332.js" crossorigin="anonymous"></script>
    </head> 
    <body onload="setupTabs()">
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><div class="space4"><img src="css/images/sd.png" class="edu"></div><p>Canara exam manager</p></div>
                <button class="tabs__button" data-for-tab="4" id="mainprofile">
                <div class="holder3"></div>
                </button>
                <button class="tabs__button tabs__button--active" id="tab1" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-bar-chart"></i>Result</button>
                <button class="tabs__button" data-for-tab="3"><i class="fa fa-bar-chart"></i>Performance</button>
                <button onclick="logoutConfirm();" class="tabs__button"><i class="fa fa-power-off"></i>Logout</button>
            </div>
        
            
<!-----------------------------------------------------------tab1 Dashboard------------------------------------------------------------------------------->          
            <div class="tabs__content" data-tab="1">
               <div class="protab4">
                    <div class="imgholder"> <img src="css/images/canlogos.png" class="logos"></div>
                    <img  src="" id="image">
                    <div class="cardholder">
                    <div class="cards"><span style="color:steelblue;"><p class="head1">Total Backlogs</p></span><p class="values">12345</p><div class="icon2"><img src="css/images/blackboard.png" class="im"></div></div>
                    <div class="cards"><span style="color:purple;"><p class="head1">Total Results</p></span><p class="values">12</p><div class="icon2"><img src="css/images/programme.png" class="im"></div></div>
                    </div>
                    
                    <div class="about">
                    <h3>About Canara College</h3><br>
                
                    <p >
                    Canara College with its noble vision to prepare educationally strong and culturally vibrant students is a prestigious institute for higher learning, well acclaimed to have its deep rooted existence since 1973 with its moral ideals, rich core values and fusion of cultural ethos; pioneered by a great legendary soul, Late Sri Ammembal Subba Rao Pai. It has a glorious history and legacy in the field of imparting value-based, character building education to its aspirants. True to its motto of “Educating for Righteous Life” and philosophy of commitment towards offering quality education at affordable cost, it is located centrally in the coastal educational hub of Mangaluru city. The institution is governed and managed by Canara High School Association, Mangaluru, reaccredited by NAAC and affiliated to Mangalore University.<br><br><br>

                    It offers undergraduate programmes in Commerce (B.Com.), Bachelor of Commerce Professoinal with Coaching for CA and CS, Bachelor of Science [B.Sc. (PCM, PMC and BZC)], Bachelor of Computer Applications (B.C.A.), Bachelor of Business Administration (B.B.A.) and a post graduate programme in Commerce (M.Com.).
                    </p>
                    </div>
                    
                    
                    <footer>
                      <div class="foot">
                        <img src="css/images/canlogo.png" class="footlogo">
                        <div class="footpart1">
                        <h1 class="heads1">CANARA COLLEGE</h1>
                        <p class="pr2">Address:</p>
                        <p class="pr1">Mahatma Gandhi-Road Kodialbail, Mangalore-575003, Dakshina Kannada District, Karnataka</p>
                        <p class="pr1">Phone: 0824-2492366</p>
                        <p class="pr1">E-mail: <u>cnrcollege@yahoo.com</u></p>
                        <div class="web"><a href="https://www.canaracollege.com/"><div class="gb"><i class="fa-solid fa-globe"></i></div></a><a href="https://www.facebook.com/canaracollegemangaluru/"><div class="fc"><i class="fa-brands fa-facebook"></i></div></a><a href="https://www.instagram.com/canara.college_official/?hl=en">
                        <div class="ig"><i class="fa-brands fa-instagram"></i></div></a><a href="https://www.youtube.com/channel/UCtXf_eLGN1nT1dDo1-wk5yg"><div class="yt"><i class="fa-brands fa-youtube"></i></div></a></div>
                        </div>
                          
                        <div class="footpart2">
                        <h1 class="heads2">Developed By :</h1>
                        <div class="names">
                        <li class="pr1"><a href="https://github.com/rahuljmusic99"><i class="fa-brands fa-github"></i>Rahul. J</a></li>
                        <li class="pr1"><a href="https://github.com/seenuvasan2051"><i class="fa-brands fa-github"></i>Seenu Vasan</a></li>
                        <li class="pr1"><a href="https://github.com/Deeraj212"><i class="fa-brands fa-github"></i>Deeraj. S</a></li>
                        </div>
                        <h1 class="heads2">Under The Guidance of :</h1>
                        <div class="names">
                        <li class="pr1">Rakshitha. R</li>
                        
                        </div>
                        </div>
                      </div>
                   </footer>
                </div>
            </div>
            
<!---------------------------------------------------------------------------------------------------------------------------------------------->           
            
                     
                      <div class="tabs__content" data-tab="2">
                         <form action="ResultServlet" method="post" id="semesterForm">
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="<%=request.getSession(false).getAttribute("student") %>">
                         <input name="programmeName" type="hidden" value="<%=request.getSession(false).getAttribute("programme") %>">
                         <input name="studentName" type="hidden" value="<%=request.getSession(false).getAttribute("studentName") %>"/>
                         </form>
                         <form action="InternalServlet" method="post" id=internalForm>
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value=<%=request.getSession(false).getAttribute("student") %>>
                         <input name="programmeName" type="hidden" value="<%=request.getSession(false).getAttribute("programme	") %>">
                         <input name="studentName" type="hidden" value="<%=request.getSession(false).getAttribute("studentName") %>"/>
                         </form>
                          
                          
                    <div class="divmarks">
                    <div class="innermarks">
                        
                        <table class="tb2" border="1" cellspacing="0" padding="10" rules="all">
                            <tr class="head2">
                                <th>Semester Marks</th>
                                <th>Internal Marks</th>
                            </tr>
                            
                            
                            <%  
			                	String semesterString = (String) session.getAttribute("semester"); 
			                	int semesterInt = Integer.parseInt(semesterString);
			                    
			                	int i;
			                	for(i=1; i <= semesterInt ;i++){
                			%>
                				<tr >
                                <td class="make"><div class="marks1"><div class="innerdiv" onclick="callResultServlet<%=Integer.toString(i)%>()" id="div<%=Integer.toString(i)%>">Semester <%=Integer.toString(i)%></div></div></td>
                            	<td class="make"><div class="marks2"><div class="innerdiv2" onclick="callInternalServlet<%=Integer.toString(i)%>()" id="div<%=Integer.toString(i)%>">Semester <%=Integer.toString(i)%></div></div></td>
                            	
                            	<script type="text/javascript">
	                            	document.getElementById("div<%=i%>");
	                    		    
	                            	function callResultServlet<%=i%>(){
	                    						
	                    				document.forms['semesterForm']['semester'].value = "<%=i%>";
	                    			    document.getElementById("semesterForm").submit();
	                    				
	                    				
	                    			}
                            	</script>
                            	
                            	<script type="text/javascript">
	                            	document.getElementById("div<%=i%>");
	                    		    
	                            	function callInternalServlet<%=i%>(){
	                    						
	                    				document.forms['internalForm']['semester'].value = "<%=i%>";
	                    			    document.getElementById("internalForm").submit();
	                    				
	                    				
	                    			}
                            	</script>
                            
                            <%} %>    
                            
                            
                            </tr>
                        </table>
                    </div>
                </div> 
             </div>
       
       
<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------ -->     
<!-- ------------------------------------------------------ TAB 3 Performance --------------------------------------------------------------------------------------- -->                              

           	<div class="tabs__content" data-tab="3">
                <div class="protab2">
				<div class="chartholder1">
                  <canvas id="semesterChart" ></canvas> 
	            </div>
                </div>
                
               <div class="protab3">
               <div class="chartholder2">
                <canvas id="semesterChart2" ></canvas> 
	           </div>
               </div>
                  <input type="hidden" id="semesters" value="<%=semesterInt%>" />
	            </div>	
	            	            	

				<script type="text/javascript">
				
	    		  var semesterCanvas = document.getElementById("semesterChart").getContext("2d");
	    		  var semesterChart = new Chart(semesterCanvas,{
	    		  	type: "bar",
	    		  	data:{
	    		  		
	    		  		labels:[
	    		  			<%for(int j = 0; j < averageFinalMarks.length;j++){
	    		  				%>
	    		  				<%="'"+"Semester "+(j+1)+"',"%>
	    		  				<%}%>
	    		  		],
	    		  		datasets: [{
	    		  			label : "Semester Average Marks",
	    		  			data: [
	    		  				<%for(int j = 0; j < averageFinalMarks.length;j++){
	    		  				%>
	    		  				<%=averageFinalMarks[j]+","%>
	    		  				<%}%>
	    		  				],
								backgroundColor: [
									<%for(int j = 0; j < averageFinalMarks.length;j++){
			    		  				%>
			    		  				<%="'"+bgColor[j]+"',"%>
			    		  				<%}%>
								],
	    		  				borderColor: [
	    		  					<%for(int j = 0; j < averageFinalMarks.length;j++){
	    	    		  				%>
	    	    		  				<%="'"+borderColor[j]+"',"%>
	    	    		  				<%}%>
	    		  				],
	    		  				borderWidth: 3,
	    		  		},],
	    		  	},
	    		  	options: {
	    		        plugins: {
	    		            title: {
	    		                display: true,
	    		                text: 'Semester Performance',
	    		                padding: {
	    		                    top: 0,
	    		                    bottom: 0
	    		                }
	    		            }
	    		        }
	    		    },
	    		  });
	    		  
    		  </script>
                
                
                <script type="text/javascript">
	    		  var semesterCanvas = document.getElementById("semesterChart2").getContext("2d");
	    		  var semesterChart = new Chart(semesterCanvas,{
	    		  	type: "bar",
	    		  	data:{
	    		  		labels:[<%for(int j = 0; j < averageFirstInternal.length;j++){
    		  				%>
    		  				<%="'"+"Semester "+(j+1)+"',"%>
    		  				<%}%>],
	    		  		datasets: [{
    		  				label : "First Internal Average Marks",
	    		  			data: [
	    		  				<%for(int j = 0; j < averageFinalMarks.length;j++){
		    		  				%>
		    		  				<%=averageFirstInternal[j]+","%>
		    		  				<%}%>
	    		  			],
                            backgroundColor: [
                            	<%for(int j = 0; j < averageFinalMarks.length;j++){
		    		  				%>
		    		  				<%="'"+bgColor[j]+"',"%>
		    		  				<%}%>
                            ],
	    		  				borderColor: [
	    		  					<%for(int j = 0; j < averageFinalMarks.length;j++){
	    	    		  				%>
	    	    		  				<%="'"+borderColor[j]+"',"%>
	    	    		  				<%}%>
	    		  				],
	    		  				borderWidth: 3,
	    		  		},
	    		  		{
    		  				label : "Second Internal Average Marks",
	    		  			data: [
	    		  				<%for(int j = 0; j < averageSecondInternal.length;j++){
		    		  				%>
		    		  				<%=averageSecondInternal[j]+","%>
		    		  				<%}%>
	    		  			],
                            backgroundColor: [
                            	<%for(int j = 7; j > averageFinalMarks.length;j--){
		    		  				%>
		    		  				<%="'"+bgColor[j]+"',"%>
		    		  				<%}%>
                            ],
	    		  				borderColor:[
	    		  					<%for(int j = 7; j > averageFinalMarks.length;j--){
	    	    		  				%>
	    	    		  				<%="'"+borderColor[j]+"',"%>
	    	    		  				<%}%>
	    		  				],
	    		  				borderWidth: 3,
	    		  		},],
	    		  	},
	    		  });
    		  </script>
    		      
                          
<!-----------------------------------------------------------Profile----------------------------------------------------------------------------->                         
                          
            <div class="tabs__content" data-tab="4">
            <div class="protab1">
                <div class="inner__protab1">
                    <div class="inner2"><h6 class="left">Profile</h6></div>
                    
                    <div class="holder">
                    <div class="holder2">
                    <img src="" class="innerimg">
                    </div>
                    <p class="name">Deeraj</p>
                    </div>
                    <div class="inputs">
                        <label>Name</label>
                        <input class="int" type="text" readonly>
                        <label>Phone</label>
                        <input class="int" readonly>
                        <label>Email</label>
                        <input class="int" type="email" readonly>
                        <label>Password</label>
                        <div class="i"><i class="fa fa-grav"></i></div>
                        <input class="int" type="password" readonly>
                        <button class="cp">Change Password</button>
                    </div>
     
                </div>
             </div>
          </div>
                
        </div>
    
              <script type="text/javascript">
             	let image = document.getElementById("image");
             	let images = ['css/images/can1.jpg','css/images/can2.jpg','css/images/can3.jpg','css/images/can4.jpg','css/images/can5.jpg','css/images/can6.jpg','css/images/can7.jpg']
             	setInterval(function(){
                 	let random = Math.floor(Math.random()*7);
                 	image.src = images[random];  
             	},2500);
             </script>           
     
    </body>
</html>    