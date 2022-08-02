<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    </head> 
    <body>
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="css/images/education.png" class="edu"></div>
                <div class="space2"><i class="fa fa-angle-left"></i></div>
                <button class="tabs__button" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-graduation-cap"></i>Users</button>
                <button class="tabs__button" data-for-tab="3"><i class="fa fa-bar-chart"></i>Programme and courses</button>
                <button class="tabs__button" data-for-tab="4"><i class="fa fa-bar-chart"></i>classes</button>
                <button class="tabs__button" data-for-tab="5"><i class="fa fa-bullseye"></i>Update Results</button>
                <button class="tabs__button" data-for-tab="6"><i class="fa fa-bullseye"></i>Student Result</button>
                
                
                <button class="tabs__button"><i class="fa fa-power-off"></i>Logout</button>
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
                    <h4>Programme Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1"><h6>Programme list</h6><div class="add"></div><i class="fa fa-plus" aria-hidden="true"></i></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr class="tb2">
                            <th>Programme Name</th>
                            <th>Semester</th>
                            <th>Course(subject)</th>
                            <th>Add Course<br>(subject)</th>
                            <th>Edit Course<br>(subject)</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <td></td>   <!--Programme name-->
                            <td></td>   <!--Semseter-->
                            <td></td>   <!--Course-->
                            <td class="td1"><button class="btn__course"><span style="font-size: 16px;">+</span> Course</button></td>  <!--add course-->
                            <td class="td2"><button class="btn__edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Edit</button></td> <!--Edit course-->
                            <td class="td3"><div class="circle1"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                    </table>
                    </div>
                </div>
            </div>
            
             <div class="tabs__content" data-tab="4">
                <h1>classes</h1>
            </div>
            
            
            <div class="tabs__content" data-tab="5">
                <h1>update result</h1>
            </div>
            
            
            <div class="tabs__content" data-tab="6">
                <div class="space3">
                <div class="space4">semester 1</div>
                <div class="space4">semester 2</div>
                <div class="space4">semester 3</div>
                <div class="space4">semester 4</div>
                <div class="space4">semester 5</div>
                <div class="space4">semester 6</div>
                </div>
                <div class="space5">
                    <div class="space6">Semester 1</div>
                    <div class="space6">Semester 2</div>
                    <div class="space6">Semester 3</div>
                    <div class="space6">Semester 4</div>
                    <div class="space6">Semester 5</div>
                    <div class="space6">Semester 6</div> 
                </div>  
            </div>
        </div>
        
        <script type="text/javascript">
            let image = document.getElementById("image");
            let images = ['images/can1.jpg','images/can2.jpg','images/can3.jpg','images/can4.jpg','images/can5.jpg','images/can6.jpg','images/can7.jpg']
            setInterval(function(){
                let random = Math.floor(Math.random()*7);
                image.src = images[random];
                
                
            },2500);
        </script>
    </body>
</html>
    
    
