
package com.yc.boqi.action;

import org.springframework.stereotype.Controller;

@Controller
public class BoqiAction {
	//主页的跳转
	public String index(){
		return "index";
	}
	//跳转到波奇商城页面
	public String shoppingindex(){
		//在跳转之前，先把要获取的数据存到session中
		
		return "shoppingindex";
	}
	
}