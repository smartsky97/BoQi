<%@ page  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html >
<head>
<meta charset="utf-8" />
<title>个人中心</title>

<link href="css/baike1.css" rel="stylesheet"/>
<link href="css/userInfo.css" rel="stylesheet"/>
<link href="js/login.js" rel="stylesheet" type="text/javascript"/>
<link rel="stylesheet" href="css/mysearchstyle.css" type="text/css" />
<script>
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
    	<li><a href="#">波奇网</a></li><li><a href="#">波奇商城</a></li><li><a href="#">波奇服务</a></li><li><a href="#">波奇论坛</a></li><li id="baike"><a href="#">宠物百科</a></li><li id="userName">上午好,shawnlcy</li><li id="exit"><a href="#">退出</a></li><li id="weibo1"><a href="#"><img src="baike_dogimg/weibo.jpg" id="weibologo">微博</a></li><li id="weixin1"><a href="#"><img src="baike_dogimg/weixin.jpg" id="weixinlogo"/>微信</a></li><li><a href="#"><img src="baike_dogimg/shouji.jpg" id="phonelogo"/>手机版</a></li>
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
	margin-left:450px;
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
    	<li class="myboqi"><a href="#">我的波奇</a></li>
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
    <div>
		<div class="zySearch" id="zySearch"></div>
	
		<script type="text/javascript" src="jquery-1.7.2.js"></script>
		<script type="text/javascript" src="mySearch.js"></script>
		<script type="text/javascript">
		$("#zySearch").zySearch({
		"width":"355",
		"height":"33",
		"parentClass":"pageTitle",
		"callback":function(keyword){
		console.info("搜索的关键字");
		console.info(keyword);
	}
});
</script>	
	</div>
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
		margin-left:450px;
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
			<dd><a href="#">商城订单</a></dd>
			<dd><a href="#">服务订单</a></dd>
			<dd><a href="#">退货记录</a></dd>
			<dd><a href="#">到货通知</a></dd>
			<dd><a href="#">我的收藏</a></dd>
		</dl>
		<dl>
			<dt>资金管理</dt>
			<dd><a href="#">余额</a></dd>
			<dd><a href="#">波奇豆</a></dd>
			<dd><a href="#">优惠券</a></dd>
			<dd><a href="#">奖品兑换</a></dd>
		</dl>
		<dl>
			<dt>消息管理</dt>
			<dd><a href="#">咨询回复</a></dd>
			<dd><a href="#">系统通知</a></dd>
			<dd><a href="#">私信</a></dd>
		</dl>
		<dl>
			<dt>个人设置</dt>
			<dd><a href="#">个人资料</a></dd>
			<dd><a href="#">安全设置</a></dd>
			<dd><a href="#">收货地址</a></dd>
			<dd><a href="#">绑定帐号</a></dd>
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
	<div class="right_index">
		<div class="right_index_1">
			<div class="right_index_1_left">
				<img src="baike_dogimg/none1.gif">
				<div class="left_content">
					<li><p style="color:#F05030;">shawnlcy</p><p>,欢迎回来！</p><a href="#">编辑个人资料</a></li><br/>
					<li><p>会员级别:&nbsp;<strong class="viplevel">V1</strong></p><p>(经验值:0，还差300可升级到<strong class="viplevel">V2</strong>)</p><a href="#">如何获取经验值?</a></li><br/>
					<li><p>账户安全:&nbsp;</p><div class="safelevel"></div><a href="#">安全设置</a><li>
				</div>
				<div class="right_content">
					<dl>
						<dt>我的资产</dt>
						<dd><p>现金余额：</p><h4>￥${sessionScope.grzyUserInfo[0].money}</h4></dd>
						<dd><p>波奇豆：</p><h4>${sessionScope.grzyUserInfo[0].bqdou}</h4>
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
		.right_index_2 .allshoppingorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat 0 -100px;
			background-color:#FCB;
		}
		.right_index_2 .unpaidorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -100px;
			background-color:#FCB;
		}
		.right_index_2 .doneorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -0px -170px;
			background-color:#FCB;
		}
		.right_index_2 .undoorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -170px;
			background-color:#FCB;
		}
		.right_index_2 dd{
			margin-top:5px;
			font-size:14px;
			text-align:center;
		}
	</style>
		<div class="right_index_2">
			<p>商城实物订单（shop.boqi.com）</p><a href="#">去波奇商城逛逛 >></a><br/>
		<div class="left_order">
			<dl>
				<dt><div class="allshoppingorder"></div></dt>
				<dd>全部商城订单</dd>
			</dl>
			<dl>
				<dt><div class="unpaidorder"></div></dt>
				<dd>待支付  ${sessionScope.weizhifu}</dd>
			</dl>
			<dl>
				<dt><div class="doneorder"></div></dt>
				<dd>已完成  ${sessionScope.finish}</dd>
			</dl>
			<dl>
				<dt><div class="undoorder"></div></dt>
				<dd>待评价  ${sessionScope.pingjia}</dd>
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
		.right_index_3 .allserviceorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat 0 -100px;
			background-color:#FFD6A6;
		}
		.right_index_3 .unpaidorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -100px;
			background-color:#FFD6A6;
		}
		.right_index_3 .doneorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -0px -170px;
			background-color:#FFD6A6;
		}
		.right_index_3 .undoorder{
			width:60px;
			height:60px;
			background:url(baike_dogimg/sprites.png) no-repeat -70px -170px;
			background-color:#FFD6A6;
		}
		.right_index_3 dd{
			margin-top:5px;
			font-size:14px;
			text-align:center;
		}
		</style>
		<div class="right_index_3">
			<p>服务订单（vet.boqi.com）</p><a href="#">去波奇服务看看 >></a><br/>
		<div class="right_order">
			<dl>
				<dt><div class="allserviceorder"></div></dt>
				<dd>全部服务订单</dd>
			</dl>
			<dl>
				<dt><div class="unpaidorder"></div></dt>
				<dd>待支付 ${sessionScope.weizhifu}</dd>
			</dl>
			<dl>
				<dt><div class="doneorder"></div></dt>
				<dd>已完成 ${sessionScope.finish}</dd>
			</dl>
			<dl>
				<dt><div class="undoorder"></div></dt>
				<dd>待评价 ${sessionScope.pingjia}</dd>
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
			height:0px auto;
			float:left;
			margin-top:10px;
			margin-left:20px;
			border:2px solid #F6F3F3;
			margin-bottom:10px;
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
						<OPTION value="1">待付款</OPTION>
						<OPTION value="2">处理中</OPTION>
						<OPTION value="3">待评价</OPTION>
						<OPTION value="4">已完成</OPTION>
					</select>
				</th>
				<th class="operate" style="width:auto;height:30px">操作</th>
			</tr>
 　　		<tbody>
 　　　　		
 				<c:choose>
 					<c:when test="${not empty sessionScope.grzyOrderInfo}">
 						<c:forEach items="${sessionScope.grzyOrderInfo }" var="order">
 						<tr>
 							<td style="text-align: center;">${order.orderid }</td>
 							<td style="text-align: center;">${order.proname }</td>
 							<td style="text-align: center;">${order.addname }</td>
 							<td style="text-align: center;">${order.ordersum }</td>
 							<td style="text-align: center;">
 								<c:if test="${order.status eq 0}">已取消</c:if>
 								<c:if test="${order.status eq 1}">待付款</c:if>
 								<c:if test="${order.status eq 2}">待发货</c:if>
 								<c:if test="${order.status eq 3}">待收货</c:if>
 								<c:if test="${order.status eq 4}">交易完成</c:if>
 								<c:if test="${order.status eq 5}">已退货</c:if>
 								<c:if test="${order.status eq 6}">待评价</c:if>
 							</td>
 							<td style="text-align: center;"><a href="user_deleteOrder.action?orderid=${order.orderid }">删除订单</a></td>
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
</div>
</body>
</html>
