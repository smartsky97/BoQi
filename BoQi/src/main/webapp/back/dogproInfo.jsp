<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="easyui/css/proinfo.css">
<table id="dogpro_info" data-options="fit:true"></table>
<div id="dogproduct_toolbar" style="width:100%,text-align:left">
	<a href="javascript:addDogProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	<a href="javascript:uptDogProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:rmvDogProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	<label style="margin-left:15px;">所属分类</label>
	<select id="Fir_select" onChange="ftos()">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">二级分类</label>
	<select id="Sec_select">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">品牌</label>
	<select id="Bra_select">
		<option value=-1>全部</option>
	</select>
	<a href="javascript:findProByInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
</div>
<script>
var uptProid;
var datagrid;
	var yiji = document.getElementById('uptdogPro_finame');  
	var lei=new Array();  
$(function(){
	var editRow=undefined;
	var op;
	var flag;

	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	
	datagrid=$('#dogpro_info').datagrid({
		url:'productinfo_getPageDogProInfo.action',
		onLoadSuccess:function(data){
			var obj=$("#dogPro_brname");
			var obj1=$("#dogPro_tpname");
			var obj2=$("#dogPro_status");
			var obj3=$("#uptdogPro_brname");//修改品牌id
			var obj4=$("#uptdogPro_tpname");
			var obj5=$("#uptdogPro_status");//修改二级表
			var obj6=$("#Fir_select");
			var obj6_5=$("#dogPro_finame");
			var obj7=$("#Sec_select");
			var obj8=$("#Bra_select");
			var obj10=$("#uptdogPro_finame");  //修改一级表
			obj.empty();
			obj1.empty();
			obj2.empty();
			obj3.empty();
			obj4.empty();
			obj5.empty();
			obj6.empty();
			obj6_5.empty();
			obj7.empty();
			obj8.empty();
			obj10.empty();
			
			var opt;
			$.each(data.brand,function(index,item){
				opt="<option value='"+item.brandid+"'>"+item.brandName+"</option>";
				obj.append($(opt));
				obj3.append($(opt));
				obj8.append($(opt));
			});
			//订单的二级类
			var temp="";
			var i=0;
			var qw=0;
			$.each(data.type,function(index,item){
				opt="<option value='"+item.tid+"'>"+item.tname+"</option>";
				obj1.append($(opt));
				if(index==0){
					lei[qw]=new Array();
					lei[qw][i]=new Option(item.tname,item.tid);
					temp=item.fid;
					i++;
				}else{
					if(temp==item.fid){
						lei[qw][i]=new Option(item.tname,item.tid);
						temp=item.fid;
						i++;
					}else{
						qw++;
						i=0;
						lei[qw]=new Array();
						lei[qw][i]=new Option(item.tname,item.tid);
						temp=item.fid;
						i++;
					}
				}
			});
			//订单的一级类
			$.each(data.fir,function(index,item){
				opt="<option value='"+item.fid+"'>"+item.fname+"</option>";
				obj6.append($(opt));
				obj6_5.append($(opt));
				obj10.append($(opt));
			});
			for(var i=0;i<2;i++){
				var name;
				if(i==0){
					name="下架";
				}else{
					name="上架";
				}
				opt="<option value='"+i+"'>"+name+"</option>";
				obj2.append($(opt));
				obj5.append($(opt));
			}
		},
		fitColumns:true,
		striped:true,
		loadMsg:"数据加载中...",
		pagination:true,
		rownumbers:true,
		sortName:'proid',
		remoteSort:false,
		idField: 'proids',
		columns:[[
		    {field:'proids',title:'商品编号',width:100,align:'center',checkbox:true},
		    {field:'proid',title:'商品编号',width:200,align:'center'},
		    {field:'proname',title:'商品名称',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'nature',title:'商品规格',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'brandname',title:'品牌',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'tname',title:'所属分类',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'promarprice',title:'商品市场价',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'bqpri',title:'波奇价',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'prosales',title:'销量',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'inventory',title:'库存',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'status',title:'是否上架',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'op',title:'操作',width:100,align:'center',
				formatter:function(value,row,index){
					return "<a href='javascript:showProDetail("+row.proid+")'>详细<a/>";
					}
				}
		]],
		toolbar:"#dogproduct_toolbar"
	});
});	

function changeER(){
	var erji=document.getElementById('uptdogPro_tpname');  
    erji.options.length=0;  
    var index=yiji.selectedIndex;  
    for(var x in lei[index]){  
        erji.options[x]=lei[index][x]  
    }
}

