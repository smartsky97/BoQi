<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<table id="ordercontent_info" data-options="fit:true"></table>
<div id="show_order_info_find" style="width:100%,text-align:left">
	<a href="javascript:revise()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
	<a href="javascript:del()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	<span  style="margin-top:5px;">订单编号：</span><input  style="margin-top:5px;" type="text" name="ccid" id="show_order_id">
	<span  style="margin-top:5px;">客户姓名：</span><input style="margin-top:5px;" type="text" name="ccuname" id="show_order_name">
	<span>日期：</span><input name="ndate" id="show_order_ndate" class="easyui-datebox myinput" required>
	<span>状态：</span><select name="ccstatus" id="ccstatus">
		<option value="">全部</option>
		<option value="0">失效</option>
		<option value="1">待付款</option>
		<option value="2">已付款</option>
		<option value="3">配货中</option>
		<option value="4">已发货</option>
		<option value="5">已收货</option>
		<option value="6">已收货但删除</option>
		<option value="7">退货</option>
	</select>
	&nbsp;&nbsp;<a href="javascript:findOrderInfoByInfo()" style="margin-top:-5px;" class="easyui-linkbutton" data-option="iconCls:'icon-add'">查询</a>
	<a href="javascript:changeToPai()" style="margin-top:-5px;margin-left:15px;" class="easyui-linkbutton" data-option="iconCls:'icon-add'">转配货</a>
	<a href="javascript:changeToFa()" style="margin-top:-5px;margin-left:15px;" class="easyui-linkbutton" data-option="iconCls:'icon-add'">转发货</a>
	
</div>
<script>
var datagrid;
var op;
var flag;
var tty;//商品的个数
$(function(){
	
	var editRow=undefined;

	//未确认	取消	确认	已付款	配货中	已发货	已收货	退货
	var statusObj=[{sid:0,sname:'失效'},{sid:1,sname:'待付款'},{sid:2,sname:'已付款'},{sid:3,sname:'配货中'},{sid:4,sname:'已发货'},{sid:5,sname:'已收货'},{sid:6,sname:'已收货但删除'},{sid:7,sname:'退货'}];
	//给修改订单的状态添加状态属性
	//$(".checked").append();

	datagrid=$('#ordercontent_info').datagrid({
		url:'ordercontent_findAllOrders.action',
		fitColumns:true,
		striped:true,
		loadMsg:"数据加载中...",
		pagination:true,
		rownumbers:true,
		sortName:'orderid',
		remoteSort:false,
		idField: 'orderid',
		columns:[[
		    {field:'orderids',title:'订单编号',width:100,align:'center',checkbox:true},
		    {field:'orderid',title:'订单编号',width:100,align:'center'},
		    {field:'uname',title:'客户姓名',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'starttime',title:'订单日期',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'ordersum',title:'订单金额',width:100,align:'center',editor:{type:"text",options:{required:true}}},
		    {field:'orderstate',title:'订单状态',width:100,align:'center',editor:{type:"combobox",options:{
				required:true,valueField:'sid',textField:'sname',data:statusObj}},
				formatter:function(value,row,index){
				  for(var i=0;i<statusObj.length;i++){
				  	if(statusObj[i].sid==value){
				  		return statusObj[i].sname;
				  		}
				  	}
				  	return value;
				  }
			},
		    {field:'_operate',title:'操作',width:100,align:'center',
		    	formatter:function(value,rowData,index){
		    		return '<a class="icon-search1 icon-padding" href="javascript:showNewsDetail(\''+rowData.orderid+'\')">详细</a>';
		    	}
		    }
		]],toolbar:"#show_order_info_find"
	});
});
</script>
<!-- 商品详情浏览 -->
<div id="ordercontent_show_ordercontentInfo" class="easyui-dialog" title="订单详细" data-options="fit:true,iconCls:'icon-search1',resizable:true,modal:true,closed:true">
	<center>
	<div id="content_show" id="content_show">
		<div class="content_buyer wwidth">
			<label class="tt" style="margin-left:20px;">买&nbsp;家&nbsp;昵&nbsp;称&nbsp;：</label><span class="tt" id="content_buyer_name"></span>
			<label class="tt" style="margin-left:60px;">买&nbsp;家&nbsp;电&nbsp;话&nbsp;：</label><span class="tt" id="content_buyer_tel"></span></br/><br/></br/><br/>
			<label class="tt" style="margin-left:20px;">收货人姓名：</label><span class="tt" id="content_shou_name"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">收货人电话：</label><span class="tt" id="content_shou_tel"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">收&nbsp;货&nbsp;地&nbsp;址&nbsp;：</label><span class="tt" id="content_shou_addr"></span></br/><br/>
		</div>
		<div id="content_up" class="wwidth">
			<label class="tt" style="margin-left:20px;">订&nbsp;单&nbsp;编&nbsp;号&nbsp;：</label><span class="tt" id="content_id"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">创&nbsp;建&nbsp;时&nbsp;间&nbsp;：</label><span class="tt" id="content_maketime"></span>
			<label class="tt" style="margin-left:60px;">付&nbsp;款&nbsp;时&nbsp;间&nbsp;：</label><span class="tt" id="content_paytime"></span>
			<label class="tt" style="margin-left:60px;">确&nbsp;认&nbsp;时&nbsp;间&nbsp;：</label><span class="tt" id="content_suretime"></span>
		</div>
		<table id="content_table">
			<thead>
				<tr class="content_top_title">
					<th class="content_goods">商品</th>
					<th class="content_attr">商品属性</th>
					<th class="content_pri">单价</th>
					<th class="content_num">数量</th>
					<th class="content_status">状态</th>
				</tr>
			</thead>
			<tbody id="content_tbody">
				
			</tbody>
			<tfoot>	
				<tr class="content_total">
					<td id="all_td" colspan="5">
						<div id="haha">
							<label>订单总金额：</label><strong id="total_money"></strong>&nbsp元
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	</center>
</div>

