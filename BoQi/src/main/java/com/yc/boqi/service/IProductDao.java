package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Brand;
import com.yc.boqi.entity.FirstMenu;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.SecondMenu;

public interface IProductDao {
	public List<Productinfo> findDogPro(Integer pageNo, Integer pageSize);
	public int DogProTotal();
	
	/**
	 * 根据id获取商品信息
	 * @param orderid
	 * @return
	 */
	public Productinfo find(int orderid);
	/**
	 * 根据商品名查找商品的属性
	 * @param name
	 * @return
	 */
	public List<Productinfo> find(String name);
	/**
	 * 根据名字和属性来查找一个商品
	 * @param proname
	 * @param nature
	 * @return
	 */
	public Productinfo find(String proname,String nature);
	/**
	 * 
	 * @param number:前多少条的信息
	 * @return
	 */
	
	public Productinfo findAproduct(String orderid);
	public List<Productinfo> getTopNumInfo(int number);
	public List<Productinfo> getSearchByCi(Integer pageNo, Integer pageSize,String ci,String order);
	public List<Productinfo> findTypePro(Integer pageNo, Integer pageSize,String petType);
	public int ProTotal(String petType);
	public List<Brand> findProBrand();
	public List<SecondMenu> findProType(String type);
	public int addPro(Productinfo pro);
	public Productinfo findProByProid(int proid);
	public int uptProInfo(Productinfo pro);
	public int delProInfo(String proids);
	public List<FirstMenu> findFirInfo(String type);
	public List<SecondMenu> findsbyf(String fid);
	public List<Productinfo> findProByInfo(String fid,String tid,String brandid,String type,Integer pageNo, Integer pageSize);
	public List<Productinfo> findProByName(String fname,String tname,String brandname,Integer pageNo, Integer pageSize);
	public int getallNum(String ci);
	public List<String> findAllPinpai(String ci);//获取搜索的品牌名
}
