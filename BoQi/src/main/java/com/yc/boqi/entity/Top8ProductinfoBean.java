package com.yc.boqi.entity;

import java.io.Serializable;

public class Top8ProductinfoBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int proid;
	private String proname;
	private String nature;
	private int brandid;
	private int tid;
	private String suitpet;
	private String pictrue;
	private double promarprice;
	private double bqpri;
	private int prosales;
	private String prointro;
	private int inventory;
	private int status;
	private String brandname;
	private String tname;
	private int fid;
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
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
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public int getBrandid() {
		return brandid;
	}
	public void setBrandid(int brandid) {
		this.brandid = brandid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getSuitpet() {
		return suitpet;
	}
	public void setSuitpet(String suitpet) {
		this.suitpet = suitpet;
	}
	public String getPictrue() {
		return pictrue;
	}
	
	public String getFirstPic() {
		if(pictrue!=null && pictrue.indexOf(",")>0){
			return pictrue.substring(0,pictrue.indexOf(","));
		}
		return pictrue;
	}
	public void setPictrue(String pictrue) {
		this.pictrue = pictrue;
	}
	public double getPromarprice() {
		return promarprice;
	}
	public void setPromarprice(double promarprice) {
		this.promarprice = promarprice;
	}
	public double getBqpri() {
		return bqpri;
	}
	public void setBqpri(double bqpri) {
		this.bqpri = bqpri;
	}
	public int getProsales() {
		return prosales;
	}
	public void setProsales(int prosales) {
		this.prosales = prosales;
	}
	public String getProintro() {
		return prointro;
	}
	public void setProintro(String prointro) {
		this.prointro = prointro;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
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
	public Top8ProductinfoBean() {
		super();
	}
	public Top8ProductinfoBean(int proid, String proname, String nature,
			int brandid, int tid, String suitpet, String pictrue,
			double promarprice, double bqpri, int prosales, String prointro,
			int inventory, int status, String brandname, String tname, int fid) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.nature = nature;
		this.brandid = brandid;
		this.tid = tid;
		this.suitpet = suitpet;
		this.pictrue = pictrue;
		this.promarprice = promarprice;
		this.bqpri = bqpri;
		this.prosales = prosales;
		this.prointro = prointro;
		this.inventory = inventory;
		this.status = status;
		this.brandname = brandname;
		this.tname = tname;
		this.fid = fid;
	}
	@Override
	public String toString() {
		return "Top8ProductinfoBean [proid=" + proid + ", proname=" + proname
				+ ", nature=" + nature + ", brandid=" + brandid + ", tid="
				+ tid + ", suitpet=" + suitpet + ", pictrue=" + pictrue
				+ ", promarprice=" + promarprice + ", bqpri=" + bqpri
				+ ", prosales=" + prosales + ", prointro=" + prointro
				+ ", inventory=" + inventory + ", status=" + status
				+ ", brandname=" + brandname + ", tname=" + tname + ", fid="
				+ fid + "]";
	}
	
}
