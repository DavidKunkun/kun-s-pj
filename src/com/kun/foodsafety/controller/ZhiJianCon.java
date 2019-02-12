package com.kun.foodsafety.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kun.foodsafety.model.CompanyFood;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.ZhiJian;
import com.kun.foodsafety.services.CompanyFoodServ;
import com.kun.foodsafety.services.FoodServ;
import com.kun.foodsafety.services.ZhiJianServ;

@Controller
@RequestMapping("houtai")
public class ZhiJianCon {
	
	@Autowired
	private ZhiJianServ zhiJianServ;
	@Autowired
	private FoodServ foodServ;
	@Autowired
	private CompanyFoodServ companyFoodServ;

	@RequestMapping("addZhiJian.do")
	public String addZhiJian(ZhiJian zhiJian) {
		int fId = zhiJian.getfId();
		//���ʼ���ϸ��Ϣ��ӵ��ʼ����
		zhiJianServ.addZhiJian(zhiJian);
		
		CompanyFood companyFood = new CompanyFood();
		//����������׼���ļ�������ʼ���ϸ���е����ս��һ��
		companyFood.setCfResult(zhiJian.getZjResult());
		companyFood.setfId(fId);
		int xukezheng = zhiJianServ.selAllZhiJian().get(0).getZjId();
		
		//����������׼������ϸ˵����������ɱ�ţ���Ӧ�ʼ��ı��
		companyFood.setCfXiangXiJianCe(xukezheng);
		//��ȡϵͳ��ǰʱ��Ϊ����׼����������׼��ʱ��
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		companyFood.setCfEndtime(df.format(new Date()));
		companyFood.setCfOperatorId(zhiJian.getZjEmployeerId());
		companyFoodServ.updateCompanyFoodXJAndTime(companyFood);
		
		
		Food food = new Food();
		food.setfId(fId);
		if(zhiJian.getZjResult().equals("�ϸ�")) {//�޸�food����ʳƷ׼��״̬Ϊ׼�������֤���id
			food.setfZhunRu("׼��");
			food.setfShengChanPiCiId(xukezheng);
		}else {
			food.setfZhunRu("��׼��");
		}
		foodServ.updateFoodZRByfId(food);
		
		return "selCompanyFoodByPage.do";
	}
	
	@RequestMapping("selOneZhiJianByfId.do")
	public ModelAndView selOneZhiJianByfId(int fId) {
		ModelAndView mav = new ModelAndView();
		
		List<ZhiJian> list = zhiJianServ.selOneZhiJianByfId(fId);
		
		mav.setViewName("showOneZhiJian.jsp");
		mav.addObject("zhiJian", list.get(0));
		
		return mav;
	} 
	
	@RequestMapping("selZhiJianByPage.do")
	public ModelAndView selZhiJianByPage(Page pageinfo) {
		pageinfo.setCount(zhiJianServ.selCountZhiJian());
		int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
		pageinfo.setCountPage(cp);	
		pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
		
		List<ZhiJian> list = zhiJianServ.selZhiJianByPage(pageinfo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("showZhiJian.jsp");
		mav.addObject("list", list);
		mav.addObject("pageinfo", pageinfo);
		return mav;
	} 
	
	
	@RequestMapping("selAllZhiJian.do")
	public void selAllCompany(HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<ZhiJian> list = zhiJianServ.selAllZhiJian();
		//System.out.println(list.get(0).getName());
		Gson g= new Gson(); 
		String zhijians = g.toJson(list);//��list���String����
		PrintWriter pw = response.getWriter();
		pw.write(zhijians);
		pw.flush();
		pw.close();
		
	}
	
	
	@RequestMapping("delMoreThanOneZhiJian.do")
	public String delMoreThanOneZhiJian(String zjIdstr) {
		List<String> list = new ArrayList<String>();
		String strs[] = zjIdstr.split(",");
		for(int i=0;i<strs.length;i++) {
			System.out.println(strs[i]);
			list.add(strs[i]);
		}
		ZhiJian zhijian = new ZhiJian();
		//zhijian.setzjId_list(list);
		zhiJianServ.delMoreThanOneZhiJian(zhijian);
		
		return "selZhiJianByPage.do";
	}
	
}
