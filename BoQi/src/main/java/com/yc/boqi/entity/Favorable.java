package com.yc.boqi.entity;

import java.io.Serializable;

public class Favorable implements Serializable{

	private static final long serialVersionUID = 1L;
	private int favorableid;
	private int proid;
	private String fstdate;
	private String fendate;
	private double actprice;
	private String favinfo;
	private int status;
	
	
	
	
	
	public Favorable() {
		super();
	}
	public Favorable(int favorableid, int proid, String fstdate,
			String fendate, double actprice, String favinfo, int status) {
		super();
		this.favorableid = favorableid;
		this.proid = proid;
		this.fstdate = fstdate;
		this.fendate = fendate;
		this.actprice = actprice;
		this.favinfo = favinfo;
		this.status = status;
	}
	public int getFavorableid() {
		return favorableid;
	}
	public void setFavorableid(int favorableid) {
		this.favorableid = favorableid;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getFstdate() {
		return fstdate;
	}
	public void setFstdate(String fstdate) {
		this.fstdate = fstdate;
	}
	public String getFendate() {
		return fendate;
	}
	public void setFendate(String fendate) {
		this.fendate = fendate;
	}
	public double getActprice() {
		return actprice;
	}
	public void setActprice(double actprice) {
		this.actprice = actprice;
	}
	public String getFavinfo() {
		return favinfo;
	}
	public void setFavinfo(String favinfo) {
		this.favinfo = favinfo;
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
		return "Favorable [favorableid=" + favorableid + ", proid=" + proid
				+ ", fstdate=" + fstdate + ", fendate=" + fendate
				+ ", actprice=" + actprice + ", favinfo=" + favinfo
				+ ", status=" + status + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(actprice);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((favinfo == null) ? 0 : favinfo.hashCode());
		result = prime * result + favorableid;
		result = prime * result + ((fendate == null) ? 0 : fendate.hashCode());
		result = prime * result + ((fstdate == null) ? 0 : fstdate.hashCode());
		result = prime * result + proid;
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
		Favorable other = (Favorable) obj;
		if (Double.doubleToLongBits(actprice) != Double
				.doubleToLongBits(other.actprice))
			return false;
		if (favinfo == null) {
			if (other.favinfo != null)
				return false;
		} else if (!favinfo.equals(other.favinfo))
			return false;
		if (favorableid != other.favorableid)
			return false;
		if (fendate == null) {
			if (other.fendate != null)
				return false;
		} else if (!fendate.equals(other.fendate))
			return false;
		if (fstdate == null) {
			if (other.fstdate != null)
				return false;
		} else if (!fstdate.equals(other.fstdate))
			return false;
		if (proid != other.proid)
			return false;
		if (status != other.status)
			return false;
		return true;
	}
	
	
	
}
