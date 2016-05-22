/**
 * Created by fanghui on 2015/4/7.
 */
//消息显示更多
function getmore(obj){
    $(obj).hide().parent().prev().css('height','100%');
}

jQuery(function($){
    // 购物车相关处理函数
    var toFixed = function(val){
        if(val==undefined || val==null) return '0.00';
        val = new Number(val);
        if(isNaN(val)) return '0.00';
        return val.toFixed(2);
    };
    var ParseKey = function(key){
        if(boqii.utils.IsEmpty(key)) return null;
        key = key.split('_');
        if(key.length!=7) return null;
        return {'pid' : key[1], 'attr' : key[2], 'otype' : key[3], 'cashid' : key[4], 'prizeid' : key[5], 'activeid' : key[6]};
    };
    var DeleteCart = function(key, fn){
        var data = ParseKey(key);
        if(data==null){
            AlertDialog('无效商品', null);
            return;
        }
        boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=deleteCartProduct',data,function(ret){
            if(ret.status==-1){
                AlertDialog(ret.message, null);
                return;
            }
            if($.isFunction(fn)){
                fn();
            }
        }, function(err){
            AlertDialog('购物车商品删除失败', null);
        });
    };
    // 加载购物车
    window.LoadSlideCart = function(){
        // 调用相关数据
        $('<p class="loading_rightBar">正在载入...</p>').appendTo($('.ISlideCartInfo'));
        boqii.ajax.post(config.shopUrl+'/ajax.html?ctl=slide&act=cart', {}, function(ret){
            $('.ISlideCartInfo').html(ret);
            // 绑定事件
            var num = boqii.utils.ToInt($('.ISlideCartNumField').val());
            $('.ITopCartNum').html(num);
            $('.ISlideCartNum').html(num>99?'99+':num);
            // 全选
            $('.ISlideCartCheckAll').off('change').change(function(e){
                e.stopPropagation();
                e.preventDefault();
                var checked = $(this).is(':checked') ? 1 : 0;
                var data = {};
                data.checked = checked;
                boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=selectAllCartProduct', data, function (ret) {
                    if (ret.status == -1) {
                        AlertDialog(ret.message, null);
                        if(checked){
                            $('.ISlideCartCheckAll').removeAttr('checked');
                        }else{
                            $('.ISlideCartCheckAll').attr('checked', 'checked');
                        }
                        return;
                    }
                    LoadSlideCart();
                }, function (err) {
                    if(checked){
                        $('.ISlideCartCheckAll').removeAttr('checked');
                    }else{
                        $('.ISlideCartCheckAll').attr('checked', 'checked');
                    }
                    AlertDialog('购物车商品选择失败', null);
                });
            });
            // 单品选中取消
            $('.ISlideCartGoodsItem').change(function(e){
                e.stopPropagation();
                e.preventDefault();
                var checked = $(this).is(':checked') ? 1 : 0;
                var key = $(this).parent().parent().parent().attr('id');
                var data = ParseKey(key);
                if(data==null){
                    AlertDialog('无效商品', null);
                    return;
                }
                var _this = $(this);
                data.checked = checked;
                boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=selectCartProduct',data,function(ret){
                    if(ret.status==-1){
                        if(checked){
                            _this.removeAttr('checked');
                        }else{
                            _this.attr('checked', 'checked');
                        }
                        AlertDialog(ret.message, null);
                        return;
                    }
                    LoadSlideCart();
                }, function(err){
                    if(checked){
                        _this.removeAttr('checked');
                    }else{
                        _this.attr('checked', 'checked');
                    }
                    AlertDialog('购物车商品选择失败', null);
                });
            });
            // 商品删除
            $('.ISlideCartGoodsRemove').click(function(e){
                e.stopPropagation();
                e.preventDefault();
                var key = $(this).parent().parent().parent().parent().attr('id');
                // 弹出对话框
                ConfirmDialog('请确认是否删除商品?', function(){
                    // 请求
                    DeleteCart(key, function(){
                        LoadSlideCart();
                    });
                }, null);
            });
            // 换购商品删除
            $('.ISlideCartBarterRemove').click(function(e){
                e.stopPropagation();
                e.preventDefault();
                var key = $(this).parent().parent().parent().parent().attr('id');
                // 弹出对话框
                ConfirmDialog('请确认是否删除换购商品?', function(){
                    // 请求
                    DeleteCart(key, function(){
                        LoadSlideCart();
                    });
                }, null);
            });
        }, function(err){
            AlertDialog('网络请求失败,请刷新页面后重新尝试', null);
        });
    };
    // 读取用户信息
    if($('.ISlide').length>0){
        boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=slide&act=getUserInfo', {}, function(ret){
            if(ret.status==-2){
                $('.ISlide').attr('login', 0);
                $('.ISlideCartNum').html(0);
                $('.ITopCartNum').html(0);
                $('.ISlide').show();
                return;
            }
            if(ret.status==-1){
                return;
            }
            $('.ISlide').attr('login', 1);
            if(ret.data.noticeNum>0){
                $('.ISlideNoticeTip').show();
            }else{
                $('.ISlideNoticeTip').hide();
            }
            if(ret.data.noticeNum>=10){
                $('.ISlideNoticeMore').show();
            }else{
                $('.ISlideNoticeMore').hide();
            }
            $('.ISlideCartNum').html(ret.data.cartNum>99 ? '99+' : ret.data.cartNum);
            $('.ITopCartNum').html(ret.data.cartNum);
            if(ret.data.avatar){
                $('.ISlideUserInfo').find('.r-img').html('<a href="'+config.siteUrl+'/userinfo/" target="_blank"><img src="'+config.imageUrl+'/'+ret.data.avatar+'" width="70" height="70"></a>');
            }
            $('.ISlideUserInfo').find('.r-name').html('Hi，<a href="'+config.siteUrl+'/userinfo/" target="_blank"><em>'+ret.data.nickname+'</em></a>');
            $('.ISlideUserInfo').find('.r-level').html('您是波奇<a href="'+config.siteUrl+'/userinfo/" target="_blank"><em>V'+ret.data.grade+'</em></a>级会员');
            $('.ISlide').show();
        });
    }
    // 读取购物车信息
    window.GetTopCartNum = function(){
        boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=getCartNum',{},function(ret){
            if(ret.status==-1){
                return;
            }
            $('.ISlideCartNum').html(ret.data>99 ? '99+' : ret.data);
            $('.ITopCartNum').html(ret.data);
        }, function(err){
        });
    };
    GetTopCartNum();
    function LoadTopCart(status){
        if($('.ITopCartList').css('display')=='none'){
            $('.ITopCartTip').html('正在载入...').show();
        }
        boqii.ajax.postJsonp(config.shopUrl+'/ajax.html?ctl=cartTools&act=getCartList', {}, function(ret){
            if(ret.status==-1){
                if($('.ITopCartList').css('display')=='none'){
                    $('.ITopCartTip').html('载入失败');
                }
                return;
            }
            $('.ISlideCartNum').html(ret.data.num>99 ? '99+' : ret.data.num);
            $('.ITopCartNum').html(ret.data.num);
            $('.ITopCartTotal').html('¥ '+ret.data.total);
            if(ret.data.num==0){
                $('.ITopCartList').hide();
                $('.ITopCartTip').html('购物车还是空的，赶紧给爱宠挑点什么吧！').show();
                return;
            }
            if(status){
                $.each(ret.data.products, function(i, a){
                    $('.ITopCartList').find('div[key="p_'+ a.key +'"]').find('.ITopCartInput').attr('base', a.num).val(a.num);
                });
                return;
            }
            var panel = $('.ITopCartList').find('.shop_body');
            panel.empty();
            $.each(ret.data.products, function(i, a){
                var html = '<div key="p_'+ a.key +'" class="shop_list"><div class="shop_img left"><a href="'+ config.shopUrl +'/product-'+ a.id +'.html" target="_blank"><img src="'+ a.img +'" alt="'+ a.pname +'"></a></div><div class="shop_numb left"><div class="ITopCartInc shop_jia'+ ((a.otype==3 || a.otype==8)?' event-disabled':'') +' ">+</div><input type="text" class="ITopCartInput'+ ((a.otype==3 || a.otype==8)?' event-disabled':'') +' " value="'+ a.num +'" base="'+ a.num +'" '+ ((a.otype==3 || a.otype==8)?' disabled="disabled"':'') +' ><div class="ITopCartDec'+ ((a.otype==3 || a.otype==8)?' event-disabled':'') +' shop_jian">-</div></div><dl class="right"><dt><a href="'+ config.shopUrl +'/product-'+ a.id +'.html" target="_blank">'+ a.pname +'</a></dt><dd><span class="shop_price left">¥ '+ a.price +'</span><span class="ITopCartGoodsRemove del right">删除</span></dd></dl></div>';
                $(html).appendTo(panel);
            });
            $('.ITopCartList').show();
            $('.ITopCartTip').hide();
            // 绑定事件
            $('.ITopCartGoodsRemove').off('click').click(function(e){
                e.stopPropagation();
                e.preventDefault();
                var obj = $(this).parent().parent().parent();
                var key = obj.attr('key');
                DeleteCart(key, function(){
                    obj.remove();
                    LoadTopCart(1);
                });
            });
            $('.ITopCartInc').off('click').click(function(e){
                e.stopPropagation();
                e.preventDefault();
                if($(this).hasClass('event-disabled')) return;
                var obj = $(this).parent().parent();
                var num = boqii.utils.ToInt(obj.find('.ITopCartInput').val());
                if(num>999){
                    return;
                }
                var key = obj.attr('key');
                var data = ParseKey(key);
                if(data==null){
                    AlertDialog('无效商品', null);
                    return;
                }
                //obj.find('.ITopCartInput').val(num+1);
                //obj.find('.ITopCartInput').attr('base', num+1);
                boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=increaseCartProduct',data,function(ret){
                    if(ret.status==-1){
                        AlertDialog(ret.message, null);
                        return;
                    }
                    LoadTopCart(1);
                }, function(err){
                    AlertDialog('购物车商品数量设置失败', null);
                });
            });
            $('.ITopCartDec').off('click').click(function(e){
                e.stopPropagation();
                e.preventDefault();
                if($(this).hasClass('event-disabled')) return;
                var obj = $(this).parent().parent();
                var num = boqii.utils.ToInt(obj.find('.ITopCartInput').val());
                if(num<=1){
                    return;
                }
                var key = obj.attr('key');
                var data = ParseKey(key);
                if(data==null){
                    AlertDialog('无效商品', null);
                    return;
                }
                //obj.find('.ITopCartInput').val(num-1);
                //obj.find('.ITopCartInput').attr('base', num-1);
                boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=decreaseCartProduct',data,function(ret){
                    if(ret.status==-1){
                        AlertDialog(ret.message, null);
                        return;
                    }
                    LoadTopCart(1);
                }, function(err){
                    AlertDialog('购物车商品数量设置失败', null);
                });
            });
            $('.ITopCartInput').blur(function(e){
                e.stopPropagation();
                e.preventDefault();
                if($(this).hasClass('event-disabled')) return;
                var num = $(this).val();
                var base = $(this).attr('base');
                if(num<1 || num>999){
                    num = base;
                    $(this).val(base);
                }
                if(num==base) return;
                var key = $(this).parent().parent().attr('key');
                var data = ParseKey(key);
                if(data==null){
                    AlertDialog('无效商品', null);
                    return;
                }
                //$(this).attr('base', $(this).val());
                data.number = num;
                boqii.ajax.postJsonp(config.shopUrl + '/ajax.html?ctl=cartTools&act=setCartProduct',data,function(ret){
                    if(ret.status==-1){
                        AlertDialog(ret.message, null);
                        return;
                    }
                    LoadTopCart(1);
                }, function(err){
                    AlertDialog('购物车商品数量设置失败', null);
                });
            }).keyup(function(e){
                e.stopPropagation();
                e.preventDefault();
                if(e.keyCode==13){
                    $(this).trigger('blur');
                }
            });
        });
    }
    $('.shop').mouseenter(function(){
        var oNav = $(this).parents('#nav');
        oNav.css({ position: 'relative', zIndex: 9999});
        $(this).find('.shop_c').addClass('current');
        $(this).find('.shop_cart').show();
        if($(this).attr('status')==undefined){
            LoadTopCart();
        }
        $(this).attr('status', 1);
    }).mouseleave(function(){
        var oNav = $(this).parents('#nav');
        oNav.css({ zIndex: 1});
        $(this).find('.shop_c').removeClass('current');
        $(this).find('.shop_cart').hide();
        $(this).removeAttr('status');
    });
    /*
    $('.shop').hover(
        function(){
            $(this).find('.shop_c').addClass('current');
            $(this).find('.shop_cart').show();
            LoadTopCart();
        },function(){
            $(this).find('.shop_c').removeClass('current');
            $(this).find('.shop_cart').hide();
        }
    );
    */
});


