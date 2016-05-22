<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="easyui/css/logins.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="easyui/js/index.js"></script>
	<script type="text/javascript" src="js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="js/showpic.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/demo.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/index.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/OrderContnet.css">
	
	<link href="easyui/css/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
  </head>
  
  <body>
    <div class="login-aside">
        <div id="o-box-up"></div>
        <div id="o-box-down"  style="table-layout:fixed;">
            <div class="error-box"></div>
            
            <form class="registerform"action="demo/ajax_post.jsp">
                <div class="fm-item">
                    <label for="logonId" class="form-label">波奇系统登陆：</label>
                    <input type="text"  placeholder="请输入账号" maxlength="20" id="username" class="i-text" ajaxurl="demo/valid.jsp"  datatype="s6-18" errormsg="用户名至少6个字符,最多18个字符！"  >    
                </div>
                    
                <div class="fm-item">
                    <label for="logonId" class="form-label">登陆密码：</label>
                    <input type="password" placeholder="请输入密码" maxlength="20" id="password" class="i-text" datatype="*6-20" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！">    
                    <div class="ui-form-explain"></div>
                </div>
                    
                <div class="fm-item pos-r">
                    <label for="logonId" class="form-label">验证码：</label>
                    <input type="text" placeholder="输入验证码" maxlength="4" id="yzm" class="i-text yzm" nullmsg="请输入验证码！" >    
                    <div class="ui-form-explain"><img src="back/valiCodeImg.jsp" onclick="change(this)" class="yzm-img" /></div>
                </div>
                    
                <div class="fm-item">
                    <input type="button" value="登录" onclick="adminlogin()"  id="login" class="login"> 
                </div>
                
            </form>
        </div>
    </div>
  </body>
</html>
<script>
	//点击切换图片
	function change(obj){
		var timenow=new Date().getTime();
		obj.src="back/valiCodeImg.jsp?d="+timenow;
	}
	//后台登录
	function adminlogin(){
		var uname = $.trim($("#username").val());
		var pwd = $.trim($("#password").val());
		var cc = $.trim($("#yzm").val());//获取输入的验证码
	
		$.post("adminServlet",{op:"Adminlogin",cc:cc,uname:uname,pwd:pwd},function(data){
			if(parseInt($.trim(data))==2){
				alert("验证码有误！");
			}else if(parseInt($.trim(data))==0){
				alert("用户名或密码错误！"+parseInt($.trim(data)))
			}else{
				window.location.href="back/index.jsp";
			}
		});
	}
</script>