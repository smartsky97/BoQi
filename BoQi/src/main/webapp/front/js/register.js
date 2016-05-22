// JavaScript Document


$(".picCh").hover(
	function(){
		$(".picCh").css("color","red");
	},
	function(){
		$(".picCh").css("color","black");
	}
)	


$(".uname_text").focusout(function(){
	var test=/^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
	var tt=$(".uname_text").val();
	if(test.test(tt)){
		$("#showEmail").css("display","block");
		$("#showEmail").html("");
		$("#showEmail").attr("class","showWarning2");
	}else if(tt.length<1){
		$("#showEmail").css("display","block");
		$("#showEmail").css("width","260px");
		$("#showEmail").attr("class","showWarning");
		$("#showEmail").html("请输入邮箱！");
	}else{
		$("#showEmail").css("display","block");
		$("#showEmail").css("width","260px");
		$("#showEmail").attr("class","showWarning");
		$("#showEmail").html("格式有误，请输入正确的邮箱！");
	}
});

$(".pwd_text").focusout(function(){
	var test=/^[a-z0-9_-]{6,20}$/;
	var tt=$(".pwd_text").val();
	if(test.test(tt)){
		$("#showPwd").css("display","block");
		$("#showPwd").html("");
		$("#showPwd").attr("class","showWarning2 left");
	}else if(tt.length<6){
		$("#showPwd").css("display","block");
		$("#showPwd").css("width","260px");
		$("#showPwd").attr("class","showWarning left");
		$("#showPwd").html("请输入不少于6位数密码！");
		$("#showPwd").attr("width","260px");
	}else{
		$("#showPwd").css("display","block");
		$("#showPwd").css("width","260px");
		$("#showPwd").attr("class","showWarning left");
		$("#showPwd").html("格式有误，请输入正确的密码！");
		$("#showPwd").attr("width","260px");
	}
});

$(".pwd_text2").focusout(function(){
	var test=/^[a-z0-9_-]{6,20}$/;
	var tt=$(".pwd_text2").val();
	var tt2=$(".pwd_text").val();
	if(test.test(tt)){
		if(tt==tt2){
			$("#showSure").css("display","block");
			$("#showSure").html("");
			$("#showSure").attr("class","showWarning2 left");
		}else{
			$("#showSure").css("display","block");
			$("#showSure").css("width","260px");
			$("#showSure").attr("class","showWarning left");
			$("#showSure").html("请输入相同的密码！");
			$("#showSure").attr("width","260px");
		}
	}else if(tt.length<6){
		$("#showSure").css("display","block");
		$("#showSure").css("width","260px");
		$("#showSure").attr("class","showWarning left");
		$("#showSure").html("请输入不少于6位数密码！");
		$("#showSure").attr("width","260px");
	}else{
		$("#showSure").css("display","block");
		$("#showSure").css("width","260px");
		$("#showSure").attr("class","showWarning left");
		$("#showSure").html("格式有误，请输入正确的密码！");
		$("#showSure").attr("width","260px");
	}
});

$(".sname_text").focusout(function(){
	var test=/^\S{1,10}$/;
	var tt=$(".sname_text").val();
	if(test.test(tt)){
		$("#showId").css("display","block");
		$("#showId").html("");
		$("#showId").attr("class","showWarning2 left");
	}else if(tt.length<6){
		$("#showId").css("display","block");
		$("#showId").css("width","260");
		$("#showId").attr("class","showWarning left");
		$("#showId").html("请输入昵称！");
	}else{
		$("#showId").css("display","block");
		$("#showId").attr("class","showWarning left");
		$("#showId").html("格式有误，请输入正确的昵称！");
		$("#showId").css("width","260px");
	}
});

$(".check_text").focusout(function(){
	var tt=$(".show_info2").html().toLowerCase();
	var tt2=$(".check_text").val().toLowerCase();
	alert();
	if(tt==tt2){
		$('.yanzhengtu').css("display","block");
		$('.yanzhengtu').attr("src","images/gou.png");
	}else{
		$('.yanzhengtu').css("display","block");
		$('.yanzhengtu').attr("src","images/error.png");
	}
});
var chars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c','d', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function GenerateRandomNum() {
       var res = "";
       for (var i = 0; i < 4; i++) {
            var id = Math.ceil(Math.random() * 61);
            res += chars[id];
       }
       return res;
}

function changePic(){
	$(".show_info2").html(GenerateRandomNum);
}
$(
	changePic()
);
