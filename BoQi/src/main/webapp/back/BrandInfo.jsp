<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="brand_info" data-options="fit:true"></table>
<script>
$(function(){
	var datagrid;
	var editRow=undefined;
	var op;
	var flag;
	
	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	
	datagrid=$('#brand_info').datagrid({
		url:'brand_getPageBrandInfo.action',
		fitColumns:true,
		striped:true,
		loadMsg:"数据加载中...",
		pagination:true,
		rownumbers:true,
		sortName:'brandid',
		remoteSort:false,
		idField: 'brandid',
		columns:[[
		    {field:'brandids',title:'品牌编号',width:100,align:'center',checkbox:true},
		    {field:'brandid',title:'品牌编号',width:100,align:'center'},
		    {field:'brandName',title:'品牌名称',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'status',title:'状态',width:100,align:'center',editor:{type:"combobox",options:{
				required:true,valueField:'sid',textField:'sname',data:statusObj}},
				formatter:function(value,row,index){
					for(var i=0;i<statusObj.length;i++){
						if(statusObj[i].sid==value){
							return statusObj[i].sname;
						}
					}
					return value;
				}	
			}
		]],
		toolbar:[{
			text:"添加",
			iconCls: 'icon-add',
			handler: function(){
				op="addBrandInfo";
				flag="添加";
				if(editRow!=undefined){
					datagrid.datagrid("rejectChanges");   //说明有行正在被编辑，则还原当前的修改
					datagrid.datagrid("endEdit",editRow);   //关闭当前正在编辑的行
					editRow=undefined;
				}else{  //在表格的最前面添加一行
					datagrid.datagrid("insertRow",{index:0,row:{}});
					
					//打开编辑器
					datagrid.datagrid("beginEdit",0);
					editRow=0;  //记录当前正在被编辑的行
				}
				
			}
		},{
			text:"修改",
			iconCls: 'icon-edit',
			handler: function(){
				//
				var  rows=datagrid.datagrid("getChecked")[0];
				if(rows==undefined){
					$.messager.show({
						title:"温馨提示",
						msg:"请选择您要修改的数据...",
						timeout:2000,
						showType:'slide'
					});
				}else{
					op="updateBrandInfo";
					flag="修改";
					if(editRow!=undefined){  //说明有行正在被编辑，则还原当前的修改
						datagrid.datagrid("rejectChanges");   //说明有行正在被编辑，则还原当前的修改
						datagrid.datagrid("endEdit",editRow);   //关闭当前正在编辑的行
						editRow=undefined;
					}else{  //在表格的最前面添加一行
						var index=datagrid.datagrid("getRowIndex",rows);
						datagrid.datagrid("updateRow",{index:index,row:rows});
						
						//打开编辑器
						datagrid.datagrid("beginEdit",index);
						editRow=index;  //记录当前正在被编辑的行
					}
				}
			}
		},{
			text:"删除",
			iconCls: 'icon-remove',
			handler: function(){
				//
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
							var brandids="";
							
							var i=0
							for(i;i<rows.length-1;i++){
								brandids+=rows[i].brandid+",";
								
							}
							brandids+=rows[i].brandid;
							//将要删除aid发送到服务器
							$.post("brandServlet",{op:"delBrandInfo",brandids:brandids},function(data){
								if(data==1){   //删除成功
									$.messager.show({
										title:"删除提示",
										msg:"管理员信息删除成功...",
										timeout:2000,
										showType:'slide'
									});
									datagrid.datagrid("reload");  //重新加载数据一次
								}else{
									$.messager.alert('失败提示','管理员信息删除失败...','error');
								}
							});
						}
					});
				}
				
			}
		},{
			text:"保存",
			iconCls: 'icon-save',
			handler: function(){
				datagrid.datagrid("endEdit",editRow);   //关闭当前正在编辑的行
				//获取当前被修改的对象
				var rows=datagrid.datagrid("getChanges")[0];
				if(rows==undefined){
					datagrid.datagrid("rejectChanges");   //回滚自创建以来或自上次调用acceptChanges，所有变化的数据
					datagrid.datagrid("unselectAll");  
					editRow=undefined;
				}else{
					rows["op"]=op;
					
					$.post("brandServlet",rows,function(data){
						data=parseInt($.trim(data));
						if(data==1){   //
							$.messager.show({
								title:"成功提示",
								msg:'新闻类型信息'+flag+'成功...',
								timeout:2000,
								showType:'slide'
							});
						}else{
							$.messager.alert('失败提示','新闻类型信息'+flag+'失败...','error');
						}
						
						rows=null;
						datagrid.datagrid("reload");  //重新加载数据一次
						editRow=undefined;
						datagrid.datagrid("rejectChanges");   //回滚自创建以来或自上次调用acceptChanges，所有变化的数据
						datagrid.datagrid("unselectAll");
					});
				}
			}
		},{
			text:'撤销',
			iconCls: 'icon-redo',
			handler: function(){
				datagrid.datagrid("rejectChanges");   //说明有行正在被编辑，则还原当前的修改
				datagrid.datagrid("endEdit",editRow);   //关闭当前正在编辑的行
				editRow=undefined;
			}
		}]
	});
});
</script>