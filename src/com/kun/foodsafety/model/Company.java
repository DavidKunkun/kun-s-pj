package com.kun.foodsafety.model;

import java.util.List;

public class Company {
         /**
         * ��˾���
         */
        private int cId;//��˾���
         /**
         * ��˾���� 
         */
        private String cName;//��˾���� 
         /**
         * ��˾���˴���
         */
        private String cEntity;//��˾���˴���
         /**
         * ��˾�绰 
         */
        private String cPhone;//��˾�绰 
         /**
         * ��˾��Ӫ��ҵ
         */
        private String cIndustry;//��˾��Ӫ��ҵ
         /**
         * ��˾ע���ʽ�
         */
        private String cZhuCeMoney;//��˾ע���ʽ�
         /**
         * ��˾��Ӫ״̬
         */
        private String cZhuangtai;//��˾��Ӫ״̬
         /**
         * ��Ҫ��Ʒ
         */
        private String cMainChanPin;//��Ҫ��Ʒ
         /**
         * ��˾��ַ
         */
        private String cAddress;//��˾��ַ    
         /**
         * ��˾���� 
         */
        private int cPeople;//��˾���� 
         /**
         * ��˾����ʱ��
         */
        private String cChuangLiTime;//��˾����ʱ��
        private List<String> cId_list;
        
		public List<String> getcId_list() {
			return cId_list;
		}
		public void setcId_list(List<String> cId_list) {
			this.cId_list = cId_list;
		}
		public int getcId() {
			return cId;
		}
		public void setcId(int cId) {
			this.cId = cId;
		}
		public String getcName() {
			return cName;
		}
		public void setcName(String cName) {
			this.cName = cName;
		}
		public String getcEntity() {
			return cEntity;
		}
		public void setcEntity(String cEntity) {
			this.cEntity = cEntity;
		}
		public String getcPhone() {
			return cPhone;
		}
		public void setcPhone(String cPhone) {
			this.cPhone = cPhone;
		}
		public String getcIndustry() {
			return cIndustry;
		}
		public void setcIndustry(String cIndustry) {
			this.cIndustry = cIndustry;
		}
		public String getcZhuCeMoney() {
			return cZhuCeMoney;
		}
		public void setcZhuCeMoney(String cZhuCeMoney) {
			this.cZhuCeMoney = cZhuCeMoney;
		}
		public String getcZhuangtai() {
			return cZhuangtai;
		}
		public void setcZhuangtai(String cZhuangtai) {
			this.cZhuangtai = cZhuangtai;
		}
		public String getcMainChanPin() {
			return cMainChanPin;
		}
		public void setcMainChanPin(String cMainChanPin) {
			this.cMainChanPin = cMainChanPin;
		}
		public String getcAddress() {
			return cAddress;
		}
		public void setcAddress(String cAddress) {
			this.cAddress = cAddress;
		}
		public int getcPeople() {
			return cPeople;
		}
		public void setcPeople(int cPeople) {
			this.cPeople = cPeople;
		}
		public String getcChuangLiTime() {
			return cChuangLiTime;
		}
		public void setcChuangLiTime(String cChuangLiTime) {
			this.cChuangLiTime = cChuangLiTime;
		}
         
}
