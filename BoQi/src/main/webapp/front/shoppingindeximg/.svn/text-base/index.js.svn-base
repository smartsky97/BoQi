/*banner切换*/
if($('.banner_img').children().length > 1) {
	$(".banner_content").slide({
		effect:"leftLoop",
		titOnClassName:'current',
		titCell:".banner_num span",
		interTime:4000,
		delayTime:600
	});
}

$(".zx").slide({
	effect:"leftLoop",
	autoPlay:false,
	interTime:2500,
	delayTime:500
});

$('.dy_text').focus(function(){
	if(this.defaultValue==$(this).val()){
		$(this).val('');
	}
})
.blur(function(){
	var _t = $(this);
	if(_t.val()==''){
		_t.val(this.defaultValue).css('color','#ccc');
	}else{
		_t.css('color','#333');
	}
})
.keyup(function(){
    $(this).css('color','#333');
});

/*商品左侧banner切换*/
if($('.dog_l_img').children().length > 1) {
	$(".dog_l").slide({
		effect:"left",
		titOnClassName:'current',
		titCell:".dog_l_num span",
		interTime:2500,
		delayTime:500
	});
}

//换一批
function changeProduct(){
	var i = 0;
	var length = $('.hot_pro_b_body').length;
	$('#changeProduct').on('click',function(){
		i++;
		if(i>=length) i=0;
		$('.hot_pro_b_body').eq(i).siblings().fadeOut(function(){
			$('.hot_pro_b_body').eq(i).fadeIn();
		});
	});
}
changeProduct();
/*商品导航*/
$('.dog_nav').on('mouseover','a',function(){
	$(this).addClass('current').siblings().removeClass('current');
	var index = $(this).index();
	$(this).parents('.dog_top').next().find('.dog_c_t').hide().eq(index).show();
});

/*底部评价*/
if($('.ev_bot_auto').children().length > 1) {
	$(".ev_bot").slide({
		effect:"topLoop",
		scroll:1,
		vis:2,
		interTime:4000,
		delayTime:800
	});
}

// 邮件订阅
/*$('#SubscriptionButton').click(function(){
    var mail = $('#SubscriptionValue').val();
    if( ! boqii.validate.CheckMail(mail)){
        boqii.dialog.AlertDialog('请输入正确的电子邮件地址', null, true);
        return;
    }
    boqii.ajax.postJson(config.shopUrl + '/ajax.html?ctl=ajax&act=addSubscription', {
        'email' : mail
    }, function(data){
        $('#SubscriptionValue').val('请输入您的常用邮箱');
        boqii.dialog.AlertDialog(data.status ? '订阅成功' : data.message, null, true);
    }, function(msg){
        boqii.dialog.AlertDialog('订阅失败', null ,true);
    });
});*/
// $('#SubscriptionButton').click(function(){
//     var mail = $('#SubscriptionValue').val();
//     if( ! boqii.validate.CheckMail(mail)){
//         $('.dy_err').val('邮件格式不正确').fadeIn();
//         setTimeout(function(){ $('.dy_err').fadeOut(); },3000);
//         return;
//     }
//     boqii.ajax.postJson(config.shopUrl + '/ajax.html?ctl=ajax&act=addSubscription', {
//         'email' : mail
//     }, function(data){
//         $('#SubscriptionValue').val('请输入您的常用邮箱');
//         $('.dy_success').val('您已经订阅成功').fadeIn();
//         setTimeout(function(){ $('.dy_success').fadeOut(); },3000);
//     }, function(msg){
//         $('.dy_err').val('订阅失败').fadeIn();
//         setTimeout(function(){ $('.dy_err').fadeOut(); },3000);
//     });
// });

/**
 * 邮件订阅
 */
