package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Cities;
import com.kun.foodsafety.model.Operator;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Provinces;



public interface OperatorMapper {
    //Ôö   
	public void addOperator(Operator operator);
	//¸Ä
	public void upOperatorByoId(Operator operator);
	//É¾
	public int delMoreThanOneOperator(Operator operator);
	//²é
	public List<Operator> selAllOperator();
	public List<Operator> selOneOperatorById(int oId);
	public List<Operator> selOperatorByPage(Page page);
	
	
	public List<Provinces> selAllProvince();
	public List<Cities> selCityByPcode(String pcode);
}
