<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="ad_info" data-options="fit:true">
<div id="adinfo_toolbar" style="width:100%,text-align:left">
	<a href="javascript:addAdinfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	<a href="javascript:uptAdinfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:rmvAdinfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	
</div>
</table>

<div id="ad_add" class="easyui-dialog" title="添加广告"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>人群:</label><input type=text name="audience"id="addAd_audience" class="myinput"><br /> <br /> 
		<label>开始时间:</label><input type=text name="astdate"id="addAd_astdate" class="myinput"><br /> <br /> 
		<label>结束时间:</label><input type=text name="aendate"id="addAd_aendate" class="myinput"><br /> <br />
		<label>广告图片:</label><input type=file name="advpic" id="addAd_advpic" multiple="multiple" onchange="previewMultipleImage(this,'addAd_pic_show')"><br /> <br /> 
		
		<a href="javascript:addAdinfo()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="addAd_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<div id="ad_show" class="easyui-dialog" title="添加广告"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>人群:</label><input type=text name="audience"id="showAd_audience" class="myinput" readonly="readonly"><br /> <br /> 
		<label>开始时间:</label><input type=text name="astdate"id="showAd_astdate" class="myinput" readonly="readonly"><br /> <br /> 
		<label>结束时间:</label><input type=text name="aendate"id="showAd_aendate" class="myinput" readonly="readonly"><br /> <br />
		
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="showAd_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<div id="ad_upt" class="easyui-dialog" title="添加广告"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>人群:</label><input type=text name="audience"id="uptAd_audience" class="myinput"><br /> <br /> 
		<label>开始时间:</label><input type=text name="astdate"id="uptAd_astdate" class="myinput"><br /> <br /> 
		<label>结束时间:</label><input type=text name="aendate"id="uptAd_aendate" class="myinput"><br /> <br />
		<label>广告图片:</label><input type=file name="advpic" id="uptAd_advpic" multiple="multiple" onchange="previewMultipleImage(this,'addAd_pic_show')"><br /> <br /> 
		
		<a href="javascript:uptAdinfo()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="uptAd_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>

<script>
var datagrid;
var uptadverid;
var uptanumber;
$(function(){
	var editRow=undefined;
	var op;
	var flag;
	

	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	
	datagrid=$('#ad_info').datagrid({
		url:'adverServlet',
		queryParams:{op:"getPageAdInfo"},
		fitColumns:true,
		striped:true,
		loadMsg:"数据加载中...",
		pagination:true,
		rownumbers:true,
		sortName:'adverid',
		remoteSort:false,
		idField: 'adverids',
		columns:[[
		    {field:'adverids',title:'广告位编号',width:100,align:'center',checkbox:true},
		    {field:'adverid',title:'广告位编号',width:200,align:'center'},
		    {field:'audience',title:'人群',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'astdate',title:'开始日期',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'aendate',title:'结束日期',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'anumber',title:'点击次数',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'op',title:'操作',width:100,align:'center',
				formatter:function(value,row,index){
					return "<a href='javascript:showAdDetail("+row.adverid+")'>详细<a/>";
					}
				}
		]],
		toolbar:"#adinfo_toolbar"
	});
	
});

function showAdDetail(adverid){
	$("#ad_show").dialog("open");
	
	$.post("adverServlet",{op:"findAdByadverid",adverid:adverid},function(data){
		var ad=data.adver;
		
		$("#showAd_audience").val(ad[0].audience);
		$("#showAd_astdate").val(ad[0].astdate);
		$("#showAd_aendate").val(ad[0].aendate);
		
		var str="";
		
		var pics=ad[0].advpic.split(",");
		for(var i=0;i<pics.length;i++){
			str+="<img src='"+pics[i]+"' width='100px' height='100px'/>"
		}
		$("#showAd_pic_show").html($(str));
	},"json");
}




function addAdinfoButton(){
	$("#ad_add").dialog("open");
}

