package com.yc.boqi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.Admin;
import com.yc.boqi.mapper.AdminMapper;
import com.yc.boqi.service.AdminService;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;
	@Override
	public Admin AdminLogin(Admin admin) {
		return adminMapper.AdminLogin(admin);
	}

}
