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
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		loginor.setuTime(df.format(new Date()));
		
		//添加登陆信息
		loginorServ.addLoginor(loginor);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginor", loginor);
		session.setMaxInactiveInterval(10*60);//以秒为单位，即在没有活动5分钟后，session将失效
		
		System.out.println(operator.getoRight());
		session.setAttribute("right", operator.getoRight());
		//查询登陆表里该工号上一次登陆系统时间selLastLoginTimeById
		loginor.setuOuttime(loginorServ.selLastLoginTimeById(loginor));
		
		
		ModelAndView mav = new ModelAndView();
		
		//mav.addObject("operator", operator);
		
		/*if(operator.getoRight()==1){
			mav.setViewName("");//普通操作人页面
		}else if(operator.getoRight()==2){
			mav.setViewName("../houtai/gly_index.jsp");//管理员页面
		}else if(operator.getoRight()==3){
			mav.setViewName("");//巡查员页面
		}*/
		mav.setViewName("../houtai/gly_index.jsp");//管理员页面
		return mav;
		
	}
}
