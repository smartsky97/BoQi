$(function(){
    $(".uname").mouseover(function(){
        $("#yincang").show();
        $(".uname").css("border","1px solid grey");
        $(".uname").css({background:"white"});
        $(".uname").css("border-bottom","none");
    });
     $("#yincang").mouseout(function(){
         $("#yincang").hide();
         $(".uname").css("border","none");
     });
    
    $(".shanghai").toggle(function(){
        $("#area").css("display","block");
    },function(){
        $("#area").css("display","none");
        $(".shanghai").css("display","block");
    });
    
    $(".sousuo").click(function(){
        $("#sleft").hide();
        $("#map").show();
    })
});


 