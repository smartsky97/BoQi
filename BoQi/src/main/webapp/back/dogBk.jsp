<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="dogBk_info" data-options="fit:true">
<div id="dogBk_toolbar" style="width:100%,text-align:left">
	<a href="javascript:addDogBkButton()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	<a href="javascript:uptDogBkButton()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:rmvDogBkButton()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
</div>
</table>

<script>
var uptPetid;
var datagrid;
$(function(){
	var editRow=undefined;
	var op;
	var flag;
	

	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	
	datagrid=$('#dogBk_info').datagrid({
		url:'baike_findDogPet.action',
		//queryParams:{op:"getPageDogBkInfo"},
		fitColumns:true,
		striped:true,
		loadMsg:"数据加载中...",
		pagination:true,
		rownumbers:true,
		sortName:'petid',
		remoteSort:false,
		idField: 'petids',
		columns:[[
		    {field:'petids',title:'宠物编号',width:100,align:'center',checkbox:true},
		    {field:'petid',title:'宠物编号',width:200,align:'center'},
		    {field:'petname',title:'宠物名称',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'pettype',title:'宠物属性',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'engname',title:'英文名',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'ancehome',title:'祖籍',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'life',title:'寿命',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'petprice',title:'价格',width:200,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'op',title:'操作',width:100,align:'center',
				formatter:function(value,row,index){
					return "<a href='javascript:showBkDetail("+row.petid+")'>详细<a/>";
					}
				}
		]],
		toolbar:"#dogBk_toolbar"
	});
	
});
</script>

<div id="dogBk_add" class="easyui-dialog" title="添加宠物百科"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>宠物名称:</label><input type=text name="petname"id="dogBk_petname" class="myinput"><br /> <br /> 
		<label>宠物属性:</label><input type=text name="pettype"id="dogBk_pettype" class="myinput"><br /> <br /> 
		<label>英文名:</label><input type=text name="engname"id="dogBk_engname" class="myinput"><br /> <br />
		<label>祖籍:</label><input type=text name="ancehome"id="dogBk_ancehome" class="myinput"><br /> <br />
		<label>宠物图片:</label><input type=file name="pictrues" id="dogBk_pic" multiple="multiple" onchange="previewMultipleImage(this,'addBk_pic_show')"><br /> <br /> 
		<label>寿命:</label><input type=text name="life"id="dogBk_life" class="myinput"><br /> <br /> 
		<label>市场价:</label><input type=text name="petprice"id="dogBk_petprice" class="myinput"><br /> <br /> 
		<label style="float:left;">性格特点:</label><textarea maxlength="500" name="character" id="dogBk_character" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">宠物简介:</label><textarea maxlength="500" name="petintro" id="dogBk_petintro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">养护知识:</label><textarea maxlength="500" name="conserveinfo" id="dogBk_conserveinfo" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">喂食要点:</label><textarea maxlength="500" name="feedinfo" id="dogBk_feedinfo" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		
		<a href="javascript:addDogBk()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="addBk_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<div id="dogBk_show" class="easyui-dialog" title="查看宠物百科"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>宠物名称:</label><input type=text name="petname"id="showdogBk_petname" class="myinput" readonly="readonly"><br /> <br /> 
		<label>宠物属性:</label><input type=text name="pettype"id="showdogBk_pettype" class="myinput" readonly="readonly"><br /> <br /> 
		<label>英文名:</label><input type=text name="engname"id="showdogBk_engname" class="myinput" readonly="readonly"><br /> <br />
		<label>祖籍:</label><input type=text name="ancehome"id="showdogBk_ancehome" class="myinput" readonly="readonly"><br /> <br />
		<label>寿命:</label><input type=text name="life"id="showdogBk_life" class="myinput" readonly="readonly"><br /> <br /> 
		<label>市场价:</label><input type=text name="petprice"id="showdogBk_petprice" class="myinput" readonly="readonly"><br /> <br /> 
		<label style="float:left;">性格特点:</label><textarea maxlength="500" name="character" id="showdogBk_character" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">宠物简介:</label><textarea maxlength="500" name="petintro" id="showdogBk_petintro" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">养护知识:</label><textarea maxlength="500" name="conserveinfo" id="showdogBk_conserveinfo" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">喂食要点:</label><textarea maxlength="500" name="feedinfo" id="showdogBk_feedinfo" class="myinput" readonly="readonly" style="width:150px;height:50px;"></textarea><br /> <br /> 
		
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="showBk_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<div id="dogBk_upt" class="easyui-dialog" title="修改宠物百科"  data-options="fit:true,iconCls:'icon-add',resizeable:true,modal:true,closed:true" style="float:left;">
	<form action="" style="padding:20px;float:left;display:inline-block;">
		<label>宠物名称:</label><input type=text name="petname"id="uptdogBk_petname" class="myinput"><br /> <br /> 
		<label>宠物属性:</label><input type=text name="pettype"id="uptdogBk_pettype" class="myinput"><br /> <br /> 
		<label>英文名:</label><input type=text name="engname"id="uptdogBk_engname" class="myinput"><br /> <br />
		<label>祖籍:</label><input type=text name="ancehome"id="uptdogBk_ancehome" class="myinput"><br /> <br />
		<label>宠物图片:</label><input type=file name="pictrues" id="uptdogBk_pic" multiple="multiple" onchange="previewMultipleImage(this,'uptBk_pic_show')"><br /> <br /> 
		<label>寿命:</label><input type=text name="life"id="uptdogBk_life" class="myinput"><br /> <br /> 
		<label>市场价:</label><input type=text name="petprice"id="uptdogBk_petprice" class="myinput"><br /> <br /> 
		<label style="float:left;">性格特点:</label><textarea maxlength="500" name="character" id="uptdogBk_character" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">宠物简介:</label><textarea maxlength="500" name="petintro" id="uptdogBk_petintro" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">养护知识:</label><textarea maxlength="500" name="conserveinfo" id="uptdogBk_conserveinfo" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br />
		<label style="float:left;">喂食要点:</label><textarea maxlength="500" name="feedinfo" id="uptdogBk_feedinfo" class="myinput" style="width:150px;height:50px;"></textarea><br /> <br /> 
		
		<a href="javascript:uptDogBk()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
	</form>
	<div style="float:right;width:380px;margin-right:20px;">
		<fieldset id="uptBk_pic_show">
			<legend>图片预览</legend>
		</fieldset>
	</div>
