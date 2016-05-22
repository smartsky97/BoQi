package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IOrderContentInfoDao;
import com.yc.boqi.entity.OrderContent;

public class OrderContentDaoImpl implements IOrderContentInfoDao {
	private DBHelper db= new DBHelper();  
	public int update(int orderid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(OrderContent ordercontent) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int del(String orderid) {
		List<Object> params = new ArrayList<Object>();
		String sql;
		if(orderid.contains(",") && orderid.indexOf("or")<=0){
			sql="update ordercontent set orderstate=0 where orderid in("+orderid+")";
		}else{
			sql="update ordercontent set orderstate=0 where orderid=?";
			params.add(orderid);
		}
		System.out.println(sql);
		return db.update(sql, params);
	}

	public int total() {
		String sql = "select count(orderid) from ordercontent";
		return (int)db.findPloymer(sql, null);

	}

	public List<OrderContent> find(Integer pageNo, Integer pageSize) {
		String sql="select * from (select a.*,rownum rn from (select distinct orderid,uname,starttime,orderstate,ordersum from ordercontent o," +
				"bquserinfo b where o.usid=b.usid and orderstate!=0 order by orderid) a where rownum<=?)b where rn>?";
		List<Object> params = new ArrayList<Object>();
		params.add(pageSize*pageNo);
		params.add((pageNo-1)*pageSize);
		return db.find(sql,params,OrderContent.class);
	}

	public OrderContent find(int orderid) {
		String sql="select * from ordercontent where orderid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(orderid);
		List<OrderContent> list=db.find(sql, params, OrderContent.class);
		if(list!=null && list.size()>0){
			return list.get(0);
		} else{
			return null;
		}
	}

	public int update(int id, int money) {
		String sql = "update ordercontent set ordersum=? where orderid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(money);
		params.add(id);
		return db.update(sql, params);
	}

	public List<OrderContent> find(String orderid,String uname,String ndate,String oid,Map<String, String> map,Integer pageNo,Integer pageSize){
		String sql="select * from (select a.*,rownum rn from (select orderid,uname,starttime,ordersum,orderstate from ordercontent o,bquserinfo b "+
				" where b.usid=o.usid";
		List<Object> params = new ArrayList<Object>();
		if(orderid!=null && !"".equals(orderid)){
			sql+=" and orderid=?";
			params.add(orderid);
		}
		
		if(uname!=null && !"".equals(uname)){
			sql+=" and uname like ?";
			params.add("%"+uname+"%");
		}
		
		if(ndate!=null && !"".equals(ndate)){
			sql+=" and starttime=to_date(?,'yyyy-mm-dd')";
			params.add(ndate);
		}
		
		if(oid!=null && !"".equals(oid)){
			sql+=" and orderstate=?";
			params.add(oid);
		}
		
		if(map!=null && map.size()>0){
			Set<String> keys = map.keySet();
			for(String key:keys){
				sql+=" and "+key+"=?";
				params.add(map.get(key));
			}
		}
		
		sql+=" order by starttime desc) a where rownum<=?) b where rn>?";
		System.out.println(sql);
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, OrderContent.class);
	}

	public int changeToPei(String orderid) {
		List<Object> params = new ArrayList<Object>();
		String sql;
		if(orderid.contains(",") && orderid.indexOf("or")<=0){
			sql="update orderform set status=2 where orderid in("+orderid+")";
		}else{
			sql="update orderform set status=2 where orderid=?";
			params.add(orderid);
		}
		db.update(sql, params);
		params.clear();
		if(orderid.contains(",") && orderid.indexOf("or")<=0){
			sql="update ordercontent set orderstate=3 where orderid in("+orderid+")";
			
		}else{
			sql="update ordercontent set orderstate=3 where orderid=?";
			params.add(orderid);
		}
		System.out.println(sql);
		return db.update(sql, params);
	}

	public int changeToFa(String orderid) {
		List<Object> params = new ArrayList<Object>();
		String sql;
		if(orderid.contains(",") && orderid.indexOf("or")<=0){
			sql="update orderform set status=3 where orderid in("+orderid+")";
		}else{
			sql="update orderform set status=3 where orderid=?";
			params.add(orderid);
		}
		db.update(sql, params);
		params.clear();
		if(orderid.contains(",") && orderid.indexOf("or")<=0){
			sql="update ordercontent set orderstate=4 where orderid in("+orderid+")";
		}else{
			sql="update ordercontent set orderstate=4 where orderid=?";
			params.add(orderid);
		}
		System.out.println(sql);
		return db.update(sql, params);
	}

}
