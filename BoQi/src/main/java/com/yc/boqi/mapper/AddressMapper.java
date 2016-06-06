package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.Address;

public interface AddressMapper {
	//获取前4个地址
	public List<Address> getByUsid(int usid);
	//获取全部地址
	public List<Address> getByUsidAll(int usid);
	public void addOne(Address address);
	public int addOneMap(Map<String, Object> as);
	public int updateAddress(Map<String, Object> as);
	
}
