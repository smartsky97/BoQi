package com.yc.boqi.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yc.boqi.entity.Brand;
import com.yc.boqi.service.BrandService;

@Controller
public class BrandAction implements ServletRequestAware{
	private HttpServletRequest request;
	JsonObject jb = new JsonObject();
	JsonParser parser = new JsonParser();
	@Autowired
	private BrandService brandService;
	//后台获取所有品牌信息
	public void getPageBrandInfo(){
		String page = request.getParameter("page");
		String row = request.getParameter("rows");
		
		List<Brand> rows = brandService.find(Integer.parseInt(page),Integer.parseInt(row));
		int total = brandService.total();
		System.out.println(page+" - "+rows);
		Gson gson = new Gson();
		
		jb.addProperty("total", total);
		jb.add("rows", parser.parse(gson.toJson(rows)));
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jb);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}