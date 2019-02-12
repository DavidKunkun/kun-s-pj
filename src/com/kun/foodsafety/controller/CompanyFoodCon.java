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
			
			//��ʵ���Բ���������˾�ֶΣ�ʳƷ�����У����ø�
			List<Food> list = foodServ.selOneFoodById(fId);
			if(list.get(0).getfZhunRu().equals("δ���")) {//ֻ�����ʳƷ��׼��״̬��δ�����ܼ��������������������
				int cId = list.get(0).getfCompanyId();
				companyFood.setcId(cId);
				
				//��ȡϵͳ��ǰʱ��Ϊ����׼��������������ʱ��
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
				companyFood.setCfStarttime(df.format(new Date()));
				
				//ʳƷ׼��������������Ϣ
				companyFoodServ.addCompanyFood(companyFood);
				//�޸�ʳƷ�����Ƿ�׼���ֶ�Ϊ�����
				Food food = new Food();
				food.setfId(fId);
				food.setfZhunRu("����׼������");
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
		String foods = g.toJson(list);//��list���String����
		PrintWriter pw = response.getWriter();
		pw.write(foods);
		pw.flush();
		pw.close();
		
	}

}
