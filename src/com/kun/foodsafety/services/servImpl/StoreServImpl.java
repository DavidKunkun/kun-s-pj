package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.StoreMapper;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Store;
import com.kun.foodsafety.services.StoreServ;

@Service
public class StoreServImpl implements StoreServ {
	
	@Autowired
	private StoreMapper storeMapper;

	@Override
	public void addStore(Store store) {
		// TODO Auto-generated method stub
		storeMapper.addStore(store);
	}

	@Override
	public void updateStoreBysId(Store store) {
		// TODO Auto-generated method stub
		storeMapper.updateStoreBysId(store);
	}

	@Override
	public int delMoreThanOneStore(Store store) {
		// TODO Auto-generated method stub
		return storeMapper.delMoreThanOneStore(store);
	}

	@Override
	public List<Store> selOneStoreBysId(int sId) {
		// TODO Auto-generated method stub
		return storeMapper.selOneStoreBysId(sId);
	}

	@Override
	public List<Store> selStoreByPage(Page page) {
		// TODO Auto-generated method stub
		return storeMapper.selStoreByPage(page);
	}

	@Override
	public int selCountStore() {
		// TODO Auto-generated method stub
		return storeMapper.selCountStore();
	}

	@Override
	public List<Store> selAllStore() {
		// TODO Auto-generated method stub
		return storeMapper.selAllStore();
	}

	@Override
	public void updateStoreXCNumberBysId(Store store) {
		// TODO Auto-generated method stub
		storeMapper.updateStoreXCNumberBysId(store);
	}

	@Override
	public List<Store> selStoreDuoTiaoJian(Store store) {
		// TODO Auto-generated method stub
		return storeMapper.selStoreDuoTiaoJian(store);
	}

}
