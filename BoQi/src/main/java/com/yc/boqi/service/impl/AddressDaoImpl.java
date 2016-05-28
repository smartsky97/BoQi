package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IAddressInfoDao;
import com.yc.boqi.entity.Address;
import com.yc.boqi.entity.OrderContent;

public class AddressDaoImpl implements IAddressInfoDao {
	DBHelper db=new DBHelper();
	
	public Address find(int usid) {
		String sql = "select * from address where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(usid);
		List<Address> list = db.find(sql, params, Address.class);
		if(list != null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	public Address find2(int usid) {
		String sql = "select * from ordercontent where orderid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(usid);
		List<Address> list = db.find(sql, params, OrderContent.class);
		if(list != null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}
	public int updateAddress(Address address) {
		String sql = "update address set addname=?,tel=?,readdr=? where addid=?";
		System.out.println(sql);
		List<Object> params = new ArrayList<Object>();
		params.add(address.getAddname());
		params.add(address.getTel());
		params.add(address.getReaddr());
		params.add(address.getAddid());
		System.out.println(params);
		return db.update(sql, params);
	}

}
