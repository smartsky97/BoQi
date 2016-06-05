package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.ShopCar;
import com.yc.boqi.entity.ShopCarBean;

public interface ShopCarMapper {
	public ShopCar checkIfSave(Map<String, Object> car);
	public void addAInfo(Map<String, Object> car);
	public List<ShopCarBean> getAllInfo(int usid);
}
