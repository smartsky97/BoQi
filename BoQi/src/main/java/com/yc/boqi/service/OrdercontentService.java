package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.BackOrderContentBean;
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
	/**
	 * 后台查询一个订单
	 * @return
	 */
	public BackOrderContentBean findOneBackOrder(int orderid);
	/**
	 * 把订单状态改为0，就是失效
	 * @param ids:id号
	 */
	public int updateOrderToLing(String ids);
}
