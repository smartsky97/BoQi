package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.SecondMenu;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IBrandDao;

public class BrandDaoImpl implements IBrandDao {
	DBHelper db=new DBHelper();
	public int addBrand(Brand brand) {
		String sql="insert into brand values (seq_brandid.nextval,?,1,'','')";
		List<Object> params=new ArrayList<Object>();
		params.add(brand.getBrandName());
		return db.update(sql, params);
		
	}

	public int delBrand(String brandid) {
		List<Object> params=new ArrayList<Object>();
		String sql;
		if(brandid.contains(",") && brandid.indexOf("or")<=0){
			sql="update brand set status=0 where brandid in("+brandid+")";
		}else{
			sql="update brand set status=0 where brandid=?";
			params.add(brandid);
		}
		return db.update(sql, params);
	}

	public int updateBrand(int brandid,String brandname,int status) {
		String sql="update brand set brandname=?,status=? where brandid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(brandname);
		params.add(status);
		params.add(brandid);
		return db.update(sql, params);
	}

	

	public Brand find(int brandid) {
		String sql="select *from brand where brandid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(brandid);
		List<Brand> list=db.find(sql, params, Brand.class);
		return list.get(0);
	}

	

	
	public List<Brand> find(Integer pageNo, Integer pageSize) {
		String sql="select * from(select a.*,rownum rn from (select *from brand order by brandid) a where rownum<=?) b where rn>?";
		List<Object> params=new ArrayList<Object>();
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		List<Brand> list=db.find(sql, params,Brand.class);
		return list;
	}
	
	public int total() {
		String sql="select count(brandid) from brand";
		return (int)db.findPloymer(sql, null);
	}


	public SecondMenu findType(int tid){
		String sql="select *from secondmenu where tid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(tid);
		SecondMenu sm=(SecondMenu) db.find(sql, params, SecondMenu.class).get(0);
		return sm;
	}
	

}
