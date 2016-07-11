<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>波奇网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="indeximg/head11.jpg">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
		font-size: 10pt;
		color: #404040;
		font-family: SimSun;
	}
	
	.divBody {
		margin-left: 15%;
		margin-top:20px;
	}
	
	.divTitle {
		text-align:left;
		width: 900px;
		height: 25px;
		line-height: 25px;
		background-color: #efeae5;
		border: 5px solid #efeae5;
	}
	.divContent {
		width: 900px;
		height: 230px;
		border: 5px solid #efeae5;
		margin-right:20px; 
		margin-bottom:20px;
	}
	.spanTitle {
		margin-top: 10px;
		margin-left:10px;
		height:25px;
		font-weight: 900;
	}
a {text-decoration: none;}
a:visited {color: #018BD3;}
a:hover {color:#FF6600; text-decoration: underline;}
}
</style>

  </head>
  
  <body>
  <c:choose>
  	<c:when test="${code eq 'success' }"><%--如果code是功能，它显示对号图片 --%>
  		<c:set var="img" value="/front/bank_img/samaye.jpg"/>
  		<c:set var="title" value="成功"/>
  	</c:when>
  	<c:when test="${code eq 'error' }"><%--如果code是功能，它显示错号图片 --%>
  		<c:set var="img" value="/front/bank_img/samaye.jpg"/>
  		<c:set var="title" value="失败"/>
  	</c:when>
  	
  </c:choose>
<div class="divBody">
	<div class="divTitle">
		<span class="spanTitle">波奇网</span>
	</div>
	<div class="divContent">
	  <div style="margin: 20px;">
		<img style="float: left; margin-right: 30px;width:240px" src="<c:url value='${img }'/>" width="150"/>
		<span style="font-size: 30px; color: #c30; font-weight: 900;">${msg }</span>
		<br/>
		<br/>
		<br/>
		<br/>
		<span style="margin-left:50px;font-size:20px;"><a target="_top" href="<c:url value='/front/shoppingindex.jsp'/>">继续购物</a></span>
	  </div>
	</div>
</div>


  </body>
</html>
