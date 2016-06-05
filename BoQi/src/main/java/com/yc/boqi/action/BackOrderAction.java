package com.yc.boqi.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.BackOrderContentBean;
import com.yc.boqi.service.OrdercontentService;
@Controller
public class BackOrderAction implements ModelDriven<BackOrderContentBean>,ServletRequestAware{
	private HttpServletRequest request;
	private BackOrderContentBean backOrderContentBean;
	@Autowired
	private OrdercontentService ordercontentService;
	private String allString;//后台需要修改的信息拼接
	
	public void setAllString(String allString) {
		this.allString = allString;
	}

	public BackOrderContentBean getBackOrderContentBean() {
		return backOrderContentBean;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public BackOrderContentBean getModel() {
		backOrderContentBean = new BackOrderContentBean();
		return backOrderContentBean;
	}
	//后台订单的信息
	public String findBackOrderContent(){
		backOrderContentBean = ordercontentService.findOneBackOrder(backOrderContentBean.getOrderid());
		return "backOrderContentBean";
	}
	//后台订单的修改
	public String updateBackOrder(){
		System.out.println("拼接信息："+allString+"  -bean:"+backOrderContentBean);
		
		return "sus";
	}
	
}
