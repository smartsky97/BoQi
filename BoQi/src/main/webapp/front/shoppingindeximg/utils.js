/**
 * @author wangaibo<wangaibo@boqii.net>
 */
if (typeof window.boqii == 'undefined') {
    window.boqii = {};
    /**
     * 版本号
     * @type string
     */
    boqii.version = '1.0.0';
}
/* config */
(function ($) {
    if (typeof boqii.config == 'undefined') boqii.config = {};
    /* 关键词建议请求URL */
    if(typeof config == 'undefined'){
        boqii.config.suggest_url = '/ajax.html?ctl=suggest&act=get';
    }else{
        boqii.config.suggest_url = config.shopUrl + '/ajax.html?ctl=suggest&act=get';
    }

})(jQuery);
(function ($) {
    if (typeof boqii.utils == 'undefined') boqii.utils = {};
    /**
     * 判断变量是否定义
     *
     * @param src mixed 变量
     * @returns bool 返回true表示已经定义,false未定义
     */
    boqii.utils.IsUndefined = function (src) {
        return typeof src == 'undefined';
    };

    /**
     * 判断变量是否为字符串
     *
     * @param src mixed 变量
     * @returns bool 返回true表示是字符串，否则反之
     */
    boqii.utils.IsString = function (src) {
        return typeof src == 'string';
    };

    /**
     * 判断变量是否为数字
     *
     * 请注意，这个和php的is_numeric有区别，这个用于检测变量值是否为数字
     *
     * @param src mixed 变量
     * @returns bool 返回true表示是数字，否则反之
     */
    boqii.utils.IsNumber = function (src) {
        return typeof src == 'number';
    };

    /**
     * 检查变量是否为null
     *
     * @param src mixed 变量
     * @returns bool 返回true表示为null，否则反之
     */
    boqii.utils.IsNull = function (src) {
        return boqii.utils.IsUndefined(src) || src == null;
    }

    /**
     * 检查变量是否不为null
     *
     * @param src mixed 变量
     * @returns bool 返回true表示不为null，否则反之
     */
    boqii.utils.IsNotNull = function (src) {
        return !boqii.utils.IsNull(src);
    }

    /**
     * 检测变量是否为空(字符串)
     *
     * 请注意，此函数与php的empty函数有区别，如果变量不是字符串（包括数字）那么，返回true（为空）
     * 只有一种情况下为false（不为空），是字符串并且不为空值
     *
     * @param src mixed 变量
     * @returns bool 返回true表示为空，否则反之
     */
    boqii.utils.IsEmpty = function (src) {
        if (!boqii.utils.IsString(src)) return true;
        src = $.trim(src);
        return src == '';
    };

    /**
     * 检测变量是否不为空
     *
     * @param src mixed 变量
     * @returns bool 返回true表示不为空，否则反之
     */
    boqii.utils.IsNotEmpty = function (src) {
        return !boqii.utils.IsEmpty(src);
    };

    /**
     * 检测变量是否为一个标准函数
     *
     * @param src mixed 变量
     * @returns bool 返回true表示是函数，否则反之
     */
    boqii.utils.IsFunction = function (src) {
        if (boqii.utils.IsUndefined(src)) return false;
        return $.isFunction(src);
    };

    /**
     * 转换变量为整数
     *
     * @param value mixed 变量
     * @param def mixed 默认值
     * @returns int|mixed
     */
    boqii.utils.ToInt = function (value, def) {
        if (def == undefined) def = 0;
        if (value == undefined) return def;
        var result = def;
        try {
            result = parseInt(value);
        } catch (e) {
            result = def;
        }
        if (isNaN(result)) result = def;
        return result;
    };

    /**
     * 转换变量为浮点
     *
     * @param value mixed 变量
     * @param def mixed 默认值
     * @returns float|mixed
     */
    boqii.utils.ToFloat = function (value, def) {
        if (def == undefined) def = 0.0;
        if (value == undefined) return def;
        var result = def;
        try {
            result = parseFloat(value);
        } catch (e) {
            result = def;
        }
        if (isNaN(result)) result = def;
        return result;
    }

    /**
     * 清理字符串两边空白
     *
     * @param src string 原始数据
     * @returns string 结果
     */
    boqii.utils.Trim = function (src) {
        return $.trim(src);
    };

    String.prototype.replaceAll = function (reallyDo, replaceWith, ignoreCase) {
        if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
            return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")), replaceWith);
        } else {
            return this.replace(reallyDo, replaceWith);
        }
    };

    /**
     * 批量替换内容
     *
     * @param reallyDo string 被替换的字符串
     * @param replaceWith string 原始字符串
     * @param src string 原始字符串
     * @param ignoreCase bool 是否忽略大小写
     * @returns string 结果
     */
    boqii.utils.ReplaceAll = function (reallyDo, replaceWith, src, ignoreCase) {
        return src.replaceAll(reallyDo, replaceWith, ignoreCase);
    }

    /**
     * 窗口宽度
     *
     * @returns int
     */
    boqii.utils.GetWindowWidth = function () {
        return $(window).width();
    };

    /**
     * 窗口高度
     *
     * @returns int
     */
    boqii.utils.GetWindowHeight = function () {
        return $(window).height();
    };

    /**
     * 文档宽度
     *
     * @returns int
     */
    boqii.utils.GetDocumentWidth = function () {
        return $(document.body).width();
    };

    /**
     * 文档高度
     *
     * @returns int
     */
    boqii.utils.GetDocumentHeight = function () {
        return $(document.body).height();
    };

    /**
     * 最大网页宽度
     *
     * @returns int
     */
    boqii.utils.GetPageWidth = function () {
        return boqii.utils.GetWindowWidth() > boqii.utils.GetDocumentWidth() ? boqii.utils.GetWindowWidth() : boqii.utils.GetDocumentWidth();
    };

    /**
     * 最大网页高度
     *
     * @returns int
     */
    boqii.utils.GetPageHeight = function () {
        return boqii.utils.GetWindowHeight() > boqii.utils.GetDocumentHeight() ? boqii.utils.GetWindowHeight() : boqii.utils.GetDocumentHeight();
    };

    /**
     * 水平滚动条位置
     *
     * @returns int
     */
    boqii.utils.GetScrollLeft = function () {
        return $(window).scrollLeft();
    };

    /**
     * 垂直滚动条位置
     *
     * @returns int
     */
    boqii.utils.GetScrollTop = function () {
        return $(window).scrollTop();
    };

    /**
     * 计算居中水平坐标点
     *
     * @param width 元素宽度
     * @returns int 距左边位置
     */
    boqii.utils.GetCenterLeft = function (width) {
        return boqii.utils.GetScrollLeft() + (boqii.utils.GetWindowWidth() - boqii.utils.ToInt(width, 0)) / 2
    };

    /**
     * 计算居中垂直坐标点
     *
     * @param height int 元素高度
     * @returns int 距顶部位置
     */
    boqii.utils.GetCenterTop = function (height) {
        return boqii.utils.GetScrollTop() + (boqii.utils.GetWindowHeight() - boqii.utils.ToInt(height, 0)) / 2
    };

    /**
     * 设置或获取cookie
     *
     * @param name string cookie名称
     * @param value string cookie值
     * @param options map cookie参数
     * @returns null|string
     */
    boqii.utils.Cookie = function (name, value, options) {
        if (typeof value != 'undefined') { // name and value given, set cookie
            options = options || {};
            if (value === null) {
                value = '';
                options.expires = -1;
            }
            var expires = '';
            if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
                var date;
                if (typeof options.expires == 'number') {
                    date = new Date();
                    date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
                } else {
                    date = options.expires;
                }
                expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
            }
            var path = options.path ? '; path=' + options.path : '';
            var domain = options.domain ? '; domain=' + options.domain : '';
            var secure = options.secure ? '; secure' : '';
            document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
        } else { // only name given, get cookie
            var cookieValue = null;
            if (document.cookie && document.cookie != '') {
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = jQuery.trim(cookies[i]);
                    // Does this cookie string begin with the name we want?
                    if (cookie.substring(0, name.length + 1) == (name + '=')) {
                        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                        break;
                    }
                }
            }
            return cookieValue;
        }
    };
    
	/**
     * 倒计时函数
     *
     * @param starttime int 开始时间
     * @param endtime int 结束时间
     * @returns null|string
     */
	boqii.difftime = function(starttime,endtime){
		try{
			starttime = parseInt(starttime);
			endtime   = parseInt(endtime);
			var difftime  = endtime - starttime;
			if(difftime > 0){
			   //显示正常倒计时
			   var days=Math.floor(difftime/(24*3600));
			   //计算出小时数
			   var leave1=difftime % (24*3600);    //计算天数后剩余的毫秒数
			   var hours=Math.floor(leave1/(3600));
			   //计算相差分钟数
			   var leave2=leave1%(3600);        //计算小时数后剩余的毫秒数
			   var minutes=Math.floor(leave2/(60));
			   //计算相差秒数
			   var leave3=leave2%(60);      //计算分钟数后剩余的毫秒数
			   var seconds=Math.round(leave3);

			   return [days,hours,minutes,seconds];
			   //alert(" 相差 "+days+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒");
	 
		   }else{
			   //显示 0时0分0秒
		   }
		}catch(e){
			alert("存在未知的错误: "+e.Message);
		}
		return [0,0,0,0];
	};


    /**
     * 时钟函数
     *
     * @param functionName string 函数名称
     * @param itime int 时间戳
     * @returns null|string
     */
	boqii.setInterval = function(functionName,itime){
		boqii.intervalId = window.setInterval(functionName,itime);
	};
})(jQuery);



