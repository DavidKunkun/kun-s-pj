package com.kun.foodsafety.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kun.foodsafety.model.Company;
import com.kun.foodsafety.model.CompanyFood;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.services.CompanyFoodServ;
import com.kun.foodsafety.services.FoodServ;

@Controller
@RequestMapping("houtai")
public class CompanyFoodCon {
	@Autowired
	private CompanyFoodServ companyFoodServ;
	@Autowired
	private FoodServ foodServ;
	
	@RequestMapping("oAddCompanyFood.do")
	public String oAddCompanyFood(String fIdstr) {
		CompanyFood companyFood = new CompanyFood();
		
		String[] fIds = fIdstr.split(",");
		for(int i=0;i<fIds.length;i++) {
			int fId = Integer.valueOf(fIds[i]);
			companyFood.setfId(fId);
			
			//其实可以不设生产公司字段，食品表里有，懒得改
			List<Food> list = foodServ.selOneFoodById(fId);
			if(list.get(0).getfZhunRu().equals("未检测")) {//只有这个食品的准入状态是未检测才能继续后续操作，否则忽略
				int cId = list.get(0).getfCompanyId();
				companyFood.setcId(cId);
				
				//获取系统当前时间为质量准入申请表里的申请时间
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				companyFood.setCfStarttime(df.format(new Date()));
				
				//食品准入申请表中添加信息
				companyFoodServ.addCompanyFood(companyFood);
				//修改食品表中是否准入字段为检测中
				Food food = new Food();
				food.setfId(fId);
				food.setfZhunRu("质量准入检测中");
				foodServ.updateFoodZRByfId(food);
			}
			
		}
		
		return "selFoodByPage.do";
	}
	
	@RequestMapping("selCompanyFoodByPage.do")
	public ModelAndView selCompanyByPage(Page pageinfo) {
		pageinfo.setCount(companyFoodServ.selCountCompanyFood());
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		List<CompanyFood> list = companyFoodServ.selCompanyFoodByPage(pageinfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showCompanyFood.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	} 
	
	@RequestMapping("selAllCompanyFood.do")
	public void selAllFood(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<CompanyFood> list = companyFoodServ.selAllCompanyFood();
		//System.out.println(list.get(0).getName());
		Gson g= new Gson(); 
		String foods = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(foods);
		pw.flush();
		pw.close();
		
	}

}
