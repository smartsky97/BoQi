package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.OrderContent;

public interface OrdercontentService {
	/**
	 * 添加一个订单
	 * @param orderContent
	 */
	public void addOrder(OrderContent orderContent,String orders);
	/**
	 * 查询所有的订单
	 * @param page：页
	 * @param rows：条数
	 * @return
	 */
	public List<OrderContent> findAll(int page,int rows);
}
