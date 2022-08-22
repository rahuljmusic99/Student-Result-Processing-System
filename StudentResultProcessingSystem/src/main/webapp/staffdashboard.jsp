<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.CanaraExamManager.util.DBConnection" %>
<%@page import="org.CanaraExamManager.dao.LoadDataDao" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
    
<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	//In case, if User session is not set, redirect to Login page.
	if((request.getSession(false).getAttribute("staff")== null) )
	{
%> 
<jsp:forward page="/stafflogin.jsp"></jsp:forward>
<%} %>   

<%request.getAttribute("username");%>

<%
	LoadDataDao loadData = new LoadDataDao(); 
	ResultSet programmeResultSet = loadData.loadProgrammeData();
	 
%>

<!DOCTYPE html5>
<html>
    <head>
        <title>Staff Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/staffdashboard.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/dashboard.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://kit.fontawesome.com/dd03fdb332.js" crossorigin="anonymous"></script>
    
    </head> 
    <body>
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="css/images/education.png" class="edu"></div>
                <button class="tabs__button" data-for-tab="4" id="mainprofile">
                <div class="holder3"></div>
                </button>
                <button class="tabs__button tabs__button--active" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-bullseye"></i>Classes</button>
                <button class="tabs__button" data-for-tab="3" ><i class="fa fa-bar-chart"></i>Student Result</button>
                <button onclick="logoutConfirm();" class="tabs__button"><i class="fa fa-power-off"></i>Logout</button>
            </div>
    
            
            
            <div class="tabs__content" data-tab="1">
                <div class="protab2">
                   <div class="imgholder"> <img src="css/images/canlogos.png" class="logos"></div>
                    <div class="cardholder">
                    <div class="cards"><span style="color:steelblue;"><p class="head1">TOTAL INTERNAL RESULT</p></span><p class="values">12345</p><div class="icon2"><img src="css/images/blackboard.png" class="im"></div></div>
                    <div class="cards"><span style="color:purple;"><p class="head1">TOTAL INTERNAL</p></span><p class="values">12</p><div class="icon2"><img src="css/images/programme.png" class="im"></div></div>
                    <div class="cards"><span style="color:orange;"><p class="head1">TOTAL COURSE</p></span><p class="values">12</p><div class="icon2"><img src="css/images/course.png" class="im"></div></div>
                    <div class="cards"><span style="color:red;"><p class="head1">TOTAL CLASS</p></span><p class="values">12</p><div class="icon2"><img src="css/images/class.png" class="im"></div></div>
                    </div>
                    <div class="cardholder2">
                    <div class="cards2"><span style="color:steelblue;"><p class="head2">STUDENTS</p></span><p class="values2">12</p><div class="icon3"><img src="css/images/graduated.png" class="ims"></div></div>
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
            
            
            
            
            <div class="tabs__content" data-tab="2">
                 <div class="protab"> 
                    <button class="refresh" id="ref" onclick="myFunction()">Refresh page</button>
                    <h4>Class Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Class list</h6>
                        <select class="select3"><option value="" disabled selected hidden>Programme</option></select>
                        </div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
                            <th>Programme Name</th>
                            <th>Class Name</th>
                            <th>Class Year</th>
                        </tr>
                        <tr>
                            <td class="td1"></td>   
                            <td class="td2"></td>   
                            <td class="td5"></td>
                        </tr>
                    </table>
                    </div>
                </div>
                </div>   
           
            
            
            
            
            
            
            
            
            
            
            
            <div class="tabs__content" data-tab="3">
            <div class="protab"> 
            <button class="refresh" id="ref" onclick="">Refresh page</button>
            <h4>Student Result Management</h4>
            <div class="inner__protab">
            <div class="inner1"><h6 class="left">Student Result</h6>
            <select class="select2">
            <option value="" disabled selected hidden>Class</option>
            <option>  </option>
            </select>
            <select class="select2"><option value="" disabled selected hidden>Programme</option>
            <option>  </option>      
            </select>
            </div>
            
            
            
            
            <form action="ResultServlet" method="post" id="semesterForm">
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="">
            	         <input name="studentName" type="hidden" value=""/>
            	         <input name="programmeName" type="hidden" value=""/>
			</form>
			<form action="InternalServlet" method="post" id=internalForm>
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="">
            	         <input name="studentName" type="hidden" value=""/>
            	         <input name="programmeName" type="hidden" value=""/>
			</form>   
            <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
            <tr>
                <th>Programme</th>
                <th>Class</th>
                <th>Student Name</th>
                <th>Register Number</th>
                <th>Add Result</th>
                <th>View Result</th>
                <th>Action</th>
            </tr>   
            <%
            
            	try{
            		
					ResultSet studentData = loadData.loadResulData();	
            		
					if(studentData!=null){
						int i = 1;
                		while(studentData.next()){
                			
            %>	       
           <tr>
              <td class="td1"><%=studentData.getString("programme_name")%></td>   <!--Programme -->
              <td class="td2"><%=studentData.getString("class_name")%></td>   <!--class-->
              <td><%=studentData.getString("first_name") +" "+ studentData.getString("last_name")%></td>   <!--Student Name-->
              <td><%=studentData.getString("reg_no")%></td>   <!--Register number-->
              <td class="td1"><button class="btn__course" id="btn__course<%=i%>" onclick="myFunction4()"><span style="font-size: 16px;">+</span> Add</button></td>  <!--Add Result-->
              <td class="td2"><button class="btn__edit" id="btn-edit<%=i%>" onclick="viewResult<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Result</button></td> <!--View Result-->
              <td class="td3"><div class="circle1" title="Edit Result" id="circle1" onclick="myFunction6()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Result" id="circle2" onclick="myFunction7()"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
            </tr>
            
            
			<script type="text/javascript">
            		
	            	document.getElementById("btn-edit<%=i%>");
	            	function viewResult<%=i%>(){
	            	    document.querySelector('.bg-model2').style.display = 'flex';
                        document.querySelector('.bg-model2').style.position = 'fixed';
	            	    document.forms['semesterForm']['userName'].value = "<%=studentData.getString("reg_no")%>";
	            	    document.forms['internalForm']['userName'].value = "<%=studentData.getString("reg_no")%>";
	            	    document.forms['semesterForm']['studentName'].value = "<%=studentData.getString("first_name") +" "+studentData.getString("last_name")%>";
	            	    document.forms['internalForm']['studentName'].value = "<%=studentData.getString("first_name") +" "+studentData.getString("last_name")%>";
	            	    document.forms['semesterForm']['programmeName'].value = "<%=studentData.getString("programme_name")%>";
	            	    document.forms['internalForm']['programmeName'].value = "<%=studentData.getString("programme_name")%>";
	            	    
	            	    table = document.getElementById('viewResultTable');
	            	    
	            	    var rowCount = table.rows.length -1;
	            	    
	            	    if(rowCount < <%=studentData.getInt("semester")%>){
	            	    	var createRow =  <%=studentData.getInt("semester")%> - rowCount;
	            	    	for(let i= 1;i <= createRow; i++){
		            	    	
		            	    	var tr = document.createElement('tr');
		            	    	tr.setAttribute('class','pop-row');
		            	    	var td = document.createElement('td');
		            	    	var div = document.createElement('div');
		            	    	div.setAttribute('class','pop-div');
		            	    	var div2 = document.createElement('div');
		            	    	div2.setAttribute('class','pop-inner');
		            	    	div2.setAttribute('id','div'+i);
		            	    	div2.setAttribute('onclick','callResultServlet'+i+'()');
		            	    	div2.textContent = "Semester "+(rowCount + i);	
		            	    	
		            	    	div.appendChild(div2);
		            	    	td.appendChild(div);
		            	    	tr.appendChild(td);
		            	    	table.appendChild(tr);
		            	    	
		            	    	var tdI = document.createElement('td');
		            	    	var divI = document.createElement('div');
		            	    	divI.setAttribute('class','pop-div');
		            	    	var divI2 = document.createElement('div');
		            	    	divI2.setAttribute('class','pop-inner');
		            	    	divI2.setAttribute('id','div'+i);
		            	    	divI2.setAttribute('onclick','callInternalServlet'+i+'()');
		            	    	divI2.textContent = "Semester "+(rowCount + i);
		            	    	
		            	    	divI.appendChild(divI2);
		            	    	tdI.appendChild(divI);
		            	    	tr.appendChild(tdI);	
		            	  
		            	    }
	            	    }
	            	    
	            	    
	            	    if(rowCount > <%=studentData.getInt("semester")%>){
	            	    	var createRow =  rowCount - <%=studentData.getInt("semester")%>;
	            	    	for(let i= 1;i <= createRow; i++){
	            	    		table.deleteRow(-1);
	            	    	}
	            	    }
	            	}
            	</script>
			<% 		
				i = i + 1;
                	}	
                }	
               	}catch(SQLException e){}
            
            %>   
              
            </table>
            </div>
            </div>
                <div class="bg-model2">
                <div class="model-content2">
                <div class="close2" id="close" >+</div>
                <div class="header2">
                <h1>View Student Result </h1></div>
                    
                <form action="">
                <table border="1" class="tb3" id="viewResultTable">
                  <tr>
                     <th>Semester</th>
                     <th>Internals</th>
                  </tr>  
                </table>
                </form>
                </div>
                </div>
                
                <div class="bg-model3">
                    <div class="model-content3">
                    <div class="close3" id="close" >+</div>
                    <div class="header3">
                      <h1>Edit Internal Results</h1></div>
                        <form action="">
                            <table border="1" class="tb3">
                              <tr>
                                <th>Internals</th>
                              </tr>
                                
                               <tr class="pop-row">
                                   <td><div class="pop-div"><div class="pop-inner2">Semester </div></div></td>
                                </tr> 
                                    
                            </table> 
                        </form>
                    </div>
                </div>
                 
                <div class="bg-model4">
                    <div class="model-content4">
                        <div class="close4" id="close" >+</div>
                        <div class="header4">
                            <h1>Delete Internal Results</h1></div>
                            <form action="">
                                <table border="1" class="tb3">
                                    <tr>
                                    <th>Internals</th>
                                    </tr>
                                    
                                    <tr class="pop-row">
                                        <td><div class="pop-div"><div class="pop-inner">Semester1 (internal1)</div></div></td>
                                        <td><div class="pop-div"><div class="pop-inner">Semester1 (internal2)</div></div></td>
                                    </tr>  
                                    
                                </table>
                        </form>
                    </div>
                </div>
           </div> 
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
                
        
     	<%
                   
                   	int maxSem = 1;
                   	try{
	                   
	                    Connection con = DBConnection.createConnection();;
	 					Statement statement = con.createStatement();
	 					ResultSet programmeSem = statement.executeQuery(""
	 						+"SELECT programme_sem from programme "
	 						+"WHERE programme_sem = (SELECT MAX(programme_sem)FROM programme)LIMIT 1");	
	             		
	 					if(programmeSem!=null){
	                 		while(programmeSem.next()){
								maxSem = programmeSem.getInt("programme_sem");
								
	                 		}
	 					}
                   	}catch(SQLException e){
                   		e.printStackTrace();
                   	}
                   		for(int i = 1 ;i <= maxSem; i++){
				%>         
                    
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
        
        
         <form action="ResultServlet" method="get" id="semesterForm">
            	<input name="semester" id="semester" value="1" type="hidden" />
            	<input name="userName" type="hidden" value=<%=request.getSession(false).getAttribute("staff")%>>
         </form>
        
        <script type="text/javascript">
            let image = document.getElementById("image");
            let images = ['css/images/can1.jpg','css/images/can2.jpg','css/images/can3.jpg','css/images/can4.jpg','css/images/can5.jpg','css/images/can6.jpg','css/images/can7.jpg']
            setInterval(function(){
                let random = Math.floor(Math.random()*7);
                image.src = images[random];
            },2500);
        </script> 
        
        <script>
            document.getElementById("btn-edit1");
            function myFunction5(){
                document.querySelector('.bg-model2').style.display = 'flex';
                document.querySelector('.bg-model2').style.position = 'fixed'
            }
        
        </script>
        
        <script>
            document.querySelector('.close2').addEventListener('click', function(){
                document.querySelector('.bg-model2').style.display = 'none';
            })
        
        
        </script>
        
        <script>
            document.getElementById("circle1");
            function myFunction6(){
                document.querySelector('.bg-model3').style.display = 'flex';
                document.querySelector('.bg-model3').style.position = 'fixed'
            }
        
        </script>
        
        <script>
            document.querySelector('.close3').addEventListener('click', function(){
                document.querySelector('.bg-model3').style.display = 'none';
            })
        
        
        </script>
        
        
        <script>
            document.getElementById("circle2");
            function myFunction7(){
                document.querySelector('.bg-model4').style.display = 'flex';
                document.querySelector('.bg-model4').style.position = 'fixed'
            }
        
        </script>
        
        <script>
            document.querySelector('.close4').addEventListener('click', function(){
                document.querySelector('.bg-model4').style.display = 'none';
            })
        </script>
    </body>
</html>