package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.SecondMenu;

public interface IDogProductDao {
	public List<Productinfo> findDogPro(Integer pageNo, Integer pageSize);
	public int DogProTotal();
	public List<Brand> findDogProBrand();
	public List<SecondMenu> findDogProType();
	public int addDogPro(Productinfo pro);
	public Productinfo findProByProid(int proid);
}
