package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.ZhiJianMapper;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.ZhiJian;
import com.kun.foodsafety.services.ZhiJianServ;

@Service
public class ZhiJianServImpl implements ZhiJianServ {
	
	@Autowired
	private ZhiJianMapper zhiJianMapper;

	@Override
	public void addZhiJian(ZhiJian zhijian) {
		// TODO Auto-generated method stub
		zhiJianMapper.addZhiJian(zhijian);
	}

	@Override
	public void updateZhiJianByzjId(ZhiJian zhijian) {
		// TODO Auto-generated method stub
		zhiJianMapper.updateZhiJianByzjId(zhijian);
	}

	@Override
	public int delMoreThanOneZhiJian(ZhiJian zhijian) {
		// TODO Auto-generated method stub
		return zhiJianMapper.delMoreThanOneZhiJian(zhijian);
	}

	@Override
	public List<ZhiJian> selOneZhiJianByfId(int fId) {
		// TODO Auto-generated method stub
		return zhiJianMapper.selOneZhiJianByfId(fId);
	}

	@Override
	public List<ZhiJian> selZhiJianByPage(Page page) {
		// TODO Auto-generated method stub
		return zhiJianMapper.selZhiJianByPage(page);
	}

	@Override
	public int selCountZhiJian() {
		// TODO Auto-generated method stub
		return zhiJianMapper.selCountZhiJian();
	}

	@Override
	public List<ZhiJian> selAllZhiJian() {
		// TODO Auto-generated method stub
		return zhiJianMapper.selAllZhiJian();
	}

}
