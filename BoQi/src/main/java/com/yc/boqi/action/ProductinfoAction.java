package com.yc.boqi.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.FirstMenu;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.ProductinfoBean;
import com.yc.boqi.entity.SecondMenu;
import com.yc.boqi.entity.Top8ProductinfoBean;
import com.yc.boqi.service.BrandService;
import com.yc.boqi.service.FirstMenuService;
import com.yc.boqi.service.ProductinfoService;
import com.yc.boqi.service.SecondMenuService;
import com.yc.boqi.util.AllSessions;
@Controller
public class ProductinfoAction implements ServletRequestAware,ServletResponseAware,ModelDriven<ProductinfoBean>{
	private HttpServletRequest request;
	private HttpServletResponse response;
	private ProductinfoBean productinfo;
	public ProductinfoBean getProductinfo() {
		return productinfo;
	}
	@Autowired
	private ProductinfoService productinfoService;
	@Autowired
	private FirstMenuService firstMenuService;
	@Autowired
	private SecondMenuService secondMenuService;
	@Autowired
	private BrandService brandService;
	private List<Top8ProductinfoBean> productinfos;//前台的数据获取
	private List<Productinfo> natureo;
	public List<Productinfo> getNatureo() {
		return natureo;
	}
	JsonObject jb = new JsonObject();
	JsonParser parser = new JsonParser();
	Gson gson = new Gson();
	PrintWriter out;
	private String flag;
	public String getFlag() {
		return flag;
	}
	//图片上传
	private File[] pictrues;//上传文件
	private String[] pictruesFileName;//上传文件名
	private String[] pictruesContentType;//上传文件类型
	
	
	public File[] getPictrues() {
		return pictrues;
	}

	public void setPictrues(File[] pictrues) {
		this.pictrues = pictrues;
	}

	public String[] getPictruesFileName() {
		return pictruesFileName;
	}

	public void setPictruesFileName(String[] pictruesFileName) {
		this.pictruesFileName = pictruesFileName;
	}

	public String[] getPictruesContentType() {
		return pictruesContentType;
	}

	public void setPictruesContentType(String[] pictruesContentType) {
		this.pictruesContentType = pictruesContentType;
	}

	public List<Top8ProductinfoBean> getProductinfos() {
		return productinfos;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	@Override
	public ProductinfoBean getModel() {
		productinfo = new ProductinfoBean();
		return productinfo;
	}

	//获取每个类型的前8个商品
	public String GetTop8(){
		productinfos = productinfoService.GetTop8();
		return "GetTop";
	}
	//获取后台狗狗商品信息
	public void getPageDogProInfo(){
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		
		List<Productinfo> dogs = productinfoService.findTypePro(Integer.parseInt(page),Integer.parseInt(rows),"狗");
		int total = productinfoService.findTypeNum("狗");
		
		jb.addProperty("total", total);
		jb.add("rows", parser.parse(gson.toJson(dogs)));
		
		
		List<Brand> brand=brandService.findAllBrand();
		List<FirstMenu> fir= firstMenuService.findFirInfo("狗");
		List<SecondMenu> sec = secondMenuService.findProType("狗");
		jb.add("brand", parser.parse(gson.toJson(brand)));
		jb.add("fir", parser.parse(gson.toJson(fir)));
		jb.add("type", parser.parse(gson.toJson(sec)));
		
		PrintWriter out;
		response.setCharacterEncoding("utf-8");
		try {
			out = response.getWriter();
			out.println(jb);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//添加商品
	public void AddProduction(){
		String path =ServletActionContext.getServletContext().getRealPath("upload/");
        System.out.println("上传的地址："+path);
        //图片拼接
        String picture="";
	    for(int i = 0;i<pictrues.length;i++) {
    		//要使用绝对地址
    		try {			
    			FileUtils.copyFile(pictrues[i], new File(path+"/"+pictruesFileName[i]));//开始上传
    			//为了方便多次测试，把上传到服务器的文件中，在工程中也传一份，开发完成后在删除
    			FileUtils.copyFile(pictrues[i], new File("D:\\pictrues"+"/"+pictruesFileName[i]));//开始上传
    			System.out.println("上传成功！");
    			
    			
    		} catch (IOException e) {
    			System.out.println("上传失败！");
    			e.printStackTrace(); 
    		}
	    }
	    if(pictruesFileName.length==1){
	    	picture = pictruesFileName[0];
	    }else if(pictruesFileName.length>1){
		    for(String as:pictruesFileName){
		    	picture += as+",";
		    }
		    picture = picture.substring(0, picture.length()-1);
	    }
	    System.out.println("pp:"+picture);
	    productinfo.setPictrue(picture);
	    productinfo.setSuitpet("狗");
	    productinfoService.addProduct(productinfo);
	}
	//后台查询商品获取数据
	public String getProductInfo(){
		productinfo = productinfoService.findProById(productinfo.getProid());
		return "productinfo";
	}

	public String product(){
		Productinfo pro = productinfoService.findAproduct(productinfo.getProid());
		request.getSession().setAttribute(AllSessions.PRODUCT_ONE, pro);
		return "product";
	}
	//后台修改订单
	public String changeproducttt(){
		String path =ServletActionContext.getServletContext().getRealPath("upload/");
		System.out.println("-->"+productinfo);
		String picture="";
		if(pictruesFileName!=null){
			for(int i = 0;i<pictrues.length;i++) {
	    		//要使用绝对地址
	    		try {			
	    			FileUtils.copyFile(pictrues[i], new File(path+"/"+pictruesFileName[i]));//开始上传
	    			//为了方便多次测试，把上传到服务器的文件中，在工程中也传一份，开发完成后在删除
	    			FileUtils.copyFile(pictrues[i], new File("D:\\pictrues"+"/"+pictruesFileName[i]));//开始上传
	    			System.out.println("上传成功！");
	    		} catch (IOException e) {
	    			System.out.println("上传失败！");
	    			e.printStackTrace(); 
	    		}
		    }
			if(pictruesFileName.length==1){
		    	picture = pictruesFileName[0];
		    }else if(pictruesFileName.length>1){
			    for(String as:pictruesFileName){
			    	picture += as+",";
			    }
			    picture = picture.substring(0, picture.length()-1);
		    }
		    productinfo.setPictrue(picture);
		}
		flag=productinfoService.updateProduct(productinfo);
		return "flag";
	}

	//后台获取商品属性
	public String getNatureByName(){
		natureo = productinfoService.findNatureByName(productinfo.getProname());
		return "natureo";
	}
	//后台根据商品名和属性来查询商品价格
	public String getPriceByNaNa(){
		natureo = productinfoService.findPriceByNaNa(productinfo.getProname(), productinfo.getNature());
		return "natureo";
	}
	//后台根据商品编号查询商品的信息
	public String findProByProid(){
		productinfo = productinfoService.findProById(productinfo.getProid());
		return "productinfo";
	}
	
}