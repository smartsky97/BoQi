<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="smlpro_info" data-options="fit:true"></table>
<div id="product_toolbar" style="width:100%,text-align:left">
	<a href="javascript:addSmlProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	<a href="javascript:uptSmlProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:rmvSmlProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	<label style="margin-left:15px;">所属分类</label><select id="smlFir_select" onChange="ftos()">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">二级分类</label><select id="smlSec_select">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">品牌</label><select id="smlBra_select">
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
	
	datagrid=$('#smlpro_info').datagrid({
		url:'smlProductServlet',
		queryParams:{op:"getPageSmlProInfo"},
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
		toolbar:"#product_toolbar"
	});
	
	$.post("smlProductServlet",{op:"getSelectInfo"},function(data){
		//var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
		var obj=$("#smlPro_brname");
		var obj1=$("#smlPro_tpname");
		var obj2=$("#smlPro_status");
		var obj3=$("#uptsmlPro_brname");
		var obj4=$("#uptsmlPro_tpname");
		var obj5=$("#uptsmlPro_status");
		var obj6=$("#smlFir_select");
		var obj7=$("#smlSec_select");
		var obj8=$("#smlBra_select");
		
		var opt;
		$.each(data.brand,function(index,item){
			opt="<option value='"+item.brandid+"'>"+item.brandname+"</option>";
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
	var changefid=$("#smlFir_select").val();
	var obj=$("#smlSec_select");
	var opt;
	obj.html("");
	if(changefid==-1){
		opt="<option value=-1>全部</option>";
		obj.append($(opt));
	}else{
		$.post("smlProductServlet",{op:"changeSmlSecInfo",fid:changefid},function(data){
			console.info(data);
			$.each(data.sec,function(index,item){
				opt="<option value='"+item.tid+"'>"+item.tname+"</option>";
				obj.append($(opt));
			});
		},"json");
	}
	
	
}
</script>

<div id="smlPro_add" class="easyui-dialog" title="添加狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="smlPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="smlPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="smlPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="smlPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="smlPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'news_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="smlPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="smlPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="smlPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="smlPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="smlPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="smlPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:addSmlProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="news_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>


<div id="smlPro_show" class="easyui-dialog" title="查看狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name" id="showsmlPro_name" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature" id="showsmlPro_nature" class="myinput" readonly="readonly"><br /> <br />
		<label>品牌名称:</label><input type=text name="brandid" id="showsmlPro_brandid" class="myinput" readonly="readonly"><br /> <br />
		<label>所属分类:</label><input type=text name="tid" id="showsmlPro_tid" class="myinput" readonly="readonly"><br /> <br />
		<label>适用宠物:</label><input type=text name="suitpet" id="showsmlPro_suitpet" class="myinput" readonly="readonly"><br /> <br />
		<label>市场价:</label><input type=text name="marpri" id="showsmlPro_marpri" class="myinput" readonly="readonly"><br /> <br />
		<label>波奇价:</label><input type=text name="bqpri" id="showsmlPro_bqpri" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales" id="showsmlPro_sales" class="myinput" readonly="readonly"><br /> <br />
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="showsmlPro_intro" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven" id="showsmlPro_inven" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品状态:</label><input type=text name="status" id="showsmlPro_status" class="myinput" readonly="readonly"><br /> <br />  
		
	</form>
	<div style="float:right; width:380px; margin-right:20px; margin-top:20px" id="news_pic_show_info">
	</div>
</div>


<div id="smlPro_upt" class="easyui-dialog" title="更改狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="uptsmlPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="uptsmlPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="uptsmlPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="uptsmlPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="uptsmlPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'uptpro_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="uptsmlPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="uptsmlPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="uptsmlPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="uptsmlPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="uptsmlPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="uptsmlPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:uptSmlProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="uptpro_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<script>
function findProByInfo(){
	var fid=$("#smlFir_select").val();
	var tid=$("#smlSec_select").val();
	var brandid=$("#smlBra_select").val();
	var type="小宠";
	
	$('#smlpro_info').datagrid({
		url:'smlProductServlet',
		queryParams:{op:"findProByInfo",fid:fid,tid:tid,brandid:brandid,type:type}
	});	
}
function addSmlProInfoButton(){
	$("#smlPro_add").dialog("open");
}
function addSmlProInfo(){
	
	var proname=$("#smlPro_name").val();
	var nature=$("#smlPro_nature").val();
	var brandid=$("#smlPro_brname").val();
	var tid=$("#smlPro_tpname").val();
	var promarprice=$("#smlPro_marpri").val();
	var bqpri=$("#smlPro_bqpri").val();
	var prosales=$("#smlPro_sales").val();
	var prointro=$("#smlPro_intro").val();
	var inventory=$("#smlPro_inven").val();
	var status=$("#smlPro_status").val();
	
	$.ajaxFileUpload({
		url:"smlProductServlet?op=addSmlProInfo",
		secureuri:false,
		fileElementId:"smlPro_pic",
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
				$("#smlPro_add").dialog("close");
				$("#smlpro_info").datagrid("reload");
				
				$("#smlPro_name").val("");
				$("#smlPro_nature").val("");
				$("#smlPro_pic").val("");
				$("#smlPro_marpri").val("");
				$("#smlPro_bqpri").val("");
				$("#smlPro_sales").val("");
				$("#smlPro_intro").val("");
				$("#smlPro_inven").val("");
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
	$("#smlPro_show").dialog("open");
	
	$.post("smlProductServlet",{op:"findProByProid",proid:proid},function(data){
		var pro=data.pro;
		var bra=data.bra;
		var sm=data.sm;
		$("#showsmlPro_name").val(pro[0].proname);
		$("#showsmlPro_nature").val(pro[0].nature);
		$("#showsmlPro_brandid").val(bra[0].brandname);
		$("#showsmlPro_tid").val(sm[0].tname);
		$("#showsmlPro_suitpet").val(pro[0].suitpet);
		$("#showsmlPro_marpri").val(pro[0].promarprice);
		$("#showsmlPro_bqpri").val(pro[0].bqpri);
		$("#showsmlPro_sales").val(pro[0].prosales);
		$("#showsmlPro_intro").val(pro[0].prointro);
		$("#showsmlPro_inven").val(pro[0].inventory);
		$("#showsmlPro_status").val(pro[0].status);
		var str="";
		
		var pics=pro[0].pictrue.split(",");
		for(var i=0;i<pics.length;i++){
			str+="<img src='"+pics[i]+"' width='100px' height='100px'/>"
		}
		$("#news_pic_show_info").html($(str));
	},"json");
}

function uptSmlProInfoButton(){
	
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
		$("#smlPro_upt").dialog("open");
		$.post("smlProductServlet",{op:"findProByProid",proid:proid},function(data){
			var pro=data.pro;
			var bra=data.bra;
			var sm=data.sm;
			$("#uptsmlPro_name").val(pro[0].proname);
			$("#uptsmlPro_nature").val(pro[0].nature);
			$("#uptsmlPro_brname option").map(function(){
				var temp=$(this).text();
				if(temp==bra[0].brandname){
					$(this).attr("selected",true);
				}
			});
			$("#uptsmlPro_tpname option").map(function(){
				var temp=$(this).text();
				if(temp==sm[0].tname){
					$(this).attr("selected",true);
				}
			});
			$("#uptsmlPro_marpri").val(pro[0].promarprice);
			$("#uptsmlPro_bqpri").val(pro[0].bqpri);
			$("#uptsmlPro_sales").val(pro[0].prosales);
			$("#uptsmlPro_intro").val(pro[0].prointro);
			$("#uptsmlPro_inven").val(pro[0].inventory);
			$("#uptsmlPro_status option").map(function(){
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
function rmvSmlProInfoButton(){
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
				$.post("smlProductServlet",{op:"delProInfo",proids:proids},function(data){
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


function uptSmlProInfo(){
	var proname=$("#uptsmlPro_name").val();
	var nature=$("#uptsmlPro_nature").val();
	var brandid=$("#uptsmlPro_brname").val();
	var tid=$("#uptsmlPro_tpname").val();
	var suitpet=$("#uptsmlPro_suitpet").val();
	var promarprice=$("#uptsmlPro_marpri").val();
	var bqpri=$("#uptsmlPro_bqpri").val();
	var prosales=$("#uptsmlPro_sales").val();
	var prointro=$("#uptsmlPro_intro").val();
	var inventory=$("#uptsmlPro_inven").val();
	var status=$("#uptsmlPro_status").val();
	
	$.ajaxFileUpload({
		url:"smlProductServlet?op=uptSmlProInfo",
		secureuri:false,
		fileElementId:"uptsmlPro_pic",
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
				$("#smlPro_upt").dialog("close");
				$("#smlpro_info").datagrid("reload");
				
				$("#uptsmlPro_name").val("");
				$("#uptsmlPro_nature").val("");
				$("#uptsmlPro_pic").val("");
				$("#uptsmlPro_marpri").val("");
				$("#uptsmlPro_bqpri").val("");
				$("#uptsmlPro_sales").val("");
				$("#uptsmlPro_intro").val("");
				$("#uptsmlPro_inven").val("");
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