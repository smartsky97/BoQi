package com.yc.boqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.boqi.entity.OrderContent;
import com.yc.boqi.mapper.OrdercontentMapper;
import com.yc.boqi.mapper.ProductinfoMapper;
import com.yc.boqi.service.OrdercontentService;
@Service("ordercontentService")
public class OrdercontentServiceImpl implements OrdercontentService {
	@Autowired
	private OrdercontentMapper ordercontentMapper;
	@Autowired
	private ProductinfoMapper productinfoMapper;
	private Map<String, Object> addfrom  = new HashMap<String, Object>();
	private OrderContent oc;
	@Transactional
	public OrderContent addor(OrderContent orderContent){
		ordercontentMapper.addOrder(orderContent);
		return orderContent;
	}
	@Transactional
	public void addfo(Map<String, Object> so){
		ordercontentMapper.addFrom(so);
	}
	@Transactional
	public void updateGood(Map<String, Object> so){
		productinfoMapper.updateGoodsNum(so);
	}
	@Override @Transactional
	public void addOrder(OrderContent orderContent,String orders) {
		//添加订单
		oc = addor(orderContent);
		System.out.println(oc.getOrderid()+"订单编号");
		addfrom.put("orderid", oc.getOrderid());
		String[] orde = orders.split(";");
		for(int i=0;i<orde.length;i++){
			String[] os = orde[i].split(",");
			addfrom.put("proid",os[0]);
			addfrom.put("pronum",os[1]);
			addfrom.put("bqpri",os[2]);
			//添加订单详情
			addfo(addfrom);
			//修改商品库存
			updateGood(addfrom);
		}
	}
	@Override
	public List<OrderContent> findAll(int page, int rows) {
		Map<String, Object> type = new HashMap<String, Object>();
		type.put("one", page*rows);
		type.put("two", (page-1)*rows);
		
		return ordercontentMapper.getAll(type);
	}

	

}
