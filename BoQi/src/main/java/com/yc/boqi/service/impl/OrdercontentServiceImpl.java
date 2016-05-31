package com.yc.boqi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.OrderContent;
import com.yc.boqi.mapper.OrdercontentMapper;
import com.yc.boqi.service.OrdercontentService;
@Service("ordercontentService")
public class OrdercontentServiceImpl implements OrdercontentService {
	@Autowired
	private OrdercontentMapper ordercontentMapper;
	@Override
	public void addOrder(OrderContent orderContent) {
		ordercontentMapper.addOrder(orderContent);
	}

	

}