function ftos(){
	var changefid=$("#Fir_select").val();
	var obj=$("#Sec_select");
	var opt;
	obj.html("");
	if(changefid==-1){
		opt="<option value=-1>全部</option>";
		obj.append($(opt));
	}else{
		$.post("secondMenu_getSec.action?fid="+changefid,function(data){
			console.info("后台数据:"+data);
			$.each(data,function(index,item){
				opt="<option value='"+item.tid+"'>"+item.tname+"</option>";
				obj.append($(opt));
				$("#uptdogPro_tpname").append($(opt));
			});
		},"json");
	}
}
//表单提交前的验证
var obj = document.getElementById('addDogInfo');
var check = function(){
	if($("#dogPro_name").val()!=null && $("#dogPro_nature").val()!=null && $("#dogPro_brname").val()!=null && $("#dogPro_pic").val()!=null
			&& $("#dogPro_finame").val()!="" && $("#dogPro_tpname").val()!="" && $("#dogPro_marpri").val()!=""
			&& $("#dogPro_bqpri").val()!="" && $("#dogPro_sales").val()!="" && $("#dogPro_inven").val()!=""
			&& $("#dogPro_status").val()!="" && $("#dogPro_info").val()!=""){
		alert("gou");
		return true;
	}else{
		alert("请填写所有信息");
		return false;
	}
}
obj.onsubmit = function(){
	return check();
}


</script>
<script type="text/javascript" src="js/jquery.form.min.js"></script>
<div id="dogPro_add" class="easyui-dialog" title="添加狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form id="addDogInfo" action="productinfo_AddProduction" style="padding:20px 0 0 250px;float:left;display:inline-block;" method="post" enctype="multipart/form-data"  target="hiddenIFrame"> 
		<label>商品名称：</label><input type=text name="proname"id="dogPro_name" class="myinput">
		<label style="padding-left:100px;">商品规格：</label><input type=text name="nature"id="dogPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称：</label><select name="brandid" id="dogPro_brname" class="myinput" style="width:145px;"></select>
		<label style="padding-left:100px;">商品图片：</label><input type=file name="pictrues" id="dogPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'news_pic_show')"><br /> <br /> 
		<label>所属类型：</label><select name="fid" id="dogPro_finame"class="myinput" style="width:145px;"></select>
		<label style="padding-left:100px;">所属分类：</label><select name="tid" id="dogPro_tpname"class="myinput" style="width:145px;"></select><br /> <br />
		<label>市  场  价 ：  </label><input type=text name="promarprice"id="dogPro_marpri" class="myinput">
		<label style="padding-left:100px;">波  奇  价 ：  </label><input type=text name="bqpri"id="dogPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量：</label><input type=text name="prosales"id="dogPro_sales" class="myinput">
		<label style="padding-left:100px;">商品库存：</label><input type=text name="inventory"id="dogPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态：</label><select name="status" id="dogPro_status"class="myinput"></select><br /> <br />  
		<label style="float:left;">商品介绍：</label><input type=file name="prointros" id="dogPro_info" onchange="previewMultipleImage(this,'proinfo_pic_show')"><br /> <br /> 
		
		<input type="submit" value="添加"/>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="news_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
	<div style="margin:310px 0 0 250px;width: 800px;">
		<fieldset id="proinfo_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<div id="dogPro_show" class="easyui-dialog" title="查看狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<center>
	<h3 style="margin-top:10px;">商品信息</h3>
	<div width:380px; margin-top:15px" id="news_pic_show_info"></div>
	<table class="pro_show" border="0" cellpadding="2" cellspacing="1" width="70%">
		<tbody>
			<tr>
				<td class="color_blue">商品名称:</td>
				<td class="color_w"  id="showdogPro_name"></td>
				<td class="color_blue">商品规格:</td>
				<td class="color_w" id="showdogPro_nature"></td>
			</tr>
			<tr>
				<td class="color_blue">市 场 价 :</td>
				<td class="color_w" id="showdogPro_marpri"></td>
				<td class="color_blue">品牌名称:</td>
				<td class="color_w" id="showdogPro_brandid"></td>
			</tr>
			<tr>
				<td class="color_blue">波 奇 价 :</td>
				<td class="color_w" id="showdogPro_bqpri"></td>
				<td class="color_blue">所属分类:</td>
				<td class="color_w" id="showdogPro_tid"></td>
			</tr>
			<tr>
				<td class="color_blue">商品销量:</td>
				<td class="color_w" id="showdogPro_sales"></td>
				<td class="color_blue" id="showdogPro_suitpet">所属类型:</td>
				<td class="color_w" id="showdogPro_finame"></td>
			</tr>
			<tr>
				<td class="color_blue">商品库存:</td>
				<td class="color_w" id="showdogPro_inven"></td>
				<td class="color_blue">商品状态:</td>
				<td class="color_w" id="showdogPro_status"></td>
			</tr>
		</tbody>
	</table><br/>
	<label><h2>商品介绍:</h2></label>
	<div  name="intro" id="showdogPro_intro">
	
	</div>
	</center>