//检测是否登陆
function checkLogin(obj){
    $('.ISlide').find('.active').removeClass("active");
  if($('.ISlide').attr('login')==1){
      return true;
  }
    $(obj).parent().toggleClass("active");
    var tTop = $(obj).offset().top - $(window).scrollTop();
    if(tTop>($(window).height()-345))
        tTop = $(window).height()-345;
    if(tTop!=$(".RightLogin").offset().top){
        var tRight = 36-$(".RightFloatNav").position().left;
        $(".RightLogin").offset({'top':tTop}).css('right',tRight).addClass("hide").removeClass("hide");
    }else{
        $('.ISlide').find('.active').toggleClass("active");
        $(".RightLogin").toggleClass("hide");
    }
    // 更新验证码
    if(!$('.RightLogin').hasClass('hide')){
        $('.RightLogin').find('iframe').attr('src', '').attr('src', config.shopUrl+'/ajax.html?ctl=slide&act=loginFrame&rid='+Math.random());
    }
}

//展示APP
function showAppTip(obj){
  $(obj).parent().toggleClass("active");
  var tTop = $(obj).offset().top;
  if(tTop>($(window).height()-345))
    tTop = $(window).height()-345;
  var tRight = 36-$(".RightFloatNav").position().left;
  $(".RightApp").offset({'top':tTop}).css('right',tRight).toggleClass("hide");
}

