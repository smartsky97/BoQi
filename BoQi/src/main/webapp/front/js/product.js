//JavaScript Document
 //商品数量的增加


//数量的改变
$(document).ready(function(){
    var data=$(".counts");
    $('.reduce').attr('disabled',true);
    //数量的增加
    $(".plus").click(function(){
        data.val(parseInt(data.val())+1);
        if(parseInt(data.val())!=1){
             $(".reduce").attr("disabled",false);
        }
    });
    //数量的减小
    $(".reduce").click(function(){
        data.val(parseInt(data.val())-1);
        if(parseInt(data.val())==1){
            $(".reduce").attr('disabled',true);
        }
    });
});


//加入购物车弹出提示框
/*$(document).ready(function(){
    $(".now").click(function(){

        var array = [];

        var _infoList = JSON.parse(localStorage.getItem('goods'));

        var _title = $('#_title').text();
        var _weight = $('#_weight').text();
        var _count = $('#_count').val();
        var _price = $('#_price').text();
        var _img = $('#_img').attr('src');

        var info = {'title':_title,'weight':_weight,'count':_count,'price':_price,'img':_img};
       
        
            
        // console.info(eval(arraystr))
            // console.info(infoList)
            // console.info(_infoList.infoList.length)

        if(_infoList != null){
            
            _infoList.goods.push(info);
            localStorage.clear();
            localStorage.setItem("goods",JSON.stringify(_infoList));
            // console.info(_infoList.infoList.length)
            $.each(_infoList.goods,function(i,info){
                console.info(info.title+','+info.weight+','+info.count+','+info.price+','+info.img);   
            })
        }else{
        
            array.push(info);
            var arraystr = '{"goods":'+JSON.stringify(array)+'}';
            localStorage.setItem("goods",arraystr);
        }

        // window.location.href = "shopcar.jsp";
        window.open("shopcar.jsp");

    // console.info(_title+','+_weight+','+_count+','+_price+','+_img);

          // window.open ("buy.html", "newwindow", "height=250, width=350, top=300, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no")&nbsp;
    });
});

 
*/

//客服
$(document).ready(function(){
    $(".kefu").click(function(){
          window.open ("page.html", "newwindow", "height=100, width=350, top=200, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
    });
    
    //加入购物车
    $(".input").click(function(){
          window.open ("buy.html", "newwindow", "height=250, width=350, top=300, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
    });
    
   
});


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
  
	var pics = new Array();
	
	var array = $(".hidePic").text().split(",");
	var str = "";
	var num = array.length;
	console.info(num);
	if(num>5){
		num=5;
	}
	console.info(array[0]);
	str+="<li id='onlickImg'><img id='_img' src='../upload/"+array[0]+"' width='44px' height='44px' alt='无图'/></li>";
	for(var i=1;i<num;i++){
		str+="<li><img src='../upload/"+array[i]+"' width='44px' height='44px' alt='pic"+i+"'/></li>";
	}
	$(".fivepic").append(str);
});

