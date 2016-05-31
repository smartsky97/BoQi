package com.yc.boqi.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.OrderContent;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.OrdercontentService;
import com.yc.boqi.util.AllSessions;

@Controller
public class OrdercontentAction implements ServletRequestAware,ModelDriven<OrderContent>{
	private HttpServletRequest request;
	private OrderContent orderContent;
	@Autowired
	private OrdercontentService ordercontentService;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String uploadorder(){
		UserInfo user = (UserInfo) request.getSession().getAttribute(AllSessions.LOGIN_USER);
		orderContent.setUsid(user.getUsid());
		ordercontentService.addOrder(orderContent);
		return "paymoney";
	}

	@Override
	public OrderContent getModel() {
		orderContent = new OrderContent();
		return orderContent;
	}

}
