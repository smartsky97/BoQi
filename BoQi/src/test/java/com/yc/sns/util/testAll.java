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
import com.yc.boqi.entity.Top8ProductinfoBean;
import com.yc.boqi.mapper.BrandMapper;
import com.yc.boqi.mapper.ProductinfoMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class testAll {
	
	@Autowired
	private ProductinfoMapper productinfoMapper;
	@Autowired
	private BrandMapper brandMapper;

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
}