</div>

<div id="dogPro_upt" class="easyui-dialog" title="更改狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form id="pro_change" style="padding:20px 0 0 250px;float:left;display:inline-block;">
		<label>商品名称：</label><input type=text name="proname"id="uptdogPro_name" class="myinput">
		<input type="hidden" name="proid" id="upproid" value="${loginUser.vuid}"/>  
		<label style="padding-left:100px;">商品规格：</label><input type=text name="nature"id="uptdogPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称：</label><select name="brandid" id="uptdogPro_brname"class="myinput"  style="width:145px;"></select>
		<label style="padding-left:100px;">商品图片：</label><input type=file name="pictrues" id="uptdogPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'uptpro_pic_show')"><br /> <br /> 
		<label>所属类型：</label><select name="fid" id="uptdogPro_finame"class="myinput" style="width:145px;" onChange="changeER()"></select>
		<label style="padding-left:100px;">所属分类：</label><select name="tid" id="uptdogPro_tpname"class="myinput"></select><br /> <br />
		<label>市 场 价 ： </label><input type=text name="promarprice"id="uptdogPro_marpri" class="myinput">
		<label style="padding-left:100px;">波 奇 价 ： </label><input type=text name="bqpri"id="uptdogPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量：</label><input type=text name="prosales"id="uptdogPro_sales" class="myinput">
		<label style="padding-left:100px;">商品库存：</label><input type=text name="inventory" id="uptdogPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态：</label><select name="status" id="uptdogPro_status"class="myinput"></select><br /> <br />   
		<label style="float:left;">商品介绍：</label><input type=file name="prointros" id="uptdogPro_intro" onchange="previewMultipleImage(this,'upproinfo_pic_show')"><br /> <br /> 
		<a href="javascript:uptDogProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="uptpro_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
	<div style="margin:310px 0 0 250px;width: 800px;">
		<fieldset id="upproinfo_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<script>
function findProByInfo(){
	var fid=$("#Fir_select").val();
	var tid=$("#Sec_select").val();
	var brandid=$("#Bra_select").val();
	var type="狗";
	
	$('#dogpro_info').datagrid({
		url:'productServlet',
		queryParams:{op:"findProByInfo",fid:fid,tid:tid,brandid:brandid,type:type}
	});	
}
function addDogProInfoButton(){
	$("#dogPro_add").dialog("open");
}
function addDogProInfo(){
	var proname=$("#dogPro_name").val();
	var nature=$("#dogPro_nature").val();
	var brandid=$("#dogPro_brname").val();
	var tid=$("#dogPro_tpname").val();
	var promarprice=$("#dogPro_marpri").val();
	var bqpri=$("#dogPro_bqpri").val();
	var prosales=$("#dogPro_sales").val();
	var prointro=$("#dogPro_intro").val();
	var inventory=$("#dogPro_inven").val();
	var status=$("#dogPro_status").val();
	
	$.ajaxFileUpload({
		url:"productServlet?op=addDogProInfo",
		secureuri:false,
		fileElementId:"dogPro_pic",
		dataType:"json",
		data:{
			proname:proname,
			nature:nature,
			brandid:brandid,
			tid:tid,
			promarprice:promarprice,
			bqpri:bqpri,
			prosales:prosales,
			prointro:prointro,
			inventory:inventory,
			status:status
		},
		success:function(data,status){
			if(parseInt($.trim(data))==1){
				$.messager.show({title:'成功提示',msg:'新闻信息添加成功....',timeout:2000,showType:'slide'});
				$("#dogPro_add").dialog("close");
				$("#dogpro_info").datagrid("reload");
				
				$("#dogPro_name").val("");
				$("#dogPro_nature").val("");
				$("#dogPro_pic").val("");
				$("#dogPro_marpri").val("");
				$("#dogPro_bqpri").val("");
				$("#dogPro_sales").val("");
				$("#dogPro_intro").val("");
				$("#dogPro_inven").val("");
				$("#news_pic_show").html("");
				
			}else{
				$.messager.alert("失败提示","商品信息添加失败....","error");
			}
		},
		error:function(data,status,e){
			$.messager.alert("错误提示","商品信息添加有误....\n"+e,"error");
		}
	});
}

