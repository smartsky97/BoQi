package com.yc.boqi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.SecondMenu;
import com.yc.boqi.mapper.SecondMenuMapper;
import com.yc.boqi.service.SecondMenuService;
@Service("secondMenuService")
public class SecondMenuServiceImpl implements SecondMenuService {
	@Autowired
	private SecondMenuMapper secondMenuMapper;
	
	@Override
	public List<SecondMenu> findProType(String type) {
		return secondMenuMapper.getProType(type);
	}

	@Override
	public List<SecondMenu> findByFid(String fid) {
		return secondMenuMapper.getByFid(fid);
	}

	

	

}
