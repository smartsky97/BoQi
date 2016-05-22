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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + fid;
		result = prime * result + status;
		result = prime * result + tid;
		result = prime * result + ((tname == null) ? 0 : tname.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SecondMenu other = (SecondMenu) obj;
		if (fid != other.fid)
			return false;
		if (status != other.status)
			return false;
		if (tid != other.tid)
			return false;
		if (tname == null) {
			if (other.tname != null)
				return false;
		} else if (!tname.equals(other.tname))
			return false;
		return true;
	}
	
	
	
}
