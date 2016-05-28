package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.BqAdmin;


public interface IAdminInfoDao {
	/**
	 * 后台管理员登录
	 */
	public BqAdmin login(BqAdmin BqAdmin);
	/**
	 * 添加管理员信息
	 * @param BqAdmin:要添加的管理员
	 * @return
	 */
	public int addBqAdmin(BqAdmin BqAdmin);
	/**
	 * 密码修改
	 * @param aid:要修改的管理员编号
	 * @param oldPwd:旧密码
	 * @param newPwd:新密码
	 * @return
	 */
	public int updatePwd(int aid,String oldPwd,String newPwd);
	/**
	 * 修改管理员信息
	 * @param BqAdmin：要添加的管理员
	 * @return
	 */
	public int updateBqAdmin(BqAdmin BqAdmin);
	/**
	 * 删除管理员
	 * @param aid:要删除的管理员编号，如果要同时删除多个，则用逗号隔开
	 * @return
	 */
	public int del(String  aid);
	/**
	 * 总记录数
	 * @return
	 */
	public int total();
	/**
	 * 分页查询管理员信息
	 * @param pageNo:要查询的页数，如果为Null,则查询全部
	 * @param pageSize：页面显示的条数
	 * @return
	 */
	public List<BqAdmin> find(Integer pageNo,Integer pageSize);
	/**
	 * 查询一个记录
	 * @param aid
	 * @return
	 */
	public BqAdmin find(int aid);
}
