package com.yc.boqi.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.Address;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.AddressService;
import com.yc.boqi.util.AllSessions;

@Controller
public class AddressAction implements ModelDriven<Address>,ServletRequestAware{
	private HttpServletRequest request;
	private List<Address> adds;
	private Address address;
	@Autowired
	private AddressService addressService;
	
	public String addOne(){
		addressService.addone(address);
		adds = addressService.findByUsid(address.getUsid());
		request.getSession().setAttribute(AllSessions.ADDRESSBYUSID, adds);
		return "paymoney";
	}
	
	public String showAll(){
		adds = addressService.findByUsidAll(address.getUsid());
		request.getSession().setAttribute(AllSessions.ADDRESSBYUSID, adds);
		return "paymoney";
	}

	@Override
	public Address getModel() {
		this.address = new Address();
		return address;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