function showSubContent(obj,str){
  $(".RightApp").addClass("hide");
  $(".RightLogin").addClass("hide");
  if(checkLogin(obj)){
      $(obj).parent().toggleClass("active");
      if($(".r-mc.current").attr("id")==undefined || $(".r-mc.current").attr("id") == str){
          $(".RightFloatNav").toggleClass("r-current");
          $(".RightNavContent").toggleClass("RightNavContentWidth").find("#"+str).toggleClass("current");
          $(".sbar_top_back").toggleClass("hide");
          if(!$(".RightNavContent").find("#"+str).hasClass("current")){
              $(".active").removeClass("active");
              $(".sbar_top_back").addClass("hide");
          }
      }else{
          $(".sbar_top_back").removeClass("hide");
          $(".current").removeClass("current");
          $(".RightNavContentWidth").removeClass("RightNavContentWidth");
          $(".RightNavContent").toggleClass("RightNavContentWidth").find("#"+str).toggleClass("current");
      }
      if(str=='records'){ // 收藏
          if($('#'+str).hasClass('current')){
              // 调用相关数据
              boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=slide&act=historyAndFavorites', {}, function(ret){
                  if(ret.status==-1){
                      AlertDialog(ret.message, null);
                      return;
                  }
                  $('.IHistoryItem').remove();
                  $.each(ret.data.history, function(i, a){
                      var link = config.shopUrl+'/product-'+ a.pid + '.html';
                      var html = '<div class="IHistoryItem IHistory'+ a.pid +' tm-mcOrder tm-mcOrderOne tm-mcOrderSelected"><div class="tm-mcMain"><div class="tm-mcItem"><a class="tm-mcPic" href="'+ link +'" title="'+ a.pname +'" target="_blank"><img height="50" src="'+ a.picpath +'"></a></div><div class="tm-mcSku"><a href="'+ link +'" title="'+ a.pname +'" target="_blank"><p title="'+ a.pname +'">'+ a.pname +'</p></a><span class="price">¥'+ a.price +'</span><span class="salenum">已售'+ a.sales +'</span></div><div class="tm-mcDelete"><a href="javascript:void(0)" pid="'+ a.pid +'" class="IHistoryRemove"><i class="tm-delete"></i></a></div></div>';
                      $(html).insertAfter($('.IHistoryList'));
                  });
                  $('.IFavoritesItem').remove();
                  $.each(ret.data.favorites, function(i, a){
                      var link = config.shopUrl+'/product-'+ a.pid + '.html';
                      var html = '<div class="IFavoritesItem IFavorites'+ a.pid +' tm-mcOrder tm-mcOrderOne tm-mcOrderSelected"><div class="tm-mcMain"><div class="tm-mcItem"><a class="tm-mcPic" href="'+ link +'" title="'+ a.pname +'" target="_blank"><img height="50" src="'+ a.picpath +'"></a></div><div class="tm-mcSku"><a href="'+ link +'" title="'+ a.pname +'" target="_blank"><p title="'+ a.pname +'">'+ a.pname +'</p></a><span class="price">¥'+ a.price +'</span><span class="salenum">已售'+ a.sales +'</span></div><div class="tm-mcDelete"><a href="javascript:void(0)" pid="'+ a.pid +'" class="IFavoritesRemove"><i class="tm-delete"></i></a></div></div>';
                      $(html).insertAfter($('.IFavoritesList'));
                  });
                  if(ret.data.favorites.length>=5){
                      $('.ISlideHistoryMore').show();
                  }else{
                      $('.ISlideHistoryMore').hide();
                  }
                  // 绑定事件
                  $('.IHistoryRemove').click(function(e){
                      e.stopPropagation();
                      e.preventDefault();
                      var id = $(this).attr('pid');
                      ConfirmDialog('您确认要移除当前商品吗?', function(){
                          boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=slide&act=deleteHistory', {
                              'id' : id
                          }, function(ret){
                              if(ret.status==-1){
                                  AlertDialog(ret.message, null);
                                  return;
                              }
                              $('.IHistory'+id).remove();
                          }, function(err){
                              AlertDialog('网络请求失败,请重新操作', null);
                          });
                      }, null);
                  });
                  $('.IFavoritesRemove').click(function(e){
                      e.stopPropagation();
                      e.preventDefault();
                      var id = $(this).attr('pid');
                      ConfirmDialog('您确认要移除当前商品吗?', function(){
                          boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=slide&act=deleteFavorites', {
                              'id' : id
                          }, function(ret){
                              if(ret.status==-1){
                                  AlertDialog(ret.message, null);
                                  return;
                              }
                              $('.IFavorites'+id).remove();
                          }, function(err){
                              AlertDialog('网络请求失败,请重新操作', null);
                          });
                      }, null);
                  });
              }, function(err){
                  AlertDialog('网络请求失败,请刷新页面后重新尝试', null);
              });
          }
      }
      if(str=='asset'){ // 资产
          if($('#'+str).hasClass('current')){
              // 调用相关数据
              boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=slide&act=assets', {}, function(ret){
                  if(ret.status==-1){
                      AlertDialog(ret.message, null);
                      return;
                  }
                  $('.IAssetBean').html(ret.data.bean);
                  $('.IAssetDiscountNum').html(ret.data.discountNum);
                  $('.IAssetExchangeNum').html(ret.data.exchangeNum);
                  $('.IAssetDiscount').find('li:gt(0)').remove();
                  $.each(ret.data.discountList, function(i, a){
                      var html = '<li class="r-sbar-coupon"><div class="r-sbar-coupon-info"><div class="r-title"><a href="'+config.siteUrl+'/userinfo/Coupon" target="_blank">'+ a.info +'</a></div><div class="r-num">'+ (a.isDiscount==1? a.cast+'折' : '¥'+a.cast) +'</div><div class="r-desc">'+ (a.limit>0?'满'+ a.limit +'元可用' : '无限制') +'</div></div><div class="r-sbar-coupon-outdate"><div class="r-desc">'+ (a.days>0? a.days+'天后过期' : '即将过期') +'</div></div></li>';
                      $('.IAssetDiscount').append($(html));
                  });
                  $('.IAssetExchange').find('li:gt(0)').remove();
                  $.each(ret.data.exchangeList, function(i, a){
                      var html = '<li class="r-sbar-coupon other"><div class="r-sbar-coupon-info"><div class="r-title">'+ a.info +'</div></div><div class="r-sbar-coupon-outdate"><div class="r-desc">'+ (a.days>0? a.days+'天后过期' : '即将过期') +'</div><div><a href="'+ config.siteUrl +'/userinfo/Coupon/prize" target="_blank"><span class="r-deal">去兑换</span></a></div></div></li>';
                      $('.IAssetExchange').append($(html));
                  });
              }, function(err){
                  AlertDialog('网络请求失败,请刷新页面后重新尝试', null);
              });
          }
      }
      if(str=='cartList'){ // 购物车
          if($('#'+str).hasClass('current')){
              LoadSlideCart();
          }
      }
      if(str=='profile'){ // 消息
          if($('#'+str).hasClass('current')){
              // 调用相关数据
              boqii.ajax.postJson(config.shopUrl+'/ajax.html?ctl=slide&act=notice', {}, function(ret){
                  if(ret.status==-1){
                      AlertDialog(ret.message, null);
                      return;
                  }
                  if(ret.data.noticeNum>0){
                      $('.ISlideNoticeTip').show();
                  }else{
                      $('.ISlideNoticeTip').hide();
                  }
                  if(ret.data.notice.length==0){
                      $('.ISlideNoNotice').show();
                      $('.ISlideNoticeList').hide();
                  }else{
                      $('.ISlideNoNotice').hide();
                      $('.ISlideNoticeList').show();
                      $('.ISlideNoticeList').empty();
                      $.each(ret.data.notice, function(i, a){
                          var html = '';
                          if(a.isread==1){
                              html = html + '<li class="notice-readed">';
                          }else{
                              html = html + '<li>';
                          }
                          html = html + "<span class='notice-c'>"+ a.content + "</span>" +'<span>';
                          html = html + '<a href="'+config.siteUrl+'/userinfo/Message/notice" target="_blank">查看全部></a>';
                          html = html + '</span></li>';
                          $(html).appendTo($('.ISlideNoticeList'));
                      });
                  }
              }, function(err){
                  AlertDialog('网络请求失败,请刷新页面后重新尝试', null);
              });
          }
      }
  }
}
$(function(){
  $(".mui-mbarp-prof-login-close").on("click",function(e){
    $(e.currentTarget).parent().toggleClass("hide");
    $('.ISlide').find('.active').toggleClass("active")
  });
  $("#sider_back").on("click",function(e){
	$(".RightApp").addClass("hide");
	$(".RightLogin").addClass("hide");
    $(".RightNavContent").toggleClass("RightNavContentWidth");
    $(e.currentTarget).parent().parent().toggleClass("hide");
    $(".RightFloatNav").toggleClass("r-current");
    $(".current").removeClass("current");
    $('.ISlide').find('.active').toggleClass("active")
  });

  $('#sider_returntop').on("click",function(){
    $('html, body').animate({scrollTop:0}, 'slow');
  });

  $(".sbar_oper li").hover(function(){
    $(this).addClass("on");
  },function(){
    $(this).removeClass("on");
  });
    var h=$(window).height();
    $(".RightFloatNavBox").css({"margin-top":-h/4});
});

