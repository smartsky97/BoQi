package com.yc.boqi.entity;

import java.io.Serializable;

public class Address implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int addid;
	private int usid;
	private int postcode;
	private String addname;
	private String tel;
	private String shen;
	private String shi;
	private String xian;
	private String zhenjie;
	private String readdr;
	private int status;

	public Address() {
		super();
	}

	public String getShen() {
		return shen;
	}

	public void setShen(String shen) {
		this.shen = shen;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getXian() {
		return xian;
	}

	public void setXian(String xian) {
		this.xian = xian;
	}

	public String getZhenjie() {
		return zhenjie;
	}

	public void setZhenjie(String zhenjie) {
		this.zhenjie = zhenjie;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
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

	@Override
	public String toString() {
		return "Address [addid=" + addid + ", usid=" + usid + ", postcode="
				+ postcode + ", addname=" + addname + ", tel=" + tel
				+ ", shen=" + shen + ", shi=" + shi + ", xian=" + xian
				+ ", zhenjie=" + zhenjie + ", readdr=" + readdr + ", status="
				+ status + "]";
	}

	public Address(int addid, int usid, int postcode, String addname, String tel,
			String shen, String shi, String xian, String zhenjie,
			String readdr, int status) {
		super();
		this.addid = addid;
		this.usid = usid;
		this.postcode = postcode;
		this.addname = addname;
		this.tel = tel;
		this.shen = shen;
		this.shi = shi;
		this.xian = xian;
		this.zhenjie = zhenjie;
		this.readdr = readdr;
		this.status = status;
	}

}
