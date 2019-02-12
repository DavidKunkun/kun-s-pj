package com.kun.foodsafety.model;

public class FoodType {
/*	ftId      VARCHAR(10)  utf8_general_ci  NO      PRI     (NULL)           SELECT,INSERT,UPDATE,REFERENCES  类别编号
	ftName    VARCHAR(20)  utf8_general_ci  YES             (NULL)           SELECT,INSERT,UPDATE,REFERENCES  类别名称
	ftMingXi  VARCHAR(30)  utf8_general_ci  YES             (NULL)           SELECT,INSERT,UPDATE,REFERENCES  品种明细
	ftBeiZhu  TEXT         utf8_general_ci  YES             (NULL)           SELECT,INSERT,UPDATE,REFERENCES  备注      
*/
	private String ftId;
	private String ftName;
	private String ftMingXi;
	private String ftBeiZhu;
	
	
	public String getFtId() {
		return ftId;
	}
	public void setFtId(String ftId) {
		this.ftId = ftId;
	}
	public String getFtName() {
		return ftName;
	}
	public void setFtName(String ftName) {
		this.ftName = ftName;
	}
	public String getFtMingXi() {
		return ftMingXi;
	}
	public void setFtMingXi(String ftMingXi) {
		this.ftMingXi = ftMingXi;
	}
	public String getFtBeiZhu() {
		return ftBeiZhu;
	}
	public void setFtBeiZhu(String ftBeiZhu) {
		this.ftBeiZhu = ftBeiZhu;
	}
	
	
	
	
	
}
