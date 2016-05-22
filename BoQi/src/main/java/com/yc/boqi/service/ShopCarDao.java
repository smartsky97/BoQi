package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.ShopCar;

public interface ShopCarDao {
	/**
	 * 添加商品到购物车
	 * @param shopCar
	 * @return
	 */
	public int addProduct(ShopCar shopCar);
	
	/**
	 * 修改购物车中的商品属性
	 * @param shopCar
	 * @return
	 */
	public int changeInventory(int proid,int usid,int inventory);
	
	/**
	 * 删除购物车中的商品
	 * @param shopCar
	 * @return
	 */
	public int delete(int proid);
	
	/**
	 * 查询购物车中全部的商品
	 * @param shopCar
	 * @return
	 */
	// public List<ShopCar> find(Integer pageNo,Integer pageSize);
	public List<ShopCar> find(Integer pageNo,Integer pageSize,String uname);
	
	/**
	 * 根据用户id和商品id查询在购物车中的单个信息
	 * @param usid
	 * @param proid
	 * @return
	 */
	public List<ShopCar> findSingle(int usid,int proid);
}
