package com.yc.boqi.service;

import java.util.List;
import java.util.Map;
import com.yc.boqi.entity.OrderContent;

public interface IOrderContentInfoDao {
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
	public int update(OrderContent ordercontent);
	/**
	 * 
	 * @param id:要修改的编号 
	 * @param money：要修改的金额
	 * @return
	 */
	public int update(int id,int money);
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
	public List<OrderContent> find(Integer pageNo,Integer pageSize);
	
	/**
	 * 查询一个记录
	 * @param aid
	 * @return
	 */
	public OrderContent find(int orderid);
	/**
	 * 查询条件
	 * @param title
	 * @param date
	 * @param map
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<OrderContent> find(String orderid,String uname,String ndate,String oid,Map<String, String> map,Integer pageNo,Integer pageSize);	
	/**
	 * 订单由付款转为在配货
	 * @param orderid
	 * @return
	 */
	public int changeToPei(String orderid);
	/**
	 * 订单转为发货
	 * @param orderid
	 * @return
	 */
	public int changeToFa(String orderid);
}
