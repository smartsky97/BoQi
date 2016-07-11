<%@ page  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link href="css/baike1.css" rel="stylesheet"/>
<link href="css/userInfo.css" rel="stylesheet"/>
<link rel="shortcut icon" href="indeximg/head11.jpg">
<link href="js/login.js" rel="stylesheet" type="text/javascript"/>
<link rel="stylesheet" href="css/mysearchstyle.css" type="text/css" />

<script type="text/javascript" src="js/adddate.js" ></script> 

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/Popt.js"></script>
<script src="js/cityJson.js"></script>
<script src="js/citySet.js"></script>

<script type="text/javascript">
var timeout= 500;
var closetimer= 0;
var ddmenuitem= 0;
function mopen(id)
{	
	mcancelclosetime();
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';
}
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}
document.onclick = mclose; 


function mopen1(id)
{	
	mcancelclosetime();
	if(ddmenuitem) ddmenuitem.style.display = 'none';
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.display = 'block';
}
function mclose1()
{
	if(ddmenuitem) ddmenuitem.style.display = 'none';
}
function mclosetime1()
{
	closetimer = window.setTimeout(mclose1, 0);
}
function mcancelclosetime1()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}




</script>
</head>

<body>
<div id="topnav">
	<ul>
    	<li><a href="#">波奇网</a></li><li><a href="#">波奇商城</a></li><li><a href="#">波奇服务</a></li><li><a href="#">波奇论坛</a></li><li id="baike"><a href="#">宠物百科</a></li><li id="userName">上午好,${sessionScope.grzyUserInfo[0].uname }</li><li id="exit"><a href="#">退出</a></li><li id="weibo1"><a href="#"><img src="baike_dogimg/weibo.jpg" id="weibologo">微博</a></li><li id="weixin1"><a href="#"><img src="baike_dogimg/weixin.jpg" id="weixinlogo"/>微信</a></li><li><a href="#"><img src="baike_dogimg/shouji.jpg" id="phonelogo"/>手机版</a></li>
    </ul>
</div>

<style>
#userInfo_nav{
	float:left;
	width:100%;
	height:90px;
	display:block;
	background-color:#F05030;
	background-image:url(baike_dogimg/header_bg.png)
}

.boqilogo{
	width:164px;
	height:90px;
	background:url(baike_dogimg/sprites.png) no-repeat;
	float:left;
	margin-left:20%;
}
.myboqi{
	float:left;
	padding-left:80px;
	margin-top:35px;
	display:block;
	z-index:9;
}
#nav_content .myboqi a{
	font-size:16px;
	width:64px;
	height:36px;
	color:#FFF;
	font-weight:bolder;
}
.mysets{
	float:left;
	width:120px;
	margin-left:60px;
	margin-top:25px;
	display:block;
	padding-right:22px;
	z-index:9;
}

#nav_content .mysets .mysets_a{
	display:block;
	width:88px;
	color:#FFF;
	font-weight:bolder;
	padding-top:10px;
	padding-left:10px;
	padding-bottom:10px;
	padding-right:10px;
}
.mytids{
	float:left;
	width:120px;
	margin-left:40px;
	margin-top:25px;
	display:block;
	padding-right:22px;
	z-index:9;
}

#nav_content .mytids .mytids_a{
	display:block;
	width:88px;
	color:#FFF;
	font-weight:bolder;
	padding-top:10px;
	padding-left:10px;
	padding-bottom:10px;
	padding-right:10px;
}
.icon_tip{
	width:20px;
	height:30px;
	float:right;
	background:url(baike_dogimg/sprites.png) no-repeat;
	background-position:-339px 0; 
	margin-top:-5px;

}
.icon_tip1{
	width:20px;
	height:30px;
	float:right;
	background:url(baike_dogimg/sprites.png) no-repeat;
	background-position:-145px -186px; 
	margin-top:-30px;
}
.icon_tip2{
	width:20px;
	height:30px;
	background:url(baike_dogimg/sprites.png) no-repeat;
	background-position:-145px -186px; 
	margin-top:-30px;
}


.sets_down{
	position:relative;
	z-index:99;
	width:108px;
	display:block;
	margin-top:-38px;
	background:#FFF;
	border-bottom:1px solid #999;
	border-left:1px solid #999;
	border-right:1px solid #999;
	border-top:1px solid #999;
}

#set1 .mysets_a_1{
	font-size:16px;
	display:block;
	font-weight:bolder;
	padding-top:5px;
	padding-left:10px;
	padding-bottom:10px;
	padding-right:10px;
	background-color:#FFF;
	color:#F05030;
}
#set1 a{
	width:88px;
	color:#000;
	display:block;
	line-height:30px;
	font-size:14px;
}
#set1 a:hover{
	color:#F05030;
}

.tids_down{
	position:relative;
	z-index:99;
	width:108px;
	display:block;
	margin-top:-40px;
	background:#FFF;
	border-bottom:1px solid #999;
	border-left:1px solid #999;
	border-right:1px solid #999;
	border-top:1px solid #999;
}

#tid1 .mytids_a_1{
	font-size:16px;
	display:block;
	width:98px;
	font-weight:bolder;
	padding-left:10px;
	padding-top:5px;
	padding-bottom:10px;
	background-color:#FFF;
	color:#F05030;
}
#tid1 a{
	width:88px;
	color:#000;
	display:block;
	line-height:30px;
	font-size:14px;
}
#tid1 a:hover{
	color:#F05030;
}
</style>


<div id="userInfo_nav">
	<a href="#" class="boqilogo"></a>
    <ul id="nav_content">
    	<li class="myboqi"><a href="#" id="wodeboqiclick">我的波奇</a></li>
        <li class="mysets"><a href="#" class="mysets_a" onmouseover="mopen1('set1')" onmouseout="mclosetime1()">个人设置<div class="icon_tip"></div></a>
        	<div id="set1" class="sets_down" style="display:none;" onmouseover="mcancelclosetime1()" onmouseout="mclosetime1()">
				<a href="#" class="mysets_a_1">个人设置<div class="icon_tip1"></div></a>
            	<a href="#">个人资料</a>
                <a href="#">安全设置</a>
                <a href="#">收货地址</a>
            </div>
        </li>
        <li class="mytids"><a class="mytids_a" href="#" onmouseover="mopen1('tid1')" onmouseout="mclosetime1()">消息<div class="icon_tip" style="margin-right:30px;"></div></a>
        <div id="tid1" class="tids_down" style="display:none" onmouseover="mcancelclosetime1()" onmouseout="mclosetime1()">
		  <a href="#" class="mytids_a_1">消息<div class="icon_tip2"></div></a>
          <a href="#">咨询服务</a>
          <a href="#">系统通知</a>
          <a href="#">私信</a>
        </div>
        </li>
    </ul>
   
</div>
<style>
	#body_content{
		height:1100px;	
		background:#F6F3F3;
	}
	#body_content .left_list{
		float:left;
		height:1100px;
		margin-top:30px;
		margin-left:15%;
	}
	#body_content .left_list dl dt{
		font-size:16px;
		font-weight:bolder;
		margin-top:15px;
	}
	#body_content .left_list dl dd{
		margin-top:10px;
		font-size:14px;
	}
	#body_content .left_list dl dd a{
		text-align:none;
		color:#666;
	}
	#body_content .left_list dl dd a:hover{
		color:#F05030;
	}
</style>

