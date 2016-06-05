package com.yc.boqi.entity;

import java.io.Serializable;

public class BackOrderFromBean implements Serializable{
	private static final long serialVersionUID = 1L;

	private int proid;
	private String proname;
	private String pictrue;
	private String nature;
	private String bqpri;
	private String pronum;
	private String status;
	private String orrmid;
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getPictrue() {
		return pictrue;
	}
	public void setPictrue(String pictrue) {
		if(pictrue.contains(",")){
			this.pictrue = pictrue.split(",")[0];
		}else{
			this.pictrue = pictrue;
		}
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getBqpri() {
		return bqpri;
	}
	public void setBqpri(String bqpri) {
		this.bqpri = bqpri;
	}
	public String getPronum() {
		return pronum;
	}
	public void setPronum(String pronum) {
		this.pronum = pronum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrrmid() {
		return orrmid;
	}
	public void setOrrmid(String orrmid) {
		this.orrmid = orrmid;
	}
	@Override
	public String toString() {
		return "BackOrderFromBean [proid=" + proid + ", proname=" + proname
				+ ", pictrue=" + pictrue + ", nature=" + nature + ", bqpri="
				+ bqpri + ", pronum=" + pronum + ", status=" + status
				+ ", orrmid=" + orrmid + "]";
	}
	public BackOrderFromBean(int proid, String proname, String pictrue,
			String nature, String bqpri, String pronum, String status,
			String orrmid) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.pictrue = pictrue;
		this.nature = nature;
		this.bqpri = bqpri;
		this.pronum = pronum;
		this.status = status;
		this.orrmid = orrmid;
	}
	public BackOrderFromBean() {
		super();
	}
	
	

}
