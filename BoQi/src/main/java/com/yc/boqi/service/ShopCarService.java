package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.ShopCarBean;

public interface ShopCarService {
	/**
	 * 查询一个用户的购物车中是否有加某个商品
	 * @param proid：商品id
	 * @param usid:用户id
	 * @return
	 */
	public boolean checkIfSave(int proid,int usid);
	/**
	 * 向购物车中添加一条数据 
	 * @param proid:商品id
	 * @param usid:用户id
	 * @param inventory:商品数量
	 */
	public void addAInfo(int proid,int usid,int inventory);
	/**
	 * 查询一个用户的购物车
	 * @param usid：用户Id
	 * @return
	 */
	public List<ShopCarBean> findAllInfo(int usid);
}
