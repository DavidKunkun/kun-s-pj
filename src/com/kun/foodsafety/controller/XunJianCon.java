package com.kun.foodsafety.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kun.foodsafety.model.Company;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Store;
import com.kun.foodsafety.model.XunJian;
import com.kun.foodsafety.model.ZhaoHui;
import com.kun.foodsafety.services.CompanyServ;
import com.kun.foodsafety.services.FoodServ;
import com.kun.foodsafety.services.StoreServ;
import com.kun.foodsafety.services.XunJianServ;
import com.kun.foodsafety.services.ZhaoHuiServ;

@Controller
@RequestMapping("houtai")
public class XunJianCon {
	@Autowired
	private FoodServ foodServ;
	@Autowired
	private CompanyServ companyServ;
	@Autowired
	private XunJianServ xunJianServ;
	@Autowired
    private StoreServ storeServ;
	@Autowired
	private ZhaoHuiServ zhaoHuiServ;
	
	@RequestMapping("addXunJian.do")
	public String addXunJian(XunJian xunJian) {
		xunJianServ.addXunJian(xunJian);
		
		//每巡检一次，对应商户表中巡查次数+1，不合格则不合格次数+1
		Store store = storeServ.selOneStoreBysId(xunJian.getsId()).get(0);
		store.setsXunChaNumber(store.getsXunChaNumber()+1);
		
		if(xunJian.getXjResult().equals("不合格")) {//巡检结果不合格，商户不合格次数加一
			store.setsNotHeGe(store.getsNotHeGe()+1);
			int fId = xunJian.getfId();
			
			Food food = foodServ.selOneFoodById(fId).get(0);
			int cId = food.getfCompanyId();
			Company company = companyServ.selOneCompanyById(cId).get(0);
			
			ZhaoHui zhaoHui = new ZhaoHui();
			
			zhaoHui.setZhfId(fId);
			zhaoHui.setZhfName(food.getfName());
			
			zhaoHui.setZhfcId(cId);
			zhaoHui.setZhfcName(company.getcName());
			
			zhaoHui.setZhsId(xunJian.getsId());
			zhaoHui.setZhsName(xunJian.getXjsName());
			
			zhaoHui.setZhOperatorId(xunJian.getXjOperatorId());
			
			zhaoHui.setZhReason(xunJian.getXjBuHeGeReason());
			
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			zhaoHui.setZhTime(df.format(new Date()));
			//巡检结果不合格，召回该食品，往食品召回表里添加记录
			zhaoHuiServ.addZhaoHui(zhaoHui);
		}
		
		if(store.getsNotHeGe()>5) {//如果不合格次数超过5，下发停业通知
			store.setsZhuangTai("停业");
		}
		storeServ.updateStoreXCNumberBysId(store);
		
		return "selXunJianByPage.do";
	}
	
	
	@RequestMapping("selXunJianByPage.do")
	public ModelAndView selXunJianByPage(Page pageinfo) {
		pageinfo.setCount(xunJianServ.selCountXunJian());
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		List<XunJian> list = xunJianServ.selXunJianByPage(pageinfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showXunJian.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	}
	
}
