package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Brand;

public interface BrandService {
	//分页查询
	public List<Brand> find(Integer pageNo, Integer pageSize);
	//查询多少 个品牌
	public int total();
}