<div id="body_content">
	<div class="left_list">
		<dl>
			<dt>交易管理</dt>
			<dd><a href="" id="shangchengclick" class="huifu">商城订单</a></dd>
			<dd><a href="" id="fuwuclick" class="huifu">服务订单</a></dd>
			<dd><a href="" id="daohuotongzhiclick" class="huifu">到货通知</a></dd>
			<dd><a href="" id="wodeshoucangclick" class="huifu">我的收藏</a></dd>
		</dl>
		<dl>
			<dt>资金管理</dt>
			<dd><a href="" id="yueclick" class="huifu">余额</a></dd>
			<dd><a href="" id="boqidouclick" class="huifu">波奇豆</a></dd>
			<dd><a href="" id="jiangpinduihuanclick" class="huifu">奖品兑换</a></dd>
		</dl>
		<dl>
			<dt>消息管理</dt>
			<dd><a href="" id="zixunhuifuclick" class="huifu">咨询回复</a></dd>
		</dl>
		<dl>
			<dt>个人设置</dt>
			<dd><a href="" id="gerenziliaoclick" class="huifu">个人资料</a></dd>
			<dd><a href="" id="anquanshezhiclick" class="huifu">安全设置</a></dd>
			<dd><a href="" id="shouhuodizhiclick" class="huifu">收货地址</a></dd>
		</dl>
	</div>

	<style>
		.right_index_1{
			position:relative;
			width:900px;
			height:150px;
			margin-left:30px;
			margin-top:30px;
			float:left;
			background:#FFF;
			z-index:2;
		}
		.right_index_1_left{
			float:left;
		}
		.right_index_1_left img{
			margin:20px;
			float:left;
			width:100px;
			height:100px;
			border-radius:50%;
			float:left;
		}
		.left_content{
			float:left;
			width:460px;
			height:140px;
			margin-left:20px;
		}
		.left_content li{
			margin-top:20px;
		}
		.left_content p{
			float:left;
		}
		.left_content a{
			float:left;
			font-size:12px;
			margin-left:10px;
		}
		.left_content a:hover{
			color:#F05030;
		}
		.safelevel{
			float:left;
			width:182px;
			height:16px;
			background:url(baike_dogimg/sprites.png) no-repeat -180px -116px;
		}
		.viplevel{
			font-style:italic;
			font-family:Verdana;
			color:#F05030;
		}
		
		.right_content{
			border-left:3px solid #F6F3F3;
			margin-left:30px;
			float:left;
			height:151px;
		}
		.right_content dl{
			padding-left:10px;
			margin-top:20px;
		}
		.right_content dl dd{
			padding-top:25px;
		}
		
		.right_content dl dd p{
			width:105px;
			float:left;
			text-align:right;
		}
		.right_content dl dd h4{
			float:left;
			text-align:left;
		}
		.right_content a{
			float:left;
			font-size:12px;
			margin-left:20px;
			margin-top:2px;
		}
		.right_content a:hover{
			color:#F05030;
		}
	</style>
	<div id="right_index" class="clickclass1"  style="display:block">
		<div class="right_index_1">
			<div class="right_index_1_left">
				<img src="baike_dogimg/none1.gif">
				<div class="left_content">
					<li><p style="color:#F05030;">${sessionScope.grzyUserInfo[0].uname }</p><p>,欢迎回来！</p><a href="#">编辑个人资料</a></li><br/>
					<li><p>会员级别:&nbsp;<strong class="viplevel">V1</strong></p><p>(经验值:0，还差300可升级到<strong class="viplevel">V2</strong>)</p><a href="#">如何获取经验值?</a></li><br/>
					<li><p>账户安全:&nbsp;</p><div class="safelevel"></div><a href="#">安全设置</a><li>
				</div>
				<div class="right_content">
					<dl>
						<dt>我的资产</dt>
						<dd><p>现金余额：</p><h4>￥${sessionScope.grzyUserInfo[0].money }</h4></dd>
						<dd><p>波奇豆：</p><h4>${sessionScope.grzyUserInfo[0].bqdou }</h4><a href="#">什么是波奇豆</a></dd>
						<dd><p>可用优惠券：</p><h4>1</h4></dd></dd>
					</dl>
				</div>
			</div>
		</div>
		<style>
		.right_index_2{
			width:440px;
			float:left;
			margin-top:30px;
			margin-left:30px;
			background:#FFF;
			
		}
		.right_index_2 p{
			float:left;
			margin-left:20px;
			margin-top:20px;
		}
		.right_index_2 a{
			font-size:12px;
			color:#666;
			float:right;
			margin-top:22px;
			margin-right:20px;
		}
		.left_order{
			padding-top:40px;
			display:block;
			width:440px;
			height:96px;
			margin-left:20px;
		}
		.right_index_2 dl{
			margin-left:10px;
			display:block;
			float:left;
			width:85px;
			height:96px;
		}
		.right_index_2 #allshoppingorderclick .allshoppingorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat 0 -100px;
			background-color:#FCB;
			margin-top:-20px;
		}
		.right_index_2 #unpaidorderclick .unpaidorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -100px;
			background-color:#FCB;
			margin-top:-20px;
		}
		.right_index_2 #doneorderclick .doneorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -0px -170px;
			background-color:#FCB;
			margin-top:-20px;
		}
		.right_index_2 #undoorderclick .undoorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -170px;
			background-color:#FCB;
			margin-top:-20px;
		}
		.right_index_2 .left_order a:hover{
			color:#F05030;
			
		}
		.right_index_2 dd{
			margin-top:5px;
			font-size:14px;
			text-align:center;
			font-size:12px;
		}
	</style>
		<div class="right_index_2">
			<p>商城实物订单（shop.boqi.com）</p><a href="#">去波奇商城逛逛 >></a><br/>
		<div class="left_order">
			<dl>
				<a href="" id="allshoppingorderclick">
					<dt><div class="allshoppingorder"></div></dt>
					<dd>全部商城订单</dd>
				</a>	
			</dl>
			<dl>
				<a href="" id="unpaidorderclick">
					<dt><div class="unpaidorder"></div></dt>
					<dd>待支付 ${sessionScope.weizhifu}</dd>
				</a>	
			</dl>
			<dl>
				<a href="" id="doneorderclick">
					<dt><div class="doneorder"></div></dt>
					<dd>已完成 ${sessionScope.finish}</dd>
				</a>
			</dl>
			<dl>
				<a href="" id="undoorderclick">
					<dt><div class="undoorder"></div></dt>
					<dd>待评价 ${sessionScope.pingjia}</dd>
				</a>	
			</dl>
		</div>
	</div>	
		<style>
		.right_index_3{
			width:440px;
			float:left;
			margin-top:30px;
			margin-left:20px;
			background:#FFF;
			
		}
		.right_index_3 p{
			float:left;
			margin-left:20px;
			margin-top:20px;
		}
		.right_index_3 a{
			font-size:12px;
			float:right;
			color:#666;
			margin-top:22px;
			margin-right:20px;
		}
		.right_order{
			padding-top:40px;
			display:block;
			width:440px;
			height:96px;
			margin-left:20px;
		}
		.right_index_3 dl{
			margin-left:10px;
			display:block;
			float:left;
			width:85px;
			height:96px;
		}
		.right_index_3 #allserviceorderclick .allserviceorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat 0 -100px;
			background-color:#FFD6A6;
			margin-top:-20px;
		}
		.right_index_3 .unpaidorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -100px;
			background-color:#FFD6A6;
			margin-top:-20px;
		}
		.right_index_3 .doneorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -0px -170px;
			background-color:#FFD6A6;
			margin-top:-20px;
		}
		.right_index_3 .undoorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -170px;
			background-color:#FFD6A6;
			margin-top:-20px;
		}
		.right_index_3 .right_order a:hover{
			color:#F05030;
			
		}
		.right_index_3 dd{
			margin-top:5px;
			font-size:14px;
			text-align:center;
			font-size:12px;
		}
		</style>
		<div class="right_index_3">
			<p>服务订单（vet.boqi.com）</p><a href="#">去波奇服务看看 >></a><br/>
		<div class="right_order">
			<dl>
				<a href="" id="allserviceorderclick">
					<dt><div class="allserviceorder"></div></dt>
					<dd>全部服务订单</dd>
				</a>	
			</dl>
			<dl>
				<a href="" id="unpaidserviceorderclick">
					<dt><div class="unpaidorder"></div></dt>
					<dd>待支付 0</dd>
				</a>	
			</dl>
			<dl>
				<a href="" id="doneserviceorderclick">
					<dt><div class="doneorder"></div></dt>
					<dd>已完成 0</dd>
				</a>
			</dl>
			<dl>
				<a href="" id="undoserviceorderclick">
					<dt><div class="undoorder"></div></dt>
					<dd>待评价 0</dd>
				</a>
			</dl>
		</div>
	</div>
		<style>
		.right_index_4{
			width:900px;
			float:left;
			margin-top:20px;
			margin-left:30px;
			background:#FFF;
			
		}
		.right_index_4 p{
			float:left;
			margin-left:20px;
			margin-top:20px;
		}
		.right_index_4 .toservice{
			font-size:12px;
			float:right;
			color:#666;
			margin-top:22px;
			margin-right:20px;
		}
		.shoporderInfo{
			width:850px;
			float:left;
			margin-top:10px;
			margin-left:20px;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
		}
		.shoporderInfo tr{
			background:#F6F3F3;
		}
		.shoporderInfo tr th{
			font-size:12px;
			font-weight:normal;
			text-align:center;
			background:#F6F3F3;
		}
		.shoporderInfo tbody tr td .noorders p{
			line-height:17px;
			text-align:center;
			font-size:13px;
		}
		.shoporderInfo tbody tr td .orderimg{
			width:50px;
			height:50px;
			background:#red;
			display:block;
			margin-left:20px;
			float:left;
			padding-top:5px;
			padding-bottom:5px;
		}
		.shoporderInfo tbody tr td .caozuo{
			margin-bottom:5px;
			display:block;
			text-align:center;
		}
	</style>
		<div class="right_index_4">
		<p>近期商城实物订单</p><a class="toservice" href="#">查看全部商城实物订单 >></a><br/>
		<table class="shoporderInfo">
 　　		<tr> 
				<th class="ordernum" style="width:130px; height:30px;">订单编号</th>
				<th class="goodsInfo" style="width:315px; height:30px;">商品信息</th>
				<th class="consignee" style="width:90px; height:30px;">收货人</th>
				<th class="ordermoney" style="width:90px; height:30px;">订单金额</th>
				<th class="orderstatus" style="width:90px; height:30px;">
					<select>
						<OPTION selected value="0">订单状态</OPTION>
						<OPTION value="1" id="daifukuanselected">待付款</OPTION>
						<OPTION value="2" id="peihuozhongselected">配货中</OPTION>
						<OPTION value="3" id="yiquxiaoselected">已取消</OPTION>
						<OPTION value="4" id="yishouhuoselected">已收货</OPTION>
					</select>
				</th>
				<th class="operate" style="height:30px">操作</th>
			</tr>
 　　		<tbody id="ordertbody">
 　　　　		<c:choose>
 					<c:when test="${not empty sessionScope.orderBasic }">
 						<c:forEach items="${sessionScope.orderBasic }" var="basic">
 						<tr style="padding-left:3px; padding-right:3px;">
 							<td style="text-align: center;">${basic.orderid }</td>								
 									<td style="text-align: center;">
 										<c:forEach items="${sessionScope.orderpic }" var="orderpic">
 											<c:if test="${orderpic.orderid eq basic.orderid  }">
 												<img class="orderimg" src="../upload/${orderpic.pictrue} "/>
 											</c:if>
 										</c:forEach>
 									</td>
 									<td style="text-align: center;">${basic.addname }</td>
 									<td style="text-align: center;">${basic.ordersum }</td>
 									<td style="text-align: center;">
 										<c:if test="${basic.orderstate eq 0}">已取消</c:if>
 										<c:if test="${basic.orderstate eq 1}">待付款</c:if>
 										<c:if test="${basic.orderstate eq 2}">已付款</c:if>
 										<c:if test="${basic.orderstate eq 3}">配货中</c:if>
 										<c:if test="${basic.orderstate eq 4}">已发货</c:if>
 										<c:if test="${basic.orderstate eq 5}">已收货</c:if>
 										<c:if test="${basic.orderstate eq 6}">退货</c:if>
										<c:if test="${basic.orderstate eq 7}">已收货但用户删除了订单</c:if>
 									</td>
 									<td style="text-align: center;"><a href="user_deleteOrder.action?orderid=${basic.orderid }">删除订单</a>
 									<a class="caozuo" href="">订单详情</a>
 									<a class="caozuo" href="user_queren.action?orderid=${basic.orderid }">确认收货</a></td>
 								
 						</tr>
 						</c:forEach>
 					</c:when>
 					<c:otherwise>
 					<tr>
 						<td colspan="6">
							<div class="noorders" style="text-align: center;">
								<p>暂无订单，去<a href="#">波奇商城</a>看看吧</p>
							</div>
						</td>
					</tr>
 					</c:otherwise>
 				</c:choose>
 　　		</tbody>
		</table>
	
	</div>
	
		<style>
		.right_index_5{
			width:900px;
			float:left;
			margin-top:20px;
			margin-left:30px;
			background:#FFF;
			
		}
		.right_index_5 p{
			float:left;
			margin-left:20px;
			margin-top:20px;
		}
		.right_index_5 .toservice{
			font-size:12px;
			float:right;
			color:#666;
			margin-top:22px;
			margin-right:20px;
		}
		.serviceorderInfo{
			width:850px;
			float:left;
			margin-top:10px;
			margin-left:20px;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
		}
		
		.serviceorderInfo tr th{
			font-size:12px;
			font-weight:normal;
			text-align:center;
			background:#F6F3F3;
		}
		.serviceorderInfo tbody tr td .noorders p{
			line-height:17px;
			text-align:center;
			font-size:13px;
		}
	</style>
		<div class="right_index_5">
		<p>近期服务订单</p><a class="toservice" href="#">查看全部服务订单 >></a><br/>
		<table class="serviceorderInfo">
 　　		<tr> 
				<th class="serviceInfo" style="width:295px; height:30px;">服务信息</th>
				<th class="univalent" style="width:80px; height:30px;">单价</th>
				<th class="servicenum" style="width:80px; height:30px;">数量</th>
				<th class="servicestatus" style="width:90px; height:30px;">
					<select>
						<OPTION selected value="0">全部订单</OPTION>
						<OPTION value="1">待付款</OPTION>
						<OPTION value="2">待确认</OPTION>
						<OPTION value="3">待使用</OPTION>
						<OPTION value="4">待评价</OPTION>
						<OPTION value="5">已完成</OPTION>
						<OPTION value="6">已退款</OPTION>
						<OPTION value="7">已取消</OPTION>
					</select>
				</th>
				<th class="operate" style="width:80px; height:30px;">操作</th>
				<th class="paidmoney" style="height:30px">应付金额</th>
			</tr>
 　　		<tbody>
 　　　　		<tr><td colspan="6">
				<div class="noorders">
				<p>暂无订单，去<a href="#">波奇服务</a>看看吧</p>
				</div>
				</td></tr>
 　　		</tbody>
		</table>
	</div>
		<style>
		.right_index_6{
			width:900px;
			float:left;
			margin-top:20px;
			margin-left:30px;
			background:#FFF;
			
		}
		.right_index_6 p{
			float:left;
			margin-left:20px;
			margin-top:20px;
		}
		.right_index_6 .toservice{
			font-size:12px;
			float:right;
			color:#666;
			margin-top:22px;
			margin-right:20px;
		}
		.myfavourite{
			display:block;
			margin-top:20px;
			padding-bottom:20px;
		}
	</style>
		<div class="right_index_6">
		<p>我的收藏</p><a class="toservice" href="#">查看更多 >></a><br/>
			<div class="myfavourite">
				
			</div>
		</div>
	</div>
	
	<style>
		#right_shangcheng_order{
			width:900px;
			min-height:300px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
			
		}
		#right_shangcheng_order .order1{
			padding-top:30px;
			padding-left:20px;
			font-weight:bold;
			font-size:20px;
		}
		#shopping_order{
			margin-top:30px;
			margin-left:20px;
			margin-bottom:10px;
			width:900px;
			height:30px;
		}
		#shopping_order .text1{
			float:right;
			padding-right:50px;
			padding-bottom:7px;
		}
		#shopping_order .text1 input{
			line-height:20px;
		}
		#shopping_order .text1 .text2{
			float:right;
			padding:5px;
			height:12px;
			width:50px;
			text-decoration:none;
			color:#6A6666;
			font-size:12px;
			border:1px solid;
			border-top-color:#c2c0c0;
			border-right-color:#cccaca;
			border-bottom-color:#d1cfcf;
		}
		#shopping_order .text1 .text2:hover{
			background:#999;
		}
		.shangchengorder{
			width:850px;
			float:left;
			margin-top:10px;
			margin-left:5px;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
		}
		
		.shangchengorder tr th{
			font-size:12px;
			font-weight:normal;
			text-align:center;
			background:#F6F3F3;
		}
		.shangchengorder tbody tr td .noorders .no_order{
			line-height:17px;
			text-align:center;
			font-size:15px;
			padding:10px;
		}
	</style>
	<div id="right_shangcheng_order" class="clickclass1" style="display:none;">
		<p class="order1">商城订单</p>
		<div id="shopping_order">
			<form action method="get" class="text1">
				<input type="text" id="order_search" name="keyword" size="27"  placeholder="订单编号/商品名称" maxlength="12">
				<a id="search_button" href="#" class="text2">搜索订单</a>
			</form>
		<table class="shangchengorder">
 　　		<tr> 
				<th class="ordernum" style="width:130px; height:30px;">订单编号</th>
				<th class="goodsInfo" style="width:315px; height:30px;">商品信息</th>
				<th class="consignee" style="width:90px; height:30px;">数量</th>
				<th class="ordermoney" style="width:90px; height:30px;">价格</th>
				<th class="orderstatus" style="width:90px; height:30px;">
					<select>
						<OPTION selected value="0">订单状态</OPTION>
						<OPTION value="1">待付款</OPTION>
						<OPTION value="2">处理中</OPTION>
						<OPTION value="3">待评价</OPTION>
						<OPTION value="4">已完成</OPTION>
					</select>
				</th>
				<th class="operate" style="height:30px">操作</th>
			</tr>
 　　		<tbody>
 　　　　		<c:choose>
 					<c:when test="${not empty sessionScope.grzyOrderInfo }">
 						<c:forEach items="${sessionScope.grzyOrderInfo }" var="order">
 						<tr style="padding-left:3px; padding-right:3px;">
 							<td style="text-align: center;">${order.orderid }</td>								
 									<td style="text-align: center;">
 										<c:forEach items="${sessionScope.orderpic }" var="orderpic">
 											<c:if test="${orderpic.proid eq order.proid  }">
 												<img class="orderimg" src="./shoppingimg/${orderpic.pictrue}.jpg "/>
 											</c:if>
 										</c:forEach>
 									</td>
 									<td style="text-align: center;">${order.pronum }</td>
 									<td style="text-align: center;">${order.bqpri }</td>
 									<td style="text-align: center;">
 										<c:if test="${order.status eq 0}">已取消</c:if>
 										<c:if test="${order.status eq 1}">待付款</c:if>
 										<c:if test="${order.status eq 2}">已付款</c:if>
 										<c:if test="${order.status eq 3}">配货中</c:if>
 										<c:if test="${order.status eq 4}">已发货</c:if>
 										<c:if test="${order.status eq 5}">已收货</c:if>
 										<c:if test="${order.status eq 6}">退货</c:if>
										<c:if test="${order.status eq 7}">已收货但用户删除了订单</c:if>
 									</td>
 									<td style="text-align: center;"><a href="user_deleteOrder.action?orderid=${order.orderid }">删除订单</a>
 									</td>
 								
 						</tr>
 						</c:forEach>
 					</c:when>
 					<c:otherwise>
 					<tr>
 						<td colspan="6">
							<div class="noorders" style="text-align: center;">
								<p>暂无订单，去<a href="#">波奇商城</a>看看吧</p>
							</div>
						</td>
					</tr>
 					</c:otherwise>
 				</c:choose>
 　　		</tbody>
		</table>
		</div>	
	</div>
	<style>
		#right_service_order{
			width:900px;
			min-height:300px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
			
		}
		#right_service_order .order1{
			padding-top:30px;
			padding-left:20px;
			font-weight:bold;
			font-size:20px;
		}
		#service_order{
			margin-top:30px;
			margin-left:20px;
			margin-bottom:10px;
			width:900px;
		}
		#service_order .text1{
			float:right;
			padding-right:50px;
		}
		#service_order .text1 input{
			line-height:20px;
		}
		#service_order .text1 .text2{
			float:right;
			padding:5px;
			height:12px;
			width:50px;
			text-decoration:none;
			color:#6A6666;
			font-size:12px;
			border:1px solid;
			border-top-color:#c2c0c0;
			border-right-color:#cccaca;
			border-bottom-color:#d1cfcf;
		}
		#service_order .text1 .text2:hover{
			background:#999;
		}
		.serviceorder{
			relative:static;
			width:850px;
			margin-left:5px;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
		}
		
		.serviceorder tr th{
			font-size:12px;
			font-weight:normal;
			text-align:center;
			background:#F6F3F3;
		}
		.serviceorder tbody tr td .noorders .no_order{
			line-height:17px;
			text-align:center;
			font-size:15px;
			padding:10px;
		}
	</style>
	<div id="right_service_order" class="clickclass1" style="display:none;">
		<p class="order1">服务订单</p>
		<div id="service_order">
			<div class="order_top">
				<form action method="get" class="text1">
					<input type="text" id="order_search" name="keyword" size="27"  placeholder="订单编号/商品名称" maxlength="12">
					<a id="search_button" href="#" class="text2">搜索订单</a>
				</form>
			</div>	
			<table class="serviceorder">
 　　			<tr> 
					<th class="ordernum" style="width:130px; height:30px;">订单编号</th>
					<th class="goodsInfo" style="width:315px; height:30px;">商品信息</th>
					<th class="consignee" style="width:90px; height:30px;">收货人</th>
					<th class="ordermoney" style="width:90px; height:30px;">订单金额</th>
					<th class="orderstatus" style="width:90px; height:30px;">
						<select>
							<OPTION selected value="0">订单状态</OPTION>
							<OPTION value="1">待付款</OPTION>
							<OPTION value="2">处理中</OPTION>
							<OPTION value="3">待评价</OPTION>
							<OPTION value="4">已完成</OPTION>
						</select>
					</th>
					<th class="operate" style="height:30px">操作</th>
				</tr>
 　　			<tbody>
 　　　　			<tr><td colspan="6">
					<div class="noorders" style="display:block;">
						<p class="no_order">暂无订单，去<a href="#" target="_blank">波奇服务</a>看看吧</p>
					</div>
					</td></tr>
 　　			</tbody>
			</table>
		</div>	
	</div>

	<!--到货通知-->
	<style>
		#right_daohuotongzhi{
			width:900px;
			min-height:300px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
			
		}
		#right_daohuotongzhi .daohuo_order1{
			padding-top:30px;
			padding-left:20px;
			font-weight:bold;
			font-size:20px;
		}
		#daohuo_table{
			margin-top:30px;
			margin-left:20px;
			margin-bottom:10px;
			width:900px;
		}
		.daohuotongzhi{
			relative:static;
			width:850px;
			margin-left:5px;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
		}
		
		.daohuotongzhi tr th{
			font-size:12px;
			font-weight:normal;
			text-align:center;
			background:#F6F3F3;
		}
		.daohuotongzhi tbody tr td .noorders .no_order{
			line-height:17px;
			text-align:center;
			font-size:15px;
			padding:10px;
		}
	</style>
	<div id="right_daohuotongzhi" class="clickclass1" style="display:none;">
		<p class="daohuo_order1">到货通知</p>
		<div id="daohuo_table">
			<table class="daohuotongzhi">
 　　			<tr> 
					<th class="ordernum" style="width:130px; height:30px;">商品信息</th>
					<th class="goodsInfo" style="width:315px; height:30px;">波奇价</th>
					<th class="consignee" style="width:90px; height:30px;">库存状态</th>
					<th class="ordermoney" style="width:90px; height:30px;">操作</th>
				</tr>
 　　			<tbody>
 　　　　			<tr><td colspan="4">
					<div class="noorders" style="display:block;">
						<p class="no_order" style="font-size:8px;">您还没有为缺货商品设置过到货通知，到<a href="#" target="_blank">波奇商城</a>逛逛吧！</p>
					</div>
					</td></tr>
 　　			</tbody>
			</table>
		</div>	
	</div>

	<!--我的收藏-->
	<style>
		#right_myshoucang{
			width:900px;
			min-height:300px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
			
		}
		#right_myshoucang .order1{
			padding-top:30px;
			padding-left:20px;
			font-weight:bold;
			font-size:20px;
		}
		#shoucangtable{
			margin-top:30px;
			margin-left:20px;
			margin-bottom:10px;
			width:900px;
		}
		.shoucang{
			relative:static;
			width:850px;
			margin-left:5px;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
		}
		
		.shoucang tr th{
			font-size:12px;
			font-weight:normal;
			text-align:center;
			background:#F6F3F3;
		}
		.shoucang tbody tr td .noorders .no_order{
			line-height:17px;
			text-align:center;
			font-size:15px;
			padding:10px;
		}
	</style>
	<div id="right_myshoucang" class="clickclass1" style="display:none;">
		<p class="order1">我的收藏</p>
		<div id="shoucangtable">
		<table class="shoucang">
 　　		<tr> 
				<th class="ordernum" style="width:130px; height:30px;">商品信息</th>
				<th class="goodsInfo" style="width:315px; height:30px;">波奇价</th>
				<th class="consignee" style="width:90px; height:30px;">库存状态</th>
				<th class="ordermoney" style="width:90px; height:30px;">操作</th>
			</tr>
 　　		<tbody>
 　　　　		<tr><td colspan="4">
				<div class="noorders" style="display:block;">
				<p class="no_order" style="font-size:8px;">您还没有收藏过商品，去<a href="#" target="_blank">波奇商城</a> 逛逛吧！</p>
				</div>
				</td></tr>
 　　		</tbody>
		</table>
		</div>	
	</div>

	<!--余额-->
	<style>
		#zhanghuInfo,#zhanghumingxi{
			width:900px;
			min-height:220px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
			
		}
		#zhanghuInfo .yue1{
			padding-top:30px;
			padding-left:20px;
			font-size:18px;
		}
		#zhanghumingxi .yue1{
			padding-top:30px;
			padding-left:20px;
			font-size:18px;
		}
		#keyongyueli{
			margin-left:20px;
			padding-top:30px;
			line-height:20px;
		}
		#keyongyue{
			font-size:10px;
			float:left;
			color:#6A6666;
		}
		#yuechongzhi{
			color:#FFF;
			width:64px;
			height:28px;
			font-size:12px;
			background-color:#F05030;
			padding-top:5px;
			padding-bottom:5px;
			padding-left:20px;
			padding-right:20px;
			border:#E04020 2px;
			margin-left:400px;
		}
		#yuechongzhi:hover{
			background-color:#E04020;
		}

		#yuetixian{
			color:#000;
			width:64px;
			height:28px;
			font-size:12px;
			background-color:#F6F3F3;
			padding-top:5px;
			padding-bottom:5px;
			padding-left:20px;
			padding-right:20px;
			border:#DDDADA 1px solid;
			margin-left:10px;
		}
		#yuetixian:hover{
			background-color:#6A6666;
			color:#FFF;
		}
		#Bindingphone{
			width:130px;
			height:30px;
			display:block;
			list-style:none;
			-webkit-margin-before: 1em;
			-webkit-margin-after: 1em;
			-webkit-margin-start: 0px;
			-webkit-margin-end: 0px;
			float:left;
			margin-left:10px;
		}
		#Bindingphone .icon_phone{
			width:30px;
			height:30px;
			float:left;
			display:inline-block;
			background:url(baike_dogimg/sprites.png) 0 0 no-repeat;
			background-position:-40px -240px;
		}
		#Bindingphone .bindingspan,.settingspan{
			color:#F05030; 
			font-size:12px;
			text-align:center;
			float:left;
			margin-top:8px;
		}
		#Bindingphone .binding,.setting{
			float:left;
			font-size:12px;
			color:#09c;
			margin-top:8px;
			margin-left:3px;
		}
		#setpaypwd{
			width:150px;
			height:30px;
			display:block;
			list-style:none;
			-webkit-margin-before: 1em;
			-webkit-margin-after: 1em;
			-webkit-margin-start: 0px;
			-webkit-margin-end: 0px;
			float:left;
		}
		#setpaypwd .icon_paypwd{
			width:30px;
			height:30px;
			float:left;
			display:inline-block;
			background:url(baike_dogimg/sprites.png) 0 0 no-repeat;
			background-position:-80px -240px;
		}
		#zhanghuInfo .tixianguize{
			width:94%;
			float:left;
			margin-left:3%;
			line-height:20px;
			font-family:Arial,Simsun; 
			font-size:12px;
			color:#9A9999;
			display:block;
			padding-top:15px;
			border-top:1px solid #F6F3F3;
		}
		#mingxiorder .zhichumingxi{
			text-decoration:none;
			width:100px;
			text-align:center;
			display:inline-block;
			font-size:14px;
			padding-bottom:10px;
			color:#F05030;
			border-bottom:2px #F05030 solid;
		}
		.zhanghumingxitable{
			width:850px;
			float:left;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
		}
		
		.zhanghumingxitable tr th{
			font-size:12px;
			font-weight:normal;
			text-align:center;
			background:#F6F3F3;
		}
		.zhanghumingxitable tbody tr td .noorders .no_order{
			line-height:17px;
			text-align:center;
			font-size:15px;
			padding:10px;
		}
	</style>
	<div id="right_zhanghuyue" class="clickclass1" style="display:none;">
		<div id="zhanghuInfo">
			<p class="yue1">账户余额</p>
			<li id="keyongyueli">
				<p id="keyongyue">可用余额:</p>
				<p style="color:#F05030; float:left; font-size:18px; font-weight:bold;">￥${sessionScope.grzyUserInfo[0].money }</p>
				<p id="keyongyue" style="padding-left:40px; ">可提现:</p>
				<p style="color:#F05030; float:left; font-size:18px; font-weight:bold;">￥0.00</p>
				<a id="yuechongzhi">充值</a>
				<a id="yuetixian">提现</a>
			</li>
			<li id="Bindingphone">
				<div class="icon_phone"></div>
				<span class="bindingspan">手机未绑定</span>
				<a href="" class="binding">绑定</a>
			</li>
			<li id="setpaypwd">
				<div class="icon_paypwd"></div>
				<span class="settingspan">未设置支付密码</span>
				<a href="" class="setting">设置</a>
			</li>
			<p class="tixianguize">提现规则：20元起提，每日提现限额500元，每日限提现1次</p>
		</div>
		<div id="zhanghumingxi">
			<p class="yue1">账户明细</p>
			<div id="mingxiorder" style="padding-left:0px; margin-left:20px; padding-top:0px;">
				<a class="zhichumingxi">支出明细</a>

				<select style="margin-left:600px;">
					<option value="0" selected>最近一周</option>
					<option value="1" >最近一个月</option>
					<option value="2" >一个月前</option>
				</select>
				<table class="zhanghumingxitable">
 　　		<tr> 
				<th class="ordernum" style="width:130px; height:30px;">涉及订单号</th>
				<th class="goodsInfo" style="width:315px; height:30px;">商品信息</th>
				<th class="consignee" style="width:90px; height:30px;">交易时间</th>
				<th class="ordermoney" style="width:90px; height:30px;">支出金额</th>
				<th class="orderstatus" style="width:90px; height:30px;">状态</th>
				<th class="operate" style="height:30px">备注</th>
			</tr>
 　　		<tbody>
 　　　　		<tr><td colspan="6">
				<div class="noorders" style="display:block;">
				<p class="no_order" style="font-size:12px;">暂无支出记录</p>
				</div>
				</td></tr>
 　　		</tbody>
		</table>
			</div>
		</div>
	</div>
	
	<!--波奇豆-->
	<style>
		#myboqidou{
			width:900px;
			min-height:150px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
		}
		#mingxiorder{
			width:880px;
			min-height:220px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
			
		}
		#mingxiorder,#myboqidou .yue1{
			padding-top:30px;
			padding-left:20px;
			font-size:18px;
		}
		#boqidouli{
			margin-left:20px;
			padding-top:30px;
			line-height:20px;
		}
		#keyongboqidou,#keyongjifen{
			font-size:10px;
			float:left;
			color:#6A6666;
		}
		#duihuan{
			font-size:12px;
			color:#09c;
			float:left;
			margin-left:10px;
		}
	</style>
	<div id="boqidou" class="clickclass1" style="display:none;">
		
		<div id="myboqidou">
			<p class="yue1">我的波奇豆</p>
			<li id="boqidouli">
				<p id="keyongboqidou">可用波奇豆:</p>
				<p style="color:#F05030; float:left; font-size:18px; font-weight:bold;">${sessionScope.grzyUserInfo[0].bqdou }</p>
				<p id="keyongjifen" style="padding-left:40px; ">可用积分:</p>
				<p style="color:#F05030; float:left; font-size:18px; font-weight:bold;">0</p>
				<a id="duihuan" href="">兑换波奇豆</a>
				<p style="font-size:12px;float:left;">(100积分=1波奇豆)</p>
			</li>
		</div>
		<div id="mingxiorder">
		<p class="yue1">波奇豆明细</p>
		<table class="shangchengorder">
 　　		<tr> 
				<th class="ordernum" style="width:200px; height:30px;">交易时间</th>
				<th class="goodsInfo" style="width:245px; height:30px;">收入/支出</th>
				<th class="operate" style="height:30px">备注</th>
			</tr>
 　　		<tbody>
 　　　　		<tr><td colspan="6">
				<div class="noorders" style="display:block;">
				<p class="no_order" style="font-size:12px;">暂无支出记录</p>
				</div>
				</td></tr>
 　　		</tbody>
		</table>
		</div>
	</div>
	
	<!--奖品兑换-->
		<style>
		#myduihuanquan{
			width:900px;
			min-height:150px auto;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
		}
		#useduihuanquan{
			width:900px;
			min-height:150px;
			position:relative;
			float:left;
			margin-top:20px;
			margin-left:30px;
			background-color:#FFF;
			
		}
		#duihuanjilu{
			width:920px;
			min-height:150px auto;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
		}
		#myduihuanquan,#useduihuanquan,#duihuanjilu .yue1{
			padding-top:30px;
			padding-left:20px;
			font-size:18px;
		}
		#duihuanquanli{
			margin-left:20px;
			padding-top:30px;
			line-height:20px;
		}
		#inputduihuannum{
			font-size:10px;
			float:left;
			color:#000;
		}
		#duihuanquan{
			line-height:20px;
			border:2px #DDDADA solid;
			float:left;
		}
		#duihuanquanli .duihuanjiangpin{
			font-size:12px;
			color:#FFF;
			float:left;
			margin-left:10px;
			border:1px #E04020 solid;
			background-color:#F05030;
			padding-top:1.5px;
			padding-bottom:1.5px;
			padding-left:15px;
			padding-right:15px;
		}
		#duihuanquanli .duihuanjiangpin:hover{
			background-color:#E04020;
		}
	</style>
	<div id="jiangpin" class="clickclass1" style="display:none;">
		
		<div id="myduihuanquan">
			<p class="yue1">我的奖品兑换券</p>
			<table class="shangchengorder">
 　　		<tr> 
				<th class="duihuanquanhao" style="width:170px; height:30px;">兑换券号</th>
				<th class="mianzhi" style="width:50px; height:30px;">面值</th>
				<th class="xuxiaofeijine" style="width:90px; height:30px;">需消费金额</th>
				<th class="shengxiaoshijian" style="width:120px; height:30px;">生效时间</th>
				<th class="shixiaoshijian" style="width:120px; height:30px;">失效时间</th>
				<th class="shiyongshuoming" style="width:200px; height:30px;">使用说明</th>
				<th class="shiyongfanwei" style="height:30px">使用范围</th>
			</tr>
 　　		<tbody>
 　　　　		<tr><td colspan="7">
				<div class="noorders" style="display:block;">
				<p class="no_order" style="font-size:12px;">暂无可用兑换券！</p>
				</div>
				</td></tr>
 　　		</tbody>
		</table>
		</div>
		<div id="useduihuanquan">
			<p class="yue1">使用兑换券码</p>
			<li id="duihuanquanli">
				<p id="inputduihuannum">请输入兑换券号码:</p>
				<input type="text" value="" id="duihuanquan"/>
				<a class="duihuanjiangpin" href="">兑换</a>
			</li>
		</div>
		<div id="duihuanjilu">
			<p class="yue1">兑换记录</p>
			<table class="shangchengorder" style="margin-left:20px;">
 　　		<tr> 
				<th class="shangpinbianhao" style="width:90px; height:30px;">商品编号</th>
				<th class="shangpinxinx" style="width:350px; height:30px;">商品信息</th>
				<th class="huoqushijian" style="width:130px; height:30px;">获取时间</th>
				<th class="zhuangtai" style="width:90px; height:30px;">状态</th>
				<th class="caozuo" style="height:30px">操作</th>
			</tr>
 　　		<tbody>
 　　　　		<tr><td colspan="5">
				<div class="noorders" style="display:block;">
				<p class="no_order" style="font-size:12px;">暂无奖品可兑换！</p>
				</div>
				</td></tr>
 　　		</tbody>
		</table>
		</div>
	</div>
	
	<!--咨询回复-->
	<style>
		#zixun{
			width:900px;
			min-height:200px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
		}
		#zixunhuifu .yue1{
			padding-top:30px;
			padding-left:20px;
			font-size:18px;
		}
	</style>
	<div id="zixun" class="clickclass1" style="display:none;">
		<div id="zixunhuifu">
			<p class="yue1">咨询回复</p>
			<table class="shangchengorder" style="margin-left:20px;">
 　　			<tr> 
					<th class="ordernum" style="width:220px; height:30px;">商品信息</th>
					<th class="goodsInfo" style="width:250px; height:30px;">咨询内容</th>
					<th class="operate" style="height:30px">收到的回复</th>
				</tr>
 　　			<tbody>
 　　　　			<tr><td colspan="6">
					<div class="noorders" style="display:block;">
					<p class="no_order" style="font-size:12px;">暂无咨询记录</p>
					</div>
					</td></tr>
 　　			</tbody>
			</table>
		</div>
	</div>
	
	<!--个人资料-->
	<style>
		#basicInfo{
			width:900px;
			min-height:200px auto;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
		}
		#basicInfo .yue1{
			padding-top:30px;
			padding-left:20px;
			font-size:18px;
		}
		#basicInfoli{
			width:860px;
			display:block;
			height:50px;
			margin-left:20px;
			border-bottom:3px #DDDADA solid;
			
		}
		#basicInfoli .basicInfop{
			text-decoration:none;
			width:100px;
			text-align:center;
			display:inline-block;
			font-size:14px;
			padding-bottom:10px;
			margin-top:24px;
			color:#F05030;
			border-bottom:3px #F05030 solid;
		}
		
		#basicInfoForm .formli{
			width:100%;
			margin-top:20px;
			float:left;
		}
		#basicInfoForm .formli1{
			width:100%;
			margin-top:12px;
			float:left;
		}
		
		#basicInfoForm .formli label input{
			margin-right:3px;
		}
		#basicInfoForm .formli label .sex{
			margin-right:3px;
			margin-top:5px;
			float:left;
		}
		#basicInfoForm .formli label p{
			float:left;
			line-height:20px;
			margin-right:5px;
			font-size:12px;
		}
		#basicInfoForm .formli1 .formcontent{
			font-size:12px;
			float:left;
			line-height:30px;
		}
		#bitian{
			color:#F05030;
			text-align:right;
			float:left;
			margin-left:90px;
		}
		#basicInfoForm .formli .formcontent,.interest{
			font-size:12px;
			float:left;
			line-height:20px;
		}
		#basicInfoForm .formli1 #youxiang{
			background:url(baike_dogimg/sprites.png) 0 0 no-repeat;
			background-position:0px -240px;
			width:30px;
			height:30px;
			float:left;
			margin-left:68px;
		}
		#basicInfoForm .formli1 #phone{
			background:url(baike_dogimg/sprites.png) 0 0 no-repeat;
			background-position:-40px -240px;
			width:30px;
			height:30px;
			float:left;
			margin-left:68px;
		}
	
        ._citys { width: 450px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative; }
        ._citys span { color: #56b4f8; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #56b4f8; cursor: pointer; }
        ._citys0 { width: 100%; height: 34px; display: inline-block; border-bottom: 2px solid #56b4f8; padding: 0; margin: 0; }
        ._citys0 li { display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer; }
        .citySel { background-color: #56b4f8; color: #fff !important; }
        ._citys1 { width: 100%; display: inline-block; padding: 10px 0; }
        ._citys1 a { width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden; }
        ._citys1 a:hover { color: #fff; background-color: #56b4f8; }
        .AreaS { background-color: #56b4f8 !important; color: #fff !important; }
		
		#basicInfoForm .interest label{
			font-size:14px;
			display:block;
			width:220px;
			height:20px;
			float:left;
		}
		#basicInfoForm .interest label input{
			margin-right:3px;
		}
		#userInfoSubmit{
			float:left;
			width:100px;
			height:30px;
			background:#F05030;
			font-size:15px;
			margin-left:130px;
			border:none;
			border-radius:3px;
			color:#FFF;
			margin-top:20px;
			margin-bottom:50px;
		}
		#userInfoSubmit:hover{
			background-color:#F05030;
		}
	</style>
	<div id="gerenziliao" class="clickclass1" style="display:none;">
		<div id="basicInfo">
			<p class="yue1">个人资料</p>
			<li id="basicInfoli">
				<p class="basicInfop">基本资料</p>
			</li>
			
			<form id="basicInfoForm" action="user_changeUserInfo.action">
				<li class="formli">
					<p id="bitian">*</p>
					<p class="formcontent">昵称：</p>
					<input type="text" id="name" value="${sessionScope.grzyUserInfo[0].uname }" name="uname" class="forminput"/>
				</li>
				<li class="formli">
					<p id="bitian">*</p>
					<p class="formcontent">性别：</p>
					<script>
						if(${sessionScope.grzyUserInfo[0].sex}.equals("男")){
							$(".sex").removeAttr("checked");
							$("#man").attr("checked","checked");
						}else if(${sessionScope.grzyUserInfo[0].sex}.equals("女")){
							$(".sex").removeAttr("checked");
							$("#woman").attr("checked","checked");
						}
					</script>
					<label><input id="man" type="radio" name="sex" value="男" class="sex" /><p>男</p></label>
					<label><input id="woman" type="radio" name="sex" value="女" class="sex" /><p>女</p></label>
				</li>
				<li class="formli">
					<p class="formcontent" style="margin-left:98px;">生日：</p>
					<input id="birthday" name="birthday" type="text" value=""  onclick="SelectDate(this,'yyyy-MM-dd')">
					<div id="ContainerPanel" style="display: none;">
						<div id="calendarPanel" style="position: absolute; z-index: 9999; border: 1px solid rgb(204, 204, 204); width: 175px; font-size: 12px; left: 135px; top: 225px; display: none;  background-color: rgb(255, 255, 255);"> 
						<div name="calendarForm" style="margin: 0px;">   
						<table width="100%" border="0" cellpadding="0" cellspacing="1" style="font-size:12px;">    
						<tbody>
						<tr>       
						<th align="left" width="1%">
						<input style="border: 1px solid #CCCCCC;background-color:#EFEFEF;width:16px;height:20px;" name="prevMonth" type="button" id="prevMonth" value="<">
						</th>        
						<th align="center" width="98%" nowrap="nowrap">
						<select name="calendarYear" id="calendarYear" style="font-size:12px;">
						<option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990">1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023">2023</option><option value="2024">2024</option><option value="2025">2025</option><option value="2026">2026</option><option value="2027">2027</option><option value="2028">2028</option><option value="2029">2029</option><option value="2030">2030</option><option value="2031">2031</option><option value="2032">2032</option><option value="2033">2033</option><option value="2034">2034</option><option value="2035">2035</option><option value="2036">2036</option><option value="2037">2037</option><option value="2038">2038</option><option value="2039">2039</option><option value="2040">2040</option><option value="2041">2041</option><option value="2042">2042</option><option value="2043">2043</option><option value="2044">2044</option><option value="2045">2045</option><option value="2046">2046</option><option value="2047">2047</option><option value="2048">2048</option><option value="2049">2049</option><option value="2050">2050</option><option value="2051">2051</option><option value="2052">2052</option><option value="2053">2053</option><option value="2054">2054</option><option value="2055">2055</option><option value="2056">2056</option><option value="2057">2057</option><option value="2058">2058</option><option value="2059">2059</option><option value="2060">2060</option><option value="2061">2061</option><option value="2062">2062</option><option value="2063">2063</option><option value="2064">2064</option><option value="2065">2065</option><option value="2066">2066</option></select><select name="calendarMonth" id="calendarMonth" style="font-size:12px;"><option value="0">一月</option><option value="1">二月</option><option value="2">三月</option><option value="3">四月</option><option value="4">五月</option><option value="5">六月</option><option value="6">七月</option><option value="7">八月</option><option value="8">九月</option><option value="9">十月</option><option value="10">十一月</option><option value="11">十二月</option>
						</select>
						</th>       
						<th align="right" width="1%"><input style="border: 1px solid #CCCCCC;background-color:#EFEFEF;width:16px;height:20px;" name="nextMonth" type="button" id="nextMonth" value=">"></th>      </tr>    </tbody></table>    
						<table id="calendarTable" width="100%" style="border:0px solid #CCCCCC;background-color:#FFFFFF;font-size:12px;" border="0" cellpadding="3" cellspacing="1">      
						<tbody><tr>      <th style="font-weight:normal;background-color:#666666;color:#FFFFFF;">日</th>      <th style="font-weight:normal;background-color:#666666;color:#FFFFFF;">一</th>      <th style="font-weight:normal;background-color:#666666;color:#FFFFFF;">二</th>      <th style="font-weight:normal;background-color:#666666;color:#FFFFFF;">三</th>      <th style="font-weight:normal;background-color:#666666;color:#FFFFFF;">四</th>      <th style="font-weight:normal;background-color:#666666;color:#FFFFFF;">五</th>      <th style="font-weight:normal;background-color:#666666;color:#FFFFFF;"> 六</th>      </tr>    <tr align="center"> <td style="cursor: default; color: rgb(255, 0, 0); background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">1</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">2</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">3</td> <td style="cursor: pointer; color: rgb(0, 0, 255); background-color: rgb(239, 239, 239);">4</td>    </tr>    <tr align="center"> <td style="cursor: pointer; color: rgb(255, 0, 0); background-color: rgb(255, 204, 204);">5</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">6</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">7</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">8</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">9</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">10</td> <td style="cursor: pointer; color: rgb(0, 0, 255); background-color: rgb(239, 239, 239);">11</td>    </tr>    <tr align="center"> <td style="cursor: pointer; color: rgb(255, 0, 0); background-color: rgb(239, 239, 239);">12</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">13</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">14</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">15</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">16</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">17</td> <td style="cursor: pointer; color: rgb(0, 0, 255); background-color: rgb(239, 239, 239);">18</td>    </tr>    <tr align="center"> <td style="cursor: pointer; color: rgb(255, 0, 0); background-color: rgb(239, 239, 239);">19</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">20</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">21</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">22</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">23</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">24</td> <td style="cursor: pointer; color: rgb(0, 0, 255); background-color: rgb(239, 239, 239);">25</td>    </tr>    <tr align="center"> <td style="cursor: pointer; color: rgb(255, 0, 0); background-color: rgb(239, 239, 239);">26</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">27</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">28</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">29</td> <td style="cursor: pointer; background-color: rgb(239, 239, 239);">30</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; color: rgb(0, 0, 255); background-color: rgb(239, 239, 239);">&nbsp;</td>    </tr>    <tr align="center"> <td style="cursor: default; color: rgb(255, 0, 0); background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; background-color: rgb(239, 239, 239);">&nbsp;</td> <td style="cursor: default; color: rgb(0, 0, 255); background-color: rgb(239, 239, 239);">&nbsp;</td>    </tr>      <tr style="display:none;"><td align="center" colspan="7" style="background-color: rgb(239, 239, 239);">      <select name="calendarHour" id="calendarHour" style="font-size:12px;"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option></select>时<span style="display:none;"><select name="calendarMinute" id="calendarMinute" style="font-size:12px;"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option></select>分</span><span style="display:none;"><select name="calendarSecond" id="calendarSecond" style="font-size:12px;"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option></select>秒</span>      </td></tr>    
						</tbody>
						</table>      
						<div align="center" style="padding:4px 4px 4px 4px;background-color:#EFEFEF;">        
						<input name="calendarClear" type="button" id="calendarClear" value="清空" style="border: 1px solid #CCCCCC;background-color:#EFEFEF;width:40px;height:20px;font-size:12px;cursor:pointer;">        
						<input name="calendarToday" type="button" id="calendarToday" value="今天" style="border: 1px solid #CCCCCC;background-color:#EFEFEF;width:60px;height:20px;font-size:12px;cursor:pointer">        
						<input name="calendarClose" type="button" id="calendarClose" value="关闭" style="border: 1px solid #CCCCCC;background-color:#EFEFEF;width:40px;height:20px;font-size:12px;cursor:pointer">     
						</div></div></div>
					</div>
				</li>
				<li class="formli1">
					<p id="youxiang"></p>
					<p class="formcontent">邮箱：</p>
					<p style="color:#F05030; font-size:12px; float:left; margin-top:9px;">${sessionScope.grzyUserInfo[0].email }</p>
					<p style="color:#6B2; font-size:12px; float:left; margin-top:9px;">( 已验证 )</p>
					<a href="" id="changeemail" style="color:#09c; float:left; font-size:12px;margin-top:9px;">更改邮箱</a>
				</li>
				<li class="formli1">
					<p id="phone"></p>
					<p class="formcontent">手机：</p>
					<p style="color:#F05030; font-size:12px; float:left; margin-top:9px;">未绑定手机</p>
					<a href="" id="changeemail" style="color:#09c; float:left; font-size:12px;margin-top:9px; margin-left:5px;">绑定手机</a>
				</li>
				<li class="formli">
					<p class="formcontent" style="margin-left:98px;">城市：</p>
					<input type="text" id="city" name="city" />
					<script type="text/javascript">
						$("#city").click(function(e) {
							SelCity(this,e);
						});
					</script>
				</li>
				<li class="formli">
					<p class="formcontent"  style="margin-left:75px;">街道地址：</p>
					<input type="text" id="street" value="" name="street" class="forminput" maxlength="50" style="width:260px;"/>
				</li>
				<li class="formli">
					<p class="formcontent" style="margin-left:98px;">职业：</p>
					<select name="profession" id="select4" val="请选择职业" class="select basicInfo-career fl valid" aria-invalid="false">
													<option value="请选择职业" selected="selected">请选择职业</option>
													<option value="计算机硬件">计算机硬件</option>
													<option value="计算机软件">计算机软件</option>
													<option value="IT-管理">IT-管理</option>
													<option value="IT-品管、技术支持及其它">IT-品管、技术支持及其它</option>
													<option value="通信技术">通信技术</option>
													<option value="电子/电器/半导体/仪器仪表">电子/电器/半导体/仪器仪表</option>
													<option value="销售管理">销售管理</option>
													<option value="销售人员">销售人员</option>
													<option value="销售行政及商务">销售行政及商务</option>
													<option value="客服及技术支持">客服及技术支持</option>
													<option value="财务/审计/税务">财务/审计/税务</option>
													<option value="证券/金融/投资">证券/金融/投资</option>
													<option value="银行">银行</option>
													<option value="保险">保险</option>
													<option value="生产/营运">生产/营运</option>
													<option value="质量/安全管理">质量/安全管理</option>
													<option value="工程/机械/能源">工程/机械/能源</option>
													<option value="汽车">汽车</option>
													<option value="技工">技工</option>
													<option value="服装/纺织/皮革">服装/纺织/皮革</option>
													<option value="采购">采购</option>
													<option value="贸易">贸易</option>
													<option value="物流/仓储">物流/仓储</option>
													<option value="生物/制药/医疗器械">生物/制药/医疗器械</option>
													<option value="化工">化工</option>
													<option value="医院/医疗/护理">医院/医疗/护理</option>
													<option value="广告">广告</option>
													<option value="公关/媒介">公关/媒介</option>
													<option value="市场/营销">市场/营销</option>
													<option value="影视/媒体">影视/媒体</option>
													<option value="写作/出版/印刷">写作/出版/印刷</option>
													<option value="艺术/设计">艺术/设计</option>
													<option value="建筑工程">建筑工程</option>
													<option value="房地产">房地产</option>
													<option value="物业管理">物业管理</option>
													<option value="人力资源">人力资源</option>
													<option value="高级管理">高级管理</option>
													<option value="行政/后勤">行政/后勤</option>
													<option value="咨询/顾问">咨询/顾问</option>
													<option value="律师/法务">律师/法务</option>
													<option value="教师">教师</option>
													<option value="科研人员">科研人员</option>
													<option value="餐饮/娱乐">餐饮/娱乐</option>
													<option value="酒店/旅游">酒店/旅游</option>
													<option value="美容/健身">美容/健身</option>
													<option value="百货/连锁/零售服务">百货/连锁/零售服务</option>
													<option value="交通运输服务">交通运输服务</option>
													<option value="保安/家政/其他服务">保安/家政/其他服务</option>
													<option value="公务员">公务员</option>
													<option value="翻译">翻译</option>
													<option value="在校学生">在校学生</option>
													<option value="储备干部/培训生/实习生">储备干部/培训生/实习生</option>
													<option value="兼职">兼职</option>
													<option value="其他">其他</option>	
												</select>
				</li>
				<li class="formli">
					<p class="formcontent" style="margin-left:110px;">QQ：</p>
					<input type="text" value="" name="qq" id="qq" class="forminput"/>
				</li>
				<li class="interest">
					<p class="formcontent" style="margin-left:65px;">您感兴趣的：</p>
					<li class="formli" style="width:200px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 结识更多的宠友</p>
					</li>
					<li class="formli" style="width:200px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 记录爱宠的成长</p>
					</li>
					<li class="formli" style="width:200px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 学习、分享养护知识</p>
					</li>
					<li class="formli" style="width:200px; margin-left:137px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 学习、分享宠物训练的方法</p>
					</li>
					<li class="formli" style="width:200px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 在线问诊，得到宠物医院的帮助</p>
					</li>
					<li class="formli" style="width:200px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 更丰富的宠物用品</p>
					</li>
					<li class="formli" style="width:200px;  margin-left:137px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 线下宠友交流活动</p>
					</li>
					<li class="formli" style="width:200px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 领养或转让宠物</p>
					</li>
					<li class="formli" style="width:200px;">
						<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-right:5px;"/>
						<p style="font-size:12px;float:left;"> 宠物爆照、趣味分享</p>
					</li>
				</li>
				<input type="submit" value="提交" id="userInfoSubmit" />
			</form>
			
		</div>
	</div>
	
	<!--收货地址-->
	<style>
		#right_shouhuodizhi{
			width:900px;
			min-height:300px;
			position:relative;
			float:left;
			margin-top:45px;
			margin-left:30px;
			background-color:#FFF;
		}
		#right_shouhuodizhi #newaddress,#addnewdizhi .order1{
			padding-top:30px;
			padding-left:20px;
			font-weight:bold;
			font-size:20px;
		}
		#newaddress .adddizhi{
			text-align:center;
			display:block;
			padding-left:10px;
			padding-right:10px;
			padding-top:5px;
			padding-bottom:5px;
			color:#FFF;
			background-color:#F05030;
			width:140px;
			height:20px;
			font-weight:bold;
			float:left;
			margin-left:20px;
			margin-top:10px;
		}
		#newaddress .adddizhi:hover{
			background-color:#E04020;
		}
		#newaddressForm .formli{
			width:100%;
			margin-top:20px;
			float:left;
		}
		#newaddressForm .formli1 .formcontent{
			font-size:12px;
			float:left;
			line-height:30px;
			color:#6A6666;
		}
		#newaddressForm #bitian{
			color:#F05030;
			text-align:right;
			float:left;
			margin-left:90px;
		}
		#newaddressForm .formli .formcontent,.forminput{
			font-size:12px;
			float:left;
			line-height:20px;
		}
	</style>
	<div id="right_shouhuodizhi" class="clickclass1" style="display:none;">
		<div id="newaddress" style="display:block;">
			<p class="order1">收货地址</p>
			<a class="adddizhi" href="">新增收货地址</a>
		</div>	
		<div id="addnewdizhi" style="display:none;">
			<p class="order1">新增收货地址</p>
			<form id="newaddressForm">
				<li class="formli">
					<p id="bitian">*</p>
					<p class="formcontent">收货人姓名：</p>
					<input type="text" value="" name="" class="forminput"/>
				</li>
				<li class="formli">
					<p id="bitian"  style="margin-left:102px;">*</p>
					<p class="formcontent">所在地区：</p>
					<input type="text" id="addcity" />
					<script type="text/javascript">
						$("#addcity").click(function(e) {
							SelCity(this,e);
						});
					</script>
				</li>
				<li class="formli">
					<p id="bitian"  style="margin-left:102px;">*</p>
					<p class="formcontent">街道地址：</p>
					<input type="text" value="" name="" class="forminput" maxlength="50" style="width:260px;"/>
				</li>
				<li class="formli">
					<p id="bitian"  style="margin-left:102px;">*</p>
					<p class="formcontent">联系方式：</p>
					<input type="text" value="" name="" class="forminput"/>
				</li>
				<li class="formli">
					<p id="bitian"  style="margin-left:102px;">*</p>
					<p class="formcontent">邮政编码：</p>
					<input type="text" value="" name="" class="forminput"/>
				</li>
				<li class="formli">
					<input type="checkbox" name="" value="" class="interesting" style="float:left;margin-left:170px;"/>
					<p style="font-size:12px;float:left;">设为默认地址</p>
				</li>
				<input type="submit" value="保存" id="userInfoSubmit" />
			</form>
		</div>
	</div>
