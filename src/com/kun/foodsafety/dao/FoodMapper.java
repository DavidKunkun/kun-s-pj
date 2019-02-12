package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Common;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.FoodType;
import com.kun.foodsafety.model.Page;

public interface FoodMapper {
	//增
	public void addFood(Food food);
	//改
	public void updateFoodByfId(Food food);
	public void updateFoodZRByfId(Food food);
	//删
	public int delMoreThanOneFood(Food food);
	//查
	public List<Food> selOneFoodById(int fId);//查询某个食品信息
	public List<Food> selFoodByPage(Page page);
	public int selCountFood();//登记过的食品信息总数
	public List<Food> selAllFoodBycIdAndPage(Common common);//一个食品公司旗下所有登记过的食品信息按页分
	public int selFoodCountBycId(int cId);//一个食品公司旗下所有登记过的食品数量
	public List<Food> selAllFood();
	public List<Food> selFoodDuoTiaoJian(Food food);
	public List<FoodType> selFoodTypeName();
	
	public List<FoodType> selAllFoodType();
}
