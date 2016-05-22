package com.yc.boqi.service;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.OrderForm;


public interface IOrderFormDao {
	/**
	 * 添加订单信息
	 * @param users：要添加的订单
	 * @return
	 */
	public int addNews(OrderForm orderForm);
	/**
	 * 订单修改
	 * @param aid:要修改的订单编号
	 * @return
	 */
	public int update(int orderid);
	/**
	 * 订单修改
	 * @param aid:要修改的订单编号
	 * @return
	 */
	public int update(OrderForm orderForm);
	/**
	 * 删除订单
	 * @param usid:要删除的订单编号，如果要同时删除多个，则用逗号隔开
	 * @return
	 */
	public int del(String orderid);
	/**
	 * 总记录数
	 * @return
	 */
	public int total();
	/**
	 * 分页查询订单信息
	 * @param pageNo:要查询的页数，如果为Null,则查询全部
	 * @param pageSize：页面显示的条数
	 * @return
	 */
	public List<OrderForm> find(Integer pageNo,Integer pageSize);
	
	/**
	 * 查询一个记录
	 * @param aid
	 * @return
	 */
	public OrderForm find(int orderid);
	/**
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	/**
	 * 查询一个订单的所有商品
	 * @return
	 */
	public List<OrderForm> finds(int a);
	
	public List<OrderForm> findIndex(Integer pageNo,Integer pageSize);
	
	public List<OrderForm> find(String tname,Integer pageNo,Integer pageSize);
	public List<OrderForm> find(String title,String date,Map<String, String> map,Integer pageNo,Integer pageSize);
	/**
	 * 根据字符串修改信息
	 * @param name
	 * @return
	 */
	public int update(String name);
}
