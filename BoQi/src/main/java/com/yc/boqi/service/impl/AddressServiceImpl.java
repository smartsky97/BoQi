package com.yc.boqi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.Address;
import com.yc.boqi.mapper.AddressMapper;
import com.yc.boqi.service.AddressService;
@Service("addressService")
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressMapper addressMapper;
	@Override
	public List<Address> findByUsid(int usid) {
		return addressMapper.getByUsid(usid);
	}
	@Override
	public void addone(Address address) {
		addressMapper.addOne(address);
	}

}
