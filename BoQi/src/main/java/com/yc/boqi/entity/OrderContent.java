package com.yc.boqi.entity;

import java.io.Serializable;

public class OrderContent implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int orderid;
	private int orderstate;
	private int usid;
	private String readdr;
	private String starttime;
	private String paytime;
	private String endtime;
	private double ordersum;  //鎬讳粯閽�
	private String uname;

	public OrderContent() {
		super();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((endtime == null) ? 0 : endtime.hashCode());
		result = prime * result + orderid;
		result = prime * result + orderstate;
		long temp;
		temp = Double.doubleToLongBits(ordersum);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((paytime == null) ? 0 : paytime.hashCode());
		result = prime * result + ((readdr == null) ? 0 : readdr.hashCode());
		result = prime * result
				+ ((starttime == null) ? 0 : starttime.hashCode());
		result = prime * result + ((uname == null) ? 0 : uname.hashCode());
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
		OrderContent other = (OrderContent) obj;
		if (endtime == null) {
			if (other.endtime != null)
				return false;
		} else if (!endtime.equals(other.endtime))
			return false;
		if (orderid != other.orderid)
			return false;
		if (orderstate != other.orderstate)
			return false;
		if (Double.doubleToLongBits(ordersum) != Double
				.doubleToLongBits(other.ordersum))
			return false;
		if (paytime == null) {
			if (other.paytime != null)
				return false;
		} else if (!paytime.equals(other.paytime))
			return false;
		if (readdr == null) {
			if (other.readdr != null)
				return false;
		} else if (!readdr.equals(other.readdr))
			return false;
		if (starttime == null) {
			if (other.starttime != null)
				return false;
		} else if (!starttime.equals(other.starttime))
			return false;
		if (uname == null) {
			if (other.uname != null)
				return false;
		} else if (!uname.equals(other.uname))
			return false;
		if (usid != other.usid)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OrderContent [orderid=" + orderid + ", orderstate="
				+ orderstate + ", usid=" + usid + ", readdr=" + readdr
				+ ", starttime=" + starttime + ", paytime=" + paytime
				+ ", endtime=" + endtime + ", ordersum=" + ordersum
				+ ", uname=" + uname + "]";
	}

	public int getOrderid() {
		return orderid;
	}

	public int getOrderids() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}



	public int getOrderstate() {
		return orderstate;
	}



	public void setOrderstate(int orderstate) {
		this.orderstate = orderstate;
	}



	public int getUsid() {
		return usid;
	}



	public void setUsid(int usid) {
		this.usid = usid;
	}



	public String getReaddr() {
		return readdr;
	}



	public void setReaddr(String readdr) {
		this.readdr = readdr;
	}



	public String getStarttime() {
		return starttime;
	}

	public String getStarttime10() {
		return starttime.substring(0,10);
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}



	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}



	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}


	public double getOrdersum() {
		return ordersum;
	}



	public void setOrdersum(double ordersum) {
		this.ordersum = ordersum;
	}



	public String getuname() {
		return uname;
	}



	public void setuname(String uname) {
		this.uname = uname;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	



	
	
	
	
	
}