</div>

<style>
	#foot{
		display:block;
		margin-top:20px;
		float:left;
		width:100%;
		border-top:1px solid #CCC;
		padding-top:20px;
		text-align:center;
		background-color:#EFEFEF;
	}
	#foot p{
		text-align:center;
	}
	#foot .foot_lj a{
		border-right:1px solid #999;
		padding-right:10px;
		margin-right:10px;
		color:#000;
		font-size:12px;
	}
	#foot .foot_pic img{
		padding-right:10px;
	}
</style>
<div id="foot">
	<p class="foot_lj">
	<a href="#">关于波奇</a>
    <a href="#">友情链接</a>
    <a href="#">诚聘英才</a>
    <a href="#">联系我们</a>
    <a href="#">网站地图</a>
    <a href="#">意见反馈</a>
    <a href="#">帮助中心</a>
    <a href="#" style="border:none;">最新文章</a>
    </p>
    <p style="color:#999; padding-top:3px;">
    Copyright © 2007-2015, Boqii.com All Rights Reserved 光橙（上海）信息科技有限公司 版权所有 沪ICP备13034501号-2 增值电信业务经营许可证：沪B2-20140120
    </p>
    <p class="foot_pic" style="padding-top:5px;">
    	<a href="#" style="width:36px; height:42px;"><img src="baike_dogimg/sincerity_logo.png"></a>
    	<a href="#" style="width:38px; height:42px;"><img src="baike_dogimg/network_logo.png"></a>
    	<a href="#" style="width:40px; height:42px;"><img src="baike_dogimg/industry_logo.png"></a>
    </p>