/* Validate */
(function ($) {
    if (typeof boqii.validate == 'undefined') boqii.validate = {};

    /**
     * 验证电子邮件
     *
     * @param value string 变量
     * @returns bool 返回true表示通过验证，否则则反之
     */
    boqii.validate.CheckMail = function (value) {
        if (boqii.utils.IsEmpty(value)) return false;
        return /^[_a-zA-Z0-9_-_._-]+@([_a-zA-Z0-9_-]+\.)+[a-zA-Z]{2,3}$/.test(value);
    };

    /**
     * 验证手机号码
     *
     * @param value string 变量
     * @returns bool 返回true表示通过验证，否则则反之
     */
    boqii.validate.CheckMobile = function (value) {
        if (boqii.utils.IsEmpty(value)) return false;
        return /^1[0-9]{10}$/.test(value);
    };

    // 构造函数，变量为15位或者18位的身份证号码
    var clsIDCard = function (CardNo) {
        this.Valid = false;
        this.ID15 = '';
        this.ID18 = '';
        this.Local = '';
        if (CardNo != null)
            this.SetCardNo(CardNo);
    }

    // 设置身份证号码，15位或者18位
    clsIDCard.prototype.SetCardNo = function (CardNo) {
        this.ID15 = '';
        this.ID18 = '';
        this.Local = '';
        CardNo = CardNo.replace(" ", "");
        var strCardNo;
        if (CardNo.length == 18) {
            pattern = /^\d{17}(\d|x|X)$/;
            if (pattern.exec(CardNo) == null)
                return;
            strCardNo = CardNo.toUpperCase();
        } else {
            pattern = /^\d{15}$/;
            if (pattern.exec(CardNo) == null)
                return;
            strCardNo = CardNo.substr(0, 6) + '19' + CardNo.substr(6, 9)
            strCardNo += this.GetVCode(strCardNo);
        }
        this.Valid = this.CheckValid(strCardNo);
    }

    // 校验身份证有效性
    clsIDCard.prototype.IsValid = function () {
        return this.Valid;
    }

    // 返回生日字符串，格式如下，1981-10-10
    clsIDCard.prototype.GetBirthDate = function () {
        var BirthDate = '';
        if (this.Valid)
            BirthDate = this.GetBirthYear() + '-' + this.GetBirthMonth() + '-'
                + this.GetBirthDay();
        return BirthDate;
    }

    // 返回生日中的年，格式如下，1981
    clsIDCard.prototype.GetBirthYear = function () {
        var BirthYear = '';
        if (this.Valid)
            BirthYear = this.ID18.substr(6, 4);
        return BirthYear;
    }

    // 返回生日中的月，格式如下，10
    clsIDCard.prototype.GetBirthMonth = function () {
        var BirthMonth = '';
        if (this.Valid)
            BirthMonth = this.ID18.substr(10, 2);
        if (BirthMonth.charAt(0) == '0')
            BirthMonth = BirthMonth.charAt(1);
        return BirthMonth;
    }

    // 返回生日中的日，格式如下，10
    clsIDCard.prototype.GetBirthDay = function () {
        var BirthDay = '';
        if (this.Valid)
            BirthDay = this.ID18.substr(12, 2);
        return BirthDay;
    }

    // 返回性别，1：男，0：女
    clsIDCard.prototype.GetSex = function () {
        var Sex = '';
        if (this.Valid)
            Sex = this.ID18.charAt(16) % 2;
        return Sex;
    }

    // 返回15位身份证号码
    clsIDCard.prototype.Get15 = function () {
        var ID15 = '';
        if (this.Valid)
            ID15 = this.ID15;
        return ID15;
    }

    // 返回18位身份证号码
    clsIDCard.prototype.Get18 = function () {
        var ID18 = '';
        if (this.Valid)
            ID18 = this.ID18;
        return ID18;
    }

    // 返回所在省，例如：上海市、浙江省
    clsIDCard.prototype.GetLocal = function () {
        var Local = '';
        if (this.Valid)
            Local = this.Local;
        return Local;
    }

    clsIDCard.prototype.GetVCode = function (CardNo17) {
        var Wi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
        var Ai = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
        var cardNoSum = 0;
        for (var i = 0; i < CardNo17.length; i++)
            cardNoSum += CardNo17.charAt(i) * Wi[i];
        var seq = cardNoSum % 11;
        return Ai[seq];
    }

    clsIDCard.prototype.CheckValid = function (CardNo18) {
        if (this.GetVCode(CardNo18.substr(0, 17)) != CardNo18.charAt(17))
            return false;
        if (!this.IsDate(CardNo18.substr(6, 8)))
            return false;
        var aCity = {
            11: "北京",
            12: "天津",
            13: "河北",
            14: "山西",
            15: "内蒙古",
            21: "辽宁",
            22: "吉林",
            23: "黑龙江 ",
            31: "上海",
            32: "江苏",
            33: "浙江",
            34: "安徽",
            35: "福建",
            36: "江西",
            37: "山东",
            41: "河南",
            42: "湖北 ",
            43: "湖南",
            44: "广东",
            45: "广西",
            46: "海南",
            50: "重庆",
            51: "四川",
            52: "贵州",
            53: "云南",
            54: "西藏 ",
            61: "陕西",
            62: "甘肃",
            63: "青海",
            64: "宁夏",
            65: "新疆",
            71: "台湾",
            81: "香港",
            82: "澳门",
            91: "国外"
        };
        if (aCity[parseInt(CardNo18.substr(0, 2))] == null)
            return false;
        this.ID18 = CardNo18;
        this.ID15 = CardNo18.substr(0, 6) + CardNo18.substr(8, 9);
        this.Local = aCity[parseInt(CardNo18.substr(0, 2))];
        return true;
    }

    clsIDCard.prototype.IsDate = function (strDate) {
        var r = strDate.match(/^(\d{1,4})(\d{1,2})(\d{1,2})$/);
        if (r == null)
            return false;
        var d = new Date(r[1], r[2] - 1, r[3]);
        return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[2] && d.getDate() == r[3]);
    }

    boqii.validate.IdCard = clsIDCard;

    /**
     * 验证身份证号码
     *
     * @param value string 变量
     * @returns bool 返回true表示通过验证，否则则反之
     */
    boqii.validate.CheckPid = function (value) {
        if (boqii.utils.IsEmpty(value)) return false;
        var checkFlag = new boqii.validate.IdCard(value);
        return checkFlag.IsValid();
    };
})(jQuery);

