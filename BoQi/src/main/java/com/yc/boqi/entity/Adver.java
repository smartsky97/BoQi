package com.yc.boqi.entity;

import java.io.Serializable;

public class Adver implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int adverid;
	private String advpic;
	private String audience;
	private String astdate;
	private String aendate;
	private int anumber;
	
	
	public Adver() {
		super();
	}


	public Adver(int adverid, String advpic, String audience, String astdate,
			String aendate, int anumber) {
		super();
		this.adverid = adverid;
		this.advpic = advpic;
		this.audience = audience;
		this.astdate = astdate;
		this.aendate = aendate;
		this.anumber = anumber;
	}


	public int getAdverid() {
		return adverid;
	}


	public void setAdverid(int adverid) {
		this.adverid = adverid;
	}


	public String getAdvpic() {
		return advpic;
	}


	public void setAdvpic(String advpic) {
		this.advpic = advpic;
	}


	public String getAudience() {
		return audience;
	}


	public void setAudience(String audience) {
		this.audience = audience;
	}


	public String getAstdate() {
		return astdate;
	}


	public void setAstdate(String astdate) {
		this.astdate = astdate;
	}


	public String getAendate() {
		return aendate;
	}


	public void setAendate(String aendate) {
		this.aendate = aendate;
	}


	public int getAnumber() {
		return anumber;
	}


	public void setAnumber(int anumber) {
		this.anumber = anumber;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + adverid;
		result = prime * result + ((advpic == null) ? 0 : advpic.hashCode());
		result = prime * result + ((aendate == null) ? 0 : aendate.hashCode());
		result = prime * result + anumber;
		result = prime * result + ((astdate == null) ? 0 : astdate.hashCode());
		result = prime * result
				+ ((audience == null) ? 0 : audience.hashCode());
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
		Adver other = (Adver) obj;
		if (adverid != other.adverid)
			return false;
		if (advpic == null) {
			if (other.advpic != null)
				return false;
		} else if (!advpic.equals(other.advpic))
			return false;
		if (aendate == null) {
			if (other.aendate != null)
				return false;
		} else if (!aendate.equals(other.aendate))
			return false;
		if (anumber != other.anumber)
			return false;
		if (astdate == null) {
			if (other.astdate != null)
				return false;
		} else if (!astdate.equals(other.astdate))
			return false;
		if (audience == null) {
			if (other.audience != null)
				return false;
		} else if (!audience.equals(other.audience))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "Adver [adverid=" + adverid + ", advpic=" + advpic
				+ ", audience=" + audience + ", astdate=" + astdate
				+ ", aendate=" + aendate + ", anumber=" + anumber + "]";
	}
	
	
	
	
	
	
}
