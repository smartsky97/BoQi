package com.yc.boqi.entity;

import java.io.Serializable;

public class ProductinfoBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int proid;
	private String proname;
	private String nature;
	private int brandid;
	private int fid;
	private String fname;
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
	private String uname;
	private int pronum;
	private String starttime;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getPronum() {
		return pronum;
	}
	public void setPronum(int pronum) {
		this.pronum = pronum;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
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
	public ProductinfoBean() {
		super();
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
	
	public String getFivePics() {
		if(pictrue!=null && pictrue.indexOf(",")>0){
			String[] pics = pictrue.split(",");
			String str="";
			int num = pics.length;
			if(num>5){
				num=5;
			}
			str+="<li id='onlickImg'><img id='_img' src='../"+pics[0]+"' width='44px' height='44px' alt='娉㈠缃�/></li>";
			for(int i=1;i<num;i++){
				str+="<li><img src='../"+pics[i]+"' width='44px' height='44px' alt='pic"+i+"'/></li>";
			}
			return str;
		}
		return "<li id='onlickImg'><img id='_img' src='../"+pictrue+"' width='44px' height='44px' alt='娉㈠缃�/></li>";
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
	@Override
	public String toString() {
		return "ProductinfoBean [proid=" + proid + ", proname=" + proname
				+ ", nature=" + nature + ", brandid=" + brandid + ", fid="
				+ fid + ", fname=" + fname + ", tid=" + tid + ", suitpet="
				+ suitpet + ", pictrue=" + pictrue + ", promarprice="
				+ promarprice + ", bqpri=" + bqpri + ", prosales=" + prosales
				+ ", prointro=" + prointro + ", inventory=" + inventory
				+ ", status=" + status + ", brandname=" + brandname
				+ ", tname=" + tname + ", uname=" + uname + ", pronum="
				+ pronum + ", starttime=" + starttime + "]";
	}
	public ProductinfoBean(int proid, String proname, String nature,
			int brandid, int fid, String fname, int tid, String suitpet,
			String pictrue, double promarprice, double bqpri, int prosales,
			String prointro, int inventory, int status, String brandname,
			String tname, String uname, int pronum, String starttime) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.nature = nature;
		this.brandid = brandid;
		this.fid = fid;
		this.fname = fname;
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
		this.uname = uname;
		this.pronum = pronum;
		this.starttime = starttime;
	}

}
