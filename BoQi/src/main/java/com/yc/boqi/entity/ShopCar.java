package com.yc.boqi.entity;

import java.io.Serializable;

public class ShopCar implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int proid;
	private String proname;
	private String nature;
	private double bqpri;
	private String picture;
	private int usid;
	private int inventory;
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
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public double getBqpri() {
		return bqpri;
	}
	public void setBqpri(double bqpri) {
		this.bqpri = bqpri;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ShopCar [proid=" + proid + ", proname=" + proname + ", nature="
				+ nature + ", bqpri=" + bqpri + ", picture=" + picture
				+ ", usid=" + usid + ", inventory=" + inventory + "]";
	}
	public ShopCar(int proid, String proname, String nature, double bqpri,
			String picture, int usid, int inventory) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.nature = nature;
		this.bqpri = bqpri;
		this.picture = picture;
		this.usid = usid;
		this.inventory = inventory;
	}
	public ShopCar() {
		super();
	}
	
	
	
	
}
