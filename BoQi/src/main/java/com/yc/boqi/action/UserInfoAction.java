package com.yc.boqi.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.UserInfoService;
import com.yc.boqi.util.AllSessions;

@Controller("userInfoAction")
public class UserInfoAction implements ModelDriven<UserInfo>, SessionAware{
		private UserInfo userInfo;
		private Map<String, Object> session;
	
		
		@Autowired
		private UserInfoService userInfoService;
		@Override
		public void setSession(Map<String, Object> session) {
			this.session=session;
		}
		
		@Override
		public UserInfo getModel() {
			userInfo=new UserInfo();
			return userInfo;
		}
		
		public String login(){
			userInfo=userInfoService.login(userInfo);
			if(userInfo!=null){
				session.put(AllSessions.LOGIN_USER, userInfo);
				System.out.println("登录成功！用户为=="+userInfo);
				return "index";
			}
			System.out.println("登录失败！");
			return "login";
		}
		
		public String register(){
			System.out.println(userInfo.getEmail());
			System.out.println(userInfo.getRegisterpwd());
			System.out.println(userInfo.getUname());
			int reg=userInfoService.register(userInfo);
			
			System.out.println(reg);
			return "registerSuccess";
		}
}
