package com.kun.foodsafety.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.ZhaoHui;
import com.kun.foodsafety.services.ZhaoHuiServ;

@Controller
@RequestMapping("houtai")
public class ZhaoHuiCon {

	@Autowired
	private ZhaoHuiServ zhaoHuiServ;
	
	@RequestMapping("selZhaoHuiByPage.do")
	public ModelAndView selZhaoHuiByPage(Page pageinfo) {
		pageinfo.setCount(zhaoHuiServ.selCountZhaoHui());
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		List<ZhaoHui> list = zhaoHuiServ.selZhaoHuiFoodByPage(pageinfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showZhaoHui.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	} 
}
