package com.kun.foodsafety.dao;

import java.util.List;

import com.kun.foodsafety.model.Company;
import com.kun.foodsafety.model.Page;


public interface CompanyMapper {
	public void addCompany(Company company);
	//¸Ä
	public void updateCompanyBycId(Company company);
	//É¾
	public int delMoreThanOneCompany(Company company);
	
	public List<Company> selOneCompanyById(int cId);
	public List<Company> selCompanyByPage(Page page);
	public int selCountCompany();
	public List<Company> selAllCompany();
	public List<Company> selCompanyDuoTiaoJian(Company company);
}
