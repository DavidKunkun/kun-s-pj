package com.kun.foodsafety.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kun.foodsafety.model.Common;
import com.kun.foodsafety.model.Company;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.FoodType;
import com.kun.foodsafety.model.Page;

import com.kun.foodsafety.services.FoodServ;

@Controller
@RequestMapping("houtai")
public class FoodCon {

	@Autowired
	private FoodServ foodServ;
	
	
	@RequestMapping("addFood.do")
	public String addFood(Food food,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		
		//得到图片的原始名字
		String fileName = file.getOriginalFilename();
		if(!"".equals(fileName)&&!fileName.equals(null)) {
			String ran = UUID.randomUUID().toString();//得到随机数
			String newFileName = ran+fileName;//拼接成一个新的图片名字
			String tomcatPath=request.getSession().getServletContext().getRealPath("/")+"houtai/images/"+newFileName;
			
			File file1 = new File(tomcatPath);//目标文件
			
			file.transferTo(file1);//io对接
			
			food.setfImage(newFileName);
		}                                   
		
		System.out.println("***************"+food.getfShengChanPiCiId());
		foodServ.addFood(food);
		return "selFoodByPage.do";
	}
	
	@RequestMapping("selFoodByPage.do")
	public ModelAndView selFoodByPage(Page pageinfo) {
		pageinfo.setCount(foodServ.selCountFood());
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		List<Food> list = foodServ.selFoodByPage(pageinfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showFood.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	} 
	
	@RequestMapping("selOneFoodById.do")
	public ModelAndView selOneFoodById(int fId) {
		
		List<Food> list = foodServ.selOneFoodById(fId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateFood.jsp");
		mav.addObject("food", list.get(0));
		return mav;
	} 
	
	@RequestMapping("selAllFoodType.do")
	public void selAllFoodType(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<FoodType> list = foodServ.selAllFoodType();
		//System.out.println(list.get(5).getFtName());
		Gson g= new Gson(); 
		String foodTypes = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(foodTypes);
		pw.flush();
		pw.close();
		
	}
	
	@RequestMapping("selFoodTypeNames.do")
	public void selFoodTypeNames(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<FoodType> list = foodServ.selFoodTypeName();
		//System.out.println(list.get(5).getFtName());
		Gson g= new Gson(); 
		String foodTypeNames = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(foodTypeNames);
		pw.flush();
		pw.close();
		
	}
	
	//查询某个生产公司旗下登记过的所有食品信息
	@RequestMapping("selAllFoodBycIdAndPage.do")
	public ModelAndView selAllFoodBycIdAndPage(Page pageinfo,Company company) {
		pageinfo.setCount(foodServ.selFoodCountBycId(company.getcId()));
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		Common common = new Common();
		common.setCompany(company);
		common.setPage(pageinfo);
		
		List<Food> list = foodServ.selAllFoodBycIdAndPage(common);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showFoodOfCompany.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	} 
	
	@RequestMapping("selAllFood.do")
	public void selAllFood(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<Food> list = foodServ.selAllFood();
		//System.out.println(list.get(0).getName());
		Gson g= new Gson(); 
		String foods = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(foods);
		pw.flush();
		pw.close();
		
	}
	
	@RequestMapping("updateFood.do")
	public String updateFood(Food food,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		
		foodServ.updateFoodByfId(food);
		
		return "selFoodByPage.do";
	}
	
	/*@RequestMapping("updateFood.do")
	public String updateFood(Food food,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		//得到图片的原始名字
		String fileName = file.getOriginalFilename();
		if (!fileName.equals("") && !fileName.equals(null)) {
			String ran = UUID.randomUUID().toString();// 得到随机数
			String newFileName = ran + fileName;// 拼接成一个新的图片名字
			String tomcatPath = request.getSession().getServletContext().getRealPath("/") + "houtai/images/"
					+ newFileName;
            System.out.println(tomcatPath);
			File file1 = new File(tomcatPath);// 目标文件

			file.transferTo(file1);// io对接

			food.setfImage(newFileName);
		}
				
		foodServ.updateFoodByfId(food);
		
		return "selFoodByPage.do";
	}*/
	
	@RequestMapping("delMoreThanOneFood.do")
	public String delMoreThanOneFood(String fIdstr) {
		List<String> list = new ArrayList<String>();
		String strs[] = fIdstr.split(",");
		for(int i=0;i<strs.length;i++) {
			System.out.println(strs[i]);
			list.add(strs[i]);
		}
		Food food = new Food();
		food.setfId_list(list);
		foodServ.delMoreThanOneFood(food);
		
		return "selFoodByPage.do";
	}
	
	
}
