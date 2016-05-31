package com.yc.sns.util;

import static org.junit.Assert.*;

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
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.SecondMenu;
import com.yc.boqi.entity.Top8ProductinfoBean;
import com.yc.boqi.mapper.BrandMapper;
import com.yc.boqi.mapper.FirstMenuMapper;
import com.yc.boqi.mapper.ProductinfoMapper;
import com.yc.boqi.mapper.SecondMenuMapper;

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

	@Test
	public void testFindTop8() {
		List<Top8ProductinfoBean> mi = productinfoMapper.findTop8OfProductByLei();
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
	public void testpro3() {
		Productinfo mi = productinfoMapper.findAproduct(3021);
		System.out.println("aaa:"+mi);
		assertNotNull("出错了",mi);
	}
	
	
}
