<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="dogpro_info" data-options="fit:true"></table>
<div id="dogproduct_toolbar" style="width:100%,text-align:left">
	<a href="javascript:addDogProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	<a href="javascript:uptDogProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:rmvDogProInfoButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	<label style="margin-left:15px;">所属分类</label><select id="Fir_select" onChange="ftos()">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">二级分类</label><select id="Sec_select">
		<option value=-1>全部</option>
	</select>
	<label style="margin-left:15px;">品牌</label><select id="Bra_select">
		<option value=-1>全部</option>
	</select>
	<a href="javascript:findProByInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	<a href="javascript:findSelectInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">加载</a>
</div>
<script>
var uptProid;
var datagrid;
$(function(){
	
	var editRow=undefined;
	var op;
	var flag;
	

	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	

	
	datagrid=$('#dogpro_info').datagrid({
		url:'productServlet',
		queryParams:{op:"getPageDogProInfo"},
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
function findSelectInfo(){
	$.post("productServlet",{op:"getSelectInfo"},function(data){
		//var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
		var obj=$("#dogPro_brname");
		var obj1=$("#dogPro_tpname");
		var obj2=$("#dogPro_status");
		var obj3=$("#uptdogPro_brname");
		var obj4=$("#uptdogPro_tpname");
		var obj5=$("#uptdogPro_status");
		var obj6=$("#Fir_select");
		var obj7=$("#Sec_select");
		var obj8=$("#Bra_select");
		
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
		$.post("productServlet",{op:"changeDogSecInfo",fid:changefid},function(data){
			console.info(data);
			$.each(data.sec,function(index,item){
				opt="<option value='"+item.tid+"'>"+item.tname+"</option>";
				obj.append($(opt));
			});
		},"json");
	}
	
	
}
</script>

<div id="dogPro_add" class="easyui-dialog" title="添加狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="dogPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="dogPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="dogPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="dogPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="dogPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'news_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="dogPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="dogPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="dogPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="dogPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="dogPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="dogPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:addDogProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="news_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>


<div id="dogPro_show" class="easyui-dialog" title="查看狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name" id="showdogPro_name" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature" id="showdogPro_nature" class="myinput" readonly="readonly"><br /> <br />
		<label>品牌名称:</label><input type=text name="brandid" id="showdogPro_brandid" class="myinput" readonly="readonly"><br /> <br />
		<label>所属分类:</label><input type=text name="tid" id="showdogPro_tid" class="myinput" readonly="readonly"><br /> <br />
		<label>适用宠物:</label><input type=text name="suitpet" id="showdogPro_suitpet" class="myinput" readonly="readonly"><br /> <br />
		<label>市场价:</label><input type=text name="marpri" id="showdogPro_marpri" class="myinput" readonly="readonly"><br /> <br />
		<label>波奇价:</label><input type=text name="bqpri" id="showdogPro_bqpri" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales" id="showdogPro_sales" class="myinput" readonly="readonly"><br /> <br />
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="showdogPro_intro" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven" id="showdogPro_inven" class="myinput" readonly="readonly"><br /> <br /> 
		<label>商品状态:</label><input type=text name="status" id="showdogPro_status" class="myinput" readonly="readonly"><br /> <br />  
		
	</form>
	<div style="float:right; width:380px; margin-right:20px; margin-top:20px" id="news_pic_show_info">
	</div>
</div>


<div id="dogPro_upt" class="easyui-dialog" title="更改狗狗商品"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>商品名称:</label><input type=text name="name"id="uptdogPro_name" class="myinput"><br /> <br /> 
		<label>商品规格:</label><input type=text name="nature"id="uptdogPro_nature" class="myinput"><br /> <br /> 
		<label>品牌名称:</label><select name="brandid" id="uptdogPro_brname"class="myinput"></select><br /> <br />
		<label>所属分类:</label><select name="tid" id="uptdogPro_tpname"class="myinput"></select><br /> <br />
		<label>商品图片:</label><input type=file name="pic" id="uptdogPro_pic" multiple="multiple" onchange="previewMultipleImage(this,'uptpro_pic_show')"><br /> <br /> 
		<label>市场价:</label><input type=text name="marpri"id="uptdogPro_marpri" class="myinput"><br /> <br /> 
		<label>波奇价:</label><input type=text name="bqpri"id="uptdogPro_bqpri" class="myinput"><br /> <br /> 
		<label>商品销量:</label><input type=text name="sales"id="uptdogPro_sales" class="myinput"><br /> <br /> 
		<label style="float:left;">商品介绍:</label><textarea maxlength="25" name="intro" id="uptdogPro_intro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		<label>商品库存:</label><input type=text name="inven"id="uptdogPro_inven" class="myinput"><br /> <br /> 
		<label>商品状态:</label><select name="status" id="uptdogPro_status"class="myinput"></select><br /> <br />  
		
		<a href="javascript:uptDogProInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="uptpro_pic_show">
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
	
	$.post("productServlet",{op:"findProByProid",proid:proid},function(data){
		var pro=data.pro;
		var bra=data.bra;
		var sm=data.sm;
		$("#showdogPro_name").val(pro[0].proname);
		$("#showdogPro_nature").val(pro[0].nature);
		$("#showdogPro_brandid").val(bra[0].brandName);
		$("#showdogPro_tid").val(sm[0].tname);
		$("#showdogPro_suitpet").val(pro[0].suitpet);
		$("#showdogPro_marpri").val(pro[0].promarprice);
		$("#showdogPro_bqpri").val(pro[0].bqpri);
		$("#showdogPro_sales").val(pro[0].prosales);
		$("#showdogPro_intro").val(pro[0].prointro);
		$("#showdogPro_inven").val(pro[0].inventory);
		$("#showdogPro_status").val(pro[0].status);
		var str="";
		
		var pics=pro[0].pictrue.split(",");
		for(var i=0;i<pics.length;i++){
			str+="<img src='"+pics[i]+"' width='100px' height='100px'/>"
		}
		$("#news_pic_show_info").html($(str));
	},"json");
}

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
		$.post("productServlet",{op:"findProByProid",proid:proid},function(data){
			var pro=data.pro;
			var bra=data.bra;
			var sm=data.sm;
			$("#uptdogPro_name").val(pro[0].proname);
			$("#uptdogPro_nature").val(pro[0].nature);
			$("#uptdogPro_brname option").map(function(){
				var temp=$(this).text();
				if(temp==bra[0].brandName){
					$(this).attr("selected",true);
				}
			});
			$("#uptdogPro_tpname option").map(function(){
				var temp=$(this).text();
				if(temp==sm[0].tname){
					$(this).attr("selected",true);
				}
			});
			$("#uptdogPro_marpri").val(pro[0].promarprice);
			$("#uptdogPro_bqpri").val(pro[0].bqpri);
			$("#uptdogPro_sales").val(pro[0].prosales);
			$("#uptdogPro_intro").val(pro[0].prointro);
			$("#uptdogPro_inven").val(pro[0].inventory);
			$("#uptdogPro_status option").map(function(){
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


function uptDogProInfo(){
	var proname=$("#uptdogPro_name").val();
	var nature=$("#uptdogPro_nature").val();
	var brandid=$("#uptdogPro_brname").val();
	var tid=$("#uptdogPro_tpname").val();
	var suitpet=$("#uptdogPro_suitpet").val();
	var promarprice=$("#uptdogPro_marpri").val();
	var bqpri=$("#uptdogPro_bqpri").val();
	var prosales=$("#uptdogPro_sales").val();
	var prointro=$("#uptdogPro_intro").val();
	var inventory=$("#uptdogPro_inven").val();
	var status=$("#uptdogPro_status").val();
	
	$.ajaxFileUpload({
		url:"productServlet?op=uptDogProInfo",
		secureuri:false,
		fileElementId:"uptdogPro_pic",
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
				$.messager.alert("失败提示","商品信息修改失败....","error");
			}
		},
		error:function(data,status,e){
			$.messager.alert("错误提示","商品信息修改有误....\n"+e,"error");
		}
	});
}



</script>