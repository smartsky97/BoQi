// JavaScript Document
charset='uft-8';
$(function(){
			$('.changepic_sm').slides({  //<!--相框的总ID-->
				preload: true,    //<!--当参数设置为 true 的时候，表示在加载相册中照片的过程中显示 加载图片，设置为false的时候则表示不显示  加载图片-->
				preloadImage: 'images/loading.gif',   //<!--这个属性一般跟上一个 preload(boolean) 一起使用，string内的值表示需要显示的 加载图片 的 路径地址-->
				play: 5000,
				pause: 2500,
				hoverPause: true,
				animationStart: function(current){
					$('.caption').animate({
						bottom:-35,
						opacity: 'show'
					},100);
					$('.slide img').fadeIn('normal');
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationStart on slide: ', current);
					};
				},
				animationComplete: function(current){
					$('.caption').animate({
						bottom:0
					},200);
					$('.slide img').fadeIn('normal');
					if (window.console && console.log) {
						// example return of current slide number
						console.log('animationComplete on slide: ', current);
					};
				},
				slidesLoaded: function() {
					$('.caption').animate({
						bottom:0
					},200);
					$('.slide img').fadeIn('normal');
				}
			});
			},
	$('.showColor').css('background','#e53'),
	show(),
	showGoodsInfo()
);

//把要显示的数据放到相应的位置
function showGoodsInfo(){
	$.post("productinfo_GetTop8.action", function(data){
		for(var i = 0; i < data.length; i++)
		{
			$("#"+data[i].fid).append("<dl class='dog_r_shopping1 left'>" +
					"<dt><a class='thing_pic' target='_blank' href=' '><img src=' ' alt='商品图片'></a></dt>" +
					"<dd><a class='thing_name' target='_blank' href=' '>"+data[i].proname+"</a></dd>" +
					"<dd>" +
					"<span class='thing_pri left'>¥ "+data[i].bqpri+"</span>" +
					"<span class=' thing_num right'>已售"+data[i].prosales+"</span>" +
					"</dd></dl>");
		}
	}, 'json');
}


//没有显示的一部分的效果
function show(){
	$('.con').hover(//一个是鼠标放在上面的时候，一个是鼠标一开的时候的触发事件
		function(){
		},
		function(){
			$('.in_list').hover(//一个是鼠标放在上面的时候，一个是鼠标一开的时候的触发事件
				function(){
					$(this).children('.in_list_1').attr({class:'current in_list_1'});
					$(this).children('.current').children('.show_tit').children('span').css('background','white');
					$(this).children('.con').attr("style","display:block");
				},
				function(){
					$(this).children('.current').attr({class:'in_list_1'});	
					$(this).children('.in_list_1').children('.show_tit').children('span').css('background','./images/2015-11-18_200604.png');		
					$(this).children('.con').attr("style","display:none");
				}
			);
		}
	);
	//可以显示的一部分的效果
	$('.in_list').hover(//一个是鼠标放在上面的时候，一个是鼠标一开的时候的触发事件
		function(){
			$(this).children('.in_list_1').attr({class:'current in_list_1'});
			$(this).children('.current').children('.show_tit span').css('background','white');
			$(this).children('.con').attr("style","display:block");
		},
		function(){
			$(this).children('.current').attr({class:'in_list_1'});	
			$(this).children('.in_list_1').children('.show_tit span').css('background','./images/2015-11-18_200604.png');		
			$(this).children('.con').attr("style","display:none");
		}
	);
	//小标题的背景的平颜色
	$('.dog_nav').children().hover(
		function(){
			$(this).parent().children().css('color','#333');
			$(this).parent().children().css('background','url(images/2015-11-21_091608.png) no-repeat right 8px');	
			$(this).css('background','#e53');
			$(this).css('color','#FFF');
			var len=$(this).parent().parent().parent().children('.dogShow').children('.dog_r').children('.dog_r_up').children('div').length;
			var tt;
			for(var i=0;i<len;i++){
				tt=$(this).parent().parent().parent().children('.dogShow').children('.dog_r').children('.dog_r_up').children('div').get(i).getAttribute('name');
				//下面的内容的商品介绍的切换
				if(this.name==tt){
					$(this).parent().parent().parent().children('.dogShow').children('.dog_r').children('.dog_r_up').children('div').eq(i).css('display','block');
				}else{
					$(this).parent().parent().parent().children('.dogShow').children('.dog_r').children('.dog_r_up').children('div').eq(i).css('display','none');
				}
			}
		},
		function(){
			
		}
	);
	//图片轮播的功能
		/*$(".current1").mouseover(function(){
			//$(".changepic_sm").children().css("display","none");
			$(".changepic_sm").children().fadeOut(3000);
			$(".diandian").children().css("background","white");
			$(".diandian").children().css("color","black");
			//$(".pic1").css("display","block");
			$(".pic1").fadeIn("slow");
			$(".current1").css("background","#e53");
			$(".current1").css("color","white");
		});
		$(".current2").mouseover(function(){
			//$(".changepic_sm").children('a').css("display","none");//所有的背景为空
			$(".changepic_sm").children().fadeOut(3000);
			$(".diandian").children().css("background","white");//所有的背景为白
			$(".diandian").children().css("color","black");//所有的字体颜色为黑
			//$(".pic2").css("display","block");//当前样式为显示
			$(".pic2").fadeIn("slow");
			$(".current2").css("background","#e53");//当前背景为橘红
			$(".current2").css("color","white");//当前字体颜色为白
		});
		$(".current3").mouseover(function(){
			//$(".changepic_sm").children().css("display","none");
			$(".changepic_sm").children().fadeOut(3000);
			$(".diandian").children().css("background","white");
			$(".diandian").children().css("color","black");
			//$(".pic3").css("display","block");
			$(".pic3").fadeIn("slow");
			$(".current3").css("background","#e53");
			$(".current3").css("color","white");
		});
		$(".current4").mouseover(function(){
			//$(".changepic_sm").children().css("display","none");
			$(".changepic_sm").children().fadeOut(3000);
			$(".diandian").children().css("background","white");
			$(".diandian").children().css("color","black");
			//$(".pic4").css("display","block");
			$(".pic4").fadeIn("slow");
			$(".current4").css("background","#e53");
			$(".current4").css("color","white");
		});*/
	
	

}