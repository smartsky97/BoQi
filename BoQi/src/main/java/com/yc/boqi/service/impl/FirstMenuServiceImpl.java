package com.yc.boqi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.FirstMenu;
import com.yc.boqi.mapper.FirstMenuMapper;
import com.yc.boqi.service.FirstMenuService;
@Service("firstMenuService")
public class FirstMenuServiceImpl implements FirstMenuService {
	@Autowired
	private FirstMenuMapper firstMenuMapper;

	@Override
	public List<FirstMenu> findFirInfo(String type) {
		return firstMenuMapper.getFirInfo(type);
	}

}
