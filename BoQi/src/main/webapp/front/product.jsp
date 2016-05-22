<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>商品详情</title>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/product.css">
	<link href="css/publicThing.css" type="text/css" rel="stylesheet"> 
	
	<script type="text/javascript" src="jquery/jquery.1.4.2-min.js"></script>
	<!--<script type="text/jscript" src="js/shopping.js"></script>-->
	<script type="text/jscript" src="js/product.js"></script>
	<!--<script type="text/javascript" src="jquery/jquery.jqzoom.js"></script>-->
	<script>
		function buy(){
		var usidName = $(".plaseLogin").text();
		if(usidName=="请登录"){
			alert("请先登录");
		}else{
			var proid=$(".bianhao").html();
			var usid = "${loginUser.usid}";
			var inventory = $(".counts").val();
			var uname=$("#hidden").val();
			var uname = "${loginUser.uname}";
			$.post("../shopCarServlet?d="+new Date,{op:"findShopCar",uname:uname});
			$.post("../shopCarServlet?d="+new Date,{op:"findSingle",proid:proid},function(data){
				if(data==1){ //商品已存在，数量加1
					$.post("../shopCarServlet?d="+new Date,{op:"updateShopCar",proid:proid,usid:usid,inventory:inventory},function(data){
						if(data==1){  //数量更改成功，弹出提示框
							window.open ("buy.html", "newwindow", "height=250, width=350, top=300, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
						}else{
							alert("加入购物车失败！");
						}
					});
				}else{  //商品加入购物车表
					$.post("../shopCarServlet?d="+new Date,{op:"addShopCar",proid:proid,usid:usid,inventory:inventory},function(data){
						if(data==1){
						    window.open ("buy.html", "newwindow", "height=250, width=350, top=300, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
						}else{
							alert("加入购物车失败！");
						}
					});
				}
				 
			});
		}
	}
	</script>
  </head>
  
  <body>
    <%@include file="publicThing.jsp" %>  
    <div id="ad-mod" style="display:none">

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
           		<input id="search-text" type="text" action="shopping.html" method="get" placeholder="请输入商品名称!"/>
           		<input type="submit" id="button" value="搜索"/>
           		<input type="hidden" id="hidden" value="${loginUser.uname }"/>
        	</div>
        </div>
        <div id="s-search">
        	热门搜索：
        	<a target="" href="#">狗粮</a>
            <a target="" href="#">宠物用品</a>
            <a target="" href="#">金毛</a>
            <a target="" href="#">贵宾犬</a>
            <a target="" href="#">哈士奇</a>
            <a target="" href="#">雪纳瑞</a>
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
	<div id="center">
   	  <div id="image">   

	<div id="vertical" class="bigImg">
		<img src="productimg/shoppicpath11400039600_thumb.jpg" width="300" height="300" alt="" id="midimg" />
		<div style="display:none;" id="winSelector"></div>
	</div><!--bigImg end-->
	
	<div class="smallImg">
		<div class="scrollbutton smallImgUp disabled"></div>
		<div id="imageMenu">
			<ul>
                <p class="imgleft"><</p>
                <p class="imgright">></p>
				${productID.fivePics }
			</ul>
		</div>
		<div class="scrollbutton smallImgDown"></div>
	</div><!--smallImg end-->
	
	<div id="bigView" style="display:none;"><img width="800" height="800" alt="" src="" /></div>
	
      </div>
      <div id="introduct">
          <p class="title"><span id="_title">${productID.proname }</span><span class="weight" id="_weight">${productID.nature }</span></p>
        <p class="red">买即送妙鲜包10个 16省免运费</p>
        <div id="fengen"></div>
        <div class="price">
        <p>波&nbsp;奇&nbsp;价:￥<span id="_price">${productID.bqpri }</span></p>
         <p>市&nbsp;场&nbsp;价:￥<span >${productID.promarprice }</span></p>
         <p>促销信息:&nbsp;<span class="red">赠送下方热销商品，赠完即止</span></p>
         </div>
        <div id="down">
         <br/>
         <p>配&nbsp;送&nbsp;至:&nbsp;<select class="province">
         						<option>湖南</option>
                                <option>广州</option>
                                <option>天津</option>
                           </select>
                          有货:&nbsp; <span class="red">支持使用优惠券</span>
         </p>
         <p>购买数量:&nbsp;<input class="reduce" type="button" value="-"/>
             <input class="counts" id="_count" type="text" value="1"/>
             <input class="plus" type="button" value="+"/></p>
            <p>赠&nbsp;&nbsp;&nbsp;品:&nbsp;<span class="free"><a target="_blank" href="" id="_other">顽皮Wanpy鸡肉鲜封包妙鲜包100g狗湿粮×5</a>&nbsp;&nbsp;(买1件送5件)</span></p>
            <p><a target="_blank" onclick="buy()" ><span class="now">立即购买</span></a><a class="input">加入购物车</a><a target="_blank" href=""><span class="collect" class="free"><a href="" style="  background:url(productimg/white.png) no-repeat;  padding-left:20px;">收藏商品</a></span></p>
        </div>
      </div>
      <div id="polish">
      	 <div class="seven">
         	<ul>
            	<li><img src="productimg/1.png"/>
                	<p>100%</p>
                    <p>正品保障</p>
                </li>
                <li><img src="productimg/2.png"/>
                	<p>江浙沪皖</p>
                    <p>满60免运费</p>
                </li>
                <li><img src="productimg/3.png"/>
                	<p>7天</p>
                    <p>无忧退换</p>
                </li>
            </ul>
         </div>
      <div class="pingpai">
         <p>所属品牌：<span style="color:blue;">皇家</span></p>
         <p>所属编号：<span class="bianhao">${productID.proid}</span></p>
         <p>已&nbsp;&nbsp;&nbsp;售：<span style="color:#F33;">${productID.prosales}件</span></p>
         <p>满意指数：<img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><span style=""color:#F33>4.9分</span></p>
         <p><span style="color:blue;margin-left:30px;">已有1408人评论</span></p>
         <p style="color:#Ccc;margin:0px auto;">---------------------------------------</p>
      	 <p>授权认证：授权文件</p>
         <p>对商品有疑问?<img style="margin-left:5px;margin-top:10px;" src="productimg/look.png"/></p>
      </div>
      <div id="kehuduan">
      		<img class="kehuduan" src="productimg/wb.gif"/>
      		
     		<p>首次下单满39元送39元</p>
            <p>波奇客户端</p>
       </div>
     </div>
    </div>
    <div id="recommend">
      <ul>
    	<p style="margin-left:5px;margin-top:5px;">同类产品推荐</p>
        <li>
        <img src="productimg/shoppicpath11428028871_thumb.jpg"/>
        <p><span style="color:#F00;font-size:15px;">￥188.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#ccc;">已售297843</span></p>
        <p><a href="">法国皇家ROYAL CANIN泰迪贵宾成犬粮专用狗粮3kg PD30</a></p>
        </li>
        <li>
        <img src="productimg/shoppicpath11421075316_thumb.jpg"/>
         <p><span style="color:#F00;font-size:15px;">￥539.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#ccc;">已售196813</span></p>
        <p><a href="">冠能PRO PLAN成犬粮良好消化配方狗粮(原鸡肉米饭)15kg</a></p>
        </li>
        <li>
        <img src="productimg/shoppicpath11422061676_thumb.jpg"/>
         <p><span style="color:#F00;font-size:15px;">￥103.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#ccc;">已售297843</span></p>
        <p><a href="">法国皇家ROVAL CANIN 10个月-8岁小型成犬专用狗粮2kgPR27</a></p>
        </li>
        <li>
        <img src="productimg/shoppicpath11417873377_thumb.jpg"/>
          <p><span style="color:#F00;font-size:15px;">￥44.50&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#ccc;">已售297843</span></p>
        <p><a href="">宝路 中小型成犬粮牛肉肝蔬菜及谷物狗粮1.8kg</a></p>
        </li>
        <li>
        <img src="productimg/shoppicpath11382074508_thumb.jpg"/>
         <p><span style="color:#F00;font-size:15px;">￥274.70&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color:#ccc;">已售297843</span></p>
        <p><a href="">宝路 怡威成犬粮狗粮15kg</a></p>
        <li>
      </ul>
    </div>
    <div id="content">
    	<ul>
        	<a href="#information"><li>商品介绍</li></a>
            <a href="#pinglun"><li>商品评论</li></a>
            <a href="#service"><li>售后服务</li></a>
            <a href="#salecount"><li>购买记录</li></a>
        </ul>
        <div id="information">
        	<img src="productimg/introduct.png"/>
        </div>
    </div>
    <div id="pinglun">
    <p style="text-align:left;color:#F33;font-size:23px;border-bottom:3px solid #F33;width:105px;margin-right:832px;">商品评论</p>
        <div class="score">
        	<div class="sleft">
            	<p><span style="color:#F33;font-size:52px;">4.9</span>分</p>
                <img src="productimg/favicon.ico">
                <img src="productimg/favicon.ico">
                <img src="productimg/favicon.ico">
                <img src="productimg/favicon.ico">
                <p>共215人评论</p>
            </div>
            <div class="scenter">
            	<p>好评(66):</p>
                <div class="mind">
                    <div class="good"></div>
                </div>
                <p>中评(3):</p>
                <div class="mind">
                    <div class="middle"></div>
                </div>
                <p>差评(4):</p>
                <div class="mind">
                    <div class="bad"></div>
                </div>
            </div>
            <div class="sright">
            	<p>评论获波奇豆</p>
                <ul>
                	<li>下单用户才能发表评论</li>
                    <li style="color:#F33;">1豆=0.1元</li>
                    <li>精华评论更有额外豆奖励</li>
                </ul>
                <p><span class="fabiao">发表评论</span></p>
            </div>
        </div>
        <div id="menu">
        	<ul>
            	<li>全部(215)</li>
                <li>好评(210)</li>
                <li>中评(1)</li>
                <li>差评(4)</li>
                <li>晒单(21)</li>
            </ul>
        </div>
        <div id="guest">
        	<ul>
            	<li>
                	<div class="gleft">
                	<img src="productimg/none1.gif"/>
                    <p>fskdf</p>
                    </div>
                    <div class="gright">
                    	<p>评分：<img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><span>5分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖励10个波奇豆</span></p>
                        <p>内容：<span style="color:#000;">发货快，态度好</span> 2015-11-12 11:43</p>
                    </div>
                </li>
                <li>
                	<div class="gleft">
                	<img src="productimg/none1.gif"/>
                    <p>fskdf</p>
                    </div>
                    <div class="gright">
                    	<p>评分：<img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><span>5分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖励10个波奇豆</span></p>
                        <p>内容：<span style="color:#000;">发货快，态度好</span> 2015-11-12 11:43</p>
                    </div>
                </li>
                <li>
                	<div class="gleft">
                	<img src="productimg/none1.gif"/>
                    <p>fskdf</p>
                    </div>
                    <div class="gright">
                    	<p>评分：<img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><span>5分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖励10个波奇豆</span></p>
                        <p>内容：<span style="color:#000;">发货快，态度好-</span> 2015-11-12 11:43</p>
                    </div>
                </li>
                <li>
                	<div class="gleft">
                	<img src="productimg/none1.gif"/>
                    <p>fskdf</p>
                    </div>
                    <div class="gright">
                    	<p>评分：<img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><img src="productimg/favicon.ico"><span>5分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖励10个波奇豆</span></p>
                        <p>内容：<span style="color:#000;">发货快，态度好</span> 2015-11-12 11:43</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div id="service">
    	 <p style="text-align:left;color:#F33;font-size:23px;border-bottom:3px solid #F33;width:105px;margin-right:832px;">售后服务</p>
         	<ul class="th">
            	<li style="background:url(productimg/1.png) no-repeat;padding-left:130px;" >
                    <span>正品保障</span>
                    <p>精选挑选供货商，严格审核产品质量和源头，承诺假一赔十。</p>
                </li>
                <li style="background:url(productimg/2.png) no-repeat;padding-left:130px;">
                    <span>7天免费退换货</span>
                    <p>商品存在质量,外包装，性能上的问题，7天无条件免费退货。</p>
                </li>
                <li style="background:url(productimg/3.png) no-repeat;padding-left:130px;" >
                    <span>正规发票</span>
                    <p>波奇网为所有客户开具发票，作为客户质保凭证,请顾客自行保留作为后续质保之需。</p>
                </li>
            </ul>
            <div class="rule">
            	<span>退换货运费规定</span>
                <ul class="tuihuo">
                	<li>凡是由商品质量问题导致的退换货，相应产生的运费由波奇网提供</li>
                    <li>非质量问题的商品退换货，运费由客户承担。</li>
                    <li>退货而产生的运费会在商品退款时扣除。</li>
                </ul>
                <span style="padding-top:20px;">温馨提示</span>
                <p class="aa">由于部分商品包装更换较为频繁，因此您收到的货品有可能与图片不完全一致，请以您收到的商品实物为准，同时我们会尽量做到及时更新。由此给您带来的不便请多多谅解，谢谢！</p>
            </div>
    </div>
    <div id="salecount">
    	<p style="text-align:left;color:#F33;font-size:23px;border-bottom:3px solid #F33;width:105px;margin-right:832px;">购买记录</p>
        <center>
        <table>
        	<tr>
            	<th>购买用户</th>
                <th>购买数量</th>
                <th>规格</th>
                <th>购买时间</th>
            </tr>
            <tr class="tables">
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
           <tr>
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
            <tr>
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
            <tr>
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
            <tr>
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
            <tr>
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
            <tr>
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
            <tr>
            	<td>bq***71</td>
                <td>1</td>
                <td>默认规格</td>
                <td>2015-11-18 00:31:22</td>
            </tr>
        </table>
        </center>
    </div>
<div id="left-chioce">
	<div class="left-choice-nav">
    	<ul>
            <a href="#" class="kefu" ><li>
            	<img src="shoppingimg/left-choice-head.png"  style="margin-top: 20px;margin-left:2px;s"/><br/>
            </li></a>
            <a href="#" ><li>
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
            <a href="#" ><li>
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