/* base64 */
(function ($) {
    if (typeof boqii.base64 == 'undefined') boqii.base64 = {};
    boqii.base64.decode = function(data){
        var ret = utf8to16(base64decode(data));
        if(boqii.utils.IsEmpty(ret)) return null;
        return ret;
    };

    var base64DecodeChars = new Array(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);

    /**
     * base64解码
     * @param {Object} str
     */
    function base64decode(str){
        var c1, c2, c3, c4;
        var i, len, out;
        len = str.length;
        i = 0;
        out = "";
        while (i < len) {
            /* c1 */
            do {
                c1 = base64DecodeChars[str.charCodeAt(i++) & 0xff];
            }
            while (i < len && c1 == -1);
            if (c1 == -1)
                break;
            /* c2 */
            do {
                c2 = base64DecodeChars[str.charCodeAt(i++) & 0xff];
            }
            while (i < len && c2 == -1);
            if (c2 == -1)
                break;
            out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4));
            /* c3 */
            do {
                c3 = str.charCodeAt(i++) & 0xff;
                if (c3 == 61)
                    return out;
                c3 = base64DecodeChars[c3];
            }
            while (i < len && c3 == -1);
            if (c3 == -1)
                break;
            out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2));
            /* c4 */
            do {
                c4 = str.charCodeAt(i++) & 0xff;
                if (c4 == 61)
                    return out;
                c4 = base64DecodeChars[c4];
            }
            while (i < len && c4 == -1);
            if (c4 == -1)
                break;
            out += String.fromCharCode(((c3 & 0x03) << 6) | c4);
        }
        return out;
    }

    /**
     * utf8转utf16
     * @param {Object} str
     */
    function utf8to16(str){
        var out, i, len, c;
        var char2, char3;
        out = "";
        len = str.length;
        i = 0;
        while (i < len) {
            c = str.charCodeAt(i++);
            switch (c >> 4) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    // 0xxxxxxx
                    out += str.charAt(i - 1);
                    break;
                case 12:
                case 13:
                    // 110x xxxx 10xx xxxx
                    char2 = str.charCodeAt(i++);
                    out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
                    break;
                case 14:
                    // 1110 xxxx10xx xxxx10xx xxxx
                    char2 = str.charCodeAt(i++);
                    char3 = str.charCodeAt(i++);
                    out += String.fromCharCode(((c & 0x0F) << 12) | ((char2 & 0x3F) << 6) | ((char3 & 0x3F) << 0));
                    break;
            }
        }
        return out;
    }
})(jQuery);

