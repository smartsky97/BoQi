package com.yc.boqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.crypto.Data;

import org.pojava.datetime.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.CollectPro;
import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;

import com.yc.boqi.entity.orderBasic;
import com.yc.boqi.entity.orderPicture;

import com.yc.boqi.mapper.OrdercontentMapper;
import com.yc.boqi.mapper.OrderformMapper;

import com.yc.boqi.mapper.UserInfoMapper;
import com.yc.boqi.service.UserInfoService;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private OrdercontentMapper ordercontentMapper;
	@Autowired
	private OrderformMapper orderformMapper;
	  
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
	
//	@Override  //获取收藏商品
//	public List<CollectPro> getCollectPro(int usid) {
//		System.out.println(usid);
//		List<CollectPro> fav=userInfoMapper.getCollectInfo(usid);
//		return fav;
//	}
	
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
	@Override
	public int updateyue(int usid,double money,int id){
		Map<String, Object> pa = new HashMap<String, Object>();
		pa.put("usid", usid);
		pa.put("money", money);
		int a = userInfoMapper.updateyue(pa);
		pa.clear();
		pa.put("id", id);
		pa.put("status", 2);
		int b = ordercontentMapper.updateOrderStatusById(pa);
		int c = orderformMapper.updateOrderFromStatusById(pa);
		
		DateTime dt = new DateTime();
		pa.clear();
		pa.put("time", dt.toString("yyyy-MM-dd HH:mm:ss"));
		pa.put("id", id);
		int d = ordercontentMapper.updateOrderPayTime(pa);
		
		if(a==1 & b==1 & c==1 & d==1){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public double selectmoney(int usid) {
		return userInfoMapper.selectmoney(usid);
	}

	//修改个人资料
	@Override
	public int updateUserInfo(UserInfo userInfo) {
		int rst=userInfoMapper.changeUserInfo(userInfo);
		return rst;
	}


	@Override
	public List<orderPicture> getpicture(int usid) {
		return userInfoMapper.getpicInfo(usid);
	}


	@Override
	public List<orderBasic> selectBasic(int usid) {
		
		return userInfoMapper.getbasicorder(usid);
	}


	@Override
	public int querenshouhuo(int orderid) {
		return userInfoMapper.checkshouhuo(orderid);
	}


	@Override
	public int deleteOrder1(int orderid) {
		int delo1=userInfoMapper.delOrder1(orderid);
		return delo1;
	}


	@Override
	public int querenshouhuo1(int orderid) {
		return userInfoMapper.checkshouhuo1(orderid);
	}


	@Override
	public int getorderStatus(int orderid) {
		
		return userInfoMapper.getOrderStatusByid(orderid);
	}



}
