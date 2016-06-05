$(function(){
	$("#index_content").tabs("add",{
		title:'波奇网后台管理',
		selected:true,
		closable:false,
	});	
	$("#userInfo").tree({
		onClick:function(node){
			var obj = $("#index_content");
			if(node.id=="userinfo_manager"){
				if(obj.tabs("exists","用户信息管理")){
					obj.tabs("select","用户信息管理");
				}else{
					obj.tabs("add",{
						title:"用户信息管理",
						closable:true,
						fit:true,
						href:"back-UserInfo.action"
					});
				}
			}
		}
	});
	$("#goodsInfo").tree({
		onClick:function(node){
			var obj = $("#index_content");
			if(node.id=="brandinfo_manager"){
				if(obj.tabs("exists","品牌信息管理")){
					obj.tabs("select","品牌信息管理");
				}else{
					obj.tabs("add",{
						title:"品牌信息管理",
						closable:true,
						fit:true,
						href:"back-BrandInfo.action"
					});
				}
			}else if(node.id=="dogpro_manager"){
				if(obj.tabs("exists","狗狗商品信息管理")){
					obj.tabs("select","狗狗商品信息管理");
				}else{
					obj.tabs("add",{
						title:"狗狗商品信息管理",
						closable:true,
						fit:true,
						href:"back-dogproInfo.action"
					});
				}
			}else if(node.id=="catpro_manager"){
				if(obj.tabs("exists","猫猫商品信息管理")){
					obj.tabs("select","猫猫商品信息管理");
				}else{
					obj.tabs("add",{
						title:"猫猫商品信息管理",
						closable:true,
						fit:true,
						href:"back-catproInfo.action"
					});
				}
			}else if(node.id=="smlpro_manager"){
				if(obj.tabs("exists","小宠商品信息管理")){
					obj.tabs("select","小宠商品信息管理");
				}else{
					obj.tabs("add",{
						title:"小宠商品信息管理",
						closable:true,
						fit:true,
						href:"back-smlproInfo.action"
					});
				}
			}else if(node.id=="watpro_manager"){
				if(obj.tabs("exists","水族商品信息管理")){
					obj.tabs("select","水族商品信息管理");
				}else{
					obj.tabs("add",{
						title:"水族商品信息管理",
						closable:true,
						fit:true,
						href:"back-watproInfo.action"
					});
				}
			}else if(node.id=="pacpro_manager"){
				if(obj.tabs("exists","爬虫商品信息管理")){
					obj.tabs("select","爬虫商品信息管理");
				}else{
					obj.tabs("add",{
						title:"爬虫商品信息管理",
						closable:true,
						fit:true,
						href:"back-pacproInfo.action"
					});
				}
			}
		}
	});
	$("#orderInfo").tree({
		onClick:function(node){
			var obj = $("#index_content");
			if(node.id=="ordercontent_manager"){
				if(obj.tabs("exists","订单信息")){
					obj.tabs("select","订单信息");
				}else{
					obj.tabs("add",{
						title:"订单信息",
						closable:true,
						fit:true,
						href:"back-OrderContent.action"
					});
				}
			}
		}
	});
	$("#petInfo").tree({
		onClick:function(node){
			var obj = $("#index_content");
			if(node.id=="dogbk_manager"){
				if(obj.tabs("exists","狗狗百科管理")){
					obj.tabs("select","狗狗百科管理");
				}else{
					obj.tabs("add",{
						title:"狗狗百科管理",
						closable:true,
						fit:true,
						href:"back-dogBk.action"
					});
				}
			}else if(node.id=="catbk_manager"){
				if(obj.tabs("exists","百科管理")){
					obj.tabs("select","猫猫百科管理");
				}else{
					obj.tabs("add",{
						title:"猫猫百科管理",
						closable:true,
						fit:true,
						href:"back-catBk.action"
					});
				}
			}else if(node.id=="watbk_manager"){
				if(obj.tabs("exists","水族百科管理")){
					obj.tabs("select","水族百科管理");
				}else{
					obj.tabs("add",{
						title:"水族百科管理",
						closable:true,
						fit:true,
						href:"back-watBk.action"
					});
				}
			}
		}	
	});
	$("#adInfo").tree({
		onClick:function(node){
			var obj = $("#index_content");
			if(node.id=="ad_manager"){
				if(obj.tabs("exists","广告位信息")){
					obj.tabs("select","广告信息");
				}else{
					obj.tabs("add",{
						title:"订单信息",
						closable:true,
						fit:true,
						href:"back-AdInfo.action"
					});
				}
			}
		}
	});
});