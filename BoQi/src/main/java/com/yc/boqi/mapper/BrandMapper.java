package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.Brand;

public interface BrandMapper {
	//分页查询品牌
	public List<Brand> findFenYe(Map<String, Object> brand);
	//查询品牌个数
	public int total();
}
