package com.yc.boqi.entity;

public class BqAdmin {
	private int adid;
	private String aname;
	private String pwd;
	private int weight;
	
	
	
	
	public BqAdmin() {
		super();
	}
	
	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getAdid() {
		return adid;
	}
	public void setAdid(int adid) {
		this.adid = adid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "BqAdmin [adid=" + adid + ", aname=" + aname + ", pwd=" + pwd
				+ ", weight=" + weight + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + adid;
		result = prime * result + ((aname == null) ? 0 : aname.hashCode());
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		result = prime * result + weight;
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
		BqAdmin other = (BqAdmin) obj;
		if (adid != other.adid)
			return false;
		if (aname == null) {
			if (other.aname != null)
				return false;
		} else if (!aname.equals(other.aname))
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		if (weight != other.weight)
			return false;
		return true;
	}


	public BqAdmin(int adid, String aname, String pwd, int weight) {
		super();
		this.adid = adid;
		this.aname = aname;
		this.pwd = pwd;
		this.weight = weight;
	}

}
