package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.ZhaoHuiMapper;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.ZhaoHui;
import com.kun.foodsafety.services.ZhaoHuiServ;
@Service
public class ZhaoHuiServImpl implements ZhaoHuiServ {

	@Autowired
	private ZhaoHuiMapper zhaoHuiMapper;
	
	@Override
	public void addZhaoHui(ZhaoHui zhaoHui) {
		// TODO Auto-generated method stub
		zhaoHuiMapper.addZhaoHui(zhaoHui);
	}

	@Override
	public List<ZhaoHui> selZhaoHuiFoodByPage(Page page) {
		// TODO Auto-generated method stub
		return zhaoHuiMapper.selZhaoHuiFoodByPage(page);
	}

	@Override
	public int selCountZhaoHui() {
		// TODO Auto-generated method stub
		return zhaoHuiMapper.selCountZhaoHui();
	}

}
