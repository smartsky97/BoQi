package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.BackOrderContentBean;
import com.yc.boqi.entity.OrderContent;

public interface OrdercontentMapper {
	/**
	 * 添加一个订单
	 * @param orderContent：订单类
	 */
	public void addOrder(OrderContent orderContent);
	/**
	 * 添加相关的订单详情
	 * @param add：相关的信息
	 */
	public void addFrom(Map<String, Object> add);
	/**
	 * 分页查询订单
	 * @param add：页数和条数
	 * @return
	 */
	public List<OrderContent> getAll(Map<String, Object> add);
	/**
	 * 后台订单的所有信息
	 * @param proid：订单号
	 * @return
	 */
	public BackOrderContentBean getBackOrder(int proid);
	/**
	 * 修改多个订单的状态到失效
	 * @param ids：订单号的数组
	 * @return
	 */
	public int updateOrderByIds(String[] ids);
	/**
	 * 修改订单的状态到失效
	 * @param id：订单的id
	 * @return
	 */
	public int updateOrderById(String id);
	/**
	 * 修改订单详情的相关信息
	 * @param add
	 * @return
	 */
	public int updateOrderFrom(Map<String, Object> add);
	/**
	 * 修改订单的状态
	 * @param add：订单的编号和状态的属性值
	 * @return
	 */
	public int updateOrderStatusById(Map<String, Object> add);
	/**
	 * 修改订单的状态
	 * @param add：多个订单的编号和状态的属性值
	 * @return
	 */
	public int updateOrderStatusByIds(Map<String, Object> add);
	public int updateStatu(int orderid);
}
