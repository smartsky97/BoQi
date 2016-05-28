function changeUname(){
	var text1=document.getElementById('text1').value;
	var tips=document.getElementById('login_tip');
	var reg=/^\w{1,}$/;
	if(!reg.test(text1)){
		tips.style.display='block';
		tips.innerHTML='用户名不能为空!!!!';	
	}else{
		tips.style.display='none';	
	}
	
}

function changePwd(){
	var text2=document.getElementById('text2').value;
	var tips=document.getElementById('login_tip');
	var reg=/^\w{1,}$/;
	if(!reg.test(text2)){
		tips.style.display='block';	
		tips.innerHTML='密码不能为空!!!!';
	}else{
		tips.style.display='none';	
	}
	
}
function userLogin(){
	var uname=$.trim($("#text1").val());
	var pwd=$.trim($("#text2").val());
	
	$.post("../userServlet?d="+new Date(),{op:"userLogin",uname:uname,pwd:pwd},function(data){
		if(parseInt($.trim(data))){
			alert("用户名或密码错误...");
		}else{
			window.location.href=data;
		} 
	});
}
function changeColor(obj){
	obj.style.color='#F30';
}
function reColor(obj){
	obj.style.color='#999';
}
function addUnderline(obj){
	obj.style.textDecoration='underline';
}
function reUnderline(obj){
	obj.style.textDecoration='none';
}