package com.kun.foodsafety.model;

public class ZhaoHui {
	/*zhId          INT(20)       (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES                          
zhfId         INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  被召回的食品编号
zhsId         INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品所在商户编号
zhReason      VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  被召回理由         
zhTime        DATETIME      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  被召回的时间      
zhOperatorId  INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  执行工作人员      
zhfName       VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  召回食品名称      
zhfcId        INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  生产公司编号      
zhfcName      VARCHAR(30)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  生产公司名称      
zhsName       VARCHAR(30)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  商户名称            
*/
	
	private int zhId;
	private int zhfId;
	private int zhsId;
	private int zhOperatorId;
	private String zhReason;
	private String zhTime;
	private int zhfcId;
	private String zhfName;
	private String zhsName;
	private String zhfcName;
	
	
	public int getZhfcId() {
		return zhfcId;
	}
	public void setZhfcId(int zhfcId) {
		this.zhfcId = zhfcId;
	}
	public String getZhfName() {
		return zhfName;
	}
	public void setZhfName(String zhfName) {
		this.zhfName = zhfName;
	}
	public String getZhsName() {
		return zhsName;
	}
	public void setZhsName(String zhsName) {
		this.zhsName = zhsName;
	}
	public String getZhfcName() {
		return zhfcName;
	}
	public void setZhfcName(String zhfcName) {
		this.zhfcName = zhfcName;
	}
	public int getZhId() {
		return zhId;
	}
	public void setZhId(int zhId) {
		this.zhId = zhId;
	}
	public int getZhfId() {
		return zhfId;
	}
	public void setZhfId(int zhfId) {
		this.zhfId = zhfId;
	}
	public int getZhsId() {
		return zhsId;
	}
	public void setZhsId(int zhsId) {
		this.zhsId = zhsId;
	}
	public int getZhOperatorId() {
		return zhOperatorId;
	}
	public void setZhOperatorId(int zhOperatorId) {
		this.zhOperatorId = zhOperatorId;
	}
	public String getZhReason() {
		return zhReason;
	}
	public void setZhReason(String zhReason) {
		this.zhReason = zhReason;
	}
	public String getZhTime() {
		return zhTime;
	}
	public void setZhTime(String zhTime) {
		this.zhTime = zhTime;
	}
	
	
	

}
