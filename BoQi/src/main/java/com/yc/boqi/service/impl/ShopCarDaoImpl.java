package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.ShopCarDao;
import com.yc.boqi.entity.ShopCar;

public class ShopCarDaoImpl implements ShopCarDao{
	DBHelper db=new DBHelper();
	public int addProduct(ShopCar shopCar) {
		String sql="insert into shopcar values(?,?,?,null,null)"; //商品编号 ，用户编号，商品数量
		List<Object> params=new ArrayList<Object>();
		params.add(shopCar.getProid());
		params.add(shopCar.getUsid());
		params.add(shopCar.getInventory());
		System.out.println(shopCar.getProid()+" - "+shopCar.getUsid()+" - "+shopCar.getInventory());
		return db.update(sql, params);
	}

	public int changeInventory(int proid,int usid,int inventory) {
		String sql="update shopcar set inventory=? where proid=? and usid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(inventory);
		params.add(proid);
		params.add(usid);
		return db.update(sql, params);
	}

	public int delete(int proid) {
		List<Object> params=new ArrayList<Object>();
		String sql="delete from shopcar where proid=?";
		params.add(proid);
		return db.update(sql, params);
	}

	public List<ShopCar> find(Integer pageNo,Integer pageSize,String uname) {
		String sql="select * from (select a.*,rownum rn from (select p.proid,p.pictrue,p.proname,p.nature,p.bqpri,s.inventory,p.bqpri*s.inventory  from shopcar s,productinfo p where s.proid=p.proid and usid in(select usid from bquserinfo where uname=?)) a where rownum<?) b where rn>?";
		List<Object> params=new ArrayList<Object>();
		params.add(uname);
		params.add(pageNo*pageSize);  //当前页号*信息数
		params.add((pageNo-1)*pageSize); //当前页号-1*信息数    sql语句从pageNo*pageSize>?>(pageNo-1)*pageSize中查询
		System.out.println("****>"+uname);
		return db.find(sql, params,ShopCar.class);
	}

	public List<ShopCar> findSingle(int usid, int proid) {
		String sql="select * from shopcar where usid=? and proid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(usid);
		params.add(proid);
		return db.find(sql, params,ShopCar.class);
	}
}
