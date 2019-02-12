package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.XunJianMapper;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.XunJian;
import com.kun.foodsafety.services.XunJianServ;

@Service
public class XunJianServImpl implements XunJianServ {
	
	@Autowired
	private XunJianMapper xunJianMapper;

	@Override
	public void addXunJian(XunJian xunJian) {
		// TODO Auto-generated method stub
		xunJianMapper.addXunJian(xunJian);
	}

	@Override
	public void delMoreThanOneXunJian(XunJian xunJian) {
		// TODO Auto-generated method stub
		xunJianMapper.delMoreThanOneXunJian(xunJian);
	}

	@Override
	public List<XunJian> selAllXunJian() {
		// TODO Auto-generated method stub
		return xunJianMapper.selAllXunJian();
	}

	@Override
	public List<XunJian> selXunJianByPage(Page page) {
		// TODO Auto-generated method stub
		return xunJianMapper.selXunJianByPage(page);
	}

	@Override
	public int selCountXunJian() {
		// TODO Auto-generated method stub
		return xunJianMapper.selCountXunJian();
	}

	@Override
	public List<XunJian> selOneXunJianByxjId(int xjId) {
		// TODO Auto-generated method stub
		return xunJianMapper.selOneXunJianByxjId(xjId);
	}

	@Override
	public void updateXunJianByxjId(XunJian xunJian) {
		// TODO Auto-generated method stub
		xunJianMapper.updateXunJianByxjId(xunJian);
	}

}
