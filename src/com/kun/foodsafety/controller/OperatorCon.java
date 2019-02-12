package com.kun.foodsafety.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kun.foodsafety.model.Cities;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.Operator;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Provinces;
import com.kun.foodsafety.services.OperatorServ;



@Controller
@RequestMapping("houtai")
public class OperatorCon {
    
	@Autowired
	private OperatorServ operatorServ;
	
	
	
	//addoperator.jsp-->con(调用service的添加数据库的方法后成功添加)-->
	@RequestMapping("addOperator.do")
	public String addOperator(Operator operator) {
		//System.out.println("进入控制器");
		operatorServ.addOperator(operator);
		
		return "selOperatorByPage.do";
	}
	
	@RequestMapping("selAllOperator.do")
	public void selAllOperator(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<Operator> list = operatorServ.selAllOperator();
		Gson g= new Gson(); 
		String operators = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(operators);
		pw.flush();
		pw.close();
		
	} 
	
	@RequestMapping("selOperatorByPage.do")
	public ModelAndView selOperatorByPage(Page pageinfo) {
		pageinfo.setCount(operatorServ.selAllOperator().size());
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		List<Operator> list = operatorServ.selOperatorByPage(pageinfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showOperator.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	} 
	
	@RequestMapping("selOperaterByoId.do")
	public ModelAndView selOperaterByoId(int oId) {
		
		List<Operator> list = operatorServ.selOneOperatorById(oId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateOperator.jsp");
		mav.addObject("operator", list.get(0));
		return mav;
	} 
	
	@RequestMapping("updateOperator.do")
	public String updateOperator(Operator operator) {
		operatorServ.upOperatorByoId(operator);
		
		return "selOperatorByPage.do";
	}
	
	@RequestMapping("delMoreThanOneOperator.do")
	public String delMoreThanOneOperator(String oIdstr) {
		List<String> list = new ArrayList<String>();
		String strs[] = oIdstr.split(",");
		for(int i=0;i<strs.length;i++) {
			System.out.println(strs[i]);
			list.add(strs[i]);
		}
		Operator operator = new Operator();
		operator.setoId_list(list);
		operatorServ.delMoreThanOneOperator(operator);
		
		return "selOperatorByPage.do";
	}
	
	@RequestMapping("login_JudgeId.do")
	public void selOneOperatorById(String oId,HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("judgeId");
		List<Operator> list = new ArrayList<Operator>();
		if(!oId.equals("")&&!oId.equals(null)) {
			list = operatorServ.selOneOperatorById((Integer.parseInt(oId)));
		}
		System.out.println(list.size());
		String info="";
		if(list.size()==0) {
			info="0";
		}else {
			Gson g= new Gson(); 
			info = g.toJson(list);//把list变成String类型
		}
		PrintWriter pw = response.getWriter();
		pw.write(info);
		pw.flush();
		pw.close();
		
	} 
	@RequestMapping("addOperator_province.do")
	public void selAllProvince(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<Provinces> list = operatorServ.selAllProvince();
		//System.out.println(list.get(0).getName());
		Gson g= new Gson(); 
		String provinces = g.toJson(list);//把list变成String类型
		System.out.println(provinces);
		PrintWriter pw = response.getWriter();
		pw.write(provinces);
		pw.flush();
		pw.close();
		
	}
	@RequestMapping("addOperator_city.do")
	public void selCityByPcode(String pcode,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<Cities> list = operatorServ.selCityByPcode(pcode);
		Gson g= new Gson(); 
		String citys = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(citys);
		pw.flush();
		pw.close();
		
	}
}
