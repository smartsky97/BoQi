package com.yc.boqi.service;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;

public interface UserInfoService {
	//lsp:登录
	public UserInfo login(UserInfo user);
	
	int register(UserInfo userInfo);
		
	public int total();
	/**
	 * 查询一个记录
	 * @param aid
	 * @return
	 */
	public UserInfo find(int aid);
	
	public List<UserInfo> find(String uname,String email,String status,Integer pageNo,Integer pageSize);

	List<UserInfo> getUserInfo(int usid);

	List<OrderForm> getOrderInfo(int usid);

	int getwzfNum();

	int getfinish();

	int getpingjia();

	int deleteOrder(int orderid);
	//分页查询用户
	List<UserInfo> getPageUsers(Map<String,Object> map);
	//获取用户总数
	int getUserTotal();
	//根据yonghuid获取用户信息
	UserInfo getUserByUsid(int usid);
	//筛选查询
	List<UserInfo> findUserByInfo(Map<String,Object> map);
}
