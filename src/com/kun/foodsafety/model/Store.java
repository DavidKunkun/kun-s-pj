package com.kun.foodsafety.model;

import java.util.List;

/*sId               INT(10)       (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES  ���                              
sName             VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �̻�����                        
sEntity           VARCHAR(10)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �̻����˴���                  
sPhone            VARCHAR(12)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  �̻���ϵ��ʽ                  
sAddress          VARCHAR(20)   utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��ַ                              
sJingYingNeiRong  VARCHAR(100)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��Ӫ���֤���ɶ�����ӣ�
sXunChaNumber     INT(10)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ��Ѳ�����                     
sNotHeGe          INT(10)       (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  Ѳ�鲻�ϸ����               
*/
public class Store {
     private int sId;
     private String sName;
     private String sEntity;
     private String sPhone;
     private String sAddress;
     private String sJingYingNeiRong;
     private int sXunChaNumber;
     private int sNotHeGe;
     private String sZhuangTai;
     

 	private List<String> sId_list;

     
     public String getsZhuangTai() {
		return sZhuangTai;
	}

	public void setsZhuangTai(String sZhuangTai) {
		this.sZhuangTai = sZhuangTai;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsEntity() {
		return sEntity;
	}

	public void setsEntity(String sEntity) {
		this.sEntity = sEntity;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public String getsJingYingNeiRong() {
		return sJingYingNeiRong;
	}

	public void setsJingYingNeiRong(String sJingYingNeiRong) {
		this.sJingYingNeiRong = sJingYingNeiRong;
	}

	public int getsXunChaNumber() {
		return sXunChaNumber;
	}

	public void setsXunChaNumber(int sXunChaNumber) {
		this.sXunChaNumber = sXunChaNumber;
	}

	public int getsNotHeGe() {
		return sNotHeGe;
	}

	public void setsNotHeGe(int sNotHeGe) {
		this.sNotHeGe = sNotHeGe;
	}

	public List<String> getsId_list() {
		return sId_list;
	}

	public void setsId_list(List<String> sId_list) {
		this.sId_list = sId_list;
	}
     
     
}
