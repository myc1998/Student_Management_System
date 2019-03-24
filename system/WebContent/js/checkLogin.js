function checkLogin(){
		var number = document.getElementById("number").value;
		var password = document.getElementById("password").value;
		if(number == ""){
			alert("学生编号不能为空！！");
			return false;
		}
		if(password == ""){
			alert("密码不能为空！！");
			return false;
		}
		
		return true;
	}