package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.UserInfo;

public interface IUserInfoDao {
	public UserInfo login(UserInfo user);
	
	public int addUser(UserInfo user);
	
	public int updateRegisterPwd(int usid,String oldPwd,String newPwd);
	
	public int updatePayPwd(int usid,String oldPwd,String newPwd);
	
	public int changeUname(int usid,String newName);
	
	public int updateUserInfo(UserInfo user);
	
	public List<UserInfo> find(Integer pageNo,Integer pageSize);
	
	public int total();
	/**
	 * 查询一个记录
	 * @param aid
	 * @return
	 */
	public UserInfo find(int aid);
	
	public List<UserInfo> find(String uname,String email,String status,Integer pageNo,Integer pageSize);
}
