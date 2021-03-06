<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="pacpro_info" data-options="fit:true"></table>
<div id="pacproduct_toolbar" style="width:100%,text-align:left">
	<a href="javascript:addPacProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	<a href="javascript:uptPacProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:rmvPacProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	<label style="margin-left:15px;">所属分类</label><select id="pacFir_select" onChange="ftos()">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">二级分类</label><select id="pacSec_select">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">品牌</label><select id="pacBra_select">
		<option value=-1>全部</option>
	</select>
	<a href="javascript:findProByInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
</div>
<script>
var uptProid;
var datagrid;
$(function(){
	
	var editRow=undefined;
	var op;
	var flag;
	

	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	
	datagrid=$('#pacpro_info').datagrid({
		url:'pacProductServlet',
		queryParams:{op:"getPagePacProInfo"},
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
		toolbar:"#pacproduct_toolbar"
	});
	
	$.post("pacProductServlet",{op:"getSelectInfo"},function(data){
		//var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
		var obj=$("#pacPro_brname");
		var obj1=$("#pacPro_tpname");
		var obj2=$("#pacPro_status");
		var obj3=$("#uptpacPro_brname");
		var obj4=$("#uptpacPro_tpname");
		var obj5=$("#uptpacPro_status");
		var obj6=$("#pacFir_select");
		var obj7=$("#pacSec_select");
		var obj8=$("#pacBra_select");
		
		var opt;
		$.each(data.brand,function(index,item){
			opt="<option value='"+item.brandid+"'>"+item.brandName+"</option>";
			obj.append($(opt));
			obj3.append($(opt));
			obj8.append($(opt));
		});
		$.each(data.type,function(index,item){
			opt="<option value='"+item.tid+"'>"+item.tname+"</option>";
			obj1.append($(opt));
			obj4.append($(opt));
			//obj7.append($(opt));
		});
		$.each(data.fir,function(index,item){
			opt="<option value='"+item.fid+"'>"+item.fname+"</option>";
			obj6.append($(opt));
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
		
	},"json");
});	

function ftos(){
	var changefid=$("#pacFir_select").val();
	var obj=$("#pacSec_select");
	var opt;
	obj.html("");
	if(changefid==-1){
		opt="<option value=-1>全部</option>";
		obj.append($(opt));
	}else{
		$.post("pacProductServlet",{op:"changePacSecInfo",fid:changefid},function(data){
			console.info(data);
			$.each(data.sec,function(index,item){
				opt="<option value='"+item.tid+"'>"+item.tname+"</option>";
				obj.append($(opt));
			});
		},"json");
	}
	
	
}
</script>

<div id="pacPro_add" class="easyui-dialog" title="添加狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="pacPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="pacPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="pacPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="pacPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="pacPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'news_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="pacPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="pacPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="pacPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="pacPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="pacPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="pacPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:addPacProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="news_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>


<div id="pacPro_show" class="easyui-dialog" title="查看狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name" id="showpacPro_name" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature" id="showpacPro_nature" class="myinput" readonly="readonly"><br /> <br />
		<label>品牌名称:</label><input type=text name="brandid" id="showpacPro_brandid" class="myinput" readonly="readonly"><br /> <br />
		<label>所属分类:</label><input type=text name="tid" id="showpacPro_tid" class="myinput" readonly="readonly"><br /> <br />
		<label>适用宠物:</label><input type=text name="suitpet" id="showpacPro_suitpet" class="myinput" readonly="readonly"><br /> <br />
		<label>市场价:</label><input type=text name="marpri" id="showpacPro_marpri" class="myinput" readonly="readonly"><br /> <br />
		<label>波奇价:</label><input type=text name="bqpri" id="showpacPro_bqpri" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales" id="showpacPro_sales" class="myinput" readonly="readonly"><br /> <br />
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="showpacPro_intro" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven" id="showpacPro_inven" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品状态:</label><input type=text name="status" id="showpacPro_status" class="myinput" readonly="readonly"><br /> <br />  
		
	</form>
	<div style="float:right; width:380px; margin-right:20px; margin-top:20px" id="news_pic_show_info">
	</div>
</div>


<div id="pacPro_upt" class="easyui-dialog" title="更改狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="uptpacPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="uptpacPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="uptpacPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="uptpacPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="uptpacPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'uptpro_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="uptpacPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="uptpacPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="uptpacPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="uptpacPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="uptpacPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="uptpacPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:uptPacProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="uptpro_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<script>
function findProByInfo(){
	var fid=$("#pacFir_select").val();
	var tid=$("#pacSec_select").val();
	var brandid=$("#pacBra_select").val();
	var type="爬虫";
	
	$('#pacpro_info').datagrid({
		url:'pacProductServlet',
		queryParams:{op:"findProByInfo",fid:fid,tid:tid,brandid:brandid,type:type}
	});	
}
function addPacProInfoButton(){
	$("#pacPro_add").dialog("open");
}
function addPacProInfo(){
	
	var proname=$("#pacPro_name").val();
	var nature=$("#pacPro_nature").val();
	var brandid=$("#pacPro_brname").val();
	var tid=$("#pacPro_tpname").val();
	var promarprice=$("#pacPro_marpri").val();
	var bqpri=$("#pacPro_bqpri").val();
	var prosales=$("#pacPro_sales").val();
	var prointro=$("#pacPro_intro").val();
	var inventory=$("#pacPro_inven").val();
	var status=$("#pacPro_status").val();
	
	$.ajaxFileUpload({
		url:"pacProductServlet?op=addPacProInfo",
		secureuri:false,
		fileElementId:"pacPro_pic",
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
				$("#pacPro_add").dialog("close");
				$("#pacpro_info").datagrid("reload");
				
				$("#pacPro_name").val("");
				$("#pacPro_nature").val("");
				$("#pacPro_pic").val("");
				$("#pacPro_marpri").val("");
				$("#pacPro_bqpri").val("");
				$("#pacPro_sales").val("");
				$("#pacPro_intro").val("");
				$("#pacPro_inven").val("");
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
	$("#pacPro_show").dialog("open");
	
	$.post("pacProductServlet",{op:"findProByProid",proid:proid},function(data){
		var pro=data.pro;
		var bra=data.bra;
		var sm=data.sm;
		$("#showpacPro_name").val(pro[0].proname);
		$("#showpacPro_nature").val(pro[0].nature);
		$("#showpacPro_brandid").val(bra[0].brandname);
		$("#showpacPro_tid").val(sm[0].tname);
		$("#showpacPro_suitpet").val(pro[0].suitpet);
		$("#showpacPro_marpri").val(pro[0].promarprice);
		$("#showpacPro_bqpri").val(pro[0].bqpri);
		$("#showpacPro_sales").val(pro[0].prosales);
		$("#showpacPro_intro").val(pro[0].prointro);
		$("#showpacPro_inven").val(pro[0].inventory);
		$("#showpacPro_status").val(pro[0].status);
		var str="";
		
		var pics=pro[0].pictrue.split(",");
		for(var i=0;i<pics.length;i++){
			str+="<img src='"+pics[i]+"' width='100px' height='100px'/>"
		}
		$("#news_pic_show_info").html($(str));
	},"json");
}

function uptPacProInfoButton(){
	
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
		$("#pacPro_upt").dialog("open");
		$.post("pacProductServlet",{op:"findProByProid",proid:proid},function(data){
			var pro=data.pro;
			var bra=data.bra;
			var sm=data.sm;
			$("#uptpacPro_name").val(pro[0].proname);
			$("#uptpacPro_nature").val(pro[0].nature);
			$("#uptpacPro_brname option").map(function(){
				var temp=$(this).text();
				if(temp==bra[0].brandname){
					$(this).attr("selected",true);
				}
			});
			$("#uptpacPro_tpname option").map(function(){
				var temp=$(this).text();
				if(temp==sm[0].tname){
					$(this).attr("selected",true);
				}
			});
			$("#uptpacPro_marpri").val(pro[0].promarprice);
			$("#uptpacPro_bqpri").val(pro[0].bqpri);
			$("#uptpacPro_sales").val(pro[0].prosales);
			$("#uptpacPro_intro").val(pro[0].prointro);
			$("#uptpacPro_inven").val(pro[0].inventory);
			$("#uptpacPro_status option").map(function(){
				var temp=$(this).val();
				if(temp==pro[0].status){
					$(this).attr("selected",true);
				}
			});
			var str="";
			
			var pics=pro[0].pictrue.split(",");
			for(var i=0;i<pics.length;i++){
				str+="<img src='"+pics[i]+"' width='100px' height='100px'/>"
			}
			$("#news_pic_show_info").html($(str));
		},"json");
	}	
}
function rmvPacProInfoButton(){
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
				$.post("pacProductServlet",{op:"delProInfo",proids:proids},function(data){
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


function uptPacProInfo(){
	var proname=$("#uptpacPro_name").val();
	var nature=$("#uptpacPro_nature").val();
	var brandid=$("#uptpacPro_brname").val();
	var tid=$("#uptpacPro_tpname").val();
	var suitpet=$("#uptpacPro_suitpet").val();
	var promarprice=$("#uptpacPro_marpri").val();
	var bqpri=$("#uptpacPro_bqpri").val();
	var prosales=$("#uptpacPro_sales").val();
	var prointro=$("#uptpacPro_intro").val();
	var inventory=$("#uptpacPro_inven").val();
	var status=$("#uptpacPro_status").val();
	
	$.ajaxFileUpload({
		url:"pacProductServlet?op=uptPacProInfo",
		secureuri:false,
		fileElementId:"uptpacPro_pic",
		dataType:"json",
		data:{
			proid:uptProid,
			proname:proname,
			nature:nature,
			brandid:brandid,
			tid:tid,
			suitpet:suitpet,
			promarprice:promarprice,
			bqpri:bqpri,
			prosales:prosales,
			prointro:prointro,
			inventory:inventory,
			status:status
		},
		success:function(data,status){
			if(parseInt($.trim(data))==1){
				$.messager.show({title:'成功提示',msg:'商品信息修改成功....',timeout:2000,showType:'slide'});
				$("#pacPro_upt").dialog("close");
				$("#pacpro_info").datagrid("reload");
				
				$("#uptpacPro_name").val("");
				$("#uptpacPro_nature").val("");
				$("#uptpacPro_pic").val("");
				$("#uptpacPro_marpri").val("");
				$("#uptpacPro_bqpri").val("");
				$("#uptpacPro_sales").val("");
				$("#uptpacPro_intro").val("");
				$("#uptpacPro_inven").val("");
				$("#uptpro_pic_show").html("");
				
			}else{
				$.messager.alert("失败提示","商品信息修改失败....","error");
			}
		},
		error:function(data,status,e){
			$.messager.alert("错误提示","商品信息修改有误....\n"+e,"error");
		}
	});
}



</script>