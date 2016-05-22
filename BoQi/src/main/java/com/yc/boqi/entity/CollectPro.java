package com.yc.boqi.entity;

import java.io.Serializable;

public class CollectPro implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int usid;
	private int proid;
	
	
	
	
	
	public CollectPro() {
		super();
	}
	public CollectPro(int usid, int proid) {
		super();
		this.usid = usid;
		this.proid = proid;
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
	@Override
	public String toString() {
		return "CollectPro [usid=" + usid + ", proid=" + proid + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + proid;
		result = prime * result + usid;
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
		CollectPro other = (CollectPro) obj;
		if (proid != other.proid)
			return false;
		if (usid != other.usid)
			return false;
		return true;
	}
	
}
