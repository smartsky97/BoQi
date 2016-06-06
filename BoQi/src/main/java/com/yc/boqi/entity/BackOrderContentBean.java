package com.yc.boqi.entity;

import java.io.Serializable;
import java.util.List;

public class BackOrderContentBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int usid;
	private String uname;
	private String postcode;
	private String utel;
	private int addid;
	private String addname;
	private String atel;
	private String shen;
	private String shi;
	private String xian;
	private String zhenjie;
	private String readdr;
	private int orderid;
	private String starttime;
	private String paytime;
	private String endtime;
	private List<BackOrderFromBean> goods;
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public int getAddid() {
		return addid;
	}
	public void setAddid(int addid) {
		this.addid = addid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getAddname() {
		return addname;
	}
	public void setAddname(String addname) {
		this.addname = addname;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	public String getShen() {
		return shen;
	}
	public void setShen(String shen) {
		this.shen = shen;
	}
	public String getShi() {
		return shi;
	}
	public void setShi(String shi) {
		this.shi = shi;
	}
	public String getXian() {
		return xian;
	}
	public void setXian(String xian) {
		this.xian = xian;
	}
	public String getZhenjie() {
		return zhenjie;
	}
	public void setZhenjie(String zhenjie) {
		this.zhenjie = zhenjie;
	}
	public String getReaddr() {
		return readdr;
	}
	public void setReaddr(String readdr) {
		this.readdr = readdr;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getPaytime() {
		return paytime;
	}
	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public List<BackOrderFromBean> getGoods() {
		return goods;
	}
	public void setGoods(List<BackOrderFromBean> goods) {
		this.goods = goods;
	}	
	public BackOrderContentBean() {
		super();
	}
	@Override
	public String toString() {
		return "BackOrderContentBean [usid=" + usid + ", uname=" + uname
				+ ", postcode=" + postcode + ", utel=" + utel + ", addid="
				+ addid + ", addname=" + addname + ", atel=" + atel + ", shen="
				+ shen + ", shi=" + shi + ", xian=" + xian + ", zhenjie="
				+ zhenjie + ", readdr=" + readdr + ", orderid=" + orderid
				+ ", starttime=" + starttime + ", paytime=" + paytime
				+ ", endtime=" + endtime + ", goods=" + goods + "]";
	}
	public BackOrderContentBean(int usid, String uname, String postcode,
			String utel, int addid, String addname, String atel, String shen,
			String shi, String xian, String zhenjie, String readdr,
			int orderid, String starttime, String paytime, String endtime,
			List<BackOrderFromBean> goods) {
		super();
		this.usid = usid;
		this.uname = uname;
		this.postcode = postcode;
		this.utel = utel;
		this.addid = addid;
		this.addname = addname;
		this.atel = atel;
		this.shen = shen;
		this.shi = shi;
		this.xian = xian;
		this.zhenjie = zhenjie;
		this.readdr = readdr;
		this.orderid = orderid;
		this.starttime = starttime;
		this.paytime = paytime;
		this.endtime = endtime;
		this.goods = goods;
	}
	
}
