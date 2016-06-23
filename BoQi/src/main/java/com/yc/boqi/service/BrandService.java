package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.BrandBean;

public interface BrandService {
	//分页查询
	public List<BrandBean> find(Integer pageNo, Integer pageSize);
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
	/**
	 * 品牌销售信息
	 * @return
	 */
	public List<BrandBean> findBrandShowInfo();
	/**
	 * 一个品牌的销售信息
	 * @return
	 */
	public List<BrandBean> findBrandSellInfo(int id);
}
