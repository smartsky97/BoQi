package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;

public interface UserInfoMapper {
	UserInfo getUserByUser(UserInfo user);
	int getRegister(UserInfo userInfo);
	List<UserInfo> selectUserInfo(Object object);

	List<OrderForm> selectOrderInfo(int usid);

	int selectwzg();

	int selectfinish();

	int selectpingjia();

	int delOrder(int orderid);
	//分页查询用户
	List<UserInfo> getPageUsers(Map<String,Object> map);
	//获取用户总数
	int getUserTotal();
	//根据yonghuid获取用户信息
	UserInfo getUserByUsid(int usid);
	//筛选查询
	List<UserInfo> findUserByInfo(Map<String,Object> map);
}