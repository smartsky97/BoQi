package com.yc.boqi.entity;

import java.io.Serializable;
import java.util.List;

public class OrderContentBean  implements Serializable{
	private static final long serialVersionUID = -2104955984962568052L;
	private int orderid;
	private int orderstate;
	private int usid;
	private int addid;
	private String starttime;
	private String paytime;
	private String endtime;
	private double ordersum;  
	private String uname;
	private List<OrderForm> orderforms;
	private String orders;  //前台的数据拼接
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(int orderstate) {
		this.orderstate = orderstate;
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
	public double getOrdersum() {
		return ordersum;
	}
	public void setOrdersum(double ordersum) {
		this.ordersum = ordersum;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public List<OrderForm> getOrderforms() {
		return orderforms;
	}
	public void setOrderforms(List<OrderForm> orderforms) {
		this.orderforms = orderforms;
	}
	public OrderContentBean() {
		super();
	}
	public OrderContentBean(int orderid, int orderstate, int usid, int addid,
			String starttime, String paytime, String endtime, double ordersum,
			String uname, List<OrderForm> orderforms) {
		super();
		this.orderid = orderid;
		this.orderstate = orderstate;
		this.usid = usid;
		this.addid = addid;
		this.starttime = starttime;
		this.paytime = paytime;
		this.endtime = endtime;
		this.ordersum = ordersum;
		this.uname = uname;
		this.orderforms = orderforms;
	}
	@Override
	public String toString() {
		return "OrderContentBean [orderid=" + orderid + ", orderstate="
				+ orderstate + ", usid=" + usid + ", addid=" + addid
				+ ", starttime=" + starttime + ", paytime=" + paytime
				+ ", endtime=" + endtime + ", ordersum=" + ordersum
				+ ", uname=" + uname + ", orderforms=" + orderforms + "]";
	}
	
	

}
