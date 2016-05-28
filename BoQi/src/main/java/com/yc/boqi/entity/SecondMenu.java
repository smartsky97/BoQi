package com.yc.boqi.entity;

import java.io.Serializable;

public class SecondMenu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int tid;
	private int fid;
	private String tname;
	private int status;
	
	public SecondMenu() {
		super();
	}
	public SecondMenu(int tid, int fid, String tname, int status) {
		super();
		this.tid = tid;
		this.fid = fid;
		this.tname = tname;
		this.status = status;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
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
	@Override
	public String toString() {
		return "SecondMenu [tid=" + tid + ", fid=" + fid + ", tname=" + tname
				+ ", status=" + status + "]";
	}
	
}
