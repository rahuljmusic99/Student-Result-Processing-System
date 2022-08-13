var state = false;
function toggle(){
	if(state){
		document.getElementById("password").setAttribute("type","password");
		state = false;
		var eye = document.getElementById("show-password");
		eye.classList.remove('fa-eye');
		eye.classList.add('fa-eye-slash');
	
	}else{
		document.getElementById("password").setAttribute("type","text");
		state = true;
		var eye = document.getElementById("show-password");
		eye.classList.remove('fa-eye-slash');
		eye.classList.add('fa-eye');
	}
}