function showProDetail(proid){
	$("#dogPro_show").dialog("open");
	
	$.post("productinfo_findProByProid.action",{proid:proid},function(data){
		$("#showdogPro_name").html(data.proname);
		$("#showdogPro_nature").html(data.nature);
		$("#showdogPro_brandid").html(data.brandname);
		$("#showdogPro_tid").html(data.tname);
		$("#showdogPro_finame").html(data.fname);
		$("#showdogPro_marpri").html(data.promarprice);
		$("#showdogPro_bqpri").html(data.bqpri);
		$("#showdogPro_sales").html(data.prosales);
		$("#showdogPro_intro").html("<img src='upload/"+data.prointro+"' width='800px'>");
		$("#showdogPro_inven").html(data.inventory);
		$("#showdogPro_status").html(onDown(data.status));
		var str="";
		
		var pics=data.pictrue.split(",");
		for(var i=0;i<pics.length;i++){
			str+="<img src='upload/"+pics[i]+"' width='100px' height='100px'/>"
		}
		$("#news_pic_show_info").html($(str));
	},"json");
}
function onDown(data){
	if(data==0){
		return "下架";
	}else{
		return "上架";
	}
}
//获取修改信息
function uptDogProInfoButton(){
	var  rows=datagrid.datagrid("getChecked")[0];
	
	if(rows==undefined){
		$.messager.show({
			title:"温馨提示",
			msg:"请选择您要修改的数据...",
			timeout:2000,
			showType:'slide'
		});
	}else{
		var proid=rows.proid;
		uptProid=proid;
		$("#dogPro_upt").dialog("open");
		$("#upproid").val(uptProid);
		$.post("productinfo_getProductInfo",{proid:proid},function(data){
			$("#uptdogPro_name").val(data.proname);
			$("#uptdogPro_nature").val(data.nature);
			$("#uptdogPro_brname option").map(function(){
				var temp=$(this).text();
				if(temp==data.brandname){
					$(this).attr("selected",true);
				}
			});
			$("#uptdogPro_finame").val(data.fid);
			
			changeER();
			$("#uptdogPro_tpname option").map(function(){
				var temp=$(this).text();
				if(temp==data.tname){
					$(this).attr("selected",true);
				}
			});
			$("#uptdogPro_marpri").val(data.promarprice);
			$("#uptdogPro_bqpri").val(data.bqpri);
			$("#uptdogPro_sales").val(data.prosales);
			$("#uptdogPro_inven").val(data.inventory);
			$("#upproinfo_pic_show").html("<img src='upload/"+data.prointro+"' width='800px'>");
			$("#uptdogPro_status option").map(function(){
				var temp=$(this).val();
				if(temp==data.status){
					$(this).attr("selected",true);
				}
			});
			var str="";
			var pics=data.pictrue.split(",");
			for(var i=0;i<pics.length;i++){
				str+="<img src='upload/"+pics[i]+"' width='100px' height='100px'/>"
			}
			$("#uptpro_pic_show").html($(str));
		},"json");
	}
}
function rmvDogProInfoButton(){
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
				var proids="";
				for(var i=0;i<rows.length-1;i++){
					proids+=rows[i].proid+",";
				}
				proids+=rows[i].proid;
						
				//将要删除aid发送到服务器
				$.post("productServlet",{op:"delProInfo",proids:proids},function(data){
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

function edi(){
	$("#dogPro_upt").ajaxSubmit({
	    type: 'post',
	    url: "productinfo_changeproducttt.action" ,
	    success: function(data){
	        alert( "success");
	        $( "#wfAuditForm").resetForm();
	    },
	    error: function(XmlHttpRequest, textStatus, errorThrown){
	        alert( "error");
	    }
	});
}

function uptDogProInfo(){
	//表单提交后的操作使用jquery.from.js  
	var ajax_option={
		url:"productinfo_changeproducttt.action",
		type:"post",
		beforeSubmit:checkUppro,
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		success:function(data){
			if(data==1){
				$.messager.show({title:'成功提示',msg:'商品信息修改成功....',timeout:2000,showType:'slide'});
				$("#dogPro_upt").dialog("close");
				$("#dogpro_info").datagrid("reload");
				$("#uptdogPro_name").val("");
				$("#uptdogPro_nature").val("");
				$("#uptdogPro_pic").val("");
				$("#uptdogPro_marpri").val("");
				$("#uptdogPro_bqpri").val("");
				$("#uptdogPro_sales").val("");
				$("#uptdogPro_intro").val("");
				$("#uptdogPro_inven").val("");
				$("#uptpro_pic_show").html("");
			}else{
				alert("修改失败");
			}
		}
	}
	$('#pro_change').ajaxSubmit(ajax_option);
}

function checkUppro(){
	if($("#uptdogPro_name").val()!=null && $("#uptdogPro_nature").val()!=null && $("#uptdogPro_brname").val()!=null
			&& $("#uptdogPro_tpname").val()!="" && $("#uptdogPro_marpri").val()!="" && $("#uptdogPro_bqpri").val()!=""
			&& $("#uptdogPro_sales").val()!="" && $("#uptdogPro_inven").val()!="" && $("#uptdogPro_status").val()!=""
			&& $("#uptdogPro_finame").val()!=""){
		return true;
	}else{
		alert("请填写所有信息");
		return false;
	}
}
</script>
