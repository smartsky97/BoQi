package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.FirstMenu;

public interface FirstMenuService {
	/**
	 * 获取一个种类的一级分类
	 * @return 
	 */
	public List<FirstMenu> findFirInfo(String type);
}
