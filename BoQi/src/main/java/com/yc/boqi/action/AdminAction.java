package com.yc.boqi.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.Admin;
import com.yc.boqi.service.AdminService;
import com.yc.boqi.util.AllSessions;
@Controller
public class AdminAction implements ModelDriven<Admin>,ServletRequestAware{
	private Admin admin;
	private HttpServletRequest requset;
	@Autowired
	private AdminService adminService;
	private String cc;//验证码校验
	private int map;
	public int getMap() {
		return map;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	@Override
	public Admin getModel() {
		admin = new Admin();
		return admin;
	}
	//后台管理员登录
	public String AdminLogin(){
		String ss = (String) requset.getSession().getAttribute("rand");
		Admin admina = adminService.AdminLogin(admin);
		if(admina != null){
			requset.getSession().setAttribute(AllSessions.LOGIN_ADMIN, admina);
			if(ss.equals(cc)){
				map = 1;
			}else{
				map = 2;
			}
		}else{
			map = 0;
		}
		return "map";
	}
	@Override
	public void setServletRequest(HttpServletRequest requset) {
		this.requset = requset;
	}
}
