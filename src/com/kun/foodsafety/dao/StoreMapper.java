package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Store;

public interface StoreMapper {
	
	public void addStore(Store store);
	//��
	public void updateStoreBysId(Store store);
	public void updateStoreXCNumberBysId(Store store);
	//ɾ
	public int delMoreThanOneStore(Store store);
	
	public List<Store> selOneStoreBysId(int sId);
	public List<Store> selStoreByPage(Page page);
	public int selCountStore();
	public List<Store> selAllStore();
	public List<Store> selStoreDuoTiaoJian(Store store);
	
}
