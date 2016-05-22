package com.yc.boqi.entity;

import java.io.Serializable;

public class Address implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int addid;
	private int usid;
	private int postcode;
	private String addname;
	private int tel;
	private String readdr;
	private int status;
	
	
	public Address() {
		super();
	}


	@Override
	public String toString() {
		return "Address [usid=" + usid + ", postcode=" + postcode + ", tel="
				+ tel + ", readdr=" + readdr + ", status=" + status
				+ ", addid=" + addid + ", addname=" + addname + "]";
	}




	public Address(int addid, int usid, int postcode, String addname, int tel,
			String readdr, int status) {
		super();
		this.addid = addid;
		this.usid = usid;
		this.postcode = postcode;
		this.addname = addname;
		this.tel = tel;
		this.readdr = readdr;
		this.status = status;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + addid;
		result = prime * result + ((addname == null) ? 0 : addname.hashCode());
		result = prime * result + postcode;
		result = prime * result + ((readdr == null) ? 0 : readdr.hashCode());
		result = prime * result + status;
		result = prime * result + tel;
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
		Address other = (Address) obj;
		if (addid != other.addid)
			return false;
		if (addname == null) {
			if (other.addname != null)
				return false;
		} else if (!addname.equals(other.addname))
			return false;
		if (postcode != other.postcode)
			return false;
		if (readdr == null) {
			if (other.readdr != null)
				return false;
		} else if (!readdr.equals(other.readdr))
			return false;
		if (status != other.status)
			return false;
		if (tel != other.tel)
			return false;
		if (usid != other.usid)
			return false;
		return true;
	}


	public int getUsid() {
		return usid;
	}


	public void setUsid(int usid) {
		this.usid = usid;
	}


	public int getPostcode() {
		return postcode;
	}


	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}


	public int getTel() {
		return tel;
	}


	public void setTel(int tel) {
		this.tel = tel;
	}


	public String getReaddr() {
		return readdr;
	}


	public void setReaddr(String readdr) {
		this.readdr = readdr;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getAddid() {
		return addid;
	}


	public void setAddid(int addid) {
		this.addid = addid;
	}


	public String getAddname() {
		return addname;
	}


	public void setAddname(String addname) {
		this.addname = addname;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
