package com.kun.foodsafety.model;

import java.util.List;

public class Company {
         /**
         * 公司编号
         */
        private int cId;//公司编号
         /**
         * 公司名称 
         */
        private String cName;//公司名称 
         /**
         * 公司法人代表
         */
        private String cEntity;//公司法人代表
         /**
         * 公司电话 
         */
        private String cPhone;//公司电话 
         /**
         * 公司经营行业
         */
        private String cIndustry;//公司经营行业
         /**
         * 公司注册资金
         */
        private String cZhuCeMoney;//公司注册资金
         /**
         * 公司经营状态
         */
        private String cZhuangtai;//公司经营状态
         /**
         * 主要产品
         */
        private String cMainChanPin;//主要产品
         /**
         * 公司地址
         */
        private String cAddress;//公司地址    
         /**
         * 公司人数 
         */
        private int cPeople;//公司人数 
         /**
         * 公司创立时间
         */
        private String cChuangLiTime;//公司创立时间
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
