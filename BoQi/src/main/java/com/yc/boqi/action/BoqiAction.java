
package com.yc.boqi.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

@Controller
public class BoqiAction{
	//主页的跳转
	public String index(){
		return "index";
	}
	//跳转到波奇商城页面
	public String shoppingindex(){
		
		return "shoppingindex";
	}
	
}