/* Ajax */
(function ($) {
    if (typeof boqii.ajax == 'undefined') boqii.ajax = {};
    /**
     * AJAX请求封装
     *
     * @param url string 请求地址
     * @param options map 请求参数，具体参数请参考jQuery.ajax
     * @returns bool 请求正常执行，返回TRUE，执行出错，返回FALSE。注意这个返回值并不能代表请求过程中发生的任何事情
     */
    boqii.ajax.ajax = function (url, options) {
        if (boqii.utils.IsEmpty(url)) return false;
        var defaults = {
            'url': url,
            'async': true,
            'cache': false,
            'complete': function (xhr, ts) {
            },
            'contentType': 'application/x-www-form-urlencoded',
            'data': {},
            'dataType': 'text',
            'error': function (xhr, status, err) {
            },
            'headers': {},
            'jsonp': false,
            'success': function (data, status, xhr) {
            },
            'timeout': 60000,
            'type': 'GET'
        };
        options = $.extend(defaults, options || {});
        $.ajax(options);
        return true;
    };

    /**
     * GET请求，返回文本
     *
     * @param url string 请求地址
     * @param callback function function(data){} 返回成功回调函数
     * @param errorCallback function function(errorMsg){} 产生错误回调函数
     * @param cache bool 是否缓存请求数据，默认不缓存
     * @param async bool 是否异步查询，默认异步执行
     */
    boqii.ajax.get = function (url, callback, errorCallback, cache, async) {
        if (boqii.utils.IsEmpty(url)) {
            if (boqii.utils.IsFunction(errorCallback)) {
                errorCallback('url empty');
            }
            return false;
        }
        var options = {};
        if (boqii.utils.IsFunction(callback)) {
            options.success = function (data, status, xhr) {
                callback(data);
            }
        }
        if (boqii.utils.IsFunction(errorCallback)) {
            options.error = function (xhr, status, err) {
                var msg = boqii.utils.IsNotNull(err) ? err.message : 'unknown error';
                errorCallback(msg);
            }
        }
        options.cache = cache || false;
        var _async = true;
        if(boqii.utils.IsNotNull(async)){
            _async = !! async;
        }
        options.async = _async;
        return boqii.ajax.ajax(url, options);
    };

    /**
     * GET请求，返回JSON
     *
     * @param url string 请求地址
     * @param callback function function(data){} 返回成功回调函数
     * @param errorCallback function function(errorMsg){} 产生错误回调函数
     * @param cache bool 是否缓存请求数据，默认不缓存
     * @param async bool 是否异步查询,默认异步
     */
    boqii.ajax.getJson = function (url, callback, errorCallback, cache, async) {
        if (boqii.utils.IsEmpty(url)) {
            if (boqii.utils.IsFunction(errorCallback)) {
                errorCallback('url empty');
            }
            return false;
        }
        var options = {};
        options.dataType = 'text';
        if (boqii.utils.IsFunction(callback)) {
            options.success = function (data, status, xhr) {
                var json = $.parseJSON(data);
                if (json) {
                    callback(json);
                } else {
                    errorCallback('json decode error');
                }
            }
        }
        if (boqii.utils.IsFunction(errorCallback)) {
            options.error = function (xhr, status, err) {
                // alert(err);
                var msg = boqii.utils.IsNotNull(err) ? err.message : 'unknown error';
                errorCallback(msg);
            }
        }
        options.cache = cache || false;
        var _async = true;
        if(boqii.utils.IsNotNull(async)){
            _async = !! async;
        }
        options.async = _async;
        return boqii.ajax.ajax(url, options);
    };

    /**
     * GET请求，返回JSONP 用于跨域
     *
     * @param url string 请求地址
     * @param callback function function(data){} 返回成功回调函数
     * @param errorCallback function function(errorMsg){} 产生错误回调函数
     * @param cache bool 是否缓存请求数据，默认不缓存
     * @param jsonpName string JSONP名称
     * @param async bool 是否异步查询,默认异步
     */
    boqii.ajax.getJsonp = function (url, callback, errorCallback, cache, jsonpName, async) {
        if (boqii.utils.IsEmpty(url)) {
            if (boqii.utils.IsFunction(errorCallback)) {
                errorCallback('url empty');
            }
            return false;
        }
        var options = {};
        options.dataType = 'jsonp';
        options.jsonp = boqii.utils.IsEmpty(jsonpName) ? 'callback' : jsonpName;
        if (boqii.utils.IsFunction(callback)) {
            options.success = function (data, status, xhr) {
                callback(data);
            }
        }
        if (boqii.utils.IsFunction(errorCallback)) {
            options.error = function (xhr, status, err) {
                // alert(err);
                var msg = boqii.utils.IsNotNull(err) ? err.message : 'unknown error';
                errorCallback(msg);
            }
        }
        options.cache = cache || false;
        var _async = true;
        if(boqii.utils.IsNotNull(async)){
            _async = !! async;
        }
        options.async = _async;
        return boqii.ajax.ajax(url, options);
    };

    /**
     * POST请求，返回文本
     *
     * @param url string 请求地址
     * @param data map 请求数据
     * @param callback function function(data){} 返回成功回调函数
     * @param errorCallback function function(errorMsg){} 产生错误回调函数
     * @param cache bool 是否缓存请求数据，默认不缓存
     * @param async bool 是否异步查询，默认异步
     */
    boqii.ajax.post = function (url, data, callback, errorCallback, cache, async) {
        if (boqii.utils.IsEmpty(url)) {
            if (boqii.utils.IsFunction(errorCallback)) {
                errorCallback('url empty');
            }
            return false;
        }
        var options = {};
        options.type = 'POST';
        options.data = data || {};
        if (boqii.utils.IsFunction(callback)) {
            options.success = function (data, status, xhr) {
                callback(data);
            }
        }
        if (boqii.utils.IsFunction(errorCallback)) {
            options.error = function (xhr, status, err) {
                var msg = boqii.utils.IsNotNull(err) ? err.message : 'unknown error';
                errorCallback(msg);
            }
        }
        options.cache = cache || false;
        var _async = true;
        if(boqii.utils.IsNotNull(async)){
            _async = !! async;
        }
        options.async = _async;
        return boqii.ajax.ajax(url, options);
    };

    /**
     * POST请求，返回JSON
     *
     * @param url string 请求地址
     * @param data map 请求数据
     * @param callback function function(data){} 返回成功回调函数
     * @param errorCallback function function(errorMsg){} 产生错误回调函数
     * @param cache bool 是否缓存请求数据，默认不缓存
     * @param async bool 是否异步查询，默认异步
     */
    boqii.ajax.postJson = function (url, data, callback, errorCallback, cache, async) {
        if (boqii.utils.IsEmpty(url)) {
            if (boqii.utils.IsFunction(errorCallback)) {
                errorCallback('url empty');
            }
            return false;
        }
        var options = {};
        options.dataType = 'text';
        options.type = 'POST';
        options.data = data || {};
        if (boqii.utils.IsFunction(callback)) {
            options.success = function (data, status, xhr) {
                var json = $.parseJSON(data);
                if (json) {
                    callback(json);
                } else {
                    errorCallback('json decode error');
                }
            }
        }
        if (boqii.utils.IsFunction(errorCallback)) {
            options.error = function (xhr, status, err) {
                // alert(err);
                var msg = boqii.utils.IsNotNull(err) ? err.message : 'unknown error';
                errorCallback(msg);
            }
        }
        options.cache = cache || false;
        var _async = true;
        if(boqii.utils.IsNotNull(async)){
            _async = !! async;
        }
        options.async = _async;
        return boqii.ajax.ajax(url, options);
    };

    /**
     * POST请求，返回JSONP 用于跨域
     *
     * @param url string 请求地址
     * @param data map 请求数据
     * @param callback function function(data){} 返回成功回调函数
     * @param errorCallback function function(errorMsg){} 产生错误回调函数
     * @param cache bool 是否缓存请求数据，默认不缓存
     * @param async bool 是否异步查询，默认异步
     */
    boqii.ajax.postJsonp = function (url, data, callback, errorCallback, cache, async) {
        if (boqii.utils.IsEmpty(url)) {
            if (boqii.utils.IsFunction(errorCallback)) {
                errorCallback('url empty');
            }
            return false;
        }
        var options = {};
        options.dataType = 'jsonp';
        options.jsonp = 'callback';
        options.type = 'POST';
        options.data = data || {};
        if (boqii.utils.IsFunction(callback)) {
            options.success = function (data, status, xhr) {
                callback(data);
            }
        }
        if (boqii.utils.IsFunction(errorCallback)) {
            options.error = function (xhr, status, err) {
                // alert(err);
                var msg = boqii.utils.IsNotNull(err) ? err.message : 'unknown error';
                errorCallback(msg);
            }
        }
        options.cache = cache || false;
        var _async = true;
        if(boqii.utils.IsNotNull(async)){
            _async = !! async;
        }
        options.async = _async;
        return boqii.ajax.ajax(url, options);
    };
})(jQuery);


