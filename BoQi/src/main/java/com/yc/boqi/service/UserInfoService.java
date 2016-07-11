package com.yc.boqi.service;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.CollectPro;
import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.entity.orderBasic;
import com.yc.boqi.entity.orderPicture;

public interface UserInfoService {
	//lsp:鐧诲綍
	public UserInfo login(UserInfo user);
	
	int register(UserInfo userInfo);
		
	public int total();
	/**
	 * 鏌ヨ涓�釜璁板綍
	 * @param aid
	 * @return
	 */
	public UserInfo find(int aid);
	
	public List<UserInfo> find(String uname,String email,String status,Integer pageNo,Integer pageSize);

	List<UserInfo> getUserInfo(int usid);

	List<OrderForm> getOrderInfo(int usid);

	int getwzfNum();

	int getfinish();

	int getpingjia();

	int deleteOrder(int orderid);
	//鍒嗛〉鏌ヨ鐢ㄦ埛
	List<UserInfo> getPageUsers(Map<String,Object> map);
	//鑾峰彇鐢ㄦ埛鎬绘暟
	int getUserTotal();
	//鏍规嵁yonghuid鑾峰彇鐢ㄦ埛淇℃伅
	UserInfo getUserByUsid(int usid);
	//绛涢�鏌ヨ
	List<UserInfo> findUserByInfo(Map<String,Object> map);
	
	int updateyue(int usid,double money,int id);
	
	double selectmoney(int usid);

	public int updateUserInfo(UserInfo userInfo);

	public List<orderPicture> getpicture(int usid);

	public List<orderBasic> selectBasic(int usid);

	public int querenshouhuo(int orderid);

	public int deleteOrder1(int orderid);

	public int querenshouhuo1(int orderid);

	public int getorderStatus(int orderid);

//	public List<CollectPro> getCollectPro(int usid);
}
