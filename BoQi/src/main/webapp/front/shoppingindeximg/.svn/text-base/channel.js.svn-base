/**
 * 获取url参数
 */
function GetRequest() {
  var url = location.search; //获取url中"?"符后的字串
   var theRequest = new Object();
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0; i < strs.length; i ++) {
         theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
      }
   }
   return theRequest;
}

var Request = new Object();
Request = GetRequest();
var utm_source;
//来源渠道参数
utm_source = Request['utm_source'];
//判断是否数字和字母
if(utm_source) {
	var regu = "^[0-9a-zA-Z-_]+$";
	var re = new RegExp(regu);
	if(re.test(utm_source)){
		//有效期三天
		var exp = new Date();
		exp.setTime(exp.getTime() + 72*60*60*1000);
		document.cookie = "utm_source_"+ utm_source + "="+ Date.parse(exp) / 1000+";path=/;domain=.boqii.com;expires=" + exp.toGMTString();
	}
}