<!-- 商品修改页面 -->
<div id="ordercontent_show_ordercontentInfo2" class="easyui-dialog" title="修改信息" data-options="fit:true,iconCls:'icon-add',resizable:true,modal:true,closed:true">
	<center>
	<div id="content_show">
		<div id="buyerID" style="display:none;"></div>
		<div class="content_buyer wwidth">
			<label class="tt" style="margin-left:20px;">买&nbsp;家&nbsp;昵&nbsp;称&nbsp;：</label><span class="tt" id="content_buyer_name2"></span>
			<label class="tt" style="margin-left:60px;">买&nbsp;家&nbsp;电&nbsp;话&nbsp;：</label><span class="tt" id="content_buyer_tel2"></span></br/><br/></br/><br/>
			<label class="tt" style="margin-left:20px;">收货人昵称：</label><input class="tt" id="content_shou_name2"></input>
			<label class="tt" style="margin-left:60px;">收货人电话：</label><input class="tt" id="content_shou_tel2"></input></br/><br/>
			<label class="tt" style="margin-left:20px;">收货人地址：</label> 
				<span style="float:left;">
					<select id="sheng" name="province"></select> 省 &nbsp;&nbsp;
					<select id="shi" name="city"></select> 市 &nbsp;&nbsp;
					<select id="xian" name="country"></select> 县 &nbsp;&nbsp;
					<select id="xiang" name="street"></select> 镇或街道 </br/><br/>
				</span>
				<input style="width:420px;margin-left: 90px;" class="tt" id="content_shou_addr2"></input>
		</div></br/>
		<div id="content_up" class="wwidth">
			<label class="tt" style="margin-left:20px;">订&nbsp;单&nbsp;编&nbsp;号&nbsp;：</label><span class="tt" id="content_id2"></span></br/><br/>
			<label class="tt" style="margin-left:20px;">成&nbsp;交&nbsp;时&nbsp;间&nbsp;：</label><span class="tt" id="content_maketime2"></span>
			<label class="tt" style="margin-left:60px;">付&nbsp;款&nbsp;时&nbsp;间&nbsp;：</label><span class="tt" id="content_paytime2"></span>
			<label class="tt" style="margin-left:60px;">确&nbsp;认&nbsp;时&nbsp;间&nbsp;：</label><span class="tt" id="content_suretime2"></span>
		</div>
		<table id="content_table">
			<thead>
				<tr class="content_top_title">
					<th class="content_goods">商品</th>
					<th class="content_attr">商品属性</th>
					<th class="content_pri">单价</th>
					<th class="content_num">数量</th>
					<th class="content_status2">状态</th>
				</tr>
			</thead>
			<tbody id="content_tbody2">
				
			</tbody>
			<tfoot>	
				<tr class="content_total">
					<td id="all_td" colspan="5">
						<div id="haha">
							<label>订单总金额：</label><span id="total_money2"></span>&nbsp元
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
		<div class="allsure">
			<input type="button" onclick="sendInfo()" class="yoyo" value="提交"/>
		</div>
	</div>
	</center>
