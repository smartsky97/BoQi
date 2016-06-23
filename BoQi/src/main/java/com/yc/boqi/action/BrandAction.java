package com.yc.boqi.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.pojava.datetime.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.BrandBean;
import com.yc.boqi.service.BrandService;

@Controller
public class BrandAction implements ServletRequestAware, ModelDriven<BrandBean> {
	private BrandBean brandBean;
	private HttpServletRequest request;
	JsonObject jb = new JsonObject();
	JsonParser parser = new JsonParser();
	@Autowired
	private BrandService brandService;
	Map<String, Object> map = new HashMap<String, Object>();
	public Map<String, Object> getMap() {
		return map;
	}

	List<BrandBean> rows;
	public List<BrandBean> getRows() {
		return rows;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public BrandBean getModel() {
		brandBean = new BrandBean();
		return brandBean;
	}

	// 后台获取所有品牌信息
	public String getPageBrandInfo() {
		String page = request.getParameter("page");
		String row = request.getParameter("rows");

		rows = brandService.find(Integer.parseInt(page), Integer.parseInt(row));
		return "PageBrandInfo";
	}

	//后台获取品牌销售信息
	public String getPageBrandShowInfo(){
		String page = request.getParameter("page");
		String row = request.getParameter("rows");
		
		rows = brandService.findBrandShowInfo();
		return "PageBrandInfo";
	}
	//后台的详细销售信息，品牌每天的信息
	public String getBrand_sell_info(){
		rows = brandService.findBrandSellInfo(brandBean.getBrandid());
		DateTime dt = new DateTime();
		map.put("brs", rows);
		map.put("nowtime", dt.toString("yyyy-MM-dd"));
		System.out.println("map:"+map);
		return "map";
	}
}
