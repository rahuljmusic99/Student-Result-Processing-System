 
<!DOCTYPE html5>
<html>
    <head>
        <title>Student dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/studdashboard.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        
    </head> 
    <body>
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="images/education.png" class="edu"></div>
                <div class="space2"><i class="fa fa-angle-left"></i></div>
                <button class="tabs__button" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-bullseye"></i>Result</button>
                <button class="tabs__button" data-for-tab="3"  id="perform" onclick="myFunction()"><i class="fa fa-bar-chart"></i>Performance</button>
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
                <div class="space3">
                <div class="space4">semester 1</div>
                <div class="space4">semester 2</div>
                <div class="space4">semester 3</div>
                <div class="space4">semester 4</div>
                <div class="space4">semester 5</div>
                <div class="space4">semester 6</div>
                </div> 
            </div>
            
            
            <div class="tabs__content" data-tab="3">
               
                
                
                
            </div>
        </div>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    
        
        
        <script>
            function setupTabs () {
                document.querySelectorAll(".tabs__button").forEach(button => {
                    
                    button.addEventListener("click", () => {
                        
                       const sideBar = button.parentElement;
                       const tabsContainer = sideBar.parentElement;
                       const tabNumber = button.dataset.forTab;
                       const tabToActivate =tabsContainer.querySelector(`.tabs__content[data-tab ="${tabNumber}"]`);
                        
                        sideBar.querySelectorAll(".tabs__button").forEach(button => { 
                            button.classList.remove("tabs__button--active");
                            
                        });
                        
                        
                        
                        tabsContainer.querySelectorAll(".tabs__content").forEach(tab => { 
                            tab.classList.remove("tabs__content--active");
                            
                        });
                        
                        button.classList.add("tabs__button--active");
                        tabToActivate.classList.add("tabs__content--active");
                        
                    });
                    
                });
                                                                    
             }
            
            document.addEventListener("DOMContentLoaded", () => {
                setupTabs();
                
                
                document.querySelectorAll(".tabs").forEach(tabsContainer =>{
                    tabsContainer.querySelector(".tabs__sidebar .tabs__button").click();
                    
                    
                });
            });
        </script>
        
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