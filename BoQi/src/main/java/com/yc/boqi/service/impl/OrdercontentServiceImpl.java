package com.yc.boqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.boqi.entity.Address;
import com.yc.boqi.entity.BackOrderContentBean;
import com.yc.boqi.entity.OrderContent;
import com.yc.boqi.mapper.AddressMapper;
import com.yc.boqi.mapper.OrdercontentMapper;
import com.yc.boqi.mapper.OrderformMapper;
import com.yc.boqi.mapper.ProductinfoMapper;
import com.yc.boqi.service.OrdercontentService;
@Service("ordercontentService")
public class OrdercontentServiceImpl implements OrdercontentService {
	@Autowired
	private OrdercontentMapper ordercontentMapper;
	@Autowired
	private OrderformMapper orderformMapper;
	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private ProductinfoMapper productinfoMapper;
	private Map<String, Object> addfrom  = new HashMap<String, Object>();
	private OrderContent oc;
	@Transactional
	public OrderContent addor(OrderContent orderContent){
		ordercontentMapper.addOrder(orderContent);
		return orderContent;
	}
	@Transactional
	public void addfo(Map<String, Object> so){
		ordercontentMapper.addFrom(so);
	}
	@Transactional
	public void updateGood(Map<String, Object> so){
		productinfoMapper.updateGoodsNum(so);
	}
	@Override @Transactional
	public int addOrder(OrderContent orderContent,String orders) {
		//添加订单
		oc = addor(orderContent);
		System.out.println(oc.getOrderid()+"订单编号");
		addfrom.put("orderid", oc.getOrderid());
		String[] orde = orders.split(";");
		for(int i=0;i<orde.length;i++){
			String[] os = orde[i].split(",");
			addfrom.put("proid",os[0]);
			addfrom.put("pronum",os[1]);
			addfrom.put("bqpri",os[2]);
			//添加订单详情
			addfo(addfrom);
			//修改商品库存
			updateGood(addfrom);
		}
		return oc.getOrderid();
	}
	@Override
	public List<OrderContent> findAll(int page, int rows) {
		Map<String, Object> type = new HashMap<String, Object>();
		type.put("one", page*rows);
		type.put("two", (page-1)*rows);
		
		return ordercontentMapper.getAll(type);
	}
	@Override
	public BackOrderContentBean findOneBackOrder(int orderid) {
		return ordercontentMapper.getBackOrder(orderid);
	}
	@Override @Transactional
	public int updateOrderToLing(String ids) {
		int a;
		if(ids.contains(",") && ids.indexOf("or")<=0){
			String[] as = ids.split(",");
			a = ordercontentMapper.updateOrderByIds(as);
		}else{
			a = ordercontentMapper.updateOrderById(ids);
		}
		return a;
	}
	@Override @Transactional
	public int updateOrderByAddress(String allstring,
			BackOrderContentBean backOrderContentBean, int updateStatus) {
		if(updateStatus==1){
			if(addNewAddress(backOrderContentBean)==0){
				System.out.println("地址添加不成功");
				return 0;
			}
		}
		
		String[] tnames = allstring.split(",");
		int i=0;
		int q=1;
		Map<String, Object> pa = new HashMap<String, Object>();
		for(i=0;i<tnames.length;i++){
			pa.put("m"+q, tnames[i]);
			q++;
			System.out.println(i+":"+tnames[i]);
			if((i+1)%5==0 && i!=0){
				System.out.println("q="+q);
				int jie = updateOrderFrom(pa);
				pa.clear();
				if(jie==0){
					System.out.println("商品修改不成功");
					return 0;
				}
				q=1;
			}
		}
		return 1;
	}
	@Transactional
	public int addNewAddress(BackOrderContentBean backOrderContentBean){
		Map<String, Object> paramas = new HashMap<String, Object>();
		paramas.put("addid", backOrderContentBean.getAddid());
		paramas.put("usid", backOrderContentBean.getUsid());
		paramas.put("postcode", backOrderContentBean.getPostcode());
		paramas.put("addname", backOrderContentBean.getAddname());
		paramas.put("tel", backOrderContentBean.getAtel());
		paramas.put("shen", backOrderContentBean.getShen());
		paramas.put("shi", backOrderContentBean.getShi());
		paramas.put("xian", backOrderContentBean.getXian());
		paramas.put("zhenjie", backOrderContentBean.getZhenjie());
		paramas.put("readdr", backOrderContentBean.getReaddr());
		System.out.println(paramas);
		return addressMapper.updateAddress(paramas);
	}
	@Transactional
	public int updateOrderFrom(Map<String, Object> pa){
		return ordercontentMapper.updateOrderFrom(pa);
	}
	@Override @Transactional
	public int updateOrderByids(String ids, int status) {
		Map<String, Object> par = new HashMap<String, Object>();
		par.put("status", status);
		int nu;
		if(ids.contains(",") && ids.indexOf("or")<=0){
			String[] shu = ids.split(",");
			par.put("ids", shu);
			nu = ordercontentMapper.updateOrderStatusByIds(par);
			nu = updateOrderFromStatus(nu,2,par);
		}else{
			par.put("id", ids);
			nu = ordercontentMapper.updateOrderStatusById(par);
			nu = updateOrderFromStatus(nu,1,par);
		}
		if(nu==0){
			return 0;
		}else{
			return 1;
		}
	}
	//修改订单详情的状态
	public int updateOrderFromStatus(int goon,int num,Map<String, Object> par){
		int ru = 0;//判断是否执行成功
		if(goon==0){
			return ru;
		}
		if(num==1){
			ru = orderformMapper.updateOrderFromStatusById(par);
		}else{
			ru = orderformMapper.updateOrderFromStatusByIds(par);
		}
		
		return ru;
	}
	@Override @Transactional
	public int updateStatu(int orderid) {
		return ordercontentMapper.updateStatu(orderid);
	}

}
