package com.yc.boqi.service;

import com.yc.boqi.entity.Address;

public interface IAddressInfoDao {
	/**
	 * 查询一个记录
	 * @param aid
	 * @return
	 */
	public Address find(int usid);
	/**
	 * 更新地址信息
	 * @param address
	 * @return
	 */
	public int updateAddress(Address address);
}
