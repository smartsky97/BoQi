package com.yc.boqi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.mapper.UserInfoMapper;
import com.yc.boqi.service.UserInfoService;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	  
	@Override
	public UserInfo login(UserInfo user) {
		return userInfoMapper.getUserByUser(user);
	}

	 
	@Override
	public int total() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserInfo find(int aid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int register(UserInfo userInfo) {
		int reg=userInfoMapper.getRegister(userInfo);
		return reg;
	}

	@Override
	public List<UserInfo> find(String uname, String email, String status, Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	
	/*public int addUser(UserInfo user) {
		String sql="insert into bquserinfo values(seq_usid.nextval,?,?,666666,null,'男','12345678910',0,0,null,null,null,null,null,?,null,null,null)";
		List<Object> params=new ArrayList<Object>();
		params.add(user.getUname());
		params.add(user.getRegisterpwd());
		params.add(user.getEmail());
		
		return db.update(sql, params);
	}

	public int updateRegisterPwd(int usid, String oldPwd, String newPwd) {
		String sql="update bquserinfo set registerpwd=? where usid=? and registerpwd=?";
		List<Object> params=new ArrayList<Object>();
		params.add(usid);
		params.add(oldPwd);
		params.add(newPwd);
		return db.update(sql, params);
	}

	public int updatePayPwd(int usid, String oldPwd, String newPwd) {
		String sql="update bquserinfo set paypwd=? where usid=? and paypwd=?";
		List<Object> params=new ArrayList<Object>();
		params.add(usid);
		params.add(oldPwd);
		params.add(newPwd);
		return db.update(sql, params);
	}

	public int changeUname(int usid, String newName) {
		String sql="update bquserinfo set uname=? where usid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(newName);
		params.add(usid);
		return db.update(sql, params);
	}

	public int updateUserInfo(UserInfo user) {
		String sql="update bquserinfo set usid=usid";
		List<Object> params=new ArrayList<Object>();
		
		String temp=user.getUname();
		if(temp!=null && !"".equals(temp)){
			sql+=",uname=? ";
			params.add(temp);
		}
		temp=user.getRegisterpwd();
		if(temp!=null && !"".equals(temp)){
			sql+=",registerpwd=? ";
			params.add(temp);
		}
		temp=String.valueOf(user.getPaypwd());
		if(temp!=null && !"".equals(temp)){
			sql+=",paypwd=? ";
			params.add(temp);
		}
		temp=user.getUserpic();
		if(temp!=null && !"".equals(temp)){
			sql+=",userpic=? ";
			params.add(temp);
		}
		temp=user.getSex();
		if(temp!=null && !"".equals(temp)){
			sql+=",sex=? ";
			params.add(temp);
		}
		temp=String.valueOf(user.getTel());
		if(temp!=null && !"".equals(temp)){
			sql+=",tel=? ";
			params.add(temp);
		}
		temp=String.valueOf(user.getBqdou());
		if(temp!=null && !"".equals(temp)){
			sql+=",bqdou=? ";
			params.add(temp);
		}
		temp=String.valueOf(user.getMoney());
		if(temp!=null && !"".equals(temp)){
			sql+=",money=? ";
			params.add(temp);
		}
		temp=user.getBirthday();
		if(temp!=null && !"".equals(temp)){
			sql+=",birthday=? ";
			params.add(temp);
		}
		temp=user.getCity();
		if(temp!=null && !"".equals(temp)){
			sql+=",city=? ";
			params.add(temp);
		}
		temp=user.getStreet();
		if(temp!=null && !"".equals(temp)){
			sql+=",street=? ";
			params.add(temp);
		}
		temp=user.getProfession();
		if(temp!=null && !"".equals(temp)){
			sql+=",profession=? ";
			params.add(temp);
		}
		temp=String.valueOf(user.getQq());
		if(temp!=null && !"".equals(temp)){
			sql+=",qq=? ";
			params.add(temp);
		}
		temp=user.getEmail();
		if(temp!=null && !"".equals(temp)){
			sql+=",email=? ";
			params.add(temp);
		}
		temp=user.getHobbypet();
		if(temp!=null && !"".equals(temp)){
			sql+=",email=? ";
			params.add(temp);
		}
		sql+=",1,test1=null,test2=null where usid=?";
		
		return 0;
	}

	public List<UserInfo> find(Integer pageNo, Integer pageSize) {
		String sql="select * from(select a.*,rownum rn from (select *from bquserinfo order by usid) a where rownum<=?) b where rn>?";
		List<Object> params=new ArrayList<Object>();
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params,UserInfo.class);
	}
	
	public int total() {
		String sql="select count(usid) from bquserinfo";
		return (int)db.findPloymer(sql, null);
	}
	public UserInfo find(int usid) {
		String sql = "select * from bquserinfo where usid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(usid);
		List<UserInfo> list = db.find(sql, params, UserInfo.class);
		if(list != null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public List<UserInfo> find(String uname, String email, String status,Integer pageNo, Integer pageSize) {
		String sql="select * from (select a.*,rownum rn from (select usid,uname,email,status,money from bquserinfo "+
				" where qq!=154564645 ";
		List<Object> params = new ArrayList<Object>();
		if(uname!=null && !"".equals(uname)){
			sql+=" and uname like ?";
			params.add("%"+uname+"%");
		}
		
		if(email!=null && !"".equals(email)){
			sql+=" and email like ?";
			params.add("%"+email+"%");
		}
		
		if(status!=null && !"".equals(status)){
			sql+=" and status=?";
			params.add(status);
		}
		
		sql+=" order by usid) a where rownum<=?) b where rn>?";
		System.out.println(sql);
		System.out.println(params);
		params.add(pageNo*pageSize);
		params.add((pageNo-1)*pageSize);
		return db.find(sql, params, UserInfo.class);
	}*/
}
