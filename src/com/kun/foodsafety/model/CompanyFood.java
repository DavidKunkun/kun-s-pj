package com.kun.foodsafety.model;
/*cfId             INT(10)       (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES                                            
cId              INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  公司Id                                  
fId              INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品id                                  
cfStarttime      DATETIME      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  申请时间                              
cfEndtime        DATETIME      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  准入时间                              
cfResult         VARCHAR(30)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  检测结果                              
cfXiangXiJianCe  INT(30)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  详细说明，对应质检表中的编号
cfOperatorId     INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  责任质检员工号                     
cfBeiZhu         VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  备注                                    
*/
public class CompanyFood {//生产公司和食品，即申请食品许可证需要的
    private int cfId;
    private int cId;
    private int fId;
    private int cfXiangXiJianCe;
    private int cfOperatorId;
    private String cfStarttime;
    private String cfEndtime;
    private String cfResult;
    private String cfBeiZhu;
    
    
    
    
	public int getCfId() {
		return cfId;
	}
	public void setCfId(int cfId) {
		this.cfId = cfId;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public int getCfXiangXiJianCe() {
		return cfXiangXiJianCe;
	}
	public void setCfXiangXiJianCe(int cfXiangXiJianCe) {
		this.cfXiangXiJianCe = cfXiangXiJianCe;
	}
	public int getCfOperatorId() {
		return cfOperatorId;
	}
	public void setCfOperatorId(int cfOperatorId) {
		this.cfOperatorId = cfOperatorId;
	}
	public String getCfStarttime() {
		return cfStarttime;
	}
	public void setCfStarttime(String cfStarttime) {
		this.cfStarttime = cfStarttime;
	}
	public String getCfEndtime() {
		return cfEndtime;
	}
	public void setCfEndtime(String cfEndtime) {
		this.cfEndtime = cfEndtime;
	}
	public String getCfResult() {
		return cfResult;
	}
	public void setCfResult(String cfResult) {
		this.cfResult = cfResult;
	}
	public String getCfBeiZhu() {
		return cfBeiZhu;
	}
	public void setCfBeiZhu(String cfBeiZhu) {
		this.cfBeiZhu = cfBeiZhu;
	}
    
    
    
    
}
