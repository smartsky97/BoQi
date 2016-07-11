<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="/BoQi/front/">
<meta charset="utf-8">
<title>波奇网首页</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="shortcut icon" href="indeximg/head11.jpg">
<script type="text/javascript" src="jquery/jquery-1.11.3.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		/*狗狗*/
		$(".yincang1").mouseover(function() {
			$("#dogmenu").show();
			$(".yincang1").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		});
		$(".yincang1").mouseout(function() {
			$("#dogmenu").hide();
			$(".yincang1").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});
		$("#dogmenu").mouseover(function() {
			$("#dogmenu").show();
			$(".yincang1").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		})
		$("#dogmenu").mouseout(function() {
			$("#dogmenu").hide();
			$(".yincang1").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});
		/*猫咪*/
		$(".yincang2").mouseover(function() {
			$("#catmenu").show();
			$(".yincang2").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		});
		$(".yincang2").mouseout(function() {
			$("#catmenu").hide();
			$(".yincang2").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});
		$("#catmenu").mouseover(function() {
			$("#catmenu").show();
			$(".yincang2").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		})
		$("#catmenu").mouseout(function() {
			$("#catmenu").hide();
			$(".yincang2").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});

		/*小宠*/
		$(".yincang3").mouseover(function() {
			$("#smenu").show();
			$(".yincang3").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		});
		$(".yincang3").mouseout(function() {
			$("#smenu").hide();
			$(".yincang3").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});
		$("#smenu").mouseover(function() {
			$("#smenu").show();
			$(".yincang3").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		})
		$("#smenu").mouseout(function() {
			$("#smenu").hide();
			$(".yincang3").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});

		//其他部分的背景颜色的改变
		$(".yincang4").mouseover(function() {
			$(".yincang4").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		});
		$(".yincang4").mouseout(function() {
			$(".yincang4").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});

		$(".yincang5").mouseover(function() {
			$(".yincang5").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		});
		$(".yincang5").mouseout(function() {
			$(".yincang5").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});

		$(".yincang6").mouseover(function() {
			$(".yincang6").css({
				background : "#F33"
			});
			$(".yincang0").css({
				background : "#F66"
			});
		});
		$(".yincang6").mouseout(function() {
			$(".yincang6").css({
				background : "#F66"
			});
			$(".yincang0").css({
				background : "#F33"
			});
		});
		/* 
		 $(".search").click(function(){
		     $(".search").val(function(){
		         return null;
		     });
		 });*/
	});
</script>
</head>

