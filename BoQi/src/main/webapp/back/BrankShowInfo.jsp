<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="easyui/js/echarts.common.min.js"></script>
<table id="brand_showinfo" data-options="fit:true"></table>
<div id="brand_show_Info" class="easyui-dialog" title="品牌详细" data-options="fit:true,iconCls:'icon-search1',resizable:true,modal:true,closed:true">
	<span id="show_tu" style="width: 600px;height:400px;float:left;"></span>
	<span id="show_num_tu" style="width: 600px;height:400px;float:right;"></span>
</div>
<script>
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('show_tu'));
var myChart_num = echarts.init(document.getElementById('show_num_tu'));

function show_brand_Info(orderid){
	myChart.setOption({
	    tooltip: {
	        trigger: 'axis',
	        position: function (pt) {
	            return [pt[0], '10%'];
	        }
	    },
	    title: {
	        left: 'center',
	        text: '品牌销售图',
	    },
	    legend: {
	        top: 'bottom',
	        data:['单日销售额']
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataView: {show: true, readOnly: false},
	            magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	            restore: {show: true},
	            saveAsImage: {show: true}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: []
	    },
	    yAxis: {
	        type: 'value',
	        boundaryGap: [0, '100%']
	    },
	    dataZoom: [{
	        type: 'inside',
	        start: 0,
	        end: 100
	    }, {
	        start: 0,
	        end: 10
	    }],
	    series: [
	        {
	            name:'单日销售额',
	            type:'line',
	            smooth:true,
	            symbol: 'none',
	            sampling: 'average',
	            itemStyle: {
	                normal: {
	                    color: 'rgb(255, 70, 131)'
	                }
	            },
	            areaStyle: {
	                normal: {
	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0,
	                        color: 'rgb(255, 158, 68)'
	                    }, {
	                        offset: 1,
	                        color: 'rgb(255, 70, 131)'
	                    }])
	                }
	            },
	            data: []
	        }
	    ]
	});
	myChart_num.setOption({
	    tooltip: {
	        trigger: 'axis',
	        position: function (pt) {
	            return [pt[0], '10%'];
	        }
	    },
	    title: {
	        left: 'center',
	        text: '品牌销量图',
	    },
	    legend: {
	        top: 'bottom',
	        data:['单日销量额']
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataView: {show: true, readOnly: false},
	            magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	            restore: {show: true},
	            saveAsImage: {show: true}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: []
	    },
	    yAxis: {
	        type: 'value',
	        boundaryGap: [0, '100%']
	    },
	    dataZoom: [{
	        type: 'inside',
	        start: 0,
	        end: 100
	    }, {
	        start: 0,
	        end: 10
	    }],
	    series: [
	        {
	            name:'单日销量额',
	            type:'line',
	            smooth:true,
	            symbol: 'none',
	            sampling: 'average',
	            itemStyle: {
	                normal: {
	                    color: 'rgb(255, 70, 131)'
	                }
	            },
	            areaStyle: {
	                normal: {
	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0,
	                        color: 'rgb(255, 158, 68)'
	                    }, {
	                        offset: 1,
	                        color: 'rgb(255, 70, 131)'
	                    }])
	                }
	            },
	            data: []
	        }
	    ]
	});
	
	myChart.showLoading();
	myChart_num.showLoading();
	$.get('brand_getBrand_sell_info.action?brandid='+orderid).done(function (data) {
	    myChart.hideLoading();
	    myChart_num.hideLoading();
	    var len = data.brs.length;  //数据条数
	    var cha = DateDiff(data.nowtime,data.brs[0].paytime);  //天数，循环次数
	    var allPay = [data.brs[0].br_pro_total];//第一天的金额
	    var allNum = [data.brs[0].br_num_total];//第一天的销量
	    var j=1;
	    var base = +new Date(data.brs[0].paytime);
	    var fi = new Date(data.brs[0].paytime);
	    var days = [[fi.getFullYear(), fi.getMonth() + 1, fi.getDate()].join('-')];//第一天的日期
		var oneDay = 24 * 3600 * 1000;
		console.info("chaa:"+cha);
	    console.info(len);
	    for(var i=1;i<cha;i++){
	    	var now = new Date(base += oneDay);
	    	if(len!=1 && j<len){
	    		console.info("jqq:"+j);
	    		var now2 = new Date(data.brs[j].paytime);
	    		console.info("jq:"+j);
	    	}
	    	days.push([now.getFullYear(), now.getMonth() + 1, now.getDate()].join('-'));
	    	
	    	if(now-now2==0){
	    		allPay.push(data.brs[j].br_pro_total);
	    		allNum.push(data.brs[j].br_num_total);
	    		j++;
	    	}else{
	    		allPay.push(0);
	    		allNum.push(0);
	    	}
	    }
	    myChart.setOption({
	   		xAxis: {
	            data: days
	        },
	        series: [{
	            // 根据名字对应到相应的系列
	            name:'单日销售额',
	            data: allPay
	        }]
	    }); 
	    myChart_num.setOption({
	   		xAxis: {
	            data: days
	        },
	        series: [{
	            // 根据名字对应到相应的系列
	            name:'单日销量额',
	            data: allNum
	        }]
	    }); 
	});
}
	
$(function(){
	var datagrid;
	var editRow=undefined;
	var op;
	var flag;
	
	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	
	datagrid=$('#brand_showinfo').datagrid({
		url:'brand_getPageBrandShowInfo.action',
		fitColumns:true,
		striped:true,
		loadMsg:"数据加载中...",
		pagination:true,
		rownumbers:true,
		remoteSort:false,
		idField: 'brandid',
		columns:[[
		    {field:'brandid',title:'品牌编号',width:100,align:'center'},
		    {field:'brandName',title:'品牌名称',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'br_num_total',title:'品牌销量',width:100,align:'center'},
		    {field:'br_pro_total',title:'品牌销售额',width:100,align:'center'},
		    {field:'_operate',title:'操作',width:100,align:'center',
		    	formatter:function(value,rowData,index){
		    		return '<a class="icon-search1 icon-padding" href="javascript:showBrandDetail(\''+rowData.brandid+'\')">详细</a>';
		    	}
		    }
		]],
		toolbar:[{
			text:"添加",
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
		}]
	});
})
function showBrandDetail(orderid){
	$("#brand_show_Info").dialog("open");
	show_brand_Info(orderid);
}
function  DateDiff(sDate1,sDate2){    //sDate1和sDate2是2006-12-18格式      
   var  aDate,  oDate1,  oDate2,  iDays;    
   aDate  =  sDate1.split("-");      
   oDate1  =  new  Date(aDate[0]  +  '-'  +  aDate[1]  +  '-'  +  aDate[2]);    //转换为12-18-2006格式      
   aDate  =  sDate2.split("-");      
   oDate2  =  new  Date(aDate[0]  +  '-'  +  aDate[1]  +  '-'  +  aDate[2]);      
   iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24);    //把相差的毫秒数转换为天数     
   return  iDays + 1;    
} 
</script>