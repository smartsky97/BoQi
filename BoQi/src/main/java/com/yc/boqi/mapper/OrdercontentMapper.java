package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.BackOrderContentBean;
import com.yc.boqi.entity.OrderContent;

public interface OrdercontentMapper {

	public void addOrder(OrderContent orderContent);
	
	public void addFrom(Map<String, Object> add);
	
	public List<OrderContent> getAll(Map<String, Object> add);
	
	public BackOrderContentBean getBackOrder(int proid);
	
	public int updateOrderByIds(String[] ids);
	
	public int updateOrderById(String id);
}
