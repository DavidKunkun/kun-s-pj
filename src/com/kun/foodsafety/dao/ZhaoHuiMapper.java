package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.ZhaoHui;

public interface ZhaoHuiMapper {
	
	public void addZhaoHui(ZhaoHui zhaoHui);
	public List<ZhaoHui> selZhaoHuiFoodByPage(Page page);
	public int selCountZhaoHui();
}
