package com.yc.boqi.entity;

import java.io.Serializable;

public class CollectPro implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int usid;
	private int proid;
	private String proname;
	private String picture;
	
	
	
	
	public CollectPro() {
		super();
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "CollectPro [usid=" + usid + ", proid=" + proid + ", proname="
				+ proname + ", picture=" + picture + "]";
	}
	public CollectPro(int usid, int proid, String proname, String picture) {
		super();
		this.usid = usid;
		this.proid = proid;
		this.proname = proname;
		this.picture = picture;
	}
	
	
}
