//JavaScript Document
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
});

$(".list").mousedown(function(){
	var num=0;
	$
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

   /*$(document).ready(function(){
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);  //获取url中"?"符后的字符串并正则匹配
            var context = "";
            if (r != null)
                 context = r[2];
            reg = null;
            r = null;
            return context == null || context == "" || context == "undefined" ? "" : context;
        }
        
        $("#p").text(GetQueryString("txt"));
    })*/




//数量的改变
$(document).ready(function(){
    var data= $(this).siblings(".counts_product");
    $('.reduce_product').attr('disabled',true);
    //数量的增加
    $(".plus_product").click(function(){
        $(this).siblings(".counts_product").val(parseInt(data.val())+1);
        if(parseInt(data.val())!=1){
        	 $(this).siblings(".reduce_product").attr("disabled",false);
           
        }
    });
    //数量的减小
    $(".reduce_product").click(function(){
    	$(this).siblings(".counts_product").val(parseInt(data.val())-1);
        if(parseInt(data.val())==1){
        	$(this).siblings(".reduce_product").attr('disabled',true);
        }
    });
});