(function($) {
	// 弹出订阅弹窗
	$('#SubscriptionButton').live('click', function() {
		var email = checkEmail('#SubscriptionValue');
		var oError = $('#email-sub-error');

		if( email ) {
			$.ajax({
				type: 'GET',
				url: '/ajax.html?ctl=ajax&act=getSubscriptionInfo&email=' + email,
				dataType: 'json',
				success: function(res) {
					var st = res.status,
						msg = res.message,
						data = res.data;

					if(st === 1) {
						$('#SubscriptionValue').val('').blur();
						$('.email-sub-input[name="email"]').val(email);

						showDialog('#email-sub-dialog', function() {
							for(var key in data) {
								$('#subscription_' + key).html( data[key] );
							}
						});
						showDialog('#email-sub-mask');
						setCenter('#email-sub-mask', '#email-sub-dialog');
					} else {
						showDialog('#email-sub-mask');
						showDialog('#email-sub-faild', function(obj) {
							obj.addClass('emailSubBefore');
						});
						setCenter('#email-sub-mask', '#email-sub-faild');
						oError.html( msg );
					}
				},
				error: function() {
					showDialog('#email-sub-mask');
					showDialog('#email-sub-faild', function(obj) {
						obj.addClass('emailSubBefore');
					});
					setCenter('#email-sub-mask', '#email-sub-faild');
					oError.html('订阅失败');
				}
			});
		} else {
			showDialog('#email-sub-mask');
			showDialog('#email-sub-faild', function(obj) {
				obj.addClass('emailSubBefore');
			});		
			setCenter('#email-sub-mask', '#email-sub-faild');
			oError.html('邮箱填写错误，请您仔细填写');
		}

		return false;
	});

	// 提交所要订阅的内容
	$('#email-sub-dialog .email-sub-submit').on('click', function() {
		var user = $('.email-sub-input[name="user"]').val();
		var email = checkEmail('.email-sub-input[name="email"]');
		var aCheck = $('#petList input:checked');
		var len = aCheck.length;
		var sCate = '';
		var sPet = '';
		var oError = $('#email-sub-error');

		/**
		 * 数据验证失败
		 */
		if(email === '' || len < 1) {			
			setCenter('#email-sub-mask', '#email-sub-faild');
			hideDialog('#email-sub-dialog');
			showDialog('#email-sub-faild');
		}

		if(email === '') {
			oError.html('邮箱填写错误，请您仔细填写');
			return;
		} else if(len < 1) {
			oError.html('请选择您要订阅的资讯');
			return;
		}

		/**
		 * 数据验证成功
		 */
		aCheck.each(function(i){
			var petId = $(this).val();
			var petName = $(this).attr('data-name');

			sPet += '<strong>'+ petName +'</strong>';
			sCate += petId;

			if(i !== len - 1) {
				sPet += ' | ';
				sCate += ',';
			}
		});

		$.ajax({
			type: 'POST',
			url: '/ajax.html?ctl=ajax&act=addSubscription&email=电子邮件&nickname=昵称&cate=',
			data: {
				ctl: 'ajax',
				act: 'addSubscription',
				email: email,
				nickname: user,
				cate: sCate
			},
			dataType: 'json',
			success: function(res) {
				var st = res.status,
					msg = res.message,
					i = 3,
					timer = null;

				if(st === 1) {
					$('#petbox').html(sPet);
					$('.email-sub-input[name=user]').val('');
					$('.email-sub-oper input[type=checkbox]').attr('checked', false);
					setCenter('#email-sub-mask', '#email-sub-success');
					hideDialog('#email-sub-dialog');
					showDialog('#email-sub-success');

					clearInterval(timer);
					timer = setInterval(function() {
						i--;
						$('#email-sub-success .email-sub-tip').html(i + '秒将会自动关闭');

						if(i === 0) {
							hideDialog('#email-sub-success');
							hideMask();
							clearInterval(timer);
						}

					}, 1000);
				} else {
					showDialog('#email-sub-mask');
					showDialog('#email-sub-faild', function(obj) {
						obj.addClass('emailSubBefore');
					});
					setCenter('#email-sub-mask', '#email-sub-faild');
					oError.html( msg );
				}
			},
			error: function() {
				showDialog('#email-sub-mask');
				showDialog('#email-sub-faild', function(obj) {
					obj.addClass('emailSubBefore');
				});
				setCenter('#email-sub-mask', '#email-sub-faild');
				oError.html('订阅失败');
			}
		});
	});

	$('[ui-dialog-close]').live('click', function() {
		hideDialog('.email-sub-dialog');
		hideMask();
	});

	$('[ui-dialog-try]').live('click', function() {

		if($('#email-sub-faild').hasClass('emailSubBefore')) {
			hideDialog('#email-sub-faild');
			hideDialog('#email-sub-mask');
			$('#email-sub-faild').removeClass('emailSubBefore');
		} else {
			hideDialog('#email-sub-faild');
			showDialog('#email-sub-dialog');
			setCenter('#email-sub-mask', '#email-sub-dialog');
		}
		
	});

	$(window).on('resize', function() {
		setCenter('#email-sub-mask', '#email-sub-success');
	});

	function checkEmpty(obj, msg) {
		obj = typeof obj === 'string' ? $(obj) : obj;
		var val = obj.val();
			val = $.trim( val );

		if( val !== '' ) {
			return val;
		}

		return '';
	}

	function checkEmail(obj) {
		obj = typeof obj === 'string' ? $(obj) : obj;
		var val =checkEmpty(obj, '邮箱不能为空');
		var reg = /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i;

		if( val !== '' && reg.test( val )) {
			return val;
		}

		return '';
	}

	function showDialog(id, callback) {
		$(id).fadeIn(200);
		callback && callback( $(id) );
	}

	function hideDialog(id, callback) {
		$(id).fadeOut(200);
		callback && callback( $(id) );
	}

	function hideMask() {
		$('#email-sub-mask').fadeOut(200);
	}

	function setCenter(mask, dialog) {
		mask = typeof mask === 'string' ? $(mask) : mask;
		dialog = typeof dialog === 'string' ? $(dialog) : dialog;

		var page = {
			width: $(window).width() * 1,
			height: $(window).height() * 1
		};

		var outer = {
			width: dialog.outerWidth() * 1,
			height: dialog.outerHeight() * 1
		};

		var css = {
			width: dialog.width() * 1,
			minHeight: dialog.height() * 1,
			_height: dialog.height() * 1,
			left: Math.max( (page.width - outer.width) / 2 ),
			top: Math.max( (page.height - outer.height) / 2 )
		};

		mask.css( page );
		dialog.css( css );
	}
})(jQuery);
