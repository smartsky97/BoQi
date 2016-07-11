package com.yc.boqi.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

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
	private List<Top8ProductinfoBean> productinfos;//ǰ̨�����ݻ�ȡ
	private List<Productinfo> natureo;
	public List<Productinfo> getNatureo() {
		return natureo;
	}
	JsonObject jb = new JsonObject();
	JsonParser parser = new JsonParser();
	Gson gson = new Gson();
	PrintWriter out;
	private Map<String, Object> map;
	public Map<String, Object> getMap() {
		return map;
	}
	private String xflag;
	public String getXflag() {
		return xflag;
	}
	//ͼƬ�ϴ�
	private File[] pictrues;//�ϴ��ļ�
	private String[] pictruesFileName;//�ϴ��ļ���
	private String[] pictruesContentType;//�ϴ��ļ�����
	
	private File[] prointros;//�ϴ��ļ�
	private String[] prointrosFileName;//�ϴ��ļ���
	private String[] prointrosContentType;//�ϴ��ļ�����
	
	
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

	//��ȡÿ�����͵�ǰ8����Ʒ
	public String GetTop8(){
		productinfos = productinfoService.GetTop8();
		return "GetTop";
	}
	//��ȡ��̨������Ʒ��Ϣ
	public void getPageDogProInfo(){
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		
		List<Productinfo> dogs = productinfoService.findTypePro(Integer.parseInt(page),Integer.parseInt(rows),"��");
		int total = productinfoService.findTypeNum("��");
		
		jb.addProperty("total", total);
		jb.add("rows", parser.parse(gson.toJson(dogs)));
		
		
		List<Brand> brand=brandService.findAllBrand();
		List<FirstMenu> fir= firstMenuService.findFirInfo("��");
		List<SecondMenu> sec = secondMenuService.findProType("��");
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
	//�����Ʒ
	public void AddProduction(){
		String path =ServletActionContext.getServletContext().getRealPath("upload/");
        System.out.println("�ϴ��ĵ�ַ��"+path);
        //ͼƬƴ��
        String picture="";
	    for(int i = 0;i<pictrues.length;i++) {
    		//Ҫʹ�þ��Ե�ַ
    		try {			
    			FileUtils.copyFile(pictrues[i], new File(path+"/"+pictruesFileName[i]));//��ʼ�ϴ�
    			//Ϊ�˷����β��ԣ����ϴ������������ļ��У��ڹ�����Ҳ��һ�ݣ�������ɺ���ɾ��
    			FileUtils.copyFile(pictrues[i], new File("D:\\pictrues"+"/"+pictruesFileName[i]));//��ʼ�ϴ�
    			System.out.println("�ϴ��ɹ���");
    			
    			
    		} catch (IOException e) {
    			System.out.println("�ϴ�ʧ�ܣ�");
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
	    System.out.println("����ͼƬ��"+prointros+prointrosFileName);
	    try {			
			FileUtils.copyFile(prointros[0], new File(path+"/"+prointrosFileName[0]));//��ʼ�ϴ�
			
			System.out.println("�ϴ��ɹ���");
		} catch (IOException e) {
			System.out.println("�ϴ�ʧ�ܣ�");
			e.printStackTrace(); 
		}
	    System.out.println("pp:"+picture);
	    productinfo.setProintro(prointrosFileName[0]);
	    productinfo.setPictrue(picture);
	    productinfo.setSuitpet("��");
	    productinfoService.addProduct(productinfo);
	}
	public File[] getProintros() {
		return prointros;
	}

	public void setProintros(File[] prointros) {
		this.prointros = prointros;
	}

	public String[] getProintrosFileName() {
		return prointrosFileName;
	}

	public void setProintrosFileName(String[] prointrosFileName) {
		this.prointrosFileName = prointrosFileName;
	}

	public String[] getProintrosContentType() {
		return prointrosContentType;
	}

	public void setProintrosContentType(String[] prointrosContentType) {
		this.prointrosContentType = prointrosContentType;
	}

	//��̨��ѯ��Ʒ��ȡ����
	public String getProductInfo(){
		productinfo = productinfoService.findProById(productinfo.getProid());
		return "productinfo";
	}
	//ǰ̨��ȡ��Ʒ����Ϣչʾ
	public String product(){
		Productinfo pro = productinfoService.findAproduct(productinfo.getProid());
		List<ProductinfoBean> buys = productinfoService.getBuersInfo(productinfo.getProid());
		for(ProductinfoBean i:buys){
			String name = i.getUname();
			i.setUname(name.substring(0, 1)+"***"+name.substring(name.length()-2, name.length()-1));
			if(i.getNature().equals("") || i.getNature().equals(null)){
				i.setNature("Ĭ�Ϲ��");
			}
		}
		request.getSession().setAttribute(AllSessions.PRODUCT_ONE, pro);
		request.getSession().setAttribute(AllSessions.PRODUCT_BUTINFO, buys);
		System.out.println("��Ϣ��"+buys);
		return "product";
	}
	//��̨�޸Ķ���
	public String changeproducttt(){
		String path =ServletActionContext.getServletContext().getRealPath("upload/");
		System.out.println("-->"+productinfo);
		String picture="";
		if(pictruesFileName!=null){
			for(int i = 0;i<pictrues.length;i++) {
	    		//Ҫʹ�þ��Ե�ַ
	    		try {			
	    			FileUtils.copyFile(pictrues[i], new File(path+"/"+pictruesFileName[i]));//��ʼ�ϴ�
	    			//Ϊ�˷����β��ԣ����ϴ������������ļ��У��ڹ�����Ҳ��һ�ݣ�������ɺ���ɾ��
	    			FileUtils.copyFile(pictrues[i], new File("D:\\pictrues"+"/"+pictruesFileName[i]));//��ʼ�ϴ�
	    			System.out.println("�ϴ��ɹ���");
	    		} catch (IOException e) {
	    			System.out.println("�ϴ�ʧ�ܣ�");
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
		    System.out.println("��̨���޸���Ϣ��"+productinfo);
		}
		//System.out.println("��Ʒ�ģ�"+pictruesFileName.toString());
		if(prointrosFileName!=null){
			System.out.println("����ͼƬ��"+prointros+prointrosFileName);
		    try {			
				FileUtils.copyFile(prointros[0], new File(path+"/"+prointrosFileName[0]));//��ʼ�ϴ�
				
				System.out.println("�ϴ��ɹ���");
			} catch (IOException e) {
				System.out.println("�ϴ�ʧ�ܣ�");
				e.printStackTrace(); 
			}
		    productinfo.setProintro(prointrosFileName[0]);
		}
		
		xflag=productinfoService.updateProduct(productinfo);
		
		pictrues=null;//�ϴ��ļ�
		pictruesFileName=null;//�ϴ��ļ���
		pictruesContentType=null;//�ϴ��ļ�����
		
		prointros=null;//�ϴ��ļ�
		prointrosFileName=null;//�ϴ��ļ���
		prointrosContentType=null;//�ϴ��ļ�����
		
		return "xflag";
	}

	//��̨��ȡ��Ʒ����
	public String getNatureByName(){
		natureo = productinfoService.findNatureByName(productinfo.getProname());
		return "natureo";
	}
	//��̨������Ʒ������������ѯ��Ʒ�۸�
	public String getPriceByNaNa(){
		natureo = productinfoService.findPriceByNaNa(productinfo.getProname(), productinfo.getNature());
		return "natureo";
	}
	//��̨������Ʒ��Ų�ѯ��Ʒ����Ϣ
	public String findProByProid(){
		productinfo = productinfoService.findProById(productinfo.getProid());
		return "productinfo";
	}
	
}