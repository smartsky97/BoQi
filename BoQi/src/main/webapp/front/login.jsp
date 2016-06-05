<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="/BoQi/front/">
<meta charset="utf-8">
<title>波奇商城---登录</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery/jquery-1.11.3.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>

<body>
	<div id="login-content">
		<div id="login-auto">
			<div id="header">
				<a href="#"> <img src="shoppingimg/logo.gif" width="190px"
					height="88px" />
				</a> <span>用户登录</span>
			</div>
			<div id="login-body">
				<form id="login-form" method="post" action="userInfo_login.action">
					<div id="form-left">
						<a href="#"> <img src="shoppingimg/loginlogo.jpg" />
						</a>
					</div>
					<div id="form-right">
						<div class="login-list">
							<img src="shoppingimg/login-user.png"> 
							<input id="text1" placeholder="请输入用户名/手机号/邮箱" type="text" 
								onblur="changeUname()" name="uname" value="kk"/>
						</div>
						<div class="login-list">
							<img src="shoppingimg/login-pwd.png"> <input id="text2"
								type="password" onblur="changePwd()" name="registerpwd" value="a"/>
						</div>


						<div id="login_tip" style="display: none"></div>
						<div id="login-text">
							<label> <input type="checkbox" /> 自动登录
							</label> <a id="login-text-a1" href="" onmouseover="changeColor(this)"
								onmouseout="reColor(this)">忘记密码</a> | <a id="login-text-a2"
								href="" onmouseover="changeColor(this)"
								onmouseout="reColor(this)">免费注册</a>

						</div>
						<div id="login-button">
							<input id="a_login" type="submit" class="input-button" value="登录"/>
						</div>
						<div id="other_body">
							<div id="other_text">
								<span>使用合作网站账号登录</span>
							</div>
							<div id="other">
								<a id="other-a1" href="#" onmouseover="changeColor(this)"
									onmouseout="reColor(this)">支付宝</a> | <a href="#"
									onmouseover="changeColor(this)" onmouseout="reColor(this)">新浪微博</a>
								| <a href="#" onmouseover="changeColor(this)"
									onmouseout="reColor(this)">QQ</a> | <a href="#"
									onmouseover="changeColor(this)" onmouseout="reColor(this)">微信</a>
							</div>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="footer-auto">
			<div id="footer-bot">
				<p id="footer-link">
					<a href="#" target="_blank" onmouseover="addUnderline(this)"
						onmouseout="reUnderline(this)">关于波奇</a> <span>|</span> <a href="#"
						target="_blank" onmouseover="addUnderline(this)"
						onmouseout="reUnderline(this)">友情链接</a> <span>|</span> <a href="#"
						target="_blank" onmouseover="addUnderline(this)"
						onmouseout="reUnderline(this)">诚聘英才</a> <span>|</span> <a href="#"
						target="_blank" onmouseover="addUnderline(this)"
						onmouseout="reUnderline(this)">联系我们</a> <span>|</span> <a href="#"
						target="_blank" onmouseover="addUnderline(this)"
						onmouseout="reUnderline(this)">网站地图</a> <span>|</span> <a href="#"
						target="_blank" onmouseover="addUnderline(this)"
						onmouseout="reUnderline(this)">意见反馈</a> <span>|</span> <a href="#"
						target="_blank" onmouseover="addUnderline(this)"
						onmouseout="reUnderline(this)">帮助中心</a> <span>|</span> <span>客服热线：400-820-6098</span>

				</p>
				<p id="copy">
					<span>Copyright © 2007-2015 Boqii.com All Rights Reserved
						光橙（上海）信息科技有限公司 版权所有</span> <a href="#" target="_blank"
						onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪ICP备13034501号-2</a>
					<span>增值电信业务经营许可证：</span> <a href="#" target="_blank"
						onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪B2-20140120</a>
				</p>
				<p id="footimg">
					<a href="#" target="_blank"> <img width="100" height="35"
						src="shoppingimg/foot_gs.png">
					</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="shoppingimg/foot_cx.png">
					</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="shoppingimg/foot_kx.png">
					</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="shoppingimg/foot_zx.png">
					</a>
				</p>
			</div>
		</div>
	</div>

</body>
</html>
