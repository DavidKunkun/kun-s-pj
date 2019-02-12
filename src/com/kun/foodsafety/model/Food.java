package com.kun.foodsafety.model;

import java.util.List;

/*fId               INT(10)      (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES  食品id               
fName             VARCHAR(20)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品名称           
fTypeId           VARCHAR(20)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品类型           
fBirthtime        DATETIME     (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品生产日期     
fEndtime          DATETIME     (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  限制食用日期     
fCompanyId        INT(10)      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  生产公司编号     
fZhuangTai        VARCHAR(10)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品状态           
fShengChanPiCiId  INT(10)      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品生产许可证id
fImage            VARCHAR(50)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  食品相关照片     
*/
public class Food {
        private int fId;
        private String fName;
        private String fTypeId;
        private String fBirthtime;
        private String fEndtime;
        private int fCompanyId;
        private String fZhuangTai;
        private int fShengChanPiCiId;
        private String fImage;
        private int fInfoEmployeeId;
        private String fZhunRu;
        
        private List<String> fId_list;
        
        
        public String getfZhunRu() {
			return fZhunRu;
		}
		public void setfZhunRu(String fZhunRu) {
			this.fZhunRu = fZhunRu;
		}
		public int getfInfoEmployeeId() {
			return fInfoEmployeeId;
		}
		public void setfInfoEmployeeId(int fInfoEmployeeId) {
			this.fInfoEmployeeId = fInfoEmployeeId;
		}
		
		public List<String> getfId_list() {
			return fId_list;
		}
		public void setfId_list(List<String> fId_list) {
			this.fId_list = fId_list;
		}
		public int getfId() {
			return fId;
		}
		public void setfId(int fId) {
			this.fId = fId;
		}
		public String getfName() {
			return fName;
		}
		public void setfName(String fName) {
			this.fName = fName;
		}
		public String getfTypeId() {
			return fTypeId;
		}
		public void setfTypeId(String fTypeId) {
			this.fTypeId = fTypeId;
		}
		public String getfBirthtime() {
			return fBirthtime;
		}
		public void setfBirthtime(String fBirthtime) {
			this.fBirthtime = fBirthtime;
		}
		public String getfEndtime() {
			return fEndtime;
		}
		public void setfEndtime(String fEndtime) {
			this.fEndtime = fEndtime;
		}
		public int getfCompanyId() {
			return fCompanyId;
		}
		public void setfCompanyId(int fCompanyId) {
			this.fCompanyId = fCompanyId;
		}
		public String getfZhuangTai() {
			return fZhuangTai;
		}
		public void setfZhuangTai(String fZhuangTai) {
			this.fZhuangTai = fZhuangTai;
		}
		public int getfShengChanPiCiId() {
			return fShengChanPiCiId;
		}
		public void setfShengChanPiCiId(int fShengChanPiCiId) {
			this.fShengChanPiCiId = fShengChanPiCiId;
		}
		public String getfImage() {
			return fImage;
		}
		public void setfImage(String fImage) {
			this.fImage = fImage;
		}
        
        
}
