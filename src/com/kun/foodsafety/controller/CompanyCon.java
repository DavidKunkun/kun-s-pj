package com.kun.foodsafety.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kun.foodsafety.model.Company;

import com.kun.foodsafety.model.Page;

import com.kun.foodsafety.services.CompanyServ;

@Controller
@RequestMapping("houtai")
public class CompanyCon {

	@Autowired
	private CompanyServ companyServ;
	
	@RequestMapping("addCompany.do")
	public String addCompany(Company company) {
		System.out.println(8965);
		companyServ.addCompany(company);
		return "selCompanyByPage.do";
	}
	

	@RequestMapping("selOneCompanyById.do")
	public ModelAndView selOneCompanyById(int cId) {
		
		List<Company> list = companyServ.selOneCompanyById(cId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateCompany.jsp");
		mav.addObject("company", list.get(0));
		return mav;
	} 
	
	@RequestMapping("selCompanyByPage.do")
	public ModelAndView selCompanyByPage(Page pageinfo) {
		pageinfo.setCount(companyServ.selCountCompany());
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		List<Company> list = companyServ.selCompanyByPage(pageinfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showCompany.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	} 
	
	@RequestMapping("selAllCompany.do")
	public void selAllCompany(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<Company> list = companyServ.selAllCompany();
		//System.out.println(list.get(0).getName());
		Gson g= new Gson(); 
		String companys = g.toJson(list);//把list变成String类型
		PrintWriter pw = response.getWriter();
		pw.write(companys);
		pw.flush();
		pw.close();
		
	}
	
	@RequestMapping("updateCompany.do")
	public String updateCompany(Company company) {
		companyServ.updateCompanyBycId(company);
		
		return "selCompanyByPage.do";
	}
	
	@RequestMapping("delMoreThanOneCompany.do")
	public String delMoreThanOneOperator(String cIdstr) {
		List<String> list = new ArrayList<String>();
		String strs[] = cIdstr.split(",");
		for(int i=0;i<strs.length;i++) {
			System.out.println(strs[i]);
			list.add(strs[i]);
		}
		Company company = new Company();
		company.setcId_list(list);
		companyServ.delMoreThanOneCompany(company);
		
		return "selCompanyByPage.do";
	}
	
	
}
