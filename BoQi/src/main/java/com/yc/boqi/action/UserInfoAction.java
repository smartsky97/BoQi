package com.yc.boqi.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.UserInfoService;
import com.yc.boqi.util.AllSessions;

@Controller("userInfoAction")
public class UserInfoAction implements ModelDriven<UserInfo>, SessionAware {
	private UserInfo userInfo;
	private Map<String, Object> session;
	private List<UserInfo> rows;
	private double ordersum;

	public void setOrdersum(double ordersum) {
		this.ordersum = ordersum;
	}

	@Autowired
	private UserInfoService userInfoService;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public UserInfo getModel() {
		userInfo = new UserInfo();
		return userInfo;
	}

	public String login(){
		userInfo=userInfoService.login(userInfo);
		if(userInfo!=null){
			session.put(AllSessions.LOGIN_USER, userInfo);
			System.out.println("登录成功！用户为=="+userInfo);
			String paypwd=userInfo.getPaypwd();
			System.out.println(userInfo.getPaypwd());
			session.put("paypwd", paypwd);
			return "index";
		}
		System.out.println("登录失败！");
		return "login";
	}

	public String register() {
		System.out.println(userInfo.getEmail());
		System.out.println(userInfo.getRegisterpwd());
		System.out.println(userInfo.getUname());
		int reg = userInfoService.register(userInfo);

		System.out.println(reg);
		return "registerSuccess";
	}

	public String getUserInfo() {
		String page = ServletActionContext.getRequest().getParameter("page");
		String row = ServletActionContext.getRequest().getParameter("rows");
		System.out.println(page + "=============" + row);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("one", Integer.valueOf(page) * Integer.valueOf(row));
		map.put("two", (Integer.valueOf(page) - 1) * Integer.valueOf(row));
		System.out.println(map);
		rows = userInfoService.getPageUsers(map);
		int total = userInfoService.getUserTotal();
		return "pageUserInfo";
	}

	public String getUserByUsid() {
		String usid = ServletActionContext.getRequest().getParameter("usid");
		userInfo = userInfoService.getUserByUsid(Integer.valueOf(usid));
		System.out.println(userInfo);
		return "getUserByid";
	}

	public List<UserInfo> getRows() {
		return rows;
	}

	public UserInfo getUser() {
		return userInfo;
	}

	public String getUserByInfo() {
		String uname = ServletActionContext.getRequest().getParameter("uname");
		if (uname == "") {
			uname = null;
		}
		String email = ServletActionContext.getRequest().getParameter("email");
		if (email == "") {
			email = null;
		}
		String status = ServletActionContext.getRequest()
				.getParameter("status");
		String page = ServletActionContext.getRequest().getParameter("page");
		String row = ServletActionContext.getRequest().getParameter("rows");
		Object obj;
		if (status != "") {
			obj = Integer.valueOf(status);
		} else {
			obj = null;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uname", uname);
		map.put("email", email);
		map.put("status", obj);
		map.put("one", Integer.valueOf(page) * Integer.valueOf(row));
		map.put("two", (Integer.valueOf(page) - 1) * Integer.valueOf(row));
		rows = userInfoService.findUserByInfo(map);
		System.out.println(map);
		return "selectUsers";
	}

	// 使用余额支付
	public String updatemoney() {
		System.out.println("us:"+userInfo.getUsid()+" -mo:"+ordersum+" -or:"+userInfo.getOrderid());
		int data = userInfoService.updateyue(userInfo.getUsid(),ordersum,userInfo.getOrderid());
		if (data > 0) {
			System.out.println("余额更新成功！！");
			return "yuemsg";
		} else {
			System.out.println("余额更新失败！！");
			return "bank";
		}
	}
}
