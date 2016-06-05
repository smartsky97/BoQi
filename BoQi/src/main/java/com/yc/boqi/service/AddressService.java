package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Address;

public interface AddressService {
	/**
	 * 获取一个用户的前四个收货地址
	 * @param usid:用户id
	 * @return
	 */
	public List<Address> findByUsid(int usid);
	/**
	 * 获取全部收货地址
	 * @param usid:用户id
	 * @return
	 */
	public List<Address> findByUsidAll(int usid);
	/**
	 * 添加一个地址
	 * @param address：地址实体类
	 */
	public void addone(Address address);
}
