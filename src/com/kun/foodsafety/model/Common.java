package com.kun.foodsafety.model;

import java.util.List;

public class Common {
     private Company company;
     private Food food;
     private Operator operator;
     private Page page;
     private Cities city;
     private Provinces province;
     private FoodType foodType;
     private Loginor loginor;
     
     private List<Company> companylist; 
     private List<Food> foodlist;
     private List<Operator> operatorlist;
     
     public List<Company> getCompanylist() {
		return companylist;
	}
	public void setCompanylist(List<Company> companylist) {
		this.companylist = companylist;
	}
	public List<Food> getFoodlist() {
		return foodlist;
	}
	public void setFoodlist(List<Food> foodlist) {
		this.foodlist = foodlist;
	}
	public List<Operator> getOperatorlist() {
		return operatorlist;
	}
	public void setOperatorlist(List<Operator> operatorlist) {
		this.operatorlist = operatorlist;
	}
	
     
	public Loginor getLoginor() {
		return loginor;
	}
	public void setLoginor(Loginor loginor) {
		this.loginor = loginor;
	}
	public FoodType getFoodType() {
		return foodType;
	}
	public void setFoodType(FoodType foodType) {
		this.foodType = foodType;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public Operator getOperator() {
		return operator;
	}
	public void setOperator(Operator operator) {
		this.operator = operator;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Cities getCity() {
		return city;
	}
	public void setCity(Cities city) {
		this.city = city;
	}
	public Provinces getProvince() {
		return province;
	}
	public void setProvince(Provinces province) {
		this.province = province;
	}
     
     
}
