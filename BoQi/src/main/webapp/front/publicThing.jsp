<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="topbar">
	<div class="intopbar">
	       <div class="login right">
	           <ul>
				<c:if test="${not empty loginUser }">
		    		<li class="login"><a href="user_userInfo.action"><font color="#FF0000" size="2">当前登陆用户:${loginUser.uname }</font></a></li>&nbsp;&nbsp;
					<li class="login"><a href="javascript:loginOut()"><font color="#FF0000" size="2">[注销]</font></a></li>
		    	</c:if>
		    	<c:if test="${empty loginUser }">
				    <li class="login"><a class="plaseLogin" href="javascript:login()"><font color="#FF0000" size="2">请登录</font></a></li>&nbsp;&nbsp;
					<li class="login"><a href="register.html"><font color="#FF0000" size="2">免费注册</font></a></li>
				</c:if> 
	               <li>手机版</li>    
	               <li>关注波奇</li>    
	               <li class="index"><a target="_blank" href="index.html">波奇首页</a></li>        
	           </ul>
	       </div>
	</div>
</div>
<script>
//会员注销
function loginOut(){
	$.post("../userServlet?d="+new Date(),{op:"loginOut"},function(){
		location=location;
	});
}

function login(){
	var url = window.location.href;
	$.post("../userServlet?d="+new Date(),{op:"saveLoginUrl",url:url},function(){
		window.location.href="login.html";
	});
}
</script>