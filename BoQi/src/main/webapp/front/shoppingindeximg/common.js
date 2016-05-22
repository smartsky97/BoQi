(function($){
	$.fn.keyWords = function(){
		this.focus(function(){
			if('请输入商品名称'==$(this).val()){
				$(this).val('');
			}
		})
		.blur(function(){
			var _t = $(this);
			if(_t.val()==''){
				_t.val('请输入商品名称').css('color','#ccc');
			}else{
				_t.css('color','#333');
			}
		})
    };
    $('#TopSearchWord').keyup(function(){
        $(this).css('color','#333');
    });
    /*toolbar*/
    
    $('.city').die().live({
        mouseover: function(){
            $(this).find('p').addClass('up');
            $(this).addClass('current').find('.city_select').show();
        },
        mouseout: function(){
            $(this).find('p').removeClass('up');
            $(this).removeClass('current').find('.city_select').hide();
        }
    });
    
    $('.r_menu').die().live({
        mouseover: function(){
           $(this).addClass('current').find('.r_select').show();
        },
        mouseout: function(){
           $(this).removeClass('current').find('.r_select').hide();
        }
    });
    $('.attent').die().live({
        mouseover: function(){
           $(this).addClass('current').find('.gz_select').show();
        },
        mouseout: function(){
            $(this).removeClass('current').find('.gz_select').hide();
        }
    });

    $('.tel').die().live({
        mouseover: function(){
            $(this).addClass('current').find('.tel_select').show();
        },
        mouseout: function(){
            $(this).removeClass('current').find('.tel_select').hide();
        }
    });
    /*左侧菜单*/
    $('.nav_left').hover(
        function(){
            $(this).siblings('#allClassify').show();
        },function(){
            $(this).siblings('#allClassify').hide();
        }
    );
    $('#allClassify').hover(
        function(){
            $(this).show();
        },function(){
            $(this).hide();
        }
    );
    $('.menu_list').hover(
        function(){
            $(this).find('.menu_list_l').addClass('current').next().show();
        },function(){
            $(this).find('.menu_list_l').removeClass('current').next().hide();
        }
    );
    /* 图片异步加载 */
    (function () {
        var point = function(obj){
            var _t = 0;
            var _o = $(obj);
            if(_o.length==0) return _t;
            while(true){
                if(_o.hasClass('toplazy') || _o.is('body')){
                    break;
                }
                _t = _o.offset().top;
                _o = _o.parent();
            }
            return _t;
        };
        // 缓存图片位置
        $('img[data-original]').each(function(){
            var _this = $(this);
            _this.attr('y', point(_this));
        });
        // 缓存异步图片列表
        $(window).scroll(function(){
            var imgs = $('img[data-original]');
            if(imgs.length==0) return;
            // 获取当前窗口高度
            var winTop = $(window).scrollTop() + $(window).height();
            imgs.each(function(){
                var _this = $(this);
                var _y = $(this).attr('y');
                if(_y==undefined || _y<=winTop){
                    var _src = _this.attr('data-original');
                    _this.attr('src', _src).removeAttr('data-original').removeAttr('y');
                }
            });
        }).trigger('scroll');
    })();
    /* 加入收藏夹 */
    $('#AddFavorite').click(function(){
        try{
            window.external.addFavorite(window.location.href, document.title);
        }catch(e){
            try{
                window.sidebar.addPanel(document.title, window.location.href, '');
            }catch(e){
                alert("加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    });
    /* 设置城市 */
    window.GetCity = function(){
        var cityId = $.cookie("cityId");
        var cityName = $.cookie("cityName");
        if(cityId && cityName){
            $('#TopCityInfo').attr('cityid', cityId).html(cityName);
            $('#ProCityInfo').attr('cityid', cityId).html(cityName);

            $('.ICityList').find('a.current').removeClass('current');
            $('#p_'+cityId).addClass('current');
        }else{
            boqii.ajax.getJsonp(config.shopUrl + '/ajax.html?ctl=citySelect&act=getCity', function(data){
                data = boqii.base64.decode(data);
                if(boqii.utils.IsNotEmpty(data)) data = $.parseJSON(data);
                if(boqii.utils.IsNull(data)) return;
                $('#TopCityInfo').attr('cityid', data.cityId).html(data.cityName);
                $('#ProCityInfo').attr('cityid', data.cityId).html(data.cityName);

                $('.ICityList').find('a.current').removeClass('current');
                $('#p_'+data.cityId).addClass('current');

                $.cookie('cityName', data.cityName, {expires:1, path:'/'});
            });
        }
    };
    window.SetCity = function(cityId){
        if(cityId == $.cookie("cityId")){
            $('.city').trigger('mouseout');
            return;
        }
        boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=citySelect&act=setCity',{
            'cityId' : cityId
        }, function(data){
            // 隐藏顶部
            $('.city').trigger('mouseout');
            data = boqii.base64.decode(data);
            if(boqii.utils.IsNull(data)) return;
            if(data=='1'){
                var pn = window.location.pathname.toLowerCase();
                if(pn=='/cart.html' || pn=='/checkin.html' || pn=='/checkout.html' || /^\/[0-9]+-order\.html$/.test(pn)){
                    $.cookie("cityId", null, {expires:-1, path:'/'});
                    $.cookie("cityName", null, {expires:-1, path:'/'});
                    window.location.reload();
                    return;
                }
                $.cookie("cityId", null, {expires:-1, path:'/'});
                $.cookie("cityName", null, {expires:-1, path:'/'});
                GetCity();
            }else{
                AlertDialog('城市设置出错', null);
            }
        }, function(){
            AlertDialog('设置城市出错', null);
        });
    };
    GetCity();
    /* 用户登录信息 */
    boqii.ajax.getJsonp(config.shopUrl + '/ajax.html?ctl=ajax&act=getTopUserInfo', function(data){
        data = boqii.base64.decode(data);
        $(data).insertBefore($('#TopUserInfo').find('li:eq(0)'));
        $('.r_login').die().live({
            mouseover: function(){
                $(this).find('p').addClass('up');
                $(this).addClass('current').find('.r_l_select').show();
            },
            mouseout: function(){
                $(this).find('p').removeClass('up');
                $(this).removeClass('current').find('.r_l_select').hide();
            }
        });
    });
    /* 搜索 */
    $('#TopSearchWord').keyWords();
    if($('#TopSearchWord').val()!='请输入商品名称'){
        $('#TopSearchWord').css('color','#000');
    }
    if($('#TopSearchForm').length>0){
        // 关键词提示
        boqii.tool.SuggestInit('#TopSearchWord', {
            'left' : -1,
            'top' : 1
        });
        // 搜索提交
        boqii.tool.SubmitInit('#TopSearchForm', '#TopSearchWord', {});
    }
    window.CloseAlert = function(animate){
        if(animate){
            $('.IAlertMask').animate({
                'opacity':0
            }, 300, function(){
                $('.IAlertMask').hide();
            });
            $('.IAlertDialog').animate({
                'margin-top' : '-150px'
            }, 300, function(){
                $('.IAlertDialog').hide();
            });
        }else{
            $('.IAlertMask').css('opacity', 0).hide();
            $('.IAlertDialog').css('margin-top', '-150px').hide();
        }
    }
    window.AlertDialog = function(msg, fn,flag){
        var scrollTop = $(window).scrollTop();
        if($('.IAlertMask').length==0){
            $('<div class="IAlertMask mask"></div>').appendTo($(document.body));
        }
        $('.IAlertDialog').remove();
        if($('.IAlertDialog').length==0){
            var html = "";
                html += '<div class="IAlertDialog model_dialog order_detail_dialog warn_dialog"><h1 class="model_dialog_title">提示<a href="javascript:;" class="IDialogClose icons icon_close"></a></h1><div class="IDialogText model_dialog_body"><span></span>';

                if( flag === "addCart" ){
                    html += '<p class="go_url_operation"><a href="'+ config.shopUrl +'/cart.html" class="myFav">查看购物车</a></p></div><div class="auto_close">3秒钟后自动关闭</div>';
                }
                if( flag === "fav" ){
                    html += '<p class="go_url_operation"><a href="' + config.siteUrl + '/userinfo/Product/favorite" class="myFav">查看我的收藏</a></p></div><div class="auto_close">3秒钟后自动关闭</div>';
                }

                html += "</div>";

            $(html).appendTo($(document.body));
        }
        // 内容填充
        $('.IAlertDialog').find('.IDialogText span').html(msg);
        // 事件绑定
        $('.IAlertDialog').find('.IDialogClose').off('click').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            CloseAlert(1);
            if($.isFunction(fn)){
                fn();
            }
        });
        $('.IAlertMask').show().animate({
            'opacity' : 0.3
        }, 300, function(){
            $('.IAlertDialog').show().animate({
                'margin-top' : scrollTop-150
            }, 300);
        });

        if(window.alertTimer){
            clearTimeout(alertTimer);
        }
        window.alertTimer = setTimeout(function(){
            CloseAlert(1);
            if($.isFunction(fn)){
                fn();
            }
        },3000);


        $(".IAlertDialog").on("click",".lookMyFav",function(){

            window.location.href = config.siteUrl+'/userinfo/Product/favorite';

        });

    }
    window.CloseConfirm = function(animate){
        if(animate){
            $('.IConfirmMask').animate({
                'opacity':0
            }, 300, function(){
                $('.IConfirmMask').hide();
            });
            $('.IConfirmDialog').animate({
                'margin-top' : '-150px'
            }, 300, function(){
                $('.IConfirmDialog').hide();
            });
        }else{
            $('.IConfirmMask').css('opacity', 0).hide();
            $('.IConfirmDialog').css('margin-top', '-150px').hide();
        }
    }
    window.ConfirmDialog = function(msg, okFn, noFn){
        if($('.IConfirmMask').length==0){
            $('<div class="IConfirmMask mask"></div>').appendTo($(document.body));
        }
        if($('.IConfirmDialog').length==0){
            var html = '<div class="IConfirmDialog model_dialog order_detail_dialog warn_dialog"><h1 class="model_dialog_title">提示<a href="javascript:;" class="IDialogClose icons icon_close"></a></h1><div class="IDialogText model_dialog_body"></div><div class="model_dialog_footer"><a href="javascript:;" class="IDialogOk btn primary_btn">确定</a><a href="javascript:;" class="IDialogClose btn common_btn cancel_btn">取消</a></div></div>';
            $(html).appendTo($(document.body));
        }
        // 内容填充
        $('.IConfirmDialog').find('.IDialogText').html(msg);
        // 事件绑定
        $('.IConfirmDialog').find('.IDialogClose').off('click').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            CloseConfirm(1);
            if($.isFunction(noFn)){
                noFn();
            }
        });
        $('.IConfirmDialog').find('.IDialogOk').off('click').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            CloseConfirm(1);
            if($.isFunction(okFn)){
                okFn();
            }
        });

        var scrollTop = $(window).scrollTop();

        $('.IConfirmMask').show().animate({
            'opacity' : 0.3
        }, 300, function(){
            $('.IConfirmDialog').show().animate({
                'margin-top' : scrollTop-150
            }, 300);
        });
    }
    // 登录注册
    if($('.ILoginDialog').length>0){
        var scrollTop = $(window).scrollTop();
        $('.ILoginClose').off('click').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            $(".mask").animate({
                "opacity":0
            },300,function(){
                $(".mask").hide();
            });
            $(".user_dialog").animate({
                'margin-top':scrollTop-150
            },300,function(){
                $(".user_dialog").hide();
            });
        });
        $('.ILoginCode').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            var url = config.siteUrl+'/user/images/vcode/vcode.php?rid='+Math.random();
            $(this).find('img').attr('src', url);
        });
        $('.IRegCode').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            var url = config.siteUrl+'/user/images/vcode/vcode.php?rid='+Math.random();
            $(this).find('img').attr('src', url);
        });
        $('.ILoginDialog').find('input[name="register_type"]').change(function(e){
            var val = $(this).val();
            $('.ILoginFormB').find('input[name="mobile"]').val('');
            $('.ILoginFormB').find('input[name="email"]').val('');
            $('.ILoginFormB').find('input[name="password"]').val('');
            $('.ILoginFormB').find('input[name="password2"]').val('');
            $('.ILoginFormB').find('input[name="code"]').val('');
            $('.ILoginFormB').find('input[name="smscode"]').val('');
            $('.IRegCode').trigger('click');
            if(val==2){
                $('.mobile_reg').hide();
                $('.email_reg').show();
            }else{
                $('.mobile_reg').show();
                $('.email_reg').hide();
            }
        });
        $('.ILoginTab').find('li').click(function(){
            var index = $(this).index();
            $('.ILoginTab').find('li').removeClass('active');
            $(this).addClass('active');
            if(index==0){
                $('.ILoginCode').trigger('click');
                $('.login_container').show();
                $('.register_container').hide();
            }else{
                $('.ILoginDialog').find('input[name="register_type"]:eq(0)').trigger('click').trigger('change');
                $('.login_container').hide();
                $('.register_container').show();
            }

            //var url = config.siteUrl+'/user/images/vcode/vcode.php?rid='+Math.random();
            //$(this).parent().siblings('.ILoginFormB').find('.IRegCode img').attr('src', url);
        });
        //验证登录输入框
        $(".mobile_validate").blur(function(){
            var mobile = $(this).val();
            var pattern= /^((\+?86)|(\(\+86\)))?1\d{10}$/;
            if (!pattern.test(mobile)){
                $(".mobile_reg").addClass("error");
                $('.IRegNotice').find('.error_tips').html('请输入正确的11位手机号');
                $('.IRegNotice').show();
            }else{
                $(".mobile_reg").removeClass("error").addClass("ok");
                $('.IRegNotice').hide();
            }
        });
        $(".email_validate").blur(function(){
            var email = $(this).val();
            var pattern = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
            if( !pattern.test(email) ){
                $(".email_reg").addClass("error");
                $('.IRegNotice').find('.error_tips').html('邮箱格式不正确');
                $('.IRegNotice').show();
            }else{
                $(".email_reg").removeClass("error").addClass("ok");
                $('.IRegNotice').hide();
            }
        });
        $(".password_validate").blur(function(){
            var pwd = $(this).val();
            var pattern = /^[\w.]{6,20}$/;
            if( !pattern.test(pwd) ){
                $(".pwd_reg").addClass("error");
                $('.IRegNotice').find('.error_tips').html('密码长度只能在6-20位字符之间');
                $('.IRegNotice').show();
            }else{
                $(".pwd_reg").removeClass("error").addClass("ok");
                $('.IRegNotice').hide();
            }
        });
        $(".compassword_validate").blur(function(){
            var compwd = $(this).val();
            var pwd = $(".password_validate").val();
            if( compwd != pwd ){
                $(".compwd_reg").addClass("error");
                $('.IRegNotice').find('.error_tips').html('两次密码输入不一样');
                $('.IRegNotice').show();
            }else{
                $(".compwd_reg").removeClass("error").addClass("ok");
                $('.IRegNotice').hide();
            }
        });
        $('.IGetSmsCode').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            if($(this).hasClass('event-disabled')) return;
            $(this).addClass('event-disabled');
            $('.IRegNotice').find('.error_tips').html('');
            $('.IRegNotice').hide();
            var code = $('.ILoginFormB').find('input[name="code"]').val();
            if(code==''){
                $('.IRegNotice').find('.error_tips').html('请输入随机验证码');
                $('.IRegNotice').show();
                $('.IGetSmsCode').removeClass('event-disabled');
                return;
            }
            var mobile = $('.ILoginFormB').find('input[name="mobile"]').val();
            if(mobile==''){
                $('.IRegNotice').find('.error_tips').html('请输入手机号码');
                $('.IRegNotice').show();
                $('.IGetSmsCode').removeClass('event-disabled');
                return;
            }
            // 发短信
            boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=ajax&act=registerSms',{
                'mobile' : mobile,
                'code'   : code
            },function (ret){
                $('.IRegCode').trigger('click');
                if(ret.status==-1){
                    $('.IRegNotice').find('.error_tips').html(ret.message);
                    $('.IRegNotice').show();
                    $('.IGetSmsCode').removeClass('event-disabled');
                    return;
                }
                // 成功
                $('.IGetSmsCode').html('120秒后重新发送');
                var time = 120;
                var timeId = window.setInterval(function(){
                    time = time - 1;
                    if(time<0){
                        window.clearInterval(timeId);
                        $('.IGetSmsCode').html('获取短信验证码').removeClass('event-disabled');
                        return;
                    }
                    $('.IGetSmsCode').html(time+'秒后重新发送');
                }, 1000);
            }, function(err){
                $('.IRegNotice').find('.error_tips').html('短信发送失败,请重新操作');
                $('.IRegNotice').show();
                $('.IGetSmsCode').removeClass('event-disabled');
                return;
            });
        });

        $(document).on("keydown",function(e){
            var oevent = e || window.event;

            if( e.keyCode == 13 ){
                if($(".ILoginTab li.active").index() == 0){
                    $('.ILoginSubmit').trigger("click")
                }else{
                    $(".IRegSubmit").trigger("click");
                }
            }
        });
        // 登录
        $('.ILoginSubmit').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            if($(this).hasClass('event-disabled')) return;
            $(this).addClass('event-disabled');
            $('.ILoginNotice').html('').hide();
            var form = $('.ILoginFormA');
            var username = form.find('input[name="username"]').val();
            var password = form.find('input[name="password"]').val();
            var autologin = form.find('input[name="autologin"]').is(':checked') ? 1 : 0;
            var code = form.find('input[name="code"]').val();
            if(username==''){
                $('.ILoginNotice').html('用户名不能为空').show();
                $('.ILoginSubmit').removeClass('event-disabled');
                return;
            }
            if(password==''){
                $('.ILoginNotice').html('密码不能为空').show();
                $('.ILoginSubmit').removeClass('event-disabled');
                return;
            }
            if(code==''){
                $('.ILoginNotice').html('验证码不能为空').show();
                $('.ILoginSubmit').removeClass('event-disabled');
                return;
            }
            $('.ILoginNotice').html('正在登陆...').show();
            boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=ajax&act=cartLogin',{
                'username' : username,
                'password' : password,
                'code' : code
            },function (ret){
                if(ret.status==-1){
                    $('.ILoginNotice').html(ret.message).show();
                    $('.ILoginSubmit').removeClass('event-disabled');
                    return;
                }
                $('.ILoginNotice').html('登录成功,正在操作...').show();
                var url = config.siteUrl+'/user/setcookie.php?action=' + ret.data.action + '&uid=' + ret.data.uid + '&username=' + ret.data.username + '&pwd=' + ret.data.pwd + '&remember=' + autologin;
                $('#ifr').attr('src', '').attr('src', url);
                window.setTimeout(function(){
                    window.location.reload();
                }, 500);
            });
        });
        // 注册
        $('.IRegSubmit').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            if($(this).hasClass('event-disabled')) return;
            $(this).addClass('event-disabled');
            $('.IRegNotice').find('.error_tips').html('');
            $('.IRegNotice').hide();
            var form = $('.ILoginFormB');
            var type = form.find('input[name="register_type"]:checked').val();
            if(type==undefined){
                $('.IRegNotice').find('.error_tips').html('请选择注册类型');
                $('.IRegNotice').show();
                $('.IRegSubmit').removeClass('event-disabled');
                return;
            }
            var username = '';
            var password = '';
            var password2 = '';
            var code = '';
            var imgcode = '';
            if(type==1){
                username = form.find('input[name="mobile"]').val();
                if(username==''){
                    $('.IRegNotice').find('.error_tips').html('请输入手机号码');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                password = form.find('input[name="password"]').val();
                password2 = form.find('input[name="password2"]').val();
                if(password==''){
                    $('.IRegNotice').find('.error_tips').html('请输入登陆密码');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                if(password!=password2){
                    $('.IRegNotice').find('.error_tips').html('重复登陆密码不一致');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                imgCode = form.find('input[name="code"]').val();
                if(boqii.utils.IsEmpty(imgCode)){
                    $('.IRegNotice').find('.error_tips').html('请输入随机验证码');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                code = form.find('input[name="smscode"]').val();
                if(boqii.utils.IsEmpty(code)){
                    $('.IRegNotice').find('.error_tips').html('请输入短信验证码');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
            }else if(type==2){
                username = form.find('input[name="email"]').val();
                if(username==''){
                    $('.IRegNotice').find('.error_tips').html('请输入邮箱地址');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                password = form.find('input[name="password"]').val();
                password2 = form.find('input[name="password2"]').val();
                if(password==''){
                    $('.IRegNotice').find('.error_tips').html('请输入登陆密码');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                if(password!=password2){
                    $('.IRegNotice').find('.error_tips').html('重复登陆密码不一致');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                code = form.find('input[name="code"]').val();
                if(boqii.utils.IsEmpty(code)){
                    $('.IRegNotice').find('.error_tips').html('请输入随机验证码');
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
            }else{
                $('.IRegNotice').find('.error_tips').html('请选择注册类型');
                $('.IRegNotice').show();
                $('.IRegSubmit').removeClass('event-disabled');
                return;
            }
            $('.IRegNotice').find('.error_tips').html('正在注册...');
            $('.IRegNotice').show();
            var autologin = 0;
            boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=ajax&act=cartRegister',{
                'username' : username,
                'password' : password,
                'code' : code,
                'type' : type,
                'imgCode' : imgCode
            },function (ret){
                if(ret.status==-1){
                    $('.IRegNotice').find('.error_tips').html(ret.message);
                    $('.IRegNotice').show();
                    $('.IRegSubmit').removeClass('event-disabled');
                    return;
                }
                $('.IRegNotice').find('.error_tips').html('注册成功,正在操作...');
                $('.IRegNotice').show();
                var url = config.siteUrl+'/user/setcookie.php?action=' + ret.data.action + '&uid=' + ret.data.uid + '&username=' + ret.data.username + '&pwd=' + ret.data.pwd + '&remember=' + autologin;
                $('#ifr').attr('src', '').attr('src', url);
                mediav_mvp(username, function(){
                    window.location.reload();
                });
                // window.setTimeout(function(){
                //     window.location.reload();
                // }, 500);
            }, function(err){
                $('.IRegNotice').find('.error_tips').html('用户注册失败,请尝试重新注册');
                $('.IRegNotice').show();
                $('.IRegSubmit').removeClass('event-disabled');
            });
        });
        window.ShowLoginDialog = function(){
            var scrollTop = $(window).scrollTop();
            $('.ILoginTab').find('li:eq(0)').trigger('click');
            if($('.mask').length==0){
                $('<div class="mask"></div>').appendTo($(document.body));
            }

            $(".mask").show().animate({
                "opacity":0.3
            },300,function(){
                $(".user_dialog").show().animate({
                    "margin-top":scrollTop-234
                },300);
            });
        }
    }
})(jQuery);
jQuery(function($){
    /* 异步加载iframe */
    $('iframe.ifr-lazy-load').each(function(){
        var _this = $(this);
        var src = _this.attr('lazysrc');
        if(src){
            _this.attr('src', src);
        }
        _this.removeAttr('lazysrc');
    });
});
// 加入购物车
if(typeof boqii.cart == 'undefined'){
    boqii.cart = {};
}
boqii.cart.AddCart = function(id, attr, num, otype, code, fn){
    boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=addCart',{
        'id' : id,
        'attr' : attr,
        'buynum' : num,
        'otype' : otype,
        'code' : code
    },function(ret){
        if(ret.status==-1){
            if(boqii.utils.IsFunction(fn)){
                if(boqii.utils.IsEmpty(ret.message)) ret.message = '商品添加购物车失败';
                fn(ret.message);
            }
            return;
        }
        if(boqii.utils.IsFunction(fn)){
            fn('');
        }
    }, function(err){
        fn('商品添加购物车失败');
    });
};
/**
 * 移动商品图片到购物车动画
 * @param imgUrl
 * @param w
 * @param h
 * @param left
 * @param top
 * @param fn
 * @constructor
 */
