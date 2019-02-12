package com.kun.foodsafety.model;
/*zjId                INT(10)       (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES  生产许可证编号      
cId                 INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  受检公司编号         
zjfGuiGe            VARCHAR(50)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  受检食品规格        
fId                 INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  受检食品编号         
zjfName             VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  受检食品名称         
zjGanGuanShi        VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  感官检测实际值      
zjGanGuanResult     VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  感官检测结果         
zjYIngYangShi       VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  营养成分检测实际值
zjYIngYangResult    VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  营养成分检测结果   
zjWeiLiangShi       VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  微量元素检测实际值
zjWeiLiangResult    VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  微量元素检测结果   
zjWeiShengWuShi     VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  微生物检测实际值   
zjWeiShengWuResult  VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  微生物检测结果      
zjTianJiaJiShi         VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  添加剂检测实际值   
zjTianJiaJiResult   VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  添加剂检测结果      
zjDuXingShi         VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  毒性检测实际值      
zjDuXingResult      VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  毒性检测结果         
zjInstitution       VARCHAR(30)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  检测机构               
zjResult            VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  质检综合结果         
zjBeiZhu            VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  质检备注               
zjEmployeerId       INT(20)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  质检负责员工工号   
zjRefuseReason      VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  不合格理由            
*/
public class ZhiJian {
	private int zjId;
	
    private int cId;
    private int fId;
    private int zjEmployeerId;
    
    
    private String zjfName;
    private String zjfGuiGe;
    private String zjGanGuanShi;
    private String zjGanGuanResult;
    private String zjYIngYangShi;
    private String zjYIngYangResult;
    private String zjWeiLiangShi;
    private String zjWeiLiangResult;
    
    private String zjWeiShengWuShi;
    private String zjWeiShengWuResult;
    private String zjTianJiaJiShi;
    private String zjTianJiaJiResult;
    private String zjDuXingShi;
    private String zjDuXingResult;
    private String zjTianJiaJi;
    private String zjDuXing;
    private String zjInstitution;
    private String zjResult;
    private String zjBeiZhu;
    private String zjRefuseReason;
    
    public String getZjWeiShengWuShi() {
		return zjWeiShengWuShi;
	}
	public void setZjWeiShengWuShi(String zjWeiShengWuShi) {
		this.zjWeiShengWuShi = zjWeiShengWuShi;
	}
	public String getZjWeiShengWuResult() {
		return zjWeiShengWuResult;
	}
	public void setZjWeiShengWuResult(String zjWeiShengWuResult) {
		this.zjWeiShengWuResult = zjWeiShengWuResult;
	}
	
	public int getZjId() {
		return zjId;
	}
	public void setZjId(int zjId) {
		this.zjId = zjId;
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
	public int getZjEmployeerId() {
		return zjEmployeerId;
	}
	public void setZjEmployeerId(int zjEmployeerId) {
		this.zjEmployeerId = zjEmployeerId;
	}
	public String getZjfName() {
		return zjfName;
	}
	public void setZjfName(String zjfName) {
		this.zjfName = zjfName;
	}
	public String getZjfGuiGe() {
		return zjfGuiGe;
	}
	public void setZjfGuiGe(String zjfGuiGe) {
		this.zjfGuiGe = zjfGuiGe;
	}
	public String getZjGanGuanShi() {
		return zjGanGuanShi;
	}
	public void setZjGanGuanShi(String zjGanGuanShi) {
		this.zjGanGuanShi = zjGanGuanShi;
	}
	public String getZjGanGuanResult() {
		return zjGanGuanResult;
	}
	public void setZjGanGuanResult(String zjGanGuanResult) {
		this.zjGanGuanResult = zjGanGuanResult;
	}
	public String getZjYIngYangShi() {
		return zjYIngYangShi;
	}
	public void setZjYIngYangShi(String zjYIngYangShi) {
		this.zjYIngYangShi = zjYIngYangShi;
	}
	public String getZjYIngYangResult() {
		return zjYIngYangResult;
	}
	public void setZjYIngYangResult(String zjYIngYangResult) {
		this.zjYIngYangResult = zjYIngYangResult;
	}
	public String getZjWeiLiangShi() {
		return zjWeiLiangShi;
	}
	public void setZjWeiLiangShi(String zjWeiLiangShi) {
		this.zjWeiLiangShi = zjWeiLiangShi;
	}
	public String getZjWeiLiangResult() {
		return zjWeiLiangResult;
	}
	public void setZjWeiLiangResult(String zjWeiLiangResult) {
		this.zjWeiLiangResult = zjWeiLiangResult;
	}
	public String getZjTianJiaJiShi() {
		return zjTianJiaJiShi;
	}
	public void setZjTianJiaJiShi(String zjTianJiaJiShi) {
		this.zjTianJiaJiShi = zjTianJiaJiShi;
	}
	public String getZjTianJiaJiResult() {
		return zjTianJiaJiResult;
	}
	public void setZjTianJiaJiResult(String zjTianJiaJiResult) {
		this.zjTianJiaJiResult = zjTianJiaJiResult;
	}
	public String getZjDuXingShi() {
		return zjDuXingShi;
	}
	public void setZjDuXingShi(String zjDuXingShi) {
		this.zjDuXingShi = zjDuXingShi;
	}
	public String getZjDuXingResult() {
		return zjDuXingResult;
	}
	public void setZjDuXingResult(String zjDuXingResult) {
		this.zjDuXingResult = zjDuXingResult;
	}
	public String getZjTianJiaJi() {
		return zjTianJiaJi;
	}
	public void setZjTianJiaJi(String zjTianJiaJi) {
		this.zjTianJiaJi = zjTianJiaJi;
	}
	public String getZjDuXing() {
		return zjDuXing;
	}
	public void setZjDuXing(String zjDuXing) {
		this.zjDuXing = zjDuXing;
	}
	public String getZjInstitution() {
		return zjInstitution;
	}
	public void setZjInstitution(String zjInstitution) {
		this.zjInstitution = zjInstitution;
	}
	public String getZjResult() {
		return zjResult;
	}
	public void setZjResult(String zjResult) {
		this.zjResult = zjResult;
	}
	public String getZjBeiZhu() {
		return zjBeiZhu;
	}
	public void setZjBeiZhu(String zjBeiZhu) {
		this.zjBeiZhu = zjBeiZhu;
	}
	public String getZjRefuseReason() {
		return zjRefuseReason;
	}
	public void setZjRefuseReason(String zjRefuseReason) {
		this.zjRefuseReason = zjRefuseReason;
	}
    
    
	
    
} 
