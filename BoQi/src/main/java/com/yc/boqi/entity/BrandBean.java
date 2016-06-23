package com.yc.boqi.entity;

import java.io.Serializable;

public class BrandBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int brandid;  //品牌编号
	private String brandName; //品牌名称
	private String paytime;//订单付款时间
	private int status;  //品牌状态
	private double br_pro_total;//品牌的总销售额
	private int br_num_total;//品牌的总销售数量
	public BrandBean() {
		super();
	}
	public String getPaytime() {
		return paytime;
	}
	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}
	public int getBrandid() {
		return brandid;
	}
	public void setBrandid(int brandid) {
		this.brandid = brandid;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public double getBr_pro_total() {
		return br_pro_total;
	}
	public void setBr_pro_total(double br_pro_total) {
		this.br_pro_total = br_pro_total;
	}
	public int getBr_num_total() {
		return br_num_total;
	}
	public void setBr_num_total(int br_num_total) {
		this.br_num_total = br_num_total;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BrandBean [brandid=" + brandid + ", brandName=" + brandName
				+ ", paytime=" + paytime + ", status=" + status
				+ ", br_pro_total=" + br_pro_total + ", br_num_total="
				+ br_num_total + "]";
	}
	public BrandBean(int brandid, String brandName, String paytime, int status,
			double br_pro_total, int br_num_total) {
		super();
		this.brandid = brandid;
		this.brandName = brandName;
		this.paytime = paytime;
		this.status = status;
		this.br_pro_total = br_pro_total;
		this.br_num_total = br_num_total;
	}
}
