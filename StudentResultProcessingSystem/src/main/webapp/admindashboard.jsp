<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.CanaraExamManager.util.DBConnection" %>
<%@page import="org.CanaraExamManager.dao.LoadDataDao" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>

<% 
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	//In case, if User session is not set, redirect to Login page.
	if((request.getSession(false).getAttribute("admin")== null) )
	{
%> 
<jsp:forward page="/adminlogin.jsp"></jsp:forward>
<%}%>

<%
	LoadDataDao loadData = new LoadDataDao(); 
	ResultSet programmeResultSet = loadData.loadProgrammeData();

%>

    
<!DOCTYPE html5>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/admindashbord.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/dashboard.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/popup.js"></script>
    </head> 
    <body>
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="css/images/education.png" class="edu"></div>
                <div class="space2"><i class="fa fa-angle-left"></i></div>
                <button class="tabs__button" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-graduation-cap"></i>Users</button>
                <button class="tabs__button" data-for-tab="3"><i class="fa fa-bar-chart" id="button3"></i>Programme and courses</button>
                <button class="tabs__button" data-for-tab="4"><i class="fa fa-bar-chart"></i>classes</button>
                <button class="tabs__button" data-for-tab="5"><i class="fa fa-bullseye"></i>Student Result</button>
                <button class="tabs__button" onclick="logoutConfirm();" ><i class="fa fa-power-off"></i>Logout</button>
            </div>
        
            
            
            <div class="tabs__content" data-tab="1">
                <h2>Canara College Mangalore</h2><br>
                <img  src="" id="image">
                <h3>About Canara College</h3><br>
                
                <p class="about">
                 Canara College with its noble vision to prepare educationally strong and culturally vibrant students is a prestigious institute for higher learning, well acclaimed to have its deep rooted existence since 1973 with its moral ideals, rich core values and fusion of cultural ethos; pioneered by a great legendary soul, Late Sri Ammembal Subba Rao Pai. It has a glorious history and legacy in the field of imparting value-based, character building education to its aspirants. True to its motto of “Educating for Righteous Life” and philosophy of commitment towards offering quality education at affordable cost, it is located centrally in the coastal educational hub of Mangaluru city. The institution is governed and managed by Canara High School Association, Mangaluru, reaccredited by NAAC and affiliated to Mangalore University.<br><br><br>

                  It offers undergraduate programmes in Commerce (B.Com.), Bachelor of Commerce Professoinal with Coaching for CA and CS, Bachelor of Science [B.Sc. (PCM, PMC and BZC)], Bachelor of Computer Applications (B.C.A.), Bachelor of Business Administration (B.B.A.) and a post graduate programme in Commerce (M.Com.).
                </p> 
            </div>
            
            
            
            
            
            <div class="tabs__content" data-tab="2">
                <h1>Users</h1>
            </div>
            
            
            
            
            
            
            <div class="tabs__content" data-tab="3">
                <div class="protab"> 
                    <button class="refresh" id="refProgramme" onclick="refreshProgramme();">Refresh page</button>
                    <h4>Programme Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1"><h6>Programme list</h6><div id="add" class="add" title="Add programme" onclick="myFunction1()"></div><i class="fa fa-plus" aria-hidden="true" title="Add programme"></i></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr class="tb2">
                            <th>Programme Name</th>
                            <th>Semester</th>
                            <th>Courses (subjects)</th>
                            <th>Add Course<br>(subject)</th>
                            <th>Edit Course<br>(subject)</th>
                            <th>Action</th>
                        </tr>
                        
                        <%
                        	try{
                        		if(programmeResultSet!=null){
                        			while(programmeResultSet.next()){
                        	
                        				for(int i=1; i<= programmeResultSet.getInt("programme_sem"); i++){
                        					
                        					Connection con = DBConnection.createConnection();;
                        					Statement statement = con.createStatement();
                        					ResultSet coursesData = statement.executeQuery(""
                        						+"SELECT * FROM course where course_sem = "+Integer.toString(i)+"");
                        					String coursesString = "";
                        %>
                        <tr>
							<td class="td1"><%=programmeResultSet.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=Integer.toString(i)%></td>   <!--Semester-->
                            
                            <%try{
                            	if(coursesData!=null){
                            		
                            		while(coursesData.next()){
                        				
                            			coursesString = coursesString +",  "+ coursesData.getString("course_name");	
                             		}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%>  
                            <td><%=coursesString%></td>   <!--Course-->


							<td class="td1"><button class="btn__course" id="btn__course" onclick="myFunction3()"><span style="font-size: 16px;">+</span> Course</button></td>  <!--add course-->
                            <td class="td2"><button class="btn__edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Edit</button></td> <!--Edit course-->
                            <td class="td3"><div class="circle1" title="Edit Programme"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Programme"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                        
                        <%
                        				}
								
                        			}
                        		}
                        	}catch(SQLException e){
                        		e.printStackTrace();
                        		
                        	}	
                           
                        %>
                    </table>
                    </div>
                </div>
                     
                <div class="bg-model">
                    <div class="model-content">
                        <div class="close" id="close" onclick="myFuction()2">+</div>
                        <div class="header">
                            <h1>Add Programme Data</h1></div>
                            <form action="">
                                <input type="text" placeholder="Programme Id">
                                <input type="text" placeholder="Programme Name">
                                <input type="text" placeholder="Duration(In Years)">
                                <input type="text" placeholder="Total Semester">
                                <button id="button" >ADD</button>
                            
                        </form>
                    </div>
                </div>
                
                
                <div class="bg-model1">
                    <div class="model-content1">
                        <div class="close1" id="close" >+</div>
                        <div class="header1">
                            <h1>Add Course Data</h1></div>
                            <form action="">
                                <select >
                                <option value="" disabled selected hidden>Select Programme</option>
                                <option>Bca</option>
                                <option>Bcom</option>
                                <option>BBA</option>
                                </select>
                                <input type="text" placeholder="Course Code">
                                <input type="text" placeholder="Course Name">
                                <select >
                                <option value="" disabled selected hidden>Type</option>
                                <option>Bca</option>
                                <option>Bcom</option>
                                <option>BBA</option>
                                </select>
                                <input type="text" placeholder="Max marks">
                                <input type="text" placeholder="Min Marks">
                                <input type="text" placeholder="Max Internal Assesment Marks">
                                <button id="button1" >ADD</button>
                          </form>
                    </div>
                </div>          
            </div>
            
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
             <div class="tabs__content" data-tab="4">
                <h1>classes</h1>
            </div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
            
            
            <div class="tabs__content" data-tab="5">
            <div class="protab"> 
            <button class="refresh" id="ref" onclick="">Refresh page</button>
            <h4>Student Result Management</h4>
            <div class="inner__protab">
            <div class="inner1"><h6>Student Result</h6>
            <select class="select2">
            <option value="" disabled selected hidden>Class</option>
            <option>  </option>
            </select>
            <select class="select2"><option value="" disabled selected hidden>Programme</option>
            <option>  </option>      
            </select>
            </div>
                
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
                        
           <tr>
              <td class="td1"></td>   <!--Programme -->
              <td class="td2"></td>   <!--class-->
              <td></td>   <!--Student Name-->
              <td></td>   <!--Register number-->
              <td class="td1"><button class="btn__course" id="btn__course1" onclick="myFunction4()"><span style="font-size: 16px;">+</span> Add</button></td>  <!--Add Result-->
              <td class="td2"><button class="btn__edit" id="btn-edit1" onclick="myFunction5()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Result</button></td> <!--View Result-->
              <td class="td3"><div class="circle1" title="Edit Result" id="circle1" onclick="myFunction6()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Result" id="circle2" onclick="myFunction7()"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
            </tr>
            </table>
            </div>
            
            </div>
                <div class="bg-model2">
                <div class="model-content2">
                <div class="close2" id="close" >+</div>
                <div class="header2">
                <h1>View Student Result </h1></div>
                    
                <form action="">
                <table border="1" class="tb3">
                  <tr>
                     <th>Semester</th>
                     <th>Internals</th>
                  </tr>
                                    
                                    
                    <tr class="pop-row">
                        <td><div class="pop-div"><div class="pop-inner">Semester1</div></div></td>
                        <td><div class="pop-div"><div class="pop-inner">Semester1</div></div></td>
                    </tr>
                </table>
                </form>
                </div>
                </div>
                
                <div class="bg-model3">
                    <div class="model-content3">
                    <div class="close3" id="close" >+</div>
                    <div class="header3">
                      <h1>Edit Student Results</h1></div>
                        <form action="">
                            <table border="1" class="tb3">
                              <tr>
                                <th>Semester</th>
                              </tr>
                                    
                               <tr class="pop-row">
                                   <td><div class="pop-div"><div class="pop-inner2">Semester1</div></div></td>
                                </tr>      
                            </table> 
                        </form>
                    </div>
                </div>
                 
                <div class="bg-model4">
                    <div class="model-content4">
                        <div class="close4" id="close" >+</div>
                        <div class="header4">
                            <h1>Delete Student Results</h1></div>
                            <form action="">
                                <table border="1" class="tb3">
                                    <tr>
                                    <th>Semester</th>
                                    </tr>
                                    
                                    <tr class="pop-row">
                                        <td><div class="pop-div"><div class="pop-inner2">Semester1</div></div></td>
                                    </tr>  
                                    
                                </table>
                        </form>
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
                
                <script>
                    document.querySelector('.close').addEventListener('click', function(){
                        document.querySelector('.bg-model').style.display = 'none';
                     });
                </script>
                
                <script>
                    document.querySelector('.close1').addEventListener('click', function(){
                        document.querySelector('.bg-model1').style.display = 'none';
                    });
                </script>
                
                <script>
                    document.querySelector('.close2').addEventListener('click', function(){
                        document.querySelector('.bg-model2').style.display = 'none';
                    })
                </script>
                
                <script>
                    document.querySelector('.close3').addEventListener('click', function(){
                        document.querySelector('.bg-model3').style.display = 'none';
                    })
                </script>
                
                <script>
                    document.querySelector('.close4').addEventListener('click', function(){
                        document.querySelector('.bg-model4').style.display = 'none';
                    })
                
                </script>
                  
    </body>
</html>
    
    
