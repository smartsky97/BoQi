package com.yc.sns.util;

import static org.junit.Assert.*;

import java.io.File;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.FirstMenu;
import com.yc.boqi.entity.Pet;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.SecondMenu;
import com.yc.boqi.entity.Top8ProductinfoBean;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.mapper.BrandMapper;
import com.yc.boqi.mapper.FirstMenuMapper;
import com.yc.boqi.mapper.PetMapper;
import com.yc.boqi.mapper.ProductinfoMapper;
import com.yc.boqi.mapper.SecondMenuMapper;
import com.yc.boqi.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class testAll {
	
	@Autowired
	private ProductinfoMapper productinfoMapper;
	@Autowired
	private BrandMapper brandMapper;
	@Autowired
	private FirstMenuMapper firstMenuMapper;
	@Autowired
	private SecondMenuMapper secondMenuMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PetMapper petMapper;

	@Test
	public void testFindTop8() {
		List<Top8ProductinfoBean> mi = productinfoMapper.findTop8OfProductByLei();
		System.out.println("aaa:"+mi);
		assertNotNull("出错了",mi);
	}
	
	@Test
	public void testFindUser() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("one", 1);
		map.put("two", 0);
		List<UserInfo> mi = userMapper.getPageUsers(map);
		System.out.println("aaa:"+mi);
		assertNotNull("出错了",mi);
	}

	@Test
	public void testbrand() {
		Map<String, Object> ha = new HashMap<String, Object>();
		ha.put("pageNo", 1);
		ha.put("pageSize", 2);
		List<Brand> mi = brandMapper.findFenYe(ha);
		System.out.println("aaa:"+mi);
		assertNotNull("出错了",mi);
	}
	
	@Test
	public void testpro() {
		Map<String, Object> ha = new HashMap<String, Object>();
		ha.put("yi", 1);
		ha.put("er", 0);
		ha.put("petType", '狗');
		List<Productinfo> mi = productinfoMapper.findTypePro(ha);
		System.out.println("aaa:"+mi);
		assertNotNull("出错了",mi);
	}
	
	@Test
	public void testpro2() {
		List<FirstMenu> mi = firstMenuMapper.getFirInfo("狗");
		System.out.println("aaa:"+mi);
		assertNotNull("出错了",mi);
	}
	
	@Test
	public void testPet() {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("family", "狗");
		map.put("one", 10);
		map.put("two", 0);
		List<Pet> mi = petMapper.findPetByFamily(map);
		System.out.println("aaa:"+mi);
		assertNotNull("出错了",mi);
	}
	

	
	
	@Test
	public void rmFile(){
		String flag=null;
		String path="D:\\tomcat\\apache-tomcat-7.0.47\\webapps\\upload\\1052";
		File file=new File(path);
		if(file.exists() && file.isDirectory()){
			String[] list=file.list();
			for(String str:list){
				System.out.println(path+file.separator+str);
				File df=new File(path+file.separator+str);
				df.delete();
			}
			flag="sda";
		}
		assertNotNull("出错了",flag);
	}
	@Test
	public void rmBolder(){
		String path="D:\\tomcat\\apache-tomcat-7.0.47\\webapps\\upload\\1052";
		String falg=null;
		File file=new File(path);
		System.out.println(file.exists()+"======="+file.isDirectory());
		if(file.exists() && file.isDirectory()){
			String[] list=file.list();
			if(list.length>0){
				for(String str:list){
					File df=new File(path+str);
					df.delete();
				}
				file.delete();
				falg="sda";
			}else{
				file.delete();
				falg="sda";
			}
			
		}
		assertNotNull("出错了",falg);
	}
	
	
}
