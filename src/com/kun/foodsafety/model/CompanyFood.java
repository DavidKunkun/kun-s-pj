package com.kun.foodsafety.model;
/*cfId             INT(10)       (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES                                            
cId              INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��˾Id                                  
fId              INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷid                                  
cfStarttime      DATETIME      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ����ʱ��                              
cfEndtime        DATETIME      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ׼��ʱ��                              
cfResult         VARCHAR(30)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �����                              
cfXiangXiJianCe  INT(30)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��ϸ˵������Ӧ�ʼ���еı��
cfOperatorId     INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �����ʼ�Ա����                     
cfBeiZhu         VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��ע                                    
*/
public class CompanyFood {//������˾��ʳƷ��������ʳƷ���֤��Ҫ��
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
