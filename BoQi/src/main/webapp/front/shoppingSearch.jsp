<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'shoppingSearch.jsp' starting page</title>
    <base href="<%=basePath+"front/"%>">
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/shopping.css" rel="stylesheet" type="text/css" />
	<link href="css/publicThing.css" type="text/css" rel="stylesheet"> 

  </head>
  
  <body>
    <%@include file="publicThing.jsp" %>  

	<div id="ad-mod" style="display:none">
		<p class="ad-mod-auto" align="center">
	    	<a target="_blank" href="#">
	        	<img alt="" src="shoppingimg/ad-mod.png">
	        </a>
	    </p>
	</div>
	<div id="header">
		<div class="top-auto">
	    	<div id="logo">
	        	<a target="" href="#">
	        		<img id="boqilogo" src="shoppingimg/boqinet.png">
	        	</a>
	        </div>
	        <div id="top-search">
	        	<div style="padding:1px; background:#F30; height:38px;">
	           		<input id="search-text" class="search" type="text" action="shopping.html" method="get" placeholder="请输入商品名称!"/>
	           		<input type="submit" id="button" onclick="search()" value="搜索">
	        	</div>
	        </div>
	        <div id="s-search">
	        	热门搜索：
	        	<a target="" href="proSearch_findSearchPro.action?order=proid&ci=狗粮&ye=1">狗粮</a>
	            <a target="" href="proSearch_findSearchPro.action?order=proid&ci=宠物用品&ye=1">宠物用品</a>
	            <a target="" href="proSearch_findSearchPro.action?order=proid&ci=金毛&ye=1">金毛</a>
	            <a target="" href="proSearch_findSearchPro.action?order=proid&ci=贵宾犬&ye=1">贵宾犬</a>
	            <a target="" href="proSearch_findSearchPro.action?order=proid&ci=哈士奇&ye=1">哈士奇</a>
	            <a target="" href="proSearch_findSearchPro.action?order=proid&ci=雪纳瑞&ye=1">雪纳瑞</a>
	            <a target="" href="#">更多>></a>
	        </div>
	        <div id="ad-right">
	        	<a target="" href="#">
	        		<img id="boqilogo" src="shoppingimg/boqilogo2.png">
	        	</a>
	        </div>
	    </div>
	</div>
	<div id="lianjie">
		<div id="lianjie-auto">
	    	<div id="nav-left1">
	        	<a href="#">
	            	<span>全部商品分类</span>
	                <img src="shoppingimg/4tiao.png">
	            </a>
	        </div>
	        <div id="nav-left2">
	        	<a href="#">首页</a>
	            <a href="#">狗狗</a>
	            <a href="#">猫猫</a>
	            <a href="#">小宠</a>
	            <a href="#">水族</a>
	            <a href="#">品牌馆</a>
	            <a href="#">团购</a>
	            <a href="#">波奇服务</a>
	        </div>
	        <div id="nav-right">
	        	<div id="shop-car">
	            	<div id="shop-text">
	                	<img src="shoppingimg/shopcar.png">
	                    <a href="#">购物车</a>
	                </div>
	                <span>0<span>
	            </div>
	        </div>
	        <div id="allClassify">
	        
	        </div>
	    </div>
	</div>
	<div id="search">
		<div id="search-auto">
	    	<div id="search-one">
	        	<a href="#" target="_blank">首页</a>
	            >
	            <span style="font-size:12px;white-space:nowrap;">搜索结果页</span>
	        </div>
	        <div id="search-two" style="margin-left:10px;">
	        	<input id="search-text2" type="text" />
	            <input id="search-zoom" type="submit" value=""/>
	        </div>
	        <a id="search-3"href="#" target="_blank">清空已选条件</a>
	    </div>
	
	</div>
	
		<div id="maincontainer">
	    	<div id="listcontent">
	        	<div id="left-content">
	            	<div id="hot">
	                	<h2 id="bar-title">热卖推荐</h2>
	                    <ul class="hotlist">
	                    	<li>
	                        	<a  target="_blank">
	                            	<img src="shoppingimg/goods-EHD.jpg">
	                            </a>
	                            <div>
	                            	<strong class="price">¥ 25.00</strong>
	                                <span class="soldNum">已售28065</span>
	                            </div>
	                            <a target="_blank" class="goodsName"href="#">EHD 虱敌喷剂120ml 安全无毒灭虱子跳蚤蜱虫</a>
	                        </li>
	                        <li>
	                        	<a href="#" target="_blank">
	                            	<img src="shoppingimg/goods-fraen.jpg">
	                            </a>
	                            <div>
	                            	<strong class="price">¥ 154.00</strong>
	                                <span class="soldNum">已售182259</span>
	                            </div>
	                            <a class="goodsName"href="#">福来恩 犬猫灭蜱虫跳蚤喷剂250ml</a>
	                        </li>
	                        <li>
	                        	<a href="#" target="_blank">
	                            	<img src="shoppingimg/goods-baolu.jpg">
	                            </a>
	                            <div>
	                            	<strong class="price">¥ 34.50</strong>
	                                <span class="soldNum">已售124478</span>
	                            </div>
	                            <a class="goodsName"href="#">宝路 幼犬粮肉类奶蔬菜谷物配方狗粮1.3kg</a>
	                        </li>
	                    </ul>
	                </div>
	                <div id="brands">
	                	<h2 id="bar-title1">品牌推荐</h2>
	                    <ul>
	                    	<li>
	                        	<a href="#">
	                            	<img src="shoppingimg/tuijian1.jpg"/>
	                            </a>
	                        </li>
	                        <li  class="noright">
	                        	<a href="#">
	                            	<img src="shoppingimg/tuijian2.jpg"/>
	                            </a>
	                        </li>
	                        <li>
	                        	<a   href="#">
	                            	<img src="shoppingimg/tuijian3.jpg"/>
	                            </a>
	                        </li>
	                        <li  class="noright">
	                        	<a href="#">
	                            	<img src="shoppingimg/tuijian4.jpg"/>
	                            </a>
	                        </li>
	                        <li>
	                        	<a href="#">
	                            	<img src="shoppingimg/tuijian5.jpg"/>
	                            </a>
	                        </li>
	                        <li class="noright">
	                        	<a  href="#">
	                            	<img src="shoppingimg/tuijian6.jpg"/>
	                            </a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            <div id="right-content">
	            	<div id="filter-container">
	                	<div id="filter-title">品牌</div>
	                    <div id="filter-con-list">
							<c:forEach items="${allpinpai}" var="addr">
								<a href="proSearch_findSearchPro.action?order=proid&ci=${addr.brandName}&ye=1" class="filter-item-pinpai" onmouseover="changeColor1(this)" onmouseout="reColor1(this)">${addr.brandName}</a>
							</c:forEach>

	                    </div>
	                    <div id="more-filter-con">
	                    	<a href="#">
	                        	<span>更多</span>
	                            <img src="shoppingimg/more-down.png"/>
	                        </a>
	                    </div>
	                </div>
	                <div id="sort">
	                	<span id="sort-span">排序:</span>
	                   	 <a id="active" class="zonghe" onclick="orderBy()">综合排序</a>
	                        <a class="sort-left-a" id="xiaoliang" onclick="orderByCont()">
	                        	<span>销量</span>
	                            <img src="shoppingimg/sale-donw.png"/>
	                        </a>
	                        <a class="sort-left-a" id="jiage" onclick="orderByPrice()">
	                        	<span>价格</span>
	                            <img  src="shoppingimg/sale-num.png"/>
	                        </a>
	                        <a class="sort-left-a" id="xinping" onclick="orderByTime()">
	                        	<span>新品</span>
	                            <img  src="shoppingimg/sale-donw.png"/>
	                        </a>
	                        
	                        <span id="span-totalgoods">共${searchTotal}件商品</span>
	                            <span id="sort-page">
	                            	<em id="thisYe">${thisPage }</em>
	                                /<fmt:formatNumber type="number" value="${(searchTotal+20-searchTotal%20)/20}" maxFractionDigits="0"/>
	                                <em id="allye"></em>
	                      	</span>
	                        <a id="sort-right-a1" href="proSearch_findPagePro.action?ye=${thisPage-1 }"><</a>
	                        <a id="sort-right-a2" href="proSearch_findPagePro.action?ye=${thisPage+1 }">></a>    
	                </div>
	                <div class="product-container">
	                	<ul>
	                	
	                	<c:forEach items="${getSearch}" var="item">
	                    	<li>
	                        	<a href="../productServlet?op=openThePro&pid=${item.proid}">
	                            	<img src="../${item.firstPic }" alt="商品图片" style="height:210px;width:210px;">
	                            </a>
	                            <p class="product-p1">
	                            	<strong>¥ ${item.bqpri }</strong>
	                                <span>直降</span>
	                                <span>赠豆</span>
	                                <em class="spanX">免运费</em>
	                            </p>
	                            <p class="product-p2">
	                            	<a href="../productServlet?op=openThePro&pid=${item.proid}">${item.proname}</a>
	                            </p>
	                            <p class="product-p3">送50个波奇豆抵5元现金使用 16省免运费</p>
	                            <div class="product-status" style="margin-top:5px;">
	                            	<span>已售${item.prosales}</span>
	                            </div>
	                            <div class="operation">
	                            	<div class="add-cart">
	                                	<a>
	                                    <img src="shoppingimg/cart.png">
	                                    <span>加入购物车</span>
	                                    </a>
	                                </div>
	                                <div class="do-attention">
	                                	<a>
	                                    	<img src="shoppingimg/attention-star.png">
	                                    	<span>加入收藏</span>
	                                    </a>
	                                </div>
	                            </div>
	                        </li>
	                    </c:forEach> 
	                    </ul>
	                </div>
	                <div id="pagination" style="float:right;">
	              		  	<a id="beginpage" class="thisye1" href="proSearch_findPagePro.action?ye=1">首页</a>
	                		<a id="lastpage" class="thisye1" href="proSearch_findPagePro.action?ye=${thisPage-1 }">上一页></a>
							<span id="thisthere"></span>
	                        <a id="nextpage" class="thisye1" href="proSearch_findPagePro.action?ye=${thisPage+1 }">下一页></a>
	                        <a id="endpage" class="thisye1" href="proSearch_findPagePro.action?ye=${(searchTotal+20-searchTotal%20)/20 }">">末页</a>
	                        <span class="total_page">共<fmt:formatNumber type="number" value="${(searchTotal+20-searchTotal%20)/20}" maxFractionDigits="0"/>页</span>
	                        <span>
	                        	到第
	                            <input class="page_text" type="text"/>
	                           	页
	                        </span>
	                        <a class="thisye1" onclick="skippage()">确定</a>
	                    </div>
	       		</div>
	        </div>
	    </div>
	
	<div id="foot_service">
		<div id="foot_s_body">
	    	<dl class="foot_pro">
	        	<dt class="foot_pro_1"><img src="shoppingimg/zheng.png"></dt>
	            <dd class="name">正品保障</dd>
	            <dd>全场正品 假一罚十</dd>
	        </dl>
	        <dl class="foot_pro">
	        	<dt class="foot_pro_2"><img src="shoppingimg/quicky.png"></dt>
	            <dd class="name">闪电发货</dd>
	            <dd>江浙沪皖满60元免运费</dd></dl>
	        <dl class="foot_pro">
	        	<dt class="foot_pro_3"><img src="shoppingimg/seven.png"></dt>
	            <dd class="name">无忧退换</dd>
	            <dd>七天退换　购买无忧</dd></dl>
	        <dl class="foot_pro">
	        	<dt class="foot_pro_4"><img src="shoppingimg/good.png"></dt>
	            <dd class="name">优质服务</dd>
	            <dd>品类丰富　多快好省</dd></dl>
	        <dl class="foot_pro">
	        	<dt class="foot_pro_5"><img src="shoppingimg/xing.png"></dt>
	            <dd class="name">诚信电商</dd>
	            <dd>宠友放心　值得信赖</dd></dl>
	    </div>
	</div>
	<div id="link">
		<div id="link-auto">
	    	<dl>
	        	<dt>新手上路</dt>
	            <dd>
	            	<a href="#" target="_blank">购物流程</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">现金账户</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">优惠券</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">订单查询</a>
	            </dd>
	            <dd>
	            	<a href="#" target="_blank">服务协议</a>
	            </dd>
	        </dl>
	        <dl>
	        	<dt>购买方式</dt>
	            <dd>
	            	<a href="#" target="_blank">余额支付</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">网上支付</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">银行汇款</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">货到付款</a>
	            </dd>
	        </dl>
	        <dl>
	        	<dt>配送方式</dt>
	            <dd>
	            	<a href="#" target="_blank">配送方式</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">收费标准</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">配送时间</a>
	            </dd>
	        </dl>
	        <dl>
	        	<dt>售后服务</dt>
	            <dd>
	            	<a href="#" target="_blank">如何退换货</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">如何退款</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">退换货流程 </a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">客服电话</a>
	            </dd>
	        </dl>
	        <dl>
	        	<dt>常见问题</dt>
	            <dd>
	            	<a href="#" target="_blank">注册登录</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">积分制度</a>
	            </dd>
	             <dd>
	            	<a href="#" target="_blank">热点问题</a>
	            </dd>
	        </dl>
	    </div>
	</div>
	<div id="footer">
		<div id="footer-auto">
	    	<div id="footer-bot">
	        	<p id="footer-link">
	            	<a href="#" target="_blank">关于波奇</a>
	                <span>|</span>
	                <a href="#" target="_blank">友情链接</a>
	                <span>|</span>
	                <a href="#" target="_blank">诚聘英才</a>
	                <span>|</span>
	                <a href="#" target="_blank">联系我们</a>
	                <span>|</span>
	                <a href="#" target="_blank">网站地图</a>
	                <span>|</span>
	                <a href="#" target="_blank">意见反馈</a>
	                <span>|</span>
	                <a href="#" target="_blank">帮助中心</a>
	                <span>|</span>
	                <span>客服热线：400-820-6098</span>
	                
	            </p>
	            <p id="copy">
	            	<span>Copyright © 2007-2015 Boqii.com All Rights Reserved 光橙（上海）信息科技有限公司 版权所有</span>
	                <a href="#" target="_blank">沪ICP备13034501号-2</a>
	                <span>增值电信业务经营许可证：</span>
	                <a href="#" target="_blank">沪B2-20140120</a>
	            </p>
	            <p id="footimg">
	            	<a href="#" target="_blank">
	                	<img width="100" height="35" src="shoppingimg/foot_gs.png">
	                </a>
	                <a href="#" target="_blank">
	                	<img width="100" height="35" src="shoppingimg/foot_cx.png">
	                </a>
	                <a href="#" target="_blank">
	                	<img width="100" height="35" src="shoppingimg/foot_kx.png">
	                </a>
	                <a href="#" target="_blank">
	                	<img width="100" height="35" src="shoppingimg/foot_zx.png">
	                </a>
	            </p>
	        </div>
	    </div>
	</div>
	<div id="left-chioce">
		<div class="left-choice-nav">
	    	<ul>
	            <a href="#" ><li>
	            	<img src="shoppingimg/left-choice-head.png"  style="margin-top: 33px;"/><br/>
	            </li></a>
	            <a href="#" style="height:100px;" ><li>
	                <img src="shoppingimg/cart.png"/>
	                <p>购物车</p>
	                <p><span class="one">1</span></p>
	            </li></a>
	            <a href="#" ><li>
	                <img src="shoppingimg/baike.png"/>
	                <p>资产</p>
	            </li></a>
	            <a href="#" ><li>
	                <img src="shoppingimg/attention-star.png"/>
	                <p>收藏</p>
	            </li></a>
	            <a href="#" ><li>
	                <img src="shoppingimg/attention-star.png"/>
	                <p>咨询</p>
	            </li></a>
	            <a href="#" >
	            <li>
	                <img src="shoppingimg/attention-star.png"/>
	                <p>APP</p>
	            </li></a>
	            <li style="height:101px;"></li>
	            <a href="#toolbar" class="socket"><li>
	                <img src="shoppingimg/attention-star.png"/>
	                <p>TOP</p>
	            </li></a>
	        </ul>
	    </div>
	</div>
  </body>
