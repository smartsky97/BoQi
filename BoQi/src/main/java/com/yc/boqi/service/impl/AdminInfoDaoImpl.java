package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IAdminInfoDao;
import com.yc.boqi.entity.BqAdmin;
import com.yc.boqi.util.MD5Encryption;

public class AdminInfoDaoImpl implements IAdminInfoDao {
	private DBHelper db = new DBHelper();
	
	public BqAdmin login(BqAdmin BqAdmin) {
		String sql = "select adid,aname,pwd,weight from bqadmin where aname=? and pwd=?";
		List<Object> params = new ArrayList<Object>();
		params.add(BqAdmin.getAname());
		params.add(BqAdmin.getPwd());
		//params.add(MD5Encryption.createPassword(BqAdmin.getPwd()));
		List<BqAdmin> list = db.find(sql, params, BqAdmin.class);
		if(list != null && list.size()>0){
			return list.get(0);
		}else{ 
			return null;
		}
	}

	public int addBqAdmin(BqAdmin BqAdmin) {
		String sql = "insert into bqadmin values(seq_aid.nextval,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		System.out.println(sql);
		params.add(BqAdmin.getAname());
		params.add(MD5Encryption.createPassword(BqAdmin.getPwd()));
		return db.update(sql, params);
	}

	public int updatePwd(int aid, String oldPwd, String newPwd) {
		String sql = "update bqadmin set pwd=? where adid=? and pwd=?";
		List<Object> params = new ArrayList<Object>();
		params.add(MD5Encryption.createPassword(newPwd));
		params.add(aid);
		params.add(oldPwd);
		return db.update(sql, params);
	}

	public int updateBqAdmin(BqAdmin BqAdmin) {
		String sql = "update bqadmin set aname=?,pwd=? where adid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(BqAdmin.getAname());
		params.add(MD5Encryption.createPassword(BqAdmin.getPwd()));
		params.add(BqAdmin.getAdid());
		return db.update(sql, params);
	}

	public int del(String aid) {
		List<Object> params = new ArrayList<Object>();
		String sql;
		if(aid.contains(",") && aid.indexOf("or")<=0){
			sql="delete from bqadmin where adid in("+aid+")";
		}else{
			sql="delete from bqadmin where adid=?";
			params.add(aid);
		}
		return db.update(sql, params);
	}

	public int total() {
		String sql="select count(adid) from bqadmin";
		return (int)db.findPloymer(sql, null);

	}

	public List<BqAdmin> find(Integer pageNo, Integer pageSize) {
		String sql = "select * from (select a.*,rownum rn from (select * from bqadmin order by adid) a where rownum<=?) b where rn>?";
		List<Object> params = new ArrayList<Object>();
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql,params,BqAdmin.class);

	}

	public BqAdmin find(int aid) {
		String sql = "select adid,aname,pwd,weight from bqadmin where aid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(aid);
		List<BqAdmin> list = db.find(sql, params, BqAdmin.class);
		if(list != null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}



}
