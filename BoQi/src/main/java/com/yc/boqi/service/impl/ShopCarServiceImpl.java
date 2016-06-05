package com.yc.boqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.ShopCarBean;
import com.yc.boqi.mapper.ShopCarMapper;
import com.yc.boqi.service.ShopCarService;
@Service("shopCarService")
public class ShopCarServiceImpl implements ShopCarService {
	@Autowired
	private ShopCarMapper shopCarMapper;

	@Override
	public boolean checkIfSave(int proid, int usid) {
		Map<String, Object> car = new HashMap<String, Object>();
		car.put("proid", proid);
		car.put("usid", usid);
		System.out.println("car:"+shopCarMapper.checkIfSave(car));
		if(shopCarMapper.checkIfSave(car)==null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void addAInfo(int proid, int usid, int inventory) {
		Map<String, Object> car = new HashMap<String, Object>();
		car.put("proid", proid);
		car.put("usid", usid);
		car.put("inventory", inventory);
		shopCarMapper.addAInfo(car);
	}

	@Override
	public List<ShopCarBean> findAllInfo(int usid) {
		return shopCarMapper.getAllInfo(usid);
	}

}
