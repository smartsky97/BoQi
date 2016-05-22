<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="catpro_info" data-options="fit:true"></table>
<div id="product_toolbar" style="width:100%,text-align:left">
	<a href="javascript:addCatProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	<a href="javascript:uptCatProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:rmvCatProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	<label style="margin-left:15px;">所属分类</label><select id="catFir_select" onChange="ftos()">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">二级分类</label><select id="catSec_select">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">品牌</label><select id="catBra_select">
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
	
	datagrid=$('#catpro_info').datagrid({
		url:'catProductServlet',
		queryParams:{op:"getPageCatProInfo"},
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
	
	$.post("catProductServlet",{op:"getSelectInfo"},function(data){
		//var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
		var obj=$("#catPro_brname");
		var obj1=$("#catPro_tpname");
		var obj2=$("#catPro_status");
		var obj3=$("#uptcatPro_brname");
		var obj4=$("#uptcatPro_tpname");
		var obj5=$("#uptcatPro_status");
		var obj6=$("#catFir_select");
		var obj7=$("#catSec_select");
		var obj8=$("#catBra_select");
		
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
	var changefid=$("#catFir_select").val();
	var obj=$("#catSec_select");
	var opt;
	obj.html("");
	if(changefid==-1){
		opt="<option value=-1>全部</option>";
		obj.append($(opt));
	}else{
		$.post("catProductServlet",{op:"changeCatSecInfo",fid:changefid},function(data){
			console.info(data);
			$.each(data.sec,function(index,item){
				opt="<option value='"+item.tid+"'>"+item.tname+"</option>";
				obj.append($(opt));
			});
		},"json");
	}
	
	
}
</script>

<div id="catPro_add" class="easyui-dialog" title="添加狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="catPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="catPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="catPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="catPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="catPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'news_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="catPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="catPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="catPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="catPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="catPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="catPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:addCatProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="news_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>


<div id="catPro_show" class="easyui-dialog" title="查看狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name" id="showcatPro_name" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature" id="showcatPro_nature" class="myinput" readonly="readonly"><br /> <br />
		<label>品牌名称:</label><input type=text name="brandid" id="showcatPro_brandid" class="myinput" readonly="readonly"><br /> <br />
		<label>所属分类:</label><input type=text name="tid" id="showcatPro_tid" class="myinput" readonly="readonly"><br /> <br />
		<label>适用宠物:</label><input type=text name="suitpet" id="showcatPro_suitpet" class="myinput" readonly="readonly"><br /> <br />
		<label>市场价:</label><input type=text name="marpri" id="showcatPro_marpri" class="myinput" readonly="readonly"><br /> <br />
		<label>波奇价:</label><input type=text name="bqpri" id="showcatPro_bqpri" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales" id="showcatPro_sales" class="myinput" readonly="readonly"><br /> <br />
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="showcatPro_intro" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven" id="showcatPro_inven" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品状态:</label><input type=text name="status" id="showcatPro_status" class="myinput" readonly="readonly"><br /> <br />  
		
	</form>
	<div style="float:right; width:380px; margin-right:20px; margin-top:20px" id="news_pic_show_info">
	</div>
</div>


<div id="catPro_upt" class="easyui-dialog" title="更改狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="uptcatPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="uptcatPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="uptcatPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="uptcatPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="uptcatPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'uptpro_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="uptcatPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="uptcatPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="uptcatPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="uptcatPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="uptcatPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="uptcatPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:uptCatProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="uptpro_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<script>
function findProByInfo(){
	var fid=$("#catFir_select").val();
	var tid=$("#catSec_select").val();
	var brandid=$("#catBra_select").val();
	var type="猫";
	
	$('#catpro_info').datagrid({
		url:'catProductServlet',
		queryParams:{op:"findProByInfo",fid:fid,tid:tid,brandid:brandid,type:type}
	});	
}
function addCatProInfoButton(){
	$("#catPro_add").dialog("open");
}
function addCatProInfo(){
	
	var proname=$("#catPro_name").val();
	var nature=$("#catPro_nature").val();
	var brandid=$("#catPro_brname").val();
	var tid=$("#catPro_tpname").val();
	var promarprice=$("#catPro_marpri").val();
	var bqpri=$("#catPro_bqpri").val();
	var prosales=$("#catPro_sales").val();
	var prointro=$("#catPro_intro").val();
	var inventory=$("#catPro_inven").val();
	var status=$("#catPro_status").val();
	
	$.ajaxFileUpload({
		url:"catProductServlet?op=addCatProInfo",
		secureuri:false,
		fileElementId:"catPro_pic",
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
				$("#catPro_add").dialog("close");
				$("#catpro_info").datagrid("reload");
				
				$("#catPro_name").val("");
				$("#catPro_nature").val("");
				$("#catPro_pic").val("");
				$("#catPro_marpri").val("");
				$("#catPro_bqpri").val("");
				$("#catPro_sales").val("");
				$("#catPro_intro").val("");
				$("#catPro_inven").val("");
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
	$("#catPro_show").dialog("open");
	
	$.post("catProductServlet",{op:"findProByProid",proid:proid},function(data){
		var pro=data.pro;
		var bra=data.bra;
		var sm=data.sm;
		$("#showcatPro_name").val(pro[0].proname);
		$("#showcatPro_nature").val(pro[0].nature);
		$("#showcatPro_brandid").val(bra[0].brandname);
		$("#showcatPro_tid").val(sm[0].tname);
		$("#showcatPro_suitpet").val(pro[0].suitpet);
		$("#showcatPro_marpri").val(pro[0].promarprice);
		$("#showcatPro_bqpri").val(pro[0].bqpri);
		$("#showcatPro_sales").val(pro[0].prosales);
		$("#showcatPro_intro").val(pro[0].prointro);
		$("#showcatPro_inven").val(pro[0].inventory);
		$("#showcatPro_status").val(pro[0].status);
		var str="";
		
		var pics=pro[0].pictrue.split(",");
		for(var i=0;i<pics.length;i++){
			str+="<img src='"+pics[i]+"' width='100px' height='100px'/>"
		}
		$("#news_pic_show_info").html($(str));
	},"json");
}

function uptCatProInfoButton(){
	
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
		$("#catPro_upt").dialog("open");
		$.post("catProductServlet",{op:"findProByProid",proid:proid},function(data){
			var pro=data.pro;
			var bra=data.bra;
			var sm=data.sm;
			$("#uptcatPro_name").val(pro[0].proname);
			$("#uptcatPro_nature").val(pro[0].nature);
			$("#uptcatPro_brname option").map(function(){
				var temp=$(this).text();
				if(temp==bra[0].brandname){
					$(this).attr("selected",true);
				}
			});
			$("#uptcatPro_tpname option").map(function(){
				var temp=$(this).text();
				if(temp==sm[0].tname){
					$(this).attr("selected",true);
				}
			});
			$("#uptcatPro_marpri").val(pro[0].promarprice);
			$("#uptcatPro_bqpri").val(pro[0].bqpri);
			$("#uptcatPro_sales").val(pro[0].prosales);
			$("#uptcatPro_intro").val(pro[0].prointro);
			$("#uptcatPro_inven").val(pro[0].inventory);
			$("#uptcatPro_status option").map(function(){
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
function rmvCatProInfoButton(){
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
				$.post("catProductServlet",{op:"delProInfo",proids:proids},function(data){
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


function uptCatProInfo(){
	var proname=$("#uptcatPro_name").val();
	var nature=$("#uptcatPro_nature").val();
	var brandid=$("#uptcatPro_brname").val();
	var tid=$("#uptcatPro_tpname").val();
	var suitpet=$("#uptcatPro_suitpet").val();
	var promarprice=$("#uptcatPro_marpri").val();
	var bqpri=$("#uptcatPro_bqpri").val();
	var prosales=$("#uptcatPro_sales").val();
	var prointro=$("#uptcatPro_intro").val();
	var inventory=$("#uptcatPro_inven").val();
	var status=$("#uptcatPro_status").val();
	
	$.ajaxFileUpload({
		url:"catProductServlet?op=uptCatProInfo",
		secureuri:false,
		fileElementId:"uptcatPro_pic",
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
				$("#catPro_upt").dialog("close");
				$("#catpro_info").datagrid("reload");
				
				$("#uptcatPro_name").val("");
				$("#uptcatPro_nature").val("");
				$("#uptcatPro_pic").val("");
				$("#uptcatPro_marpri").val("");
				$("#uptcatPro_bqpri").val("");
				$("#uptcatPro_sales").val("");
				$("#uptcatPro_intro").val("");
				$("#uptcatPro_inven").val("");
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