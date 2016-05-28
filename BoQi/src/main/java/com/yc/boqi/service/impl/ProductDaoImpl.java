package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.FirstMenu;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.SecondMenu;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IProductDao;

public class ProductDaoImpl implements IProductDao {
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
	
	public Productinfo find(int orderid) {
		String sql="select o.orderid,orderstate,usid,readdr,starttime,paytime,endtime,ordersum,proname from "+
				"ordercontent o,productinfo p,orderform om where om.orderid=o.orderid and om.proid=p.proid and o.orderid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(orderid);
		List<Productinfo> list=db.find(sql, params, Productinfo.class);
		if(list!=null && list.size()>0){
			return list.get(0);
		} else{
			return null;
		}
	}
	public Productinfo findAproduct(String orderid) {
		String sql = "select * from productinfo where proid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(orderid);
		List<Productinfo> list=db.find(sql, params, Productinfo.class);
		if(list!=null && list.size()>0){
			return list.get(0);
		} else{
			return null;
		}
	}
	public List<Productinfo> find(String name) {
		String[] tnames = name.split(",");
		String sql = "";
		List<Object> params = new ArrayList<Object>();
		int i=0;
		for(i=0;i<tnames.length-1;i++){
			sql+="select proid,proname,nature from productinfo where proname=? union ";
			params.add(tnames[i]);
		}
		sql+="select proid,proname,nature from productinfo where proname=?";
		System.out.println(sql);
		
		params.add(tnames[i]);
		return db.find(sql,params,Productinfo.class);	
	}
	public Productinfo find(String proname, String nature) {
		String sql = "select * from productinfo where proname=? and nature=?";
		List<Object> params = new ArrayList<Object>();
		params.add(proname);
		params.add(nature);
		List<Productinfo> list=db.find(sql, params, Productinfo.class);
		if(list!=null && list.size()>0){
			return list.get(0);
		} else{
			return null;
		}
	}
	public List<Productinfo> getTopNumInfo(int number) {
		String sql = "select *from(select t.*,row_number() over (partition by t.tid order by t.proid desc) RN from " +
				"productinfo t) where RN <=?";
		List<Object> params = new ArrayList<Object>();
		params.add(number);
		return db.find(sql, params, Productinfo.class);
	}
	public List<Productinfo> findProByInfo(String fid,String tid,String brandid,String type,Integer pageNo, Integer pageSize){
		List<Object> params=new ArrayList<Object>();
		String sql="select * from(select a.*,rownum rn from (select proid,proname,nature,b.brandname,s.tname,suitpet,pictrue,promarprice,bqpri,prosales,prointro,inventory,p.status from productinfo p,brand b,secondmenu s,firstmenu f where  p.tid=s.tid and b.brandid=p.brandid and f.fid=s.fid ";
		if(fid!=null && !"".equals(fid)){
			sql+="and f.fid=? ";
			params.add(fid);
		}
		if(tid!=null && !"".equals(tid)){
			sql+="and s.tid=? ";
			params.add(tid);
		}
		if(brandid!=null && !"".equals(brandid)){
			sql+="and b.brandid=? ";
			params.add(brandid);
		}
		
		sql+="and suitpet=? and p.status in(0,1) order by proid) a where rownum<=?) b where rn>?";
		params.add(type);
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, Productinfo.class);
		
	}
	
	public List<Productinfo> findProByName(String fname,String tname,String brandname,Integer pageNo, Integer pageSize){
		List<Object> params=new ArrayList<Object>();
		String sql="select * from(select a.*,rownum rn from (select proid,proname,nature,b.brandname,s.tname,suitpet,pictrue,promarprice,bqpri,prosales,prointro,inventory,p.status from productinfo p,brand b,secondmenu s,firstmenu f where  p.tid=s.tid and b.brandid=p.brandid and f.fid=s.fid ";
		if(fname!=null && !"".equals(fname)){
			sql+="and f.fname=? ";
			params.add(fname);
		}
		if(tname!=null && !"".equals(tname)){
			sql+="and s.tname=? ";
			params.add(tname);
		}
		if(brandname!=null && !"".equals(brandname)){
			sql+="and b.brandname=? ";
			params.add(brandname);
		}
		
		sql+=" and p.status=1 order by prosales) a where rownum<=?) b where rn>?";
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, Productinfo.class);
		
	}
	
	public List<Productinfo> findTypePro(Integer pageNo, Integer pageSize,String tyPe) {
		String sql="select * from(select a.*,rownum rn from (select proid,proname,nature,b.brandname,s.tname,suitpet,pictrue,promarprice,bqpri,prosales,prointro,inventory,p.status from productinfo p,brand b,secondmenu s where p.tid=s.tid and b.brandid=p.brandid and  suitpet=? and p.status in(0,1) order by proid) a where rownum<=?) b where rn>?";
		List<Object> params=new ArrayList<Object>();
		params.add(tyPe);
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		System.out.println("dfas--->"+sql);
		return db.find(sql, params, Productinfo.class);
	}
	public int ProTotal(String tyPe) {
		String sql="select count(proid)  from productinfo where suitpet=?";
		List<Object> params=new ArrayList<Object>();
		params.add(tyPe);
		return (int)db.findPloymer(sql, params);
	}
	public List<Brand> findProBrand() {
		String sql="select * from brand where status=1";
		List<Brand> list=db.find(sql, null, Brand.class);
		return list;
	}
	public List<SecondMenu> findProType(String type) {
		String sql="select tid,tname from secondmenu s,firstmenu f where s.fid=f.fid and pet=? and s.status=1";
		List<Object> params=new ArrayList<Object>();
		params.add(type);
		List<SecondMenu> list=db.find(sql, params, SecondMenu.class);
		return list;
	}
	public int addPro(Productinfo pro) {
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
		String sql="select * from productinfo where proid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(proid);
		Productinfo list=(Productinfo)db.find(sql, params, Productinfo.class).get(0);
		return list;
	}
	public int uptProInfo(Productinfo pro) {
		String sql="update productinfo set proid=proid";
		List<Object> params=new ArrayList<Object>();
		String temp=pro.getProname();
		if(temp!=null && !"".equals(temp)){
			sql+=",proname=? ";
			params.add(temp);
		}
		temp=pro.getNature();
		if(temp!=null && !"".equals(temp)){
			sql+=",nature=? ";
			params.add(temp);
		}
		temp=String.valueOf(pro.getBrandid());
		if(temp!=null && !"".equals(temp)){
			sql+=",brandid=? ";
			params.add(temp);
		}
		temp=String.valueOf(pro.getTid());
		if(temp!=null && !"".equals(temp)){
			sql+=",tid=? ";
			params.add(temp);
		}
		temp=pro.getSuitpet();
		if(temp!=null && !"".equals(temp)){
			sql+=",suitpet=? ";
			params.add(temp);
		}
		temp=pro.getPictrue();
		if(temp!=null && !"".equals(temp)){
			sql+=",pictrue=? ";
			params.add(temp);
		}
		temp=String.valueOf(pro.getPromarprice());
		if(temp!=null && !"".equals(temp)){
			sql+=",promarprice=? ";
			params.add(temp);
		}
		temp=String.valueOf(pro.getBqpri());
		if(temp!=null && !"".equals(temp)){
			sql+=",bqpri=? ";
			params.add(temp);
		}
		temp=String.valueOf(pro.getProsales());
		if(temp!=null && !"".equals(temp)){
			sql+=",prosales=? ";
			params.add(temp);
		}
		temp=pro.getProintro();
		if(temp!=null && !"".equals(temp)){
			sql+=",prointro=? ";
			params.add(temp);
		}
		temp=String.valueOf(pro.getInventory());
		if(temp!=null && !"".equals(temp)){
			sql+=",inventory=? ";
			params.add(temp);
		}
		temp=String.valueOf(pro.getStatus());
		if(temp!=null && !"".equals(temp)){
			sql+=",status=? ";
			params.add(temp);
		}
		
		sql+="where proid=?";
		params.add(pro.getProid());
		int result=db.update(sql, params);
		return result;
	}
	public int delProInfo(String proids) {
		List<Object> params=new ArrayList<Object>();
		String sql;
		if(proids.contains(",") && proids.indexOf("or")<=0){
			sql="update productinfo set status=3  where proid in("+proids+")";
		}else{
			sql="update productinfo set status=3  where proid=?";
			params.add(proids);
		}
		return db.update(sql, params);
	}
	public List<FirstMenu> findFirInfo(String type) {
		String sql="select *from firstmenu where pet=?";
		List<Object> params=new ArrayList<Object>();
		params.add(type);
		return db.find(sql, params, FirstMenu.class);
	}
	public List<SecondMenu> findsbyf(String fid){
		String sql="select * from secondmenu where fid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(Integer.valueOf(fid));
		return db.find(sql, params, SecondMenu.class);
	}
	public List<Productinfo> getSearchByCi(Integer pageNo, Integer pageSize,String ci,String order) {
		String sql = "select * from(select a.*,rownum rn from (select * from productinfo  where proname like ? order by "+order+") a where "
					+"rownum<=?) b where rn>?";
		System.out.println(sql);
		List<Object> params = new ArrayList<Object>();
		params.add("%"+ci+"%");
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, Productinfo.class);
	}
	public int getallNum(String ci) {
		String sql = "select count(*) from productinfo  where proname like ?";

		List<Object> params = new ArrayList<Object>();
		params.add("%"+ci+"%");
		return (int)db.findPloymer(sql, params);
	}
	public List<String> findAllPinpai(String ci) {
		String sql = "select distinct(brandname),count(*) from brand b,productinfo p where p.proname like ? and p.brandid=b.brandid group by brandname";
		List<Object> params = new ArrayList<Object>();
		params.add("%"+ci+"%");		
		return db.findPloyerss(sql,params);
	}
}
