package com.yc.boqi.entity;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

public class OrderForm implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int orderid;//订单编号oc
	private int proid;//商品编号o
	private String nature;//商品属性p
	private String proname;//商品名称p
	private int pronum;//购买数量o
	private double bqpri;//波奇价o
	private String ordersum;//订单金额oc
	private String addname;//收货人a
	private int status;//订单状态o
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
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public int getPronum() {
		return pronum;
	}
	public void setPronum(int pronum) {
		this.pronum = pronum;
	}
	public double getBqpri() {
		return bqpri;
	}
	public void setBqpri(double bqpri) {
		this.bqpri = bqpri;
	}
	public String getOrdersum() {
		return ordersum;
	}
	public void setOrdersum(String ordersum) {
		this.ordersum = ordersum;
	}
	public String getAddname() {
		return addname;
	}
	public void setAddname(String addname) {
		this.addname = addname;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "OrderForm [orderid=" + orderid + ", proid=" + proid
				+ ", nature=" + nature + ", proname=" + proname + ", pronum="
				+ pronum + ", bqpri=" + bqpri + ", ordersum=" + ordersum
				+ ", addname=" + addname + ", status=" + status + "]";
	}
	public OrderForm(int orderid, int proid, String nature, String proname,
			int pronum, double bqpri, String ordersum, String addname,
			int status) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.nature = nature;
		this.proname = proname;
		this.pronum = pronum;
		this.bqpri = bqpri;
		this.ordersum = ordersum;
		this.addname = addname;
		this.status = status;
	}
	public OrderForm() {
		super();
	}
	
	

}
