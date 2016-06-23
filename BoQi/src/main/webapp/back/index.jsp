<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>波奇管理员</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="easyui/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/demo.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/index.css">
	<link rel="stylesheet" type="text/css" href="easyui/css/OrderContnet.css">
	
	<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
	<script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="easyui/js/index.js" charset="utf-8"></script>
	
	<script type="text/javascript" src="js/showpic.js"></script>
	<script type="text/javascript" src="js/ajaxfileupload.js"></script>
	
	<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script> 
	
  </head>
  
 <body class="easyui-layout">
	<div data-options="region:'north',border:false" id="newslogo">
	<img alt="yy" src="../upload/1.jpg">
	</div>
	<!-- 左侧列表 -->
	<div data-options="region:'west',split:true,title:'导航'" style="width:200px;">
		<div id="aa" class="easyui-accordion" >  
			<!--  -->
		    <div title="用户管理" style="overflow:auto;padding:10px;">  
		       <ul id="userInfo" class="easyui-tree">  
				    <li id="userinfo_manager">  
						<span>用户信息</span>  
				    </li>  
				</ul>  
		    </div>  
		    <!--  -->
		    <div title="商品信息管理" style="padding:10px;">  
		        <ul id="goodsInfo" class="easyui-tree" >  
					<li >  
	           			<span>品牌信息管理</span>  
		                <ul>  
		                    <li id="brandinfo_manager">  
		                        <span>品牌信息</span>  
		                    </li>
		                    <li id="brandshowinfo_manager">  
		                        <span>品牌销量统计</span>  
		                    </li>   
		                </ul>  
           			</li>  
           			<li>  
	           			<span>商品分类管理</span>  
		                <ul >  
		                    <li id="dogpro_manager">  
		                        <span>狗狗商品</span>
		                    </li>  
		                    <li id="catpro_manager">  
		                        <span>猫猫用品</span>
		                    </li>  
		                    <li id="smlpro_manager">  
		                        <span>奇趣小宠</span>
		                    </li>  
		                    <li>  
		                        <span>水族市场</span> 
		                    </li>
		                    <li>  
		                        <span>爬虫用品</span> 
		                    </li>
		                </ul>  
           			</li>
				</ul>  
		    </div> 
		    <!--  --> 
		    <div title="订单管理" style="padding:10px;">  
		    	<ul id="orderInfo" class="easyui-tree">  
				    <li id="ordercontent_manager">  
						<span>订单信息</span>  
				    </li>  
				</ul>
		    </div>  
		    <!--  --> 
		    <div title="宠物百科管理" style="padding:10px;">  
		        <ul id="petInfo" class="easyui-tree">  
                    <li id="dogbk_manager">  
                        <span>狗狗</span>
                    </li>  
                    <li id="catbk_manager">  
                        <span>猫咪</span>  
                    </li> 
                    <li id="smlbk_manager">  
                        <span>小宠</span>  
                    </li> 
                    <li id="watbk_manager">  
                        <span>水族</span>  
                    </li> 
                    <li>  
                        <span>爬虫</span>  
                    </li> 
                    <li>  
                        <span>植物</span>  
                    </li> 
				</ul>
		    </div>  
		    <!--  --> 
		    <div title="广告管理" style="padding:10px;">  
		    	<ul id="adInfo" class="easyui-tree">  
				    <li id="ad_manager">  
						<span>广告位设置</span>  
				    </li>  
				</ul>
		    </div> 
		    <!--  --> 
		    <div title="统计" style="padding:10px;">  
		    	<ul id="countInfo" class="easyui-tree">  
				    <li>  
						<span>今日统计</span>  
				    </li>  
				</ul>
		    </div>
		    
		</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'帮助'" style="width:100px;padding:10px;">
		有问题请打110
	</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;" id="copyright">
		<p><a href="#">湖工波奇有限公司</a>&copy版权所有   0234-123456789</p>
	</div>
	<div data-options="region:'center',title:'内容'">
		<div id="index_content" class="easyui-tabs" data-options="fit:true">
			
		</div>
	</div>
</body>
</html>

