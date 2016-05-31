<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	  <head>
	   
	   <title>购物商城</title>
	   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/shoppingindex.css" type="text/css" rel="stylesheet"> 
	<link href="css/publicThing.css" type="text/css" rel="stylesheet"> 
	
	<script  type="text/javascript" src="js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="js/slides.min.jquery.js"></script>
 </head>
	<!--顶部-->
	<body>
	
	<%@include file="publicThing.jsp" %>

	<!--头部搜索处-->
	<div id="header">
		<div class="smallHeader">
	        <div class="innerHeader left">
	            <img src="shoppingindeximg/logo.png"> 
	        </div>
	        <div class='search left'>
	            <div class='inSearch'><!--搜索处-->
	                
	                    <input type="text" id="searchBox" class="search2"  placeholder="请输入商品名称！">
	                    <input type="submit" id="searchClick"  onclick="search2()"  value="搜索">
	                
	            </div>
	            <div class='hotSearch'>
	            	最热门的：
	                <span><a href="#" target="_blank">火鸡</a></span>
	                <span><a href="#" target="_blank">哈哈狗粮</a></span>
	                <span><a href="#" target="_blank">咪咪猫粮</a></span>
	                <span><a href="#" target="_blank">咯咯猫食</a></span>
	                <span><a href="#" target="_blank">火力窝窝</a></span>
	            </div>
	        </div>
	    </div>
	</div>
	<!--导航栏-->
	<div id='nav'>
		<div class="nav_auto">
	        <div class="nav_left left">
	            <a href="#">
	                <span>全部商品分类</span>
	            </a>    
	        </div>
	        <div class='nav left'>
	       		<a href="#" title="波奇商城" class="current">首页</a>
	            <a href="#" title="狗狗" target="_blank">狗狗</a>
	            <a href="#" title="猫猫" target="_blank">猫猫</a>
	            <a href="#" title="小宠" target="_blank">小宠</a>
	            <a href="#" title="水族" target="_blank">水族</a>
	            <a href="#" title="品牌馆" target="_blank">品牌馆</a>
	            <a href="#" title="团购" target="_blank">团购</a>
	            <a href="service.html" title="波奇服务" target="_blank">波奇服务</a>
	        </div>
	        <div class="shop_car" style="display:none;">
	        	
	        </div>
		</div>
	</div>
	<!--详细导航分类-->
	<div id="showNav">
		<div class="inshowNav">
			<!--左侧分类-->
	       <div  class='inshowleft left'> 
	           <div class='in_list'>
	           	<!--能显示的一部分-->
	           	<div class='in_list_1' style="height:93px;">
	               	<div class="show_tit">
	                   	<em></em>
	                       <a href='#' target="_blank">狗狗商品</a>
	                       <span></span>
	                   </div>
	                   <div class="show_body">
	                   	<span>
	                       	<a href="shopping.html" target="_blank">狗粮</a>
	                       </span>
	                       <span>
	                       	<a href="shopping.html" target="_blank">狗罐头</a>
	                       </span>
	                       <span>
	                       	<a href="shopping.html" target="_blank">狗零食</a>
	                       </span>
	                       <span>
	                       	<a href="shopping.html" target="_blank">医疗</a>
	                       </span>
	                       <span>
	                       	<a href="shopping.html" target="_blank">保健</a>
	                       </span>
	                       <span>
	                       	<a href="shopping.html" target="_blank">沐浴露</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">日用品</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">玩具</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">衣服</a>
	                       </span>
	                   </div>
	               </div>
	               <!--没有显示的一部分-->
	               <div class="condiv0 con" style="display:none">
	               	<div class="condiv0_1  condiv_tong">
	                   	<dl class="ttop">
	                       	<dt><a href="shopping.html" target="_blank">宠物狗粮</a></dt>
	                           <dd>|
	                           	<a href="shopping.html" target="_blank">离乳期犬粮</a>|
	                               <a href="shopping.html" target="_blank">幼犬粮</a>|
	                               <a href="shopping.html" target="_blank">成犬粮</a>|
	                               <a href="shopping.html" target="_blank">老犬粮</a>|
	                               <a href="shopping.html" target="_blank">全犬粮</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">狗罐头/妙鲜包</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">成犬</a>|
	                               <a href="#" target="_blank">幼犬</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">狗狗零食</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">肉质零食</a>|
	                               <a href="#" target="_blank">咬骨咬胶</a>|
	                               <a href="#" target="_blank">奶质零食</a>|
	                               <a href="#" target="_blank">饼干素食</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">狗狗保健品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">美毛护肤</a>|
	                               <a href="#" target="_blank">补钙强骨</a>|
	                               <a href="#" target="_blank">微量矿物</a>|
	                               <a href="#" target="_blank">调理肠胃</a>|
	                               <a href="#" target="_blank">综合营养</a>
	                           </dd>
	                       </dl>
	                       <dl class="twoFloor">
	                       	<dt><a href="#" target="_blank">狗狗医疗</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">体内驱虫</a>|
	                               <a href="#" target="_blank">体外驱虫</a>|
	                               <a href="#" target="_blank">口腔修护</a>|
	                               <a href="#" target="_blank">眼部护理</a>|
	                               <a href="#" target="_blank">耳道清洁</a><br/>|
	                               <a href="#" target="_blank">体内病菌感染</a>|
	                               <a href="#" target="_blank">皮肤问题</a>|
	                               <a href="#" target="_blank">试纸及清洁其他</a>
	                           </dd>
	                       </dl>
	                       <dl class="twoFloor">
	                       	<dt><a href="#" target="_blank">狗狗沐浴露</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">幼犬专用</a>|
	                               <a href="#" target="_blank">药用香波</a>|
	                               <a href="#" target="_blank">美毛去味</a>|
	                               <a href="#" target="_blank">特色毛发</a>|
	                               <a href="#" target="_blank">耳道清洁</a>|
	                               <a href="#" target="_blank">干洗粉</a><br/>|
	                               <a href="#" target="_blank">护毛素/护掌</a>|
	                               <a href="#" target="_blank">洗手液</a>|
	                               <a href="#" target="_blank">染色剂系列</a>|
	                               <a href="#" target="_blank">稀释瓶</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">狗狗日用品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">器具系列</a>|
	                               <a href="#" target="_blank">牵引系列</a>|
	                               <a href="#" target="_blank">出行装备</a>|
	                               <a href="#" target="_blank">排便用品</a>|
	                               <a href="#" target="_blank">环境清洁</a>
	                           </dd>
	                       </dl>
	                       <dl class="twoFloor">
	                       	<dt><a href="#" target="_blank">狗狗美容</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">吊牌挂件</a>|
	                               <a href="#" target="_blank">毛巾系列</a>|
	                               <a href="#" target="_blank">梳子/刷子系列</a>|
	                               <a href="#" target="_blank">修剪系列</a>|
	                               <a href="#" target="_blank">吹风机/吹水机</a><br/>|
	                               <a href="#" target="_blank">围裙</a>|
	                               <a href="#" target="_blank">画笔工具</a>|
	                               <a href="#" target="_blank">洗手液</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">狗狗玩具</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">休闲玩具</a>|
	                               <a href="#" target="_blank">训导益智</a>
	                           </dd>
	                       </dl>
	                       <dl class="last_one">
	                       	<dt><a href="#" target="_blank">狗狗衣服/狗窝</a></dt>
	                           <dd>|
	                               <a href="#" target="_blank">宠物服装</a>|
	                               <a href="#" target="_blank">犬窝/犬笼</a>|
	                               <a href="#" target="_blank">毛毯/垫子/凉席</a>|
	                               <a href="#" target="_blank">鞋子/袜子/帽子</a>
	                           </dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	           <!--猫-->
	           <div  class='in_list'>
	           	<!--能显示的一部分-->
	           	<div class='in_list_1' style="height:92px;">
	               	<div class="show_tit">
	                   	<em class="cat"></em>
	                       <a href='#' target="_blank">猫猫商品</a>
	                       <span></span>
	                   </div>
	                   <div class="show_body">
	                   	<span>
	                       	<a href="#" target="_blank">猫粮</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">猫罐头</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">猫零食</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">医疗</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">保健</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">沐浴露</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">日用品</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">玩具</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">猫窝</a>
	                       </span>
	                   </div>
	               </div>
	               <!--没有显示的一部分-->
	               <div class="condiv1 con" style="display:none">
	               	<div class="condiv0_1  condiv_tong">
	                   	<dl class="ttop">
	                       	<dt><a href="#" target="_blank">宠物猫粮</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">成猫粮</a>|
	                               <a href="#" target="_blank">幼猫粮</a>|
	                               <a href="#" target="_blank">全猫粮</a>|
	                               <a href="#" target="_blank">老猫粮</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">猫罐头/妙鲜包</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">成猫湿粮</a>|
	                               <a href="#" target="_blank">幼猫湿粮</a>|
	                               <a href="#" target="_blank">全猫湿粮</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">猫猫零食</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">肉质零食</a>|
	                               <a href="#" target="_blank">猫条/猫草</a>|
	                               <a href="#" target="_blank">果冻</a>|
	                               <a href="#" target="_blank">猫咪洁牙零食</a>|
	                               <a href="#" target="_blank">其他零食</a>
	                           </dd>
	                       </dl>
	                       <dl class="twoFloor">
	                       	<dt><a href="#" target="_blank">猫猫医疗</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">体内驱虫</a>|
	                               <a href="#" target="_blank">体外驱虫</a>|
	                               <a href="#" target="_blank">口腔修护</a>|
	                               <a href="#" target="_blank">眼部护理</a>|
	                               <a href="#" target="_blank">耳道清洁</a><br/>|
	                               <a href="#" target="_blank">体内病菌感染</a>|
	                               <a href="#" target="_blank">皮肤问题</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">猫猫保健品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">美毛护肤</a>|
	                               <a href="#" target="_blank">补钙强骨</a>|
	                               <a href="#" target="_blank">微量矿物</a>|
	                               <a href="#" target="_blank">调理肠胃</a>|
	                               <a href="#" target="_blank">综合营养</a>|
	                               <a href="#" target="_blank">速效化毛</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">猫猫香波护毛素</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">药用杀虫</a>|
	                               <a href="#" target="_blank">药用香波</a>|
	                               <a href="#" target="_blank">幼猫专用/干洗粉</a>|
	                               <a href="#" target="_blank">亮毛护毛</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">日常用品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">器具系列</a>|
	                               <a href="#" target="_blank">环境清洁</a>|
	                               <a href="#" target="_blank">出行装备</a>|
	                               <a href="#" target="_blank">排便用品</a>|
	                               <a href="#" target="_blank">猫砂系列</a>
	                           </dd>
	                       </dl>
	                       <dl class="twoFloor">
	                       	<dt><a href="#" target="_blank">猫猫玩具</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">休闲玩具</a>|
	                               <a href="#" target="_blank">猫爬架/猫抓板</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">猫衣服/猫窝</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">猫窝</a>|
	                               <a href="#" target="_blank">毛毯/垫子</a>|
	                               <a href="#" target="_blank">变身帽</a>
	                           </dd>
	                       </dl>
	                       <dl class="last_one">
	                       	<dt><a href="#" target="_blank">美容器材</a></dt>
	                           <dd>|
	                               <a href="#" target="_blank">毛巾系列</a>|
	                               <a href="#" target="_blank">挂牌吊件</a>|
	                               <a href="#" target="_blank">修剪系列</a>|
	                               <a href="#" target="_blank">梳子/刷子系列</a>
	                           </dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	           <!--小宠-->
	           <div class='in_list'>
	           	<!--能显示的一部分-->
	           	<div class='in_list_1' style="height:48px;">
	               	<div class="show_tit">
	                   	<em class="small"></em>
	                       <a href='#' target="_blank">奇趣小宠</a>
	                       <span></span>
	                   </div>
	                   <div class="show_body">
	                   	<span>
	                       	<a href="#" target="_blank">兔子</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">仓鼠</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">龙猫</a>
	                       </span>
	                   </div>  
	               </div>
	               <!--没有显示的一部分-->
	               <div class="condiv2 con" style="display:none">
	               	<div class="condiv0_1  condiv_tong">
	                   	<dl class="ttop">
	                       	<dt><a href="#" target="_blank">兔兔用品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">兔兔饲料/零食</a>|
	                               <a href="#" target="_blank">兔兔医疗/保健品</a>|
	                               <a href="#" target="_blank">兔兔用品</a>|
	                               <a href="#" target="_blank">兔兔磨牙</a>|
	                               <a href="#" target="_blank">兔兔牧草</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">仓鼠用品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">仓鼠饲料/零食</a>|
	                               <a href="#" target="_blank">仓鼠医疗/保健品</a>|
	                               <a href="#" target="_blank">仓鼠用品</a>|
	                               <a href="#" target="_blank">仓鼠玩具</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">龙猫用品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">龙猫饲料/零食</a>|
	                               <a href="#" target="_blank">龙猫医疗/保健品</a>|
	                               <a href="#" target="_blank">龙猫用品</a>|
	                               <a href="#" target="_blank">龙猫玩具</a>|
	                               <a href="#" target="_blank">龙猫牧草</a>
	                           </dd>
	                       </dl>
	                       <dl class="last_one">
	                       	<dt><a href="#" target="_blank">天竺鼠（荷兰猪）<br/>用品</a></dt>
	                           <dd>|
	                               <a href="#" target="_blank">天竺鼠饲料/零食</a>|
	                               <a href="#" target="_blank">天竺鼠医疗/保健品</a>|
	                               <a href="#" target="_blank">天竺鼠用品</a>|
	                               <a href="#" target="_blank">天竺鼠玩具</a>
	                           </dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	           <!--水族-->
	           <div class='in_list'>
	           	<!--能显示的一部分-->
	           	<div class='in_list_1' style="height:70px;">
	               	<div class="show_tit">
	                   	<em class="water"></em>
	                       <a href='#' target="_blank">水族市场</a>
	                       <span></span>
	                   </div>
	                   <div class="show_body">
	                   	<span>
	                       	<a href="#" target="_blank">水族箱</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">饲料</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">药剂</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">氧气</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">过滤器</a>
	                       </span>
	                        <span>
	                       	<a href="#" target="_blank">温控</a>
	                       </span>
	                   </div>
	               </div>
	               <!--没有显示的一部分-->
	               <div class="condiv3 con" style="display:none">
	               	<div class="condiv0_1  condiv_tong">
	                   	<dl class="ttop">
	                       	<dt><a href="#" target="_blank">鱼缸/水族箱</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">鱼缸/水族箱</a>|
	                               <a href="#" target="_blank">鱼缸配件</a>|
	                               <a href="#" target="_blank">鱼缸底柜</a>
	                           </dd>
	                       </dl>
	                       <dl class="twoFloor">
	                       	<dt><a href="#" target="_blank">鱼饲料</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">血鹦鹉饲料</a>|
	                               <a href="#" target="_blank">罗汉鱼饲料</a>|
	                               <a href="#" target="_blank">锦鲤鱼饲料</a>|
	                               <a href="#" target="_blank">小型鱼饲料</a>|
	                               <a href="#" target="_blank">虫干/虾干</a><br/>|
	                               <a href="#" target="_blank">银龙鱼饲料</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">过滤器</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">内置过滤器</a>|
	                               <a href="#" target="_blank">外置过滤桶</a>|
	                               <a href="#" target="_blank">上置过滤器</a>|
	                               <a href="#" target="_blank">壁挂过滤器</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">过滤材料</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">过滤棉</a>|
	                               <a href="#" target="_blank">生化棉</a>|
	                               <a href="#" target="_blank">陶瓷环</a>|
	                               <a href="#" target="_blank">生化球</a>|
	                               <a href="#" target="_blank">活性炭</a>|
	                               <a href="#" target="_blank">细菌屋</a>|
	                               <a href="#" target="_blank">其他过滤材料</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">潜水泵</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">潜水泵</a>|
	                               <a href="#" target="_blank">冲浪泵</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">氧气泵</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">单孔</a>|
	                               <a href="#" target="_blank">双孔</a>|
	                               <a href="#" target="_blank">四孔</a>|
	                               <a href="#" target="_blank">四孔以上出气</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">增氧配件</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">增氧配件</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">照明器材</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">照明器材</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">温控设备</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">温度计</a>|
	                               <a href="#" target="_blank">加热棒</a>|
	                               <a href="#" target="_blank">风扇</a>|
	                               <a href="#" target="_blank">控制器</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">药水系列</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">硝化细菌</a>|
	                               <a href="#" target="_blank">净水剂</a>|
	                               <a href="#" target="_blank">杀菌</a>|
	                               <a href="#" target="_blank">疾病治疗</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">鱼缸清洁用具</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">鱼缸清洁用具</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">造景装饰</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">造景/装饰</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">水草肥料</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">水草/肥料</a>
	                           </dd>
	                       </dl>
	                       <dl>
	                       	<dt><a href="#" target="_blank">杀菌灯</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">杀菌灯</a>
	                           </dd>
	                       </dl>
	                       <dl class="last_one">
	                       	<dt><a href="#" target="_blank">喂食器</a></dt>
	                           <dd>|
	                               <a href="#" target="_blank">喂食器</a>
	                           </dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	           <!--爬虫-->
	           <div class='in_list'>
	           	<!--能显示的一部分-->
	           	<div class='in_list_1' style="height:52px;">
	               	<div class="show_tit">
	                   	<em class="pacong"></em>
	                       <a href='#' target="_blank">爬虫用品</a>
	                       <span></span>
	                   </div>
	                   <div class="show_body">
	                   	<span>
	                       	<a href="#" target="_blank">陆龟</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">水龟</a>
	                       </span>
	                       <span>
	                       	<a href="#" target="_blank">蜥蜴</a>
	                       </span>
	                   </div>  
	               </div>
	               <!--没有显示的一部分-->
	               <div class="condiv2 con" style="display:none">
	               	<div class="condiv0_1  condiv_tong">
	                   	<dl class="ttop twoFloor">
	                       	<dt><a href="#" target="_blank">陆龟用品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">陆龟 龟箱</a>|
	                               <a href="#" target="_blank">陆龟 龟粮</a>|
	                               <a href="#" target="_blank">龟龟 灯具</a>|
	                               <a href="#" target="_blank">龟龟 加热</a>|
	                               <a href="#" target="_blank">兔兔牧草</a><br/>|
	                               <a href="#" target="_blank">医疗保健用品</a>|
	                               <a href="#" target="_blank">龟龟 造景</a>|
	                               <a href="#" target="_blank">龟龟 食具</a>|
	                               <a href="#" target="_blank">龟龟 躲避</a>|
	                               <a href="#" target="_blank">龟龟 温控</a>                                
	                           </dd>
	                       </dl>
	                       <dl class="twoFloor">
	                       	<dt><a href="#" target="_blank">水龟用品</a></dt>
	                           <dd>|
	                           	<a href="#" target="_blank">水龟 龟缸</a>|
	                               <a href="#" target="_blank">龟龟 灯具</a>|
	                               <a href="#" target="_blank">水龟 加热</a>|
	                               <a href="#" target="_blank">水龟 龟粮</a>|
	                               <a href="#" target="_blank">医疗/保健用品</a><br/>|
	                               <a href="#" target="_blank">龟龟 造景</a>|
	                               <a href="#" target="_blank">龟龟 食具</a>|
	                               <a href="#" target="_blank">水龟 躲避</a>|
	                               <a href="#" target="_blank">龟龟 温控</a>|
	                               <a href="#" target="_blank">龟龟 配件</a>
	                           </dd>
	                       </dl>                     
	                       <dl class="last_one">
	                       	<dt><a href="#" target="_blank">蜥蜴蛇守宫用品</a></dt>
	                           <dd>|
	                               <a href="#" target="_blank">保健品系列</a>|
	                               <a href="#" target="_blank">加热取暖设备</a>|
	                               <a href="#" target="_blank">垫材类</a>
	                           </dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	       </div>
	       <!--中间图片轮播-->
	       <div class="inshowmiddle left">
	       	<div class="changepic">
	           	<div class="changepic_sm">
	               	<div class="slides_container">
	                   	<div class="slide">
							<a href="#" title="145.365 - Happy Bokeh Thursday! | Flickr - Photo Sharing!" target="_blank"><img src="shoppingindeximg/shoppicpath1446430435.jpg" width="800" height="360" alt="Slide 1"></a>
							<div class="caption" style="bottom:0">
								<p>狗狗新品</p>
							</div>
						</div>
	                   	<div class="slide">
							<a href="#" title="145.365 - Happy Bokeh Thursday! | Flickr - Photo Sharing!" target="_blank"><img src="shoppingindeximg/shoppicpath1445825349.jpg" width="800" height="360" alt="Slide 2"></a>
							<div class="caption" style="bottom:0">
								<p>大优惠</p>
							</div>
						</div>
	                       <div class="slide">
							<a href="#" title="145.365 - Happy Bokeh Thursday! | Flickr - Photo Sharing!" target="_blank"><img src="shoppingindeximg/shoppicpath1446516270.jpg" width="800" height="360" alt="Slide 3"></a>
							<div class="caption" style="bottom:0">
								<p>宠物零食</p>
							</div>
						</div>
	                       <div class="slide">
							<a href="#" title="145.365 - Happy Bokeh Thursday! | Flickr - Photo Sharing!" target="_blank"><img src="shoppingindeximg/shoppicpath1446605764.jpg" width="800" height="360" alt="Slide 4"></a>
							<div class="caption" style="bottom:0">
								<p>不要错失良机</p>
							</div>
						</div>
	                   </div>
	                   <!--<a href="#" target="_blank" class="pic1 left" name="shoppicpath1446430435" style="display:block"><img src="shoppingindeximg/shoppicpath1446430435.jpg"></a>
	                   <a href="#" target="_blank" class="pic2 left" name="shoppicpath1445825349" style="display:none"><img src="shoppingindeximg/shoppicpath1445825349.jpg"></a>
	                   <a href="#" target="_blank" class="pic3 left" name="shoppicpath1446516270" style="display:none"><img src="shoppingindeximg/shoppicpath1446516270.jpg"></a>
	                   <a href="#" target="_blank" class="pic4 left" name="shoppicpath1446605764" style="display:none"><img src="shoppingindeximg/shoppicpath1446605764.jpg"></a>
	               </div>
	               <div class="diandian">
	               	<span class="current1">1</span>
	                   <span class="current2">2</span>
	                   <span class="current3">3</span>
	                   <span class="current4">4</span>-->
	               </div>
	           </div>
	           <div class='three'>
	           	<div class="three_h">
	                   <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1444358714.jpg"></a>
	                   <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1444620794.jpg"></a>
	                   <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1444620794.jpg"></a>
	               </div>
	           </div>
	       </div>
	       <!--右侧广告-->
	        <div class="inshowright left">
	        	<div>
	            	<a href="#" target='_blank'>
	                	<img src='shoppingindeximg/shoppicpath1445998640.jpg' width="200" height="200" alt="团购">
	                </a>
	            </div>
	        </div> 
	    </div>
	</div>
	<!--主体的内容-->
	<div id='content'>
		<div class="inContent">
	    	<!--火爆商品-->
	   	<div class="hotThing">
	   		<div class="hotMore">
	           	<h2>火爆商品</h2>
	           </div>
	           <div class="hotShow">
	           	<dl>
	   				<dt>
	                   <a href="#" target="_blank">
	                  	 	<img src="shoppingindeximg/picpath11330661415_thumb(1).jpg">
	                   </a>
	                   </dt>
	                   <dd>
	                   	<a href="product.html" title="小型犬" target="_blank">小型犬</a>
	                   </dd>
	                   <dd>
	                   	<span class="l">￥34.00</span>
	                       <span class="r">已售92611</span>
	                   </dd>            
	               </dl>
	               <dl>
	   				<dt>
	                   <a href="#" target="_blank">
	                  	 	<img src="shoppingindeximg/picpath11330661415_thumb(1).jpg">
	                   </a>
	                   </dt>
	                   <dd>
	                   	<a href="product.html" title="小型犬" target="_blank">小型犬</a>
	                   </dd>
	                   <dd>
	                   	<span class="l">￥34.00</span>
	                       <span class="r">已售92611</span>
	                   </dd>            
	               </dl>
	               <dl>
	   				<dt>
	                   <a href="#" target="_blank">
	                  	 	<img src="shoppingindeximg/picpath11330661415_thumb(1).jpg">
	                   </a>
	                   </dt>
	                   <dd>
	                   	<a href="product.html" title="小型犬" target="_blank">小型犬</a>
	                   </dd>
	                   <dd>
	                   	<span class="l">￥34.00</span>
	                       <span class="r">已售92611</span>
	                   </dd>            
	               </dl>
	               <dl>
	   				<dt>
	                   <a href="#" target="_blank">
	                  	 	<img src="shoppingindeximg/picpath11330661415_thumb(1).jpg">
	                   </a>
	                   </dt>
	                   <dd>
	                   	<a href="#" title="小型犬" target="_blank">小型犬</a>
	                   </dd>
	                   <dd>
	                   	<span class="l">￥34.00</span>
	                       <span class="r">已售92611</span>
	                   </dd>            
	               </dl>
	               <dl>
	   				<dt>
	                   <a href="#" target="_blank">
	                  	 	<img src="shoppingindeximg/picpath11330661415_thumb(1).jpg">
	                   </a>
	                   </dt>
	                   <dd>
	                   	<a href="#" title="小型犬" target="_blank">小型犬</a>
	                   </dd>
	                   <dd>
	                   	<span class="l">￥34.00</span>
	                       <span class="r">已售92611</span>
	                   </dd>            
	               </dl>
	               <dl>
	   				<dt>
	                   <a href="#" target="_blank">
	                  	 	<img src="shoppingindeximg/picpath11330661415_thumb(1).jpg">
	                   </a>
	                   </dt>
	                   <dd>
	                   	<a href="#" title="小型犬" target="_blank">小型犬</a>
	                   </dd>
	                   <dd>
	                   	<span class="l">￥34.00</span>
	                       <span class="r">已售92611</span>
	                   </dd>            
	               </dl>
	               
	           </div>
	       </div>
	       <!--知名品牌-->
	       <div class="bigThing">
	       	<div class="bigMore">
	           	<h2>知名品牌  放心选择</h2>
	               <a href="#" target="_blank">更多品牌>></a>
	           </div>
	           <div class="bigShow">
	           	<a href="#" target="_blank">
	               	<img src='shoppingindeximg/shoppicpath1429493517.gif'  class='brand_1' width="190" height="270" alt="宝路">
	               </a>
	               <a href="#" target="_blank">
	 					<img src="shoppingindeximg/shoppicpath1429493550.gif" class='brand_2' width="190" height="130" alt="比瑞吉">             
	               </a>
	               <a href="#" target="_blank">
	 					<img src="shoppingindeximg/shoppicpath1429493550.gif" class='brand_3' width="190" height="130" alt="味优">             
	               </a>
	               <a href="#" target="_blank">
	               	<img src='shoppingindeximg/shoppicpath1429493517.gif'  class='brand_4' width="190" height="270" alt="宝路">
	               </a>
	               <a href="#" target="_blank">
	 					<img src="shoppingindeximg/shoppicpath1429493550.gif" class='brand_5' width="190" height="130" alt="比瑞吉">             
	               </a>
	               <a href="#" target="_blank">
	 					<img src="shoppingindeximg/shoppicpath1429493550.gif" class='brand_6' width="190" height="130" alt="味优">             
	               </a>
	               <a href="#" target="_blank">
	               	<img src='shoppingindeximg/shoppicpath1429493517.gif'  class='brand_7' width="190" height="270" alt="宝路">
	               </a>
	               <a href="#" target="_blank">
	 					<img src="shoppingindeximg/shoppicpath1429493550.gif" class='brand_8' width="190" height="130" alt="比瑞吉">             
	               </a>
	               <a href="#" target="_blank">
	 					<img src="shoppingindeximg/shoppicpath1429493550.gif" class='brand_9' width="190" height="130" alt="味优">             
	               </a>
	           </div>
	       </div>
	       <!--狗狗商品-->
	       <div class="dogThing bigTop">
	       	<div class="dogMore smallTop">
	           	<div class='dog_tit'>
	               	<em></em>
	           		<h2>
	                   	<a href="#" target="_blank">狗狗商品</a>
	                </h2>
	               </div>
	               <div class="dog_nav">
	               	<a href="#" target="_blank" class="showColor" name='狗粮'>狗粮</a>
	                   <a href="#" target="_blank" name='湿粮'>湿粮</a>
	                   <a href="#" target="_blank" name='零食'>零食</a>
	                   <a href="#" target="_blank" name='保健品'>保健品</a>
	                   <a href="#" target="_blank" name='医疗'>医疗</a>
	                   <a href="#" target="_blank" name='沐浴露'>沐浴露</a>
	                   <a href="#" target="_blank" name='日用品'>日用品</a>
	                   <a href="#" target="_blank" name='美容'>美容</a>
	                   <a href="#" target="_blank" name='玩具'>玩具</a>
	                   <a href="#" target="_blank" class='last current' name='衣服窝'>衣服窝</a>
	               </div>
	           </div>
	           <div class="dogShow">
	               <div class="dog_l left ll">
	               	<a href="#" target="_blank">
	               		<img src="shoppingindeximg/shoppicpath1439962399.jpg">
	               	</a>
	               </div>
	               <!--中间部分-->
					<div class="dog_r left rr">
						<div class="dog_r_up">
							<div class="dog_r_show1" id="1001" style="display: block;"
								name='狗粮'></div>

							<div class="dog_r_show1" id="1002" style="display: none;"
								name='湿粮'></div>

							<div class="dog_r_show1" id="1003" style="display: none;"
								name='零食'></div>

							<div class="dog_r_show1" id="1004" style="display: none;"
								name='保健品'></div>

							<div class="dog_r_show1" id="1005" style="display: none;"
								name='医疗'></div>

							<div class="dog_r_show1" id="1006" style="display: none;"
								name='沐浴露'></div>

							<div class="dog_r_show1" id="1007" style="display: none;"
								name='日用品'></div>

							<div class="dog_r_show1" id="1008" style="display: none;"
								name='美容'></div>

							<div class="dog_r_show1" id="1009" style="display: none;"
								name='玩具'></div>

							<div class="dog_r_show1" id="1010" style="display: none;"
								name='衣服窝'></div>
						</div>
						<div class="dog_r_down">
							<a href="#" target="_blank" name=""><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a> <a
								href="#" target="_blank"><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a> <a
								href="#" target="_blank"><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a> <a
								href="#" target="_blank"><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a> <a
								href="#" target="_blank"><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a> <a
								href="#" target="_blank"><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a> <a
								href="#" target="_blank"><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a> <a
								class='last_small_pic' href="#" target="_blank"><img
								src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
						</div>
					</div>
					<div class="dog_s right ss">
	               	<div class="left_tit">波奇推荐</div>
	                   <div class='right_all'>
	                   	<dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	       </div>
	       <!--猫商品-->
	       <div class='dogThing bigTop'>
	       	<div class="dogMore smallTop">
	               <div class='dog_tit'>
	               	<em></em>
	           		<h2>
	                   	<a href="#" target="_blank">猫咪商品</a>
	                   </h2>
	               </div>
	               <div class="dog_nav">
	              		<a href="#" target="_blank" class="showColor" name="猫粮">猫粮</a>
	                   <a href="#" target="_blank" name="湿粮">湿粮</a>
	                   <a href="#" target="_blank" name="零食">零食</a>
	                   <a href="#" target="_blank" name="健品粮">保健品</a>
	                   <a href="#" target="_blank" name="香波">香波</a>
	                   <a href="#" target="_blank" name="医疗">医疗</a>
	                   <a href="#" target="_blank" name="玩具">玩具</a>
	                   <a href="#" target="_blank" name="衣服窝">衣服窝</a>
	                   <a href="#" target="_blank" name="日用品">日用品</a>
	                   <a href="#" target="_blank" class='last current' name="美容">美容</a> 
	               </div>
	           </div>
	           <div class="dogShow">
	               <div class="dog_l left ll">
	               	<a href="#" target="_blank">
	               		<img src="shoppingindeximg/shoppicpath1442375988.jpg">
	               	</a>
	               </div>
	               <div class="dog_r left rr ">
						<div class="dog_r_up">
							<div class="dog_r_show1" id="1011" style="display: block;" name="猫粮">
							</div>

							<div class="dog_r_show1" id="1012" style="display: none;" name="湿粮">
							</div>
							
							<div class="dog_r_show1" id="1013" style="display: none;" name="零食">
							</div>
							
							<div class="dog_r_show1" id="1014" style="display: none;" name="健品粮">
							</div>

							<div class="dog_r_show1" id="1015" style="display: none;" name="香波">
							</div>
							
							<div class="dog_r_show1" id="1016" style="display: none;" name="医疗">
							</div>
							
							<div class="dog_r_show1" id="1017" style="display: none;" name="衣服窝">
							</div>
							
							<div class="dog_r_show1" id="1018" style="display: none;" name="玩具">
							</div>
							
							<div class="dog_r_show1" id="1019" style="display: none;" name="日用品">
							</div>
							
							<div class="dog_r_show1" id="1020" style="display: none;" name="美容">
							</div>
						</div>
						<div class="dog_r_down">
	                   	<a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a class='last_small_pic' href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                   </div>
	               </div>
	               <div class="cat_s right ss">
	               	<div class="left_tit">波奇推荐</div>
	                   <div class='right_all'>
	                   	<dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	       </div>
	       <!--小动物-->
	       <div class="dogThing bigTop">
	       	<div class="dogMore smallTop">
	               <div class='dog_tit'>
	               	<em></em>
	           		<h2>
	                   	<a href="#" target="_blank">小宠商品</a>
	                   </h2>
	               </div>
	               <div class="dog_nav">
	               		<a href="#" target="_blank" class="showColor" name="兔兔用品">兔兔用品</a>
	                       <a href="#" target="_blank" name="仓鼠用品">仓鼠用品</a>
	                       <a href="#" target="_blank" name="龙猫用品">龙猫用品</a>
	                       <a href="#" target="_blank" class='last current' name="天竺鼠用品">天竺鼠用品</a>  
	               </div>
	           </div>
	           <div class="dogShow">
	           	
	               <div class="dog_l left ll">
	               	<a href="#" target="_blank">
	               		<img src='shoppingindeximg/shoppicpath1429495126.jpg'>
	             		</a>
	               </div>
	               <div class="dog_r left rr">
	               	<div class="dog_r_up">
	                   	<div class="dog_r_show1" style="display:block;" name="兔兔用品">
	                	           
	                    </div>
	                    <div class="dog_r_show1" style="display:none;" name="仓鼠用品">
	                       	
	                    </div>
	                    <div class="dog_r_show1" style="display:none;" name="龙猫用品">
	                       	
	                    </div>
	                    <div class="dog_r_show1" style="display:none;" name="天竺鼠用品">
	                       	
	                    </div>                        
	                </div>
	                   <div class="dog_r_down">
	                   	<a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                       <a class='last_small_pic' href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                   </div>
	               </div>
	               <div class="little_s right ss">
	               	<div class="left_tit">波奇推荐</div>
	                   <div class='right_all'>
	                   	<dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                       <dl>
	                       	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                           <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                           <dd class="low left">¥ 10.40</dd>
	                       </dl>
	                   </div>
	               </div>
	           </div>
	       </div>
	       <!--水箱-->
			<div class="dogThing bigTop">
				<div class="dogMore smallTop">
				    <div class='dog_tit'>
				    	<em></em>
						<h2>
				        	<a href="#" target="_blank">水族商品</a>
				        </h2>
				    </div>
				    <div class="dog_nav">
				    		<a href="#" target="_blank" class="showColor" name="鱼缸">鱼缸</a>
				            <a href="#" target="_blank" name="鱼饲料">鱼饲料</a>
				            <a href="#" target="_blank" name="药水">药水</a>
				            <a href="#" target="_blank" name="过滤材料">过滤材料</a>
				            <a href="#" target="_blank" name="氧气泵">氧气泵</a>
				            <a href="#" target="_blank" name="潜水泵">潜水泵</a>
				            <a href="#" target="_blank" name="控温设备">控温设备</a>
				            <a href="#" target="_blank" class='last current' name="造景装饰">造景装饰</a>  
				    </div>
				</div>
				<div class="dogShow">
					<div class="dog_l left ll">
				    	<a href="#" target="_blank">
				    		<img src="shoppingindeximg/shoppicpath1429495184.jpg">
				    	</a>
				    </div>
				    <div class="dog_r left rr ">
				    	<div class="dog_r_up">
				        	<div class="dog_r_show1" style="display:block;" name="鱼缸">
				        	
				    		</div>
						    <div class="dog_r_show1" style="display:none;" name="鱼饲料">
						       	
						    </div>
						    <div class="dog_r_show1" style="display:none;" name="药水">
						       	
						    </div>
						    <div class="dog_r_show1" style="display:none;" name="过滤材料">
						       	
						    </div>
						    <div class="dog_r_show1" style="display:none;" name="氧气泵">
						              
						    </div>
						    <div class="dog_r_show1" style="display:none;" name="潜水泵">
						       	
						    </div>
						    <div class="dog_r_show1" style="display:none;" name="控温设备">
						       	
						    </div>
						    <div class="dog_r_show1" style="display:none;" name="造景装饰">
						      
						    </div>
						</div>
						<div class="dog_r_down">
	                    	<a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a class='last_small_pic' href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                    </div>
					</div>
					<div class="water_s right ss">
							<div class="left_tit">波奇推荐</div>
							<div class='right_all'>
								<dl>
									<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
								    <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
								    <dd class="low left">¥ 10.40</dd>
								</dl>
								<dl>
									<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
								    <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
								    <dd class="low left">¥ 10.40</dd>
								</dl>
								<dl>
									<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
								    <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
								    <dd class="low left">¥ 10.40</dd>
								</dl>
								<dl>
									<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
								    <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
								    <dd class="low left">¥ 10.40</dd>
								</dl>
								<dl>
									<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
								    <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
								    <dd class="low left">¥ 10.40</dd>
								</dl>
								<dl>
									<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
								    <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
								    <dd class="low left">¥ 10.40</dd>
								</dl>
							</div>
						</div>
				</div>
			</div>
	       <!--爬行动物-->
	       <div class="DogThing bigTop">
	       	<div class="dogMore smallTop">
	               <div class='dog_tit'>
	               	<em></em>
	           		<h2>
	                   	<a href="#" target="_blank">爬虫商品</a>
	                   </h2>
	               </div>
	               <div class="dog_nav">
	               		<a href="#" target="_blank" class="showColor" name="陆龟用品">陆龟用品</a>
	                       <a href="#" target="_blank" name="水龟用品">水龟用品</a>
	                       <a href="#" target="_blank" class='last current' name="其他类">其他类</a>  
	               </div>
	           </div>
	           <div class="dogShow">
	               <div class="dog_l left ll">
	               	<a href="#" target="_blank">
	               		<img src='shoppingindeximg/shoppicpath1429495158.jpg'>
	               	</a>
	               </div>
	               <div class="dog_r left rr">
	               	<div class="dog_r_up">
	                   	<div class="dog_r_show1" style="display:block;" name="陆龟用品">
	                           
	                    </div>
	                    <div class="dog_r_show1" style="display:none;" name="水龟用品">
	                       	
	                    </div>
	                    <div class="dog_r_show1" style="display:none;" name="其他类">
	                        	
	                    </div>
	                </div>
	                    <div class="dog_r_down">
	                    	<a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                        <a class='last_small_pic' href="#" target="_blank"><img src="shoppingindeximg/shoppicpath1429493993.jpg"></a>
	                    </div>
	                </div>
	                <div class="walk_s right ss">
	                	<div class="left_tit">波奇推荐</div>
	                    <div class='right_all'>
	                    	<dl>
	                        	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                            <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                            <dd class="low left">¥ 10.40</dd>
	                        </dl>
	                        <dl>
	                        	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                            <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                            <dd class="low left">¥ 10.40</dd>
	                        </dl>
	                        <dl>
	                        	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                            <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                            <dd class="low left">¥ 10.40</dd>
	                        </dl>
	                        <dl>
	                        	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                            <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                            <dd class="low left">¥ 10.40</dd>
	                        </dl>
	                        <dl>
	                        	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                            <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                            <dd class="low left">¥ 10.40</dd>
	                        </dl>
	                        <dl>
	                        	<dt class="left"><a herf='#' target="_blank"><img src="shoppingindeximg/shoppicpath11415353704_thumb.jpg"></a></dt>
	                            <dd class="left"><a class='right_all_check' href="#" target="_blank">哈格 什锦高钙弹力洁齿魔块dfdsfd100g </a></dd>
	                            <dd class="low left">¥ 10.40</dd>
	                        </dl>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!--正品保证-->
	<div id="footserve">
		<div class="infootserve">
	    	<dl class='left'>
	     		<dt><em><img src="shoppingindeximg/2015-11-17_213944.png"></em></dt>
	            <dd class="big_one">正品保障</dd>
	            <dd class="small_noe">全场正品　假一罚十</dd>   
	        </dl>
	        <dl class='left'>
	     		<dt><em><img src='shoppingindeximg/2015-11-17_214000.png'></em></dt>
	            <dd class="big_one">正品保障</dd>
	            <dd class="small_noe">全场正品　假一罚十</dd>   
	        </dl>
	        <dl class='left'>
	     		<dt><em><img src='shoppingindeximg/2015-11-17_214012.png'></em></dt>
	            <dd class="big_one">正品保障</dd>
	            <dd class="small_noe">全场正品　假一罚十</dd>   
	        </dl>
	        <dl class='left'>
	     		<dt><em><img src='shoppingindeximg/2015-11-17_214023.png'></em></dt>
	            <dd class="big_one">正品保障</dd>
	            <dd class="small_noe">全场正品　假一罚十</dd>   
	        </dl>
	        <dl class='pp_last left'>
	     		<dt><em><img src='shoppingindeximg/2015-11-17_214033.png'></em></dt>
	            <dd class="big_one">正品保障</dd>
	            <dd class="small_noe">全场正品　假一罚十</dd>   
	        </dl>
	    </div>
	</div>
	<!--底部连接-->
	<div id="link">
		<div class="morelink">
			<dl class="left">
	        	<dt><a href="#" target="_blank">新手上路</a></dt>
	            <dd><a href="#" target="_blank">购物流程</a></dd>
	            <dd><a href="#" target="_blank">现金账户</a></dd>
	            <dd><a href="#" target="_blank">优惠券</a></dd>
	            <dd><a href="#" target="_blank">订单查询</a></dd>
	            <dd><a href="#" target="_blank">服务协议</a></dd>
	        </dl>
	        <dl class="left">
	        	<dt><a href="#" target="_blank">购买方式</a></dt>
	            <dd><a href="#" target="_blank">余额支付</a></dd>
	            <dd><a href="#" target="_blank">网上支付</a></dd>
	            <dd><a href="#" target="_blank">银行汇款</a></dd>
	            <dd><a href="#" target="_blank">货到付款</a></dd>
	        </dl>
	        <dl class="left">
	        	<dt><a href="#" target="_blank">配送方式</a></dt>
	            <dd><a href="#" target="_blank">配送方式</a></dd>
	            <dd><a href="#" target="_blank">收费标准</a></dd>
	            <dd><a href="#" target="_blank">配送时间</a></dd>
	        </dl>
	        <dl class="left">
	        	<dt><a href="#" target="_blank">售后服务</a></dt>
	            <dd><a href="#" target="_blank">如何退换货</a></dd>
	            <dd><a href="#" target="_blank">如何退款</a></dd>
	            <dd><a href="#" target="_blank">退换货流程</a></dd>
	            <dd><a href="#" target="_blank">客服电话</a></dd>
	        </dl>
	        <dl class="left">
	        	<dt><a href="#" target="_blank">常见问题</a></dt>
	            <dd><a href="#" target="_blank">注册登录</a></dd>
	            <dd><a href="#" target="_blank">积分制度</a></dd>
	            <dd><a href="#" target="_blank">热点问题</a></dd>
	        </dl>
	    </div>
	</div>
	<!--最底层的-->
	<div id="footer">
	        	<div id="footer-auto">
	                <div id="footer-bot">
	                    <p id="footer-link">
	                        <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">关于波奇</a>
	                       <span>|</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">友情链接</a>
	                       <span>|</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">诚聘英才</a>
	                       <span>|</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">联系我们</a>
	                       <span>|</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">网站地图</a>
	                       <span>|</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">意见反馈</a>
	                       <span>|</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">帮助中心</a>
	                       <span>|</span>
	                       <span>客服热线：400-820-6098</span>
	                       
	                   </p>
	                   <p id="copy">
	                       <span>Copyright  2007-2015 Boqii.com All Rights Reserved 光橙（上海）信息科技有限公司 版权所有</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪ICP备13034501号-2</a>
	                       <span>增值电信业务经营许可证：</span>
	                       <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪B2-20140120</a>
	                    </p>
	                    <p id="footimg">
	                        <a href="#" target="_blank">
	                            <img width="100" height="35" src="registerimg/foot_gs.png">
	                        </a>
	                        <a href="#" target="_blank">
	                            <img width="100" height="35" src="registerimg/foot_kx.png">
	                        </a>
	                        <a href="#" target="_blank">
	                            <img width="100" height="35" src="registerimg/foot_zx.png">
	                        </a>
	                        <a href="#" target="_blank">
	                            <img width="100" height="35" src="registerimg/foot_cx.png">
	                        </a>
	                    </p>
	                </div>
	            </div>
	        </div>
	</div>
	<!--右侧的购物车-->
	<div id="left-chioce">
		 
	</div>
	<!---->
	<div>
	
	</div>
	<!---->
	<div>
	
	</div>

</body>
<script type="text/javascript" src='js/shoppingindex.js'></script>
<script type="text/javascript" src="js/shoppingSearch.js"></script>

</html>
	