</div>
<script>
	//切换商城订单
	$('#shangchengclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#shangchengclick').css("color","#F05030");
		$('#shangchengclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_shangcheng_order").css("display","block");
		return false;
	});
	$('#allshoppingorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#shangchengclick').css("color","#F05030");
		$('#shangchengclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_shangcheng_order").css("display","block");
		return false;
	});
	$('#unpaidorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#shangchengclick').css("color","#F05030");
		$('#shangchengclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_shangcheng_order").css("display","block");
		return false;
	});
	$('#doneorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#shangchengclick').css("color","#F05030");
		$('#shangchengclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_shangcheng_order").css("display","block");
		return false;
	});
	$('#undoorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#shangchengclick').css("color","#F05030");
		$('#shangchengclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_shangcheng_order").css("display","block");
		return false;
	});
	
	//切换服务订单
	$('#fuwuclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#fuwuclick').css("color","#F05030");
		$('#fuwuclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_service_order").css("display","block");
		return false;
	});
	$('#allserviceorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#fuwuclick').css("color","#F05030");
		$('#fuwuclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_service_order").css("display","block");
		return false;
	});
	$('#unpaidserviceorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#fuwuclick').css("color","#F05030");
		$('#fuwuclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_service_order").css("display","block");
		return false;
	});
	$('#doneserviceorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#fuwuclick').css("color","#F05030");
		$('#fuwuclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_service_order").css("display","block");
		return false;
	});
	$('#undoserviceorderclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#fuwuclick').css("color","#F05030");
		$('#fuwuclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_service_order").css("display","block");
		return false;
	});
	
	//切换到货通知
	$('#daohuotongzhiclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#daohuotongzhiclick').css("color","#F05030");
		$('#daohuotongzhiclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_daohuotongzhi").css("display","block");
		return false;
	});
	
	//切换我的收藏
	$('#wodeshoucangclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#wodeshoucangclick').css("color","#F05030");
		$('#wodeshoucangclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_myshoucang").css("display","block");
		return false;
	});
	
	//切换余额
	$('#yueclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#yueclick').css("color","#F05030");
		$('#yueclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_zhanghuyue").css("display","block");
		return false;
	});
	
	//切换波奇豆
	$('#boqidouclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#boqidouclick').css("color","#F05030");
		$('#boqidouclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#boqidou").css("display","block");
		return false;
	});
	
	//切换奖品兑换
	$('#jiangpinduihuanclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#jiangpinduihuanclick').css("color","#F05030");
		$('#jiangpinduihuanclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#jiangpin").css("display","block");
		return false;
	});
	
	//切换咨询回复
	$('#zixunhuifuclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#zixunhuifuclick').css("color","#F05030");
		$('#zixunhuifuclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#zixun").css("display","block");
		return false;
	});
	
	//切换个人资料
	$('#gerenziliaoclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#gerenziliaoclick').css("color","#F05030");
		$('#gerenziliaoclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#gerenziliao").css("display","block");
		return false;
	});
	
	//切换收货地址
	$('#shouhuodizhiclick').click( function (){
		$('.huifu').css("color","#666");
		$('.huifu').css("font-weight","normal");
		$('#shouhuodizhiclick').css("color","#F05030");
		$('#shouhuodizhiclick').css("font-weight","bold");
		$('.clickclass1').css("display","none");
		$("#right_shouhuodizhi").css("display","block");
		return false;
	});
	
	//切换个人主页
	$('#wodeboqiclick').click( function (){
		$('.clickclass1').css("display","none");
		$("#right_index").css("display","block");
		return false;
	});
	
	$('.adddizhi').click( function (){
		$('#newaddress').css("display","none");
		$("#addnewdizhi").css("display","block");
		return false;
	});


	
</script>

</body>
</html>
