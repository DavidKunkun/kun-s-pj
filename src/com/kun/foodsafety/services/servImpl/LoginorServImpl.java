package com.kun.foodsafety.services.servImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.LoginorMapper;
import com.kun.foodsafety.model.Loginor;
import com.kun.foodsafety.services.LoginorServ;

@Service
public class LoginorServImpl implements LoginorServ {

	@Autowired
	private LoginorMapper loginorMapper;
	
	@Override
	public void addLoginor(Loginor loginor) {
		// TODO Auto-generated method stub
		loginorMapper.addLoginor(loginor);
	}

	@Override
	public String selLastLoginTimeById(Loginor loginor) {
		// TODO Auto-generated method stub
		return loginorMapper.selLastLoginTimeById(loginor);
	}
	
	

}
