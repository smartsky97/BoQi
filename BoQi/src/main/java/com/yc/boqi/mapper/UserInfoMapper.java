package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.CollectPro;
import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.entity.orderBasic;
import com.yc.boqi.entity.orderPicture;

public interface UserInfoMapper {
	UserInfo getUserByUser(UserInfo user);
	int getRegister(UserInfo userInfo);
	List<UserInfo> selectUserInfo(Object object);

	List<OrderForm> selectOrderInfo(int usid);

	int selectwzg();

	int selectfinish();

	int selectpingjia();

	int delOrder(int orderid);
	//鍒嗛〉鏌ヨ鐢ㄦ埛
	List<UserInfo> getPageUsers(Map<String,Object> map);
	//鑾峰彇鐢ㄦ埛鎬绘暟
	int getUserTotal();
	//鏍规嵁yonghuid鑾峰彇鐢ㄦ埛淇℃伅
	UserInfo getUserByUsid(int usid);
	//绛涢�鏌ヨ
	List<UserInfo> findUserByInfo(Map<String,Object> map);
	int updateyue(Map<String, Object> pa);
	
	double selectmoney(int usid);
//	List<CollectPro> getCollectInfo(int usid);
	//修改个人资料
	int changeUserInfo(UserInfo userInfo);
	//获取订单图片
	List<orderPicture> getpicInfo(int usid);
	List<orderBasic> getbasicorder(int usid);
	int checkshouhuo(int orderid);
	int delOrder1(int orderid);
	int checkshouhuo1(int orderid);
	int getOrderStatusByid(int orderid);
}
