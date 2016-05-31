package com.yc.boqi.entity;

import java.io.Serializable;

public class UserInfo implements Serializable{
	

	private static final long serialVersionUID = 4776840133395467897L;
	private int usid;
	private String uname;
	private String registerpwd;
	private String paypwd;
	private String userpic;
	private String sex;
	private String tel;
	private int bqdou;
	private double money;
	private String birthday;
	private String city;
	private String street;
	private String profession;
	private int qq;
	private String email;
	private String hobbypet;
	private int status;
	private String yanzheng;
	
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRegisterpwd() {
		return registerpwd;
	}
	public void setRegisterpwd(String registerpwd) {
		this.registerpwd = registerpwd;
	}
	public String getPaypwd() {
		return paypwd;
	}
	public void setPaypwd(String paypwd) {
		this.paypwd = paypwd;
	}
	public String getUserpic() {
		return userpic;
	}
	public void setUserpic(String userpic) {
		this.userpic = userpic;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getBqdou() {
		return bqdou;
	}
	public void setBqdou(int bqdou) {
		this.bqdou = bqdou;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public int getQq() {
		return qq;
	}
	public void setQq(int qq) {
		this.qq = qq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHobbypet() {
		return hobbypet;
	}
	public void setHobbypet(String hobbypet) {
		this.hobbypet = hobbypet;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getYanzheng() {
		return yanzheng;
	}
	public void setYanzheng(String yanzheng) {
		this.yanzheng = yanzheng;
	}
	@Override
	public String toString() {
		return "UserInfo [usid=" + usid + ", uname=" + uname + ", registerpwd="
				+ registerpwd + ", paypwd=" + paypwd + ", userpic=" + userpic
				+ ", sex=" + sex + ", tel=" + tel + ", bqdou=" + bqdou
				+ ", money=" + money + ", birthday=" + birthday + ", city="
				+ city + ", street=" + street + ", profession=" + profession
				+ ", qq=" + qq + ", email=" + email + ", hobbypet=" + hobbypet
				+ ", status=" + status + ", yanzheng=" + yanzheng + "]";
	}
	public UserInfo(int usid, String uname, String registerpwd, String paypwd,
			String userpic, String sex, String tel, int bqdou, double money,
			String birthday, String city, String street, String profession,
			int qq, String email, String hobbypet, int status, String yanzheng) {
		super();
		this.usid = usid;
		this.uname = uname;
		this.registerpwd = registerpwd;
		this.paypwd = paypwd;
		this.userpic = userpic;
		this.sex = sex;
		this.tel = tel;
		this.bqdou = bqdou;
		this.money = money;
		this.birthday = birthday;
		this.city = city;
		this.street = street;
		this.profession = profession;
		this.qq = qq;
		this.email = email;
		this.hobbypet = hobbypet;
		this.status = status;
		this.yanzheng = yanzheng;
	}
	public UserInfo() {
	}
}