/* Dialog */
(function ($) {
    if (typeof boqii.dialog == 'undefined') boqii.dialog = {};

    var MessageDialog = function (options) {
        this._dialog = null;
        this._body = null;
        this.defaults = {
            'id': null, // 弹出层内容ID
            'css': null, // 弹出层内容样式
            'message': '', // 弹出层内容
            'mask': false, // 是否显示遮罩层
            'buttons': [ // 弹出层按钮列表
                {
                    'id': null,
                    'css': null,
                    'value': '关闭',
                    'callback': function (dialog, options) {
                        dialog.close();
                    }
                }
            ],
            'closeFn' : null
        };
        this.options = $.extend(this.defaults, options || {});
        var html = '<div class="bq_dialog">';
        html += '<div class="bq_dialog_header">';
        html += '<div class="bq_dialog_header_title"></div>';
        html += '<div class="bq_dialog_header_close"><a href="javascript:;">关闭</a></div>';
        html += '</div>';
        html += '<div class="bq_dialog_body">';
        html += '<div class="bq_dialog_icon"></div>';
        html += '<div class="bq_dialog_message"></div>';
        html += '</div>';
        html += '<div class="bq_dialog_footer">';
        html += '<div class="bq_dialog_footer_buttons">';
        html += '</div>';
        html += '</div>';
        html += '</div>';
        this._body = $(html);
        if (boqii.utils.IsNotEmpty(this.options.id)) {
            this._body.attr('id', this.options.id);
        }
        if (boqii.utils.IsNotEmpty(this.options.css)) {
            this._body.addClass(this.options.css);
        }
        var msg = boqii.utils.IsNotEmpty(this.options.message) ? this.options.message : '';
        this.setMessage(msg);
        this.buildButtons();
        this.bindClose();
        var _mask = this.options.mask ? true : false;
        this._dialog = $.dialog({
            title: false,
            padding: 0,
            lock: _mask,
            background: '#000',
            opacity: 0.6,
            resize: false,
            drag: false,
            esc: false,
            fixed: true,
            content: this._body.get(0)
        });
    };

    MessageDialog.prototype.bindClose = function () {
        if (!this._body) return;
        var _this = this;
        this._body.find('.bq_dialog_header_close').find('a').click(function (e) {
            e.preventDefault();
            e.stopPropagation();
            if(boqii.utils.IsFunction(_this.options.closeFn)){
                _this.options.closeFn(_this);
            }else{
                _this.close();
            }
        });
    };

    MessageDialog.prototype.buildButtons = function () {
        if (!this._body) return;
        var _this = this;
        var buttons = this.options.buttons || [];
        $.each(buttons, function (i, a) {
            var btn = $('<a />');
            btn.attr('href', 'javascript:;');
            if (boqii.utils.IsNotEmpty(a.id)) {
                btn.attr('id', a.id);
            }
            if (boqii.utils.IsNotEmpty(a.css)) {
                btn.addClass(a.css);
            }
            btn.html(a.value);
            if (boqii.utils.IsFunction(a.callback)) {
                btn.click(function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    a.callback(_this, _this.options);
                });
            }
            _this._body.find('.bq_dialog_footer_buttons').append(btn);
        });
    };

    MessageDialog.prototype.getMessage = function () {
        return this.options.message;
    };

    MessageDialog.prototype.setMessage = function (msg) {
        this.options.message = msg;
        if (this._body) {
            this._body.find('.bq_dialog_message').html(msg);
        }
    };

    MessageDialog.prototype.close = function () {
        if (this._dialog) {
            this._dialog.close();
        }
        this._dialog = null;
    };

    boqii.dialog.MessageDialog = MessageDialog;

    boqii.dialog.AlertDialog = function (message, callback, mask, classname, closeFn) {
        var _mask = mask || false;
        var _classname = classname || '';
        return new boqii.dialog.MessageDialog({
            'mask': _mask,
            'css': _classname,
            'message': message,
            'buttons': [
                {
                    'value': '确定',
                    'callback': function (dialog, options) {
                        if (boqii.utils.IsFunction(callback)) {
                            if (callback(dialog, options)) {
                                dialog.close();
                            }
                        } else {
                            dialog.close();
                        }
                    }
                }
            ],
            'closeFn' : closeFn
        });
    };

    boqii.dialog.ConfirmDialog = function (message, okCallback, cancelCallback, mask, classname, closeFn) {
        var _mask = mask || false;
        var _classname = classname || '';
        return new boqii.dialog.MessageDialog({
            'mask': _mask,
            'css': _classname,
            'message': message,
            'buttons': [
                {
                    'value': '确定',
                    'callback': function (dialog, options) {
                        if (boqii.utils.IsFunction(okCallback)) {
                            if (okCallback(dialog, options)) {
                                dialog.close();
                            }
                        } else {
                            dialog.close();
                        }
                    }
                },
                {
                    'value': '取消',
                    'callback': function (dialog, options) {
                        if (boqii.utils.IsFunction(cancelCallback)) {
                            if (cancelCallback(dialog, options)) {
                                dialog.close();
                            }
                        } else {
                            dialog.close();
                        }
                    }
                }
            ],
            'closeFn' : closeFn
        });
    };

    /**
     * HTML弹出层
     *
     * @param contentElem string 内容元素ID
     * @param closeElem string 关闭元素ID
     * @param mask 是否启用遮蔽层
     * @returns object 弹出层对象
     */
    boqii.dialog.HtmlDialog = function (contentElem, closeElem, mask) {
        var _mask = mask ? true : false;
        var _dialog = $.dialog({
            title: false,
            padding: 0,
            lock: _mask,
            background: '#000',
            opacity: 0.6,
            resize: false,
            drag: false,
            esc: false,
            fixed: true,
            content: $(contentElem).get(0)
        });
        if ($(closeElem).length > 0) {
            $(closeElem).click(function (e) {
                e.stopPropagation();
                e.preventDefault();
                _dialog.close();
            });
        }
        return _dialog;
    };

    /**
     * URL弹出层
     *
     * @param url string URL地址
     * @param width int 弹出层宽度
     * @param height int 弹出层高度
     * @param mask bool 是否启用遮罩层
     * @returns object 弹出层对象
     */
    boqii.dialog.IframeDialog = function (url, width, height, mask) {
        var _mask = mask ? true : false;
        var _dialog = $.dialog.open(url,
            {
                title: false,
                padding: 0,
                lock: _mask,
                background: '#000',
                opacity: 0.7,
                resize: false,
                drag: false,
                esc: false,
                fixed: true,
                width: width,
                height: height,
                content: false
            }
        );
        return _dialog;
    };

    /**
     * 用户登录窗口
     *
     * @param domain string 商城域名
     * @param from string 来源(可为空)
     * @returns {Object} 窗口对象
     */
    boqii.dialog.LoginDialog = function(domain, from){
        if(boqii.utils.IsEmpty(domain)) domain = '/';
        var _dialog = boqii.dialog.IframeDialog(domain + 'loginFrame.html?from=' + from, '704px', '306px', true);
        top.window.LoginSetDialogUrl = function(url){
            _dialog.iframe.src = '';
            _dialog.iframe.src = url;
        };
        top.window.LoginCloseDialog = function(isReload, link){
            _dialog.close();
            if(isReload){
                if(boqii.utils.IsEmpty(link)){
                    top.window.location.reload();
                }else{
                    top.window.location.href = link;
                }
            }
        };
        return _dialog;
    };

    /**
     * 绑定手机号码
     *
     * @param domain string 商城域名
     * @param from string 来源(可为空)
     * @returns {Object} 窗口对象
     */
    boqii.dialog.BindMobileDialog = function(domain){
        if(boqii.utils.IsEmpty(domain)) domain = '/';
        var _dialog = boqii.dialog.IframeDialog(domain + 'index.php?app=users&ctl=bindMobile&act=form', '340px', '260px', true);
        top.window.BindMobileCloseDialog = function(isReload, link){
            _dialog.close();
            if(isReload){
                if(boqii.utils.IsEmpty(link)){
                    top.window.location.reload();
                }else{
                    top.window.location.href = link;
                }
            }
        };
        return _dialog;
    };
})(jQuery);

