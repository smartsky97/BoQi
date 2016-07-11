<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<link rel="shortcut icon" href="indeximg/head11.jpg">
	
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
                        <td class="acounts">数量</td>
                        <td class="mall">小计(元)</td>
                        <td class="active">操作</td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" id="mytable" class="productinfo" style="width: 100%; text-align: center;">
                	<c:forEach items="${findAllcar}" var="item">
                		<tr class="product_list" style="border-bottom: 1px dashed grey;min-height:200px;">
	                		<td style="width:20%;" class="fi">
	                			<span id="checkeded">
                				<input type="checkbox" name="list" value="${item.proid }" class="list" style="margin-top:-53px;"/>
                				</span>
                				<span class="pname_product">
                					<c:choose>
			                			<c:when test="${fn:contains(item.pictrue, ',')}">
			                				<img src="../upload/${fn:substringBefore(item.pictrue,',' ) }" alt="图片暂时为空" style="width:100px;height:100px;"/>
			                			</c:when>
			                			<c:otherwise>
			                				<img src="../upload/${item.pictrue }" alt="图片暂时为空" style="width:100px;height:100px;"/>
			                			</c:otherwise>
		                			</c:choose>
		                            <a >${item.proname}</a>
                				</span>
                			</td>
	                        <td class="price_product">${item.bqpri }</td>
	                        <td class="acounts_product">
	                        	<button class="btn_reduce" onclick="javascript:onclick_reduce(this);">-</button>
								<input class="momey_input counts_product" type="text" disabled="disabled" value="1" name="">
								<button class="btn_add" onclick="javascript:onclick_btnAdd(this);">+</button>
	                        </td>
                        	<td class="small_product" id="${item.proid }small">${item.inventory*item.bqpri}</td>
                        	<td class="active_product">
                           		<a target="_blank" href="">移入收藏夹</a><br/>
                            	<a href="javascript:void(0)" class="delete" id="${ item.proid}delete" onClick="del(this)">删除</a>
                        	</td>
                    	</tr>
                	</c:forEach>
                </table>
            </div> 
        <div id="jiesuan">
            <ul>
                <li class="all">全选</li>
                <li class="delete">删除选中的商品</li>
                <li class="clean">清空购物车</li>
                <li class="more">已选择<span class="four">4</span>件,总价：￥<span class="money"></span><a  onclick="gopay()" class="go">去结算</a></li>
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
<script type="text/javascript" src=jquery/jquery.1.4.2-min.js></script>
<script type="text/javascript" src="js/car.js"></script>	
</html>