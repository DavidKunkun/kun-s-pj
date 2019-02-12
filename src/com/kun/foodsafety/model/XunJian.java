package com.kun.foodsafety.model;
/*xjId           INT(20)       (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES                          
sId            INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��Ѳ����̻����
xjJingYing     VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��Ӫ�Ϸ���         
xjWeiSheng     VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �����Ϸ���         
fId            INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��Ѳ���ʳƷ���
xjBaoZhuang    VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷ��װ���÷�   
xjOverTime     VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ���ڷ�               
xjFalse        VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �ٻ���               
xjResult       VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �ʼ���            
xjInstitution  VARCHAR(30)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ������            
xjBeiZhu       VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �ʼ챸ע            

xjsName           VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �ܼ��̻�����      
xjfShengChanPiCi  INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �ܼ�ʳƷ��������
xcStartTime       DATE          (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  Ѳ�鿪ʼʱ��      
xjEndTime         DATE          (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  Ѳ�����ʱ��      
xjOperatorId
*/
public class XunJian {
	private int xjId;
    private int sId;
    private int fId;
    
    private String xjJingYing;
    private String xjWeiSheng;
    private String xjBaoZhuang;
    private String xjOverTime;
    private String xjFalse;
    private String xjResult;
    private String xjInstitution;
    private String xjBeiZhu;
    
    private String xjsName;
    private int xjfShengChanPiCi;
    private String xcStartTime;
    private String xjEndTime;
    private int xjOperatorId;
    private String xjBuHeGeReason;
    
    public String getXjBuHeGeReason() {
		return xjBuHeGeReason;
	}
	public void setXjBuHeGeReason(String xjBuHeGeReason) {
		this.xjBuHeGeReason = xjBuHeGeReason;
	}
	public int getXjOperatorId() {
		return xjOperatorId;
	}
	public void setXjOperatorId(int xjOperatorId) {
		this.xjOperatorId = xjOperatorId;
	}
	public String getXjsName() {
		return xjsName;
	}
	public void setXjsName(String xjsName) {
		this.xjsName = xjsName;
	}
	public int getXjfShengChanPiCi() {
		return xjfShengChanPiCi;
	}
	public void setXjfShengChanPiCi(int xjfShengChanPiCi) {
		this.xjfShengChanPiCi = xjfShengChanPiCi;
	}
	public String getXcStartTime() {
		return xcStartTime;
	}
	public void setXcStartTime(String xcStartTime) {
		this.xcStartTime = xcStartTime;
	}
	public String getXjEndTime() {
		return xjEndTime;
	}
	public void setXjEndTime(String xjEndTime) {
		this.xjEndTime = xjEndTime;
	}
	
	public int getXjId() {
		return xjId;
	}
	public void setXjId(int xjId) {
		this.xjId = xjId;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public String getXjJingYing() {
		return xjJingYing;
	}
	public void setXjJingYing(String xjJingYing) {
		this.xjJingYing = xjJingYing;
	}
	public String getXjWeiSheng() {
		return xjWeiSheng;
	}
	public void setXjWeiSheng(String xjWeiSheng) {
		this.xjWeiSheng = xjWeiSheng;
	}
	public String getXjBaoZhuang() {
		return xjBaoZhuang;
	}
	public void setXjBaoZhuang(String xjBaoZhuang) {
		this.xjBaoZhuang = xjBaoZhuang;
	}
	public String getXjOverTime() {
		return xjOverTime;
	}
	public void setXjOverTime(String xjOverTime) {
		this.xjOverTime = xjOverTime;
	}
	public String getXjFalse() {
		return xjFalse;
	}
	public void setXjFalse(String xjFalse) {
		this.xjFalse = xjFalse;
	}
	public String getXjResult() {
		return xjResult;
	}
	public void setXjResult(String xjResult) {
		this.xjResult = xjResult;
	}
	public String getXjInstitution() {
		return xjInstitution;
	}
	public void setXjInstitution(String xjInstitution) {
		this.xjInstitution = xjInstitution;
	}
	public String getXjBeiZhu() {
		return xjBeiZhu;
	}
	public void setXjBeiZhu(String xjBeiZhu) {
		this.xjBeiZhu = xjBeiZhu;
	}
    
    
    
}