<body>
	<div id="top">
		<div id="left">
			<ul>
				<li><a target="_blank" href="#">波奇网</a>&nbsp;&nbsp;</a>&nbsp;&nbsp;</a></li>
				<li><a target="_blank" href="shoppingindex.jsp">波奇商城</a>&nbsp;&nbsp;</a>&nbsp;&nbsp;</a></li>
				<li><a target="_blank" href="service.html">波奇服务</a>&nbsp;&nbsp;</a>&nbsp;&nbsp;</a></li>
				<li><a target="_blank" href="">波奇论坛</a>&nbsp;&nbsp;</a>&nbsp;&nbsp;</a></li>
				<li><a target="_blank" href="baike.html">波奇百科</a>&nbsp;&nbsp;</a>&nbsp;&nbsp;</a></li>
			</ul>
		</div>
		<div id="right">
			<ul>
				<c:if test="${not empty loginUser }">
    		<li class="login"><a href="user_userInfo.action"><font color="#FF0000" size="2">当前登陆用户:${loginUser.uname }</font></a></li>&nbsp;&nbsp;
			<li class="login"><a href="javascript:loginOut()"><font color="#FF0000" size="2">[注销]</font></a></li>
    	</c:if>
    	<c:if test="${empty loginUser }">
		    <li class="login"><a href="login.html"><font color="#FF0000" size="2">请登录</font></a></li>&nbsp;&nbsp;
			<li class="login"><a href="register.html"><font color="#FF0000" size="2">免费注册</font></a></li>
		</c:if>

				<li class="login"><a target="_blank" href="">微博</a>&nbsp;&nbsp;&nbsp;</a></li>
				<li class="login"><a target="_blank" href="">微信</a>&nbsp;&nbsp;&nbsp;</a></li>
				<li class="login"><a target="_blank" href="">手机</a>&nbsp;&nbsp;&nbsp;</a></li>
			</ul>
		</div>
	</div>
	<div id="searchs">
		<img src="indeximg/logo.gif" style="width: 176px; height: 96px" />
		<center id="search">
			<input type="text" id="keyword" name="keyword" class="search"
				placeholder="请输入词条/文章/问题关键字"> <input type="hidden" name="t"
				id="type" value="4"> <input type="submit" class="search_btn"
				id="button" onclick="search()" name="button" value="搜 索">
			<p>
				热门搜索：<a target="_blank" href="">狗粮</a>&nbsp;<a target="_blank"
					href="">宠物用品</a>&nbsp;<a target="_blank" href="">金毛</a>&nbsp;<a
					target="_blank" href="">贵宾犬</a>&nbsp;<a target="_blank" href="">哈士奇</a>&nbsp;<a
					target="_blank" href="">贵宾</a>&nbsp;<a target="_blank" href="">雪纳瑞</a>&nbsp;<a
					target="_blank" href="">比熊</a>&nbsp;<a target="_blank" href="">更多</a>
			</p>
		</center>
		<img src="indeximg/img82321427969544.gif" class="shouye" />
	</div>
	<div id="menu">
		<ul>
			<li style="background: #F33;" class="yincang0"><a
				target="_blank" href="">首页</a></li>
			<li class="yincang1"><a target="_blank" href="">狗狗</a></li>
			<div id="dogmenu" style="font-size: 13px;">
				<div class="dogmenu">
					<p>
						<a target="_blank" href=""><span>宠物商城&nbsp;></span></a>
					</p>
					<p>
						<a target="_blank" href="">宠物狗粮</a></a>&nbsp;&nbsp;<a target="_blank"
							href="">狗罐头/妙鲜包</a>
					</p>
					<p>
						<a target="_blank" href="">狗狗零食</a></a>&nbsp;&nbsp;<a target="_blank"
							href="">狗狗保健品</a>&nbsp;&nbsp;<a target="_blank" href="">狗狗医疗</a>
					</p>
					<p>
						<a target="_blank" href="">狗狗沐浴露</a></a>&nbsp;&nbsp;<a target="_blank"
							href="">狗狗日用品 
					</p>
					<p>
						<a target="_blank" href="">狗狗美容</a>&nbsp;&nbsp;<a target="_blank"
							href="">狗狗玩具</a>&nbsp;&nbsp;<a target="_blank" href="">衣服/狗窝</a>
					</p>
				</div>
				<div class="dogmenu">
					<p>
						<a target="_blank" href=""><span>狗狗服务&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">洗护</a>&nbsp;&nbsp;<a target="_blank"
							href="">造型</a>&nbsp;&nbsp;<a target="_blank" href="">寄养</a>&nbsp;&nbsp;<a
							target="_blank" href="">体检</a>&nbsp;&nbsp;<a target="_blank"
							href="">绝育</a>
					</p>
					<p>
						&nbsp;&nbsp;<a target="_blank" href="">医疗</a>&nbsp;&nbsp;<a
							target="_blank" href="">摄影</a>&nbsp;&nbsp;<a target="_blank"
							href="">训练</a>&nbsp;&nbsp;<a target="_blank" href="">洗牙</a>
					</p>
				</div>
				<div class="dogright">
					<img src="indeximg/img57721417751190.jpg" />
					<p>
						<a target="_blank" href="">佩玛思进口犬粮</a>
					</p>
					<p>进口原料&nbsp;健康品质</p>
				</div>
				<div class="dogmenu">
					<p>
						<a target="_blank" href=""><span>狗狗论坛&nbsp;>></span><a
							target="_blank" href="">
					</p>
					<p>
						<a target="_blank" href="">哈士奇</a>&nbsp;&nbsp;<a target="_blank"
							href="">萨摩</a>&nbsp;&nbsp;<a target="_blank" href="">贵宾犬</a>&nbsp;&nbsp;<a
							target="_blank" href="">比熊犬</a>
					</p>
					<p>
						<a target="_blank" href="">金毛/拉布拉多</a>&nbsp;&nbsp;<a
							target="_blank" href="">苏牧/喜乐蒂</a>
					</p>
					<p>
						<a target="_blank" href="">雪纳瑞</a>&nbsp;&nbsp;<a target="_blank"
							href="">西施犬/京巴犬</a>
					</p>
					<p>
						<a target="_blank" href="">混血儿论坛</a>&nbsp;&nbsp;<a target="_blank"
							href="">其他</a>
					</p>
				</div>
				<div class="dogmenu">
					<p>
						<a target="_blank" href=""><span>狗狗百科&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">狗狗大全</a>&nbsp;&nbsp;<a target="_blank"
							href="">狗狗饲养</a>&nbsp;&nbsp;<a target="_blank" href="">狗狗训练</a>
					</p>
					<p>
						<a target="_blank" href="">狗狗零食</a>&nbsp;&nbsp;<a target="_blank"
							href="">狗狗保健品</a>&nbsp;&nbsp;<a target="_blank" href="">狗狗医疗</a>
					</p>
					<p>
						<a target="_blank" href="">狗狗医疗</a>&nbsp;&nbsp;<a target="_blank"
							href="">问答专区</a>
					</p>

				</div>
			</div>
			<li class="yincang2"><a target="_blank" href="">猫咪</a></li>
			<div id="catmenu" style="font-size: 13px;">
				<div class="catmenu">
					<p>
						<a target="_blank" href=""><span>猫咪商城&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">宠物猫粮</a>&nbsp;&nbsp;<a target="_blank"
							href="">猫罐头/妙鲜包</a>
					</p>
					<p>
						<a target="_blank" href="">猫猫零食</a>&nbsp;&nbsp;<a target="_blank"
							href="">猫猫保健品</a>&nbsp;&nbsp;<a target="_blank" href="">猫猫医疗</a>
					</p>
					<p>
						<a target="_blank" href="">猫猫香波</a>&nbsp;&nbsp;<a target="_blank"
							href="">日常用品</a>&nbsp;&nbsp;<a target="_blank" href="">猫咪玩具</a>
					</p>
					<p>
						<a target="_blank" href="">猫衣服/猫窝</a>&nbsp;&nbsp;<a
							target="_blank" href="">美容器材</a>
					</p>
				</div>
				<div class="catmenu">
					<p>
						<a target="_blank" href=""><span>猫咪服务&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">洗护</a>&nbsp;&nbsp;<a target="_blank"
							href="">造型</a>&nbsp;&nbsp;<a target="_blank" href="">寄养</a>&nbsp;&nbsp;<a
							target="_blank" href="">体检</a>&nbsp;&nbsp;<a target="_blank"
							href="">绝育</a>
					</p>
					<p>
						&nbsp;&nbsp;<a target="_blank" href="">医疗</a>&nbsp;&nbsp;<a
							target="_blank" href="">摄影</a>&nbsp;&nbsp;<a target="_blank"
							href="">训练</a>&nbsp;&nbsp;<a target="_blank" href="">洗牙</a>
					</p>
				</div>
				<div class="catright">
					<img src="indeximg/img57721417751190.jpg" />
					<p>
						<a target="_blank" href="">佩玛思进口猫粮</a>
					</p>
					<p>进口原料&nbsp;健康品质</p>
				</div>
				<div class="catmenu">
					<p>
						<a target="_blank" href=""><span>猫咪论坛&nbsp;></span><a
							target="_blank" href="">
					</p>
					<p>
						<a target="_blank" href="">猫咪论坛</a>
					</p>
				</div>
				<div class="catmenu">
					<p>
						<a target="_blank" href=""><span>猫咪百科&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">猫咪大全</a>&nbsp;&nbsp;<a target="_blank"
							href="">猫咪饲养</a>&nbsp;&nbsp;<a target="_blank" href="">猫咪训练</a>
					</p>
					<p>
						<a target="_blank" href="">猫咪零食</a>&nbsp;&nbsp;<a target="_blank"
							href="">猫咪保健品</a>&nbsp;&nbsp;<a target="_blank" href="">猫咪医疗</a>
					</p>
					<p>
						<a target="_blank" href="">猫咪医疗</a>&nbsp;&nbsp;<a target="_blank"
							href="">问答专区</a>
					</p>

				</div>
			</div>
			<li class="yincang3"><a target="_blank" href="">小宠</a></li>
			<div id="smenu" style="font-size: 13px;">
				<div class="smenu">
					<p>
						<a target="_blank" href=""><span>小宠商城&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">兔兔用品</a>&nbsp;&nbsp;<a target="_blank"
							href="">仓鼠用品</a>&nbsp;&nbsp;<a target="_blank" href="">龙猫用品</a>
					</p>
					<p>
						<a target="_blank" href="">天竺鼠用品</a>
					</p>
				</div>
				<div class="smenu">
					<p>
						<a target="_blank" href=""><span>小宠论坛&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">小宠水族论坛</a>
					</p>

				</div>
				<div class="sright">
					<img src="indeximg/img57721417751190.jpg" />
					<p>
						<a target="_blank" href="">MA29玛莎仓鼠粮食500g</a>
					</p>
					<p>仓鼠首选粮</p>
				</div>
				<div class="smenu">
					<p>
						<a target="_blank" href=""><span>小宠百科&nbsp;>></span></a>
					</p>
					<p>
						<a target="_blank" href="">小宠大全</a>&nbsp;&nbsp;<a target="_blank"
							href="">小宠饲养</a>&nbsp;&nbsp;<a target="_blank" href="">小宠训练</a>
					</p>
					<p>
						<a target="_blank" href="">小宠医疗</a>&nbsp;&nbsp;<a target="_blank"
							href="">问答专区</a>
					</p>

				</div>
			</div>
			<li class="yincang4"
				style="background-image: url(indeximg/service.png); background-repeat: no-repeat; padding-left: 30px;"><a
				target="_blank" href="service.html">波奇服务</a></li>
			<li class="yincang5"
				style="background: url(indeximg/car.png) no-repeat 1px; padding-left: 30px;"><a
				target="_blank" href="%E8%B4%AD%E7%89%A9%E4%B8%BB%E9%A1%B5.html">波奇商城</a></li>
			<li class="yincang6"
				style="float: right; margin-right: 100px; background: url(indeximg/phone.png) no-repeat 1px; padding-left: 30px;"><a
				target="_blank" href="">波奇无线</a></li>
		</ul>
	</div>
	<div id="forth">
		<div id="beijing">
			<ul>
				<li><img src="indeximg/img11195636db1a29f15.jpg" class="11"
					style="display: block" /></li>
				<li><img src="indeximg/img665055f0e934a5e2f.jpg" class="12"
					style="display: none" /></li>
				<li><img src="indeximg/img51465620c7b1a43e5.jpg" class="13"
					style="display: none" /></li>
				<li><img src="indeximg/img4494563c0f2e02b73.jpg" class="14"
					style="display: none" /></li>
				<li><img src="indeximg/img2096562dcb20cce60.jpg" class="15"
					style="display: none" /></li>
			</ul>
			<div id="spans">
				<span class="b11">1</span>
				<span class="b12">2</span>
			    <span class="b13">3</span>
			    <span class="b14">4</span>
			    <span class="b15">5</span>
			</div>
		</div>
		<div id="parts">
			<div class="onepart">
				<p class="shopping">波奇商城</p>
				<p class="discount">
					<a target="_blank" href="boqi_shoppingindex.action">万件宠物用品一网打尽购实惠</a>
				</p>
			</div>
			<div class="onepart">
				<p class="fuwu">波奇服务</p>
				<p class="discount">
					<a target="_blank" href="service.html">涵盖宠物美容/寄养/绝育等服务</a>
				</p>
			</div>
			<div class="onepart">
				<p class="luntan">波奇论坛</p>
				<p class="discount">
					<a target="_blank" href="">精彩宠物世界</a>
				</p>
			</div>
			<div class="onepart">
				<p class="baike">宠物百科</p>
				<p class="discount">
					<a target="_blank" href="baike.html">为爱宠的健康生活保驾护航</a>
				</p>
			</div>
		</div>
	</div>
	<div id="newsparper">
		<a target="_blank" href="">
			<div id="youka">
				</br>
				<p style="color: grey; font-size: 14px;">买即送加量礼包</p>
				<p>优卡冠军粮</p>
				<img src="indeximg/img4648561f18c77ff53.jpg" />
		</a>
	</div>
	<a target="_blank" href="">
		<div id="jiadi">
			</br>
			<p style="color: grey; font-size: 14px;">买2包80元</p>
			<p>嘉蒂猫砂</p>
			<img src="indeximg/img568755f9322a7f34c.jpg" />
		</div>
	</a>
	<a target="_blank" href="">
		<div id="yiqin1">
			</br>
			<p style="color: grey; font-size: 14px;">34元任选两件</p>
			<p>怡亲零食</p>
			<img src="indeximg/img8189561f19161c88f.jpg" />
		</div>
	</a>
	<a target="_blank" href="">
		<div id="yiqin2">
			</br>
			<p style="color: grey; font-size: 14px;">专属猫咪乐园</p>
			<p>怡亲猫爬架</p>
			<img src="indeximg/img990855f932de5bfcb.jpg" />
		</div>
	</a>
	<a target="_blank" href="">
		<div id="boqinews">
			<p>波奇快报</p>
			<ul>
				<li>波奇宠物官方QQ群</li>
				<li>百科专家团队为您答疑解惑</li>
			</ul>
		</div>
	</a>
	</div>
	<div id="dogs">
		<img src="indeximg/dog.png" />
	</div>
	<div class="contentup">
		<div class="threeimgs">
			<ul>
				<li><img src="indeximg/img776355f9334635369.jpg" class="1"
					style="display: block;" /></li>
				<li><img src="indeximg/img201155f9335268333.jpg" class="2"
					style="display: none;" /></li>
				<li><img src="indeximg/img405355f93364396dd.jpg" class="3"
					style="display: none;" /></li>
			</ul>
			<div class="spans">
				<span class="a1"></span> <span class="a2"></span> <span class="a3"></span>
			</div>
		</div>
		<div class="product" style="position: relative;">
			<p>
				<a target="_blank" href="shopping.html">皇家狗粮</a>
			</p>
			<c:forEach items="${sessionScope.indexProductBeans}" var="item">
				<dl class="food1">
					<dd>
						<c:choose>
							<c:when test="${fn:contains(item.pictrue,',')}">
								<img src="../upload/${fn:substringBefore(item.pictrue,',' ) }"
									alt="图片暂时为空" style="width: 100px; height: 100px;"
									name="pictrue" />
							</c:when>
							<c:otherwise>
								<img src="../upload/${item.pictrue }" alt="图片暂时为空"
									style="width: 100px; height: 100px;" />
							</c:otherwise>
						</c:choose>
					</dd>
					<dt style="color: #000; font-size: 15px;">
						<a target="_blank" href="shopping.html" name="proname">${item.proname}</a>
						</br> <a target="_blank" href="shopping.html" name="prointro"
							style="color: grey">${item.prointro}</a>
					</dt>
				</dl>
			</c:forEach>
		</div>
		<div class="service">
			<p>
				<a target="_blank" target="_blank" href="">狗狗服务</a>
			</p>
			<dl>
				<dd>
					<img src="indeximg/img58861417142669.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">狗狗洗护</a>
				</dt>
				<dt>新用户立减10元</dt>
			</dl>
			<dl>
				<dd>
					<img src="indeximg/img91091419929245.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">狗狗造型</a>
				</dt>
				<dt>只选择高品质宠物店</dt>
			</dl>
			<dl>
				<dd>
					<img src="indeximg/img10391419929309.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">狗狗寄养</a>
				</dt>
				<dt>假日看护</dt>
			</dl>
		</div>
	</div>
	<div class="contentdown">
		<div class="left">
			<a target="_blank" href="">狗狗论坛</a>
			<ul>
				<li><img src="indeximg/avatar666555ae059aa6fd1.jpg" />
					<p style="color: #000; font-size: 15px">
						<a target="_blank" href="">寒风瑟瑟添衣保暖咯</a>
					</p>
					<p>我喜欢冬天遛狗.....</p></li>
				<li><br /> <img src="indeximg/avatar1422417765_b.jpg" />
					<p style="color: #000; font-size: 15px">
						<a target="_blank" href="">巴克百变秀</a>
					</p>
					<p>卡斯柯话费卡速度来...</p></li>
			</ul>
		</div>
		<div class="center">
			<a target="_blank" href="">狗狗百科</a>
			<p style="color: #000; font-size: 15px">
				<a target="_blank">给狗狗清理便便的好处</a>
			</p>
			<p>普通的流浪犬如果在路上随便排便我们可能不好及时阻止，但是如果是自己饲养的宠物犬在路上排便，作为饲养者的我们应当及时的将其清理干净。</p>
			<img src="indeximg/imagick26761446454997_s.jpg" />
		</div>
		<div class="right"
			style="background: url(indeximg/dog.jpg) no-repeat; background-size: cover;">
			<a target="_blank" href="">狗狗品种大全</a>
			<p style="margin-top: 100px;">狗狗的籍贯,体型,寿命....</p>
		</div>
	</div>
	<div id="cats">
		<img src="indeximg/cat.png" />
	</div>
	<div class="contentup">
		<div class="threeimgs">
			<ul>
				<li><img src="indeximg/img4676564611a2f290b.jpg" class="1"
					style="display: block;" /></li>
				<li><img src="indeximg/img4989564611829a507.jpg" class="2"
					style="display: none;" /></li>
				<li><img src="indeximg/img5014564611b77b389.jpg" class="3"
					style="display: none;" /></li>
			</ul>
			<div class="spans">
				<span class="a1"></span> <span class="a2"></span> <span class="a3"></span>
			</div>
		</div>
		<div class="product">
			<p>
				<a target="_blank" href="">猫咪用品</a>
			</p>
			<c:forEach items="${sessionScope.indexProductBeans2}" var="item">
				<dl class="food1">
					<dd>
						<c:choose>
							<c:when test="${fn:contains(item.pictrue,',')}">
								<img src="../upload/${fn:substringBefore(item.pictrue,',' ) }"
									alt="图片暂时为空" style="width: 100px; height: 100px;"
									name="pictrue" />
							</c:when>
							<c:otherwise>
								<img src="../upload/${item.pictrue }" alt="图片暂时为空"
									style="width: 100px; height: 100px;" />
							</c:otherwise>
						</c:choose>
					</dd>
					<dt style="color: #000; font-size: 15px;">
						<a target="_blank" href="shopping.html" name="proname">${item.proname}</a>
						</br> <a target="_blank" href="shopping.html" name="prointro"
							style="color: grey">${item.prointro}</a>
					</dt>
				</dl>
			</c:forEach>
		</div>
		<div class="service">
			<p>
				<a target="_blank" href="">猫咪服务</a>
			</p>
			<dl>
				<dd>
					<img src="indeximg/img54921419929361.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">猫咪洗护</a>
				</dt>
				<dt>猫奴必备，免去寻找的烦恼</dt>

			</dl>
			<dl>
				<dd>
					<img src="indeximg/img38641417162636.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">猫咪寄养</a>
				</dt>
				<dt>假日猫咪去哪儿</dt>

			</dl>
			<dl>
				<dd>
					<img src="indeximg/img15031417162645.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">猫咪绝育</a>
				</dt>
				<dt>只选好的医院提供好的服务</dt>

			</dl>
		</div>
	</div>
	<div class="contentdown">
		<div class="left">
			<a target="_blank" href="">猫咪论坛</a>
			<ul>
				<li><img src="indeximg/head1.jpg" />
					<p style="color: #000; font-size: 15px">
						<a target="_blank" href="">女汉子的行为你看得懂吗？</a>
					</p>
					<p>我家的猫咪调皮捣蛋.....</p></li>
				<li><br /> <img src="indeximg/cat.jpg" />
					<p style="color: #000; font-size: 15px">
						<a target="_blank" href="">为什么猫咪被抚摸时会竖起尾巴?</a>
					</p>
					<p>很多猫奴都有这样的体验.....</p></li>
			</ul>
		</div>
		<div class="center">
			<a target="_blank" href="">猫咪百科</a>
			<p style="color: #000; font-size: 15px">
				<a target="_blank">不要让你的猫咪变成肉球</a>
			</p>
			<p>猫咪健康的表现是体型健壮。毛色有光泽，然而这种健壮也需要有个度，如果过度就变成肉球了，添个毛都不方便。那就影响猫咪的正常生活了。</p>
			<img src="indeximg/imagick45671447058636_s.jpg" />
		</div>
		<div
			style="background: url(indeximg/cat.jpg) no-repeat; background-size: cover;"
			class="right">
			<a target="_blank" href="">猫咪品种大全</a>
			<p style="margin-top: 100px;">你知道世界上有多少种猫咪吗？</p>
		</div>
	</div>
	<div id="smallcute">
		<img src="indeximg/scutte.png" />
	</div>
	<div class="contentup">
		<div class="threeimgs">
			<ul>
				<li><img src="indeximg/img776355f9334635369.jpg" class="1"
					style="display: block;" /></li>
				<li><img src="indeximg/img201155f9335268333.jpg" class="2"
					style="display: none;" /></li>
				<li><img src="indeximg/img405355f93364396dd.jpg" class="3"
					style="display: none;" /></li>
			</ul>
			<div class="spans">
				<span class="a1"></span> <span class="a2"></span> <span class="a3"></span>
			</div>
		</div>
		<div class="product">
			<p>
				<a target="_blank" href="">小宠热门用品</a>
			</p>
			<c:forEach items="${sessionScope.indexProductBeans3}" var="item">
				<dl class="food1">
					<dd>
						<c:choose>
							<c:when test="${fn:contains(item.pictrue,',')}">
								<img src="../upload/${fn:substringBefore(item.pictrue,',' ) }"
									alt="图片暂时为空" style="width: 100px; height: 100px;"
									name="pictrue" />
							</c:when>
							<c:otherwise>
								<img src="../upload/${item.pictrue }" alt="图片暂时为空"
									style="width: 100px; height: 100px;" />
							</c:otherwise>
						</c:choose>
					</dd>
					<dt style="color: #000; font-size: 15px;">
						<a target="_blank" href="shopping.html" name="proname">${item.proname}</a>
						</br> <a target="_blank" href="shopping.html" name="prointro"
							style="color: grey">${item.prointro}</a>
					</dt>
				</dl>
			</c:forEach>
		</div>
		<div class="service">
			<p>
				<a target="_blank" href="">小宠用品分类</a>
			</p>
			<dl>
				<dd>
					<img src="indeximg/img58861417142669.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">仓鼠用品</a>
				</dt>
				<dt>主粮，磨牙，水壶食盆，玩具</dt>

			</dl>
			<dl>
				<dd>
					<img src="indeximg/img91091419929245.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">龙猫用品</a>
				</dt>
				<dt>主粮，磨牙，水壶食盆，玩具</dt>

			</dl>
			<dl>
				<dd>
					<img src="indeximg/img10391419929309.jpg" />
				</dd>
				<dt style="color: #000; font-size: 16px;">
					<a target="_blank" href="">兔子用品</a>
				</dt>
				<dt>主粮，磨牙，水壶食盆，玩具</dt>

			</dl>
		</div>
	</div>
	<div class="contentdown">
		<div class="left">
			<p>
				<a target="_blank" href="">小宠论坛</a>
			</p>
			<ul>
				<li><img src="indeximg/avatar666555ae059aa6fd1.jpg" /> <a
					target="_blank" href="">虎皮鹦鹉自己改造的"栖绳"</a>
					<p>白天走的时候大概是忘了关门,晚上回来时的时候.....</p></li>
				<li><br /> <img src="indeximg/avatar1422417765_b.jpg" />
					<p style="color: #000; font-size: 15px">
						<a target="_blank" href="">兔子需不需要洗澡？</a>
					</p>
					<p>兔子是很干净的动物，几乎从不需要洗澡....</p></li>
			</ul>
		</div>
		<div class="center">
			<a target="_blank" href="">小宠百科</a>
			<p style="color: #000; font-size: 15px">
				<a target="_blank" href="">如何挑选乖巧的龙猫</a>
			</p>
			<p>多数人挑选宠物的准则就是乖巧听话，所以在宠物店挑选宠物时，只要哪一个对我们表现的比较顺从，且愿意让自己抱起来，就会选择它，不过这一方法对于龙猫来说可能并不是很实用。</p>
			<img src="indeximg/imagick26761446454997_s.jpg" />
		</div>
		<div class="right"
			style="background: url(indeximg/small.jpg) no-repeat; background-size: cover;">
			<a target="_blank" href="">小宠品种大全</a>
			<p style="margin-top: 100px;">萌宠，是美眉们的饲养首选....</p>
		</div>
	</div>
	<div id="promise">
		<img src="indeximg/2015-11-11_192919.png" />
	</div>
	<div id="friends">
		<p>友情链接</p>
		<p>五笔输入法 爱秀美女性网 养生网 iphone游戏 搞笑图片</p>
		<p>免费发布信息</p>
		<p>上海特卖会</p>
	</div>
	<div id="contact">
		<div class="wuxian">
			<p>波奇无线</p>
			<p>"波奇宠物"APP,首次下单满39元送39元！</p>
		</div>
		<div class="weixing">
			<p>官方微信</p>
			<p>公众哈:boqiwang</p>
			<p>扫描二维码，关注身边的萌宠趣事!</p>
		</div>
		<div class="weibo">
			<p>官方微博</p>
			<p>波奇网</p>
		</div>
	</div>
	<div id="foot">
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
					<span>Copyright 2007-2015 Boqii.com All Rights Reserved
						光橙（上海）信息科技有限公司 版权所有</span> <a href="#" target="_blank"
						onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪ICP备13034501号-2</a>
					<span>增值电信业务经营许可证：</span> <a href="#" target="_blank"
						onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪B2-20140120</a>
				</p>
				<p id="footimg">
					<a href="#" target="_blank"> <img width="100" height="35"
						src="registerimg/foot_gs.png">
					</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="registerimg/foot_kx.png">
					</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="registerimg/foot_zx.png">
					</a> <a href="#" target="_blank"> <img width="100" height="35"
						src="registerimg/foot_cx.png">
					</a>
				</p>
			</div>
		</div>
	</div>
	<script language="javascript">
