<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.pojava.datetime.DateTime" %>
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
	<script type="text/javascript" src=jquery/jquery-2.1.1.js></script>
	<script type="text/javascript" src="js/GlobalProvinces_main.js"></script>
	<script type="text/javascript" src="js/GlobalProvinces_extend.js"></script>
	<script type="text/javascript" src="js/initLocation.js"></script>
	<script type="text/javascript" src="js/car.js"></script>
	<script>
		var uname = "${loginUser.uname}";
		var sum = 0;		
		var addressID = "";
		
		//点击提交订单
		function payle(){
			var ordersum =  $(".yingfumoney").html();
			var seperator1 = "-";
		    var seperator2 = ":";
		    var orders = "";
			var currentdate = "";
			
			var list = $(".pname_order");
			for(var i=0;i<list.length;i++){
				var thingID = $(list[i]).children(".product_order").children("#shangID").html();
				var num = $(list[i]).children(".acounts_order").html();
				var danjia = $(list[i]).children(".price_order").html();
				orders += thingID+","+num+","+danjia+";";
			}
			if(addressID == ""){
				alert("请填写您的收货地址");
			}else{
				$.post("ordercontent_uploadorder.action",{addid:addressID,ordersum:ordersum,orders:orders});
			}
		} 
		//点击关闭
		function onclick_close() {
			var shade_content = $(".shade_content");
			var shade = $(".shade");
			if (confirm("确认关闭么！此操作不可恢复")) {
				shade_content.hide();
				shade.hide();
			}
		}
		//添加新地址
		function onclick_open() {
			$(".shade_content").show();
			$(".shade").show();
			var input_out = $(".input_style");
			for (var i = 0; i <= input_out.length; i++) {
				if ($(input_out[i]).val() != "") {
					$(input_out[i]).val("");
				}
			}
		}
		//显示所有地址
		function onclick_show_all(){
			window.location.href();
		}
		
		function clickAddress(add){
			addressID = $(add).attr("id");
		}
		
		//添加信息
		function addinfo(){
			var infofo = "${shopinfo}";
			var shu = infofo.split(";");
			var shing = "";
			for(var i=0;i<shu.length-1;i++){
				var shu2 = shu[i].split(",");
				$("#mytables").append("<tr class='pname_order'><td class='product_order'><img src='"+shu2[5]+"' alt='图片暂时为空' class='shangimg'/><br/><a>"+shu2[1]+"</a><span id='shangID'>"+shu2[0]+"</span>	</td><td class='price_order'>"+shu2[2]+"</td><td class='acounts_order'>"+shu2[3]+"</td><td class='small_order' id='small'>"+shu2[4]+"元</td></tr>");
				sum+= parseInt(shu2[4]);
			}
			$(".yingfumoney").html(sum);
		}
		$(function() {
			$(".shade_content").hide();
			$(".shade").hide();
			initLocation({sheng_val:"--",shi_val:"--",xian_val:"<?php echo $v['country']?>",xiang_val:"<?php echo $v['street']?>"});
			addinfo();
		})
	</script>
</head>
<body>
	<%@include file="publicThing.jsp"%>

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
			<div id="dingdan">
				<div id="showadd">
					<div id="addrs">
						<c:forEach items="${oneusersaddress}" var="item">
							<div class="add_mi" onclick="clickAddress(this)" id="${item.addid}">
								<p style="border-bottom:1px dashed #ccc;line-height:28px;font-size:12px;width: 203px;margin-bottom: 5px;">${item.shen }${item.shi }(${item.addname}收)</p>
								<p style="color: #666;font-size: 12px;line-height: 20px;margin-bottom: 5px;width: 203px;">${item.xian }&nbsp;&nbsp;${item.zhenjie }&nbsp;&nbsp;${item.readdr}&nbsp;${item.tel }</p>
							</div>
						</c:forEach>
					</div>
					
					<div class="open_new left">
						<button onclick="javascript:onclick_open();" class="open_btn">使用新地址</button>
						<button onclick="javascript:onclick_show_all();" class="show_all">显示全部地址</button>
					</div>
				</div>

				<div class="fenge" style="width:100%;border-bottom: 1px dotted grey;"></div>
				<span class="stitle">商品清单<a target="_blank" class="back">返回购物车</a></span>
				<span style="float: right; margin-right: 30px; margin-top: 10px;">
					<a target="_blank" href="">继续购物></a>
				</span>
					<table 
						style="margin-left: 100px;" bordercolor="green"
						width="80%" border="1" cellspacing="0" collpadding="0">
						<tbody id="mytables">
							<tr class="pmenu">
								<td class="pname">商品</td>
								<td class="price">波奇价(元)</td>
								<td class="acounts">数量</td>
								<td class="mall">小计(元)</td>
							</tr>
						</tbody>
					</table>
				
				<div style="overflow:hidden;padding-bottom:20px;">
					<span class="yingfu">应付:￥<span class="yingfumoney">123232</span>元<br />
					<span class="submit" onclick="payle()">提交订单</span>
				</div>
			</div>
		</div>
	</div>
		<!-- 地址添加 -->
		<div class="shade"></div>
		<div class="shade_content">
			<div class="col-xs-12 shade_colse">
				<button onclick="javascript:onclick_close();">x</button>
			</div>
			<div class="nav shade_content_div">
				<div class="col-xs-12 shade_title">
					新增收货地址
				</div>
				<div class="col-xs-12 shade_from">
					<form action="address_addOne" method="post">
						<input name="usid" value="${loginUser.usid}" style="display:none;">
						<div class="col-xs-12">
							<span class="span_style" id="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;省&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<select id="sheng" class="selec" name="shen" ></select>
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<select id="shi" class="selec" name="shi"></select>
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;县&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<select id="xian" class="selec" name="xian" ></select>
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">镇或街道</span>
							<select id="xiang" class="selec" name="zhenjie" ></select>
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">详细地址</span>
							<input class="input_style" type="" name="readdr" id="tatil_addr" value="" placeholder="&nbsp;&nbsp;请输入您的详细地址" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">邮政编号</span>
							<input class="input_style" name="postcode" id="number_this" value="" placeholder="&nbsp;&nbsp;请输入您的邮政编号" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" class="span_sty" id="">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
							<input class="input_style" type="" name="addname" id="name_" value="" placeholder="&nbsp;&nbsp;请输入您的姓名" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">手机号码</span>
							<input class="input_style" id="tel" name="tel" value="" placeholder="&nbsp;&nbsp;请输入您的手机号码" />
						</div>
						<div class="col-xs-12">
							<input class="btn_remove" type="button" id="" onclick="javascript:onclick_close();" value="取消" />
							<input type="submit" class="sub_set" id="sub_setID" value="提交" />
						</div>
					</form>
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
	</div>
</body>
</html>