package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IOrderFormDao;
import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.Productinfo;

public class OrderFormDaoImpl implements IOrderFormDao {
	private DBHelper db = new DBHelper();
	public int addNews(OrderForm orderForm) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(int orderid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(OrderForm orderForm) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int del(String orderid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int total() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<OrderForm> find(Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	public OrderForm find(int orderid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderForm> findIndex(Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderForm> find(String tname, Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderForm> find(String title, String date,
			Map<String, String> map, Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<OrderForm> finds(int a) {
		String sql = "select o.orderid,o.proid,p.nature,o.pronum,o.bqpri,o.status,proname,orrmid from orderform o," +
				"productinfo p where o.proid=p.proid and orderid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(a);
		return db.find(sql, params,OrderForm.class);
	}

	public int update(String name) {
		String[] tnames = name.split(",");
		String sql = "update orderform set proid=?,bqpri=?,pronum=?,status=? where orrmid=?";
		List<Object> params = new ArrayList<Object>();
		int i=0;
		int q=1;
		for(i=0;i<tnames.length;i++){
			params.add(tnames[i]);
			System.out.println(i+":"+tnames[i]);
			if((i+1)%5==0 && i!=0){
				System.out.println("q="+q);q++;
				int jie = db.update(sql, params);
				params.removeAll(params);
				System.out.println("fff--> "+jie+" - "+tnames[i]);
				if(jie==0){
					return 0;
				}
			}
		}
		
		return 1;
	}

}
