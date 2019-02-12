package com.kun.foodsafety.services;

import java.util.List;

import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.ZhiJian;

public interface ZhiJianServ {

	public void addZhiJian(ZhiJian zhijian);
	//¸Ä
	public void updateZhiJianByzjId(ZhiJian zhijian);
	//É¾
	public int delMoreThanOneZhiJian(ZhiJian zhijian);
	
	public List<ZhiJian> selOneZhiJianByfId(int fId);
	public List<ZhiJian> selZhiJianByPage(Page page);
	public int selCountZhiJian();
	public List<ZhiJian> selAllZhiJian(); 
}
