package com.yc.boqi.service;

import com.yc.boqi.entity.Admin;

public interface AdminService {
	/**
	 * 管理员登陆
	 * @param admin类
	 * @return
	 */
	public Admin AdminLogin(Admin admin);
}
