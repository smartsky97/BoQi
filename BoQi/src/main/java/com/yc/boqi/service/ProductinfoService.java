package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.IndexProductBean;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.Top8ProductinfoBean;

public interface ProductinfoService {
	// 后台的种类获取
	public List<Productinfo> findTypePro(Integer pageNo, Integer pageSize,
			String petType);

	// 获取前八个不同类型的数据
	public List<Top8ProductinfoBean> GetTop8();

	// 获取一个种类商品的 数量
	public int findTypeNum(String type);

	// 添加商品
	public boolean addProduct(Productinfo productinfo);

	/**
	 * 查询一个商品的所有信息
	 * 
	 * @param orderid
	 *            ：商品id
	 * @return
	 */
	public Productinfo findAproduct(int orderid);

	// index.jsp页面商品的部分查询信息
	public List<IndexProductBean> findIndexDogPro();

	// index.jsp页面商品的猫部分查询信息
	public List<IndexProductBean> findIndexCatPro();

	// index.jsp页面商品的小宠部分查询信息
	public List<IndexProductBean> findIndexsmallPro();
}
