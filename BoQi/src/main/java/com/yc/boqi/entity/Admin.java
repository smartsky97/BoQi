package com.yc.boqi.entity;

import java.io.Serializable;

public class Admin implements Serializable{
	private static final long serialVersionUID = 1L;
	private int adid;
	private String aname;
	private String pwd;
	private int weight;
	public int getAdid() {
		return adid;
	}
	public void setAdid(int adid) {
		this.adid = adid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public Admin() {
		super();
	}
	public Admin(int adid, String aname, String pwd, int weight) {
		super();
		this.adid = adid;
		this.aname = aname;
		this.pwd = pwd;
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "Admin [adid=" + adid + ", aname=" + aname + ", pwd=" + pwd
				+ ", weight=" + weight + "]";
	}
}	
