package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.BackOrderContentBean;
import com.yc.boqi.entity.OrderContent;

public interface OrdercontentService {
	/**
	 * 添加一个订单
	 * @param orderContent
	 */
	public int addOrder(OrderContent orderContent,String orders);
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
	/**
	 * 后台未付款订单的修改
	 * @param allstring：商品信息
	 * @param backOrderContentBean：地址信息
	 * @param updateStatus：判断是否添加新地址
	 * @return
	 */
	public int updateOrderByAddress(String allstring,BackOrderContentBean backOrderContentBean,int updateStatus);
	/**
	 * 订单状态的修改
	 * @param ids：订单的id
	 * @param status:订单的状态
	 * @return
	 */
	public int updateOrderByids(String ids,int status);
	/**
	 * 改变订单状态
	 */
	public int updateStatu(int orderid);
	/**
	 * 获取订单的条数
	 * @return总数
	 */
	public int getTotal();
}
