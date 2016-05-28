package com.yc.boqi.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.mapper.UserMapper;
import com.yc.boqi.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public List<UserInfo> getPageUsers(Map<String, Object> map) {
		return userMapper.getPageUsers(map);
	}

	@Override
	public int getUserTotal() {
		return userMapper.getUserTotal();
	}

	@Override
	public UserInfo getUserByUsid(int usid) {
		return userMapper.getUserByUsid(usid);
	}

	@Override
	public List<UserInfo> findUserByInfo(Map<String, Object> map) {
		return userMapper.findUserByInfo(map);
	}

}
