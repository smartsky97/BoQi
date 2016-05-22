<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath+"/front/"%>">
    
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/car.css">
	<link href="css/publicThing.css" type="text/css" rel="stylesheet"> 
	
	<script type="text/javascript" src=jquery/jquery.1.4.2-min.js></script>
	<script type="text/javascript" src="js/car.js"></script>	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script>
	var uname = "${loginUser.uname}";
	$.post("../shopCarServlet?d="+new Date,{op:"findShopCar",uname:uname});
	
	$(function(){
		showTotal();
	});
	function showTotal(){
		var total=0;
		//获得已选中复选框
		$(":checkbox[name=list][checked=true]").each(function(){
			var id=$(this).val();
			//通过id找到当前小计元素，获取他的text()
			var text=$("#"+id+"small").text();
			total+=Number(text);
		});
		//显示总计
		$(".money").text(total);
	}
	function gopay(){
		var bbb= $("#mytable").children("tbody").children("tr");
		var coun = $("#mytable").children("tbody").children("tr").length;
		var song ="";
		for(var i=0;i<coun;i++){
			if($("#mytable").children("tbody").children("tr").eq(i).children("#checkeded").children(".list").attr('checked')){
				var kaka = $("#mytable").children("tbody").children("tr").eq(i).children("#checkeded").children(".list");
				song+=kaka.val()+","+$("#mytable").children("tbody").children("tr").eq(i).children(".pname_product").children("a").html()+","+$("#mytable").children("tbody").children("tr").eq(i).find(".price_product").html()+","+$("#mytable").children("tbody").children("tr").eq(i).find(".counts_product").val()+","+$("#mytable").children("tbody").children("tr").eq(i).find(".small_product").html()+";";
			}
		}
		$.post("../shopCarServlet?d="+new Date,{op:"saveshopcar",song:song},function(){
			window.location.href="paymoney.jsp";
		});
	}
	</script>
  </head>
  
  <body>
 	<%@include file="publicThing.jsp" %>  
    
    <div id="ad-mod" style="display:none"></div>
    
    <div id="center">
        <div id="cleft">
                <img src="registerimg/logo.gif"/>
         </div>
        <p class="point">>>></p>
        <div id="cright">
            <div class="red">
            </div>
            <div class="number">
                <ul>
                    <li  class="one">
                        <span>1</span>
                        <p>我的购物车</p>
                    </li>
                    <li  class="two">
                        <span>2</span>
                        <p>核对订单信息</p>
                    </li>
                    <li  class="three">
                        <span>3</span>
                        <p>订单提交成功</p>
                    </li>
                </ul>
            </div>
        </div>
        <p style="float:left;margin-left:-250px;margin-top:160px;">江浙沪皖满60即免运费</p>
        <p style="float:right;margin-right:-350px;margin-top:160px;"><a target="_blank" href="">继续购物></a></p>
        <div id="product">
                <table style="border:1px solid green" width="100%" border="0" cellspacing="0" collpadding="0">
                    <tr class="pmenu">
                        <td class="pname">商品</td>
                        <td class="price">波奇价(元)</td>
                       <!--  <td class="cheap">优惠</td> -->
                        <td class="acounts">数量</td>
                        <td class="mall">小计(元)</td>
                        <td class="active">操作</td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" id="mytable" class="productinfo">
                	<c:forEach items="${findAllcar}" var="item">
                		<tr class="product_list" style="border-bottom: 1px dashed grey;min-height:200px;">
	                		<td id="checkeded" algin="left">
                				<input type="checkbox" name="list" value="${item.proid }" class="list" style="margin-left:50px;margin-top:40px" />
                			</td>
	                		<td class="pname_product">
	                            <img src="../${item.picture}" alt="图片暂时为空" style="width:125px;height:125px;"/>
	                            <a >${item.proname}</a>
	                        </td>
	                        <td class="price_product">${item.bqpri }</td>
	                        <td class="acounts_product">
	                            <input class="reduce_product" type="button" onclick="jiansu()" id="${item.proid }jian" value="-"/>
	                            <input class="counts_product" type="text" id="${item.proid }inventory" value="${item.inventory }"/>
	                            <input class="plus_product" type="button" onclick="zensu()" id="${item.proid }jia" value="+"/>
	                        </td>
                        	<td class="small_product" id="${item.proid }small">${item.inventory*item.bqpri }</td>
                        	<td class="active_product">
                           		<a target="_blank" href="">移入收藏夹</a>
                            	<a href="javascript:void(0)" class="delete" id="${ item.proid}delete" onClick="del(this)">删除</a>
                        	</td>
                    	</tr>
                	</c:forEach>
                </table>
            </div> 
        <!-- <div id="dingdan" display="none">
        	<p>收货人信息</p>
        	<a blank="_target">+<span>新增收货地址</span></a>
        	<p>支付方式</p>
        	<ul>
	        	<a blank="_target">
	        		<li>在线支付</li>
	        	</a>
	        	<a blank="_target">
	        		<li>在线支付</li>
	        	</a>
	        	<a blank="_target">
	        		<li>在线支付</li>
	        	</a>
	        	<a blank="_target">
	        		<li>在线支付</li>
	        	</a>
        	</ul>
        </div> -->
        <div id="jiesuan">
            <ul>
                <li class="all">全选</li>
                <li class="delete">删除选中的商品</li>
                <li class="clean">清空购物车</li>
                <li class="more">已选择<span class="four">4</span>件,总价：￥<span class="money">1776.00</span><a  onclick="gopay()" class="go">去结算</a></li>
            </ul>
        </div>
    </div>
    <div id="foot">
        	<div id="footer-auto">
                <div id="footer-bot">
                    <p id="footer-link">
                        <a href="#" target="_blank" >关于波奇</a>
                        <span>|</span>
                        <a href="#" target="_blank" >友情链接</a>
                        <span>|</span>
                        <a href="#" target="_blank" >诚聘英才</a>
                        <span>|</span>
                        <a href="#" target="_blank" >联系我们</a>
                        <span>|</span>
                        <a href="#" target="_blank" >网站地图</a>
                        <span>|</span>
                        <a href="#" target="_blank" >意见反馈</a>
                        <span>|</span>
                        <a href="#" target="_blank" >帮助中心</a>
                        <span>|</span>
                        <span>客服热线：400-820-6098</span>
                        
                    </p>
                    <p id="copy">
                        <span>Copyright  2007-2015 Boqii.com All Rights Reserved 光橙（上海）信息科技有限公司 版权所有</span>
                        <a href="#" target="_blank" onmouseover="" onmouseout="">沪ICP备13034501号-2</a>
                        <span>增值电信业务经营许可证：</span>
                        <a href="#" target="_blank" onmouseover="" onmouseout="">沪B2-20140120</a>
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
</body>
</html>
