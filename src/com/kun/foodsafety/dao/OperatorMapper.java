package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Cities;
import com.kun.foodsafety.model.Operator;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Provinces;



public interface OperatorMapper {
    //��   
	public void addOperator(Operator operator);
	//��
	public void upOperatorByoId(Operator operator);
	//ɾ
	public int delMoreThanOneOperator(Operator operator);
	//��
	public List<Operator> selAllOperator();
	public List<Operator> selOneOperatorById(int oId);
	public List<Operator> selOperatorByPage(Page page);
	
	
	public List<Provinces> selAllProvince();
	public List<Cities> selCityByPcode(String pcode);
}
