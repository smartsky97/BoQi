package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.Top8ProductinfoBean;

public interface ProductinfoService {
	//后台的种类获取
	public List<Productinfo> findTypePro(Integer pageNo, Integer pageSize,String petType);
	//获取前八个不同类型的数据
	public List<Top8ProductinfoBean> GetTop8();
	//获取一个种类商品的 数量
	public int findTypeNum(String type);
	//添加商品
	public boolean addProduct(Productinfo productinfo);
}
