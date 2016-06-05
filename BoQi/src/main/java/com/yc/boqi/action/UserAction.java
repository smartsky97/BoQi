package com.yc.boqi.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.UserInfoService;
import com.yc.boqi.util.AllSessions;



@Controller("userAction")
public class UserAction implements ModelDriven<UserInfo>,SessionAware{
	private UserInfo userInfo;
	private int orderid;
	private String email;
	private List<UserInfo> rows;

	public String getEmail() {
		return email;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	@Autowired
	private UserInfoService userInfoService;
	
	private Map<String,Object> session;
	
	/**
	 * 注册
	 * @shawn
	 */
	public String register(){
		System.out.println(userInfo.getEmail());
		System.out.println(userInfo.getRegisterpwd());
		System.out.println(userInfo.getUname());
		userInfo.setPaypwd(userInfo.getRegisterpwd());
		if(userInfo.getYanzheng()==session.get("yanzheng")){
			int reg=userInfoService.register(userInfo);
			System.out.println(reg);
			return "registerSuccess";
		}
		return null;
		
	}
	
	/**
	* 个人主页信息查询
	* @shawn
	*/
	public String userInfo(){
		userInfo.setUsid(1001);
		List<UserInfo> userInf=userInfoService.getUserInfo(userInfo.getUsid());
		session.put("grzyUserInfo", userInf);
		List<OrderForm> orderInfo=userInfoService.getOrderInfo(userInfo.getUsid());
		session.put("grzyOrderInfo", orderInfo);
		int weizhifunum=userInfoService.getwzfNum();
		session.put("weizhifu", weizhifunum);
		int finishnum=userInfoService.getfinish();
		session.put("finish", finishnum);
		int pingjianum=userInfoService.getpingjia();
		session.put("pingjia", pingjianum);
		
		return "getuserInfo";
	}

	public String deleteOrder(){
		int del=userInfoService.deleteOrder(orderid);
		if(del>0){
			System.out.println("删除订单成功...");
		}
		userInfo();
		return "redirectMyBoQi";
		
	}
	//注销
	public String loginOut() {
		session.put("loginUser","");
		System.out.println(AllSessions.LOGIN_USER);
		System.out.println(session.get("loginUser"));
		System.out.println("注销成功...");
		return "index";
	}

	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}


	@Override
	public UserInfo getModel() {
		userInfo=new UserInfo();
		return userInfo;
	}
}
