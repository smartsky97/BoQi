package com.yc.boqi.entity;

import java.io.Serializable;

public class orderBasic implements Serializable{

	private static final long serialVersionUID = -7579828825297852541L;
	private int orderid;
	private String addname;
	private double ordersum;
	private int orderstate;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getAddname() {
		return addname;
	}
	public void setAddname(String addname) {
		this.addname = addname;
	}
	public double getOrdersum() {
		return ordersum;
	}
	public void setOrdersum(double ordersum) {
		this.ordersum = ordersum;
	}
	public int getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(int orderstate) {
		this.orderstate = orderstate;
	}
	@Override
	public String toString() {
		return "orderBasic [orderid=" + orderid + ", addname=" + addname
				+ ", ordersum=" + ordersum + ", orderstate=" + orderstate + "]";
	}
	public orderBasic(int orderid, String addname, double ordersum,
			int orderstate) {
		super();
		this.orderid = orderid;
		this.addname = addname;
		this.ordersum = ordersum;
		this.orderstate = orderstate;
	}
	public orderBasic() {
		super();
	}
	
}
