package com.yc.boqi.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.yc.boqi.service.DBHelper;
import com.yc.boqi.service.IPetDao;
import com.yc.boqi.entity.Pet;

public class PetDaoImpl implements IPetDao {
	DBHelper db=new DBHelper();
	
	public int addPet(Pet pet) {
		String sql="insert into pet values(seq_petid.nextval,?,?,?,?,?,?,?,?,?,?,?,'','')";
		List<Object> params=new ArrayList<Object>();
		params.add(pet.getPetname());
		params.add(pet.getPetpic());
		params.add(pet.getPettype());
		params.add(pet.getEngname());
		params.add(pet.getAncehome());
		params.add(pet.getLife());
		params.add(pet.getPetprice());
		params.add(pet.getCharacter());
		params.add(pet.getPetintro());
		params.add(pet.getConserveinfo());
		params.add(pet.getFeedinfo());
		return db.update(sql, params);
	}
	public int delBk(String petids){
		List<Object> params=new ArrayList<Object>();
		String sql;
		if(petids.contains(",") && petids.indexOf("or")<=0){
			sql="delete from pet where petid in("+petids+")";
		}else{
			sql="delete from pet where petid=?";
			params.add(petids);
		}
		return db.update(sql, params);
	}

	public int delPet(Pet pet) {
		String sql="delete from pet where petid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(pet.getPetid());
		return db.update(sql, params);
	}

	public int updatePet(Pet pet) {
		String sql="update pet set petid=petid";
		List<Object> params=new ArrayList<Object>();
		String temp=pet.getPetname();
		if(temp!=null && !"".equals(temp)){
			sql+=",petname=? ";
			params.add(temp);
		}
		
		
		temp=pet.getPetpic();
		if(temp!=null && !"".equals(temp)){
			sql+=",petpic=? ";
			params.add(temp);
		}
		
		
		temp=pet.getPettype();
		if(temp!=null && !"".equals(temp)){
			sql+=",pettype=? ";
			params.add(temp);
		}
		
		temp=pet.getEngname();
		if(temp!=null && !"".equals(temp)){
			sql+=",engname=? ";
			params.add(temp);
		}
		
		temp=pet.getAncehome();
		if(temp!=null && !"".equals(temp)){
			sql+=",ancehome=? ";
			params.add(temp);
		}
		
		temp=String.valueOf(pet.getLife());
		if(temp!=null && !"".equals(temp)){
			sql+=",life=? ";
			params.add(temp);
		}
		
		temp=String.valueOf(pet.getPetprice());
		if(temp!=null && !"".equals(temp)){
			sql+=",petprice=? ";
			params.add(temp);
		}
		
		temp=pet.getCharacter();
		if(temp!=null && !"".equals(temp)){
			sql+=",character=? ";
			params.add(temp);
		}
		
		temp=pet.getPetintro();
		if(temp!=null && !"".equals(temp)){
			sql+=",petintro=? ";
			params.add(temp);
		}
		
		temp=pet.getConserveinfo();
		if(temp!=null && !"".equals(temp)){
			sql+=",conserveinfo=? ";
			params.add(temp);
		}
		
		temp=pet.getFeedinfo();
		if(temp!=null && !"".equals(temp)){
			sql+=",feedinfo=? ";
			params.add(temp);
		}
		
		sql+=" where petid=? ";
		params.add(pet.getPetid());
		
		return db.update(sql, params);
	}

	public Pet find(String petName) {
		String sql="select *from pet where petname=?";
		List<Object> params=new ArrayList<Object>();
		params.add(petName);
		Pet pet=(Pet)db.find(sql, params, Pet.class);
		return pet;
	}
	public Pet find(int petId) {
		String sql="select *from pet where petid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(petId);
		Pet pet=(Pet)db.find(sql, params, Pet.class).get(0);
		return pet;
	}

	public List<Pet> find(Integer pageNo, Integer pageSize) {
		String sql="select * from(select a.*,rownum rn from (select petid,petname,petpic,pettype,engname,ancehome,life,petprice,character,petintro,conserveinfo,feedinfo from pet order by petid) a where rownum<=?) b where rn>?";
		List<Object> params=new ArrayList<Object>();
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, Pet.class);
	}

	public int total() {
		String sql="select count(petid) from pet";
		return (int)db.findPloymer(sql, null);
	}

}
