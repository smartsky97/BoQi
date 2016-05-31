package com.yc.boqi.mapper;

import java.util.List;

import com.yc.boqi.entity.Address;

public interface AddressMapper {
	public List<Address> getByUsid(int usid);
	
	public void addOne(Address address);
}
