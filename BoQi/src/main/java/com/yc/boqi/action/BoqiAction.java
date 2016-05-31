
package com.yc.boqi.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.boqi.entity.Address;
import com.yc.boqi.entity.IndexProductBean;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.AddressService;
import com.yc.boqi.service.ProductinfoService;
import com.yc.boqi.util.AllSessions;

@Controller
public class BoqiAction implements ServletRequestAware,SessionAware{
	@Autowired
	private AddressService addressService;
	@Autowired
	private ProductinfoService productinfoService;
	private List<Address> adds;
	private HttpServletRequest request;
	private Map<String, Object> session;
	//主页的跳转
	public String index(){
		List<IndexProductBean> indexProductBeans = productinfoService.findIndexDogPro();
		if (indexProductBeans != null) {
			session.put("indexProductBeans", indexProductBeans);
			System.out.println("查询到了狗的信息！！！！" + indexProductBeans);
			index2();
			index3();
			return "index";
		}
		System.out.println("查询失败！");
		index2();
		return "failure";
	}
	public String index2(){
		List<IndexProductBean> indexProductBeans2 = productinfoService.findIndexCatPro();
		if (indexProductBeans2 != null) {
			session.put("indexProductBeans2", indexProductBeans2);
			System.out.println("查询到了猫的信息！！！！" + indexProductBeans2);
			return "index";
		}
		System.out.println("查询失败！");
		return "failure";
	}
	
	public String index3(){
		List<IndexProductBean> indexProductBeans3 = productinfoService.findIndexsmallPro();
		if (indexProductBeans3 != null) {
			session.put("indexProductBeans3", indexProductBeans3);
			System.out.println("查询到了小宠的信息！！！！" + indexProductBeans3);
			return "index";
		}
		System.out.println("查询失败！");
		return "failure";
		
	}
	//跳转到波奇商城页面
	public String shoppingindex(){
		return "shoppingindex";
	}
	//跳转到波购物车
	public String shopcar(){
		return "shopcar";
	}
	
	public String paymoney(){
		//获取地址信息
		UserInfo user = (UserInfo) request.getSession().getAttribute(AllSessions.LOGIN_USER);
		System.out.println("用户Id:"+user.getUsid());
		adds = addressService.findByUsid(user.getUsid());
		request.getSession().setAttribute(AllSessions.ADDRESSBYUSID, adds);
		return "paymoney";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}