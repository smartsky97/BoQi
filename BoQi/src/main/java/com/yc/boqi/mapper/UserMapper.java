package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.UserInfo;

public interface UserMapper {
	List<UserInfo> getPageUsers(Map<String,Object> map);
	int getUserTotal();
	UserInfo getUserByUsid(int usid);
	List<UserInfo> findUserByInfo(Map<String,Object> map);
}
