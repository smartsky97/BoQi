package com.yc.boqi.entity;

import java.io.Serializable;

public class orderPicture implements Serializable {

	private static final long serialVersionUID = -2197041833106690464L;
	private int orderid;
	private int proid;
	private String pictrue;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getPictrue() {
		return pictrue;
	}
	public void setPictrue(String pictrue) {
		this.pictrue = pictrue;
	}
	@Override
	public String toString() {
		return "orderPicture [orderid=" + orderid + ", proid=" + proid
				+ ", pictrue=" + pictrue + "]";
	}
	public orderPicture(int orderid, int proid, String pictrue) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.pictrue = pictrue;
	}
	public orderPicture() {
		super();
	}
	
	
}
