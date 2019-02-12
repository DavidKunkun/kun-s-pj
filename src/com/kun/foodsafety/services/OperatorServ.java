package com.kun.foodsafety.services;

import java.util.List;

import com.kun.foodsafety.model.Cities;
import com.kun.foodsafety.model.Operator;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Provinces;

public interface OperatorServ {
	
     public void addOperator(Operator operator);
     
     //¸Ä
 	 public void upOperatorByoId(Operator operator);
 	 //É¾
 	 public int delMoreThanOneOperator(Operator operator);
     
     public List<Operator> selAllOperator(); 
     public List<Operator> selOneOperatorById(int oId);
     public List<Operator> selOperatorByPage(Page page);
     
     
     
     public List<Provinces> selAllProvince();
 	public List<Cities> selCityByPcode(String pcode);
}
