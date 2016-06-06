package com.yc.boqi.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.BackOrderContentBean;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.OrdercontentService;
import com.yc.boqi.util.AllSessions;
@Controller
public class BackOrderAction implements ModelDriven<BackOrderContentBean>,ServletRequestAware{
	private HttpServletRequest request;
	private BackOrderContentBean backOrderContentBean;
	private UserInfo user;
	private int sta;//判断修改是否成功
	public int getSta() {
		return sta;
	}
	@Autowired
	private OrdercontentService ordercontentService;
	private String allString;//后台需要修改的信息拼接
	private int ifAddAddress;//判断是否添加新地址  0:不加  1:加
	
	public void setIfAddAddress(int ifAddAddress) {
		this.ifAddAddress = ifAddAddress;
	}

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
		System.out.println("用户Id:"+backOrderContentBean.getUsid());
		sta = ordercontentService.updateOrderByAddress(allString, backOrderContentBean, ifAddAddress);
		return "updatebackorder";
	}
	
}
