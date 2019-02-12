package com.kun.foodsafety.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kun.foodsafety.model.Company;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.Store;
import com.kun.foodsafety.services.CompanyServ;
import com.kun.foodsafety.services.FoodServ;
import com.kun.foodsafety.services.StoreServ;

@Controller
@RequestMapping("qiantai")
public class OthersCon {
           
	@Autowired
	private CompanyServ companyServ;
	@Autowired
	private FoodServ foodServ;
	@Autowired
    private StoreServ storeServ;
	
	//根据商品名称查询单个商品信息selFoodByfName
	//select * from food where fName=?
	
	//根据商品生产许可证查询商品信息selFoodByfShengChanPiCiId
	//select * from food where fShengChanPiCiId=?
	
	//查询某个生产公司生产的所有的商品  或者是 所有准入市场的商品
	//select * from food where fCompanyId=？ and fZhunRu=="准入"
	@RequestMapping("selFoodDuoTiaoJian.do")
	public void selFood(Food food,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		
		List<Food> list = foodServ.selFoodDuoTiaoJian(food);
		
		Gson g= new Gson(); 
		String foods = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(foods);
		pw.flush();
		pw.close();
	}
	
	/*@RequestMapping("selFoodDuoTiaoJian.do")
	public ModelAndView selFood(Food food,HttpServletResponse response) throws IOException {
		List<Food> list = foodServ.selFoodDuoTiaoJian(food);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showDuoTiaoJianFood.jsp");
		mav.addObject("list", list);
		mav.addObject("canshu", food);
		return mav;
	}*/
	//根据公司名称查询公司信息selCompanyBycName
	//select * from company where cName=?
	
	@RequestMapping("selCompanyDuoTiaoJian.do")
	public void selCompany(Company company,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		
		List<Company> list = companyServ.selCompanyDuoTiaoJian(company);
		
		Gson g= new Gson(); 
		String companys = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(companys);
		pw.flush();
		pw.close();
	}
	
	//根据商户名称查询商户信息
	//select * from store where sName=?
	@RequestMapping("selStoreDuoTiaoJian.do")
	public void selStore(Store store,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		
		List<Store> list = storeServ.selStoreDuoTiaoJian(store);
		
		Gson g= new Gson(); 
		String stores = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(stores);
		pw.flush();
		pw.close();
	}
	
}
