;(function(){window.a={jyurl:(('\x68\x74\x74\x70\x73\x3a'===document.location.protocol)?'\x68\x74\x74\x70\x73\x3a\x2f\x2f':'\x68\x74\x74\x70\x3a\x2f\x2f')+"\x64\x6d\x70\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x6a\x3f\x6d\x3d\x30\x26\x74\x3d\x34\x39",jyOrderurl:(('\x68\x74\x74\x70\x73\x3a'===document.location.protocol)?'\x68\x74\x74\x70\x73\x3a\x2f\x2f':'\x68\x74\x74\x70\x3a\x2f\x2f')+"\x64\x6d\x70\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x6a\x3f\x6d\x3d\x33\x26\x74\x3d\x34\x39",jyCarturl:(('\x68\x74\x74\x70\x73\x3a'===document.location.protocol)?'\x68\x74\x74\x70\x73\x3a\x2f\x2f':'\x68\x74\x74\x70\x3a\x2f\x2f')+"\x64\x6d\x70\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x6a\x3f\x6d\x3d\x34\x26\x74\x3d\x34\x39",jyProduct:(('\x68\x74\x74\x70\x73\x3a'===document.location.protocol)?'\x68\x74\x74\x70\x73\x3a\x2f\x2f':'\x68\x74\x74\x70\x3a\x2f\x2f')+"\x64\x6d\x70\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x6a\x3f\x6d\x3d\x35\x26\x74\x3d\x34\x39",init:function(){var b=a.Asend();if(typeof(_jyot)!="\x75\x6e\x64\x65\x66\x69\x6e\x65\x64"){var c=a.jyOrderurl+"\x26\x63\x3d"+a.getOrder();a.post(c,true,function(){})}else{if("\x64\x65\x74\x61\x69\x6c"==b){var d=jQuery("\x2e\x72\x69\x67\x68\x74\x62\x6f\x78\x5f\x30\x32\x2e\x62\x6f\x74\x74\x6f\x6d\x62\x64").text();d=d.split("\n");d=d[0x2].substring(d[0x2].indexOf("\u5546\u54c1\u7f16\u53f7")+0x5,d[0x2].length);var e=a.jyurl+"\x26\x70\x3d"+d+"\x26\x63\x3d"+a.getBehavior();a.post(e,true,function(){});f=a.jyProduct+"\x26\x70\x3d"+d+"\x26\x63\x3d"+a.getProduct();a.post(f,true,function(){})};var f=a.jyurl+"\x26\x63\x3d"+a.getBehavior();a.post(f,true,function(){})};a.creatMsg(b)},post:function(f,g,h){if(g){var i,j=Math.round(Math.random()*0x270f),k=(new Date()).getTime()+'\x5f'+j,l=window[k]=new Image();l.src=f;l.onerror=function(){window[k]=null;if(h)h&&h()};l.onload=l.onreadystatechange=function(m){if(!this.readyState||this.readyState==='\x6c\x6f\x61\x64\x65\x64'||this.readyState==='\x63\x6f\x6d\x70\x6c\x65\x74\x65'){if(h)h&&h();l.onload=l.onreadystatechange=null}}}},getProduct:function(){if(typeof(_jyproduct)!="\x75\x6e\x64\x65\x66\x69\x6e\x65\x64"){var f={"\x66\x69\x72\x73\x74\x5f\x6c\x65\x76\x65\x6c":_jyproduct.first_level,"\x73\x65\x63\x6f\x6e\x64\x5f\x6c\x65\x76\x65\x6c":_jyproduct.second_level,"\x74\x68\x69\x72\x64\x5f\x6c\x65\x76\x65\x6c":_jyproduct.third_level,"\x66\x6f\x75\x72\x74\x68\x5f\x6c\x65\x76\x65\x6c":_jyproduct.fourth_level,"\x66\x69\x66\x74\x68\x5f\x6c\x65\x76\x65\x6c":_jyproduct.fifth_level,"\x66\x69\x72\x73\x74\x5f\x6c\x65\x76\x65\x6c\x5f\x75\x72\x6c":_jyproduct.first_level_url,"\x73\x65\x63\x6f\x6e\x64\x5f\x6c\x65\x76\x65\x6c\x5f\x75\x72\x6c":_jyproduct.second_level_url,"\x74\x68\x69\x72\x64\x5f\x6c\x65\x76\x65\x6c\x5f\x75\x72\x6c":_jyproduct.third_level_url,"\x66\x6f\x75\x72\x74\x68\x5f\x6c\x65\x76\x65\x6c\x5f\x75\x72\x6c":_jyproduct.fourth_level_url,"\x66\x69\x66\x74\x68\x5f\x6c\x65\x76\x65\x6c\x5f\x75\x72\x6c":_jyproduct.fifth_level_url,"\x70\x63\x6f\x64\x65":_jyproduct.pcode,"\x62\x72\x61\x6e\x64\x5f\x69\x6d\x67":_jyproduct.brand_img,"\x62\x72\x61\x6e\x64":_jyproduct.brand,"\x62\x72\x61\x6e\x64\x5f\x75\x72\x6c":_jyproduct.brand_url,"\x69\x6e\x76\x65\x6e\x74\x6f\x72\x79":_jyproduct.inventory,"\x6e\x61\x6d\x65":_jyproduct.name,"\x70\x72\x69\x63\x65":_jyproduct.price,"\x64\x69\x73\x63\x6f\x75\x6e\x74\x5f\x70\x72\x69\x63\x65":_jyproduct.discount_price,"\x69\x6d\x67\x5f\x75\x72\x6c":_jyproduct.img_url,"\x75\x72\x6c":_jyproduct.url,"\x73\x74\x61\x74\x75\x73":_jyproduct.status,"\x6a\x73\x6f\x6e\x74\x79\x70\x65":"\x31"};return a.getParamjson(f,true)}else{var f=jQuery("\x2e\x63\x75\x72\x72\x65\x6e\x74").text();var g=jQuery("\x2e\x72\x69\x67\x68\x74\x62\x6f\x78\x5f\x30\x32\x2e\x62\x6f\x74\x74\x6f\x6d\x62\x64\x20\x61").text();var h=jQuery("\x23\x74\x69\x74\x6c\x65\x20\x68\x31").text();var i=jQuery("\x2e\x72\x69\x67\x68\x74\x62\x6f\x78\x5f\x30\x32\x2e\x62\x6f\x74\x74\x6f\x6d\x62\x64").text();var j=jQuery("\x23\x73\x68\x50\x72\x69\x63\x65").text();var k=jQuery("\x23\x62\x71\x50\x72\x69\x63\x65").text();var l=jQuery("\x23\x50\x64\x54\x68\x75\x6d\x62\x20\x69\x6d\x67").eq(0x0).attr("\x73\x72\x63");var m=jQuery("\x2e\x63\x75\x72\x72\x65\x6e\x74\x20\x61").eq(-0x1).attr("\x68\x72\x65\x66");i=i.split("\n");i=i[0x2].substring(i[0x2].indexOf("\u5546\u54c1\u7f16\u53f7")+0x5,i[0x2].length);j=j.replace("\xa5","");k=k.replace("\xa5","");var n={"\x70\x63\x6f\x64\x65":i,"\x62\x72\x61\x6e\x64":g,"\x6e\x61\x6d\x65":h,"\x70\x72\x69\x63\x65":j,"\x64\x69\x73\x63\x6f\x75\x6e\x74\x5f\x70\x72\x69\x63\x65":k,"\x69\x6d\x67\x5f\x75\x72\x6c":l,"\x75\x72\x6c":m,"\x63\x6c\x61\x73\x73\x69\x4c\x69\x73\x74":f,"\x6a\x73\x6f\x6e\x74\x79\x70\x65":"\x32"};return a.getParamjson(n,true)}},getBehavior:function(){var f=null;f={"\x74\x69\x74\x6c\x65":jQuery('\x74\x69\x74\x6c\x65').text(),"\x77\x69\x64\x74\x68":window.screen.width,"\x68\x69\x67\x68\x74":window.screen.height,"\x72\x65\x66\x65\x72":a.getRefer(),"\x72\x65\x71\x75\x65\x73\x74\x55\x72\x6c":a.trim(document.location.href),"\x64\x61\x74\x65":new Date()};var g="\x7b\x74\x69\x74\x6c\x65\x3d"+f.title+"\x2c\x77\x69\x64\x74\x68\x3d"+f.width+"\x2c\x68\x69\x67\x68\x74\x3d"+f.hight+"\x2c\x72\x65\x66\x65\x72\x3d"+f.refer+"\x2c\x72\x65\x71\x75\x65\x73\x74\x55\x72\x6c\x3d"+f.requestUrl+"\x2c\x64\x61\x74\x65\x3d"+f.date.getTime()+"\x7d";return encodeURIComponent(g)},getOrder:function(){var f="";if(typeof(_jyot)!="\x75\x6e\x64\x65\x66\x69\x6e\x65\x64"){f="\x7b";f+="\"\x5f\x6f\x72\x65\x64\x65\x72\x4c\x69\x73\x74\"\x3a\""+_jyot+"\"\x2c";f+="\"\x5f\x6a\x79\x4f\x72\x64\x65\x72\x49\x64\"\x3a\""+_jyot._jyOrderId+"\"\x2c";f+="\"\x5f\x6a\x79\x4f\x72\x64\x65\x72\x54\x6f\x74\x61\x6c\"\x3a\""+_jyot._jyOrderTotal+"\"";f=f+"\x7d"};return encodeURIComponent(f)},getRefer:function(){var f=document.referrer;f==location.href&&(f='');try{f=''==f?opener.location:f;f=''==f?'\x2d':f}catch(e){f='\x2d'};return f},trim:function(f){f=f.replace(/[\r\n]/g,"");return f.replace(/(^\s*)|(\s*$)/,"")},isString:function(f){return(f!=null)&&(f!=undefined)&&(typeof f=='\x73\x74\x72\x69\x6e\x67')&&(f.constructor==String)},isNumber:function(f){return(typeof f=='\x6e\x75\x6d\x62\x65\x72')&&(f.constructor==Number)},isDate:function(f){return f&&(typeof f=='\x6f\x62\x6a\x65\x63\x74')&&(f.constructor==Date)},isArray:function(f){return f&&(typeof f=='\x6f\x62\x6a\x65\x63\x74')&&(f.constructor==Array)},isObject:function(f){return f&&(typeof f=='\x6f\x62\x6a\x65\x63\x74')&&(f.constructor==Object)},getParamjson:function(f,g){var h=null;if(f){if(a.isString(f)||a.isNumber(f)){h=f}else{if(a.isObject(f)){var i='\x7b';for(var j in f){if(f[j]!=null&&f[j]!=undefined){var k=f[j];if(a.isArray(k)){k=k.join('\x2c')}else{if(a.isDate(k)){k=k.getTime()}};i+="\""+j+'\"\x3a\"'+k+'\"\x2c'}};i=i.substring(0x0,i.length-0x1)+"\x7d";h=i}else{if(a.isArray(f)){if(f!=null&&f.length>0x0){h=f.join('\x2c')}}else{h=f.toString()}}}};if(!h){h='\x2d'};if(g){h=encodeURIComponent(h);h=a.base64Encode(h)};return h},base64Encode:function(f){var g='\x41\x42\x43\x44\x45\x46\x47\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f\x50\x51\x52\x53\x54\x55\x56\x57\x58\x59\x5a\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6a\x6b\x6c\x6d\x6e\x6f\x70\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7a\x30\x31\x32\x33\x34\x35\x36\x37\x38\x39\x2b\x2f\x3d';var h=new Array();for(var i=0x0;i<=(f.length-0x1);i+=0x3){var k=f.charCodeAt(i);var l=f.charCodeAt(i+0x1);var m=f.charCodeAt(i+0x2);var n=k>>0x2;var o=((k&0x3)<<0x4)|(l>>0x4);var p=((l&0xf)<<0x2)|(m>>0x6);var q=m&0x3f;if(isNaN(l)){p=q=0x40}else if(isNaN(m)){q=0x40};h.push(g.charAt(n));h.push(g.charAt(o));h.push(g.charAt(p));h.push(g.charAt(q))};var j=h.join('');j=j.replace(/\+/,'\x25\x32\x42');return j},Asend:function(){var f=document.location.href;var g='';g=(f.indexOf("\x3f")>0x0)?f.substring(0x0,f.indexOf("\x3f")):f;var h={'\x69\x6e\x64\x65\x78':/^http:\/\/www.boqii.com\/$/,'\x63\x61\x72\x74':/^http:\/\/shop.boqii.com\/cart.html/,'\x6f\x72\x64\x65\x72':/^http:\/\/shop.boqii.com\/\w*-order.html/,'\x64\x65\x74\x61\x69\x6c':/^http:\/\/shop.boqii.com\/product-\w*.html/,'\x6c\x69\x73\x74':/^http:\/\/shop.boqii.com\/\w*\/list-\w*.*.html/,'\x68\x75\x6f\x64':/^http:\/\/zhuanti.boqii.com\/shop\/1212.html|http:\/\/zhuanti.boqii.com\/shop|http:\/\/zhuanti.boqii.com\/shop\/register.html/};var i=a.match(h,g);return i},match:function(f,g){var h;for(var i in f){if(f[i].test(g)){h=i;break}};return h},creatMsg:function(f){var g=(('\x68\x74\x74\x70\x73\x3a'===document.location.protocol)?'\x68\x74\x74\x70\x73\x3a\x2f\x2f':'\x68\x74\x74\x70\x3a\x2f\x2f');switch(f){case'\x69\x6e\x64\x65\x78':break;case'\x63\x61\x72\x74':a.post(g+'\x61\x77\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x74\x3f\x70\x3d\x35\x47\x26\x63\x3d\x67\x6b',true,function(){});break;case'\x6f\x72\x64\x65\x72':a.post(g+'\x61\x77\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x74\x3f\x70\x3d\x36\x47\x26\x63\x3d\x67\x6b',true,function(){});break;case'\x64\x65\x74\x61\x69\x6c':a.post(g+'\x61\x77\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x74\x3f\x70\x3d\x34\x47\x26\x63\x3d\x67\x6b',true,function(){});break;case'\x6c\x69\x73\x74':break;case'\x68\x75\x6f\x64':a.post(g+'\x61\x77\x2e\x6b\x65\x6a\x65\x74\x2e\x6e\x65\x74\x2f\x74\x3f\x70\x3d\x72\x6b\x26\x63\x3d\x67\x6b',true,function(){});break;default:break}}};a.init()}());