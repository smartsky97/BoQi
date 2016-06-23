//JavaScript Document
var uname = "${loginUser.uname}";
$(function(){
	$('.city_left').mouseover(function(){
		$('.city_left').css('border-left','1px solid #CCC');
		$('.city_left').css('border-right','1px solid #CCC');
		$('.City_list_select').css('display','block');
	});
	$('.city_left').mouseout(function(){
		$('.city_left').css('border-left','1px solid #FFF');
		$('.city_left').css('border-right','1px solid #FFF');
		$('.City_list_select').css('display','none');
	});
	$('.City_list_select').mouseover(function(){
		$('.city_left').css('border-left','1px solid #CCC');
		$('.city_left').css('border-right','1px solid #CCC');
		$('.City_list_select').css('display','block');		
	});
	$('.City_list_select').mouseout(function(){
		$('.city_left').css('border-left','1px solid #FFF');
		$('.city_left').css('border-right','1px solid #FFF');
		$('.City_list_select').css('display','none');		
	});
    // $(".")
	$('.top-lix').mouseover(function(){
		$('.top-lix').css('outline','1px solid #CCC');
		$('#toolbar-linjian').css('display','block');
	});
	$('.top-lix').mouseout(function(){
		$('.top-lix').css('outline','0px solid #CCC');
		$('#toolbar-linjian').css('display','none');
	});	
	$('.add_mi').click(function() {
		$(this).css('background', 'url("serviceimg/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("serviceimg/mail.jpg") no-repeat')
	})
	showTotal();
});



//点击删除，从购物车删除商品
	/*function delProduct(id){
		var goods=window.localStorage.getItem('goods');
		goods=JSON.parse(goods);
		if(good!=null){
			var objs=goods.good;
			for(var i=0;i<objs.length;i++){
				objs.splice(i,1);
				goods=JSON.stringify(goods);
				window.localStorage.setItem('goods',goods);
				return showShoppingCart();
			}
		}
	}
*/
/*function show_allMoney(){
	var total_money = $(".money");
	var small_total = $(".small_product");
	var b = 0;
	for (var i = 0; i < small_total.length; i++) {
		b += parseFloat($(small_total[i]).html());
	}
	total_money.html(b);
}*/

function onclick_btnAdd(a) {
	var out_momey = $(".out_momey");
	var input_ = $(a).prev();
	var input_val = $(a).prev().val();
	var input_add = parseInt(input_val) + 1;
	input_.val(input_add);
	var pri1 = $(a).parent().prev().text();
	$(a).parent().next().text(pri1*$(a).prev().val());
	showTotal();
}

function onclick_reduce(b) {
	var out_momey = $(".out_momey");
	var input_ = $(b).next();
	var input_val = $(b).next().val();
	if (input_val <= 1) {
		alert("商品个数不能小于1！")
	} else {
		var input_add = parseInt(input_val) - 1;
		input_.val(input_add);
		var pri2 = $(b).parent().prev().text();
		$(b).parent().next().text(pri2*$(b).next().val());
		showTotal();
	}
}

function showTotal(){
	var total=0;
	//获得已选中复选框
	$(":checkbox[name=list][checked=true]").each(function(){
		var id=$(this).val();
		//通过id找到当前小计元素，获取他的text()
		var text=$("#"+id+"small").text();
		total+=Number(text);
	});
	//显示总计
	$(".money").text(total);
}
function gopay(){
	var bbb= $("#mytable").children("tbody").children("tr");
	var coun = $("#mytable").children("tbody").children("tr").length;
	var song ="";
	for(var i=0;i<coun;i++){
		if($("#mytable").children("tbody").children("tr").eq(i).children(".fi").children("#checkeded").children(".list").attr('checked')){
			var kaka = $("#mytable").children("tbody").children("tr").eq(i).children(".fi").children("#checkeded").children(".list");
			song+=kaka.val()+","+$("#mytable").children("tbody").children("tr").eq(i).children(".fi").children(".pname_product").children("a").html()
				+","+$("#mytable").children("tbody").children("tr").eq(i).find(".price_product").html()+","
				+$("#mytable").children("tbody").children("tr").eq(i).find(".counts_product").val()+","
				+$("#mytable").children("tbody").children("tr").eq(i).find(".small_product").html()+","
				+$("#mytable").children("tbody").children("tr").eq(i).find(".pname_product").find("img").attr("src")+";";
		}
	}
	$.post("shopCar_saveshopcar.action?song="+song,function(){
		window.location.href="boqi_paymoney.action";
	});
}



