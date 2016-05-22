package com.yc.boqi.entity;

import java.io.Serializable;

public class OrderForm implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int orderid;
	private int proid;
	private String nature;
	private String proname;
	private int pronum;
	private double bqpri;
	private String orrmid;
	




	public OrderForm(int orderid, int proid, String nature, String proname,
			int pronum, double bqpri, String orrmid, int status) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.nature = nature;
		this.proname = proname;
		this.pronum = pronum;
		this.bqpri = bqpri;
		this.orrmid = orrmid;
		this.status = status;
	}








	public String getOrrmid() {
		return orrmid;
	}








	public void setOrrmid(String orrmid) {
		this.orrmid = orrmid;
	}




	private int status;
	
	
	
	
	public OrderForm() {
		super();
	}








	public String getNature() {
		return nature;
	}








	public void setNature(String nature) {
		this.nature = nature;
	}









	@Override
	public String toString() {
		return "OrderForm [orderid=" + orderid + ", proid=" + proid
				+ ", nature=" + nature + ", proname=" + proname + ", pronum="
				+ pronum + ", bqpri=" + bqpri + ", orrmid=" + orrmid
				+ ", status=" + status + "]";
	}








	public int getOrderid() {
		return orderid;
	}

	public int getOrderids() {
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




	public int getStatus() {
		return status;
	}




	public void setStatus(int status) {
		this.status = status;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}



}
