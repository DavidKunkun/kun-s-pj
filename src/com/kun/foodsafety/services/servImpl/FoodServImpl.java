package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.FoodMapper;
import com.kun.foodsafety.model.Common;
import com.kun.foodsafety.model.Food;
import com.kun.foodsafety.model.FoodType;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.services.FoodServ;
@Service
public class FoodServImpl implements FoodServ {

	@Autowired
	private FoodMapper foodMapper;
	
	@Override
	public void addFood(Food food) {
		// TODO Auto-generated method stub
		foodMapper.addFood(food);
	}

	@Override
	public void updateFoodByfId(Food food) {
		// TODO Auto-generated method stub
		foodMapper.updateFoodByfId(food);
	}

	@Override
	public int delMoreThanOneFood(Food food) {
		// TODO Auto-generated method stub
		return foodMapper.delMoreThanOneFood(food);
	}

	@Override
	public List<Food> selOneFoodById(int cId) {
		// TODO Auto-generated method stub
		return foodMapper.selOneFoodById(cId);
	}

	@Override
	public List<Food> selFoodByPage(Page page) {
		// TODO Auto-generated method stub
		return foodMapper.selFoodByPage(page);
	}

	@Override
	public int selCountFood() {
		// TODO Auto-generated method stub
		return foodMapper.selCountFood();
	}

	@Override
	public List<FoodType> selAllFoodType() {
		// TODO Auto-generated method stub
		return foodMapper.selAllFoodType();
	}

	@Override
	public List<Food> selAllFoodBycIdAndPage(Common common) {
		// TODO Auto-generated method stub
		return foodMapper.selAllFoodBycIdAndPage(common);
	}

	@Override
	public int selFoodCountBycId(int cId) {
		// TODO Auto-generated method stub
		return foodMapper.selFoodCountBycId(cId);
	}

	@Override
	public void updateFoodZRByfId(Food food) {
		// TODO Auto-generated method stub
		foodMapper.updateFoodZRByfId(food);
	}

	@Override
	public List<Food> selAllFood() {
		// TODO Auto-generated method stub
		return foodMapper.selAllFood();
	}

	@Override
	public List<Food> selFoodDuoTiaoJian(Food food) {
		// TODO Auto-generated method stub
		return foodMapper.selFoodDuoTiaoJian(food);
	}

	@Override
	public List<FoodType> selFoodTypeName() {
		// TODO Auto-generated method stub
		return foodMapper.selFoodTypeName();
	}

}
