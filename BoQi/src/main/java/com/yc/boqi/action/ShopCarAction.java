package com.yc.boqi.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.BqAdmin;
import com.yc.boqi.entity.ShopCar;
import com.yc.boqi.entity.ShopCarBean;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.ShopCarService;
import com.yc.boqi.util.AllSessions;

@Controller
public class ShopCarAction implements ModelDriven<ShopCar>,ServletRequestAware{
	@Autowired
	private ShopCarService shopCarService;
	private ShopCar shopCar;
	private HttpServletRequest requset;
	private UserInfo user;
	
	private String song;
	public void setSong(String song) {
		this.song = song;
	}

	@Override
	public ShopCar getModel() {
		shopCar = new ShopCar();
		return shopCar;
	}

	@Override
	public void setServletRequest(HttpServletRequest requset) {
		this.requset = requset;
	}

	public void shopcar(){
		user = (UserInfo) requset.getSession().getAttribute("loginUser");
		if(shopCarService.checkIfSave(shopCar.getProid(), user.getUsid())){
			shopCarService.addAInfo(shopCar.getProid(), user.getUsid(), shopCar.getInventory());
		}
		requset.getSession().setAttribute(AllSessions.AllShOPCARINFO, shopCarService.findAllInfo(user.getUsid()));
	}
	
	public void saveshopcar(){
		String songs = song;
		requset.getSession().removeAttribute("shopinfo");
		requset.getSession().setAttribute(AllSessions.SHOPCAR, songs);
	}
}
