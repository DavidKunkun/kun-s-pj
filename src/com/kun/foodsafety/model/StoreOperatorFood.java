package com.kun.foodsafety.model;
/*xcId          INT(10)       (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES  巡查编号         
cfId          INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  生产许可证编号
sId           INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  商户编号         
xcTime        DATETIME      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  巡查时间         
xcResult      VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  巡查结果         
xcXiangXiId   INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  巡查详细信息   
xcOperatorId  INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  责任巡查员工号
xcBeiZhu      VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  备注               
*/
public class StoreOperatorFood {//巡查用
	private int xcId;
    private int cfId;
    private int sId;
    private int xcXiangXiId;
    private int xcOperatorId;
    private String xcTime;
    private String xcResult;
    private String xcBeiZhu;
    
    
    
	public int getXcId() {
		return xcId;
	}
	public void setXcId(int xcId) {
		this.xcId = xcId;
	}
	public int getCfId() {
		return cfId;
	}
	public void setCfId(int cfId) {
		this.cfId = cfId;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public int getXcXiangXiId() {
		return xcXiangXiId;
	}
	public void setXcXiangXiId(int xcXiangXiId) {
		this.xcXiangXiId = xcXiangXiId;
	}
	public int getXcOperatorId() {
		return xcOperatorId;
	}
	public void setXcOperatorId(int xcOperatorId) {
		this.xcOperatorId = xcOperatorId;
	}
	public String getXcTime() {
		return xcTime;
	}
	public void setXcTime(String xcTime) {
		this.xcTime = xcTime;
	}
	public String getXcResult() {
		return xcResult;
	}
	public void setXcResult(String xcResult) {
		this.xcResult = xcResult;
	}
	public String getXcBeiZhu() {
		return xcBeiZhu;
	}
	public void setXcBeiZhu(String xcBeiZhu) {
		this.xcBeiZhu = xcBeiZhu;
	}
    
   
}
