package com.yc.boqi.entity;

import java.io.Serializable;

public class ShopCarBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int proid;
	private String proname;
	private String nature;
	private double bqpri;
	private String pictrue;
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
	public ShopCarBean() {
		super();
	}
	
	public String getPictrue() {
		return pictrue;
	}
	public void setPictrue(String pictrue) {
		this.pictrue = pictrue;
	}
	public ShopCarBean(int proid, String proname, String nature, double bqpri,
			String pictrue, int usid, int inventory) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.nature = nature;
		this.bqpri = bqpri;
		this.pictrue = pictrue;
		this.usid = usid;
		this.inventory = inventory;
	}
	@Override
	public String toString() {
		return "ShopCarBean [proid=" + proid + ", proname=" + proname
				+ ", nature=" + nature + ", bqpri=" + bqpri + ", pictrue="
				+ pictrue + ", usid=" + usid + ", inventory=" + inventory + "]";
	}
}
