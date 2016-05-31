package com.yc.boqi.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.pojava.datetime.DateTime;
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
	private DateTime dateTime = new DateTime();
	@Autowired
	private OrdercontentService ordercontentService;
	private String orders;
	private List<OrderContent> ords;
	public List<OrderContent> getOrds() {
		return ords;
	}
	public void setOrders(String orders) {
		this.orders = orders;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	//提交一个订单
	public String uploadorder(){
		UserInfo user = (UserInfo) request.getSession().getAttribute(AllSessions.LOGIN_USER);
		orderContent.setUsid(user.getUsid());
		orderContent.setStarttime(dateTime.toString("yyyy-MM-dd HH:mm:ss"));
		ordercontentService.addOrder(orderContent,orders);
		return "paymoney";
	}
	//后台查询所有的订单
	public String findAllOrders(){
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		
		ords = ordercontentService.findAll(Integer.parseInt(page),Integer.parseInt(rows));
		System.out.println("订单："+ords);
		return "findAllOrder";
	}
	@Override
	public OrderContent getModel() {
		orderContent = new OrderContent();
		return orderContent;
	}

}
