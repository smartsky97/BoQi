<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath + "/front/"%>">
<title>购物车</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/bank.css">
<link href="css/publicThing.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="jquery/jquery-1.11.3.js"></script>
<script language="javascript">
	function getTime() {
		now = new Date();
		y2k = new Date("Jan 1 2016 00:60:00");
		days = (y2k - now) / 1000 / 60 / 60 / 24;
		daysRound = Math.floor(days);
		hours = (y2k - now) / 1000 / 60 / 60 - (24 * daysRound);
		hoursRound = Math.floor(hours);
		minutes = (y2k - now) / 1000 / 60 - (24 * 60 * daysRound)
				- (60 * hoursRound);
		minutesRound = Math.floor(minutes);
		seconds = (y2k - now) / 1000 - (24 * 60 * 60 * daysRound)
				- (60 * 60 * hoursRound) - (60 * minutesRound);
		secondsRound = Math.round(seconds);
		sec = (secondsRound == 1) ? " second" : " 秒.";
		min = (minutesRound == 1) ? " minute" : " 分 ";
		hours = (hoursRound == 1) ? " hours" : " 小时 ";
		document.getElementById('limittime').innerHTML = "剩余时间: " + hoursRound + hours + minutesRound + min + secondsRound + sec;
		newtime = window.setTimeout("getTime();", 1000);
	}

	function fukuan() {
		$(".allbanks").css("display", "none");
		$(".next").css("display", "none");
		$("#yincang").css("display", "block");
		$(".nextone").css("display", "block");
	};
	
	function online() {
		$(".allbanks").css("display", "block");
		$(".next").css("display", "block");
		$("#yincang").css("display", "none");
		$(".nextone").css("display", "none");
	};
	
	function yuepay(){
		var paypwds=$(".mima").val();
		var paypwdtrue=$(".paypwd").val();
		var ordersum=$(".ordersum").html();
		var orderid=$(".orderid").val();
		var usid=$(".usid").val();
		var money=$(".money").val();
		if(paypwds==paypwdtrue){
			alert("密码正确！");
			if(money>parseInt(ordersum)){
				$.post("userInfo_updatemoney.action",{usid:usid,ordersum:ordersum,orderid:orderid},function(){
					window.location.href="yuemsg.jsp";				
				});
			}else{
				alert("账户余额不足");
		        window.open ("payfail.html", "newwindow", "height=250, width=350, top=300, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
			}
		}else{
			alert("密码错误！");
	        window.open ("payfail.html", "newwindow", "height=250, width=350, top=300, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
		}
	}
</script>
</head>

<body onLoad="getTime()">
	<%@include file="publicThing.jsp"%>
	<input type="hidden" value="${loginUser.uname}"/>
	<input type="hidden" class="usid" value="${loginUser.usid}"/>
	<input type="hidden" class="paypwd" name="paypwd" value="${paypwd}"/>
	<input type="hidden" class="money" name="money" value="${money}"/>
	<div id="ad-mod" style="display: none"></div>
	<div id="center">
		<div id="ctop">
			<div id="cleft">
				<img src="registerimg/logo.gif" />
			</div>
			<p class="point">>>></p>
			<div id="cright">
				<div class="red"></div>
				<div class="number">
					<ul>
						<li class="one"><span>1</span>
							<p>我的购物车</p></li>
						<li class="two"><span>2</span>
							<p>核对订单信息</p></li>
						<li class="three"><span>3</span>
							<p>订单提交成功</p></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div id="cfoot">
			<!--  <span style="float:left;margin-left:-250px;margin-top:160px;">江浙沪皖满60即免运费</span> -->
			<span style="float: right; margin-right: -350px; margin-top: 160px;"><a
				target="_blank" href="">在线支付</a></span>
			<div id="bank">
				<p class="success"><span style="font-size:19px;">订单提交成功，请您尽快付款！</span><span style="float:right;margin-right:10px;">应付金额：<span style="font-size:20px;color:red" name="ordersum" class="ordersum">${ordersum}</span></span></p>
				<p><span style="color:red;">请于24小时内完成付款，<span style="color:black;">若逾期未付款，订单将被取消，需要重新下单！剩余时间：</span><span  id="limittime" style="color:red;"></span>
				</p>
				<div id="banks">
				<form action="ordercontent_payment.action" method="post">
				<input type="hidden" name="method" value="payment"/>
				<input type="hidden" class="orderid" value="${orderid}"/>
					<table style="width:80%;height:400px;margin:0 auto;">
						<tr>
							<td><input type="radio" name="select" class="linebank" onClick="online()"/>请您选择在线支付银行</td>
							<td><input type="radio" name="select" class="yue" onClick="fukuan()"/>使用账户余额付款</td>
						</tr>
						<tr class="allbanks">
							<td><INPUT TYPE="radio" name="yh" value="BOC-NET-B2C" checked="checked"/><img
								name="BOC-NET-B2C" src="bank_img/bc.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="ABC-NET-B2C" checked="checked"/><img
								name="ABC-NET-B2C" src="bank_img/abc.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="BOCO-NET-B2C" checked="checked"/><img
								name="BOCO-NET-B2C" src="bank_img/bcc.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="ICBC-NET-B2C" checked="checked"/><img
								name="ICBC-NET-B2C" src="bank_img/gongshang.bmp" /></td>
						</tr>
						<tr class="allbanks">
							<td><INPUT TYPE="radio" name="yh" value="CBHB-NET-B2C" checked="checked"/><img
								name="CBHB-NET-B2C" src="bank_img/bh.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="BCCB-NET-B2C" checked="checked"/><img
								name="BCCB-NET-B2C" src="bank_img/bj.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="CCB-NET-B2C" checked="checked"/><img
								name="CCB-NET-B2C" src="bank_img/ccb.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="CIB-NET-B2C" checked="checked"/><img
								name="CIB-NET-B2C" src="bank_img/cib.bmp" /></td>
						</tr>
						<tr class="allbanks">
							<td><INPUT TYPE="radio" name="yh" value="CMBCHINA-NET-B2C" checked="checked"><img
								name="CMBCHINA-NET-B2C" src="bank_img/cmb.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="CMBC-NET-B2C" checked="checked"><img
								name="CMBC-NET-B2C" src="bank_img/cmbc.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="HKBEA-NET-B2C" checked="checked"><img
								name="HKBEA-NET-B2C" src="bank_img/dy.bmp" /></td>
							<td><INPUT TYPE="radio" name="yh" value="GDB-NET-B2C" checked="checked"><img
								name="GDB-NET-B2C" src="bank_img/gf.bmp" /></td>
						</tr>
						<tr>
							<td><br /></td>
						</tr>
						<tr>
							<td><input type="submit" value="下一步" class="next"></td>
						</tr>
					</table>
				</form>
				</div>
				<div id="yincang">
					<p>请输入您的支付密码</p>
					<input type="text" name="paypwd" class="mima"/>
					<input type="button" value="下一步" class="nextone" onClick="yuepay()">
				</div>
			</div>
		</div>
	</div>
	<div id="foot">
		<div id="footer-auto">
			<div id="footer-bot">
				<span id="footer-link"> <a href="#" target="_blank"
					onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">关于波奇</a>
					<span>|</span> <a href="#" target="_blank"
					onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">友情链接</a>
					<span>|</span> <a href="#" target="_blank"
					onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">诚聘英才</a>
					<span>|</span> <a href="#" target="_blank"
					onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">联系我们</a>
					<span>|</span> <a href="#" target="_blank"
					onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">网站地图</a>
					<span>|</span> <a href="#" target="_blank"
					onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">意见反馈</a>
					<span>|</span> <a href="#" target="_blank"
					onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">帮助中心</a>
					<span>|</span> <span>客服热线：400-820-6098</span>

				</span> <span id="copy"> <span>Copyright 2007-2015 Boqii.com
						All Rights Reserved 光橙（上海）信息科技有限公司 版权所有</span> <a href="#"
					target="_blank" onmouseover="addUnderline(this)"
					onmouseout="reUnderline(this)">沪ICP备13034501号-2</a> <span>增值电信业务经营许可证：</span>
					<a href="#" target="_blank" onmouseover="addUnderline(this)"
					onmouseout="reUnderline(this)">沪B2-20140120</a>
				</span> <span id="footimg"> <a href="#" target="_blank"> <img
						width="100" height="35" src="registerimg/foot_gs.png">
				</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="registerimg/foot_kx.png">
				</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="registerimg/foot_zx.png">
				</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="registerimg/foot_cx.png">
				</a>
				</span>
			</div>
		</div>
		
</body>
</html>
