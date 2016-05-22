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
	<link rel="stylesheet" type="text/css" href="css/car2.css">
	<link href="css/publicThing.css" type="text/css" rel="stylesheet"> 
	
	<script type="text/javascript" src=jquery/jquery.1.4.2-min.js></script>
	<script type="text/javascript" src="js/car.js"></script>	

	<script>
	var uname = "${loginUser.uname}";
	var sum = 0;		
	//地址
	var prov=new Array();
	prov['湖南省']=['长沙市','常德市','衡阳市','湘潭市','益阳市'];
	prov['广东省']=['广州市','佛山市','深圳市','东莞市'];
	prov['湘潭市']=['石潭镇','易俗河','花石','湘潭县'];
	
	function change(){
		var pro =document.myform.provs;
		for(var i=0;i<spanro.length;i++){
			//判断是否有选中的选项
			if(pro[i].selected==true){
				console.info(pro[i].value);
				//通过省份创建城市选项
				add(pro[i].value);
			}
		}
	}
	
	function add(provice){
		document.myform.city.length=0;
		for(var i=0;i<spanrov[provice].length;i++){
			var op=new Option(prov[provice][i],prov[provice][i]);
			document.myform.city.options.add(op);
		}
	}

	function changed(){
		var city =document.myform.city;
		for(var i=0;i<city.length;i++){
			if(city[i].selected==true){
				console.info(city[i].value);
				add(city[i].value);
			}
		}
	}
	
	function add1(city){
		document.myform.town.length=0;
		for(var i=0;i<city[city].length;i++){
			var op1=new Option(city[city][i],city[city][i]);
			document.myform.town.options.add(op1);
		}
	}

	Date.prototype.format = function(format){ 
		var o = { 
			"M+" : this.getMonth()+1, //month 
			"d+" : this.getDate(), //day 
			"h+" : this.getHours(), //hour 
			"m+" : this.getMinutes(), //minute 
			"s+" : this.getSeconds(), //second 
			"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
			"S" : this.getMilliseconds() //millisecond 
		} 

		if(/(y+)/.test(format)) { 
			format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
		} 

		for(var k in o) { 
			if(new RegExp("("+ k +")").test(format)) { 
				format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
			} 
		} 
		return format; 
	} 

	
	//点击提交订单
	function payle(){
		var unamer = $("#username").val();
		var usertel = $("#usertel").val();
		var useraddress = $("#useraddress").val();
		var mytime = new Date();
		var mystr = mytime.format("yyyy-MM-dd hh:mm:ss"); 
		
		if(unamer == null || unamer == "" || usertel == null || usertel == "" || useraddress == null || useraddress == ""){
			alert("请输入完整的收货地址");
		}else{
			var payword = prompt("请输入您的支付密码","");
			if(payword == ("${loginUser.paypwd}")){
				$.post("../orderContentServlet",{op:"addDingdan",usid:${loginUser.usid},readdr:useraddress,starttime:mystr.toLocaleString( ),paytime:mystr.toLocaleString( ),ordersum:sum},function(data){
					$.post("../orderContentServlet",{op:"addxiangxi",xinxi:"${shopinfo}",bianhao:data},function(){
						showTime();
					});
				});
			}else{
				alert("密码错误");
			}
		}
	}
	
	
    function showTime() {
        alert("success");
        window.close();     
    }
	//添加信息
	function addinfo(){
		var infofo = "${shopinfo}";
		var shu = infofo.split(";");
		
		for(var i=0;i<shu.length-1;i++){
			var shu2 = shu[i].split(",");
			//alert("<tr class='pname_order'><td class='product_order' style='border-bottom: 1px dashed grey;'><img src='' alt='图片暂时为空'/><a>"+shu2[1]+"</a>	</td><td class='price_order'>"+shu2[2]+"元</td><td class='acounts_order'>"+shu2[3]+"</td><td class='small_order' id='small'>"+shu2[4]+"元</td></tr>");
			$("#mytables").append("<tr class='pname_order'><td class='product_order'><img src='' alt='图片暂时为空' class='shangimg'/><br/><a class='left'>"+shu2[1]+"</a><span id='shangID'>"+shu2[0]+"</span>	</td><td class='price_order'>"+shu2[2]+"元</td><td class='acounts_order'>"+shu2[3]+"</td><td class='small_order' id='small'>"+shu2[4]+"元</td></tr>");
			sum+= parseInt(shu2[4]);
		}
		$(".yingfumoney").html("￥"+sum);

	}
	window.onload=addinfo; 
	
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
       <!--  <span style="float:left;margin-left:-250px;margin-top:160px;">江浙沪皖满60即免运费</span> -->
        <span style="float:right;margin-right:-350px;margin-top:160px;"><a target="_blank" href="">继续购物></a></span>
        	<div id="dingdan">
				<div id="dizhi">
					<span class="stitle">收货人信息</span></br>
					收货人：<input type="text" id="username"></br></br>
					电话：<input type="text" id="usertel"></br></br>
					地址：<input type="textarea" id="useraddress"></br></br>
				</div>

	      
	        	
	        	<span class="stitle">商品清单<a target="_blank" class="back">返回购物车</a></span>
	        	<div id="pmenu">
	        		<table style="border:1px solid green;margin-left:100px;margin-top:20px;" width="80%" border="0" cellspacing="0" collpadding="0">
	                    <tr class="pmenu">
	                        <td class="pname">商品</td>
	                        <td class="price">波奇价(元)</td>
	                        <td class="acounts">数量</td>
	                        <td class="mall">小计(元)</td>
	                    </tr>
	                </table>
	                <table border="0" cellpadding="0" id="mytables" class="ordermenu">
	                	
	                </table>
                </div>
                <span class="yingfu">应付:<span class="yingfumoney">￥123232</span><br/><span class="submit" onclick="payle()">提交订单</span></span>
                <div>
         </div>
         <div id="jiesuan" style="display:none">
            <ul>
                <li class="all">全选</li>
                <li class="delete">删除选中的商品</li>
                <li class="clean">清空购物车</li>
                <li class="more">已选择<span class="four">4</span>件商品(总重：60.00kg),总价(不含运费)：￥<span class="money">1776.00</span><a target="_blank" href="" class="go">去结算</a></li>
            </ul>
        </div>
    </div>
     </div>
    <div id="foot">
        	<div id="footer-auto">
                <div id="footer-bot">
                    <span id="footer-link">
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
                        
                    </span>
                    <span id="copy">
                        <span>Copyright  2007-2015 Boqii.com All Rights Reserved 光橙（上海）信息科技有限公司 版权所有</span>
                        <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪ICP备13034501号-2</a>
                        <span>增值电信业务经营许可证：</span>
                        <a href="#" target="_blank" onmouseover="addUnderline(this)" onmouseout="reUnderline(this)">沪B2-20140120</a>
                    </span>
                    <span id="footimg">
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
                    </span>
                </div>
            </div>
   
</body>
</html>
