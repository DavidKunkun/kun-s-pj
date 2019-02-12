package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.CompanyFood;
import com.kun.foodsafety.model.Page;

public interface CompanyFoodMapper {
	
	
	public void addCompanyFood(CompanyFood companyFood);//…Í«Î◊º»Î
	
	public List<CompanyFood> selCompanyFoodByPage(Page page);
	public List<CompanyFood> selOneCompanyFoodByfId(int fId);
	public List<CompanyFood> selAllCompanyFood();
	public int selCountCompanyFood();
	
	public void updateCompanyFoodXJAndTime(CompanyFood companyFood);
	
}