$(document).ready(function(){
	// 图片上下滚动
	var count = $("#imageMenu li").length - 4; /* 显示 6 个 li标签内容 */
	var interval = $("#imageMenu li:first").width();
	var curIndex = 0;
	
	
	$('.scrollbutton').click(function(){
		if( $(this).hasClass('disabled') )
            return false;
		
		if ($(this).hasClass('smallImgUp'))
            --curIndex;
		else 
            ++curIndex;
		$('.scrollbutton').removeClass('disabled');
		if (curIndex == 0) $('.smallImgUp').addClass('disabled');
		if (curIndex == count-1) $('.smallImgDown').addClass('disabled');
		$("#imageMenu ul").stop(false, true).animate({"marginLeft" : -curIndex*interval + "px"}, 400);
	});
	
	// 解决 ie6 select框 问题
	$.fn.decorateIframe = function(options) {
        if ($.browser.msie && $.browser.version < 7) {
            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
            $(this).each(function() {
                var $myThis = $(this);
                //创建一个IFRAME
                var divIframe = $("<iframe />");
                divIframe.attr("id", opts.iframeId);
                divIframe.css("position", "absolute");
                divIframe.css("display", "none");
                divIframe.css("display", "block");
                divIframe.css("z-index", opts.iframeZIndex);
                divIframe.css("border");
                divIframe.css("top", "0");
                divIframe.css("left", "0");
                if (opts.width == 0) {
                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                if (opts.height == 0) {
                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                divIframe.css("filter", "mask(color=#fff)");
                $myThis.append(divIframe);
            });
        }
    }
    $.fn.decorateIframe.defaults = {
        iframeId: "decorateIframe1",
        iframeZIndex: -1,
        width: 0,
        height: 0
    }
    //放大镜视窗
    $("#bigView").decorateIframe();

    //点击到中图
    var midChangeHandler = null;
	
    $("#imageMenu li img").bind("click", function(){
		if ($(this).attr("id") != "onlickImg") {
			midChange($(this).attr("src").replace("small", "mid"));
			$("#imageMenu li").removeAttr("id");
			$(this).parent().attr("id", "onlickImg");
		}
	}).bind("mouseover", function(){
		if ($(this).attr("id") != "onlickImg") {
			window.clearTimeout(midChangeHandler);
			midChange($(this).attr("src").replace("small", "mid"));
			$(this).css({ "border": "3px solid #959595" });
		}
	}).bind("mouseout", function(){
		if($(this).attr("id") != "onlickImg"){
			$(this).removeAttr("style");
			midChangeHandler = window.setTimeout(function(){
				midChange($("#onlickImg img").attr("src").replace("small", "mid"));
			}, 1000);
		}
	});

    function midChange(src) {
        $("#midimg").attr("src", src).load(function() {
            changeViewImg();
        });
    }

    //大视窗看图
    function mouseover(e) {
        if ($("#winSelector").css("display") == "none") {
            $("#winSelector,#bigView").show();
        }

        $("#winSelector").css(fixedPosition(e));
        e.stopPropagation();
    }


    function mouseOut(e) {
        if ($("#winSelector").css("display") != "none") {
            $("#winSelector,#bigView").hide();
        }
        e.stopPropagation();
    }


    $("#midimg").mouseover(mouseover); //中图事件
    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

    var $divWidth = $("#winSelector").width(); //选择器宽度
    var $divHeight = $("#winSelector").height(); //选择器高度
    var $imgWidth = $("#midimg").width(); //中图宽度
    var $imgHeight = $("#midimg").height(); //中图高度
    var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

    function changeViewImg() {
        $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));
    }

    changeViewImg();

    $("#bigView").scrollLeft(0).scrollTop(0);
    function fixedPosition(e) {
        if (e == null) {
            return;
        }
        var $imgLeft = $("#midimg").offset().left; //中图左边距
        var $imgTop = $("#midimg").offset().top; //中图上边距
        X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
        Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
        X = X < 0 ? 0 : X;
        Y = Y < 0 ? 0 : Y;
        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

        if ($viewImgWidth == null) {
            $viewImgWidth = $("#bigView img").outerWidth();
            $viewImgHeight = $("#bigView img").height();
            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                $viewImgWidth = $viewImgHeight = 800;
            }
            $height = $divHeight * $viewImgHeight / $imgHeight;
            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
            $("#bigView").height($height);
        }

        var scrollX = X * $viewImgWidth / $imgWidth;
        var scrollY = Y * $viewImgHeight / $imgHeight;
        $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });
        $("#bigView").css({ "top": 75, "left": $("#image").offset().left + $("#image").width() + 15 });

        return { left: X, top: Y };
    }

});



  //点击立即购买购物车
	/*function buy(){
	var proname='';
	var proweight='';
	var proprice=0;
	var procounts=0;
	var proxiaojie=0;
	//var money=0;
	
	var myshops=document.getElementById('introduct');
	var price=document.getElementByClassName('price');
	var down=document.getElementById('down');
	proname=myshops[d-1].getElementsByTagName('p')[0].innerHTML;
	proweight=myshops[d-1].getElementsByTagName('span')[0].innerHTML;
	_proweight=parseFloat(proweight.substring(1,proweight.length));
	proprice=price[d-1].getElementsByTagName('p')[0].innerHTML;
	_proprice=parseFloat(proprice.substring(1,proprice.length));
	procounts=down[d-1].getElementsByTagName('input')[1].val();
	proxiaojie=_proprice*procounts;
	money+=proprice;
	document.getElementByClassName('money').innerHTML=money;
	alert(money);


	//加入购物车
	var isSave;
	var goods=window.localStorage.getItem('goods'); 
	goods=JSON.parse(goods);	//取值
	if(goods!=null&&goods!="undefined"){
			var objs=goods.good;
			for(var i=0;i<objs.length;i++){
				isSave=false;
			}
			
			if(!isSave){
				objs[objs.length]={id:d,proname:proname,proweight:proweight,proprice:proprice,procounts:procounts,proxiaojie:proxiaojie,num:1};
			}
	}else{
		var goods={good:[{id:d,proname:proname,proweight:proweight,proprice:proprice,procounts:procounts,proxiaojie:proxiaojie,num:1}]}
	}
	goods=JSON.stringify(goods);
	window.localStorage.setItem('goods',goods);
	window.location.href="shopcar.jsp";
	}  */
	//加入购物车:点击加入购物车，获取当前商品id商品信息添加至数据库，同时，购物车从数据库读取数据，
	