</html>
<script type="text/javascript" src="jquery/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/shopping.js"></script>
<script type="text/javascript" src="js/shoppingSearch.js"></script>
<script>
//最下面的页面选择显示
function showPage(){
	var yeshi = parseInt(${(allsearch+19)/20});
	$("#allye").replaceWith(yeshi);
	if((${allsearch})<21){
		$("#pagination").css("display","none");
	}else if((${allsearch})<181){
		$("#pagination").css("display","block");
		for(var i=1;i<=yeshi;i++){
			var turl = location.search;
			var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
			var yeye = turl.substring(turl.indexOf("ye=")+3);
			if(yeye == i){
				$("#thisthere").append("<a href='../productServlet?op=searchBy&ci="+hehe+"&ye="+i+"&order=proid' class='thisye' style='margin-left:5px;'>"+i+"</a>");
			}else{
				$("#thisthere").append("<a href='../productServlet?op=searchBy&ci="+hehe+"&ye="+i+"' class='thisye1' style='margin-left:5px;'>"+i+"</a>");
			}		
		}
	}else{
		$("#pagination").css("display","block");
	}
	var turl = location.search;
	var yeye = parseInt((turl.substring(turl.indexOf("ye=")+3)));  //当前的页码
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	$("#thisYe").empty();
	$("#thisYe").append(yeye);
	//判断是否显示首页，上一页
	if(yeye == 1){
		$("#beginpage").css("display","none");
		$("#lastpage").css("display","none");
	}else{
		$("#beginpage").css("display","inline");
		$("#lastpage").css("display","inline");
	}
	//判断是否显示下一页，末页
	if(yeye == ${(allsearch+20-allsearch%20)/20}){
		$("#nextpage").css("display","none");
		$("#endpage").css("display","none");
	}else{
		$("#nextpage").css("display","inline");
		$("#endpage").css("display","inline");
	}
	//判断排序的显示
	if(order.indexOf('prosales%20desc,proid%20desc')!= -1){  //%20 == 空格
		$(".zonghe").css("background","#f63");
		$(".zonghe").css("color","#fff");
		$("#xiaoliang").css("background","#fff");
		$("#xiaoliang").css("color","black");
		$("#jiage").css("background","#fff");
		$("#jiage").css("color","black");
		$("#xinping").css("background","#fff");
		$("#xinping").css("color","black");
	}else if(order.indexOf('prosales%20desc')!= -1){
		$(".zonghe").css("background","#fff");
		$(".zonghe").css("color","black");
		$("#xiaoliang").css("background","#f63");
		$("#xiaoliang").css("color","#fff");
		$("#jiage").css("background","#fff");
		$("#jiage").css("color","black");
		$("#xinping").css("background","#fff");
		$("#xinping").css("color","black");
	}else if(order.indexOf('prosales%20asc')!= -1){
		$(".zonghe").css("background","#fff");
		$(".zonghe").css("color","black");
		$("#xiaoliang").css("background","#f63");
		$("#xiaoliang").css("color","#fff");
		$("#jiage").css("background","#fff");
		$("#jiage").css("color","black");
		$("#xinping").css("background","#fff");
		$("#xinping").css("color","black");
	}else if(order.indexOf('bqpri%20desc')!= -1){
		$(".zonghe").css("background","#fff");
		$(".zonghe").css("color","black");
		$("#xiaoliang").css("background","#fff");
		$("#xiaoliang").css("color","black");
		$("#jiage").css("background","#f63");
		$("#jiage").css("color","#fff");
		$("#xinping").css("background","#fff");
		$("#xinping").css("color","black");
	}else if(order.indexOf('bqpri%20asc')!= -1){
		$(".zonghe").css("background","#fff");
		$(".zonghe").css("color","black");
		$("#xiaoliang").css("background","#fff");
		$("#xiaoliang").css("color","black");
		$("#jiage").css("background","#f63");
		$("#jiage").css("color","#fff");
		$("#xinping").css("background","#fff");
		$("#xinping").css("color","black");
	}else if(order.indexOf('proid%20asc')!= -1){
		$(".zonghe").css("background","#fff");
		$(".zonghe").css("color","black");
		$("#xiaoliang").css("background","#fff");
		$("#xiaoliang").css("color","black");
		$("#jiage").css("background","#fff");
		$("#jiage").css("color","black");
		$("#xinping").css("background","#f63");
		$("#xinping").css("color","#fff");
	}else if(order.indexOf('proid%20desc')!= -1){
		$(".zonghe").css("background","#fff");
		$(".zonghe").css("color","black");
		$("#xiaoliang").css("background","#fff");
		$("#xiaoliang").css("color","black");
		$("#jiage").css("background","#fff");
		$("#jiage").css("color","black");
		$("#xinping").css("background","#f63");
		$("#xinping").css("color","#fff");
	}
}
//下一页
function nextpage(){
	var turl = location.search;
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	var yeye = parseInt((turl.substring(turl.indexOf("ye=")+3)))+1;
	if(yeye<=${(allsearch+20-allsearch%20)/20}){
		window.location.href="../productServlet?order="+order+"&op=searchBy&ci="+hehe+"&ye="+yeye;
	}
}
//上一页
function lastpage(){
	var turl = location.search;
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	var yeye = parseInt((turl.substring(turl.indexOf("ye=")+3)))-1;
	if(yeye>0){
		window.location.href="../productServlet?order="+order+"&op=searchBy&ci="+hehe+"&ye="+yeye;
	}
}
//最后一页
function endpage(){
	var turl = location.search;
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	var yeye = parseInt((turl.substring(turl.indexOf("ye=")+3)))+1;
	if(yeye<=${(allsearch+20-allsearch%20)/20}){
		window.location.href="../productServlet?order="+order+"&op=searchBy&ci="+hehe+"&ye="+${(allsearch+20-allsearch%20)/20};
	}
}
//首页
function beginpage(){
	var turl = location.search;
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	var yeye = parseInt((turl.substring(turl.indexOf("ye=")+3)));
	if(yeye!=1){
		window.location.href="../productServlet?order="+order+"&op=searchBy&ci="+hehe+"&ye="+1;
	}
}
function skippage(){
	var skipye = $(".page_text").val();
	
	//var turl = location.search;
	//var yeye = parseInt((turl.substring(turl.indexOf("ye=")+3)));  //当前的页码
	//var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	//var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	//if(skipye == yeye){
	//}else if(skipye>0 && skipye<=${(allsearch+20-allsearch%20)/20}){
		//window.location.href="../productServlet?order="+order+"&op=searchBy&ci="+hehe+"&ye="+skipye;
	//}else if(skipye>${(allsearch+20-allsearch%20)/20}){
		//window.location.href="../productServlet?order="+order+"&op=searchBy&ci="+hehe+"&ye="+${(allsearch+20-allsearch%20)/20};
	//}
	window.location.href="proSearch_findPagePro.action?ye="+skipye;
}
//综合排序
function orderBy(){
	var turl = location.search;
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	window.location.href="../productServlet?order=prosales desc,proid desc&op=searchBy&ci="+hehe+"&ye="+1;
}
//根据销量来排序
function orderByCont(){
	var turl = location.search;
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	if(order.indexOf('prosales')!= -1){
		if(order.indexOf('prosales asc')!= -1){
			window.location.href="../productServlet?order=prosales desc&op=searchBy&ci="+hehe+"&ye="+1;
		}else{
			window.location.href="../productServlet?order=prosales asc&op=searchBy&ci="+hehe+"&ye="+1;
		}
	}else{
		window.location.href="../productServlet?order=prosales desc&op=searchBy&ci="+hehe+"&ye="+1;
	}
}
//根据价格来排序
function orderByPrice(){
	var turl = location.search;
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	if(order.indexOf('bqpri')!= -1){
		if(order.indexOf('bqpri asc')!= -1){
			window.location.href="../productServlet?order=bqpri desc&op=searchBy&ci="+hehe+"&ye="+1;
		}else{
			window.location.href="../productServlet?order=bqpri asc&op=searchBy&ci="+hehe+"&ye="+1;
		}
	}else{
		window.location.href="../productServlet?order=bqpri desc&op=searchBy&ci="+hehe+"&ye="+1;
	}
}
//根据时间来排序
function orderByTime(){
	var turl = location.search;
	var order = turl.substring(turl.indexOf("order")+6,turl.indexOf("&op")); //搜索关键词的排序方法
	var hehe = turl.substring(turl.indexOf("ci=")+3,turl.lastIndexOf("&")); //搜索关键词的转码
	if(order.indexOf('proid')!= -1){
		if(order.indexOf('proid asc')!= -1){
			window.location.href="../productServlet?order=proid desc&op=searchBy&ci="+hehe+"&ye="+1;
		}else{
			window.location.href="../productServlet?order=proid asc&op=searchBy&ci="+hehe+"&ye="+1;
		}
	}else{
		window.location.href="../productServlet?order=proid desc&op=searchBy&ci="+hehe+"&ye="+1;
	}
}
window.onload=showPage(); 
</script>
