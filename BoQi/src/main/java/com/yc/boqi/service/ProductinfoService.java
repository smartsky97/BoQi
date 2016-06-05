package com.yc.boqi.service;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.Top8ProductinfoBean;

public interface ProductinfoService {
	public List<Productinfo> findTypePro(Integer pageNo, Integer pageSize,String petType);
	public List<Top8ProductinfoBean> GetTop8();
	public int findTypeNum(String type);
	public boolean addProduct(Productinfo productinfo);
	
	public List<Productinfo> searchPro(Map<String,Object> map);
}
