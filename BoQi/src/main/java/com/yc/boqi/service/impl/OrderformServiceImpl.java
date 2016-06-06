package com.yc.boqi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.boqi.mapper.OrderformMapper;
import com.yc.boqi.service.OrderformService;
@Service("orderformService")
public class OrderformServiceImpl implements OrderformService {

	@Autowired
	private OrderformMapper orderformMapper;

	@Override @Transactional
	public int updateorderform(int orderid) {
		return orderformMapper.updateorderform(orderid);
	}

}
