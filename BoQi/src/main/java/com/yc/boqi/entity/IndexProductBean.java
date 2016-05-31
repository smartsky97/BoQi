package com.yc.boqi.entity;

/**
 * index.jsp页面的商品部分信息展示
 * @author liushuping
 *
 */
public class IndexProductBean {
	private int proid;
	private int fid;
	private int tid;
	private String proname;
	private String prointro;
	private String pictrue;
	
	public String getPictrue() {
		return pictrue;
	}
	public void setPictrue(String pictrue) {
		this.pictrue = pictrue;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProintro() {
		return prointro;
	}
	public void setProintro(String prointro) {
		this.prointro = prointro;
	}
	 
	 
	@Override
	public String toString() {
		return "\nIndexProductBean [proid=" + proid + ", fid=" + fid + ", tid=" + tid + ", proname=" + proname + ", prointro=" + prointro + ", pictrue=" + pictrue + "]";
	}
	
	public IndexProductBean(int proid, int fid, int tid, String proname, String prointro, String pictrue) {
		super();
		this.proid = proid;
		this.fid = fid;
		this.tid = tid;
		this.proname = proname;
		this.prointro = prointro;
		this.pictrue = pictrue;
	}
	public IndexProductBean() {
		super();
	}
	
}
