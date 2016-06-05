package com.yc.boqi.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.JasonObject;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.mapper.ProductinfoMapper;
import com.yc.boqi.service.BrandService;
import com.yc.boqi.service.ProductinfoService;

@Controller("proSearchAction")
public class ProSearchAction implements SessionAware,RequestAware{
	private Map<String,Object> session;
	private Map<String,Object> request;
	private JasonObject<Productinfo> jasonObject;
	private String info;
	private String order;
	private int pageNo;
	@Autowired
	private ProductinfoService productinfoService;
	@Autowired
	private BrandService brandService;
	
	

	public String findSearchPro(){
			
		order=ServletActionContext.getRequest().getParameter("order");
		info=ServletActionContext.getRequest().getParameter("ci");
		String ye=ServletActionContext.getRequest().getParameter("ye");
		int pageNo=Integer.valueOf(ye);
		System.out.println(order+info+pageNo+"--------------------");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("order", order);
		map.put("info", info);
		map.put("one", pageNo*20);
		map.put("two", (pageNo-1)*20);
		List<Brand> brand=brandService.findAllBrand();
		List<Productinfo> list=productinfoService.searchPro(map);
		session.put("getSearch", list);
		session.put("allpinpai", brand);
		session.put("searchTotal",list.size());
		session.put("thisPage",1);
		return "searchPro";
	}
	public String findPagePro(){
		String ye=ServletActionContext.getRequest().getParameter("ye");
		pageNo=Integer.valueOf(ye);
		if(pageNo<1){
			pageNo=1;
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("order", order);
		map.put("info", info);
		map.put("one", pageNo*20);
		map.put("two", (pageNo-1)*20);
		List<Brand> brand=brandService.findAllBrand();
		List<Productinfo> list=productinfoService.searchPro(map);
		session.put("getSearch", list);
		session.put("allpinpai", brand);
		session.put("searchTotal",list.size());
		session.put("thisPage",pageNo);
		return "searchPro";
	}
	public String findOrderPro(){
		String order=ServletActionContext.getRequest().getParameter("order");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("order", order);
		map.put("info", info);
		map.put("one", pageNo*20);
		map.put("two", (pageNo-1)*20);
		List<Brand> brand=brandService.findAllBrand();
		List<Productinfo> list=productinfoService.searchPro(map);
		session.put("getSearch", list);
		session.put("allpinpai", brand);
		session.put("searchTotal",list.size());
		return "searchPro";
	}
	public void test(){
		order=ServletActionContext.getRequest().getParameter("order");
		info=ServletActionContext.getRequest().getParameter("ci");
		String ye=ServletActionContext.getRequest().getParameter("ye");
		pageNo=Integer.valueOf(ye);
		System.out.println(order+info+pageNo);
		
	}
	
	public JasonObject getJasonObject() {
		return jasonObject;
	}

	public void setJasonObject(JasonObject jasonObject) {
		this.jasonObject = jasonObject;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}
}
