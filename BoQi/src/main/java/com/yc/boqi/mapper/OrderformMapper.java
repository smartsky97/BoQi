package com.yc.boqi.mapper;

import java.util.Map;

import com.yc.boqi.entity.OrderForm;

public interface OrderformMapper {
	/**
	 * 添加商品详情信息
	 * @param orderForm详情类
	 */
	public void addfrom(OrderForm orderForm);
	/**
	 * 修改一个订单的所有商品状态的情况
	 * @param pa:订单id和状态
	 * @return
	 */
	public int updateOrderFromStatusById(Map<String, Object> pa);
	/**
	 * 修改多个订单的所有商品状态的情况
	 * @param pa;多个订单id和状态
	 * @return
	 */
	public int updateOrderFromStatusByIds(Map<String, Object> pa);
	public int updateorderform(int orderid);
}