</div>
<script>
var yuanName;
var yuantel;
var yuanshen;
var yuanshi;
var yuanxian;
var yuanxiang;
var yuanaddr;



//订单状态转到配货
function changeToPai(){
	//获取所有被选中的行
	var rows = datagrid.datagrid("getChecked");
	if(rows.length<=0){//没有选择任何一行
		$.messager.show({
			title:'温馨提示',
			msg:'请选择您要操作的数据...',
			timeout:2000,
			showType:'slide'
		});
	}else{
		var kexing = 'yes';
		for(var i = 0;i<rows.length;i++){
			if(rows[i].orderstate!=2){
				kexing = 'no';
				break;
			}
		}
		if(kexing == 'yes'){
			var orderids = "";
			var i=0;
			for( i = 0;i<rows.length-1;i++){
				orderids += rows[i].orderid+",";
			}
			///console.info("last="+i);
			orderids += rows[i].orderid;
			$.post("orderContentServlet",{op:"changeToPei",orderids:orderids},function(data){
				console.info(data);
				if(data == 1){//添加成功
					$.messager.show({
						title:'处理提示',
						msg:'订单处理成功...',
						timeout:2000,
						showType:'slide'
					});
					datagrid.datagrid("reload");//重新加载数据一次
				}else{
					$.messager.alert('失败提示','订单处理失败...','error');
				}
			});
		}else{
			$.messager.show({
				title:'温馨提示',
				msg:'订单不满足配货条件...',
				timeout:2000,
				showType:'slide'
			});
		}
	}
}
//订单状态转到发货
function changeToFa(){
	//获取所有被选中的行
	var rows = datagrid.datagrid("getChecked");
	if(rows.length<=0){//没有选择任何一行
		$.messager.show({
			title:'温馨提示',
			msg:'请选择您要操作的数据...',
			timeout:2000,
			showType:'slide'
		});
	}else{
		var kexing = 'yes';
		for(var i = 0;i<rows.length;i++){
			if(rows[i].orderstate<2 || rows[i].orderstate>3){
				kexing = 'no';
				break;
			}
		}
		if(kexing == 'yes'){
			var orderids = "";
			var i=0;
			for( i = 0;i<rows.length-1;i++){
				orderids += rows[i].orderid+",";
			}
			///console.info("last="+i);
			orderids += rows[i].orderid;
			$.post("orderContentServlet",{op:"changeToFa",orderids:orderids},function(data){
				console.info(data);
				if(data == 1){//添加成功
					$.messager.show({
						title:'处理提示',
						msg:'订单处理成功...',
						timeout:2000,
						showType:'slide'
					});
					datagrid.datagrid("reload");//重新加载数据一次
				}else{
					$.messager.alert('失败提示','订单处理失败...','error');
				}
			});
		}else{
			$.messager.show({
				title:'温馨提示',
				msg:'订单不满足发货条件...',
				timeout:2000,
				showType:'slide'
			});
		}
	}
}
//修改订单
function revise (){
	var rows = datagrid.datagrid("getChecked")[0];
	if(rows == undefined){
		$.messager.show({title:'温馨提示',msg:'请选择您要修改的数据...',timeout:2000,showType:'slide'});
	}else{
		$("#ordercontent_show_ordercontentInfo2").dialog("open");
		showNewsDetail2(rows.orderid);
	}
}
//删除订单
function del(){
	//获取所有被选中的行
	var rows = datagrid.datagrid("getChecked");
	if(rows.length<=0){//没有选择任何一行
		$.messager.show({
			title:'温馨提示',
			msg:'请选择您要删除的数据...',
			timeout:2000,
			showType:'slide'
		});
	}else{
		$.messager.confirm('信息确认','您确定要删除选中的数据吗？',function(r){
			if(r){
				var orderids = "";
				var i=0;
				for( i = 0;i<rows.length-1;i++){
					orderids += rows[i].orderid+",";
				}
				
				orderids += rows[i].orderid;
				//讲要删除aid发送到服务器
				$.post("ordercontent_updateToLing.action",{orderids:orderids},function(data){
					console.info("返回成功的条数"+data);
					if(data != 0){//添加成功
						$.messager.show({
							title:'删除提示',
							msg:'订单删除成功...',
							timeout:2000,
							showType:'slide'
						});
						datagrid.datagrid("reload");//重新加载数据一次
					}else{
						$.messager.alert('失败提示','订单删除失败...','error');
					}
				});
			}
		});
	}
}
/* function tt(){
	$("#content_tbody2").children("tr").eq(0).children("th").eq(1).children("select").val("100Kg");
} */
//弹开修改页面
function showNewsDetail2(orderid){
	$("#ordercontent_show_ordercontentInfo2").dialog("open");
	$.post("backOrder_findBackOrderContent.action",{orderid:orderid},function(data){
		var ordercontent=data;
		var starttime=checkNull(ordercontent.starttime);
		var paytime=checkNull(ordercontent.paytime);
		var endtime=checkNull(ordercontent.endtime);
		var sum=0;   //商品全部加起来的价格
		var sname="";   //商品拼接起来的商品名
		
		$("#content_shou_addr2").val("");
		$("#content_shou_name2").val("");
		$("#content_shou_tel2").val("");
		$("#content_tbody2").empty();
		
		$("#content_id2").html(ordercontent.orderid);
		$("#content_maketime2").html(starttime);
		$("#content_paytime2").html(paytime);
		$("#content_suretime2").html(endtime);
		$("#content_shou_name2").val(ordercontent.addname);
		$("#content_shou_tel2").val(ordercontent.atel);
		$("#content_buyer_name2").html(ordercontent.uname);  //买家姓名
		$("#content_buyer_tel2").html(ordercontent.utel);	//买家电话
		initLocation({sheng_val:ordercontent.shen,shi_val:ordercontent.shi,xian_val:ordercontent.xian,xiang_val:"<?php echo $v['street']?>"});
		$("#xiang").val(ordercontent.zhenjie);
		$("#content_shou_addr2").val(ordercontent.readdr);
		$("#buyerID").html(ordercontent.addid);
		//向方框中加值
      	for(var i=0;i<ordercontent.goods.length;i++){
      		$("#content_tbody2").append("<tr><th>"+ordercontent.goods[i]['proname']
      			+"</th><th id='buchengda'><select name='tid' onchange='changePrice(this)' id='news_newstype' class='myinput'>"
      			+ordercontent.goods[i]['nature']+"</th><th><input class='content_jiage' onblur='changemoney()' style='width:80px;'/>"
      			+"</th><th><input class='content_jiage2' onblur='changemoney()' style='width:80px;'/></th><th class='lastwo'>"
      			+ordercontent.goods[i]['status']+"<span class='thing_proid'>"+ordercontent.goods[i]['orrmid']
      			+"</span><span style='display:none;' id='chage_proid'>"+ordercontent.goods[i]['proid']+"</span></th></tr>");
     			
			$("#content_tbody2").children("tr").eq(i).children("th").eq(2).children("input").val(ordercontent.goods[i]['bqpri']);
			$("#content_tbody2").children("tr").eq(i).children("th").eq(3).children("input").val(ordercontent.goods[i]['pronum']);
			sum+=ordercontent.goods[i]['bqpri']*ordercontent.goods[i]['pronum'];
			sname+=ordercontent.goods[i]['proname']+",";
			tty = $("#content_tbody2").children("tr").length;
      	}
      	$("#total_money2").html(sum);
      	getNature(sname);
	},"json");
}

	var pid; 
	//弹开详情页面
	function showNewsDetail(orderid){
		$("#ordercontent_show_ordercontentInfo").dialog("open");
		$.post("backOrder_findBackOrderContent.action",{orderid:orderid},function(data){
			var ordercontent=data;
			var starttime=checkNull(ordercontent.starttime);
			var paytime=checkNull(ordercontent.paytime);
			var endtime=checkNull(ordercontent.endtime);
			
			$("#content_tbody").empty();
			
			$("#content_id").html(ordercontent.orderid);  //订单编号
			$("#content_maketime").html(starttime);  //创建时间
			$("#content_paytime").html(paytime);  //付款时间
			$("#content_suretime").html(endtime);  //收货时间
			$("#content_buyer_name").html(ordercontent.uname);  //买家姓名
			$("#content_buyer_tel").html(ordercontent.utel);	//买家电话
			$("#content_shou_name").html(ordercontent.addname);  //收货人姓名
			$("#content_shou_tel").html(ordercontent.atel);	//收货人电话
			$("#content_shou_addr").html(ordercontent.shen+" "+ordercontent.shi+" "+ordercontent.xian+" "+ordercontent.zhenjie+" "+ordercontent.readdr);  //收货人地址
			var total=0;
			for(var i=0;i<ordercontent.goods.length;i++){
				$("#content_tbody").append("<tr><th>"+"<img src=\"upload/"+ordercontent.goods[i]['pictrue']+"\" alt=\"图片暂时为空\" style=\"width:100px;height:100px;\"/><br/>"+ordercontent.goods[i]['proname']+"</th><th>"+ordercontent.goods[i]['nature']+"</th><th>"+ordercontent.goods[i]['bqpri']+"</th><th>"+ordercontent.goods[i]['pronum']+"</th><th class='llas'>"+checkStatus(ordercontent.goods[i]['status'])+"</th></tr>");
      			total = total+ordercontent.goods[i]['bqpri']*ordercontent.goods[i]['pronum'];
			}
			$("#total_money").html(total);  //总价
			
		},"json");
	}
	
	function checkNull(data){
		if(data==null || data==""){
			return "待定";
		}else{
			return data.substr(0,10);
		}
	}
	//获取每一行的属性
	function getNature(data){
		$.post("productinfo_getNatureByName.action",{proname:data},function(data){
			var nature = data;
			
			//根据列表的行数来循环
			for(var i=0;i<tty;i++){
				var ssname=$("#content_tbody2").children("tr").eq(i).children("th").eq(0).html();
				var ssid=$("#content_tbody2").children("tr").eq(i).children("th").eq(4).children("#chage_proid").html()
				var obj = $("#content_tbody2").children("tr").eq(i).children("th").eq(1).children("select");
				var opt;
				//根据获取的属性数来循环
				for(var q=0;q<nature.length;q++){
					if(ssname==nature[q].proname){
						if(nature[q].proid==ssid){
							opt="<option value='"+nature[q].nature+"' selected='selected'>"+nature[q].nature+"</option>";
						}else{
							opt="<option value='"+nature[q].nature+"'>"+nature[q].nature+"</option>";
						}
						obj.append($(opt));
					}
				}
			}
		},"json");
	}
	//根据单价数量的改变，总金额也随之改变
	function changemoney(){
		$("#total_money2").empty();
		var summoney=0;
		for(var i=0;i<tty;i++){
			var thisdan=$("#content_tbody2").children("tr").eq(i).children("th").eq(2).children("input").val();
			var thisnum=$("#content_tbody2").children("tr").eq(i).children("th").eq(3).children("input").val();
			summoney+=thisdan*thisnum;
		}
		$("#total_money2").append(summoney);
	}
	//根据属性的不同改变价格
	function changePrice(data){
		var nnt = data.value;
		console.info(data);
		var nnn = $(data).parent().parent().children("th").eq(0).html();
		console.info($(data).parent().parent());
		$.post("productinfo_getPriceByNaNa.action",{proname:nnn,nature:nnt},function(data2){
			var datah = data2;
			$(data).parent().parent().children("th").eq(2).children("input").val("");
			$(data).parent().parent().children("th").eq(2).children("input").val(datah[0].bqpri);
			
			$(data).parent().parent().children("th").eq(4).children("#chage_proid").empty();
			$(data).parent().parent().children("th").eq(4).children("#chage_proid").append(datah[0].proid);
			console.info(datah[0].proid);
			changemoney();
		},"json");
	}
	//提交修改的内容
	function sendInfo(){
		var allString="";
		//买家姓名
		var addname=$("#content_shou_name2").val();
		//买家电话
		var tel=$("#content_shou_tel2").val();
		//买家地址
		var shen = $("#sheng").val();
		var shi = $("#shi").val();
		var xian = $("#xian").val();
		var xiang = $("#xiang").val();
		var readdr=$("#content_shou_addr2").val();
		//订单编号
		var contentBigId = $("#content_id2").html();
		//订单的id
		var addid = $("#buyerID").html();
		//订单需付的金额
		var allmo = $("#total_money2").html();
		$.post("orderContentServlet",{op:"updateMoney",allmo:allmo,contentBigId:contentBigId},function(data){
			console.info(data);
		})
		//更新收货人的信息
		/* $.post("addressServlet",{op:"updateSomeInfo",addname:addname,tel:tel,readdr:readdr,addid:addid},function(data){
			if(data==1){
				//alert("修改成功");
				//$("#ordercontent_show_ordercontentInfo2").dialog("close");
			}else{
				//alert("修改失败")
			}
		},"json"); */
		//更新订单的详细信息
		for(var i=0;i<tty;i++){
			var shangID = $("#content_tbody2").children("tr").eq(i).children("th").eq(4).children("#chage_proid").html()+",";
			
			//旧的编号
			var xiangID = $("#content_tbody2").children("tr").eq(i).children("th").eq(4).children(".thing_proid").html()+",";
			var danjia = $("#content_tbody2").children("tr").eq(i).children("th").eq(2).children("input").val()+",";
			var numb = $("#content_tbody2").children("tr").eq(i).children("th").eq(3).children("input").val()+",";
			var status = $("#content_tbody2").children("tr").eq(i).children("th").eq(4).html().substr(0,1)+",";
			allString+=shangID+danjia+numb+status+xiangID;
		}
		console.info(allString);
		$.post("backOrder_updateBackOrder",{allString:allString,addname:addname,atel:tel,shen:shen,shi:shi,xian:xian,zhenjie:xiang,readdr:readdr,addid:addid},function(data){
		 if(data==1){
				alert("修改成功");
				$("#ordercontent_show_ordercontentInfo2").dialog("close");
			}else{
				alert("修改失败")
			}
		},"json");  
	}
	
	function checkStatus(data){
		if(data==0){
			return "交易取消";
		}else if(data==1){
			return "待付款";
		}else if(data==2){
			return "待发货";
		}else if(data==3){
			return "等待收货";
		}else if(data==4){
			return "交易完成";
		}else if(data==5){
			return "退货";
		}
	}
	//根据条件来查询订单
	function findOrderInfoByInfo(){
		var orderid=$.trim($("#show_order_id").val());  //订单编号
		var uname=$.trim($("#show_order_name").val());  //客户名
		var ndate=$("#show_order_ndate").datebox('getValue');  //下订单时间
		var oid = $.trim($("#ccstatus").val());   //订单状态
		
		console.info(orderid+" - "+uname+" - "+ndate+" - "+oid+" - ");
		$('#ordercontent_info').datagrid({
			url:'orderContentServlet',
			queryParams:{op:"findOrdersByInfo",orderid:orderid,uname:uname,ndate:ndate,oid:oid}
		});
	}
</script>
<script type="text/javascript" src="front/js/GlobalProvinces_main.js"></script>
<script type="text/javascript" src="front/js/GlobalProvinces_extend.js"></script>
<script type="text/javascript" src="front/js/initLocation.js"></script>