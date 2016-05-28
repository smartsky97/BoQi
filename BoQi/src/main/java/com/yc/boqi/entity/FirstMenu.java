package com.yc.boqi.entity;

import java.io.Serializable;

public class FirstMenu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int fid;
	private String fname;
	private int status;
	private String pet;
	
	
	
	
	public FirstMenu() {
		super();
	}
	public FirstMenu(int fid, String fname, int status, String pet) {
		super();
		this.fid = fid;
		this.fname = fname;
		this.status = status;
		this.pet = pet;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPet() {
		return pet;
	}
	public void setPet(String pet) {
		this.pet = pet;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "FirstMenu [fid=" + fid + ", fname=" + fname + ", status="
				+ status + ", pet=" + pet + "]";
	}
	
}
