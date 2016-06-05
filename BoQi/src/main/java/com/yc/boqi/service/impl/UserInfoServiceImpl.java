package com.yc.boqi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.mapper.UserInfoMapper;
import com.yc.boqi.service.UserInfoService;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	  
	@Override
	public UserInfo login(UserInfo user) {
		return userInfoMapper.getUserByUser(user);
	}

	 
	@Override
	public int total() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserInfo find(int aid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int register(UserInfo userInfo) {
		int reg=userInfoMapper.getRegister(userInfo);
		return reg;
	}

	@Override
	public List<UserInfo> find(String uname, String email, String status, Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override  //获取用户信息
	public List<UserInfo> getUserInfo(int usid) {
		System.out.println(usid);
		List<UserInfo> getInfo=userInfoMapper.selectUserInfo(usid);
		System.out.println(getInfo);
		return getInfo;
	}

	@Override   //获取订单信息
	public List<OrderForm> getOrderInfo(int usid) {
		List<OrderForm> getOrder=userInfoMapper.selectOrderInfo(usid);
		System.out.println(getOrder);
		return getOrder;
	}

	@Override   //获取未支付订单数量
	public int getwzfNum() {
		int getwzfnum=userInfoMapper.selectwzg();
		System.out.println("未支付订单数量"+getwzfnum);
		return getwzfnum;
	}

	@Override   //获取已完成订单数量
	public int getfinish() {
		int getfinishnum=userInfoMapper.selectfinish();
		System.out.println("已完成订单数量"+getfinishnum);
		return getfinishnum;
	}

	@Override   //获取未评价订单数量
	public int getpingjia() {
		int getpingjianum=userInfoMapper.selectpingjia();
		System.out.println("未评价订单数量"+getpingjianum);
		return getpingjianum;
	}

	@Override  //删除订单
	public int deleteOrder(int orderid) {
		System.out.println(orderid);
		int delo=userInfoMapper.delOrder(orderid);
		return delo;
	}
	
	@Override
	public List<UserInfo> getPageUsers(Map<String, Object> map) {
		return userInfoMapper.getPageUsers(map);
	}

	@Override
	public int getUserTotal() {
		return userInfoMapper.getUserTotal();
	}

	@Override
	public UserInfo getUserByUsid(int usid) {
		return userInfoMapper.getUserByUsid(usid);
	}

	@Override
	public List<UserInfo> findUserByInfo(Map<String, Object> map) {
		return userInfoMapper.findUserByInfo(map);
	}
}
