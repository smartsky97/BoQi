package com.yc.boqi.service;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.UserInfo;

public interface UserService {
	//分页查询用户
	List<UserInfo> getPageUsers(Map<String,Object> map);
	//获取用户总数
	int getUserTotal();
	//根据yonghuid获取用户信息
	UserInfo getUserByUsid(int usid);
	//筛选查询
	List<UserInfo> findUserByInfo(Map<String,Object> map);
}
