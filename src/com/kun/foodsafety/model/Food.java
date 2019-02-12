package com.kun.foodsafety.model;

import java.util.List;

/*fId               INT(10)      (NULL)           NO      PRI     (NULL)   AUTO_INCREMENT  SELECT,INSERT,UPDATE,REFERENCES  ʳƷid               
fName             VARCHAR(20)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷ����           
fTypeId           VARCHAR(20)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷ����           
fBirthtime        DATETIME     (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷ��������     
fEndtime          DATETIME     (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ����ʳ������     
fCompanyId        INT(10)      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ������˾���     
fZhuangTai        VARCHAR(10)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷ״̬           
fShengChanPiCiId  INT(10)      (NULL)           YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷ�������֤id
fImage            VARCHAR(50)  utf8_general_ci  YES             (NULL)                   SELECT,INSERT,UPDATE,REFERENCES  ʳƷ�����Ƭ     
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
