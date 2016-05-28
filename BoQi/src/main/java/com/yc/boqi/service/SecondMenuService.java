package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.SecondMenu;

public interface SecondMenuService {
	/**
	 * 获取莫种类的二级分类
	 * @param 宠物种类
	 * @return
	 */
	public List<SecondMenu> findProType(String type);
	public List<SecondMenu> findByFid(String fid);
}
