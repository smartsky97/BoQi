package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.SecondMenu;

public interface IBrandDao {
	public int addBrand(Brand brand);
	public int delBrand(String brandid);
	public int updateBrand(int brandid,String brandname,int status);
	public Brand find(int brandid);
	public List<Brand> find(Integer pageNo, Integer pageSize);
	public int total();

	public SecondMenu findType(int tid);
}
