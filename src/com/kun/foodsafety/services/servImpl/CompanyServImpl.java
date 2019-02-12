package com.kun.foodsafety.services.servImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kun.foodsafety.dao.CompanyMapper;
import com.kun.foodsafety.model.Company;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.services.CompanyServ;

@Service
public class CompanyServImpl implements CompanyServ {
	
	@Autowired
	private CompanyMapper companyMapper;

	@Override
	public void addCompany(Company company) {
		// TODO Auto-generated method stub
		companyMapper.addCompany(company);
	}

	@Override
	public List<Company> selCompanyByPage(Page page) {
		// TODO Auto-generated method stub
		return companyMapper.selCompanyByPage(page);
	}

	@Override
	public int selCountCompany() {
		// TODO Auto-generated method stub
		return companyMapper.selCountCompany();
	}

	@Override
	public void updateCompanyBycId(Company company) {
		// TODO Auto-generated method stub
		companyMapper.updateCompanyBycId(company);
	}

	@Override
	public int delMoreThanOneCompany(Company company) {
		// TODO Auto-generated method stub
		return companyMapper.delMoreThanOneCompany(company);
	}

	@Override
	public List<Company> selOneCompanyById(int cId) {
		// TODO Auto-generated method stub
		return companyMapper.selOneCompanyById(cId);
	}

	@Override
	public List<Company> selAllCompany() {
		// TODO Auto-generated method stub
		return companyMapper.selAllCompany();
	}

	@Override
	public List<Company> selCompanyDuoTiaoJian(Company company) {
		// TODO Auto-generated method stub
		return companyMapper.selCompanyDuoTiaoJian(company);
	}

}
