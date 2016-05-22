package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IDogProductDao;
import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.SecondMenu;

public class DogProductDaoImpl implements IDogProductDao {
	DBHelper db=new DBHelper();
	public List<Productinfo> findDogPro(Integer pageNo, Integer pageSize) {
		String sql="select * from(select a.*,rownum rn from (select *from productinfo where suitpet='狗' order by proid) a where rownum<=?) b where rn>?";
		List<Object> params=new ArrayList<Object>();
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, Productinfo.class);
	}
	public int DogProTotal() {
		String sql="select count(proid)  from productinfo where suitpet='狗'";
		return (int)db.findPloymer(sql, null);
	}
	public List<Brand> findDogProBrand() {
		String sql="select * from brand where status=1";
		List<Brand> list=db.find(sql, null, Brand.class);
		return list;
	}
	public List<SecondMenu> findDogProType() {
		String sql="select * from secondmenu where status=1";
		List<SecondMenu> list=db.find(sql, null, SecondMenu.class);
		return list;
	}
	public int addDogPro(Productinfo pro) {
		String sql="insert into productinfo values(seq_proid.nextval,?,?,?,?,?,?,?,?,?,?,?,?,null,null)";
		List<Object> params=new ArrayList<Object>();
		params.add(pro.getProname());
		params.add(pro.getNature());
		params.add(pro.getBrandid());
		params.add(pro.getTid());
		params.add(pro.getSuitpet());
		params.add(pro.getPictrue());
		params.add(pro.getPromarprice());
		params.add(pro.getBqpri());
		params.add(pro.getProsales());
		params.add(pro.getProintro());
		params.add(pro.getInventory());
		params.add(pro.getStatus());
		int result=db.update(sql, params);
		return result;
	}
	public Productinfo findProByProid(int proid) {
		String sql="select *from productinfo where proid=? and suitpet='狗'";
		List<Object> params=new ArrayList<Object>();
		params.add(proid);
		Productinfo list=(Productinfo)db.find(sql, params, Productinfo.class).get(0);
		return list;
	}
	

}
