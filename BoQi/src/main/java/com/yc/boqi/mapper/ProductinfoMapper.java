package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.IndexProductBean;
import com.yc.boqi.entity.Productinfo;
import com.yc.boqi.entity.ProductinfoBean;
import com.yc.boqi.entity.Top8ProductinfoBean;

public interface ProductinfoMapper {
	//获取商城主页的所有种类的前8个商品
	public List<Top8ProductinfoBean> findTop8OfProductByLei();
	//获取狗狗商品后台显示列表
	public List<Productinfo> findTypePro(Map<String, Object> type);
	//获取一个种类商品的数量
	public int ProTotal(String type);
	/**
	 * 添加商品
	 * @param productinfo：商品类
	 * @return
	 */
	public boolean addProduct(ProductinfoBean productinfo);
	//查找商品
	public List<Productinfo> searchPro(Map<String,Object> map);
	

	/**
	 * 查询一个商品的所有信息
	 * @param orderid：商品id
	 * @return
	 */
	public Productinfo findAproduct(int proid);
	// index.jsp页面商品的狗部分查询信息
	List<IndexProductBean> findIndexDogPro();

	// index.jsp页面商品的猫部分查询信息
	List<IndexProductBean> findIndexCatPro();

	// index.jsp页面商品的小宠部分查询信息
	List<IndexProductBean> findIndexsmallPro();
	//把订单状态改为失效
	public void updateGoodsNum(Map<String, Object> so);
	//获取商品的属性
	public List<Productinfo> findNatureByName(String[] names);
	//根据商品名和商品属性查询商品
	public List<Productinfo> findPriceByNaNa(Map<String, Object> so);
	/**
	 * jp 查询商品的相关信息
	 * @param id：商品id
	 * @return
	 */
	public ProductinfoBean findProductsInfo(int id);
	/**
	 * 后台修改商品的信息
	 * @param productinfo：商品类
	 * @return
	 */
	public int updateProduct(ProductinfoBean productinfo);
	/**
	 * 查询商品的数量
	 * @param proid：商品Id
	 * @return
	 */
	public int getproNum(int proid);
	/**
	 * 获取一个商品的购买信息
	 * @param proid：商品的id
	 * @return
	 */
	public List<ProductinfoBean> getBuysInfo(int proid);
}
