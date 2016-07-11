package com.yc.boqi.action;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.boqi.entity.CollectPro;
import com.yc.boqi.entity.OrderForm;
import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.entity.orderBasic;
import com.yc.boqi.entity.orderPicture;
import com.yc.boqi.service.UserInfoService;
import com.yc.boqi.util.AllSessions;



@Controller("userAction")
public class UserAction implements ModelDriven<UserInfo>,SessionAware{
	private UserInfo userInfo;
	private int orderid;
	private String email;
	private List<UserInfo> rows;
	private String calendarHour;
	private String calendarMinute;
	private String calendarMonth;
	private String calendarSecond;
	private String calendarYear;
	

	public String getCalendarHour() {
		return calendarHour;
	}
	public String getCalendarMinute() {
		return calendarMinute;
	}
	public String getCalendarMonth() {
		return calendarMonth;
	}
	public String getCalendarSecond() {
		return calendarSecond;
	}
	public String getCalendarYear() {
		return calendarYear;
	}
	public String getEmail() {
		return email;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	@Autowired
	private JavaMailSender javaMailSender;//邮件发送对象
	@Autowired
	private UserInfoService userInfoService;
	
	private Map<String,Object> session;
	
	/**
	 * 注册
	 * @shawn
	 */
	public String register(){
		System.out.println(userInfo.getEmail());
		System.out.println(userInfo.getRegisterpwd());
		System.out.println(userInfo.getUname());
		System.out.println(session.get("yanzheng"));
		System.out.println(userInfo.getYanzheng());
		if(userInfo.getYanzheng().equals(session.get("yanzheng"))){
			int reg=userInfoService.register(userInfo);
			System.out.println(reg);
			return "registerSuccess";
		}else{
			return "registerFalse";
		}
		
	}
	/**
	* 个人主页信息查询
	* @shawn
	*/
	@SuppressWarnings("null")
	public String userInfo(){
		int[] temp=new int[100];
		int num=0;
		int[] flag=new int[100];
		boolean bool=false;
		userInfo=(UserInfo) session.get(AllSessions.LOGIN_USER);
		System.out.println(userInfo.getUsid());
		List<UserInfo> userInf=userInfoService.getUserInfo(userInfo.getUsid());
		session.put("grzyUserInfo", userInf);
		List<OrderForm> orderInfo=userInfoService.getOrderInfo(userInfo.getUsid());
		session.put("grzyOrderInfo", orderInfo);
		int weizhifunum=userInfoService.getwzfNum();
		session.put("weizhifu", weizhifunum);
		int finishnum=userInfoService.getfinish();
		session.put("finish", finishnum);
		int pingjianum=userInfoService.getpingjia();
		session.put("pingjia", pingjianum);
		List<orderPicture> getpic=userInfoService.getpicture(userInfo.getUsid());
		System.out.println(getpic.size()+"图片"+getpic);
		for(int i=0;i<getpic.size();i++){
			orderPicture oPic=getpic.get(i);
			if(oPic.getPictrue().contains(",")){
				String[] pic=oPic.getPictrue().split(",");
				System.out.println(pic[0]);
				getpic.get(i).setPictrue(pic[0]);
			}
			
		}
		session.put("orderpic", getpic);
		System.out.println(session.get("orderpic"));
		List<orderBasic> getBasicOrder=userInfoService.selectBasic(userInfo.getUsid());
		session.put("orderBasic", getBasicOrder);
//		List<CollectPro> favourite=userInfoService.getCollectPro(userInfo.getUsid());
//		session.put("collectPro",favourite);
		return "getuserInfo";
	}
	
	//删除订单
	public String deleteOrder(){
		int del=userInfoService.deleteOrder(orderid);
		if(del>0){
			System.out.println("删除订单成功...");
		}
		int del1=userInfoService.deleteOrder1(orderid);
		userInfo();
		return "redirectMyBoQi";
	}
	//注销
	public String loginOut() {
		session.put("loginUser","");
		System.out.println(session.get(AllSessions.LOGIN_USER));
		System.out.println("注销成功...");
		return "index";
	}

	//修改个人资料
	public String changeUserInfo(){
		System.out.println(userInfo);
		System.out.println(userInfo.getBirthday());
		userInfo=(UserInfo) session.get(AllSessions.LOGIN_USER);
		System.out.println(userInfo.getUsid());
		int rst=userInfoService.updateUserInfo(userInfo);
		List<UserInfo> userInf=userInfoService.getUserInfo(userInfo.getUsid());
		session.put("grzyUserInfo", userInf);
		if(rst>0){
			session.put("errorInfo", "修改成功!!!");
		}else{
			session.put("errorInfo", "修改失败!!!");
		}
		return null;
		
	}
	
	public String queren(){
		int status=userInfoService.getorderStatus(userInfo.getOrderid());
		if(status==4){
			int shouhuo=userInfoService.querenshouhuo(userInfo.getOrderid());
			int shouhuo1=userInfoService.querenshouhuo1(userInfo.getOrderid());
			return "redirectMyBoQi";
		}else{
			session.put("errorInfo", "确认收货失败!!!");
		}
		return null;
		
		
	}
	
	
	/**
	 * 发送验证邮件
	 */
	public void yanzheng(){
		Random r=new Random();
		String rn="";
		for(int i=0;i<5;i++){
			rn+=String.valueOf(r.nextInt(9));
		}
		System.out.println(rn);
		System.out.println(userInfo.getEmail());
		SimpleMailMessage smm = new SimpleMailMessage();//邮件信息类
		smm.setFrom("hwlcy0820@163.com");//邮件发送者
		smm.setTo(userInfo.getEmail());//邮件接收者
		smm.setSubject("波奇网邮件验证");
		smm.setText("波奇网邮箱验证码为："+rn);//邮件内容
		//session.clear();
		session.put("yanzheng", rn);
		javaMailSender.send(smm);//发送邮件
		System.out.println("发送完毕...");
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	@Override
	public UserInfo getModel() {
		userInfo=new UserInfo();
		return userInfo;
	}
}
