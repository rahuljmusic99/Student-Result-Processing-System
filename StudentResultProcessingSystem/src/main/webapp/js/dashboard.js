/**
 * 
 */
 
 //		JavaScript function to create tabs on the left and contents on right
            function setupTabs() {
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
                tabsContainer.querySelector(".tabs__sidebar .tabs__button--active").click();
                    
                    
                });
            });
     
 
 //		Logout confirmation code
            
            function logoutConfirm(){
    			
    			swal({title: "Confirm Logout",
    				 text: "Are you shure you want to Logout?",
    				 icon: "warning",
    				 buttons: {
    					 cancel: "Cancel",
    					 logout: "Log Out",
    				 },	 
    			})
    			.then((value) => {	
    				if(value == "logout"){
    					document.location.href="LogoutServlet";
    				}else{
						document.getElementById("tab1").click();
					}
    			});
    		}
    		
    		
//  function to call insertDataServlet
			
			

			function deleteData(uniqueId, Data){
				
				document.forms['deleteDataForm']['uniqueId'].value = uniqueId;
				document.forms['deleteDataForm']['Data'].value = Data;
				
				document.getElementById("deleteDataForm").submit();
			}			