package com.kun.foodsafety.model;

public class Cities {
	private int id;
	private String city;
	private String cityid;
	private String provincecityid;
	
	public String getProvincecityid() {
		return provincecityid;
	}
	public void setProvincecityid(String provincecityid) {
		this.provincecityid = provincecityid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getcity() {
		return city;
	}
	public void setcity(String city) {
		this.city = city;
	}
	public String getcityid() {
		return cityid;
	}
	public void setcityid(String cityid) {
		this.cityid = cityid;
	}
}
