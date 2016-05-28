package com.yc.boqi.mapper;

import java.util.List;

import com.yc.boqi.entity.FirstMenu;

public interface FirstMenuMapper {
	/**
	 * 获取一级分类
	 * @return 
	 */
	public List<FirstMenu> getFirInfo(String type);
}
