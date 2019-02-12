package com.kun.foodsafety.model;

import java.util.List;

public class Operator {
   
	private int oId;
	private String oName;
	private int oAge;
	private String oAddress;
	private String oPhone;
	private String oSex;
	private int oRight;
	private String oPassword;
	private String oBuMen;
	
	private List<String> oId_list;
	
	
	public String getoBuMen() {
		return oBuMen;
	}
	public void setoBuMen(String oBuMen) {
		this.oBuMen = oBuMen;
	}
	
	public List<String> getoId_list() {
		return oId_list;
	}
	public void setoId_list(List<String> oId_list) {
		this.oId_list = oId_list;
	}
	public String getoPassword() {
		return oPassword;
	}
	public void setoPassword(String oPassword) {
		this.oPassword = oPassword;
	}
	public int getoId() {
		return oId;
	}
	public void setoId(int oId) {
		this.oId = oId;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public int getoAge() {
		return oAge;
	}
	public void setoAge(int oAge) {
		this.oAge = oAge;
	}
	public String getoAddress() {
		return oAddress;
	}
	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}
	public String getoPhone() {
		return oPhone;
	}
	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	public String getoSex() {
		return oSex;
	}
	public void setoSex(String oSex) {
		this.oSex = oSex;
	}
	public int getoRight() {
		return oRight;
	}
	public void setoRight(int oRight) {
		this.oRight = oRight;
	}
	
	
	
	
}
