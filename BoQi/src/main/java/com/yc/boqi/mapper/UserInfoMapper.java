package com.yc.boqi.mapper;

import com.yc.boqi.entity.UserInfo;

public interface UserInfoMapper {
	UserInfo getUserByUser(UserInfo user);
	int getRegister(UserInfo userInfo);
}