</div>
<script>
function addDogBkButton(){
	
	$("#dogBk_petname").val("");
	$("#dogBk_pettype").val("");
	$("#dogBk_engname").val("");
	$("#dogBk_ancehome").val("");
	$("#dogBk_pic").val("");
	$("#dogBk_life").val("");
	$("#dogBk_petprice").val("");
	$("#dogBk_character").val("");
	$("#dogBk_petintro").val("");
	$("#dogBk_conserveinfo").val("");
	$("#dogBk_feedinfo").val("");
	$("#addBk_pic_show").html("");
	
	$("#dogBk_add").dialog("open");
}
function uptDogBkButton(){
var  rows=datagrid.datagrid("getChecked")[0];
	
	if(rows==undefined){
		$.messager.show({
			title:"温馨提示",
			msg:"请选择您要修改的数据...",
			timeout:2000,
			showType:'slide'
		});
	}else{
		var petid=rows.petid;
		uptPetid=petid;
		$("#dogBk_upt").dialog("open");
		$.post("baike_finDogByid",{petid:petid},function(data){
			var pet=data.data;
			
			$("#uptdogBk_petname").val(pet.petname);
			$("#uptdogBk_pettype").val(pet.pettype);
			$("#uptdogBk_engname").val(pet.engname);
			$("#uptdogBk_ancehome").val(pet.ancehome);
			$("#uptdogBk_life").val(pet.life);
			$("#uptdogBk_petprice").val(pet.petprice);
			$("#uptdogBk_character").val(pet.character);
			$("#uptdogBk_petintro").val(pet.petintro);
			$("#uptdogBk_conserveinfo").val(pet.conserveinfo);
			$("#uptdogBk_feedinfo").val(pet.feedinfo);
			var str="";
			
			var pics=pet.petpic.split(",");
			for(var i=0;i<pics.length;i++){
				str+="<img src=../upload/"+petid+"/"+pics[i]+" width='100px' height='100px'/>"
			}
			$("#uptBk_pic_show").html($(str));
		},"json");
	}
}
function rmvDogBkButton(){
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
				var petids="";
				for(var i=0;i<rows.length-1;i++){
					petids+=rows[i].petid+",";
				}
				petids+=rows[i].petid;
						
				//将要删除aid发送到服务器
				$.post("baike_deleteDogInfo.action",{petids:petids},function(data){
					if(data.result==1){   //删除成功
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

function addDogBk(){
	
	var petname=$("#dogBk_petname").val();
	var pettype=$("#dogBk_pettype").val();
	var engname=$("#dogBk_engname").val();
	var ancehome=$("#dogBk_ancehome").val();
	var life=$("#dogBk_life").val();
	var petprice=$("#dogBk_petprice").val();
	var character=$("#dogBk_character").val();
	var petintro=$("#dogBk_petintro").val();
	var conserveinfo=$("#dogBk_conserveinfo").val();
	var feedinfo=$("#dogBk_feedinfo").val();
	
	$.ajaxFileUpload({
		url:"baike_addDogPet",
		secureuri:false,
		fileElementId:"dogBk_pic",
		dataType:"json",
		data:{
			petname:petname,
			pettype:pettype,
			engname:engname,
			ancehome:ancehome,
			life:life,
			petprice:petprice,
			character:character,
			petintro:petintro,
			conserveinfo:conserveinfo,
			family:'狗',
			feedinfo:feedinfo
		},
		success:function(data,status){
			console.info(data);
			if(parseInt($.trim(data.result))==1){
				$.messager.show({title:'成功提示',msg:'百科信息添加成功....',timeout:2000,showType:'slide'});
				$("#dogBk_add").dialog("close");
				$("#dogBk_info").datagrid("reload");
				
				$("#dogBk_petname").val("");
				$("#dogBk_pettype").val("");
				$("#dogBk_engname").val("");
				$("#dogBk_ancehome").val("");
				$("#dogBk_life").val("");
				$("#dogBk_petprice").val("");
				$("#dogBk_character").val("");
				$("#dogBk_petintro").val("");
				$("#dogBk_conserveinfo").val("");
				$("#dogBk_feedinfo").val("");
				$("#addBk_pic_show").html("");
				
			}else{
				$.messager.alert("失败提示","百科信息添加失败....","error");
			}
		},
		error:function(data,status,e){
			$.messager.alert("错误提示","百科信息添加有误....\n"+e,"error");
		}
	});
}
function showBkDetail(petid){
	$("#dogBk_show").dialog("open");
	
	$.post("baike_finDogByid",{petid:petid},function(data){
		var pet=data.data;
		
		$("#showdogBk_petname").val(pet.petname);
		$("#showdogBk_pettype").val(pet.pettype);
		$("#showdogBk_engname").val(pet.engname);
		$("#showdogBk_ancehome").val(pet.ancehome);
		$("#showdogBk_life").val(pet.life);
		$("#showdogBk_petprice").val(pet.petprice);
		$("#showdogBk_character").val(pet.character);
		$("#showdogBk_petintro").val(pet.petintro);
		$("#showdogBk_conserveinfo").val(pet.conserveinfo);
		$("#showdogBk_feedinfo").val(pet.feedinfo);
		var str="";
		
		var pics=pet.petpic.split(",");
		for(var i=0;i<pics.length;i++){
			str+="<img src=../upload/"+petid+"/"+pics[i]+" width='100px' height='100px'/>"
		}
		$("#showBk_pic_show").html($(str));
	},"json");
}
function uptDogBk(){
	
	var petname=$("#uptdogBk_petname").val();
	var pettype=$("#uptdogBk_pettype").val();
	var engname=$("#uptdogBk_engname").val();
	var ancehome=$("#uptdogBk_ancehome").val();
	var life=$("#uptdogBk_life").val();
	var petprice=$("#uptdogBk_petprice").val();
	var character=$("#uptdogBk_character").val();
	var petintro=$("#uptdogBk_petintro").val();
	var conserveinfo=$("#uptdogBk_conserveinfo").val();
	var feedinfo=$("#uptdogBk_feedinfo").val();
	
	$.ajaxFileUpload({
		url:"baike_updateDogInfo.action",
		secureuri:false,
		fileElementId:"uptdogBk_pic",
		dataType:"json",
		data:{
			petid:uptPetid,
			petname:petname,
			pettype:pettype,
			engname:engname,
			ancehome:ancehome,
			life:life,
			petprice:petprice,
			character:character,
			petintro:petintro,
			conserveinfo:conserveinfo,
			feedinfo:feedinfo
		},
		success:function(data,status){
			if(parseInt($.trim(data.result))==1){
				$.messager.show({title:'成功提示',msg:'百科信息修改成功....',timeout:2000,showType:'slide'});
				$("#dogBk_upt").dialog("close");
				$("#dogBk_info").datagrid("reload");
				
				$("#uptdogBk_petname").val("");
				$("#uptdogBk_pettype").val("");
				$("#uptdogBk_engname").val("");
				$("#uptdogBk_ancehome").val("");
				$("#uptdogBk_life").val("");
				$("#uptdogBk_petprice").val("");
				$("#uptdogBk_character").val("");
				$("#uptdogBk_petintro").val("");
				$("#uptdogBk_conserveinfo").val("");
				$("#uptdogBk_feedinfo").val("");
				$("#uptBk_pic_show").html("");
				
			}else{
				$.messager.alert("失败提示","百科信息修改失败....","error");
			}
		},
		error:function(data,status,e){
			$.messager.alert("错误提示","百科信息修改有误....\n"+e,"error");
		}
	});
}
</script>

