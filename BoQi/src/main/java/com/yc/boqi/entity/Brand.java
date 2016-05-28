package com.yc.boqi.entity;

import java.io.Serializable;

public class Brand implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int brandid;  //品牌编号
	private String brandName; //品牌名称
	private int status;  //品牌状态
	
	
	
	public Brand() {
		super();
	}
	public Brand(int brandid, String brandName, int status) {
		super();
		this.brandid = brandid;
		this.brandName = brandName;
		this.status = status;
	}
	public int getbrandid() {
		return brandid;
	}
	public void setbrandid(int brandid) {
		this.brandid = brandid;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
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
		return "Brand [brandid=" + brandid + ", brandName=" + brandName
				+ ", status=" + status + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + brandid;
		result = prime * result
				+ ((brandName == null) ? 0 : brandName.hashCode());
		result = prime * result + status;
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
		Brand other = (Brand) obj;
		if (brandid != other.brandid)
			return false;
		if (brandName == null) {
			if (other.brandName != null)
				return false;
		} else if (!brandName.equals(other.brandName))
			return false;
		if (status != other.status)
			return false;
		return true;
	}
	
	
	
	
}
