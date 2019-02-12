package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Common;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.FoodType;
import com.kun.foodsafety.model.Page;

public interface FoodMapper {
	//��
	public void addFood(Food food);
	//��
	public void updateFoodByfId(Food food);
	public void updateFoodZRByfId(Food food);
	//ɾ
	public int delMoreThanOneFood(Food food);
	//��
	public List<Food> selOneFoodById(int fId);//��ѯĳ��ʳƷ��Ϣ
	public List<Food> selFoodByPage(Page page);
	public int selCountFood();//�Ǽǹ���ʳƷ��Ϣ����
	public List<Food> selAllFoodBycIdAndPage(Common common);//һ��ʳƷ��˾�������еǼǹ���ʳƷ��Ϣ��ҳ��
	public int selFoodCountBycId(int cId);//һ��ʳƷ��˾�������еǼǹ���ʳƷ����
	public List<Food> selAllFood();
	public List<Food> selFoodDuoTiaoJian(Food food);
	public List<FoodType> selFoodTypeName();
	
	public List<FoodType> selAllFoodType();
}
