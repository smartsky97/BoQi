package com.yc.boqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.mapper.BrandMapper;
import com.yc.boqi.service.BrandService;
@Service("brandService")
public class BrandServiceImpl implements BrandService {
	@Autowired
	private BrandMapper brandMapper;

	@Override
	public List<Brand> find(Integer pageNo, Integer pageSize) {
		Map<String, Object> brand = new HashMap<String, Object>();
		brand.put("yi", pageNo*pageSize);
		brand.put("er", (pageNo-1)*pageSize);
		return brandMapper.findFenYe(brand);
	}

	@Override
	public int total() {
		return brandMapper.total();
	}

	@Override
	public List<Brand> findProBrand() {
		return brandMapper.getProBrand();
	}

	@Override
	public List<Brand> findAllBrand() {
		return brandMapper.getAllBrand();
	}

	

}
