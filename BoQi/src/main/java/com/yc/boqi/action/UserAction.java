package com.yc.boqi.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.UserService;

@Controller("userAction")
public class UserAction implements SessionAware{
	private Map<String,Object> session;
	
	private List<UserInfo> rows;
	private UserInfo user;



	@Autowired
	private UserService userService;
	
	public String getUserInfo(){
		String page=ServletActionContext.getRequest().getParameter("page");
		String row=ServletActionContext.getRequest().getParameter("rows");
		System.out.println(page+"============="+row);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("one", Integer.valueOf(page)*Integer.valueOf(row));
		map.put("two", (Integer.valueOf(page)-1)*Integer.valueOf(row));
		System.out.println(map);
		rows=userService.getPageUsers(map);
		int total=userService.getUserTotal();
		return "pageUserInfo";
	}
	public String getUserByUsid(){
		String usid=ServletActionContext.getRequest().getParameter("usid");
		user=userService.getUserByUsid(Integer.valueOf(usid));
		System.out.println(user);
		return "getUserByid";
	}
	
	
	public List<UserInfo> getRows() {
		return rows;
	}

	
	public UserInfo getUser() {
		return user;
	}
	public String getUserByInfo(){
		String uname=ServletActionContext.getRequest().getParameter("uname");	
		if(uname==""){
			uname=null;
		}
		String email=ServletActionContext.getRequest().getParameter("email");
		if(email==""){
			email=null;
		}
		String status=ServletActionContext.getRequest().getParameter("status");
		String page=ServletActionContext.getRequest().getParameter("page");
		String row=ServletActionContext.getRequest().getParameter("rows");
		Object obj;
		if(status!=""){
			obj=Integer.valueOf(status);
		}else{
			obj=null;
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uname", uname);
		map.put("email", email);
		map.put("status",obj);
		map.put("one", Integer.valueOf(page)*Integer.valueOf(row));
		map.put("two", (Integer.valueOf(page)-1)*Integer.valueOf(row));
		rows=userService.findUserByInfo(map);
		System.out.println(map);
		return "selectUsers";
	}



	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
}