/* tool */
(function ($) {
    if (typeof boqii.tool == 'undefined') boqii.tool = {};
    /**
     * 弹出层日期选择（格式 年-月-日 时:分:秒）
     *
     * @param elem object|string 触发元素
     * @param callback function 回调函数
     * @return bool 是否绑定成功
     */
    boqii.tool.SelectDateTime = function (elem, callback) {
        var _elem = $(elem);
        if (_elem.length == 0) return false;
        var options = {
            format: 'yyyy-MM-dd HH:mm:ss'
        };
        if (boqii.utils.IsFunction(callback)) {
            options.onSetDate = function () {
                callback(this.getDate('dateTime'));
            };
        }
        _elem.calendar(options);
        return true;
    };

    /**
     * 弹出层日期选择（格式 年-月-日）
     *
     * @param elem object|string 触发元素
     * @param callback function 回调函数
     * @return bool 是否绑定成功
     */
    boqii.tool.SelectDate = function (elem, callback) {
        var _elem = $(elem);
        if (_elem.length == 0) return false;
        var options = {
            format: 'yyyy-MM-dd'
        };
        if (boqii.utils.IsFunction(callback)) {
            options.onSetDate = function () {
                callback(this.getDate('date'));
            };
        }
        _elem.calendar(options);
    };
    /* 关键词建议对象 */
    var suggest = function (elem, options) {
        this._input = $(elem);
        if (this._input.length == 0 || !this._input.is('input') || this._input.attr('bind') == '1') {
            return null;
        }
        var defaults = {
            'css': '',
            'left': 0,
            'top': 0
        };
        this.options = $.extend(defaults, options || {});
        this._show = false;
        //this._value = this._input.val();
        this._value = '请输入商品名称';
        this._word = '';
        this._body = null;
        this.build();
        this.bind();
    };

    suggest.prototype.bind = function () {
        var _this = this;
        $(document).click(function () {
            _this.hide();
        });
        this._input.focus(function (e) {
            var value = $(this).val();
            if (value == _this._value) {
                $(this).val('');
                return;
            }
            // console.log('focus');
            // $(this).trigger('click');
            // _this.send(value);
        });
        this._input.blur(function () {
            var value = $(this).val();
            if (value == '') {
                $(this).val(_this._value);
                return;
            }
            // console.log('blur');
        });
        this._input.keyup(function () {
            var value = $(this).val();
            // console.log('key');
            _this.send(value);
        });

        this._input.click(function (e) {
            e.stopPropagation();
            e.preventDefault();
            var value = $(this).val();
            // console.log('click');
            _this.send(value);
            return true;
        });

    };

    suggest.prototype.build = function () {
        this._body = $('.bq_suggest');
        if (boqii.utils.IsNotEmpty(this.options.css)) this._body.addClass(this.options.css);
    };

    suggest.prototype.show = function () {
        if (this._body) this._body.removeClass('none');
    };

    suggest.prototype.hide = function () {
        if (this._body) this._body.addClass('none');
    };

    suggest.prototype.clear = function () {
        if (this._body) this._body.empty();
    };

    suggest.prototype.send = function (word) {
        if (word == '') {
            this._word = '';
            this.hide();
            return;
        }
        if (word == this._word) {
            if (this._body.find('a').length > 0) {
                this.show();
            }
            return;
        }
        this._word = word;
        var _this = this;
        boqii.ajax.postJsonp(boqii.config.suggest_url, {
            'word': word
        }, function (data) {
            // 解析base64
            data = boqii.base64.decode(data);
            if(boqii.utils.IsNotEmpty(data)) data = $.parseJSON(data);
            if (boqii.utils.IsNull(data) || data.length == 0) {
                return;
            }
            _this.clear();
            $.each(data, function (i, a) {
                var _html = $('<a href="' + a.url + '" target="_blank">' + a.name + '</a>');
                _html.click(function (e) {
                    _this.hide();
                });
                _html.appendTo(_this._body);
            });
            _this.show();
        }, function (msg) {
            _this.hide();
        });
    };
    boqii.tool.AutoSuggest = suggest;
    boqii.tool.SuggestInit = function (wordElem, options) {
        return new boqii.tool.AutoSuggest(wordElem, options);
    };
    /* 数据搜索对象 */
    var submit = function (formElem, wordElem, options) {
        this._form = $(formElem);
        if (this._form.length == 0) return null;
        this._word = $(wordElem);
        //this._value = this._word.val();
        this._value = '请输入商品名称';
        var defaults = {
            'cid': 0, // 分类ID
            'bid': 0, // 品牌ID
            'aid': 0 // 规格、属性
        };
        this.options = $.extend(defaults, options || {});
        this.bind();
    };

    submit.prototype.getWord = function () {
        if (this._word.length == 0) '';
        var word = this._word.val();
        if(word == this._value) word = '';
        word = boqii.utils.Trim(word);
        return word;
    };

    submit.prototype.buildUrl = function (word) {
        word = word.replace('/', '');
        word = word.replace(/\+/g, "%2B");
        word = word.replace(/[&]/g, "%26");
        word = word.replace(/\*/g, "");
        word = boqii.utils.Trim(word);
        word = word.replace(/[ ]/g, "+");

        var host = '';
        try {
            //静态专题域名兼容性处理 zhuanti.boqii.com
            host = window.location.host.toLowerCase();
            var domain = host.substr(0, host.indexOf('.'));
            if (domain.indexOf('zhuanti') == 0) {
                host = host.replace('zhuanti', 'shop');
            }
        } catch (e) {
        }
        // 修改关键词提交地址
        /*
        var url = 'http://' + host + '/';
        url += 'list-';
        url += this.options.cid + '-';
        url += this.options.bid + '-';
        url += this.options.aid + '-';
        url += '0-';
        url += encodeURIComponent(word) + '.html';
        */
        var url = 'http://' + host + '/search';
        url += '?keyword=' + encodeURIComponent(word);
        if(boqii.utils.IsNotEmpty(this.options.cid)){
            url += '&cid=' + this.options.cid;
        }else{
            url += '&cid=0';
        }
        if(boqii.utils.IsNotEmpty(this.options.bid)){
            url += '&bid=' + this.options.bid;
        }else{
            url += '&bid=0';
        }
        if(boqii.utils.IsNotEmpty(this.options.aid)){
            url += '&aid=' + this.options.aid;
        }else{
            url += '&aid=0';
        }
        return url;
    };

    submit.prototype.bind = function () {
        var _this = this;
        this._form.submit(function () {
            var word = _this.getWord();
            if (word == '') {
                AlertDialog('请输入您要找的商品关键词!', null);
                return false;
            }
            window.location.href = _this.buildUrl(word);
            return false;
        });
    };
    boqii.tool.SearchSubmit = submit;
    boqii.tool.SubmitInit = function (formElem, wordElem, options) {
        return new boqii.tool.SearchSubmit(formElem, wordElem, options);
    }
    /* 图片懒加载 */
    // 获取最顶层位置
    boqii.tool.ImageGetTopPoint = function(obj){
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
    }

    boqii.tool.ImageLazyInit = function () {
        // 缓存图片位置
        $('img[data-original]').each(function(){
            var _this = $(this);
            _this.attr('y', boqii.tool.ImageGetTopPoint(_this));
        });
        // 缓存异步图片列表
        $(window).scroll(function(){
            var imgs = $('img[data-original]');
            if(imgs.length==0) return;
            // 获取当前窗口高度
            var winTop = boqii.utils.GetScrollTop() + boqii.utils.GetWindowHeight();
            imgs.each(function(){
                var _this = $(this);
                var _y = $(this).attr('y');
                if(_y==undefined || _y<=winTop){
                    var _src = _this.attr('data-original');
                    _this.attr('src', _src).removeAttr('data-original').removeAttr('y');
                }
            });
        }).trigger('scroll');
    };
    /* 设为首页 */
    boqii.tool.SetHome = function(obj, url, elem){
        var _elem = $(elem);
        if(_elem.length>0){
            _elem.click(function(){
                boqii.tool.SetHome(this, url, null);
            });
            return;
        }
        try{
            obj.style.behavior='url(#default#homepage)';
            obj.setHomePage(url);
        }catch(e){
            if(window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                }catch (e) {
                    alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage', url);
            }else{
                alert("您的浏览器不支持，请按照下面步骤操作：\n1.打开浏览器设置。\n2.点击设置网页。\n3.输入："+url+"点击确定。");
            }
        }
    };
    /* 加入收藏夹 */
    boqii.tool.AddFavorite = function(url, title, elem){
        var _elem = $(elem);
        if(_elem.length>0){
            _elem.click(function(){
                boqii.tool.AddFavorite(url, title, null);
            });
            return;
        }
        try{
            window.external.addFavorite(url, title);
        }catch(e){
            try
            {
                window.sidebar.addPanel(title, url, '');
            }catch(e){
                alert("加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    };
})(jQuery);
(function($){
    if(typeof window.setTab == 'undefined'){
        window.setTab = function(name, cursel, n) {
            for (i = 1; i <= n; i++) {
                var menu = document.getElementById(name + i);
                var con = document.getElementById("con_" + name + "_" + i);
                menu.className = i == cursel ? "hover" : "";
                con.style.display = i == cursel ? "block" : "none";
            }
        };
    }
})(jQuery);
/* AutoImageBox */
(function($){
    if (typeof boqii.tool == 'undefined') boqii.tool = {};
    var AutoImageBox = function(options){
        var defaultOptions = {
            'container' : '.ImageBoxPanel',
            'autoTime' : 2000,
            'autoType' : 'left',
            'animateTime' : 300,
            'leftButton' : '',
            'rightButton' : ''
        };
        this.options = $.extend(defaultOptions, options || {});
        this.panel = $(this.options.container);
        if(this.panel.length==0) return;

        this.autoId = 0;
        this.animateFlag = false;
        this.panelWidth = this.panel.width();
        this.itemPanel = this.panel.find('ul');
        this.items = this.itemPanel.find('li');
        this.itemLen = this.items.length;
        this.itemWidth = this.items.width();
        this.itemHeight = this.items.height();
        this.itemPanelWidth = this.itemLen * this.itemWidth;
        this.posLeft = -this.itemPanelWidth;
        // 如果项目数量不足以循环展示，则忽略
        if(this.panelWidth > this.itemPanelWidth) return;
        this.init();
        this.bind();
        this.auto();
    };

    AutoImageBox.prototype.init = function(){
        this.itemPanel.css({
            'position' : 'absolute',
            'left' : '0px',
            'top' : '0px',
            'overflow' : 'hidden',
            'width' : this.itemPanelWidth + 'px',
            'height' : this.itemHeight + 'px'
        });
        // 支援无限滚动
        this.itemPanel.css({
            'width' : this.itemPanelWidth*3 + 'px',
            'left' : -this.itemPanelWidth + 'px'
        });
        this.items.clone().prependTo(this.itemPanel);
        this.items.clone().appendTo(this.itemPanel);
    };

    AutoImageBox.prototype.animate = function(type, fn){
        if(this.animateFlag) return;
        this.animateFlag = true;
        if(type=='left'){
            this.posLeft = this.posLeft - this.itemWidth;
        }else{
            this.posLeft = this.posLeft + this.itemWidth;
        }
        if(this.posLeft>0 || Math.abs(this.posLeft)>(this.itemPanelWidth*2)){
            this.posLeft = -this.itemPanelWidth;
            this.itemPanel.css('left', this.posLeft+'px');
            if(type=='left'){
                this.posLeft = this.posLeft - this.itemWidth;
            }else{
                this.posLeft = this.posLeft + this.itemWidth;
            }
        }
        var _this = this;
        this.itemPanel.animate({
            'left' : this.posLeft + 'px'
        }, this.options.animateTime, function(){
            _this.animateFlag = false;
            if(fn) fn();
        });
    };

    AutoImageBox.prototype.auto = function(){
        var _this = this;
        this.autoId = window.setTimeout(function(){
            _this.animate(_this.options.autoType);
            _this.auto();
        }, this.options.autoTime);
    };

    AutoImageBox.prototype.stop = function(){
        window.clearTimeout(this.autoId);
        this.autoId = 0;
    };

    AutoImageBox.prototype.bind = function(){
        var _this = this;
        this.panel.mouseenter(function(){
            _this.stop();
        }).mouseleave(function(){
            _this.auto();
        });

        $(this.options.leftButton).click(function(){
            _this.stop();
            _this.animate('left');
        });

        $(this.options.rightButton).click(function(){
            _this.stop();
            _this.animate('right');
        });
    };
    boqii.tool.AutoImageBox = AutoImageBox;
})(jQuery);




