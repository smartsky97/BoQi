package com.yc.boqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.IndexProductBean;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.ProductinfoBean;
import com.yc.boqi.entity.Top8ProductinfoBean;
import com.yc.boqi.mapper.ProductinfoMapper;
import com.yc.boqi.service.ProductinfoService;
@Service("productinfoService")
public class ProductinfoServiceImpl implements ProductinfoService {
	@Autowired
	private ProductinfoMapper productinfoMapper;

	@Override
	public List<Productinfo> findTypePro(Integer pageNo, Integer pageSize,
			String petType) {
		Map<String, Object> type = new HashMap<String, Object>();
		type.put("yi", pageNo*pageSize);
		type.put("er", (pageNo-1)*pageSize);
		type.put("petType", petType);
		return productinfoMapper.findTypePro(type);
	}

	@Override
	public List<Top8ProductinfoBean> GetTop8() {
		return productinfoMapper.findTop8OfProductByLei();
	}

	@Override
	public int findTypeNum(String type) {
		return productinfoMapper.ProTotal(type);
	}

	@Override
	public boolean addProduct(ProductinfoBean productinfo) {
		return productinfoMapper.addProduct(productinfo);
	}

	@Override
	public List<Productinfo> searchPro(Map<String,Object> map) {
		
		return productinfoMapper.searchPro(map);
	}

	
	public Productinfo findAproduct(int orderid) {
		return productinfoMapper.findAproduct(orderid);
	}

	@Override
	public List<IndexProductBean> findIndexDogPro() {
		return productinfoMapper.findIndexDogPro();
	}

	@Override
	public List<IndexProductBean> findIndexCatPro() {
		return productinfoMapper.findIndexCatPro();
	}

	@Override
	public List<IndexProductBean> findIndexsmallPro() {
		return productinfoMapper.findIndexsmallPro();
	}

	@Override
	public List<Productinfo> findNatureByName(String name) {
		String[] tnames = name.split(",");
		return productinfoMapper.findNatureByName(tnames);
	}

	@Override
	public List<Productinfo> findPriceByNaNa(String name, String nature) {
		Map<String, Object> so = new HashMap<String, Object>();
		so.put("name", name);
		so.put("nature", nature);
		return productinfoMapper.findPriceByNaNa(so);
	}

	@Override
	public ProductinfoBean findProById(int id) {
		return productinfoMapper.findProductsInfo(id);
	}

}
