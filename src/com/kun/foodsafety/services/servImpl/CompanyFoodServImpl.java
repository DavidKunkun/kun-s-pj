package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.CompanyFoodMapper;
import com.kun.foodsafety.model.CompanyFood;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.services.CompanyFoodServ;
@Service
public class CompanyFoodServImpl implements CompanyFoodServ {
	
    @Autowired
	private CompanyFoodMapper companyFoodMapper;
	
	@Override
	public void addCompanyFood(CompanyFood companyFood) {
		// TODO Auto-generated method stub
		companyFoodMapper.addCompanyFood(companyFood);
	}

	@Override
	public List<CompanyFood> selCompanyFoodByPage(Page page) {
		// TODO Auto-generated method stub
		return companyFoodMapper.selCompanyFoodByPage(page);
	}

	@Override
	public List<CompanyFood> selOneCompanyFoodByfId(int fId) {
		// TODO Auto-generated method stub
		return companyFoodMapper.selOneCompanyFoodByfId(fId);
	}

	@Override
	public List<CompanyFood> selAllCompanyFood() {
		// TODO Auto-generated method stub
		return companyFoodMapper.selAllCompanyFood();
	}

	@Override
	public int selCountCompanyFood() {
		// TODO Auto-generated method stub
		return companyFoodMapper.selCountCompanyFood();
	}

	@Override
	public void updateCompanyFoodXJAndTime(CompanyFood companyFood) {
		// TODO Auto-generated method stub
		companyFoodMapper.updateCompanyFoodXJAndTime(companyFood);
	}

}
