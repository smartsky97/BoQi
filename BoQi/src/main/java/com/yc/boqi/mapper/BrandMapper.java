package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.BrandBean;

public interface BrandMapper {
	//分页查询品牌
	public List<BrandBean> findFenYe(Map<String, Object> brand);
	//查询品牌个数
	public int total();
	/**
	 * 获取一个种类的品牌
	 * @return
	 */
	public List<Brand> getProBrand();
	/**
	 * 获取所有品牌
	 * @return
	 */
	public List<Brand> getAllBrand();
	/**
	 * 所有品牌销售信息
	 * @return
	 */
	public List<BrandBean> getBrandShowInfo();
	/**
	 * 一个品牌的销量和销售金额:每一天的情况 
	 * @return
	 */
	public List<BrandBean> getOneBrand_sell(int id);
}
