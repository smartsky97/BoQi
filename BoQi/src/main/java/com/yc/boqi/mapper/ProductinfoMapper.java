package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.Top8ProductinfoBean;

public interface ProductinfoMapper {
	//获取商城主页的所有种类的前8个商品
	public List<Top8ProductinfoBean> findTop8OfProductByLei();
	//获取狗狗商品后台显示列表
	public List<Productinfo> findTypePro(Map<String, Object> type);
	//获取一个种类商品的数量
	public int ProTotal(String type);
	/**
	 * 添加商品
	 * @param productinfo：商品类
	 * @return
	 */
	public boolean addProduct(Productinfo productinfo);
	public List<Productinfo> searchPro(Map<String,Object> map);
	
}
