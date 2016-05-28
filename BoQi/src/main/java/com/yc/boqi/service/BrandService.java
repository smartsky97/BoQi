package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Brand;

public interface BrandService {
	//分页查询
	public List<Brand> find(Integer pageNo, Integer pageSize);
	//查询多少 个品牌
	public int total();
	/**
	 * 一个种类的商品的所有品牌
	 * @return
	 */
	public List<Brand> findProBrand();
	/**
	 * 获取所有品牌
	 * @return
	 */
	public List<Brand> findAllBrand();
}
