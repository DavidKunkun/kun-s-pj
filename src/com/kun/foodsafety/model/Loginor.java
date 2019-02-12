package com.kun.foodsafety.model;

public class Loginor {
    private int uId;
    private int uEmployeeId;
	private String  uTime;
	private String uOuttime;
	
	public String getuOuttime() {
		return uOuttime;
	}
	public void setuOuttime(String uOuttime) {
		this.uOuttime = uOuttime;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getuEmployeeId() {
		return uEmployeeId;
	}
	public void setuEmployeeId(int uEmployeeId) {
		this.uEmployeeId = uEmployeeId;
	}
	public String getuTime() {
		return uTime;
	}
	public void setuTime(String uTime) {
		this.uTime = uTime;
	}
	
	
}
