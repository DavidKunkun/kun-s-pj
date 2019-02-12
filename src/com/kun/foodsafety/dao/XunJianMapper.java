package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.XunJian;

public interface XunJianMapper {
	
	public void addXunJian(XunJian xunJian);
	
	public void delMoreThanOneXunJian(XunJian xunJian);
	
	public List<XunJian> selAllXunJian();
	public List<XunJian> selXunJianByPage(Page page);
	public int selCountXunJian();
	public List<XunJian> selOneXunJianByxjId(int xjId);
	
	
	public void updateXunJianByxjId(XunJian xunJian);

}