function MoveToCart(imgUrl, w, h, left, top, fn){
    var destLeft = $('.ISlideCartIcon').offset().left - w + 30;
    var destTop = $('.ISlideCartIcon').offset().top;
    var html = $('<div style="display:block;width:'+w+'px;height:'+h+'px;border:1px #CCC solid;position:absolute;left:'+left+'px;top:'+top+'px;z-index:99999;"><img src="'+imgUrl+'" width="'+w+'" height="'+h+'" /></div>');
    html.appendTo($(document.body));
    // 移动图片
    html.animate({
        'top' : destTop+'px'
    }, 500, function(){
        html.animate({
            'left' : destLeft+'px'
        }, 1000, function(){
            html.animate({
                'opacity' : 0
            }, 100, function(){
                html.remove();
                if($.isFunction(fn)){
                    fn();
                }
            });
        });
    });
}

// DSP 注册跟踪需求
function mediav_mvp(userId, complete) {
    var image = new Image();

    image.onload = mvp_cp;

    image.onerror = mvp_cp;

    image.src = 'http://mvp.mediav.com/t?type=3&db=none&jzqv=3&qzjpt=registered&jzqs=m-20896-0&jzqt=tran&jzqo='+ userId +'&jzqot=0&jzqo4=0';

    function mvp_cp() {
        complete && typeof complete === 'function' && complete();
    }
}