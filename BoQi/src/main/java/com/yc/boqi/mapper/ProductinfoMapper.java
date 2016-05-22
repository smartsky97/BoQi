package com.yc.boqi.mapper;

import java.util.List;

import com.yc.boqi.entity.Top8ProductinfoBean;

public interface ProductinfoMapper {
	//获取商城主页的所有种类的前8个商品
	public List<Top8ProductinfoBean> findTop8OfProductByLei();

}