function loginOut(){
	window.location.href="user_loginOut.action";
}
//顶部背景图片轮播
var counts = 12;
var myTimes;
function shows() {
	for (var j = 11; j <= 15; j++) {
		if (counts == j) {
			// document.getElementsByClassName(j).parentNode.style.display = "block";
			document.getElementsByClassName(j)[0].style.display = "block";
			document.getElementsByClassName('b' + j)[0].style.backgroundColor = "red";
		} else {
			//document.getElementsByClassName(j).parentNode.style.display = "none";
			document.getElementsByClassName(j)[0].style.display = "none";
			document.getElementsByClassName('b' + j)[0].style.backgroundColor = "grey";
		}
	}
	counts += 1;
	if (counts > 15) {
		counts = 11;
	}
}

	//中间图片轮播
	var count = 2;
	var myTime;
	function show() { //图片自动轮播
		for (var i = 1; i <= 3; i++) {
			for (var a = 0; a <= 2; a++) {
				if (count == i) {
					//console.info(document.getElementsByClassName(i)[a].length);
					document.getElementsByClassName(i)[a].parentNode.style.display = "block";
					document.getElementsByClassName(i)[a].style.display = "block";
					document.getElementsByClassName('a' + i)[a].style.backgroundColor = "red";
				} else {
					document.getElementsByClassName(i)[a].parentNode.style.display = "none";
					document.getElementsByClassName(i)[a].style.display = "none";
					document.getElementsByClassName('a' + i)[a].style.backgroundColor = "grey";
				}
			}
		}
		count += 1;
		if (count > 3) {
			count = 1;
		}
	}
	window.onload = function() {
		myTimes = setInterval(shows, 2000);
		for (var j = 11; j <= 15; j++) {
			var sp = document.getElementsByClassName("b" + j)[0];
			sp.onmouseover = function() {
				for (var j = 11; j <= 15; j++) {
					if (counts == j) {
						document.getElementsByClassName(j)[0].style.display = "block";
						document.getElementsByClassName('b' + j)[0].style.backgroundColor = "red";
					} else {
						document.getElementsByClassName(j)[0].style.display = "none";
						document.getElementsByClassName('b' + j)[0].style.backgroundColor = "grey";
					}
				}
			}
		}
		var jDom = document.getElementById("beijing");
		jDom.onmouseout = function() {
			myTimes = setInterval(shows, 2000);
			//myTimes=window.setTimeout('shows()',1000);
		}
		jDom.onmouseover = function() {
			clearInterval(myTimes);
		}
		myTime = setInterval(show, 2000);
		for (var i = 1; i <= 3; i++) {
			var jp = document.getElementsByClassName("a" + i)[0];
			jp.onmouseover = function() {
				for (var i = 1; i <= 3; i++) {
					if (this == document.getElementsByClassName("a" + i)[0]) {
						document.getElementsByClassName(i)[0].parentNode.style.display = "block";
						document.getElementsByClassName(i)[0].style.display = "block";
						document.getElementsByClassName('a' + i)[0].style.backgroundColor = "red";
					} else {

						document.getElementsByClassName(i)[0].parentNode.style.display = "none";
						document.getElementsByClassName(i)[0].style.display = "none";
						document.getElementsByClassName('a' + i)[0].style.backgroundColor = "grey";
					}
				}
			}
		}
		var iDom = document.getElementsByClassName("threeimgs")[0];
		iDom.onmouseout = function() {
			//myTime=window.setTimeout('show()',1000);
			myTime = setInterval(show, 2000);
		}
		iDom.onmouseover = function() {
			clearInterval(myTime);
		}
	}
</script>
</body>
</html>
<script type="text/javascript" src="js/shoppingSearch.js"></script>

