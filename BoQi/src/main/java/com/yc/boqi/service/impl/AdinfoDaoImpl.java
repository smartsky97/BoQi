package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IAdinfoDao;
import com.yc.boqi.entity.Adver;
import com.yc.boqi.entity.Pet;

public class AdinfoDaoImpl implements IAdinfoDao{
	DBHelper db=new DBHelper();
	
	public int addAd(Adver adver) {
		String sql="insert into adver values(seq_adverid.nextval,?,?,to_date(?,'yyyy-MM-dd'),to_date(?,'yyyy-MM-dd'),0,'','')";
		List<Object> params=new ArrayList<Object>();
		params.add(adver.getAdvpic());
		params.add(adver.getAudience());
		params.add(adver.getAstdate());
		params.add(adver.getAendate());
		return db.update(sql, params);
	}


	public int updateAd(Adver adver) {
		String sql="update adver set adverid=adverid";
		List<Object> params=new ArrayList<Object>();
		String temp=adver.getAdvpic();
		if(temp!=null && !"".equals(temp)){
			sql+=",advpic=? ";
			params.add(temp);
		}
		temp=adver.getAudience();
		if(temp!=null && !"".equals(temp)){
			sql+=",audience=?";
			params.add(temp);
		}
		temp=adver.getAstdate();
		if(temp!=null && !"".equals(temp)){
			sql+=",astdate=to_date(?,'yyyy-MM-dd') ";
			params.add(temp);
		}
		temp=adver.getAendate();
		if(temp!=null && !"".equals(temp)){
			sql+=",aendate=to_date(?,'yyyy-MM-dd')  ";
			params.add(temp);
		}
		sql+="where adverid=?";
		params.add(adver.getAdverid());
		return db.update(sql, params);
	}

	public Adver find(int adverid) {
		String sql="select adverid,advpic,audience,astdate,aendate,anumber from adver where adverid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(adverid);
		Adver ad=(Adver) db.find(sql, params, Adver.class).get(0);
		return ad;
	}

	public List<Adver> find(Integer pageNo, Integer pageSize) {
		String sql="select * from(select a.*,rownum rn from (select adverid,advpic,audience,astdate,aendate,anumber from adver order by adverid) a where rownum<=?) b where rn>?"; 
		List<Object> params=new ArrayList<Object>();
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, Adver.class);
	}

	public int total() {
		String sql="select count(adverid) from adver";
		return (int)db.findPloymer(sql, null);
	}

	public int delAd(String adverids) {
		List<Object> params=new ArrayList<Object>();
		String sql;
		if(adverids.contains(",") && adverids.indexOf("or")<=0){
			sql="delete from adver where adverid in("+adverids+")";
		}else{
			sql="delete from adver where adverid=?";
			params.add(adverids);
		}
		return db.update(sql, params);
	}

}
