package com.yc.boqi.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.SecondMenu;
import com.yc.boqi.service.SecondMenuService;

@Service
public class SecondMenuAction {
	@Autowired
	private SecondMenuService secondMenuService;
	private List<SecondMenu> secsl; 
	private String fid;
	
	public void setFid(String fid) {
		this.fid = fid;
	}
	
	public List<SecondMenu> getSecsl() {
		return secsl;
	}

	public String getSec(){
		secsl = secondMenuService.findByFid(fid);
		return "secs";
	}
}
