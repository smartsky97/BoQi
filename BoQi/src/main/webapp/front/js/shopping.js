// JavaScript Document

function changeColor1(obj){
	obj.style.color='#F30';
}
function reColor1(obj){
	obj.style.color='#03F';
}
$(function(){
	var flag1=true;
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
	$('.top-lix').mouseover(function(){
		$('.top-lix').css('outline','1px solid #CCC');
		$('#toolbar-linjian').css('display','block');
	});
	$('.top-lix').mouseout(function(){
		$('.top-lix').css('outline','0px solid #CCC');
		$('#toolbar-linjian').css('display','none');
	});
    //第一个的伸缩点击
	$(".goodsCateSubTile").click(function(){	
		if(flag1){
			$(this).children('.goodsCateSub').css('display','none');
			$('#petDogfFoodimg').attr('src','shoppingimg/down-arrow.png');
			flag1=false;
		}else{
			$(this).children('.goodsCateSub').css('display','block');
			$('#petDogfFoodimg').attr('src','shoppingimg/up-arrow.png');
			flag1=true;
		}
	});
	//其他的伸缩点击
	$(".goodsCateList-lix").click(function(){	
		if($(this).children("div").css("display")=="block"){
			$(this).children('.goodsCateSub').css('display','none');
			$(this).children('h2').children('img').attr('src','shoppingimg/down-arrow.png');
		}else{
			$(this).children('.goodsCateSub').css('display','block');
			$(this).children('h2').children('img').attr('src','shoppingimg/up-arrow.png');
		}
	});
	
});

