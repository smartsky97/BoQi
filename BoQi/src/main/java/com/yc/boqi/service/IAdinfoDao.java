package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Adver;


public interface IAdinfoDao {
	public int addAd(Adver adver);
	public int updateAd(Adver adver);
	public Adver find(int adverid);
	public List<Adver> find(Integer pageNo, Integer pageSize);
	public int total();
	public int delAd(String adverids);
}
