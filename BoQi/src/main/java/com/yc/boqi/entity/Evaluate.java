package com.yc.boqi.entity;

import java.io.Serializable;

public class Evaluate implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int orderid;
	private int proid;
	private int usid;
	private String evacontent;
	private String revacontent;
	private String edate;
	private String buypic;
	private int estate;
	private int status;
	
	
	
	public Evaluate() {
		super();
	}
	public Evaluate(int orderid, int proid, int usid, String evacontent,
			String revacontent, String edate, String buypic, int estate,
			int status) {
		super();
		this.orderid = orderid;
		this.proid = proid;
		this.usid = usid;
		this.evacontent = evacontent;
		this.revacontent = revacontent;
		this.edate = edate;
		this.buypic = buypic;
		this.estate = estate;
		this.status = status;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
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
	public String getEvacontent() {
		return evacontent;
	}
	public void setEvacontent(String evacontent) {
		this.evacontent = evacontent;
	}
	public String getRevacontent() {
		return revacontent;
	}
	public void setRevacontent(String revacontent) {
		this.revacontent = revacontent;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getBuypic() {
		return buypic;
	}
	public void setBuypic(String buypic) {
		this.buypic = buypic;
	}
	public int getEstate() {
		return estate;
	}
	public void setEstate(int estate) {
		this.estate = estate;
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
		return "Evaluate [orderid=" + orderid + ", proid=" + proid + ", usid="
				+ usid + ", evacontent=" + evacontent + ", revacontent="
				+ revacontent + ", edate=" + edate + ", buypic=" + buypic
				+ ", estate=" + estate + ", status=" + status + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((buypic == null) ? 0 : buypic.hashCode());
		result = prime * result + ((edate == null) ? 0 : edate.hashCode());
		result = prime * result + estate;
		result = prime * result
				+ ((evacontent == null) ? 0 : evacontent.hashCode());
		result = prime * result + orderid;
		result = prime * result + proid;
		result = prime * result
				+ ((revacontent == null) ? 0 : revacontent.hashCode());
		result = prime * result + status;
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
		Evaluate other = (Evaluate) obj;
		if (buypic == null) {
			if (other.buypic != null)
				return false;
		} else if (!buypic.equals(other.buypic))
			return false;
		if (edate == null) {
			if (other.edate != null)
				return false;
		} else if (!edate.equals(other.edate))
			return false;
		if (estate != other.estate)
			return false;
		if (evacontent == null) {
			if (other.evacontent != null)
				return false;
		} else if (!evacontent.equals(other.evacontent))
			return false;
		if (orderid != other.orderid)
			return false;
		if (proid != other.proid)
			return false;
		if (revacontent == null) {
			if (other.revacontent != null)
				return false;
		} else if (!revacontent.equals(other.revacontent))
			return false;
		if (status != other.status)
			return false;
		if (usid != other.usid)
			return false;
		return true;
	}
	
	
	
}
