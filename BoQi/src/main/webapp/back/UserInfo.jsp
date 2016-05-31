<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="user_info" data-options="fit:true"></table>
<div id="show_user_info_find" style="width:100%,text-align:left">
	<span  style="margin-top:5px;">姓名：</span><input  style="margin-top:5px;" type="text" name="uname" id="show_user_uname">
	<span  style="margin-top:5px;">邮箱：</span><input style="margin-top:5px;" type="text" name="email" id="show_user_email">
	<span>状态：</span><select name="status" id="status">
		<option value="">全部</option>
		<option value="0">不可用</option>
		<option value="1">可用</option>
	</select>
	&nbsp;&nbsp;<a href="javascript:findUserInfoByInfo()" style="margin-top:-5px;" class="easyui-linkbutton" data-option="iconCls:'icon-add'">查询</a>
</div>

<!-- 商品详情浏览 -->
<div id="users_show_userInfo" class="easyui-dialog" title="用户详细" data-options="fit:true,iconCls:'icon-search1',resizable:true,modal:true,closed:true">
	<center>
	<div id="user_show" id="user_show">
			<label class="tt" style="margin-left:20px;">用户昵称：</label><span class="tt" id="content_user_name"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户性别：</label><span class="tt" id="content_user_sex"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户电话：</label><span class="tt" id="content_user_tel"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户生日：</label><span class="tt" id="content_user_birt"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户城市：</label><span class="tt" id="content_user_city"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户街道：</label><span class="tt" id="content_user_street"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户职业：</label><span class="tt" id="content_user_prosi"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户QQ：</label><span class="tt" id="content_user_QQ"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户邮箱：</label><span class="tt" id="content_user_email"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">用户喜欢的宠物：</label><span class="tt" id="content_user_likePet"></span></br/><br/>
	</div>
	</center>
</div>
<script>
$(function(){
	var datagrid;
	var editRow=undefined;
	var op;
	var flag;
	var statusObj=[{usid:0,sname:'不可用'},{usid:1,sname:'可用'}];
	
	datagrid=$('#user_info').datagrid({
		url:'userServlet',
		queryParams:{op:"getPageUserInfo"},
		fitColumns:true,
		striped:true,
		loadMsg:"数据加载中...",
		pagination:true,
		rownumbers:true,
		sortName:'usid',
		remoteSort:false,
		idField: 'usid',
		columns:[[
		    {field:'usids',title:'用户编号',width:100,align:'center',checkbox:true},
		    {field:'usid',title:'用户编号',width:100,align:'center'},
		    {field:'uname',title:'用户姓名',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'email',title:'用户邮箱',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'money',title:'用户余额',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'status',title:'用户状态',width:100,align:'center',editor:{type:"combobox",options:{
				required:true,valueField:'usid',textField:'sname',data:statusObj}},
				formatter:function(value,row,index){
				  for(var i=0;i<statusObj.length;i++){
				  	if(statusObj[i].usid==value){
				  		return statusObj[i].sname;
				  		}
				  	}
				  	return value;
				  }
			},
			{field:'_operate',title:'操作',width:100,align:'center',
		    	formatter:function(value,rowData,index){
		    		return '<a class="icon-search1 icon-padding" href="javascript:showUserDetail(\''+rowData.usid+'\')">详细</a>';
		    	}
		    }
		]],
		toolbar:"#show_user_info_find"
	});
});

//弹开详情页面
function showUserDetail(usid){
	$("#users_show_userInfo").dialog("open");
	$.post("userServlet",{op:"findUserByUsid",usid:usid},function(data){
		var ordercontent=data.rows;
		console.info(data);
		
		
		$("#content_user_name").empty();
		$("#content_user_sex").empty();
		$("#content_user_tel").empty();
		$("#content_user_birt").empty();
		$("#content_user_city").empty();
		$("#content_user_street").empty();
		$("#content_user_prosi").empty();
		$("#content_user_QQ").empty();
		$("#content_user_email").empty();
		$("#content_user_likePet").empty();
		
		$("#content_user_name").append(checknull(ordercontent.uname ));
		$("#content_user_sex").append(checknull(ordercontent.sex ));
		$("#content_user_tel").append(checknull(ordercontent.tel ));
		$("#content_user_birt").append(checknull(ordercontent.birthday ));
		$("#content_user_city").append(checknull(ordercontent.city ));
		$("#content_user_street").append(checknull(ordercontent.street ));
		$("#content_user_prosi").append(checknull(ordercontent.profession ));
		$("#content_user_QQ").append(checknull(ordercontent.qq ));
		$("#content_user_email").append(checknull(ordercontent.email ));
		$("#content_user_likePet").append(checknull(ordercontent.hobbypet ));
		
	},"json");
}

function checknull(data){
	if( data=='' || data.length<1){
		return "暂无";
	}else{
		return data;
	}
}

function findUserInfoByInfo(){
	var uname=$.trim($("#show_user_uname").val());
	var email=$("#show_user_email").val();
	var status = $.trim($("#status").val());
	
	$('#user_info').datagrid({
		url:'userServlet',
		queryParams:{op:"findUserByInfo",uname:uname,email:email,status:status}
	});
}
</script>