function uptAdinfoButton(){
	var  rows=datagrid.datagrid("getChecked")[0];
	
	if(rows==undefined){
		$.messager.show({
			title:"温馨提示",
			msg:"请选择您要修改的数据...",
			timeout:2000,
			showType:'slide'
		});
	}else{
		var adverid=rows.adverid;
		uptadverid=adverid;
		uptanumber=rows.anumber;
		$("#ad_upt").dialog("open");
		$.post("adverServlet",{op:"findAdByadverid",adverid:adverid},function(data){
			var ad=data.adver;
			
			$("#uptAd_audience").val(ad[0].audience);
			$("#uptAd_astdate").val(ad[0].astdate);
			$("#uptAd_aendate").val(ad[0].aendate);
			
			var str="";
			
			var pics=ad[0].advpic.split(",");
			for(var i=0;i<pics.length;i++){
				str+="<img src='"+pics[i]+"' width='100px' height='100px'/>"
			}
			$("#uptAd_pic_show").html($(str));
		},"json");
	}
}

function rmvAdinfoButton(){
	var rows=datagrid.datagrid("getChecked");
	if(rows.length<=0){   //
		$.messager.show({
			title:"友情提示",
			msg:"请选择要删除的数据...",
			timeout:2000,
			showType:'slide'
		});
	}else{
		$.messager.confirm('信息确认','您确定要删除选中的数据吗？',function(r){
			if(r){
				var adverids="";
				for(var i=0;i<rows.length-1;i++){
					adverids+=rows[i].adverid+",";
				}
				adverids+=rows[i].adverid;
						
				//将要删除aid发送到服务器
				$.post("adverServlet",{op:"delAdInfo",adverids:adverids},function(data){
					if(data==1){   //删除成功
						$.messager.show({
							title:"删除提示",
							msg:"新闻信息删除成功...",
							timeout:2000,
							showType:'slide'
						});
						datagrid.datagrid("reload");  //重新加载数据一次
					}else{
						$.messager.alert('失败提示','商品信息删除失败...','error');
					}
				});
			}
		});
	}	
}


function addAdinfo(){
	var audience=$("#addAd_audience").val();
	var astdate=$("#addAd_astdate").val();
	var aendate=$("#addAd_aendate").val();
	
	$.ajaxFileUpload({
		url:"adverServlet?op=addAdinfo",
		secureuri:false,
		fileElementId:"addAd_advpic",
		dataType:"json",
		data:{
			audience:audience,
			astdate:astdate,
			aendate:aendate
		},
		success:function(data,status){
			if(parseInt($.trim(data))==1){
				$.messager.show({title:'成功提示',msg:'广告信息添加成功....',timeout:2000,showType:'slide'});
				$("#ad_add").dialog("close");
				$("#ad_info").datagrid("reload");
				
				$("#addAd_audience").val("");
				$("#addAd_astdate").val("");
				$("#addAd_aendate").val("");
				$("#addAd_advpic").val("");
				$("#addAd_pic_show").html("");
				
			}else{
				$.messager.alert("失败提示","广告信息添加失败....","error");
			}
		},
		error:function(data,status,e){
			$.messager.alert("错误提示","广告信息添加有误....\n"+e,"error");
		}
	});
}
function uptAdinfo(){
	var audience=$("#uptAd_audience").val();
	var astdate=$("#uptAd_astdate").val();
	var aendate=$("#uptAd_aendate").val();
	
	$.ajaxFileUpload({
		url:"adverServlet?op=uptAdinfo",
		secureuri:false,
		fileElementId:"uptAd_advpic",
		dataType:"json",
		data:{
			uptanumber:uptanumber,
			uptadverid:uptadverid,
			audience:audience,
			astdate:astdate,
			aendate:aendate
		},
		success:function(data,status){
			if(parseInt($.trim(data))==1){
				$.messager.show({title:'成功提示',msg:'广告信息添加成功....',timeout:2000,showType:'slide'});
				$("#ad_upt").dialog("close");
				$("#ad_info").datagrid("reload");
				
				$("#uptAd_audience").val("");
				$("#uptAd_astdate").val("");
				$("#uptAd_aendate").val("");
				$("#uptAd_advpic").val("");
				$("#uptAd_pic_show").html("");
				
			}else{
				$.messager.alert("失败提示","广告信息添加失败....","error");
			}
		},
		error:function(data,status,e){
			$.messager.alert("错误提示","广告信息添加有误....\n"+e,"error");
		}
	});
}

</script>

