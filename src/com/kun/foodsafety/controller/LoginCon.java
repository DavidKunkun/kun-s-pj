package com.kun.foodsafety.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kun.foodsafety.model.Loginor;
import com.kun.foodsafety.model.Operator;
import com.kun.foodsafety.services.LoginorServ;

@Controller
@RequestMapping("houtai")
public class LoginCon {

	@Autowired
	private LoginorServ loginorServ;
	
	@RequestMapping("addLoginor.do")
	public ModelAndView addLoginor(Operator operator,HttpServletRequest request){
		Loginor loginor = new Loginor();
		loginor.setuEmployeeId(operator.getoId());
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		loginor.setuTime(df.format(new Date()));
		
		//��ӵ�½��Ϣ
		loginorServ.addLoginor(loginor);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginor", loginor);
		session.setMaxInactiveInterval(10*60);//����Ϊ��λ������û�л5���Ӻ�session��ʧЧ
		
		System.out.println(operator.getoRight());
		session.setAttribute("right", operator.getoRight());
		//��ѯ��½����ù�����һ�ε�½ϵͳʱ��selLastLoginTimeById
		loginor.setuOuttime(loginorServ.selLastLoginTimeById(loginor));
		
		
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("operator", operator);
		
		/*if(operator.getoRight()==1){
			mav.setViewName("");//��ͨ������ҳ��
		}else if(operator.getoRight()==2){
			mav.setViewName("../houtai/gly_index.jsp");//����Աҳ��
		}else if(operator.getoRight()==3){
			mav.setViewName("");//Ѳ��Աҳ��
		}*/
		mav.setViewName("../houtai/gly_index.jsp");//����Աҳ��
		return mav;
		
	}
}
