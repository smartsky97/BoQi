package com.yc.boqi.entity;

import java.io.Serializable;

public class ShopCar implements Serializable{
	private static final long serialVersionUID = 1L;
	private int proid;
	private int usid;
	private int inventory;
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
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
	public ShopCar() {
		super();
	}
	public ShopCar(int proid, int usid, int inventory) {
		super();
		this.proid = proid;
		this.usid = usid;
		this.inventory = inventory;
	}
	@Override
	public String toString() {
		return "ShopCar [proid=" + proid + ", usid=" + usid + ", inventory="
				+ inventory + "]";
	}
}
