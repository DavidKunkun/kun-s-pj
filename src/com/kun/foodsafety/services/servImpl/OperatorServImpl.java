package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.OperatorMapper;
import com.kun.foodsafety.model.Cities;
import com.kun.foodsafety.model.Operator;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Provinces;
import com.kun.foodsafety.services.OperatorServ;

@Service
public class OperatorServImpl implements OperatorServ {

	@Autowired
    private OperatorMapper OperatorMapper;
	
	@Override
	public void addOperator(Operator operator) {
		// TODO Auto-generated method stub
		System.out.println("到了service层的实现类");
		OperatorMapper.addOperator(operator);
		
	}

	@Override
	public List<Operator> selAllOperator() {
		// TODO Auto-generated method stub
		return OperatorMapper.selAllOperator();
	}

	@Override
	public List<Operator> selOneOperatorById(int oId) {
		// TODO Auto-generated method stub
		return OperatorMapper.selOneOperatorById(oId);
	}

	@Override
	public List<Provinces> selAllProvince() {
		// TODO Auto-generated method stub
		
		return OperatorMapper.selAllProvince();
	}

	@Override
	public List<Cities> selCityByPcode(String pcode) {
		// TODO Auto-generated method stub
		return OperatorMapper.selCityByPcode(pcode);
	}

	@Override
	public List<Operator> selOperatorByPage(Page page) {
		// TODO Auto-generated method stub
		return OperatorMapper.selOperatorByPage(page);
	}

	@Override
	public int delMoreThanOneOperator(Operator operator) {
		// TODO Auto-generated method stub
		return OperatorMapper.delMoreThanOneOperator(operator);
	}

	@Override
	public void upOperatorByoId(Operator operator) {
		// TODO Auto-generated method stub
		OperatorMapper.upOperatorByoId(operator);
	}

}
