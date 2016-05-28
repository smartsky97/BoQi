package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.SecondMenu;

public interface SecondMenuMapper {
	/**
	 * 获取一个种类的二级分类
	 * @param 宠物种类
	 * @return
	 */
	public List<SecondMenu> getProType(String type);
	
	public List<SecondMenu> getByFid(String fid);
}
